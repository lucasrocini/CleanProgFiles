@echo off

REM Autor: Lucas Rocini
REM Script: CleanProgFiles.bat
REM versão 2.2
REM Arquivos no Startup que faz aparecer sempre o arquivo "CleanProgFiles.bat"

echo .
echo .
echo .
echo ****** Iniciando Script... ******
echo .
echo .
echo .

REM Copiando arquivo para DESKTOP
copy /b /v "%systemdrive%\Windows\System32\CleanProgFiles.bat" "%userprofile%\Desktop\CleanProgFiles.bat" >nul
IF %ERRORLEVEL% EQU 0 (echo Arquivos copiados com sucesso!) ELSE (echo Ocorreu algum erro...)

REM Copiando arquivo para DOCUMENTS
copy /b /v "%systemdrive%\Windows\System32\CleanProgFiles.bat" "%userprofile%\Documents\CleanProgFiles.bat" >nul
IF %ERRORLEVEL% EQU 0 (echo Arquivos copiados com sucesso!) ELSE (echo Ocorreu algum erro...)

REM Copiando arquivo para PICTURES
copy /b /v "%systemdrive%\Windows\System32\CleanProgFiles.bat" "%userprofile%\Pictures\CleanProgFiles.bat" >nul
IF %ERRORLEVEL% EQU 0 (echo Arquivos copiados com sucesso!) ELSE (echo Ocorreu algum erro...)

REM Copiando arquivo para Music
copy /b /v "%systemdrive%\Windows\System32\CleanProgFiles.bat" "%userprofile%\Music\CleanProgFiles.bat" >nul
IF %ERRORLEVEL% EQU 0 (echo Arquivos copiados com sucesso!) ELSE (echo Ocorreu algum erro...)

REM Copiando arquivo para VIDEOS
copy /b /v "%systemdrive%\Windows\System32\CleanProgFiles.bat" "%userprofile%\Videos\CleanProgFiles.bat" >nul
IF %ERRORLEVEL% EQU 0 (echo Arquivos copiados com sucesso!) ELSE (echo Ocorreu algum erro...)

echo .
echo .
echo .

echo ****** Script Finalizado com sucesso. ******

echo .
echo .
echo .
