let
  pkgs = import <nixpkgs> {};
  default = (import ./default.nix);
  all-hie = (import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") {});
in
  pkgs.haskellPackages.shellFor {
    name = "helloworld-shell";
    packages = p: [default];
    buildInputs = [
      pkgs.cabal-install
      pkgs.haskellPackages.apply-refact
      pkgs.haskellPackages.hlint
      pkgs.haskellPackages.stylish-haskell
      pkgs.haskellPackages.hasktags
      pkgs.haskellPackages.hoogle
      pkgs.haskellPackages.hindent
      (all-hie.selection { selector = p: { inherit (p) ghc865; }; })
    ];
  }
