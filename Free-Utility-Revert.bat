@echo off
title Shocz-Free-Utility-Revert
color 9

:: Admin check
fltmc >nul 2>&1
if not %errorlevel% == 0 (
    PowerShell Start -Verb RunAs '%0'
    exit /b 0
)

:: Importing Revert Backup
reg import "C:\Shocz\Reg Backup\ServicesBackup.reg"
if errorlevel 1 (
    Powershell -NoProfile -Command "Write-Host 'Failed to import *ServicesBackup.reg*' -ForegroundColor White -BackgroundColor Red" 
    timeout 2 > nul
) else ( 
    echo Reg Backup imported successfully. >nul 2>&1
)
exit