#!/bin/bash -x
#
# Copyright (c) 2019 Oracle and/or its affiliates. All rights reserved.
#
# This program and the accompanying materials are made available under the
# terms of the Eclipse Public License v. 2.0, which is available at
# http://www.eclipse.org/legal/epl-2.0.
#
# This Source Code may also be made available under the following Secondary
# Licenses when the conditions for such availability set forth in the
# Eclipse Public License v. 2.0 are satisfied: GNU General Public License,
# version 2 with the GNU Classpath Exception, which is available at
# https://www.gnu.org/software/classpath/license.html.
#
# SPDX-License-Identifier: EPL-2.0 OR GPL-2.0 WITH Classpath-exception-2.0


if [ -z "$ANT_HOME" ]; then
  export ANT_HOME=/usr/share/ant/
fi

if [ -z "$JAVA_HOME" ]; then
  export JAVA_HOME=/opt/jdk1.8.0_171
fi

export PATH=$JAVA_HOME/bin:$ANT_HOME/bin:$PATH

cd $WORKSPACE
export BASEDIR=`pwd`

if [ -z "$GF_HOME" ]; then
  export GF_HOME=$BASEDIR
fi

echo "ANT_HOME=$ANT_HOME"
echo "export JAVA_HOME=$JAVA_HOME"
echo "export MAVEN_HOME=$MAVEN_HOME"
echo "export PATH=$PATH"

mkdir -p ${HOME}/.m2

cd $WORKSPACE
WGET_PROPS="--progress=bar:force --no-cache"
if [ -z "$JAF_BUNDLE_URL" ];then
  export JAF_BUNDLE_URL=http://central.maven.org/maven2/com/sun/activation/jakarta.activation/1.2.1/jakarta.activation-1.2.1.jar
fi
#wget $WGET_PROPS $JAF_BUNDLE_URL -O jakarta.activation.jar

cd $BASEDIR
if [ -z "$GF_BUNDLE_URL" ]; then
  echo "Using default url for GF bundle: $DEFAULT_GF_BUNDLE_URL"
  export GF_BUNDLE_URL=$DEFAULT_GF_BUNDLE_URL
fi
export TCK_ROOT=$WORKSPACE
#wget $WGET_PROPS $GF_BUNDLE_URL -O latest-glassfish.zip
#getting jaxb-ri which is needed to build the JAXB TCK
wget $WGET_PROPS http://central.maven.org/maven2/com/sun/xml/bind/jaxb-ri/2.3.2/jaxb-ri-2.3.2.zip -O jaxb-ri.zip
unzip -o jaxb-ri.zip
wget $WGET_PROPS https://repository.ow2.org/nexus/service/local/repositories/snapshots/content/org/ow2/asm/asm-commons/7.0-SNAPSHOT/asm-commons-7.0-20181027.133601-5.jar -O asm-commons-7.0.jar
wget $WGET_PROPS https://repository.ow2.org/nexus/service/local/repositories/snapshots/content/org/ow2/asm/asm/7.0-SNAPSHOT/asm-7.0-20181027.133552-5.jar -O asm-7.0.jar
#unzip -o latest-glassfish.zip
#ls -l $GF_HOME/glassfish5/glassfish/

#if [ ! -z "$GF_VERSION_URL" ]; then
#  wget --progress=bar:force --no-cache $GF_VERSION_URL -O glassfish.version
#  cat glassfish.version
#fi
which make
make -version
which ksh
ksh -version
which awk
#awk -version

