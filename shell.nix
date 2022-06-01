{ pkgs ? import <nixpkgs> { }, ... }:

with pkgs;
let

in
  pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
      clojure
      yarn
      jdk11
    ];

    shellHook = ''
    '';
  }

