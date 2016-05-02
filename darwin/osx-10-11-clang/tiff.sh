#! /bin/sh

if [ ! -f local/lib/libtiff.a ]; then

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
  if [ ! -f libtiff/.git/config ]; then
    git clone https://github.com/vadz/libtiff
  else
    cd libtiff; git pull; cd ..
  fi
  cd libtiff
  ./configure --disable-dependency-tracking --prefix=${ROOT}/local --enable-cxx=0
  make -j 4
  make install

  cd ${ROOT}
fi
