" NerdTree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>/ : NERDTreeFind<CR>
"nnoremap <C-m> :NERDTreeFind<CR>
let g:NERDTreeShowHidden=1

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

" folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

" lead F
let g:Lf_CommandMap = {'<Tab>': ['<ESC>']}
nnoremap <Leader>r :LeaderfBufTag <CR>

"cscope
let g:gutentags_modules = []
	if executable('ctags')
		let g:gutentags_modules += ['ctags']
	endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

" gutentags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

let g:gutentags_ctags_tagfile = '.tags'

let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"Echodoc
let g:echodoc#enable_at_startup = 1

" vim bookmark
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1

" posero
let g:posero_default_mappings = 1
nnoremap <silent> <buffer> <up>    :call posero#PreviousLine()<CR>
nnoremap <silent> <buffer> <down>  :call posero#NextLine()<CR>
nnoremap <silent> <buffer> <right> :call posero#NextSlide()<CR>
nnoremap <silent> <buffer> <left>  :call posero#PreviousSlide()<CR>
