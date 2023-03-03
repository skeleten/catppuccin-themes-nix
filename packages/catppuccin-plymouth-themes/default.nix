{ stdenv
, lib
, pkgs
, fetchFromGitHub
, ...
}:
stdenv.mkDerivation {
  pname = "catppuccin-plymouth-themes";
  version = "0";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "plymouth";
    rev = "d4105cf336599653783c34c4a2d6ca8c93f9281c";
    sha256 = "quBSH8hx3gD7y1JNWAKQdTk3CmO4t1kVo4cOGbeWlNE=";
  };

  phases = [ "unpackPhase" "installPhase" ];

  installPhase = ''
    mkdir -p $out/share/plymouth/themes/
    cp -r $src/themes/* $out/share/plymouth/themes/.
    for d in $(ls $out/share/plymouth/themes/); do
      substituteInPlace $out/share/plymouth/themes/$d/$d.plymouth \
                        --replace /usr/share/plymouth/themes $out/share/plymouth/themes
    done
  '';
}
