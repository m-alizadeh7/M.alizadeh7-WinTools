@echo off
setlocal

:menu
echo Please enter a number:
echo 1: Shecan
echo 2: 403 Online
echo 3: Google
set /p choice=Enter your choice:

if "%choice%"=="1" goto shecan
if "%choice%"=="2" goto online403
if "%choice%"=="3" goto google
echo Invalid choice. Please try again.
goto menu

:shecan
echo Setting DNS for Shecan...
netsh interface ip set dns name="Wi-Fi" static 178.22.122.100
netsh interface ip add dns name="Wi-Fi" 185.51.200.2 index=2
goto flushdns

:online403
echo Setting DNS for 403 Online...
netsh interface ip set dns name="Wi-Fi" static 10.202.10.202
netsh interface ip add dns name="Wi-Fi" 10.202.10.102 index=2
goto flushdns

:google
echo Setting DNS for Google...
netsh interface ip set dns name="Wi-Fi" static 8.8.8.8
netsh interface ip add dns name="Wi-Fi" 4.2.2.4 index=2
goto flushdns

:flushdns
echo Flushing DNS cache...
ipconfig /flushdns
echo DNS cache has been flushed.

:end
echo DNS has been set successfully.
pause
