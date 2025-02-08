@echo off
setlocal

:: تنظیم رنگ‌ها
set "Green=[92m"
set "Red=[91m"
set "Yellow=[93m"
set "Blue=[94m"
set "Reset=[0m"

:menu
echo.
echo %Blue%============================================%Reset%
echo %Blue%= Please enter a number:%Reset%
echo %Blue%============================================%Reset%
echo %Yellow%1:%Reset% Shecan
echo %Yellow%2:%Reset% 403 Online
echo %Yellow%3:%Reset% Google
echo %Yellow%4:%Reset% Disable Proxy Settings
set /p choice=%Blue%Enter your choice: %Reset%

if "%choice%"=="1" goto shecan
if "%choice%"=="2" goto online403
if "%choice%"=="3" goto google
if "%choice%"=="4" goto disable_proxy
echo %Red%Invalid choice. Please try again.%Reset%
goto menu

:shecan
echo %Green%Setting DNS for Shecan...%Reset%
netsh interface ip set dns name="Wi-Fi" static 178.22.122.100
netsh interface ip add dns name="Wi-Fi" 185.51.200.2 index=2
goto flushdns

:online403
echo %Green%Setting DNS for 403 Online...%Reset%
netsh interface ip set dns name="Wi-Fi" static 10.202.10.202
netsh interface ip add dns name="Wi-Fi" 10.202.10.102 index=2
goto flushdns

:google
echo %Green%Setting DNS for Google...%Reset%
netsh interface ip set dns name="Wi-Fi" static 8.8.8.8
netsh interface ip add dns name="Wi-Fi" 4.2.2.4 index=2
goto flushdns

:disable_proxy
echo %Green%Disabling Proxy Settings...%Reset%

:: Disable proxy for Internet Explorer and other apps that use WinHTTP
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /f

:: Disable proxy for network interfaces (Ethernet and Wi-Fi)
netsh winhttp reset proxy

echo %Green%Proxy settings have been disabled.%Reset%
goto end

:flushdns
echo %Green%Flushing DNS cache...%Reset%
ipconfig /flushdns
echo %Green%DNS cache has been flushed.%Reset%

:end
echo %Green%DNS has been set successfully.%Reset%

:save_info
echo %Green%Saving project information...%Reset%
echo ************************************************** > project_info.txt
echo *                                                * >> project_info.txt
echo *           M.alizadeh7-WinTools                 * >> project_info.txt
echo *                                                * >> project_info.txt
echo *           m.alizadeh7@live.com                 * >> project_info.txt
echo *                                                * >> project_info.txt
echo ************************************************** >> project_info.txt

echo %Green%Project information has been saved to project_info.txt.%Reset%
echo.
echo %Blue%============================================%Reset%
echo %Blue%= Project Information:%Reset%
echo %Blue%============================================%Reset%
type project_info.txt
echo %Blue%============================================%Reset%
pause
