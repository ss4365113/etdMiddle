#!/bin/bash

### ====================================================================== ###
##                                                                          ##
##  Run Server configuration Script                      ##
##                                                                          ##
### ====================================================================== ###

### $Id: run.sh 2022-06-22 17:41:41Z jinxin $ ###

DIRNAME=`dirname $0`
APP_HOME=`cd $DIRNAME/..; pwd`

# Setup the JVM
if [ "x$JAVA_HOME" != "x" ]; then
	if [ ! -d "$JAVA_HOME" ]; then
		echo "$JAVA_HOME is invalid!"
		exit 1
	else
	    JAVA="$JAVA_HOME/bin/java"
	fi
else
	echo "Cann't find JAVA_HOME configuration!"
	exit 1
fi

if [ "x$JAVA" = "x" ]; then
    if [ "x$JAVA_HOME" != "x" ]; then
		JAVA="$JAVA_HOME/bin/java"
    else
		JAVA="$JAVA_HOME/bin/java"
    fi
fi



AUTH_CLASSPATH=$AUTH_CLASSPATH:$APP_HOME/conf
MAINJAR=$APP_HOME/drain_consumer.jar

JAVA_OPTS="-server -Xms512m -Xmx1024m"
JAVA_OPTS_ENV="prod"

# main method
$JAVA $JAVA_OPTS  -jar $MAINJAR  --spring.profiles.active=$JAVA_OPTS_ENV >> /log/drain_consumer.xxx.log

