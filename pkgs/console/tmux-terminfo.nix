{ stdenv, ncurses }:

stdenv.mkDerivation {
  name = "tmux-256colors-terminfo-fixed";
    version = "0.1.0";
    src = ./tmux-256color.info;
    outputs = [ "out" "terminfo" ];
    unpackPhase = ''
      cp $src .
    '';
    buildPhase = ''mkdir $out'';
    installPhase = ''
      install -dm 755 "$terminfo/share/terminfo/t/"
      ${ncurses}/bin/tic -x -o "$terminfo/share/terminfo" $src
      mkdir -p $out/nix-support
      echo "$terminfo" >> $out/nix-support/propagated-user-env-packages
    '';
}
