" Modeline And Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldenable foldmarker={,} foldlevel=0 foldmethod=marker:
"
"        _   __(_)___ ___  / __(_) /__  _____
"       | | / / / __ `__ \/ /_/ / / _ \/ ___/
"       | |/ / / / / / / / __/ / /  __(__  )
"       |___/_/_/ /_/ /_/_/ /_/_/\___/____/
"
"   This is the personal vimrc file.
"   While much of it is beneficial for general use, I would
"   recommend picking out the parts you want and understand.
" }

" Load Plugins {
    if filereadable(expand("~/.vim/vimrc.plugins"))
        source ~/.vim/vimrc.plugins
    endif
" }

" General {
    let mapleader=","                   " Leader is comma

    " Misc {
        set hidden                           " Hide files in the background instead of closing them
        set confirm                          " Display a confirmation dialog when closing an unsaved file
        set autoread                         " Automatically re-read files if modified outside Vim
        set autochdir                        " Change working directory to open buffer
        set lazyredraw                       " Don't update screen during macro and script execution
        set backspace=indent,eol,start       " Allow backspacing over indention, line breaks and insertion start
        set ttyfast                          " More characters sent to the screen for redrawing
    " }

    " Completion {
        set shortmess+=c                     " Shut off completion messages
        " User dictionary for <c-x><c-k>
        set dictionary+=~/.vim/dictionary/google-10000-english-usa-no-swears.txt
        autocmd FileType php            setlocal complete+=k~/.vim/dictionary/PHP.dict
        autocmd FileType css            setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown  setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript     setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python         setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType php            setlocal omnifunc=phpcomplete#CompletePHP
        autocmd FileType xml            setlocal omnifunc=xmlcomplete#CompleteTags
    " }

    " Indention {
        set autoindent                  " New lines inherit the indentation of previous lines
        set expandtab                   " Convert tabs to spaces
        set shiftwidth=4                " When shifting, indent using four spaces
        set shiftround                  " When shifting lines, round the indentation to the nearest multiple of 'shiftwidth'
        set tabstop=4                   " Indent using four spaces
        set smarttab                    " Insert 'tabstop' number of spaces when the 'tab' key is pressed
        set softtabstop=4               " Number of spaces in tab when editing
    " }

    " Search {
        set ignorecase                  " Case insensitive search
        set smartcase                   " Case sensitive when uc present
        set incsearch                   " Search as characters are entered
        set hlsearch                    " Highlight matches
        runtime! macros/matchit.vim     " Enhance '%'
    " }

    " Text Rendering {
        filetype indent on              " Load indent files
        filetype plugin on              " Load ftplugins files
        syntax enable                   " Enable syntax highlighting.
        set nowrap                      " Disable line wrapping.
        set showmatch                   " Highlight matching [{()}]
        set linebreak                   " Avoid wrapping a line in the middle of a word
        set scrolloff=3                 " The number of screen lines to keep above and below the cursor
        set sidescrolloff=7             " The number of screen columns to keep to the left and right of the cursor
        set encoding=utf-8              " Use an encoding that supports unicode
        set display+=lastline           " Always try to show a paragraph’s last line
        set list                        " Enable display invisible characters
        set listchars=tab:›\ ,trail:•,extends:‹,nbsp:⋅ " Highlight problematic whitespace
        set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 " Set fileencoding list
        " Markdown {
            " Highlight language codes
            let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'php']
            let g:markdown_syntax_conceal = 0
        " }
    " }

    " User Interface {
        set mousehide                   " Hide the mouse cursor while typing
        set showmode                    " Display the current mode
        set t_Co=256                    " Tell the term has 256 colors
        set showcmd                     " Show command in bottom bar
        set laststatus=2                " Always show last window status
        set ruler                       " Always show cursor position.
        set wildmenu                    " Display command line’s tab complete options as a menu.
        set wildignore=*.o,*.pyc,*~     " Ignore files matching these patterns when opening files based on a glob pattern
        set wildmode=list:longest,full  " Command <tab> completion, list matches, then longest common part, then all.
        set tabpagemax=50               " Maximum number of tab pages that can be opened from the command line.
        set number                      " Show line numbers on the sidebar.
        " These settings will cause vim scrolling slowly
        " set relativenumber              " Show line number on the current line and relative numbers on all other lines.
        " set cursorline                  " Highlight the line currently under cursor.
        " set cursorcolumn                " Highlight the column currently under cursor.
        set noerrorbells                " Disable beep on errors.
        set visualbell                  " Flash the screen instead of beeping on errors.
        set title                       " Set the window's title, reflecting the file currently being edited.
        set background=dark             " Use colors that suit a dark background.
        highlight clear SignColumn      " SignColumn should match background
        highlight clear LineNr          " Current line number row will have same background color in relative mode
    " }

    " Split {
        set splitright                  " Puts new vsplit windows to the right of the current
        set splitbelow                  " Puts new split windows to the bottom of the current
    " }

    " Fold {
        set foldnestmax=3               " Deepest fold is 3 levels
        set foldmethod=indent           " Fold by indent
        set nofoldenable                " Disable auto fold by default
    " }

    " Swap & Undo {
        set swapfile                    " Enable create swap file
        set directory=~/.vim/swapfiles  " Set swap files location
        set undofile                    " Enable create undo file
        set undodir=~/.vim/undofiles    " Set undo files location
        set history=1000                " Increase the undo limit
    " }

    " Typo {
        iabbrev vedio video
        iabbrev Vedio Video
        iabbrev teh the
        iabbrev xdt <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
        command! -bang -nargs=* -complete=file E e<bang> <args>
        command! -bang -nargs=* -complete=file W w<bang> <args>
        command! -bang -nargs=* -complete=file Wq wq<bang> <args>
        command! -bang -nargs=* -complete=file WQ wq<bang> <args>
        command! -bang Wa wa<bang>
        command! -bang WA wa<bang>
        command! -bang Q q<bang>
        command! -bang QA qa<bang>
        command! -bang Qa qa<bang>
    " }

    " Autogroups {
        augroup configgroup
            autocmd!
            " Don't continue comments when pushing o/O
            autocmd filetype * set formatoptions-=o
            " Delete comment characters when joining lines
            autocmd filetype * set formatoptions+=j
            " Set filetype of .md file
            autocmd BufNewFile,BufReadPost *.md set filetype=markdown
            " Auto strip trailing whitespace
            autocmd filetype python,rust,twig,xml,yml,perl,sql autocmd bufwritepre <buffer> call <sid>StripTrailingWhitespaces()
            autocmd filetype c,cpp,java,go,php,javascript,puppet autocmd bufwritepre <buffer> call <sid>StripTrailingWhitespaces()
            " Specific settings for languages
            autocmd filetype java,makefile setlocal noexpandtab
            autocmd filetype ruby,shell,markdown setlocal tabstop=2 shiftwidth=2 softtabstop=2
            " Auto close preview window while lease insert model
            autocmd InsertLeave * pclose
            " Enable folder
            autocmd filetype php,cpp,c set foldmethod=marker foldmarker={,}
        augroup end
    " }

    " Special-for-php {
        " Speed-ups of syntax highlighting
        let g:php_html_load       = 0
        let g:php_html_in_nowdoc  = 0
        let g:php_html_in_heredoc = 0
        let g:php_sql_query       = 0
        let g:php_sql_nowdoc      = 0
        let g:php_sql_heredoc     = 0
    " }
