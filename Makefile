VERSION=0.3.5
COMPONENT_INTERNAL=$(PROJECT)
COMPONENT=$(COMPONENT_INTERNAL)
TARGET_DIR=/opt/local
SRC_DIR=$(GOPATH)/src/github.com/bitly/nsq

include pkg.mk

.PHONY: package prepare clean

package: prepare $(FILE).tgz

clean: clean-pkg
	-rm -r $(STAGE_DIR)/bin
	-rm -r $(STAGE_DIR)/share
	-rm *.tgz

prepare: clean
	go get -tags=v$(VERSION) github.com/bitly/nsq/...
	make -C $(SRC_DIR)
	mkdir -p $(STAGE_DIR)/bin
	mkdir -p $(STAGE_DIR)/share
	cp $(SRC_DIR)/build/apps/nsq* $(STAGE_DIR)/bin/
	cp -r $(SRC_DIR)/nsqadmin/templates $(STAGE_DIR)/share/nsqadmin
