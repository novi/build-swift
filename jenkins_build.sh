#!/bin/bash
#
# This script is specifically for using with Jenkins at 
# http://swift-arm.ddns.net
#
INSTALL_DIR=${WORKSPACE}/install
TESTS=$1

./swift/utils/build-script -R $TESTS --llbuild --lldb --foundation --xctest --build-subdir=buildbot_linux -- --install-swift --install-lldb --install-llbuild --install-foundation --install-swiftpm --install-xctest --install-prefix=/opt/swift/swift-2.2/usr --install-destdir="$INSTALL_DIR" --swift-install-components="autolink-driver;compiler;clang-builtin-headers;stdlib;sdk-overlay;license" --build-swift-static-stdlib --skip-test-lldb --reconfigure

# preset style, we aren't using this right now
#ARCH=`arch`
#PACKAGE=${WORKSPACE}/swift.tar.gz
#LSB_RELEASE=`lsb_release -rs  | tr -d .`
#rm -rf $INSTALL_DIR $PACKAGE
#if [[ $ARCH =~ armv7 ]]; then
#echo "+ Building for ARM"
#echo ./swift/utils/build-script --preset=buildbot_linux_armv7 install_destdir="${INSTALL_DIR}" installable_package="${PACKAGE}"
#./swift/utils/build-script --preset=buildbot_linux_armv7 install_destdir="${INSTALL_DIR}" installable_package="${PACKAGE}"
#else
#echo "+ Building for x86"
#./swift/utils/build-script --preset=buildbot_linux_${LSB_RELEASE} install_destdir=${INSTALL_DIR} installable_package=${PACKAGE}
#fi