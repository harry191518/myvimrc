set nocompatible
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" Plugins
" vim-scripts
Plugin 'SelectBuf'
Plugin 'Wombat'
Plugin 'wombat256.vim'
Plugin 'genutils'
" github
Plugin 'groenewege/vim-less'
Plugin 'plasticboy/vim-markdown'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-git'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'Lokaltog/vim-easymotion'

"snippets
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle 'honza/vim-snippets'

Bundle 'The-NERD-tree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'taglist.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'

"Bundle 'autocomplpop'
Bundle 'Auto-Pairs'
Bundle 'Syntastic'
Bundle 'javacomplete'
Bundle 'Compile'
Bundle 'Conque-Shell'
Bundle 'majutsushi/tagbar'

Bundle 'tpope/vim-surround'
"Bundle 'klen/python-mode'
Bundle 'townk/vim-autoclose'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'fisadev/fisa-vim-colorscheme'
"Bundle 'scrooloose/syntastic'

call vundle#end()

set backupskip=/tmp/*,/private/tmp/*"

try
  colorscheme wombat256mod
catch
endtry

set background=dark
filetype plugin on
filetype indent on
syntax on

" autosettings
augroup mkd " markdown
  autocmd filetype mkd setlocal ai spell nofoldenable colorcolumn=80
augroup end

augroup commit
  autocmd filetype gitcommit,cvs setlocal spell textwidth=72 colorcolumn=73
augroup end

" enable the mouse
if has('mouse')
  set mouse=a
endif

" enable the status bar
set laststatus=2

if $powerline_font
  let g:airline_powerline_fonts = 1
endif

set hlsearch
set number
set tabstop=4
set wrap
set autoindent
set backspace=indent,eol,start
set ls=2
set wildmode=list:longest
set incsearch

" gui

if has("gui_running")
  colorscheme wombat

  if has("gui_win32") || has("gui_win32s")
    set guifont=ubuntu_mono_derivative_powerlin:h18
    let g:airline_powerline_fonts = 1
    set encoding=utf-8
    set fileencodings=ucs-bom,utf-8
  endif
endif

" mappings

"   tab nav
map ;] :tabnext<cr>
map ;[ :tabprevious<cr>

" work

set expandtab
set shiftwidth=2

let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|cvs$\|\.svn$\|target$',
  \ 'file': '\.class$\|\.so$',
  \ }
let g:ctrlp_extensions = ['dir', 'mixed']
let g:vundle_default_git_proto = 'git'

"Nerdtree 
let g:NERDTreeWinPos = "right"
map <f5> :NERDTreeToggle<cr>
nmap ,t :NERDTreeFind<cr>
let NERDTreeIgnore=['\.pyc$', '\pyo$']

"tlist
let g:tlistWinPos = "right"
let tlist_ctags_cmd='/users/rlai/bin/ctags-5.8/ctags'
let tlist_show_one_file=1
let tlist_exit_onlywindow=1
let tlist_use_right_window=1
let g:syntastic_check_on_open=1 

"javacomplete
setlocal omnifunc=javacomplete#Complete
autocmd filetype java inoremap <buffer> . .<c-x><c-o><c-p>

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{syntasticstatuslineflag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_signs=0
nmap <leader>e :Errors<CR>

"tagbar 
map <f4> :TagbarToggle<cr>
let g:Tagbar_AutoFocus=1

"Autoclose
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

"let g:pymode_lint_on_write=0
"let g:pymode_lint_signs=0
"let g:pymode_folding=0
"let g:pymode_rope=0

let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup=1
"let g:neocomplcache_enable_ignore_case=1
let g:neocomplcache_enable_smart_case=0
let g:neocomplcache_enable_auto_select=0
"let g:neocomplcache_enable_fuzzy_completion=1
"let g:neocomplcache_enable_underbar_completion=1
"let g:neocomplcache_fuzzy_completion_start_lenght=1
"let g:neocomplcache_auto_completion_start_length=1
"let g:neocomplcache_manual_completion_start_length=1
"let g:neocomplcache_min_keyword_length=1
let g:neocomplcache_min_syntax_length=3
let g:neocomplcache_same_filetype_lists={}
let g:neocomplcache_same_filetype_lists._='_'
