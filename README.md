# halonot

## Description
A nvim plugin for window management in the spirit of Spacemacs

Most keymaps are the same as native vim commands where we use `<leader>w` instead of `<C-w>`. For instance, we resize windows with `<leader>w=` instead of `<C-w>=`. Two commands have been fixed: `|` (full width) and `_` (full height) so that the current window take the whole width or height, whereas in native vim, the other window still has a width or height of 1.

Some keymaps are a remapping for convenience, e.g `<leader>wm` for `<c-w>o` to maximize the current window.

Here is the full keymap list:

| Keymap   | Action |
| -----    | ------ |
| `/`      | Split window right | 
| `v`      | Split window right | 
| `-`      | Split window below | 
| `s`      | Split window below | 
| `\|`      | Maximize current window horizontally | 
| `_`      | Maximize current window vertically | 
| `d`      | Close current window | 
| `m`      | Maximize current window | 
| `o`      | Maximize current window | 
| `j`      | Go to lower window | 
| `k`      | Go to upper window | 
| `h`      | Go to left window | 
| `l`      | Go to right window | 
| `w`      | Go to window above/left| 
| `p`      | Go to last accessed window | 
| `<TAB>`  | Go to last accessed window | 
| `=`      | Make all windows equally hide and wide | 
| `x`      | Switch with previous window | 
| `>`      | Increase width | 
| `]`      | Increase width | 
| `<`      | Decrease width | 
| `[`      | Decrease width | 
| `}`      | Increase height | 
| `{`      | Decrease height | 
| `J`      | Move window to far top | 
| `K`      | Move window to far bottom | 
| `H`      | Move window to far left | 
| `L`      | Move window to far right | 

## Install

Using [https://github.com/wbthomason/packer.nvim](packer):

~~~lua
use {'viebel/halonot', 
    config = function() 
      require('halonot').setup({main_key = 'w'})
    end
}
~~~

# TODOs

[X] Make `<leader>w` configurable
[X] Add help
