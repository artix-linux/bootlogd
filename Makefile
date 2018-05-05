SYSCONFDIR = /etc
PREFIX ?= /usr
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man/man8
LOGDIR = $(SYSCONFDIR)/logrotate.d

BIN = bootlogd
MAN = bootlogd.8
LOG = logrotate.bootlogd

CFLAGS	?= -ansi -O2 -fomit-frame-pointer -fstack-protector
override CFLAGS += -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE
override CFLAGS += $(shell getconf LFS_CFLAGS)
STATIC	=
LDLIBS += -lutil $(STATIC)

all: $(BIN)

install:
	install -d $(DESTDIR)$(LOGDIR)
	install -m644 $(LOG) $(DESTDIR)$(LOGDIR)/bootlogd

	install -d $(DESTDIR)$(BINDIR)
	install -o root -g root -m755 $(BIN) $(DESTDIR)$(BINDIR)

	install -d $(DESTDIR)$(MANDIR)
	install -m644 $(MAN) $(DESTDIR)$(MANDIR)

clean:
	-rm -f bootlogd

.PHONY: all install clean
