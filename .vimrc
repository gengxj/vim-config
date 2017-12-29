" bundle
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/vundle'

" colorscheme
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'tomasr/molokai'
Plugin 'sjl/badwolf'
Plugin 'desert256.vim'
Plugin 'https://github.com/tomtom/tcomment_vim.git'

" statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" tagbar
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'Tagbar'
Plugin 'taglist.vim'
Plugin 'winmanager'

" programming
" Bundle 'davidhalter/jedi-vim'
Bundle 'https://github.com/chazy/cscope_maps.git'
Plugin 'OmniCppComplete'
Bundle 'fugitive.vim'
Bundle 'echofunc.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Yggdroot/indentLine'
"let g:indentLine_fileType = ['c', 'cpp', 'h', 'hh', 'cc', 'python']
Bundle 'indentpython.vim'
Bundle 'Python-Syntax'
Bundle 'json.vim'

" editing
Bundle 'genutils'
Bundle 'Mark'
Bundle 'Auto-Pairs'
Bundle 'ctrlp.vim'
Bundle 'ag.vim'
Plugin 'mileszs/ack.vim'
Plugin 'delimitMate.vim'
Bundle 'bronson/vim-trailing-whitespace'

" file operations
Bundle 'git://github.com/tpope/vim-eunuch.git'


" syntax check
Plugin 'pyflakes'
Plugin 'vim-flake8'
Bundle 'scrooloose/syntastic'
Bundle 'python-mode-klen'

call vundle#end()

" delimitMate
let b:delimitMate_autoclose = 0
" for python docstring ", 特别有用
au FileType python let b:delimitMate_nesting_quotes = ['"']

" colorscheme
set background=dark
colorscheme desert

" taglist
let g:NERDTree_title = "NERDTree"
function! NERDTree_Start()
    exec '1wincmd w'
    exec 'q'
    exe 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction

let Tlist_Show_One_File=1    		"只显示当前文件的tags
let Tlist_Compart_Format = 1    	" 压缩方式
let Tlist_Exit_OnlyWindow=1  		"tagList窗口是最后一个窗口，则退出Vim
let g:winManagerWindowLayout='NERDTree|TagList'
let g:winManagerWidth = 30

" Tagbar
let g:tagbar_left = 1

" Bundle 'OmniCppComplete'
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 0
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
let OmniCpp_DisplayMode = 1
hi Pmenu ctermfg=0   	"  menu colors
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Auto-Pairs
let g:AutoPairsLoaded = 0

" Bundle 'Valloric/YouCompleteMe'
" disable boring syntax check
let g:ycm_show_diagnostics_ui=1
let g:ycm_register_as_syntastic_checker=1
let g:ycm_confirm_extra_conf=0

" complete strings and comments
let g:ycm_complete_in_strings=0
let g:ycm_complete_in_comments=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_seed_identifiers_with_syntax=1
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
let g:jedi#completions_enabled = 1

" Bundle 'Yggdroot/indentLine'
let g:indentLine_char = '|'
let g:indentLine_color_term = 239
let g:indentLine_fileType = ['python']
map <C-i> :IndentLinesToggle<CR>

" basic setting
set autoindent
set cindent
set hls
set incsearch				  "incrmental search
syntax on
set encoding=utf-8
set t_Co=256
set noautochdir 			  " disable auto change dir
set nobackup              		  " cloese backup
set autoread              		  " Set to auto read when a file is changed from the outside
set nofoldenable
set fdm=syntax            		  " floader lines
set textwidth=80
set wrap
" set cursorcolumn         		  " high light cursor column
" set cursorline           	          " high light cursor line
" hi CursorLine   cterm=NONE ctermbg=gray ctermfg=black guibg=NONE guifg=NONE
" highlight Search ctermfg=black ctermbg=yellow guifg=black guibg=yellow
set linespace=-2           		  " set line high space
set encoding=utf-8 			  " file encoding setting
set fileencodings=utf-8,gbk,ucs-bom,cp936 "redad file orders
set fenc=utf-8 				  "create new file encoding
set nobomb
set ignorecase smartcase 		  "search cease smart
set nocompatible
set backspace=indent,eol,start
set sm        				" bracket mactch
filetype plugin indent on
autocmd FileType cpp,java,sh,hh,cc,c,xml setlocal et sta sw=4 sts=4
" set list
set listchars=tab:»·,eol:↩,nbsp:·,extends:…,space:·,precedes:<,extends:>,trail:·

" json
au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
	autocmd!
	autocmd FileType json set autoindent
	autocmd FileType json set formatoptions=tcq2l
	autocmd FileType json set textwidth=80 shiftwidth=2
	autocmd FileType json set softtabstop=2 tabstop=8
	autocmd FileType json set expandtab
	autocmd FileType json set foldmethod=syntax
augroup END

