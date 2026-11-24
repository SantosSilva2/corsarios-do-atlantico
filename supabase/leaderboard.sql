-- Run this in the Supabase SQL Editor to enable the shared kill leaderboard.
create table if not exists public.pirate_leaderboard (
  captain_id uuid primary key,
  nickname text not null check (char_length(nickname) between 1 and 22),
  kills integer not null default 0 check (kills >= 0),
  updated_at timestamptz not null default now(),
  last_kill_at timestamptz not null default now()
);

alter table public.pirate_leaderboard enable row level security;
drop policy if exists "Anyone can view pirate scores" on public.pirate_leaderboard;
create policy "Anyone can view pirate scores"
  on public.pirate_leaderboard for select to anon, authenticated using (true);
grant select on public.pirate_leaderboard to anon, authenticated;
revoke insert, update, delete on public.pirate_leaderboard from anon, authenticated;

create or replace function public.register_pirate_kill(p_captain_id uuid, p_nickname text)
returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  if p_captain_id is null or char_length(trim(p_nickname)) not between 1 and 22 then
    raise exception 'Invalid captain or nickname';
  end if;
  insert into public.pirate_leaderboard(captain_id, nickname, kills, updated_at, last_kill_at)
    values (p_captain_id, trim(p_nickname), 1, now(), now())
  on conflict (captain_id) do update
    set nickname = excluded.nickname,
        kills = pirate_leaderboard.kills + 1,
        updated_at = now(),
        last_kill_at = now()
;
end;
$$;
revoke all on function public.register_pirate_kill(uuid, text) from public;
grant execute on function public.register_pirate_kill(uuid, text) to anon, authenticated;
