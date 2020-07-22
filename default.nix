{ pkgs ? import <nixpkgs> {} }:
let
  overrides = import ./overrides.nix { inherit pkgs; };
in pkgs.poetry2nix.mkPoetryApplication {
  python = pkgs.python37;
  projectDir = ./.;
  overrides = pkgs.poetry2nix.overrides.withDefaults overrides;
}
