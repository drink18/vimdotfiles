" Sample .vimrc file by Martin Brochhaus
" Presented at PyCon APAC 2012

" vundle installation
set nocompatible
filetype off

"set the runtime paht to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let vundle manage Vunndle
Plugin 'VundleVim/Vundle.vim'

" ycm
Plugin 'Valloric/YouCompleteMe'

"ctrlp
Plugin 'kien/ctrlp.vim'

"YCM_generato
Plugin 'rdnetto/YCM-Generator'

"NerdTree
Plugin 'scrooloose/nerdtree'

"NerdCommneter
Plugin 'scrooloose/nerdcommenter'

" C++ syntax exra color
Plugin 'octol/vim-cpp-enhanced-highlight'

" Type script syntax
Plugin 'leafgarland/typescript-vim'

"auto read
Plugin 'djoshea/vim-autoread'

"add this line to your .vimrc file
Plugin 'mattn/emmet-vim'

" tsuquyomi
Plugin 'Quramy/tsuquyomi'

"color pack
Plugin 'flazz/vim-colorschemes'

"ack.vim
Plugin 'mileszs/ack.vim'

"vim-clang-format
Plugin 'rhysd/vim-clang-format'

"vim airline
Plugin 'vim-airline/vim-airline'

 " All of your plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" Brief hlep
"  :PluginList
"  :PluginInstall
"  :PluginSearch foo
"  :PluginClean 
"
" ============================================
" Note to myself:
" DO NOT USE <C-z> FOR SAVING WHEN PRESENTING!
" ============================================

" Remap jj to Esc
inoremap jj <Esc>

" auto read files
set autoread

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
set switchbuf+=usetab,newtab

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
if $TMUX== ''
    set clipboard=unnamed
endif


" Mouse and backspace
"" set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
"" noremap <C-n> :nohl<CR>
"" vnoremap <C-n> :nohl<CR>
"" inoremap <C-n> :nohl<CR>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
"" map <c-j> <c-w>j
"" map <c-k> <c-w>k
"" map <c-l> <c-w>l
"" map <c-h> <c-w>h


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" map sort function to a key
vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
"" vnoremap < <gv  " better indentation
"" vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
"" set number  " show line numbers
"" set tw=79   " width of document (used by gd)
"" set nowrap  " don't automatically wrap on load
"" set fo-=t   " don't automatically wrap text when typing
"" set colorcolumn=80
"" highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap


" Useful settings
"" set history=700
"" set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
" call pathogen#infect()


" ============================================================================
" Python IDE Setup
" ============================================================================


" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*.o,*.obj,.git,.svn,moc_*,*.html,*.map,*.png,*.md5
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|\.svn$\|Projects$\|External$\|artifacts$\|Documentation$',
  \ 'file': '\.o$\|\.obj$\|\.dylib$\|\.dll$\|moc_$\|.svn-base$|.html$\|.png$\|.map$\|.d$\|.dia$\|.meta$\|.md5$\|.preformat.bak$|.pdb$|.lump.cpp$'
  \ }
let g:ctrlp_cache_dir= $HOME . '/.cache/ctrlp'
"if executable('ag')
"  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"endif

" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
"
" and uncomment the part about jedi-vim instead
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

"" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>/ : NERDTreeFind<CR>
"nnoremap <C-m> :NERDTreeFind<CR>
let g:NERDTreeShowHidden=1

" line number
set rnu
set nu

" Disable annoying beeping
set noerrorbells
set vb t_vb=

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm.app"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" nerd commenter
noremap <C-k><C-k> :call NERDComment(0, "toggle") <c-m>

" c++ color
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1

set encoding=UTF-8


" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/github/vimdotfiles/.ycm_extra_conf.py'
map <Leader>g :YcmCompleter GoTo<CR>


" replace vimgrep with ag
let g:ackprg = 'ag --vimgrep'
nnoremap <C-M-f> :Ack
