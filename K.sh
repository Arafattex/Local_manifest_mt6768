!/bin/bash

echo "Hi lancelot user just wait and watch "

mkdir outL
export ARCH=arm64
export SUBARCH=arm64
export DTC_EXT=dtc
make O=outL ARCH=arm64 lancelot_defconfig
export PATH="/crave-devspaces/kbuild/32/bin:${PATH}"
export PATH="/crave-devspaces/kbuild/64/bin:${PATH}"
export PATH="/crave-devspaces/kbuild/clang/bin:${PATH}"
make -j$(nproc --all) O=outL \
                      ARCH=arm64 \
                      LD=${PWD}/clang-13/aaa/bin/ld.lld \
		       OBJCOPY=${PWD}/clang-13/aaa/bin/llvm-objcopy \
		       AS=${PWD}/clang-13/aaa/bin/llvm-as \
		       NM=${PWD}/clang-13/aaa/bin/llvm-nm \
		       STRIP=${PWD}/clang-13/aaa/bin/llvm-strip \
		       OBJDUMP=${PWD}/clang-13/aaa/bin/llvm-objdump \
		       READELF=${PWD}/clang-13/aaa/bin/llvm-readelf \
                      CC=${PWD}/clang-13/aaa/bin/clang \
                      CROSS_COMPILE=${PWD}/clang-13/aaa/bin/aarch64-linux-gnu- \
                      CROSS_COMPILE_ARM32=${PWD}/clang-13/aaa/bin/arm-linux-gnueabi- 
