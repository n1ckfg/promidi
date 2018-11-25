@echo off

set TARGET=promidi
set PROCESSING_CORE="C:\Program Files\processing\core\library\core.jar"

cd %~dp0
javac -cp %PROCESSING_CORE% %TARGET%\*.java
move /y %TARGET%\*.class build\%TARGET%\
cd build
jar cvfm ..\%TARGET%.jar manifest.txt %TARGET%\*.class

@pause