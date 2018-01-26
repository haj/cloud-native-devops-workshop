#!/bin/sh

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

export CONFIG_JVM_ARGS=-Djava.security.egd=file:/dev/./urandom
export JAVA_OPTIONS=$CONFIG_JVM_ARGS

export JAVA_HOME="/usr/java/latest"
export PATH="${PATH}:${JAVA_HOME}/bin"

export SW_BASE="/u01"
export USER_BASE="/u01"

##################################################################

export DEMOS_HOME="/u01/content/cloud-native-devops-workshop"

export M2_HOME="/u01/apache-maven-3.5.0"
export MAVEN_HOME="${M2_HOME}"
export MAVEN_OPTS="-Xmx2048m -Xms512m -Dweblogic.security.SSL.ignoreHostnameVerification=true -Dweblogic.security.TrustKeyStore=DemoTrust -Dweblogic.nodemanager.sslHostNameVerificationEnabled=false"
export PATH="${PATH}:${M2_HOME}/bin"

###################################################################

proxyresult=$(grep -c "export http_proxy" ~/.bashrc -s)

if [ $proxyresult == 1 ]
then
    # bashrc configured for proxy
    echo "Proxy Configured for Oracle Network!!!"
    echo "Proxy Configured for Oracle Network!!!"
else
    # bashrc not configured for proxy
    echo "Proxy NOT SET for Oracle Network!!!"
    echo "Proxy NOT SET for Oracle Network!!!"
fi


JAVA_VERSION=`java -version 2>&1 |awk 'NR==1{ gsub(/"/,""); print $3 }'`
echo "Default Java: $JAVA_VERSION"

echo "Linux root   password : oracle"

if [ -d "/u01/app/oracle/product/11.2.0" ]; then
  # Oracle Express Edition env variables
  . /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh

  echo "Database Information:"
  echo "Database all passwords  : welcome1"
  echo "Oracle database SID :   orcl"
fi

cat ${DEMOS_HOME}/control/files/bashdisplay3.txt
