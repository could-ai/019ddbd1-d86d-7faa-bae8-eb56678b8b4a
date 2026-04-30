# Y2K CamGen

Y2K CamGen is a stylistic AI Image Generator mock application built in Flutter. It demonstrates a creative retro-futuristic interface mimicking the early 2000s desktop OS aesthetic, specifically tailored for processing and generating "Y2K digital camera" style portraits based on detailed text prompts.

## Features
- **Retro Interface**: Win98/Classic Mac OS inspired window borders, title bars, and desktop icons.
- **Pre-filled Prompt Box**: Designed around a detailed Thai prompt requesting a realistic, early 2000s, slightly grainy, flash-diffused portrait.
- **Generation Simulation**: Click `GENERATE.EXE` to watch a retro progress bar simulate the processing of the image prompt.
- **Y2K Photo Filter**: Displays a generated placeholder image (from Unsplash) applying a custom `ColorFiltered` matrix to achieve a warm, vintage digicam glow, overlaid with recording indicators and subtle static noise.

## Tech Stack
- **Framework**: Flutter / Dart
- **Design Pattern**: Single Page UI with custom `BoxDecoration` painting and generic Material widgets tweaked for a retro vibe.

## Setup & Run
1. Ensure you have Flutter installed.
2. Run `flutter pub get` to install dependencies (if any).
3. Start the application with `flutter run` on any desktop, web, or mobile emulator.

## About CouldAI
This app was generated with [CouldAI](https://could.ai), the AI app builder for cross-platform apps. CouldAI turns prompts into real native iOS, Android, Web, and Desktop apps with autonomous AI agents that architect, build, test, deploy, and iterate production-ready applications.