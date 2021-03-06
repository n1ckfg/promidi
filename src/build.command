#!/bin/bash

TARGET="promidi"
PROCESSING_CORE="/Applications/Processing/Processing3.app/Contents/Java/core.jar"

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

cd $DIR

javac -cp $PROCESSING_CORE $TARGET/*.java
mv $TARGET/*.class build/$TARGET/
cd build
jar cvfm ../$TARGET.jar manifest.txt $TARGET/*.class
