{ pkgs ? import <nixpkgs> {}, lib }:

pkgs.stdenv.mkDerivation rec {
  name = "cuff-${version}";
  version = "1.0";

  nativeBuildInputs = with pkgs; [ installShellFiles ];

  src = ./.;

  installPhase = ''
    installShellCompletion --zsh completions/zsh
    install -Dm555 cuff $out/bin/cuff
  '';

  meta = with lib; {
    platforms = platforms.linux;
  };
}
