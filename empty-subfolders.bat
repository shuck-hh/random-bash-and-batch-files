@echo off
setlocal EnableDelayedExpansion

:: Set the folder to scan
set "ROOT=%~1"

if "%ROOT%"=="" (
    set "ROOT=%CD%"
)

echo Scanning: "%ROOT%"
echo.

for /f "delims=" %%D in ('dir "%ROOT%" /ad /b /s ^| sort /R') do (
    dir "%%D" /a /b >nul 2>&1

    set "EMPTY=1"
    for /f %%F in ('dir "%%D" /a /b 2^>nul') do (
        set "EMPTY=0"
    )

    if !EMPTY!==1 (
        echo Empty folder found:
        echo %%D
        choice /C YN /M "Delete this folder?"
        if errorlevel 2 (
            echo Skipped.
        ) else (
            rd "%%D"
            echo Deleted.
        )
        echo.
    )
)

echo Scan complete.
pause
