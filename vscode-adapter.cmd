@ECHO OFF
SETLOCAL

@REM --diff %baseCfg %secondCfg

if /%1/==/--diff/ (
    echo f | xcopy /f /y %2 "%~2.bsl"
    echo f | xcopy /f /y %3 "%~3.bsl"
    code --diff "%~2.bsl" "%~3.bsl" --new-window --sync off --wait
)

@REM --merge %baseCfg %secondCfg %oldVendorCfg %merged

if /%1/==/--merge/ (
    echo f | xcopy /f /y %2 "%~2.bsl"
    echo f | xcopy /f /y %3 "%~3.bsl"
    echo f | xcopy /f /y %4 "%~4.bsl"
    echo f | xcopy /f /y %3 "%~5.bsl"
    code --merge "%~2.bsl" "%~3.bsl" "%~4.bsl" "%~5.bsl" --new-window --sync off --wait
    echo f | xcopy /f /y "%~5.bsl" %5
)
