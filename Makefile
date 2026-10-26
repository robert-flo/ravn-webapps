PREFIX ?= /usr
DESTDIR ?=

.PHONY: all icons install uninstall clean

all:
	@echo "ravn-webapps listo para instalar."

icons:
	python3 scripts/generate_icons.py

install:
	install -d $(DESTDIR)$(PREFIX)/bin
	install -m 755 bin/ravn-launch-webapp $(DESTDIR)$(PREFIX)/bin/
	install -m 755 bin/ravn-webapp-handler-hey $(DESTDIR)$(PREFIX)/bin/
	install -m 755 bin/ravn-webapp-handler-zoom $(DESTDIR)$(PREFIX)/bin/
	install -d $(DESTDIR)$(PREFIX)/share/applications
	install -m 644 applications/*.desktop $(DESTDIR)$(PREFIX)/share/applications/
	install -d $(DESTDIR)$(PREFIX)/share/icons/hicolor/256x256/apps
	install -d $(DESTDIR)$(PREFIX)/share/icons/hicolor/48x48/apps
	install -d $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/apps
	install -m 644 icons/hicolor/256x256/apps/*.png $(DESTDIR)$(PREFIX)/share/icons/hicolor/256x256/apps/
	install -m 644 icons/hicolor/48x48/apps/*.png $(DESTDIR)$(PREFIX)/share/icons/hicolor/48x48/apps/
	install -m 644 icons/hicolor/scalable/apps/*.svg $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/apps/

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/ravn-launch-webapp
	rm -f $(DESTDIR)$(PREFIX)/bin/ravn-webapp-handler-hey
	rm -f $(DESTDIR)$(PREFIX)/bin/ravn-webapp-handler-zoom
	for f in applications/*.desktop; do \
		rm -f $(DESTDIR)$(PREFIX)/share/applications/$$(basename $$f); \
	done

clean:
	@echo "Clean completed."
