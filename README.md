# PIRATAS DO OCEANO 3D

Jogo de batalha naval em 3D feito com Three.js e empacotado para Android com Capacitor.

## Jogar

- No computador, abra o menu, escolha ou compre um navio e dê um nome à embarcação.
- Use **WASD** para navegar, **Espaço** para canhão, segure **F** para uma rajada e **Q** para a habilidade. Use **E** perto de um baú.
- No celular, arraste o joystick à direita e use os botões de combate à esquerda.
- Pegue kits médicos e melhorias temporárias nas ilhas. Os dez melhores colocados recebem moedas. As partidas têm até 15 participantes, com bots quando não há jogadores online.

## APK Android

O GitHub Actions compila o APK a cada versão marcada com `v*`. Baixe `app-debug.apk` em **Releases**.

## Executar localmente

```sh
npm install
npm run dev
```

## Gerar Android localmente

```sh
npm install
npm run build
npx cap add android
npx cap sync android
cd android && ./gradlew assembleDebug
```
