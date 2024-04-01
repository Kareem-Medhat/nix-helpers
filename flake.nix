{
  description = "Description for the project";

  outputs = {nixpkgs, ...}: let
    systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
    forEachSystem = f: nixpkgs.lib.genAttrs systems f;
  in {
    helpers = forEachSystem (system: let
      pkgs = nixpkgs.legacyPackages."${system}";
    in {
      writeSymbolicDir = pkgs.callPackage ./src/write-symbolic-dir {};
    });
  };
}
