@ECHO OFF

ECHO SETTING VARIABLES...

SET CUR_DIR="%cd%"
SET PS_FILE=AutomatedSystemRestore.ps1
SET STARTUP_DIR="C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

SET WRAPPER_FILE=%STARTUP_DIR%\runWrapper.bat
SET WRAPPER_CMD=powershell %CUR_DIR%\%PS_FILE%

ECHO WROTE VARIABLES.
ECHO WRITTING FILE...

TYPE nul>%WRAPPER_FILE%
ECHO @ECHO OFF>>%WRAPPER_FILE%
ECHO %WRAPPER_CMD%>>%WRAPPER_FILE%

ECHO WROTE FILE %WRAPPER_FILE%.

ECHO DONE.
PAUSE