cls 
@echo off
title Rlog_By_Xranger
FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) goto ErrorAdmin
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :clearing "%%G")
echo.
echo ..................Logs Cleared!.....................
pause

:clearing
echo clearing %1
wevtutil.exe cl %1
goto :eof

:ErrorAdmin
echo.
echo ..............Run as administrator!.....................

pause