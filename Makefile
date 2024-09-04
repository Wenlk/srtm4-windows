C99 = gcc -std=c99
CFLAGS = -g -O3 -DNDEBUG -DDONT_USE_TEST_MAIN
CPPFLAGS = -g -O3 -fpermissive -DNDEBUG -DDONT_USE_TEST_MAIN
LDLIBS = -lstdc++ -lz -lm

# 设置路径
LIBTIFF_ROOT := C:/Users/10403/.conda/pkgs/libtiff-4.5.1-hd77b12b_0/Library
INCLUDE_PATH := $(LIBTIFF_ROOT)/include
LIB_PATH := $(LIBTIFF_ROOT)/lib
BIN_PATH := $(LIBTIFF_ROOT)/bin

# 编译器和链接器选项
CFLAGS += -I$(INCLUDE_PATH)  # 添加 include 目录到头文件搜索路径
LDFLAGS += -L$(LIB_PATH) -Wl,-rpath,$(BIN_PATH)  # 添加 lib 目录到库文件搜索路径，并设置运行时路径
LDLIBS += -ltiff  # 链接 libtiff 库

default: bin bin/srtm4 bin/srtm4_which_tile

src/Geoid.o: src/Geoid.cpp
	$(CXX) $(CPPFLAGS) -c $^ -o $@

src/geoid_height_wrapper.o: src/geoid_height_wrapper.cpp
	$(CXX) $(CPPFLAGS) -c $^ -o $@

bin/srtm4: src/srtm4.c src/Geoid.o src/geoid_height_wrapper.o
	$(C99) $(CFLAGS) -DMAIN_SRTM4 $^ $(LDFLAGS) $(LDLIBS) -o $@

bin/srtm4_which_tile: src/srtm4.c src/Geoid.o src/geoid_height_wrapper.o
	$(C99) $(CFLAGS) -DMAIN_SRTM4_WHICH_TILE $^ $(LDFLAGS) $(LDLIBS) -o $@

bin:
	mkdir bin

clean:
	-rm -f -r bin
	-rm -f src/*.o
