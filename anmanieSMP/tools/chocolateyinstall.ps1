$ErrorActionPreference = 'Stop';


$packageArgs = @{
  packageName    = 'anmaniesmp'
  softwareName   = 'anmaniesmp*'
  fileType       = 'exe'
  url            = 'http://tiry73.free.fr/anm/AnmSMP24.exe'
  silentArgs     = '/VERYSILENT'
  validExitCodes = @(0)
  checksum       = 'F418B4FA4F228672DAB39B7557CF96F22102066ADB4E07C30AC90E21F1C67AF4'
  checksumType   = 'sha256'
  }

Install-ChocolateyInstallPackage @packageArgs

# Mise en place du Raccourci dans Menu Demarrer
#$filepath = Join-Path "$env:ProgramFiles\Apprenti-Geometre" 'Apprenti_Geometre.exe'
#Install-ChocolateyShortcut -ShortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Apprenti_Geometre.lnk" -TargetPath "$filepath"


# Mise en place du Raccourci dans Menu Demarrer (si le params est renseigné --params /DesktopShortcut)

#if ((Get-PackageParameters).DesktopShortcut) {
#Install-ChocolateyShortcut -ShortcutFilePath "$env:Public\Desktop\Apprenti_Geometre.lnk" -TargetPath "$filepath"
#}
