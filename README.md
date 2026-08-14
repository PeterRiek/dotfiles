# dotfiles

Personal dotfiles managed as a bare git repo, tracked directly against `$HOME`
(no symlinks). Based on the [bare repo dotfiles pattern](https://www.atlassian.com/git/tutorials/dotfiles).

## What's tracked

- `.zshrc`, `.p10k.zsh` — zsh + Powerlevel10k config
- `.config/niri/` — niri window manager config
- `.config/noctalia/` — Noctalia shell config, colorschemes, and plugins
- `.config/alacritty/` — Alacritty terminal config

## Setup on a new machine

```sh
git clone --bare git@github.com:PeterRiek/dotfiles.git $HOME/.dotfiles
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
dotfiles checkout
dotfiles config status.showUntrackedFiles no
```

If `checkout` fails because existing files would be overwritten, back them up
and retry:

```sh
mkdir -p ~/.dotfiles-backup
dotfiles checkout 2>&1 | grep -E "^\s+" | awk '{print $1}' | \
  xargs -I{} mv {} ~/.dotfiles-backup/{}
dotfiles checkout
```

## Usage

The `dotfiles` alias (already defined in `.zshrc`) wraps git so it operates
on `$HOME` as the work tree:

```sh
dotfiles status
dotfiles add .zshrc
dotfiles commit -m "update zshrc"
dotfiles push
```
