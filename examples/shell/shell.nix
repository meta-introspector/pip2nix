let pkgs = import <nixpkgs> { };

  packageOverrides = pkgs.callPackage ./python-packages.nix { };
  python = pkgs.python3.override { inherit packageOverrides; };
  pythonWithPackages = python.withPackages (ps: [ ps.requests ]);
in
pkgs.mkShell {
  nativeBuildInputs = [ pythonWithPackages ];
}
