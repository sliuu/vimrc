" Using this vimrc:

" Install vim plug: https://github.com/junegunn/vim-plug#usage
" run: mkdir ~/.vim/backup
" run: mkdir ~/.vim/tmp
" copy this code to ~/.vimrc
" open this file in vim
" run :PlugInstall
call plug#begin('~/.vim/plugged')
" using to pull current git branch into status bar
" Plug 'tpope/vim-fugitive'
" useful for opening files
Plug 'kien/ctrlp.vim'
" useful for auto-ending ruby methods/classes/blocks
Plug 'tpope/vim-endwise'
" help look up step definitions
Plug 'tpope/vim-cucumber'
" navigate between tmux and vim splits with ease
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

syntax on
filetype on
colorscheme oxeded

" for tmux
set t_Co=256

" move backup files all into one place
set backup
set backupdir=~/.vim/backup,.
set directory=~/.vim/tmp,.

au BufNewFile,BufRead *.md set filetype=text
au BufNewFile,BufRead *.pill set filetype=ruby
au BufNewFile,BufRead *.rabl set filetype=ruby
au BufNewFile,BufRead *.jbuilder set filetype=ruby
au BufNewFile,BufRead *.yml.example set filetype=yaml
au BufNewFile,BufRead *.mj set filetype=yaml

" Backspace: Delete selected and go into insert mode
xnoremap <bs> c
set backspace=eol,start,indent
nnoremap <bs> :set hlsearch! hlsearch?<cr>

" smart indents
filetype plugin indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
au BufRead,BufNewFile *.rb set shiftwidth=2
au BufRead,BufNewFile *.rb set softtabstop=2
au BufRead,BufNewFile *.rb set tabstop=2
au BufRead,BufNewFile *.py set shiftwidth=2
au BufRead,BufNewFile *.py set softtabstop=2
au BufRead,BufNewFile *.py set tabstop=2

" add a vertical column at 81 characters
" discouraging lines longer than 80 characters, which appear to go into the
" danger zone
set colorcolumn=81

" but it should be 51 in git commit message files
autocmd Filetype gitcommit setlocal colorcolumn=51
autocmd Filetype netrw setlocal colorcolumn=0
highlight ColorColumn ctermbg=3

set number " show line numbers
set showcmd " shows commands (try `55 j` for example and look in the bottom right)
set hlsearch " highlights search

" this chunk makes it so lines wrap nicely without chopping words in half
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" clear search with ,/
nmap <silent> ,/ :let@/=""<CR>

set list
set listchars=tab:\ \ ,trail:⠐,extends:#,nbsp:.

" Set to auto read when a file is changed from the outside
set autoread

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
