:: install by powershell
:: powershell -command "(new-object System.Net.WebClient).DownloadFile('https://miktex.org/download/ctan/systems/win32/miktex/setup/basic-miktex-2.9.6520-x64.exe','%USERPROFILE%\Desktop\basic-miktex-2.9.6520-x64.exe')"

@echo OFF

reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT

if %OS%==32BIT GOTO 32BITS
if %OS%==64BIT GOTO 64BITS

:32BITS
:: Install MiKTeX
echo This is a 32bit operating system, Install 32bit version MiKTeX
powershell -command "(new-object System.Net.WebClient).DownloadFile('https://miktex.org/download/ctan/systems/win32/miktex/setup/windows-x86/basic-miktex-2.9.7086.exe','%USERPROFILE%\Desktop\basic-miktex-2.9.7086.exe')"
echo Download process is completed!
:: run service 
%USERPROFILE%\Desktop\basic-miktex-2.9.7086-x86.exe

GOTO END

:64BITS
:: Install graphviz
echo This is a 64bit operating system, Install 64bit version MiKTeX
powershell -command "(new-object System.Net.WebClient).DownloadFile('https://miktex.org/download/ctan/systems/win32/miktex/setup/windows-x64/basic-miktex-2.9.7086-x64.exe','%USERPROFILE%\Desktop\basic-miktex-2.9.7086-x64.exe')"
echo Download process is completed!
:: run service 
%USERPROFILE%\Desktop\basic-miktex-2.9.7086-x64.exe

GOTO END

:END
echo [Dependencies] Installation completed! You can use it now.