" }

" Key Mappings {
    " Show vim help file
    noremap <F3> :sp ~/.vim/vimrc.md<CR>
    " Edit vimrc and load vimrc bindings
    nnoremap <leader>ev :e $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>
    " Buffer
    nnoremap <leader>t :enew<cr>
    nnoremap <leader>l :bnext<cr>
    nnoremap <leader>h :bprevious<cr>
    nnoremap <leader>bq :bn <bar> bd #<cr>
    nnoremap <leader>bl :ls<cr>
    nnoremap <leader>bu :buffer 
    " Open/close relative line number
    nnoremap <leader>nn :call ToggleNumber()<cr>
    " Move vertically by visual line
    nnoremap j gj
    nnoremap k gk
    " Quick move in window
    noremap <c-j> <c-w>j
    noremap <c-k> <c-w>k
    noremap <c-l> <c-w>l
    noremap <c-h> <c-w>h
    " Turn off search highlight
    nnoremap <leader><space> :nohlsearch<cr>
    " Space open/closes folds
    nnoremap <space> za
    " Move to beginning/end of line
    nnoremap B ^
    nnoremap E $
    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv
    " 'jk' is escape
    inoremap jk <esc>
    " Repeat in visual mode
    vnoremap . :normal .<cr>
    " Find merge conflict markers
    noremap <leader>fc /\v^[(<<<<<<<)\|(=======)\|(>>>>>>>)](.*\|$)<CR>
    " Change Working Directory to that of the current file
    cnoremap cwd lcd %:p:h
    cnoremap cd. lcd %:p:h
    " Easy way to open file in current directory
    noremap <leader>ew :e <c-r>=expand("%:p:h") . "/" <CR>
    noremap <leader>es :vs <c-r>=expand("%:p:h") . "/" <CR>

    " Display all lines with keyword under cursor
    nnoremap <leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
    " Easier horizontal scrolling
    noremap zl zL
    noremap zh zH
    " Fast paste setting
    set pastetoggle=<F2>
