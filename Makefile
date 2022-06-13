# Makefile template main
VERSION := $(shell cat version.in)

.PHONY: build build-dep1 build-dep2 copy-build

build: build-dep1 build-dep2 copy-build

all: build pack

init:
	@mkdir -p target/data/

# Sample dependency 1
build-dep1: init
	@echo "Build DEP1"

# Sample dependency 2
build-dep2: init
	@echo "Build DEP2"

# Sample copy build artifacts
copy-build:
	@echo "Copy of build data"
	cp * version.in target/
	cp Makefile.in target/Makefile


pack:
	@echo "Doing the ZIP"
	@(cd target ; zip -or sample-app-${VERSION}.zip .)

clean:
	rm -fr target/
