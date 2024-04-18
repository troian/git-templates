# Git hooks templates

This repo automates installation and usage of various git hooks during `git init` or `git clone`

## How to use it

1. Clone this repo in to place of your choice. We will be using `~/.config/git-templates` in this example
```shell
git clone https://github.com/troian/git-templates ~/.config/git-templates
```

2. Lets git know where to search for templates. In ~/.gitconfig add/edit `init` section
```git
[init]
  templatedir = ~/.config/git-templates # <--- this is what we add
```

Now, everytime repo is created or cloned git will install following files into repo's `.git` dir
```
.git/
  configure.sh
  update.sh
```

1. `configure.sh` - configures what hooks to use. simply call it `.git/configure.sh` and follow prompts to install hooks of your choice
2. whenever hooks are updated in the upstream, call `.git/update.sh` to update them


## How to add new hooks to this repo

1. Create directory inside `hooks`. give it sensible name
2. Create hook(s) files and make sure they are executable. Allowed hook types are: `commit-msg` `pre-commit` `post-commit` `pre-push` `post-push`
