@echo off

REM Autor: Lucas Rocini
REM Script: CleanProgFiles.bat
REM versão 2.4
REM Instalador do Script

echo .
echo .
echo .
echo Instalador do Script para deletar arquivos PYTHON
echo .
echo .
echo .

::Prompt ao usuário para prosseguir
set /p resp=Deseja proseguir? (pressione ENTER para prosseguir, digite N ou n para cancelar)
if /i "%resp%" EQU "N" goto encerra
if /i "%resp%" EQU "n" goto encerra
if /i "%resp%" NEQ "N" goto prossiga
:encerra
echo .
echo  O script sera encerrado.
echo .
pause
exit /b

:prossiga
echo ****** Iniciando Script... ******
echo .
echo .
echo .

::Pasta AutoRun
echo Copiando arquivo StartupCleanProgFiles.bat
copy /b /v "%CD%\StartupCleanProgFiles.bat" "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\StartupCleanProgFiles.bat" >nul
IF %ERRORLEVEL% EQU 0 (echo Arquivos copiados com sucesso!) ELSE (echo Ocorreu algum erro...)
echo .
echo .

::Local padrao no PC
echo Copiando arquivo CleanProgFiles.bat
copy /b /v "%CD%\CleanProgFiles.bat" "%systemdrive%\Windows\System32\CleanProgFiles.bat" >nul
IF %ERRORLEVEL% EQU 0 (echo Arquivos copiados com sucesso!) ELSE (echo Ocorreu algum erro...)
echo .
echo .

::Desktop
echo Copiando arquivo no Desktop
copy /b /v "%CD%\CleanProgFiles.bat" "%userprofile%\Desktop\CleanProgFiles.bat" >nul
IF %ERRORLEVEL% EQU 0 (echo Arquivos copiados com sucesso!) ELSE (echo Ocorreu algum erro...)
echo .
echo .

::pasta LARSYS
echo Verificando e criando pasta LARSYS
if not exist "%SystemDrive%\LARSYS" mkdir %SystemDrive%\LARSYS
IF %ERRORLEVEL% EQU 0 (echo Pasta criada com sucesso!) ELSE (echo Ocorreu algum erro...)

echo Copiando arquivo para pasta LARSYS
copy /b /v "%CD%\CleanProgFiles.bat" "%SystemDrive%\LARSYS\CleanProgFiles.bat" >nul
IF %ERRORLEVEL% EQU 0 (echo Arquivos copiados com sucesso!) ELSE (echo Ocorreu algum erro...)
echo .
echo .

::outros diretorios
echo Copiando arquivo em outros diretorios
copy /b /v "%CD%\CleanProgFiles.bat" "%userprofile%\Documents\CleanProgFiles.bat" >nul
IF %ERRORLEVEL% EQU 0 (echo Arquivos copiados com sucesso!) ELSE (echo Ocorreu algum erro...)
copy /b /v "%CD%\CleanProgFiles.bat" "%userprofile%\Downloads\CleanProgFiles.bat" >nul
IF %ERRORLEVEL% EQU 0 (echo Arquivos copiados com sucesso!) ELSE (echo Ocorreu algum erro...)
copy /b /v "%CD%\CleanProgFiles.bat" "%userprofile%\Pictures\CleanProgFiles.bat" >nul
IF %ERRORLEVEL% EQU 0 (echo Arquivos copiados com sucesso!) ELSE (echo Ocorreu algum erro...)
copy /b /v "%CD%\CleanProgFiles.bat" "%userprofile%\Music\CleanProgFiles.bat" >nul
IF %ERRORLEVEL% EQU 0 (echo Arquivos copiados com sucesso!) ELSE (echo Ocorreu algum erro...)
copy /b /v "%CD%\CleanProgFiles.bat" "%userprofile%\Videos\CleanProgFiles.bat" >nul
IF %ERRORLEVEL% EQU 0 (echo Arquivos copiados com sucesso!) ELSE (echo Ocorreu algum erro...)

echo .
echo .
echo .

echo ****** Script Finalizado com sucesso. ******

echo .
echo .
echo .

pause