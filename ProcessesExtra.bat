@echo off
title ShoczTweaks
color 9

set "HIVE=SYSTEM\CurrentControlSet"
taskkill /f /im backgroundTaskHost.exe
REN "C:\Windows\System32\backgroundTaskHost.exe" "backgroundTaskHost.exee"
taskkill /f /im TextInputHost.exe
REN "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\TextInputHost.exe" "TextInputHost.exee"
reg.exe add "HKLM\%HIVE%\Services\QWAVE" /v "Start" /t REG_DWORD /d "4" /f
reg.exe add "HKLM\%HIVE%\Services\seclogon" /v "Start" /t REG_DWORD /d "3" /f
reg.exe add "HKLM\%HIVE%\Services\NgcSvc" /v "Start" /t REG_DWORD /d "4" /f
reg.exe add "HKLM\%HIVE%\Services\AppXSvc" /v "Start" /t REG_DWORD /d "4" /f
reg.exe add "HKLM\%HIVE%\Services\NgcCtnrSvc" /v "Start" /t REG_DWORD /d "4" /f
reg.exe add "HKLM\%HIVE%\Services\edgeupdate" /v "Start" /t REG_DWORD /d "4" /f
reg.exe add "HKLM\%HIVE%\Services\edgeupdatem" /v "Start" /t REG_DWORD /d "4" /f
reg.exe add "HKLM\%HIVE%\Services\MicrosoftEdgeElevationService" /v "Start" /t REG_DWORD /d "4" /f
reg.exe add "HKLM\%HIVE%\Services\hidserv" /v "Start" /t REG_DWORD /d "3" /f
exit