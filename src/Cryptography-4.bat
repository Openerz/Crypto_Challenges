@echo off
:main
color E
cls
call :c F "Cryptography - 4"
echo.
echo.
call :c C "33 37 2E 35 30 38 39 30 32 2C 20 31 32 37 2E 30 34 32 37 34 33"
echo.
call :c B "ASCII"
echo.
call :c A "SHA1"
echo.
set /p i=The Answer is? ^> 
if /i "%i%"=="B3D69033F39928C3DF6D3F5BFB256F8C279C627C" goto Congratulations
cls
call :c A "wrong..."
timeout 2 /nobreak > nul
goto main
:Congratulations
cls
color C
echo Congratulations!!!
echo Next level.. (known)
pause>nul
exit


SET "DATA=123456789"
:loop1
SET /a RN1=%RANDOM% %% 100
call set DATA1=%%%!%DATA:~%RN1%,1%!%%%
if "%DATA1%" equ "" goto :loop1

call goto %%DATA1%%

pause>nul



:c
setlocal enableDelayedExpansion

:cp
setlocal
set "s=%~2"
call :cpv %1 s %3
exit /b

:cpv
if not defined DEL call :icp
setlocal enableDelayedExpansion
pushd .
':
cd \
set "s=!%~2!"
for %%n in (^"^

^") do (
  set "s=!s:\=%%~n\%%~n!"
  set "s=!s:/=%%~n/%%~n!"
  set "s=!s::=%%~n:%%~n!"
)
for /f delims^=^ eol^= %%s in ("!s!") do (
  if "!" equ "" setlocal disableDelayedExpansion
  if %%s==\ (
    findstr /a:%~1 "." "\'" nul
    <nul set /p "=%DEL%%DEL%%DEL%"
  ) else if %%s==/ (
    findstr /a:%~1 "." "/.\'" nul
    <nul set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%"
  ) else (
    >colorPrint.txt (echo %%s\..\')
    findstr /a:%~1 /f:colorPrint.txt "."
    <nul set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%"
  )
)
if /i "%~3"=="/n" echo(
popd
exit /b

:icp
for /f %%A in ('"prompt $H&for %%B in (1) do rem"') do set "DEL=%%A %%A"
<nul >"%temp%\'" set /p "=."
subst ': "%temp%" >nul
exit /b

:ccp
2>nul del "%temp%\'"
2>nul del "%temp%\colorPrint.txt"
>nul subst ': /d
exit /b