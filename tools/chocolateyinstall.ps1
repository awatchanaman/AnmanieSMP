$ErrorActionPreference = 'Stop';


$packageArgs = @{
  packageName    = 'anmaniesmp'
  softwareName   = 'anmaniesmp*'
  fileType       = 'exe'
  url            = 'https://github.com/awatchanaman/AnmanieSMP/blob/87be284dd7929a88508a30918fc720aa5f600814/tools/AnmSMP24.exe'
  silentArgs     = '/VERYSILENT'
  validExitCodes = @(0)
  checksum       = 'F418B4FA4F228672DAB39B7557CF96F22102066ADB4E07C30AC90E21F1C67AF4'
  checksumType   = 'sha256'
  }

Install-ChocolateyPackage @packageArgs

#Suppression du  Raccourci currentuserr sur le bureau
Remove-Item -Path "$env:USERPROFILE\Desktop\AnmanieSMP.lnk" -Recurse -ErrorAction SilentlyContinue

#Mise en place du Raccourci alluser sur le bureau
$filepath = Join-Path "${env:programfiles(x86)}\AnmSMP" 'AnmanieSMP.exe'
Install-ChocolateyShortcut -ShortcutFilePath "$env:PUBLIC\Desktop\AnmanieSMP.lnk" -TargetPath "$filepath"


if ((Get-PackageParameters).NoDesktopShortcut) {
    Write-Host "(Get-PackageParameters).NoDesktopShortcut)"
    Remove-Item -Path "$env:PUBLIC\Desktop\AnmanieSMP.lnk"
    }
