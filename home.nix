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
  home.file.".bashrc" = {
    source = ./home/.bashrc;
    executable = true;
  };
  home.file.".bash_aliases" = {
    source = ./home/.bash_aliases;
    executable = true;
  };
  home.file."scripts" = {
    source = ./home/scripts;
    recursive = true;
    executable = true;
  };

  home.stateVersion = "25.11";
}
