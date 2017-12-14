CANDLEOPTS = -nologo -arch x86 -pedantic -ext WixDependencyExtension
LIGHTOPTS = -nologo -ext WixDependencyExtension \
			-sval -cultures:en-us -loc en-us.wxl

TOPDIR = $(shell pwd)
CANDLE = $(TOPDIR)/bin/candle
LIGHT = $(TOPDIR)/bin/light

all: parent1.msi parent2.msi child.msi

%.wixobj: %.wxs $(CANDLE)
	$(CANDLE) $(CANDLEOPTS) -o $@ $<

%.msi: %.wixobj *.wxl $(LIGHT)
	$(LIGHT) $(LIGHTOPTS) -o $@ $<

clean:
	rm -rf *.msi *.wixobj *.wixpdb bin 

$(CANDLE) $(LIGHT):
	mkdir -p $(TOPDIR)/bin && cd $(TOPDIR)/bin && docker run --rm felfert/wix mkhostwrappers | sh

