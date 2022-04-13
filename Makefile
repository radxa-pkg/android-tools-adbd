MAKEFLAGS += --silent

NAME = $(shell cat NAME)
VERSION = $(shell cat VERSION)
URL = https://github.com/radxa-pkg/$(NAME)
DESCRIPTION = Android debug bridge daemon

all:
	fpm -s dir -t deb -n $(NAME) -v $(VERSION) \
		-p $(NAME)_$(VERSION)_all.deb \
		--deb-priority optional --category utils \
		--depends android-tools-adbd \
		--force \
		--deb-field "Multi-Arch: foreign" \
		--deb-field "Replaces: $(NAME)" \
		--deb-field "Conflicts: $(NAME)" \
		--deb-field "Provides: $(NAME)" \
		--url $(URL) \
		--description "$(DESCRIPTION)" \
		--license "GPL-2+" \
		-m "Radxa <dev@radxa.com>" \
		--vendor "Radxa" \
		-a all \
		./root/=/