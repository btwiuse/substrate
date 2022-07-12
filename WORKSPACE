workspace(name = "substrate")

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "rules_rust",
    branch = "main",
    remote = "https://github.com/bazelbuild/rules_rust.git",
)

load("@rules_rust//rust:repositories.bzl", "rules_rust_dependencies", "rust_register_toolchains")

rules_rust_dependencies()

rust_register_toolchains(
    edition = "2021",
    iso_date = "2022-07-10",
    version = "nightly",
)

git_repository(
    name = "cargo_raze",
    branch = "main",
    remote = "https://github.com/google/cargo-raze",
)

load("@cargo_raze//:repositories.bzl", "cargo_raze_repositories")

cargo_raze_repositories()

load("@cargo_raze//:transitive_deps.bzl", "cargo_raze_transitive_deps")

cargo_raze_transitive_deps()

