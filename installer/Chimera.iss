; CHIMERA Windows installer (Inno Setup 6)
; Build:  ISCC.exe /DAppVersion=0.1.0 [/DWITH_CLAP=1] installer\Chimera.iss
; Expects (relative to this file):  ..\stage\VST3\CHIMERA.vst3, ..\stage\CLAP\CHIMERA.clap (optional), ..\LICENSE

#ifndef AppVersion
  #define AppVersion "0.1.0"
#endif

[Setup]
AppId={{6F2B8C1E-4D7A-4E55-9B3A-C41A7E0D9A11}
AppName=CHIMERA
AppVersion={#AppVersion}
AppPublisher=CHIMERA contributors (MIT licensed)
DefaultDirName={autopf}\CHIMERA
DisableProgramGroupPage=yes
DisableDirPage=yes
OutputDir=..\dist
OutputBaseFilename=CHIMERA-Setup
LicenseFile=..\LICENSE
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
PrivilegesRequired=admin
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
UninstallDisplayName=CHIMERA (VST3)

[Components]
Name: "vst3"; Description: "VST3 plugin (C:\Program Files\Common Files\VST3)"; Flags: fixed
#ifdef WITH_CLAP
Name: "clap"; Description: "CLAP plugin (C:\Program Files\Common Files\CLAP)"
#endif

[Files]
Source: "..\stage\VST3\*"; DestDir: "{commoncf64}\VST3"; Components: vst3; Flags: recursesubdirs createallsubdirs ignoreversion
#ifdef WITH_CLAP
Source: "..\stage\CLAP\*"; DestDir: "{commoncf64}\CLAP"; Components: clap; Flags: recursesubdirs createallsubdirs ignoreversion
#endif
Source: "..\LICENSE"; DestDir: "{app}"; DestName: "LICENSE.txt"; Flags: ignoreversion