" }

" Plugins Config {
    " colorscheme {
        if isdirectory(expand("~/.vim/bundle/vim-colorschemes"))
            colorscheme gruvbox
        endif
    " }

    " nerdtree {
        if isdirectory(expand("~/.vim/bundle/nerdtree"))
            noremap <c-e> :NERDTreeToggle<cr>
            let g:NERDTreeShowBookmarks=1
            let g:NERDTreeWinSize=25
            " let g:NERDTreeChDirMode=2
            let NERDTreeIgnore=['.vscode', '.*DS_Store', '\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
            autocmd stdinreadpre * let s:std_in=1
            " Open a directory with NERDTree
            autocmd vimenter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
            " Quit vim while no buffer exists
            autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
            " Auto open NERDTree while no file specified
            if isdirectory(expand("~/.vim/bundle/vim-startify/"))
                autocmd VimEnter * if !argc() | Startify | NERDTree | wincmd w | endif
            else
                autocmd vimenter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
            endif
        endif
    " }

    " gundo.vim {
        if isdirectory(expand("~/.vim/bundle/gundo.vim"))
            nnoremap <leader>u :GundoToggle<cr>
        endif
    " }

    " EasyMotion {
        if isdirectory(expand("~/.vim/bundle/vim-easymotion"))
            let g:EasyMotion_smartcase = 0
            nmap gc <Plug>(easymotion-overwin-f)
            nmap gw <Plug>(easymotion-overwin-f2)
        endif
    " }

    " ack {
        if isdirectory(expand("~/.vim/bundle/ack.vim"))
            nnoremap <leader>a :Ack 
        endif
    " }

    " ctrlp {
        if isdirectory(expand("~/.vim/bundle/ctrlp.vim"))
            let g:ctrlp_map='<leader>p'
            let g:ctrlp_cmd='CtrlP'
            noremap <leader>m :CtrlPMRU<cr>
            noremap <leader>bb :CtrlPBuffer<cr>
            noremap <leader>ft :CtrlPTag<cr>
            let g:ctrlp_working_path_mode = 'ra'
            let g:ctrlp_max_height=10
            let g:ctrlp_mruf_max=200
            let g:ctrlp_match_window = 'bottom,order:ttb'
            let g:ctrlp_custom_ignore = {
              \ 'dir':  '\v[\/]\.(git|hg|svn)$',
              \ 'file': '\v\.(exe|so|dll|pyc)$',
              \ }
            if executable('ag')
                let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
            elseif executable('ack')
                let s:ctrlp_fallback = 'ack %s --nocolor -f'
            else
                let s:ctrlp_fallback = 'find %s -type f'
            endif
            let g:ctrlp_user_command = {
                \ 'types': {
                    \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                    \ 2: ['.hg', 'hg --cwd %s locate -i .'],
                \ },
                \ 'fallback': s:ctrlp_fallback
            \ }
            " ctrlpfunky {
                if isdirectory(expand('~/.vim/bundle/ctrlp-funky'))
                    let g:ctrlp_extensions = ['funky']
                    nnoremap <leader>fu :CtrlPFunky<cr>
                    " Narrow the list down with a word under cursor
                    nnoremap <leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<cr>
                    let g:ctrlp_funky_matchtype = 'path'
                    let g:ctrlp_funky_syntax_highlight = 1
                endif
            " }
        endif
    " }

    " Rainbow {
        if isdirectory(expand('~/.vim/bundle/rainbow'))
            let g:rainbow_active = 1
            let g:rainbow_conf = {
            \    'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \    'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
            \    'operators': '_,_',
            \    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \    'separately': {
            \        '*': {},
            \        'tex': {
            \            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \        },
            \        'vim': {
            \            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimfuncbody', 'start=/\[/ end=/\]/ containedin=vimfuncbody', 'start=/{/ end=/}/ fold containedin=vimfuncbody'],
            \        },
            \        'xml': {
            \            'syn_name_prefix': 'xmlRainbow',
            \            'parentheses': ['start=/\v\<\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'))?)*\>/ end=#</\z1># fold'],
            \        },
            \        'html': {
            \            'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-za-z0-9]+)(\s+[-_:a-za-z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \        },
            \        'php': {
            \            'syn_name_prefix': 'phpBlockRainbow',
            \            'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold', 'start=/(/ end=/)/ containedin=@htmlPreproc contains=@phpClTop', 'start=/\[/ end=/\]/ containedin=@htmlPreproc contains=@phpClTop', 'start=/{/ end=/}/ containedin=@htmlPreproc contains=@phpClTop'],
            \        },
            \        'css': 0,
            \    }
            \}
        endif
    " }

    " Fugitive {
        if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
            nnoremap <silent> <leader>gs :Gstatus<CR>
            nnoremap <silent> <leader>gd :Gdiff<CR>
            nnoremap <silent> <leader>gc :Gcommit<CR>
            nnoremap <silent> <leader>gb :Gblame<CR>
            nnoremap <silent> <leader>gl :Glog<CR>
            nnoremap <silent> <leader>gp :Git push<CR>
            nnoremap <silent> <leader>gr :Gread<CR>
            nnoremap <silent> <leader>gw :Gwrite<CR>
            nnoremap <silent> <leader>ge :Gedit<CR>
            nnoremap <silent> <leader>gi :Git add -p %<CR>
        endif
    " }

    " signify {
        if isdirectory(expand("~/.vim/bundle/vim-signify"))
            nnoremap <silent> <leader>gg :SignifyToggle<CR>
        endif

    " }

    " vim-indent-guides {
        if isdirectory(expand("~/.vim/bundle/vim-indent-guides"))
            let g:indent_guides_enable_on_vim_startup = 1
            let g:indent_guides_guide_size = 1
            let g:indent_guides_start_level = 2
            let g:indent_guides_exclude_filetypes=['nerdtree', 'help']
        endif
    " }

    " nerdcommenter {
        if isdirectory(expand("~/.vim/bundle/nerdcommenter"))
            " Add spaces after comment delimiters by default
            " let g:NERDSpaceDelims = 1
            " Use compact syntax for prettified multi-line comments
            let g:NERDCompactSexyComs = 1
            " Align line-wise comment delimiters flush left instead of following code indentation
            let g:NERDDefaultAlign = 'left'
        endif
    " }

    " vim-gutentags {
        if isdirectory(expand("~/.vim/bundle/vim-gutentags"))
            " User defined root markers
            let g:gutentags_project_root = ['.project']
        endif
    " }

    " tagbar {
        if isdirectory(expand("~/.vim/bundle/tagbar"))
            nmap <leader>tt :TagbarToggle<CR>
        endif
    " }

    " lightline.vim {
        if isdirectory(expand("~/.vim/bundle/lightline.vim"))
            set noshowmode " Do not show current mode in command line
            let g:lightline = {
                \ 'colorscheme': 'wombat',
                \ 'component': {
                \   'lineinfo': '%3l:%-2v',
                \ },
                \ 'subseparator': { 'left': '│', 'right': '│' },
                \ 'active': {
                \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
                \   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
                \ },
                \ 'component_function': {
                \   'fugitive': 'LightlineFugitive',
                \   'filename': 'LightlineFilename',
                \   'fileformat': 'LightlineFileformat',
                \   'filetype': 'LightlineFiletype',
                \   'fileencoding': 'LightlineFileencoding',
                \   'mode': 'LightlineMode',
                \   'ctrlpmark': 'CtrlPMark',
                \ },
            \ }

            function! LightlineModified() " {
                return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
            endfunction " }

            function! LightlineReadonly() " {
                return &readonly ? 'ℝ' : ''
            endfunction " }

            function! LightlineFilename() " {
                let fname = expand('%:t')
                return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
                        \ fname == '__Tagbar__' ? g:lightline.fname :
                        \ fname =~ '__Gundo\|NERD_tree' ? '' :
                        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
                        \ &ft == 'unite' ? unite#get_status_string() :
                        \ &ft == 'vimshell' ? vimshell#get_status_string() :
                        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
                        \ ('' != fname ? fname : '[No Name]') .
                        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
            endfunction " }

            function! LightlineFugitive() " {
                try
                    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
                        let mark = '♨ '
                        let branch = fugitive#head()
                        return branch !=# '' ? mark.branch : ''
                    endif
                catch
                endtry
                return ''
            endfunction " }

            function! LightlineFileformat() " {
                return winwidth(0) > 70 ? &fileformat : ''
            endfunction " }

            function! LightlineFiletype() " {
                return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'NF') : ''
            endfunction " }

            function! LightlineFileencoding() " {
                return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
            endfunction " }

            function! LightlineMode() " {
                let fname = expand('%:t')
                return fname == '__Tagbar__' ? 'Tagbar' :
                        \ fname == 'ControlP' ? 'CtrlP' :
                        \ fname == '__Gundo__' ? 'Gundo' :
                        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
                        \ fname =~ 'NERD_tree' ? 'NERDTree' :
                        \ &ft == 'unite' ? 'Unite' :
                        \ &ft == 'vimfiler' ? 'VimFiler' :
                        \ &ft == 'vimshell' ? 'VimShell' :
                        \ winwidth(0) > 60 ? lightline#mode() : ''
            endfunction " }

            function! CtrlPMark() " {
                if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
                    call lightline#link('iR'[g:lightline.ctrlp_regex])
                    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
                        \ , g:lightline.ctrlp_next], 0)
                else
                    return ''
                endif
            endfunction " }

            let g:ctrlp_status_func = {
                \ 'main': 'CtrlPStatusFunc_1',
                \ 'prog': 'CtrlPStatusFunc_2',
            \ }

            function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked) " {
                let g:lightline.ctrlp_regex = a:regex
                let g:lightline.ctrlp_prev = a:prev
                let g:lightline.ctrlp_item = a:item
                let g:lightline.ctrlp_next = a:next
                return lightline#statusline(0)
            endfunction " }

            function! CtrlPStatusFunc_2(str) " {
                return lightline#statusline(0)
            endfunction " }

            let g:tagbar_status_func = 'TagbarStatusFunc'

            function! TagbarStatusFunc(current, sort, fname, ...) abort " {
                let g:lightline.fname = a:fname
                return lightline#statusline(0)
            endfunction " }

            let g:unite_force_overwrite_statusline = 0
            let g:vimfiler_force_overwrite_statusline = 0
            let g:vimshell_force_overwrite_statusline = 0
        endif
    " }

    " ale {
        if isdirectory(expand("~/.vim/bundle/ale"))
            " let g:ale_fixers = {
            " \   'javascript': ['eslint'],
            " \}
            let g:ale_linters = {
            \   'python': ['flake8'],
            \}
            " Lint on save only
            " let g:ale_lint_on_text_changed = 1
            " let g:ale_lint_on_enter = 1
            " let g:ale_lint_on_save = 1
            nmap <silent> <leader>k <Plug>(ale_previous_wrap)
            nmap <silent> <leader>j <Plug>(ale_next_wrap)
            let g:ale_list_window_size = 5
        endif
    " }

    " vim-buftabline {
        if isdirectory(expand("~/.vim/bundle/vim-buftabline"))
            let g:buftabline_indicators = 1
            hi BufCurrent term=reverse ctermfg=235 ctermbg=208 guifg=#282828 guibg=#fe8019
            hi BufActive cterm=reverse gui=reverse
            hi BufHidden ctermfg=223 ctermbg=239 guifg=#ebdbb2 guibg=#504945
            hi! link BufTabLineCurrent BufCurrent
            hi! link BufTabLineActive  BufActive
            hi! link BufTabLineHidden  BufHidden
        endif
    " }

    " Ultisnips {
        if isdirectory(expand("~/.vim/bundle/ultisnips/"))
            let g:UltiSnipsListSnippets="<c-b>"
            let g:UltiSnipsExpandTrigger="<c-k>"
            let g:UltiSnipsJumpForwardTrigger="<c-l>"
            let g:UltiSnipsJumpBackwardTrigger="<c-h>"
            let g:snips_author = '杨浩 <yanghao14@baidu.com>'

            " Get UltiSnips complete options
            function! GetCompletionOptions(...) " {
                let l:list = (exists('a:1') && type('a:1') == 3) ? a:1 : []
                let l:snippets = UltiSnips#SnippetsInCurrentScope()
                if empty(l:snippets)
                    return l:list
                endif
                for l:snip in keys(l:snippets)
                    call add(l:list, {
                    \       'word' : l:snip,
                    \       'menu' : '[US] ' . get(l:snippets, l:snip),
                    \ })
                endfor
                if (len(l:list) <= 12)
                    let l:list = sort(l:list)
                endif
                return l:list
            endfunction " }

            " Show up ultisnips snippets in a completion menu
            function! CompleteUltiSnips(findstart, base) " {
                if a:findstart
                    let l:start = col('.') - 1
                    let l:line = getline('.')
                    while l:start > 0 && l:line[l:start - 1] =~# '\a'
                        let l:start -= 1
                    endwhile
                    let s:options = GetCompletionOptions()
                    if len(s:options) == 1
                        let l:line = getline('.')[l:start : len( getline('.')) - 1]
                        if l:line ==#  s:options[0]['word']
                            call UltiSnips#ExpandSnippet()
                        else
                            call complete(l:start+1, s:options)
                        endif
                        return -3
                    endif
                    return l:start
                else
                    return s:options
                endif
            endfunction " }

            set completefunc=CompleteUltiSnips
        endif
    " }

    " nerdtree-git {
        if isdirectory(expand("~/.vim/bundle/nerdtree-git-plugin/"))
            let g:NERDTreeIndicatorMapCustom = {
                \ "Modified"  : "✹",
                \ "Staged"    : "✚",
                \ "Untracked" : "✭",
                \ "Renamed"   : "➜",
                \ "Unmerged"  : "═",
                \ "Deleted"   : "✖",
                \ "Dirty"     : "✗",
                \ "Clean"     : "✔︎",
                \ 'Ignored'   : '☒',
                \ "Unknown"   : "?"
            \ }
        endif
    " }

    " youdao-translater {
        if isdirectory(expand("~/.vim/bundle/vim-youdao-translater/"))
            vnoremap <silent> <C-T> :<C-u>Ydv<CR>
            nnoremap <silent> <C-T> :<C-u>Ydc<CR>
            noremap <leader>yd :<C-u>Yde<CR>
        endif
    " }

    " easy-align {
        if isdirectory(expand("~/.vim/bundle/vim-easy-align/"))
            xmap ga <Plug>(EasyAlign)
            nmap ga <Plug>(EasyAlign)
        endif
    " }

    " gv {
        if isdirectory(expand("~/.vim/bundle/gv.vim/"))
            nnoremap <leader>gv :GV<cr>
            xnoremap <leader>gv :GV<cr>
            nnoremap <leader>g. :GV!<cr>
            nnoremap <leader>gl :GV?<cr>
            xnoremap <leader>gl :GV?<cr>
        endif
    " }

    " startify {
        if isdirectory(expand("~/.vim/bundle/vim-startify/"))
            let g:startify_enable_special      = 0
            let g:startify_files_number        = 8
            let g:startify_change_to_dir       = 1
            let g:startify_session_autoload    = 1
            let g:startify_session_persistence = 1
            let g:startify_custom_header = [
                        \ " _ .-') _                      _   .-')                _  .-')     ('-.   ",
                        \ "( (  OO) )                    ( '.( OO )_             ( \\( -O )  _(  OO)  ",
                        \ "\\     .'_  .-'),-----.        ,--.   ,--.).-'),-----. ,------. (,------.  ",
                        \ ",`'--..._)( OO'  .-.  '       |   `.'   |( OO'  .-.  '|   /`. ' |  .---'  ",
                        \ "|  |  \\  '/   |  | |  |       |         |/   |  | |  ||  /  | | |  |      ",
                        \ "|  |   ' |\\_) |  |\\|  |       |  |'.'|  |\\_) |  |\\|  ||  |_.' |(|  '--.   ",
                        \ "|  |   / :  \\ |  | |  |       |  |   |  |  \\ |  | |  ||  .  '.' |  .--'   ",
                        \ "|  '--'  /   `'  '-'  '       |  |   |  |   `'  '-'  '|  |\\  \\  |  `---.  ",
                        \ "`-------'      `-----'        `--'   `--'     `-----' `--' '--' `------'  ",
                \]
            let g:startify_session_dir = '~/.vim/sessionfiles'
            let g:startify_bookmarks = [
                    \ ]
            let g:startify_lists = [
                \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
                \ { 'type': 'sessions',  'header': ['   Sessions']       },
                \ { 'type': 'files',     'header': ['   MRU']            },
                \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
                \ { 'type': 'commands',  'header': ['   Commands']       },
                \ ]
            let g:startify_session_before_save = [
                \ 'silent! NERDTreeClose'
                \ ]
            nnoremap <leader>ss :SSave! 
            nnoremap <leader>sd :SDelete! 
            nnoremap <leader>sl :SLoad 
            nnoremap <leader>sc :SClose 
        endif
    " }

    " Rooter {
        if isdirectory(expand("~/.vim/bundle/vim-rooter/"))
            let g:rooter_patterns = ['.project', '.git/']
            let g:rooter_resolve_links = 1
            let g:rooter_silent_chdir = 1
            autocmd bufwinenter * :Rooter
        endif
    " }

    " vimwiki {
        if isdirectory(expand("~/.vim/bundle/vimwiki/"))
            let g:vimwiki_list = [{'path': '~/.vim/wikifiles/'}]
            map <Leader>da <Plug>VimwikiToggleListItem
        endif
    " }
" }

" Functions {
    " Toggle between number and relativenumber
    function! ToggleNumber() " {
        if(&relativenumber == 1)
            set norelativenumber
            set number
        else
            set number
            set relativenumber
        endif
    endfunction " }

    " Strips trailing whitespace at the end of files
    function! <sid>StripTrailingWhitespaces() " {
        " Save last search & cursor position
        let _s=@/
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        let @/=_s
        call cursor(l, c)
    endfunction " }
" }
