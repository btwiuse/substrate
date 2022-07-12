.PHONY: build trust

NAME     := substrate
SHELL    := bash

default: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":[^:]*?## "}; {printf "\033[38;5;69m%-30s\033[38;5;38m %s\033[0m\n", $$1, $$2}'

prep:             ## install dev dependencies
	@ sudo apt update && sudo apt install -y pkg-config
	@ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	@ cargo install cargo-raze

raze:             ## auto generate BUILD.bazel files from Cargo.toml
	@ which cargo-raze || (echo please cargo install cargo-raze | grep --color . 1>&2 && false)
	@#cargo vendor --versioned-dirs cargo/vendor &>/dev/null
	@ cargo raze
	# @ $(BAZEL) run @cargo_raze//:raze -- --manifest-path=$(realpath /Cargo.toml)
