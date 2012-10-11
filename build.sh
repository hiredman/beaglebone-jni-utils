#!/bin/sh

JAVAC=$JAVA_HOME/bin/javac
JAVAH=$JAVA_HOME/bin/javah
INCLUDE=$JAVA_HOME/include

find $PWD/ -name \*.class -name \*.so -name \*.h -name \*.jar -delete

find $PWD -type f -name \*.java | xargs $JAVAC

$JAVAH -jni -classpath . -o B.h a.B

cc -shared -I$INCLUDE -I$INCLUDE/linux/ B.c -o libB.so


