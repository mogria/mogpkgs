self: super: {
  # this termfile allows tmux to display underlined
  # and strike-through text correctly.
  # see https://github.com/tmux/tmux/issues/1137
  # (only works for italics but has problems with using backspace)
  tmux-256colors-terminfo = super.callPackage ./pkgs/console/tmux-terminfo.nix {
    ncurses = self.pkgs.ncurses;
  };
}
