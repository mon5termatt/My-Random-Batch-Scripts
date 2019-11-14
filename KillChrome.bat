@echo off

mode con cols=50 lines=40
echo.Are you sure you want to kill the process? Y/N
choice /C:YN /N /M "Waiting for Input:"
if errorlevel 2 goto:Exit
if errorlevel 1 goto:Execute
:execute
CLS
COLOR 0A
Echo.Killing the chrome process!
timeout 2 >nul
CLS
COLOR 09
tskill chrome /A /V
timeout 2 >nul
CLS
COLOR A0
echo.Finished!
timeout 2 >nul
exit
:exit
COLOR C0
echo. Goodbye!
timeout 2 >nul
exit