@rem !!! Do not change this file in-place, change its copy instead !!!
@rem !!!  Otherwise you will lose your settings after next update  !!!

@echo off

rem Simple "ver" prints empty line before Windows version
rem Use this construction to print just a version info
cmd /d /c ver | "%windir%\system32\find.exe" "Windows"

rem Now we form the command prompt

rem This will start prompt with `User@PC `
set ConEmuPrompt0=$E[m$E[32m$E]9;8;"USERNAME"$E\@$E]9;8;"COMPUTERNAME"$E\$S

rem Followed by colored `Path`
set ConEmuPrompt1=%ConEmuPrompt0%$E[92m$P$E[90m
if NOT "%PROCESSOR_ARCHITECTURE%" == "AMD64" (
  if "%PROCESSOR_ARCHITEW6432%" == "AMD64" if "%PROCESSOR_ARCHITECTURE%" == "x86" (
    rem Use another text color if cmd was run from SysWow64
    set ConEmuPrompt1=%ConEmuPrompt0%$E[93m$P$E[90m
  )
)

rem Carriage return and `$` or `>`
rem Spare `$E[90m` was specially added because of GitShowBranch.cmd
if "%ConEmuIsAdmin%" == "ADMIN" (
  set ConEmuPrompt2=$_$E[90m$$
) else (
  set ConEmuPrompt2=$_$E[90m$G
)

rem Finally reset color and add space
set ConEmuPrompt3=$E[m$S$E]9;12$E\

if /I "%~1" == "/git" goto git
if /I "%~1" == "-git" goto git
goto no_git

:git
call "%~dp0GitShowBranch.cmd" /i
goto :EOF

:no_git
rem Set new prompt
PROMPT %ConEmuPrompt1%%ConEmuPrompt2%%ConEmuPrompt3%

DOSKEY vi=vim
DOSKEY ls=dir
DOSKEY c.=cd..
DOSKEY clear=cls

DOSKEY cdwg=cd ^C:\Users\WinstonG
DOSKEY cdww=cd ^C:\dev\InfrastructureBuild\www
DOSKEY cdin=cd ^C:\dev\InfrastructureBuild
DOSKEY cdej=cd ^C:\dev\InfrastructureBuild\energy-jupiter
DOSKEY cdet=cd ^C:\dev\InfrastructureBuild\energy-titan
DOSKEY cdem=cd ^C:\dev\InfrastructureBuild\energy-mercury
DOSKEY cdeh=cd ^C:\dev\InfrastructureBuild\energy-hephaestus
DOSKEY cdeo=cd ^C:\dev\InfrastructureBuild\energy-odyssey
DOSKEY cdot=cd ^C:\dev\InfrastructureBuild\energy-odyssey

DOSKEY gs=git status
DOSKEY gb=git branch
DOSKEY gp=git ^pull
DOSKEY ga=git ^add
DOSKEY gc=git ^commit
DOSKEY gcm=git commit -m $*
DOSKEY gca=git commit --amend
DOSKEY gd=git ^diff
DOSKEY go=git ^checkout
DOSKEY gotp=go ^team-phoenix
DOSKEY gom=go ^master
DOSKEY gof=go ^feature
DOSKEY gbm=git branch -m
DOSKEY gmb=git ^merge-base
DOSKEY gmbt=git ^merge-base ^team-phoenix ^feature
DOSKEY gmbm=git ^merge-base ^team-phoenix ^feature
DOSKEY gri=git ^rebase ^-i

DOSKEY gl=git ^log
DOSKEY gl3=git ^log ^-3
DOSKEY gl5=git ^log ^-5
DOSKEY gh=git ^hist
DOSKEY gh3=git ^hist ^-3
DOSKEY gh5=git ^hist ^-5

DOSKEY gk=gitk
DOSKEY gka=gitk ^--all&

DOSKEY got=git
DOSKEY get=git

DOSKEY h=doskey /history
DOSKEY ps=tasklist $*
DOSKEY ls=dir /a /x $*
DOSKEY lt=dir /a /x /od $*
DOSKEY d=cd %USERPROFILE%\desktop
DOSKEY p=ping yahoo.com -n 1 || ping 8.8.8.8 -n 1
DOSKEY findgrep=dir /s /a /b \*$1*
DOSKEY n=notepad $*
DOSKEY e=explorer .
rem DOSKEY cya=shutdown /f /s /t 0
rem DOSKEY reboot=shutdown /f /r /t 0
DOSKEY pspath=wmic process get processid,parentprocessid,executablepath
DOSKEY psg=tasklist | findstr /i $1
DOSKEY nsg=netstat -nao | findstr /i $1
DOSKEY nd=mkdir $1 $t cd $1
DOSKEY cp=copy $*
DOSKEY mv=move $*
DOSKEY ifconfig=ipconfig $*
DOSKEY macros=doskey /macros
DOSKEY ip=powershell -noni -nop -ep bypass -c "$c=new-object System.Net.WebClient;$e=$c.DownloadString('http://icanhazip.com');write-host $e"
DOSKEY ..=cd ..
DOSKEY home=cd %USERPROFILE%