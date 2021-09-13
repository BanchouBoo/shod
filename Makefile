# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man
LOCALINC = /usr/local/include
LOCALLIB = /usr/local/lib
X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib

# includes and libs
INCS = -I${LOCALINC} -I${X11INC}
LIBS = -L${LOCALLIB} -L${X11LIB} -lX11 -lXinerama -lXpm

# flags
CFLAGS = -g -O0 -Wall -Wextra ${INCS} ${CPPFLAGS}
LDFLAGS = ${LIBS}

# compiler and linker
CC = cc

# files
PROGS = shod
SRCS = ${PROGS}.c
OBJS = ${SRCS:.c=.o}

all: shod

shod: shod.o
	${CC} -o $@ shod.o ${LDFLAGS}

shod.o: theme.xpm

.c.o:
	${CC} ${CFLAGS} -c $<

install: all
	install -D -m 755 shod ${DESTDIR}${PREFIX}/bin/shod
	#install -D -m 644 shod.1 ${DESTDIR}${MANPREFIX}/man1/shod.1

uninstall:
	rm -f ${DESTDIR}/${PREFIX}/bin/shod
	#rm -f ${DESTDIR}/${MANPREFIX}/man1/shod.1

clean:
	-rm ${OBJS} ${PROGS}

.PHONY: all install uninstall clean
