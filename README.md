# Download Language Files.nvim

One of Neovim's problems is the broken spell-file download.  
This plugin adds a easy way to manually install the missing files.

## Usage

1. Select your Language (example: `:set spelllang=pl`)
2. Run `:DownloadSpellLang`

## Configuration


**Lazy.nvim:**
```lua
{ 'jan9103/download-lang-files.nvim',
  lazy = true, cmd = 'DownloadSpellLang',
  dependencies = {'nvim-lua/plenary.nvim'},
  config = function() require('download-lang-files').setup() end,
}
```

**Packer.nvim:**
```lua
use { 'jan9103/download-lang-files.nvim',
  cmd = 'DownloadSpellLang',
  requires = {'nvim-lua/plenary.nvim'},
  config = function() require('download-lang-files').setup() end,
}
```

### Arguments for setup


#### `website`

The `ftp.vim.org` http-mirror used for downloading.  
The link has to end with a `/` and be the direct parent of the `.spl` files.  
You can find a server list at: <https://www.vim.org/mirrors.php>  
Default: `https://ftp.pl.vim.org/pub/vim/runtime/spell/`
