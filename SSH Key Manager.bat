@echo off
title SSH Edit
:menu
mode con:cols=34 lines=8
cls
echo.[1] Edit File
echo.[2] View Keys
echo.[3] Backup File
echo.[4] Restore From Backup
echo.[5] Open Directory
echo.[6] Reset/Delete
echo.[0] Exit
choice /C:1234560 /N /M ""
if errorlevel 7 cls && goto:exit
if errorlevel 6 cls && goto:reset
if errorlevel 5 cls && goto:dir
if errorlevel 4 cls && goto:restore
if errorlevel 3 cls && goto:backup
if errorlevel 2 cls && goto:view
if errorlevel 1 cls && goto:edit








:edit
notepad.exe %userprofile%\.ssh\known_hosts
goto:Menu
:reset
del %userprofile%\.ssh\known_hosts
goto:Menu
:backup
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "fullstamp=%MM%-%DD%-%YYYY%_%HH%-%Min%-%Sec%""
del %userprofile%\.ssh\known_hosts_backup
copy %userprofile%\.ssh\known_hosts %userprofile%\.ssh\known_hosts_backup_%fullstamp%
copy %userprofile%\.ssh\known_hosts %userprofile%\.ssh\known_hosts_backup
goto:Menu
:restore
IF EXIST "%userprofile%\.ssh\known_hosts_backup" (cls && goto:restore2) ELSE (cls && goto:restore3)
:restore2
del %userprofile%\.ssh\known_hosts
copy %userprofile%\.ssh\known_hosts_backup %userprofile%\.ssh\known_hosts 
del %userprofile%\.ssh\known_hosts_backup
goto:Menu
:restore3
echo.Couldnt find backup
pause
goto:Menu
:view
mode con:cols=200 lines=12
type %userprofile%\.ssh\known_hosts
pause >nul
goto:Menu
:dir
start %userprofile%\.ssh\
goto:Menu
:exit
echo.Thanks!
timeout 1 > Nul
exit
