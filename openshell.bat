@echo off
color 9
chcp 65001 >nul 2>&1
echo • Downloading OpenShell!
mkdir "C:\OpenShell" >nul 2>&1
set "FileURL1=https://github.com/Open-Shell/Open-Shell-Menu/releases/download/v4.4.196/OpenShellSetup_4_4_196.exe"
set "FileName1=OpenShellSetup_4_4_196.exe"
set "FileURL2=https://raw.githubusercontent.com/gmBlahaj/shocztweaksstuff/main/OpenShellTheme.xml"
set "FileName2=OpenShellTheme.xml"
set "DownloadsFolder=C:\OpenShell"
curl -s -L "%FileURL1%" -o "%DownloadsFolder%\%FileName1%"
curl -s -L "%FileURL2%" -o "%DownloadsFolder%\%FileName2%"
if exist "%DownloadsFolder%\%FileName1%" (  
   echo • Openshell downloaded successfully.
   start "" "C:\OpenShell\OpenShellSetup_4_4_196.exe" /qn ADDLOCAL=StartMenu
   timeout 2 > nul
   "C:\Program Files\Open-Shell\StartMenu.exe" -xml "C:\OpenShell\OpenShellTheme.xml"
   pause
   rd /s /q "C:\OpenShell" >nul 2>&1
   exit
) else (
   rd /s /q "C:\OpenShell" >nul 2>&1
   exit
)
