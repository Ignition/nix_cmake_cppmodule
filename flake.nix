{
  description = "C++20 modules demo";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/9870f334cbf2f822d273eba1cd05ef061d21d46a";
  };

  outputs = { self, nixpkgs }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    stdenv = pkgs.llvmPackages_16.stdenv;
  in
  {
    packages.x86_64-linux.default = stdenv.mkDerivation{
      name = "cxx_module_demo";
      src = ./code;

      nativeBuildInputs = [ pkgs.cmake pkgs.ninja ];

      configurePhase = ''
        cmake -B build -S . -DCMAKE_INSTALL_PREFIX=$out --preset default
      '';

      buildPhase = ''
        cmake --build build
      '';

      installPhase = ''
        cmake --build build --target install
      '';
    };
  };
}
