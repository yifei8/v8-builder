VERSION=$1

sudo apt-get install -y \
    pkg-config \
    git \
    subversion \
    curl \
    wget \
    build-essential \
    python \
    xz-utils \
    zip

git config --global user.name "V8 Android Builder"
git config --global user.email "v8.android.builder@localhost"
git config --global core.autocrlf false
git config --global core.filemode false
git config --global color.ui true


cd ~
echo "=====[ Getting Depot Tools ]====="	
git clone -q https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH=$(pwd)/depot_tools:$PATH
gclient


mkdir v8
cd v8

echo "=====[ Fetching V8 ]====="
fetch v8
echo "target_os = ['android']" >> .gclient
cd v8
./build/install-build-deps-android.sh
git checkout $VERSION
gclient sync


#echo "=====[ Building V8 ]====="
#python3 ./tools/dev/v8gen.py arm64.release -vv -- '
#target_os = "android"
#target_cpu = "arm64"
#v8_target_cpu = "arm64"
#is_component_build = false
#use_custom_libcxx = false
#v8_enable_i18n_support = false
#v8_use_external_startup_data = false
#v8_symbol_level = 0
#v8_static_library = true
#v8_monolithic = true
#'

#ninja -C out.gn/arm64.release -t clean
#ninja -C out.gn/arm64.release v8_monolith
#cp ./third_party/android_ndk/sources/cxx-stl/llvm-libc++/libs/arm64-v8a/libc++_shared.so ./out.gn/arm64.release

#D:\Android\Sdk\ndk\16.1.4479499\sources\cxx-stl\llvm-libc++\libs\armeabi

echo "=====[ Building ls dir ]====="

echo "ls root"
ls -l
echo "cd third_party"
ls ./v8/third_party -l
echo "cd android_platform"
ls ./android_platform -l
echo "cd android_sdk"
ls ./android_sdk -l

#abseil-cpp
#android_platform
#android_sdk
#android_toolchain
#catapult
#clang-format
#colorama
#cpu_features
#depot_tools
#fp16
#fuzztest
#glibc
#google_benchmark_chrome
#googletest
#highway
#icu
#inspector_protocol
#jinja2
#jsoncpp
#libc++
#libc++abi
#libunwind
#llvm-build
#logdog
#markupsafe
#ninja
#perfetto
#protobuf_chrome
#re2
#requests
#siso
#test262-harness
#v8
#wasm-api
#zlib