@ECHO OFF
ECHO SETTING VARIABLES...
SET STARTUP_DIR="C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

SET CUR_DIR="%cd%"
SET PS_FILE=AutomatedSystemRestore.ps1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList 'Set-ExecutionPolicy RemoteSigned -Force' -Verb RunAs}"

REM ########################################

REM ECHO SETTING EXECUTION POLICY
REM set theValue=
REM for /f "delims=" %%a in ('PowerShell.exe Get-ExecutionPolicy') do @set theValue=%%a

REM ECHO EXECUTION POLICY IS %theValue%
REM PAUSE
REM IF NOT %theValue% = 'Restricted' ( PowerShell.exe -ExecutionPolicy Bypass -File %POLICY_FILE% )
REM ECHO EXECUTION POLICY SET TO UNRESTRICTED

REM ########################################


SET WRAPPER_FILE=%STARTUP_DIR%\runWrapper.bat
SET WRAPPER_CMD=PowerShell.exe -File %CUR_DIR%\%PS_FILE% 

ECHO WROTE VARIABLES.
PowerShell.exe Get-ExecutionPolicy
ECHO WRITTING FILE...

TYPE nul>%WRAPPER_FILE%
ECHO @ECHO OFF>>%WRAPPER_FILE%
ECHO %WRAPPER_CMD%>>%WRAPPER_FILE%

REM ########################################

ECHO WROTE FILE %WRAPPER_FILE%...
ECHO CONTENTS:
TYPE %WRAPPER_FILE%

ECHO DONE.
PAUSE
