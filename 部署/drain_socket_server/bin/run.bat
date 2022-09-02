@echo off
rem -------------------------------------------------------------------------
rem Run Server Bootstrap Script for Win64
rem -------------------------------------------------------------------------

rem $Id: run.bat 001 2022-08-25 17:40:26Z  jinxin $

pushd %DIRNAME%..
set APP_HOME=%CD%
popd

rem Java virtual machine variables defined ================================== 

set MAIN_JAR_NAME=../drain-socket-server.jar

set JAVA_OPTS= ' -server -Xms512m -Xmx2048m'

set JAVA_OPTS_ENV= 'prod'

rem =========================================================================


set "RUNJAR=%APP_HOME%/%MAIN_JAR_NAME%"
SET "CLASSPATH=%CLASSPATH%;%APP_HOME%/conf"

if not "%JAVA_HOME%" == "" goto HAVE_JAVA_HOME

set JAVA=java

echo JAVA_HOME is not set.  Unexpected results may occur.
echo Set JAVA_HOME to the directory of your local JDK to avoid this message.
goto end

:HAVE_JAVA_HOME

set JAVA=%JAVA_HOME%\bin\java

echo ===============================================================================
echo.
echo   Run Bootstrap Environment
echo.
echo ===============================================================================
echo.

"%JAVA%"    -jar "%MAIN_JAR_NAME%"  "%JAVA_OPTS%" --spring.profiles.active="%JAVA_OPTS_ENV%"

:end
pause
