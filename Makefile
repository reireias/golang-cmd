NAME := TODO
VERSION := $(shell gobump show -r cmd/TODO)
REVISION := $(shell git rev-parse --short HEAD)
LDFLAGS := "-X main.version=$(VERSION) -X main.revision=$(REVISION)"

export GO111MODULE=on

.PHONY: deps
deps:
	@go get -v -d

.PHONY: devel-deps
devel-deps: deps
	@GO111MODULE=off go get -u \
		golang.org/x/lint/golint \
		github.com/motemen/gobump/cmd/gobump \
		github.com/goreleaser/goreleaser

bin/%: cmd/%/main.go deps
	@go build -ldflags $(LDFLAGS) -o $@ $<

.PHONY: build
build: bin/TODO

.PHONY: lint
lint: devel-deps
	go vet ./...
	golint -set_exit_status ./...

.PHONY: install
install:
	@go install $(LDFLAGS) ./cmd/TODO

.PHONY: version-up-major
version-up-major:
	@gobump major -w cmd/TODO

.PHONY: version-up-minor
version-up-minor:
	@gobump minor -w cmd/TODO

.PHONY: version-up-patch
version-up-patch:
	@gobump patch -w cmd/TODO

.PHONY: release
release:
	@git tag v$(VERSION)
	@git push --tags
	goreleaser --rm-dist
