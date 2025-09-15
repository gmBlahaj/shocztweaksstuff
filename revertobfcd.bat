��
cls
@echo off

:: Set DNS, Local, Hosts, and NetBT priority
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d 2000 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d 499 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d 500 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d 2001 /f

:: Set Network Throttling Index and System Responsiveness
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 10 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 20 /f


:: Set MaxUserPort, TcpTimedWaitDelay, and DefaultTTL
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /f


:: PowerShell commands for TCP settings
PowerShell.exe Set-NetTCPSetting -SettingName internet -AutoTuningLevelLocal Normal
PowerShell.exe Set-NetTCPSetting -SettingName internet -ScalingHeuristics enabled
PowerShell.exe Set-NetTcpSetting -SettingName internet -EcnCapability disabled
PowerShell.exe Set-NetTcpSetting -SettingName internet -Timestamps disabled
PowerShell.exe Set-NetTcpSetting -SettingName internet -MaxSynRetransmissions 2
PowerShell.exe Set-NetTcpSetting -SettingName internet -NonSackRttResiliency disabled
PowerShell.exe Set-NetTcpSetting -SettingName internet -InitialRto 3000
PowerShell.exe Set-NetTcpSetting -SettingName internet -MinRto 300

:: PowerShell commands for offload and network settings
PowerShell.exe Set-NetOffloadGlobalSetting -ReceiveSegmentCoalescing enable
PowerShell.exe Set-NetOffloadGlobalSetting -ReceiveSideScaling enable
PowerShell.exe Enable-NetAdapterChecksumOffload -Name *

:: netsh commands for TCP settings
netsh int tcp set supplemental internet congestionprovider=cubic
pause

exit