export TCK_ROOT=$BASEDIR
sed -i s#^AWK*=*.*#AWK=/usr/bin/awk#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^BASENAME*=*.*#BASENAME=/usr/bin/basename#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^CHMOD*=*.*#CHMOD=/usr/bin/chmod#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^CAT*=*.*#CAT=/usr/bin/cat#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^CP*=*.*#CP=/usr/bin/CP#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^DATE*=*.*#DATE=/usr/bin/date#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^DIRNAME*=*.*#DIRNAME=/usr/bin/dirname#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^EGREP*=*.*#EGREP=/usr/bin/egrep#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^FIND*=*.*#FIND=/usr/bin/find#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^GREP*=*.*#GREP=/usr/bin/grep#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^KSH*=*.*#KSH=/usr/bin/ksh#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^LS*=*.*#LS=/usr/bin/ls#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^MKDIR*=*.*#MKDIR=/usr/bin/mkdir#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^MV*=*.*#MV=/usr/bin/mv#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^NAWK*=*.*#NAWK=/usr/bin/awk#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^PRINTF*=*.*#PRINTF=/usr/bin/printf#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^PS*=*.*#PS=/usr/bin/ps#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^PWD*=*.*#PWD=/usr/bin/pwd#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^RM*=*.*#RM='/usr/bin/rm -rf'#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^SED*=*.*#SED=/usr/bin/sed#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^SORT*=*.*#SORT=/usr/bin/sort#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^SPLIT*=*.*#SPLIT=/usr/bin/split#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^TAR*=*.*#TAR=/usr/bin/tar#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^TEE*=*.*#TEE=/usr/bin/tee#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^TEST*=*.*#TEST=/usr/bin/test#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^TR*=*.*#TR=/usr/bin/tr#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^PERL*=*.*#PERL=/usr/bin/perl#g $WORKSPACE/jaxb-tck/build/Defs.SFBay.mk
sed -i s#^ZIP*=*.*#ZIP=/usr/bin/zip#g $WORKSPACE/jaxb-tck/build/Defs.SFBay.mk
sed -i s#^UNZIP*=*.*#UNZIP=/usr/bin/unzip#g $WORKSPACE/jaxb-tck/build/Defs.SFBay.mk

sed -i s#^GENERAL_JAVAHOME*=*.*#GENERAL_JAVAHOME=/opt/jdk1.8.0_191#g $WORKSPACE/jaxb-tck/build/Defs.SFBay.mk
sed -i s#^PWD*=*.*#PWD=/usr/bin/pwd#g $WORKSPACE/jaxb-tck/build/Defs.SFBay.mk
sed -i s#^JAXB_HOME*=*.*#JAXB_HOME=/home/jenkins/workspace/jaxb-tck_master/jaxb-ri#g $WORKSPACE/jaxb-tck/build/Defs.SFBay.mk
sed -i s#^JAXB_20_RI_HOME*=*.*#JAXB_20_RI_HOME=/home/jenkins/workspace/jaxb-tck_master/jaxb-ri#g $WORKSPACE/jaxb-tck/build/Defs.SFBay.mk
sed -i s#^JAVAHOME_6*=*.*#JAVAHOME_6=/opt/jdk1.8.0_191#g $WORKSPACE/jaxb-tck/build/Defs.SFBay.mk
sed -i s#^SIGTEST_DIST*=*.*#SIGTEST_DIST=/home/jenkins/workspace/jaxb-tck_master/jaxb-tck#g $WORKSPACE/jaxb-tck/build/Defs.SFBay.mk

sed -i s#^JAVATEST_JAR_LOC*=*.*#JAVATEST_JAR_LOC=/home/jenkins/workspace/jaxb-tck_master/jaxb-tck/lib#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^SIGTESTDEV_JAR_LOC*=*.*#SIGTESTDEV_JAR_LOC=/home/jenkins/workspace/jaxb-tck_master/jaxb-tck/lib#g $WORKSPACE/jaxb-tck/build/Defs.mk
sed -i s#^ASM_JAR_LOCATION*=*.*#ASM_JAR_LOCATION=/home/jenkins/workspace/jaxb-tck_master#g $WORKSPACE/jaxb-tck/build/Defs.mk

make REPOSITORIES=$TCK_ROOT/xml_schema clean
make REPOSITORIES=$TCK_ROOT/xml_schema nightly

echo "jaxb-tck is coming soon" > filename.txt
zip -r jaxb-tck-2.3_latest.zip filename.txt
mkdir -p ${WORKSPACE}/bundles
chmod 777 ${WORKSPACE}/*.zip
for entry in `ls jaxb*.zip`; do
  #date=`echo "$entry" | cut -d_ -f2`
  #strippedEntry=`echo "$entry" | cut -d_ -f1`
  #echo "copying ${WORKSPACE}/$entry to ${WORKSPACE}/bundles/${strippedEntry}_latest.zip"
  #cp ${WORKSPACE}/$entry ${WORKSPACE}/bundles/${strippedEntry}_latest.zip
  #chmod 777 ${WORKSPACE}/bundles/${strippedEntry}_latest.zip
  cp ${WORKSPACE}/$entry ${WORKSPACE}/bundles/
done