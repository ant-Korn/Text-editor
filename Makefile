src_dir:=src
build_dir:=build
bin_dir:=bin
CFLAGS:=-Wall -Wextra -pedantic -std=c99

SRC:=$(wildcard $(src_dir)/*.c)
OBJS:=$(patsubst $(src_dir)/%.c,$(build_dir)/%.o,$(SRC))

$(build_dir)/%.o: $(src_dir)/%.c
	$(CC) -c -o $@ $< $(CFLAGS)

text_editor: $(OBJS)
	$(CC) -o $(bin_dir)/$@ $^ $(CFLAGS)
