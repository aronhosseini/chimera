# CHIMERA Windows installer (wrapper repo)

GitHub Actions builds the MIT-licensed https://github.com/jamesondh/chimera-vocal-synth
on Windows (using its own `crates/chimera-plugin/windows/build.sh`) and packs the VST3
(plus CLAP if built) into `CHIMERA-Setup.exe` with Inno Setup.

## Use
1. Create a new GitHub repo and push this folder (`.github/`, `installer/`, `README.md`).
2. Actions > "Windows installer" > Run workflow. Download the `CHIMERA-Windows-Installer` artifact.
3. For a public release: `git tag win-v0.1.0 && git push origin win-v0.1.0`.

Installs to `C:\Program Files\Common Files\VST3` (and `\CLAP`). Uninstall via Windows Settings > Apps.

## Notes
- Upstream's LICENSE (MIT) is bundled and shown in the installer. Keep it.
- The editor needs WebView2 (already on Windows 10/11).
- Upstream says its Windows build isn't released yet, so the first run may need a small fix.
- The installer is unsigned: Windows SmartScreen will warn until you add code signing.
