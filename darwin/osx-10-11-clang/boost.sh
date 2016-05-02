#! /bin/sh

if [ ! -f local/lib/libboost_python.a ]; then
  if [ ! -f prereq ]; then
    mkdir -p prereq
  fi
  if [ ! -f local/lib ]; then
    mkdir -p local/lib
  fi
  if [ ! -f local/bin ]; then
    mkdir -p local/bin
  fi
  if [ ! -f local/include ]; then
    mkdir -p local/include
  fi

  ROOT=$(pwd)
  cd prereq
  if [ ! -f boost-build-club/.git/config ]; then
     git clone https://github.com/meshula/boost-build-club.git
  else
    cd boost-build-club; git pull; cd ..
  fi
  curl -L -o boost.tgz http://downloads.sourceforge.net/sourceforge/boost/boost_1_60_0.tar.gz
  tar -zxf boost.tgz
  cd boost_1_60_0
  cp ../boost-build-club/* .
  chmod 744 build-OSX.sh;./build-OSX.sh
  cp stage-OSX/lib/* ${ROOT}/local/lib
  cp -R boost ${ROOT}/local/include/boost
  cd ${ROOT}
fi
