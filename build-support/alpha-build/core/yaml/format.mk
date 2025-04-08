# !!! Don't edit this file !!!
# This file is part of AlphaBuild core, don't edit it in a repo other than https://github.com/alpha-build/alpha-build
# Please submit an issue/pull request to the main repo if you need any changes in the core infrastructure.
# Before doing that, you may wish to consider:
# - updating the config files in build-support/alpha-build/config/ to configure tools for your own use case
# - writing a new custom rule, in build-support/alpha-build/extensions/<lang>/ and import it in the main Makefile

ifndef PRETTIER_BIN
	PRETTIER_BIN=prettier
endif

.PHONY: dos2unix-yml
dos2unix-yml:
	$(eval targets := $(onyml))
	if $(call lang,$(targets),$(REGEX_YML)); then \
	find $(targets) -type f -regex $(REGEX_YML) | $(gnu_xargs) --no-run-if-empty dos2unix; fi;

.PHONY: prettier-yml
prettier-yml:
	$(eval targets := $(onyml))
	$(eval prettier := $(PRETTIER_BIN))
	if $(call lang,$(targets),$(REGEX_YML)); then \
	find $(targets) -type f -regex $(REGEX_YML) | $(gnu_xargs) --no-run-if-empty $(prettier) -w $(PRETTIER_FLAGS); fi;
