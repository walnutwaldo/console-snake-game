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
