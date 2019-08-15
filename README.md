TODO: build badge
# TODO: name

TODO: description

## Install

```sh
go get -u github.com/reireias/TODO
```

## install from relase

1. download from [release page](https://github.com/reireias/TODO/releases)

2. unarchive

3. `sudo mv ./TODO /usr/local/bin`

## install from source

1. clone this repository

2. `make && make install`


## for developer
### install dependecy

```sh
make devel-deps
```

### lint

```sh
make lint
```

### build

build binary into bin.

```sh
make build
```

### update version

```sh
# major
make version-up-major

# minor
make version-up-minor

# patch
make version-up-patch
```

### release

release with [goreleaser](https://github.com/goreleaser/goreleaser)

1. `export GITHUB_TOKEN='token'`

2. `goreleaser --rm-dist`
