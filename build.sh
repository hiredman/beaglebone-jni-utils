#!/bin/sh

PROJECT_NAME="beaglebone-mmap"
VERSION=1.0.0-SNAPSHOT
JAVAC=$JAVA_HOME/bin/javac
JAR=$JAVA_HOME/bin/jar
JAVAH=$JAVA_HOME/bin/javah
INCLUDE=$JAVA_HOME/include
ARCH=$(uname -s|tr A-Z a-z)

# clean up
find $PWD -name \*.class -name \*.so -name \*.h -name \*.jar -name \*.xml -delete

# compile java files
find $PWD -type f -name \*.java | xargs $JAVAC

# generate jni headers
$JAVAH -jni -classpath . -o B.h a.B

# compile jni code
cc -shared -I$INCLUDE -I$INCLUDE/$ARCH/ B.c -o libB.so

# generate pom
cat > pom.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<project>
  <modelVersion>4.0.0</modelVersion>
  <groupId>$PROJECT_NAME</groupId>
  <artifactId>$PROJECT_NAME</artifactId>
  <version>$VERSION</version>
  <name>$PROJECT_NAME</name>
</project>

EOF

# jar it all up
$JAR -cf $PROJECT_NAME-$VERSION.jar *
