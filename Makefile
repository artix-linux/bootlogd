PREFIX ?= /usr
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man/man8

BIN = bootlogd
MAN = bootlogd.8

all:
	$(CC) -ansi -O2 -fomit-frame-pointer -W -Wall -D_GNU_SOURCE bootlogd.c -o bootlogd $(LDFLAGS) -lutil

install:
	install -d $(DESTDIR)$(BINDIR)
	install -m644 $(BIN) $(DESTDIR)$(BINDIR)

	install -d $(DESTDIR)$(MANDIR)
	install -m644 $(MAN) $(DESTDIR)$(MANDIR)

clean:
	-rm -f bootlogd

.PHONY: all install clean
