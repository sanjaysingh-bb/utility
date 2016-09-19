#!/bin/sh

#variables for latest versions
JAVA_VERSION=7u80
MAVEN_VERSION=3.3.9
TOMCAT_VERSION=7.0.70
IDEA_VERSION=14.0.5
GRAILS_VERSION=3.1.11

#install git, vim, pip
sudo apt-get install git
sudo apt-get install vim
sudo apt-get install python-pip

# create install directory
cd /
mkdir -p /opt/software
cd /opt/software

# download tomcat, idea, maven, java, grails, mysql server and client
wget http://redrockdigimark.com/apachemirror/tomcat/tomcat-7/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
wget http://download.jetbrains.com/idea/ideaIU-$IDEA_VERSION.tar.gz
wget http://mirror.fibergrid.in/apache/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz
wget http://download.oracle.com/otn/java/jdk/7u80-b15/jdk-$JAVA_VERSION-linux-x64.tar.gz
wget https://github.com/grails/grails-core/releases/download/v$GRAILS_VERSION/grails-GRAILS_VERSION.zip
sudo apt-get install mysql-server-5.6 mysql-client-5.6

# unzip
tar -xvzf jdk-$JAVA_VERSION-linux-x64.tar.gz
tar -xvzf apache-maven-$MAVEN_VERSION-bin.tar.gz
tar -xvzf apache-tomcat-$TOMCAT_VERSION.tar.gz
tar -xvzf ideaIU-$IDEA_VERSION.tar.gz
tar -xvzf grails-$GRAILS_VERSION.zip

# clean up
rm -f jdk-$JAVA_VERSION-linux-x64.tar.gz
rm -f apache-maven-$MAVEN_VERSION-bin.tar.gz
rm -f apache-tomcat-$TOMCAT_VERSION.tar.gz
rm -f ideaIU-$IDEA_VERSION.tar.gz
rm -f grails-$GRAILS_VERSION.zip

# move folders as extracted folder names follow different convention
mv jdk* jdk-$JAVA_VERSION
mv apache-maven* apache-maven-$MAVEN_VERSION
mv apache-tomcat* apache-tomcat-$TOMCAT_VERSION
mv idea* ideaIU-$IDEA_VERSION
mv grails* grails-$GRAILS_VERSION

# create soft links
ln -s jdk-$JAVA_VERSION java
ln -s apache-maven-$MAVEN_VERSION apache-maven 
ln -s apache-tomcat-$TOMCAT_VERSION apache-tomcat
ln -s ideaIU-$IDEA_VERSION idea
ln -s grails-$GRAILS_VERSION grails

# update environment variables 
echo 'JAVA_HOME="/opt/java"
M3_HOME="/opt/apache-maven"
MAVEN_HOME="$M3_HOME"
M3="$M3_HOME/bin"
CATALINA_HOME="/opt/apache-tomcat"
GRAILS_HOME="/opt/grails"
PATH="$PATH:$M3:$JAVA_HOME/bin:$CATALINA_HOME/bin:$GRAILS_HOME/bin"' >> /etc/environment

# source
source /etc/environment

#redirect to home
cd

# THE END
