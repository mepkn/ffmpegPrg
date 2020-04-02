@ECHO OFF
::code for getting user input and going to respective part of code
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

::code for getting video information
:information
ECHO.
SET /P URL="[Enter File URL] "
ffmpeg -i %URL% -hide_banner
ECHO ----------------------------------------------------------------------------------------------------------------------
PAUSE
EXIT

::code for converting video to audio
:vta
ECHO.
SET /P URL="[Enter File URL] "
ffmpeg -i %URL% -vn "Output/output.mp3"
ECHO ----------------------------------------------------------------------------------------------------------------------
PAUSE
EXIT

::code for trimming video given starting and ending time
:trim
ECHO.
SET /P URL="[Enter File URL] "
SET /P TIMES="[Enter start time] "
SET /P TIMEE="[Enter end time] "
SET /P CONTR="[Enter input file container] "
ffmpeg -i %URL% -ss %TIMES% -to %TIMEE% -c copy "Output/output.%CONTR%"
ECHO ----------------------------------------------------------------------------------------------------------------------
PAUSE
EXIT

::code for splitting video into two parts
:split
ECHO.
SET /P URL="[Enter File URL] "
SET /P TIME="[Enter split time] "
SET /P CONTR="[Enter input file container] "
ffmpeg -i %URL% -t %TIME% -c copy "Output/output1.%CONTR%" -ss %TIME% -c copy "Output/output2.%CONTR%"
ECHO ----------------------------------------------------------------------------------------------------------------------
PAUSE
EXIT

::code for joining video files whose path is provided in a text file
:join
ECHO.
SET /P CONTR="[Enter input file container] "
ffmpeg -f concat -i join.txt -c copy "Output/output.%CONTR%"
ECHO ----------------------------------------------------------------------------------------------------------------------
PAUSE
EXIT