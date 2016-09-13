set nocompatible
autocmd!


"""
" Plugins
"
if filereadable(glob('~/.vim/vimrc.plugins'))
  source ~/.vim/vimrc.plugins
endif

" Fzf
let g:fzf_layout = { 'window': 'enew' }


" Airline
let g:airline_powerline_fonts = 1
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

" Syntastic
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

" YouCompleteMe
let g:ycm_filetype_blacklist = { 'python' : 1 }


" GitGutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager    = 0


"""
" Settings
"
filetype plugin indent on
syntax on

runtime macros/matchit.vim

colorscheme Tomorrow-Night-Eighties

set autoindent
set backspace=indent,eol,start
set backupdir=~/.vim/tmp/backup
set dir=~/.vim/tmp/swap/
set encoding=utf-8
set expandtab
set exrc
set hidden
set history=1000
set hlsearch
set incsearch
set iskeyword+=-
set laststatus=2
set listchars=tab:▸\ ,eol:¬
set number
set scrolloff=3
set shell=/bin/bash
set shiftwidth=2
set showcmd
set showmode
set smarttab
set softtabstop=2
set tabstop=2
set undodir=~/.vim/tmp/backup
set undofile
set visualbell
set wildignore=*.DS_Store,*.dSYM,*.log,*.o,*.ss~
set wildmode=list:longest


"""
" Mappings
"
let mapleader = ","

nnoremap <leader>i :set list!<CR>
nnoremap <leader>t :NERDTreeToggle<CR>

" Fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>F :Files %:p:h<CR>
nnoremap <leader>b :Buffers<CR>

" Tabular
nnoremap <Leader>a= :Tabularize /=>\=<CR>
vnoremap <Leader>a= :Tabularize /=>\=<CR>
nnoremap <Leader>a: :Tabularize/\w:\zs/l0l1<CR>
vnoremap <Leader>a: :Tabularize/\w:\zs/l0l1<CR>
nnoremap <Leader>a, :Tabularize /,\zs/l0r1<CR>
vnoremap <Leader>a, :Tabularize /,\zs/l0r1<CR>
nnoremap <Leader>a* :Tabularize /\(\((^.\+\)\\|\(*\=\S\+\)\);<CR>
vnoremap <Leader>a* :Tabularize /\(\((^.\+\)\\|\(*\=\S\+\)\);<CR>

" Faster scrolling
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

" Faster search and replace
noremap <leader>s :%s//g<LEFT><LEFT>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Scroll through command history
cnoremap <c-n> <down>
cnoremap <c-p> <up>

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


"""
" Commands
"
command! StripWhitespace %s/\s\+$//e | noh


"""
" Auto Commands
"
augroup filetypes
  autocmd BufRead,BufNewFile {*.markdown,*.md} set filetype=markdown
  autocmd BufRead,BufNewFile {Gemfile,Vagrantfile,*.arb} set filetype=ruby

  autocmd FileType objc,c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
  autocmd FileType go setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
  autocmd FileType markdown setlocal linebreak
augroup END


"""""
" GUI prefs
"
if has("gui_running")
  set guifont=Monaco\ for\ Powerline:h13

  " Remove toolbar
  set go-=T

  " Remove scrollbar
  set go-=r

  " Transparent BG
  set bg=dark
  if &background == "dark"
    set transp=3
  end

  " Set width to 120 and fill height
  set lines=999 columns=120
  "set fuoptions=maxvert

  if has("ballooneval")
    set noballooneval " disable hover tooltips
  endif
else
  set ttimeoutlen=100
endif

"highlight clear SignColumn


"""
" Other config files
"
if filereadable(glob('~/.vim/vimrc.rails'))
  source ~/.vim/vimrc.rails
endif

silent execute '!mkdir -p $HOME/.vim/tmp/backup'
silent execute '!mkdir -p $HOME/.vim/tmp/swap'
silent execute '!mkdir -p $HOME/.vim/tmp/undo'
