SVG = NSA-publish-or-perish.svg
PNG = $(SVG).png
JPEG = $(SVG).jpg
WEBP = $(SVG).webp

WIDTH = 400

all: $(PNG) $(JPEG) $(WEBP)

$(PNG): $(SVG)
	inkscape --export-png=$@ --export-width=400 $<

$(JPEG): $(PNG)
	convert $(PNG) $(JPEG)

$(WEBP): $(PNG)
	gm convert $< $@

upload: all
	rsync --progress -v -a --inplace $(PNG) $(SVG) *.jpg $(__HOMEPAGE_REMOTE_PATH)/evolution-of-girls-with-weapons/
