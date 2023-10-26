@echo off
:: Check for administrator privileges
NET FILE 1>NUL 2>NUL
if "%ERRORLEVEL%" NEQ "0" (
    echo Please run this script as Administrator.
    pause
    exit /b 1
)

:: Rest of the script
setlocal enabledelayedexpansion

rem Define the download URL and temporary file location
set downloadURL=https://dl.google.com/android/repository/platform-tools-latest-windows.zip
set tempFile=%temp%\platform-tools.zip

rem Define the destination folder for ADB tools
set adbDestination=%SystemRoot%\platform-tools

rem Step 1: Check if the ADB server is running and stop it
echo Stopping ADB server...
tasklist | find /i "adb.exe" && (
    adb kill-server
    timeout /t 2 >nul
)

rem Step 2: Delete the existing platform-tools folder if it exists
if exist "%adbDestination%" (
    echo Deleting existing ADB tools folder...
    rmdir /s /q "%adbDestination%"
)

rem Step 3: Download the ADB tools zip file using curl
echo Downloading ADB tools...
curl -o "%tempFile%" -L "%downloadURL%"

rem Step 4: Extract the zip file to the destination folder with -Force
if exist "%tempFile%" (
    echo Extracting ADB tools...
    mkdir "%adbDestination%" 2>nul
    powershell -command "Expand-Archive -Path '%tempFile%' -DestinationPath '%adbDestination%' -Force"

    rem Move the contents of the nested "platform-tools" folder to the desired destination
    move "%adbDestination%\platform-tools\*" "%adbDestination%"

    rem Remove the nested "platform-tools" folder
    rmdir /s /q "%adbDestination%\platform-tools"

    if !errorlevel! neq 0 (
        echo Extraction failed.
        exit /b 1
    )
    echo Extraction complete.

    rem Step 5: Delete the downloaded zip file
    echo Deleting downloaded zip file...
    del "%tempFile%"
) else (
    echo Download failed.
    exit /b 1
)

:: Step 6: Add adb.exe to the system PATH
echo Adding ADB to the system PATH...
setx PATH "%PATH%;C:\Windows\platform-tools" /M

if "%ERRORLEVEL%" NEQ "0" (
    echo Failed to add ADB to the system PATH.
    exit /b 1
)

echo ADB added to the system PATH successfully.

:: Step 7: Verify ADB installation
echo Verifying ADB installation...
adb version

endlocal
