@echo off
REM Install TVO.
REM Assumes this is being run from the directory where TVO got unpacked to.

REM Where Vim got installed to
set VIM=c:\vim
set VIMVERSION=62

REM where TVO gets copied to
set TVO=%VIM%\vimfiles

mkdir >NUL %TVO%\bitmaps
mkdir >NUL %TVO%\bitmaps\TVO
mkdir >NUL %TVO%\doc
mkdir >NUL %TVO%\syntax

FOR /F "usebackq" %%I IN (`cmd /v/c type MANIFEST`) DO (
set S=%%~fI
set D=%%~dpI
cmd /c xcopy >NUL /Q/Y %%S:%CD%\=%% %TVO%%%D:%CD%=%%
)

%VIM%\vim%VIMVERSION%\gvim.exe -y -u %TVO%\easy.vimrc -U %TVO%\easy.gvimrc -c ":helptags %TVO%\doc" %TVO%\README.otl
