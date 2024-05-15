@echo off
setlocal enabledelayedexpansion

rem Loop through all files in the current directory
for %%f in (*) do (
    rem Get the file name without extension
    set "filename=%%~nf"
    rem Get the file extension
    set "extension=%%~xf"
    
    rem Check if the filename contains an underscore after a numeric prefix
    if "!filename!" neq "!filename:~0,8!" (
        rem Use a regular expression to match and remove the digits and underscore
        for /f "tokens=1,* delims=_" %%a in ("!filename!") do (
            rem Rename the file
            echo Renaming "%%f" to "%%b!extension!"
            ren "%%f" "%%b!extension!"
        )
    )
)

endlocal
pause
