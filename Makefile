MAKEFLAGS += --silent

NAME = $(shell cat NAME)
VERSION = $(shell cat VERSION)
URL = https://github.com/radxa-pkg/$(NAME)
DESCRIPTION = Android debug bridge daemon

all:
	fpm -s dir -t deb -n $(NAME) -v $(VERSION) \
		-a arm64 \
		--deb-priority optional --category utils \
		--deb-field "Replaces: $(NAME)" \
		--deb-field "Conflicts: $(NAME)" \
		--deb-field "Provides: $(NAME)" \
		--url $(URL) \
		--description "$(DESCRIPTION)" \
		--license "GPL-2+" \
		-m "Radxa <dev@radxa.com>" \
		--vendor "Radxa" \
		--force \
		./root/=/