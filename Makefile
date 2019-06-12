src_dir:=src
build_dir:=build
bin_dir:=bin
CFLAGS:=-Wall -Wextra -pedantic -std=c99

SRC:=$(wildcard $(src_dir)/*.c)
OBJS:=$(patsubst $(src_dir)/%.c,$(build_dir)/%.o,$(SRC))

all: text_editor

$(build_dir)/%.o: $(src_dir)/%.c $(build_dir)
	$(CC) -c -o $@ $< $(CFLAGS)

text_editor: $(OBJS) $(bin_dir)
	$(CC) -o $(bin_dir)/$@ $< $(CFLAGS)

$(build_dir):
	mkdir $(build_dir)

$(bin_dir):
	mkdir $(bin_dir)
