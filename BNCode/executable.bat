@echo off
title BNCode by xmvks
if exist .\*.p goto login
if not exist .\*.p goto freshsetupconfig

:freshsetupconfig
echo Hello! Welcome in BNCode. BNC (Short BNCode) has advanced batch and powershell commands
echo turned into simple words. My goal is to make this shell user-friendly as i can.
echo Have fun! ~xmvks
set /p "pwd=Enter Your New Password > "
echo FNC-Configured-on-%time%-%date%>fnc.c
echo UserShellPass>%pwd%.p
attrib +h +s .\%pwd%.p
attrib +h +s .\fnc.c
goto login

:login
cls
echo Welcome to BNCode. Please Log in. [Current User : %username%]
set /p "lgp=Enter password for %username% > "
if exist %lgp%.p goto firstrun
if not exist %lgp%.p goto fail

:fail
start .\data\edb\1-1a.vbs
goto login

:firstrun
echo BNCODE CONSOLE BY XMVKS (C)2025
echo LIST COMMANDS ON "cmh"
echo.
set /p "c=bncodeprompt\%username%~# "
if exist .\ccs\%c%.c goto xcuter_integrated

:xcuter_integrated
if %c%==clog goto cg
if %c%==cmode goto cmodef
if %c%==cmh goto commandlist

:cmd
set /p "c=bncodeprompt\%username%~# "
if exist .\ccs\%c%.c goto xcuter_integrated

:cg
set /p "cgarg1=Log Message > "
echo %cgarg1%
echo.
goto cmd

:cmodef
echo To exit CMODE type "goto cmd"
set /p "m=bncodeprompt\%username%\cmodeutils~# "
%m%
echo.
goto cmode

:cmode
set /p "m=bncodeprompt\%username%\cmodeutils~# "
%m%
echo.
goto cmode

:cmh
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo +clog - Sends a console log message.                        + 
echo +cmode - Enters CMD Mode where you can use normal commands. +
echo +goto cmd - Exits CMD Mode.                                 +
echo +cmh - Shows this list.                                     +
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
goto cmd