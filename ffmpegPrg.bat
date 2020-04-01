@ECHO OFF
:selection
ECHO 1 Information
ECHO 2 Video to Audio
ECHO 3 Trim
ECHO 4 Split
ECHO 5 Join
ECHO.
SET /P OPTION="[Enter option ] "
if %option% == 1 (goto information)
if %option% == 2 (goto vta)
if %option% == 3 (goto trim)
if %option% == 4 (goto split)
if %option% == 5 (goto join)
ECHO Unknown value 
goto selection