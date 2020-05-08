#±/bin/bash
set -e

ROOT=${PWD}
PS4SDK=$ROOT/toolchain

wget https://github.com/orbisdev/orbis-libs-gen/releases/latest/download/lib_s.tar.gz

tar -zxvf lib_s.tar.gz

cd lib_s

for i in *.S
do
    clang --target=x86_64-scei-ps4 -shared -nostdlib -o  ${i%.S}.so $i
    # echo "clang --target=x86_64-scei-ps4 -shared -nostdlib -o  ${i%.S}.so $i"
done