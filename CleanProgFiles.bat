@echo off

REM Autor: Lucas Rocini
REM Script: CleanProgFiles.bat
REM Versao: LAR 2.4
REM Emai: lucasrocini@hotmail.com

::Script para limpar o PC para aulas de programação
::Script para deletar apagar arquivos de programacao 
::e resetar configuracoes da maquina

::Este Script:

::- APAGA todos os arquivos:
::	-Desktop
::	-Downloads

::- APAGA tipos especificos de arquivos:
::	-PYTHON (.py)
::		Documentos
::		Userprofile
::		Userprofile\.spyder-py3
::	-C (.c)
::		Documentos
::		Userprofile
::	-C++ (.cpp)
::		Documentos
::		Userprofile
::	-Texto (.txt)
::		Documentos
::		Userprofile
::		Userprofile\.spyder-py3

::- APAGA:
::     Pastas vazias

::- Limpa lixeira

::- Reseta o Spyder

::- Seta Desktop para auto-organizar icones

echo ****************************************************************************
echo 			CleanProgFiles
echo ****************************************************************************
echo . Script para resetar arquivos para aulas de programacao
echo .
echo . Versao: LAR 2.4
echo ****************************************************************************
echo .
echo .
echo **********	ATENCAO:	**********
echo .
echo . - Este script deleta arquivos! Salve tudo o que precisar antes de executar!
echo . - Este script reseta o PYTHON SPYDER
echo .
echo .
::Prompt ao usuário para prosseguir
set /p resp=Deseja continuar? (pressione ENTER para prosseguir, digite N para cancelar)
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
timeout 1 > NUL
echo .
timeout 1 > NUL
echo .

::------------------------------------------------------------------------------------------------------
::Fechando SPYDER
::  
::------------------------------------------------------------------------------------------------------
echo  Fechando SPYDER...
taskkill /f /im pythonw.exe > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	SPYDER fechado com SUCESSO!) ELSE (echo 	Spyder nao esta aberto - SUCESSO!)
echo .

::------------------------------------------------------------------------------------------------------
::Fechando CODEBLOCKS
::  
::------------------------------------------------------------------------------------------------------
echo  Fechando CODEBLOCKS...
taskkill /f /im codeblocks.exe > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	CODEBLOCKS fechado com SUCESSO!) ELSE (echo 	CODEBLOCKS nao esta aberto - SUCESSO!)
echo .

::------------------------------------------------------------------------------------------------------
::reset SPYDER
::  
::------------------------------------------------------------------------------------------------------
echo  Resetando configs do Spyder
spyder --reset > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Spyder resetado com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)
echo .

::------------------------------------------------------------------------------------------------------
:: deletando arquivos
::        DOWNLOADS
::------------------------------------------------------------------------------------------------------
echo  Deletando arquivos DOWNLOADS...

cd %userprofile%\Downloads

::Deletar pastas
for /f "delims=" %%a in ('Dir /b /AD ^| find /v "CleanProgFiles.bat"') do rd /S /Q "%%a" > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Arquivos deletados com sucesso!) ELSE (echo 	Ocorreu algum erro...)
echo .

::Deletar arquivos ocultos
for /f "delims=" %%a in ('Dir /b /a:h ^| find /v "CleanProgFiles.bat"') do del /F /Q /S /AH "%%a" > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Arquivos deletados com sucesso!) ELSE (echo 	Ocorreu algum erro...)
echo .

::Deletar arquivos
for /f "delims=" %%a in ('Dir /b ^| find /v "CleanProgFiles.bat"') do del /F /Q /S "%%a" > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Arquivos deletados com sucesso!) ELSE (echo 	Ocorreu algum erro...)
echo .

::------------------------------------------------------------------------------------------------------
:: deletando arquivos
::        DESKTOP
::------------------------------------------------------------------------------------------------------
echo  Deletando arquivos DESKTOP...

cd %userprofile%\Desktop

::Deletar pastas
for /f "delims=" %%a in ('Dir /b /AD ^| find /v "CleanProgFiles.bat"') do rd /S /Q "%%a" > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Arquivos deletados com sucesso!) ELSE (echo 	Ocorreu algum erro...)
echo .

::Deletar arquivos ocultos
for /f "delims=" %%a in ('Dir /b /a:h ^| find /v "CleanProgFiles.bat"') do del /F /Q /S /AH "%%a" > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Arquivos deletados com sucesso!) ELSE (echo 	Ocorreu algum erro...)
echo .

::Deletar arquivos
for /f "delims=" %%a in ('Dir /b ^| find /v "CleanProgFiles.bat"') do del /F /Q /S "%%a" > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Arquivos deletados com sucesso!) ELSE (echo 	Ocorreu algum erro...)
echo .

::------------------------------------------------------------------------------------------------------
:: deletando arquivos
::        PYTHON
::------------------------------------------------------------------------------------------------------
echo Deletando arquivos PYTHON...

::recursivo (/s)
cd %userprofile%\Documents
del *.py /f /q /s > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)
::deletando arquivos ocultos
del *.py /f /q /s /a:h > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)

::nao pode incluir subpastas (/s)
cd %userprofile%
del *.py /f /q > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)
::deletando arquivos ocultos
del *.py /f /q /a:h > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)

