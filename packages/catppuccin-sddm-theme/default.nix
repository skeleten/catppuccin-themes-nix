{ stdenv
, lib
, pkgs
, fetchFromGitHub
, ... }:

stdenv.mkDerivation {
  pname = "catppuccin-sddm-themes";
  version = "0";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "sddm";
    rev = "bde6932e1ae0f8fdda76eff5c81ea8d3b7d653c0";
    sha256 = "ceaK/I5lhFz6c+UafQyQVJIzzPxjmsscBgj8130D4dE=";
  };

  phases = [ "unpackPhase" "installPhase" ];

  installPhase = ''
    mkdir -p $out/share/sddm/themes/
    cp -r $src/src/* $out/share/sddm/themes/.
  '';
}
