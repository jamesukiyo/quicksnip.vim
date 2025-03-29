# quicksnip.vim

Easy, on-the-fly, snippet creation for Vim.

I've had issues with a couple of snippet plugins and finally settled on [miniSnip](https://github.com/Jorenar/miniSnip). It's lightweight and easy to use so I highly recommend checking it out :)

I wanted a quick way to create snippets from anywhere, for any filetype so I made this.

## Notes

This is **NOT** a snippet engine. It is simply a convenient way to quickly add custom snippets to an existing setup.

So far I've only used it with [miniSnip](https://github.com/Jorenar/miniSnip) so it won't work for others unless they use `.snip` files and follow a similar structure.

Works in neovim too, alongside miniSnip.

The plugin will check the current filetype or ask for a filetype to determine the snippet's language (see **usage** below).

I threw this together quickly and it's worked so far but feel free to make a PR or open an issue and I'll happily try to extend/improve it.

## Install
vim-plug:
```
Plug 'jamesukiyo/quicksnip.vim'
```

## Options
```
let g:snippet_dir = '$HOME/.vim/snippets'       " my setup but change it if needed
```

## Usage
- Files/directories will be created automatically if they do not exist.
- If the snippet already exists, you will be taken to edit it - it should not be overwritten.
- The snippet file is only created once it is written to disk (`:w`).

The following structure is assumed/used and currently only works for `.snip` files.
```
$HOME/.vim/snippets/<filetype>/<snippet_name>.snip
<your_snippet_dir>/<filetype>/<snippet_name>.snip
```
If the snippet already exists, you will be taken to edit it. It should not be overwritten.

`:SnipCurrent` - Creates a new snippet for the current `filetype` (if set). You will be prompted to input a snippet name and then be taken to the new file where you can edit and save the snippet.

`:SnipPick` - Prompts for a filetype and snippet name then opens it for editing. Use this and set `all` as the filetype to create a global snippet for miniSnip.

You can create a mapping for convenience e.g.
```
nnoremap <leader>ss :SnipCurrent<CR>
```

At any point during creation press ESC (or similar) to quit.

## More stuff maybe
- make it possible to open existing snippets for editing
- support for other snippet tools (different extensions)
- templates
