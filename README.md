# base16-fish
[Base16](http://chriskempson.com/projects/base16/) theme switcher for [fish](https://fishshell.com) shell

## Installation
1. If you have [fisher](https://github.com/jorgebucaran/fisher),
```
$ fisher add tomyun/base16-fish
```

2. Run your choice of `base16-*` function
```
$ base16-oceanicnext
```

## Screenshot
![Screenshot](https://media.giphy.com/media/VboA2lb7ZJs4OgHjcH/giphy.gif)

## FAQ
1. Why not just use [base16-shell](https://github.com/chriskempson/base16-shell)?

`base16-shell` is great for bash/zsh, but unable to support [syntax highlighting colors](https://fishshell.com/docs/current/index.html#variables-color) in fish that ends up with incorrect coloring of texts typed in the prompt. `base16-fish` fixes this problem by explicitly setting color variables in native fish shell scripts. With that, no separate helper required in `config.fish`. No configuration file (`.base16_theme`) stored in your home directory. Theme switching commands (`base16-*`) are now fish functions that work more nicely with tab completetion.
