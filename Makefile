# Quick and dirty and relatively generic Makefile
# Generated by generate_makefile.sh
# By Joel Savitz <jsavitz@redhat.com>

CC 	= gcc
CFLAGS  = -g -Wall -Werror -std=gnu11
LFLAGS  = -fPIC -shared
OBJECTS = rubix_cube.o
TESTOBJ = test_rubix_cube.o
TESTBIN	= test
LIBNAME = librubix.so
SRCDIR  = src
OBJDIR  = obj

all: $(OBJDIR) $(OBJECTS)
	$(CC) $(LFLAGS) $(CFLAGS) $(patsubst %.o,$(OBJDIR)/%.o, $(OBJECTS)) -o $(LIBNAME)

test: $(OBJDIR) $(OBJECTS) $(TESTOBJ)
	$(CC) $(CFLAGS) $(patsubst %.o,$(OBJDIR)/%.o, $(OBJECTS)) $(patsubst %.o,$(OBJDIR)/%.o, $(TESTOBJ)) -o $(TESTBIN)

%.o: %.c
	$(CC) $(CFLAGS) -c $^ -o 
.PHONEY: clean $(OBJDIR)
$(OBJDIR):
	mkdir $(OBJDIR)

clean:
	rm -rf $(TESTBIN) $(LIBNAME) $(OBJDIR)

%.o: $(SRCDIR)/%.c
	$(CC) $(LFLAGS) $(CFLAGS) -c $^ -o $(OBJDIR)/$@