::nao pode incluir subpastas (/s)
cd %userprofile%\.spyder-py3
del *.py /f /q > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)
::deletando arquivos ocultos
del *.py /f /q /a:h > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)
echo .

::------------------------------------------------------------------------------------------------------
:: deletando arquivos
::         C
::------------------------------------------------------------------------------------------------------
echo Deletando arquivos C...

cd %userprofile%\Documents
del *.c /f /q > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)
::deletando arquivos ocultos
del *.c /f /q /a:h > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)

::nao pode incluir subpastas (/s)
cd %userprofile%
del *.c /f /q > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)
::deletando arquivos ocultos
del *.c /f /q /a:h > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)
echo .

::------------------------------------------------------------------------------------------------------
:: deletando arquivos
::        CPP
::------------------------------------------------------------------------------------------------------
echo Deletando arquivos C++...

cd %userprofile%\Documents
del *.cpp /f /q > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)
::deletando arquivos ocultos
del *.cpp /f /q /a:h > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)

::nao pode incluir subpastas (/s)
cd %userprofile%
del *.cpp /f /q > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)
::deletando arquivos ocultos
del *.cpp /f /q /a:h > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)
echo .


::------------------------------------------------------------------------------------------------------
:: deletando arquivos
::        TXT
::------------------------------------------------------------------------------------------------------
echo Deletando arquivos TXT...

::recursivo (/s)
cd %userprofile%\Documents
del *.txt /f /q /s > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)
::deletando arquivos ocultos
del *.txt /f /q /s /a:h > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)

::nao pode incluir subpastas (/s)
cd %userprofile%
del *.txt /f /q > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)
::deletando arquivos ocultos
del *.txt /f /q /a:h > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)

::nao pode incluir subpastas (/s)
cd %userprofile%\.spyder-py3
del *.txt /f /q > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)
::deletando arquivos ocultos
del *.txt /f /q /a:h > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)
echo .

::------------------------------------------------------------------------------------------------------
:: deletando arquivos
::   pastas vazias
::------------------------------------------------------------------------------------------------------
echo  Deletando pastas vazias...

::userprofile = nao rodar, pois podem haver pastas de configuracoes de softwares
::Documents
cd %userprofile%\Documents
for /f "delims=" %%d in ('dir /s /b /ad ^| sort /r') do rd /q "%%d" > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Itens deletados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)
echo .

::------------------------------------------------------------------------------------------------------
::Copiando arquivos nas pastas padrao
::
::------------------------------------------------------------------------------------------------------
echo Copiando arquivos

cd %userprofile%\Desktop

copy /b /v "%CD%\CleanProgFiles.bat" "%userprofile%\Documents\CleanProgFiles.bat" >nul
IF %ERRORLEVEL% EQU 0 (echo 	Arquivos copiados com sucesso!) ELSE (echo 	Ocorreu algum erro...)
copy /b /v "%CD%\CleanProgFiles.bat" "%userprofile%\Downloads\CleanProgFiles.bat" >nul
IF %ERRORLEVEL% EQU 0 (echo 	Arquivos copiados com sucesso!) ELSE (echo 	Ocorreu algum erro...)
copy /b /v "%CD%\CleanProgFiles.bat" "%userprofile%\Pictures\CleanProgFiles.bat" >nul
IF %ERRORLEVEL% EQU 0 (echo 	Arquivos copiados com sucesso!) ELSE (echo 	Ocorreu algum erro...)
copy /b /v "%CD%\CleanProgFiles.bat" "%userprofile%\Music\CleanProgFiles.bat" >nul
IF %ERRORLEVEL% EQU 0 (echo 	Arquivos copiados com sucesso!) ELSE (echo Ocorreu algum erro...)
copy /b /v "%CD%\CleanProgFiles.bat" "%userprofile%\Videos\CleanProgFiles.bat" >nul
IF %ERRORLEVEL% EQU 0 (echo 	Arquivos copiados com sucesso!) ELSE (echo 	Ocorreu algum erro...)
echo .

::------------------------------------------------------------------------------------------------------
::Limpando Lixeira
::  
::------------------------------------------------------------------------------------------------------
echo Limpando Lixeira

rd /q /s %systemdrive%\$Recycle.bin > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Lixeira limpa com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)
echo .

::------------------------------------------------------------------------------------------------------
::Setando Desktop para auto-organizar
::  
::------------------------------------------------------------------------------------------------------
echo  Setando Desktop para auto-organizar

REG ADD "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /V FFLAGS /T REG_DWORD /D 1075839525 /F > nul 2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Dektop setado com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)
echo .

::------------------------------------------------------------------------------------------------------
::Resetando Servicos
::  
::------------------------------------------------------------------------------------------------------
echo  Resetando Servicos

taskkill /f /im explorer.exe > nul >2>nul
start explorer.exe > nul >2>nul
IF %ERRORLEVEL% EQU 0 (echo 	Servicos resetados com SUCESSO!) ELSE (echo 	ATENCAO Ocorreu algum erro !!!)
echo .

echo .
echo ****************************************************
echo ***                                              ***
echo ***       Script Finalizado com SUCESSO.         ***
echo ***                                              ***
echo ***                HORA: %time:~0,5%                   ***
echo ***                                              ***
echo ****************************************************
echo .

pause