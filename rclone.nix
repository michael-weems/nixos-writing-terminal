{ pkgs, ... }:
let
  username = "laura";
in
{
  environment.systemPackages = with pkgs; [ rclone ];

  systemd.mounts = [
    {
      description = "Dropbox Mount";
      what = "remote:/";
      where = "/home/${username}/dropbox";
      type = "rclone";
      wants = [ "network-online.target" ];
      options = "nodev,nofail,allow_other,args2env,config=/etc/rclone-mnt.conf";
    }
  ];
  systemd.automounts = [
    {
      description = "Dropbox Auto-mount";
      where = "/home/${username}/dropbox";
      wantedBy = [ "multi-user.target" ];
    }
  ];
}