" syntastic
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'
let g:syntastic_enable_balloons = 1
let g:syntastic_checkers=['pep8']
let g:syntastic_auto_jump = 1
let g:syntastic_enable_highlighting=1
let g:syntastic_mode_map = {
			\ "mode": "passive",
			\ "active_filetypes": [],
			\ "passive_filetypes": [] }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"修复syntastic使用:lnext和:lprev出现的跳转问题，同时修改键盘映射使用sn和sp进行跳转
function! <SID>LocationPrevious()
  try
    lprev
  catch /^Vim\%((\a\+)\)\=:E553/
    llast
  endtry
endfunction
function! <SID>LocationNext()
  try
    lnext
  catch /^Vim\%((\a\+)\)\=:E553/
    lfirst
  endtry
endfunction
nnoremap <silent> <Plug>LocationPrevious    :<C-u>exe 'call <SID>LocationPrevious()'<CR>
nnoremap <silent> <Plug>LocationNext        :<C-u>exe 'call <SID>LocationNext()'<CR>
nmap <silent> sp    <Plug>LocationPrevious
nmap <silent> sn    <Plug>LocationNext
"关闭syntastic语法检查, 鼠标复制代码时用到, 防止把错误标志给复制了
nnoremap <silent> <Leader>ec :SyntasticToggleMode<CR>

" airline
" set laststatus=2
let g:airline_theme="molokai"
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_nr_show = 0
"设置切换Buffer快捷键"
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
let g:airline_skip_empty_sections = 1
let g:airline_highlighting_cache = 0

" textwidth highlight
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
let &colorcolumn=join(range(&tw,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
au FileType cpp,cxx,c,h,hxx,cc,python,hh,sh setlocal number " colorcolumn=-0

" ctrlp
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 1

"python-mode
"开启警告
let g:pymode_warnings = 0
"保存文件时自动删除无用空格
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
"显示允许的最大长度的列
let g:pymode_options_colorcolumn = 1
"设置QuickFix窗口的最大，最小高度
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 10
"使用python3
let g:pymode_python = 'python3'
"使用PEP8风格的缩进
let g:pymode_indent = 1
"取消代码折叠
let g:pymode_folding = 0
"开启python-mode定义的移动方式
let g:pymode_motion = 1
"启用python-mode内置的python文档，使用K进行查找
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
"自动检测并启用virtualenv
let g:pymode_virtualenv = 1
"不使用python-mode运行python代码
let g:pymode_run = 0
"let g:pymode_run_bind = '<Leader>r'
"不使用python-mode设置断点
let g:pymode_breakpoint = 0
"let g:pymode_breakpoint_bind = '<leader>b'
"启用python语法检查
let g:pymode_lint = 1
let g:pymode_lint_ignore = "C901"
"修改后保存时进行检查
let g:pymode_lint_on_write = 1
"编辑时进行检查
let g:pymode_lint_on_fly = 0
let g:pymode_lint_checkers = ['pyflakes', 'pylint', 'pep8']
"发现错误时不自动打开QuickFix窗口
let g:pymode_lint_cwindow = 0
"侧边栏不显示python-mode相关的标志
let g:pymode_lint_signs = 1
"let g:pymode_lint_todo_symbol = 'WW'
"let g:pymode_lint_comment_symbol = 'CC'
"let g:pymode_lint_visual_symbol = 'RR'
"let g:pymode_lint_error_symbol = 'EE'
"let g:pymode_lint_info_symbol = 'II'
"let g:pymode_lint_pyflakes_symbol = 'FF'
"启用重构
let g:pymode_rope = 1
let g:ropevim_extended_complete = 1
"不在父目录下查找.ropeproject，能提升响应速度
let g:pymode_rope_lookup_project = 0
"光标下单词查阅文档
let g:pymode_rope_show_doc_bind = '<C-c>d'
"项目修改后重新生成缓存
let g:pymode_rope_regenerate_on_write = 1
"开启补全，并设置<C-Tab>为默认快捷键
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion_bind = '<C-Tab>'
"<C-c>g跳转到定义处，同时新建竖直窗口打开
let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:pymode_rope_goto_definition_cmd = 'vnew'
"重命名光标下的函数，方法，变量及类名
let g:pymode_rope_rename_bind = '<C-c>rr'
"重命名光标下的模块或包
let g:pymode_rope_rename_module_bind = '<C-c>r1r'
"开启python所有的语法高亮
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
"高亮缩进错误
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"高亮空格错误
let g:pymode_syntax_space_errors = g:pymode_syntax_all

function! ToggleErrors()
	let loclist=g:PymodeLocList.current()
	let old_last_winnr = winnr('$')
	lclose
	if old_last_winnr == winnr('$')
		" Nothing was closed, open syntastic error location panel
		call loclist.show()
	endif
endfunction
