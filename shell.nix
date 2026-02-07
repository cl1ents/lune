let
  # Rolling updates, not deterministic.
  pkgs = import (fetchTarball ("channel:nixpkgs-unstable")) { };
in
pkgs.callPackage (
  {
    mkShell,
    cargo,
    rustc,
    clippy,
    rustfmt,
  }:
  mkShell {
    strictDeps = true;
    nativeBuildInputs = [
      cargo
      rustc
      clippy
      rustfmt
    ];
    RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  }
) { }
