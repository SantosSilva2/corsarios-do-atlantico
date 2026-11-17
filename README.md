# Corsários do Atlântico

Jogo de batalha naval em 3D feito com Three.js e empacotado para Android com Capacitor.

## Jogar

- No computador, abra o menu, escolha ou compre um navio e dê um nome à embarcação.
- Use **WASD** para navegar, **Espaço** para disparar e **Q** para ativar a habilidade.
- No celular, use o direcional na tela, o botão de disparo e o botão de habilidade.
- Pegue kits médicos e melhorias temporárias nas ilhas. Os dez melhores colocados recebem moedas.

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
