{ config, ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "USER_NAME"; # rename to your users name
    userEmail = "NAME@EMAIL.DOM"; # rename to your email
    ignores = [ "*~" "*.swp" ".DS_Store" ];

    aliases = {
      unstage = "reset HEAD --";
      pr = "pull --rebase";
      addp = "add --patch";
      comp = "commit --patch";
      co = "checkout";
      ci = "commit";
      c = "commit";
      b = "branch";
      p = "push";
      d = "diff";
      a = "add";
      s = "status";
      f = "fetch";
      pa = "add --patch";
      pc = "commit --patch";
      rf = "reflog";
      l = "log --graph --pretty='%Cred%h%Creset - %C(bold blue)<%an>%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)' --abbrev-commit --date=relative";
      pp = "!git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)";
      recent-branches = "branch --sort=-committerdate";
    };
      extraConfig = {
        branch = { autoSetupMerge = "always"; };
        stash = { showPatch = true; };
        status = { showUntrackedFiles = "all"; };
        transfer = { fsckobjects = false; };
        # commit = { gpgsign = true; };

      core = {
        # pager = "less -R";
        # autocrlf = "input";
        editor = "nvim";
      };

      merge = {
        conflictstyle = "diff3";
        ff = "only";
        summary = true;
        tool = "vimdiff";
        renamelimit = 10000;
      };

      remote = {
        push = [
          "refs/heads/*:refs/heads/*"
          "refs/tags/*:refs/tags/*"
        ];

        fetch = [
          "refs/heads/*:refs/remotes/origin/*"
          "refs/tags/*:refs/tags/*"
        ];
      };

      pull = {
        rebase = true;
      };

      rebase = {
        stat = true;
        autoSquash = true;
        autostash = true;
      };
    };
  };
}