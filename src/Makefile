prefix = /usr/local
bindir = $(prefix)/sbin


CFLAGS +=-g -I$(STAGING_DIR)/usr/include/libnl3
LIBS=-lnl-3 -lnl-genl-3

OBJECTS=main.o util.o

all: wifi-information-collector

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $^

wifi-information-collector: $(OBJECTS)
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

clean:
	rm -f $(OBJECTS) wifi-information-collector

distclean: clean

install: all
	install -d $(DESTDIR)$(bindir)
	install -m 755 wifi-information-collector $(DESTDIR)$(bindir)

uninstall:
	-rm -f $(DESTDIR)$(bindir)/wifi-information-collector
