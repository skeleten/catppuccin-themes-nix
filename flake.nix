{
  description = "Catppuccin themes, packaged for NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
      { self
      , nixpkgs
      , utils }:
      let system = "x86_64-linux";
          pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.${system} = {
          catppuccin-grub-theme = pkgs.callPackage ./packages/catppuccin-grub-theme { };
          catppuccin-plymouth-themes = pkgs.callPackage ./packages/catppuccin-plymouth-themes { };
          catppuccin-sddm-theme = pkgs.callPackage ./packages/catppuccin-sddm-theme { };
        };

        overlays.default = (final: prev: {
          catppuccin-grub-theme = final.callPackage ./packages/catppuccin-grub-theme {};
          catppuccin-plymouth-themes = final.callPackage ./packages/catppuccin-plymouth-themes { };
          catppuccin-sddm-theme = final.callPackage ./packages/catppuccin-sddm-theme { };
        });
      };
}
