CC=gcc
CFLAGS=-lm
TARGET=snake.out
SRC=src/snake.c

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(SRC) $(CFLAGS) -o $(TARGET)
	chmod +x $(TARGET)

clean:
	rm -f $(TARGET)

# Cross-compilation for Windows ARM64
TARGET_WIN=snake.exe
CC_WIN=clang
CFLAGS_WIN=--target=aarch64-windows-gnu --sysroot=/opt/llvm-mingw -fuse-ld=lld -nostdlib /opt/llvm-mingw/aarch64-w64-mingw32/lib/crt2.o /opt/llvm-mingw/aarch64-w64-mingw32/lib/crtbegin.o -L/opt/llvm-mingw/lib -L/opt/llvm-mingw/aarch64-w64-mingw32/lib -lclang_rt.builtins-aarch64 -lmingw32 -lmingwex -lmsvcrt -ladvapi32 -lshell32 -luser32 -lkernel32 /opt/llvm-mingw/aarch64-w64-mingw32/lib/crtend.o

win: $(TARGET_WIN)

$(TARGET_WIN): $(SRC)
	$(CC_WIN) $(SRC) $(CFLAGS_WIN) -o $(TARGET_WIN)
