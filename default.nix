let
  pkgs = import <nixpkgs> { };
in
  pkgs.haskellPackages.callPackage ./helloworld.nix { } 
