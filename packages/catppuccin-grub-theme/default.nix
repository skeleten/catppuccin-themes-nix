{ stdenv
, lib
, pkgs
, fetchFromGitHub
, variant ? "mocha"
, ... }:

let
  validVariants = [ "latte" "frappe" "macchiato" "mocha" ];

  pname = "catppuccin-grub-theme";
in

lib.checkListOfEnum "${pname}: theme variant" validVariants [variant]

  stdenv.mkDerivation {
    inherit pname;

    version = "0";

    src = fetchFromGitHub {
      owner = "catppuccin";
      repo = "grub";
      rev = "803c5df0e83aba61668777bb96d90ab8f6847106";
      sha256 = "/bSolCta8GCZ4lP0u5NVqYQ9Y3ZooYCNdTwORNvR7M0=";
    };

    phases =  [ "unpackPhase" "installPhase" ];

    installPhase = ''
      mkdir $out
      cp -rv $src/src/catppuccin-${variant}-grub-theme/* $out/.
    '';
  }
