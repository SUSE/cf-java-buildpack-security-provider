#!/usr/bin/env sh

set -e -u

[[ -d $PWD/maven && ! -d $HOME/.m2 ]] && ln -s $PWD/maven $HOME/.m2

cd java-buildpack-security-provider
./mvnw -Dmaven.test.skip=true package

mkdir -p ../output
cp $(ls target/java-buildpack-container-security-provider-*.jar | grep -v sources) ../output/
echo $(cat target/maven-archiver/pom.properties  | grep version= | cut -d= -f2) > ../output/version
