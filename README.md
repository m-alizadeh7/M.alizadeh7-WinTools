# MahdiWinTools
 # M.alizadeh7-WinTools

## توضیحات
**M.alizadeh7-WinTools** یک اسکریپت بت ساده و کاربردی برای ویندوز است که به شما امکان می‌دهد به راحتی سرورهای DNS خود را بر اساس نیازهای خود تغییر دهید. این اسکریپت به طور خودکار DNS ها را برای اتصال Wi-Fi شما تنظیم می‌کند و بعد از تنظیم، حافظه کش DNS را پاک می‌کند تا تغییرات بلادرنگ اعمال شوند.

## ویژگی‌ها
- تنظیم خودکار DNS برای اتصال Wi-Fi.
- پشتیبانی از سه پیکربندی DNS محبوب: Shecan, 403 Online, و Google.
- پاک کردن خودکار حافظه کش DNS بعد از تنظیم.
- رابط کاربری ساده و قابل فهم.
- ذخیره اطلاعات پروژه در یک فایل.

## نحوه استفاده
1. اسکریپت را در یک فایل با پسوند `.bat` ذخیره کنید، مثلاً `set_dns.bat`.
2. فایل را با حق اجرای مدیر اجرا کنید.
3. عدد مورد نظر خود را وارد کنید تا DNS ها بر اساس آن تنظیم شوند.

## کد اسکریپت
```batch
@echo off
setlocal

\:menu
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

\:shecan
echo Setting DNS for Shecan...
netsh interface ip set dns name="Wi-Fi" static 178.22.122.100
netsh interface ip add dns name="Wi-Fi" 185.51.200.2 index=2
goto flushdns

\:online403
echo Setting DNS for 403 Online...
netsh interface ip set dns name="Wi-Fi" static 10.202.10.202
netsh interface ip add dns name="Wi-Fi" 10.202.10.102 index=2
goto flushdns

\:google
echo Setting DNS for Google...
netsh interface ip set dns name="Wi-Fi" static 8.8.8.8
netsh interface ip add dns name="Wi-Fi" 4.2.2.4 index=2
goto flushdns

\:flushdns
echo Flushing DNS cache...
ipconfig /flushdns
echo DNS cache has been flushed.

\:end
echo DNS has been set successfully.

\:save_info
echo ************************************************** > project_info.txt
echo *                                                * >> project_info.txt
echo *           M.alizadeh7-WinTools                 * >> project_info.txt
echo *                                                * >> project_info.txt
echo *           m.alizadeh7@live.com                 * >> project_info.txt
echo *                                                * >> project_info.txt
echo ************************************************** >> project_info.txt

echo Project information has been saved to project_info.txt.
pause

