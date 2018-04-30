set nocompatible
filetype off

set exrc
set secure

call plug#begin('~/.vim/plugged')

" ycm
Plug 'Valloric/YouCompleteMe'

"NerdTree
Plug 'scrooloose/nerdtree'

"NerdCommneter
Plug 'scrooloose/nerdcommenter'

" C++ syntax exra color
Plug 'octol/vim-cpp-enhanced-highlight'

"auto read
Plug 'djoshea/vim-autoread'

"add this line to your .vimrc file
Plug 'mattn/emmet-vim'

"color pack
Plug 'flazz/vim-colorschemes'

"ack.vim
Plug 'mileszs/ack.vim'

"vim-clang-format
Plug 'rhysd/vim-clang-format'

"vim airline
Plug 'vim-airline/vim-airline'

"vim-buftabline
Plug 'ap/vim-buftabline'

"mercenary
Plug 'jlfwong/vim-mercenary'

"LeaderF
Plug 'Yggdroot/LeaderF'

"async run
Plug 'skywind3000/asyncrun.vim'

" easy motion
Plug 'easymotion/vim-easymotion'

"Ag
Plug 'rking/ag.vim'

"ultisnip
"Plug 'SirVer/ultisnips'

"gtest
Plug 'alepez/vim-gtest'

"vim bookmark
Plug 'MattesGroeger/vim-bookmarks'

"echodoc
Plug 'Shougo/echodoc.vim'

"ale
Plug 'w0rp/ale'

Plug 'mhinz/vim-signify'
call plug#end()


" tags
set tags=./.tags;,.tags

filetype plugin indent on

" Remap jj to Esc
inoremap jj <Esc>

" auto read files
set autoread

set noshowmode

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
if $TMUX== ''
    set clipboard=unnamed
endif

" mark 80 char line
set colorcolumn=80


" Mouse and backspace
"" set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = " "


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <Leader>n <esc>:bprev<CR>
map <Leader>m <esc>:bnext<CR>


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

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"bind f10 to build
nnoremap <f10> :wa <bar>copen<bar>AsyncRun ./build.pl b e 

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
colorscheme molokai_dark

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

" Seach selected text in visual mode
vnoremap // y<esc> :Asyncrun Ack '<C-R>"'<CR>copen<CR> 
" Seach word under curosr in normal mode
nnoremap //  yiw:AsyncRun Ag '<C-R>"'
" search with ctrl /
nnoremap <Leader><F5> :AsyncRun Ag 


" Useful settings
set history=700
set undolevels=700


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

" transparenty
if has("gui_macvim")
    set transparency=5
endif


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Allow switch buffer w/o saving
set hidden

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
"

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
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
map <Leader>g :YcmCompleter GoTo<CR>
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black

"ale
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

" signify
let g:signify_realtime=1
" replace vimgrep with ag
let g:ackprg = 'ag --vimgrep --depth 50'


" highlight current line
set cursorline

" folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

" lead F
let g:Lf_CommandMap = {'<Tab>': ['<ESC>']}
nnoremap <Leader>r :LeaderfBufTag <CR>


" fonts
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h12
  elseif has("gui_win32")
    set guifont=Consolas:h9:cANSI
  endif
endif

" always make quickfix windows takes whole horizontal space
au FileType qf wincmd J

" show white space
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list"

let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
