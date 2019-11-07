{ nix-gitignore, mkDerivation, base, hpack, stdenv }:
mkDerivation {
  pname = "helloworld";
  version = "0.1.0.0";
  src = nix-gitignore.gitignoreSourcePure [./.gitignore] ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ base ];
  libraryToolDepends = [ hpack ];
  executableHaskellDepends = [ base ];
  testHaskellDepends = [ base ];
  prePatch = "hpack";
  homepage = "https://github.com/githubuser/helloworld#readme";
  license = stdenv.lib.licenses.bsd3;
}
