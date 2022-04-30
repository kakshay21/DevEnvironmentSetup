"=================================================================================
"general
"=================================================================================

syntax on
set ma
set mouse=a
set cursorline
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoread
set nobackup
set nowritebackup
set noswapfile
set nu 
set foldlevelstart=99
set scrolloff=7
"use y and p with the system clipboard
set clipboard=unnamedplus

"==================================================================================
"plugins
"==================================================================================

call plug#begin('~/.config/nvim/autoload/')

"Colour scheme
" dracula/dracula-theme, rakr/vim-one, gosukiwi/vim-atom-dark,
" phanviet/vim-monokai-pro rhysd/vim-color-spring-night arzg/vim-colors-xcode
" kyoz/purify 'jonathanfilip/vim-lucius'
" Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'jonathanfilip/vim-lucius'
"Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Language packs
Plug 'sheerun/vim-polyglot'

"Nvim motions
Plug 'phaazon/hop.nvim'

"LSP autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'kyazdani42/nvim-web-devicons'

"File browsing
Plug 'nvim-telescope/telescope-file-browser.nvim'

"Native LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

"Buffer navigation
Plug 'nvim-lualine/lualine.nvim'

"Go
"Plug 'fatih/vim-go'

"Airline
Plug 'vim-airline/vim-airline'

"debugging
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-telescope/telescope-dap.nvim'

"Telescope Requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

"magit
Plug 'TimUntersberger/neogit'
call plug#end()

"key combos
"==============================================================================

set encoding=UTF-8
let mapleader = " "

"Navigate buffers
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bf :bfirst<CR>
nnoremap <leader>bl :blast<CR>

nnoremap ccd :CocList diagnostics<CR>
"Other
nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>ne :Telescope file_browser<CR>
nnoremap <leader>f :call CocAction('format')<CR>

autocmd StdinReadPre * let s:std
"==============================================================================
" plugin configs
"==============================================================================
"Go - format on save
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()

"fzf
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

" Focus and redistribute split windows
noremap ff :resize 100 <CR> <BAR> :vertical resize 220<CR>
noremap fm <C-w>=

" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Buffer navigation
" TODO
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'


"Telescope
" will find .lua file that exist at runtime
" should be unique
lua require("main") 
lua require("debugging") 
nnoremap <C-_> <cmd>lua require("main").curr_buf() <cr>
nnoremap <C-f> <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy="ascending", prompt_position="top"})<cr>
nnoremap <F4> :lua package.loaded.main = nil <cr>:source ~/.config/nvim/init.vim <cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>ff :Telescope find_files cwd=~/go/src/<cr>
