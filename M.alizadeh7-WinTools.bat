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
echo %Blue%= Project Information: Network Tools %Reset%
echo %Blue%============================================%Reset%
echo %Blue%**************************************************%Reset%
echo %Blue%*      Project Name : M.alizadeh7-WinTools       *%Reset%
echo %Blue%*             My Email :  m.alizadeh7@live.com    *%Reset%
echo %Blue%**************************************************%Reset%
echo %Blue%============================================%Reset%
echo %Blue%GitHub Url : https://github.com/m-alizadeh7/M.alizadeh7-WinTools%Reset%
echo %Blue%============================================%Reset%
echo %Blue%============================================%Reset%
echo %Blue%= Please enter a number:%Reset%
echo %Blue%============================================%Reset%
echo %Yellow%[***]1:%Reset% Shecan (ChatGPT and Other AI - Anti 403)
echo %Yellow%[***]2:%Reset% Google
echo %Yellow%[*]3:%Reset% Cloudflare
echo %Blue%--------------------------------------------%Reset%
echo %Yellow%[?]4:%Reset% Begzar (Anti 403)
echo %Yellow%[?]5:%Reset% Electrotm (Anti 403 for Games)
echo %Yellow%[?]6:%Reset% Sheltertm (Anti 403 for Games)
echo %Yellow%[?]7:%Reset% Beshkanapp (Anti 403)
echo %Blue%--------------------------------------------%Reset%
echo %Yellow%[o]8:%Reset% Pishgaman (ISP) DNS
echo %Yellow%[o]9:%Reset% Shatel (ISP) DNS
echo %Yellow%[?]10:%Reset% Level3
echo %Blue%--------------------------------------------%Reset%
echo %Yellow%[###]11:%Reset% Disable Proxy Settings (VPN Disable Setting)
set /p choice=%Blue%Enter your choice: %Reset%

if "%choice%"=="1" goto shecan
if "%choice%"=="2" goto google
if "%choice%"=="3" goto cloudflare
if "%choice%"=="4" goto begzar
if "%choice%"=="5" goto electrotm
if "%choice%"=="6" goto sheltertm
if "%choice%"=="7" goto beshkanapp
if "%choice%"=="8" goto pishgaman
if "%choice%"=="9" goto shatel
if "%choice%"=="10" goto level3
if "%choice%"=="11" goto disable_proxy
echo %Red%Invalid choice. Please try again.%Reset%
goto menu

:shecan
echo %Green%Setting DNS for Shecan...%Reset%
netsh interface ip set dns name="Wi-Fi" static 178.22.122.100
netsh interface ip add dns name="Wi-Fi" 185.51.200.2 index=2
goto flushdns

:google
echo %Green%Setting DNS for Google...%Reset%
netsh interface ip set dns name="Wi-Fi" static 8.8.8.8
netsh interface ip add dns name="Wi-Fi" 8.8.4.4 index=2
goto flushdns

:cloudflare
echo %Green%Setting DNS for Cloudflare...%Reset%
netsh interface ip set dns name="Wi-Fi" static 1.1.1.1
netsh interface ip add dns name="Wi-Fi" 1.0.0.1 index=2
goto flushdns

:begzar
echo %Green%Setting DNS for Begzar...%Reset%
netsh interface ip set dns name="Wi-Fi" static 10.202.10.202
netsh interface ip add dns name="Wi-Fi" 10.202.10.102 index=2
goto flushdns

:electrotm
echo %Green%Setting DNS for Electrotm...%Reset%
netsh interface ip set dns name="Wi-Fi" static 78.157.42.100
netsh interface ip add dns name="Wi-Fi" 78.157.42.101 index=2
goto flushdns

:sheltertm
echo %Green%Setting DNS for Sheltertm...%Reset%
netsh interface ip set dns name="Wi-Fi" static 94.103.125.157
netsh interface ip add dns name="Wi-Fi" 94.103.125.158 index=2
goto flushdns

:beshkanapp
echo %Green%Setting DNS for Beshkanapp...%Reset%
netsh interface ip set dns name="Wi-Fi" static 181.41.194.177
netsh interface ip add dns name="Wi-Fi" 181.41.194.186 index=2
goto flushdns

:pishgaman
echo %Green%Setting DNS for Pishgaman...%Reset%
netsh interface ip set dns name="Wi-Fi" static 5.202.100.100
netsh interface ip add dns name="Wi-Fi" 5.202.100.101 index=2
goto flushdns

:shatel
echo %Green%Setting DNS for Shatel...%Reset%
netsh interface ip set dns name="Wi-Fi" static 85.15.1.14
netsh interface ip add dns name="Wi-Fi" 58.15.1.15 index=2
goto flushdns

:level3
echo %Green%Setting DNS for Level3...%Reset%
netsh interface ip set dns name="Wi-Fi" static 209.244.0.3
netsh interface ip add dns name="Wi-Fi" 209.244.0.4 index=2
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
pause
