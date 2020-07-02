rm -rf xsan/build
rm -rf xasan/build
rm -rf gasan/build
rm -rf llvm_instr/build
rm -rf finj/build
mkdir xsan/build
mkdir xasan/build
mkdir gasan/build
mkdir llvm_instr/build
mkdir finj/build
cd xsan/build && cmake .. && make
cd /root/xsan
cd xasan/build && cmake .. && make
cd /root/xsan
cd gasan/build && cmake .. && make
cd /root/xsan
cd llvm_instr/build && cmake .. && make
cd /root/xsan
cd finj/build && cmake .. && make
cd /root/xsan

rm -rf bin
mkdir bin
clang tools/cov.c -o bin/cov
clang tools/reset.c -o bin/reset
clang tools/error_report.c -o bin/error_report
clang tools/get_fault_site.c -o bin/get_fault_site
clang tools/reset_fault.c -o bin/reset_fault
clang tools/set_fault.c -o bin/set_fault
clang tools/test.c -o bin/test
clang tools/trigger.c -o bin/trigger

#gcc -fPIC -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes  -O2 -fomit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF .xencov.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE   -Werror -include $XenPath/tools/misc/../../tools/config.h -I$XenPath/tools/misc/../../tools/libs/evtchn/include -I$XenPath/tools/misc/../../tools/include -I$XenPath/tools/misc/../../tools/libxc/include -I$XenPath/tools/misc/../../tools/libs/toollog/include -I$XenPath/tools/misc/../../tools/include -I$XenPath/tools/misc/../../tools/libs/foreignmemory/include -I$XenPath/tools/misc/../../tools/include -I$XenPath/tools/misc/../../tools/libs/devicemodel/include -I$XenPath/tools/misc/../../tools/include -I$XenPath/tools/misc/../../tools/include -D__XEN_TOOLS__ -I$XenPath/tools/misc/../../tools/include -I$XenPath/tools/misc/../../tools/xenstore/include -I$XenPath/tools/misc/../../tools/include  -c -o bin/cov.o tools/cov.c



#gcc   -o bin/cov bin/cov.o  -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/toollog  -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/toolcore -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/evtchn  -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/toollog  -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/toolcore -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/gnttab  -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/toolcore -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/call  -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/toolcore -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/foreignmemory  -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/toollog  -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/toolcore  -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/devicemodel $XenPath/tools/misc/../../tools/libxc/libxenctrl.so


#gcc -fPIC -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes  -O2 -fomit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF .xencov.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE   -Werror -include $XenPath/tools/misc/../../tools/config.h -I$XenPath/tools/misc/../../tools/libs/evtchn/include -I$XenPath/tools/misc/../../tools/include -I$XenPath/tools/misc/../../tools/libxc/include -I$XenPath/tools/misc/../../tools/libs/toollog/include -I$XenPath/tools/misc/../../tools/include -I$XenPath/tools/misc/../../tools/libs/foreignmemory/include -I$XenPath/tools/misc/../../tools/include -I$XenPath/tools/misc/../../tools/libs/devicemodel/include -I$XenPath/tools/misc/../../tools/include -I$XenPath/tools/misc/../../tools/include -D__XEN_TOOLS__ -I$XenPath/tools/misc/../../tools/include -I$XenPath/tools/misc/../../tools/xenstore/include -I$XenPath/tools/misc/../../tools/include  -c -o bin/reset tools/reset.c



#gcc   -o bin/reset  bin/reset.o  -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/toollog  -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/toolcore -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/evtchn  -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/toollog  -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/toolcore -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/gnttab  -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/toolcore -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/call  -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/toolcore -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/foreignmemory  -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/toollog  -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/toolcore  -Wl,-rpath-link=$XenPath/tools/misc/../../tools/libs/devicemodel $XenPath/tools/misc/../../tools/libxc/libxenctrl.so


cp bin/* /root/
