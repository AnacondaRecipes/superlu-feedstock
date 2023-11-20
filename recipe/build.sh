#!/usr/bin/env bash

mkdir build
cd build

# enable_blaslib=OFF so OpenBLAS will be found instead of the built-in BLAS

cmake ${CMAKE_ARGS} .. \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DCMAKE_INSTALL_LIBDIR="${PREFIX}/lib" \
    -DCMAKE_C_FLAGS="${CMAKE_C_FLAGS} -fPIC" \
    -DBUILD_SHARED_LIBS=ON \
    -Denable_blaslib=OFF \
    -Denable_single=ON \
    -Denable_double=ON \
    -Denable_complex16=ON \
    -Denable_complex=ON \
    -Denable_tests=ON \
    -Denable_doc=OFF \
    -Denable_matlab_mex=OFF

make
make test
make install
