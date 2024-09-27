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
                      LD=ld.lld \
		       OBJCOPY=llvm-objcopy \
		       AS=llvm-as \
		       NM=llvm-nm \
		       STRIP=llvm-strip \
		       OBJDUMP=llvm-objdump \
		       READELF=llvm-readelf \
                      CC=clang \
                      CROSS_COMPILE=aarch64-linux-gnu- \
                      CROSS_COMPILE_ARM32=arm-linux-gnueabi- 
