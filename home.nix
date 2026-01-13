{ config, pkgs, ... }:

{
  home.username = "laura";
  home.homeDirectory = "/home/laura";

  home.packages = with pkgs; [

    neofetch
    nnn
    zip
    bat
    git
    fd
    xz
    unzip
    p7zip

    ripgrep
    jq
    fzf

    which
    glow
  ];

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  home.file.".config" = {
    source = ./home/.config;
    recursive = true;
  };
  home.file.".config/hypr/theme.conf".text = ''
$active_border_1 = rgba(6c7086ee)
$active_border_2 = rgba(7f849cee)
$inactive_border = rgba(9399b2aa)
  '';
  home.file.".config/ghostty/theme".text = ''
opacity = 1;
theme = "Catppuccin Mocha";
  '';
  home.file.".bashrc" = {
    source = ./home/.bashrc;
    executable = true;
  };
  home.file.".bash_profile" = {
    source = ./home/.bash_profile;
    executable = true;
  };
  home.file.".bash_aliases" = {
    source = ./home/.bash_aliases;
    executable = true;
  };
  home.file.".local/scripts" = {
    source = ./home/.local/scripts;
    recursive = true;
    executable = true;
  };

  home.stateVersion = "25.11";

  wayland.windowManager.hyprland.systemd.enable = false; # prefer uwsm for wayland
}
