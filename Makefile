# Quick and dirty and relatively generic Makefile
# Generated by generate_makefile.sh
# By Joel Savitz <jsavitz@redhat.com>

CC 	= gcc
CFLAGS  = -g -Wall -Werror -std=gnu11
OBJECTS = test_rubix_cube.o rubix_cube.o
BIN	= test
SRCDIR  = src
OBJDIR  = obj

all: $(OBJDIR) $(OBJECTS)
	$(CC) $(CFLAGS) $(patsubst %.o,$(OBJDIR)/%.o, $(OBJECTS)) -o $(BIN)

%.o: %.c
	$(CC) $(CFLAGS) -c $^ -o 
.PHONEY: clean $(OBJDIR)
$(OBJDIR):
	mkdir $(OBJDIR)

clean:
	rm -rf $(BIN) $(OBJDIR)

	


%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c $^ -o $(OBJDIR)/$@ 

