# !!! Don't edit this file !!!
# This file is part of AlphaBuild core, don't edit it in a repo other than https://github.com/cristianmatache/alpha-build/
# Please submit an issue/pull request to the main repo if you need any changes in the core infrastructure.
# Before doing that, you may wish to consider:
# - updating the config files in build-support/alpha-build/config/ to configure tools for your own use case
# - writing a new custom rule, in build-support/alpha-build/extensions/<lang>/ and import it in the main Makefile

ifndef MARKDOWNLINT_BIN
	MARKDOWNLINT_BIN=markdownlint
endif

ifndef PRETTIER_BIN
	PRETTIER_BIN=prettier
endif

.PHONY: markdownlint-fmt
markdownlint-fmt:
	$(eval targets := $(onmd))
	$(eval mdlint := $(MARKDOWNLINT_BIN))
	if $(call lang,$(targets),$(REGEX_MD)); then \
	$(mdlint) $(MARKDOWNLINT_FLAGS) --fix $(targets); fi;

.PHONY: prettier-md
prettier-md:
	$(eval targets := $(onmd))
	$(eval prettier := $(PRETTIER_BIN))
	if $(call lang,$(targets),$(REGEX_MD)); then \
	find $(targets) -type f -regex $(REGEX_MD) | $(gnu_xargs) --no-run-if-empty $(prettier) -w $(PRETTIER_FLAGS); fi;
