@echo off
title SSH Edit
:menu
mode con:cols=30 lines=8
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
del %userprofile%\.ssh\known_hosts_backup
copy %userprofile%\.ssh\known_hosts %userprofile%\.ssh\known_hosts_backup
goto:Menu
:restore
del %userprofile%\.ssh\known_hosts
copy %userprofile%\.ssh\known_hosts_backup %userprofile%\.ssh\known_hosts 
del %userprofile%\.ssh\known_hosts_backup
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
exit