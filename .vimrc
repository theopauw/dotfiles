set nocompatible
set tabstop=2
set shiftwidth=2
set et
set number
set relativenumber
set autoindent
set incsearch
set hlsearch
set nofixeol
set list
"will be overridden by everforest if we have vim-plug
colo desert
syntax on
"redrawing is timing out
set redrawtime=10000
set encoding=UTF-8

"oo/OO - add new line without going into insert mode
nmap oo o<Esc>
nmap OO O<Esc>

"fold settings
set foldmethod=syntax
set nofoldenable

"allow project specific .vimrc, but secure it
set exrc
set secure

"remap j and k to use virtual lines
"unless you give them a number to jump ie 4j or 6k
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

"close html tags when you type ,/
imap ,/ </<C-X><C-O><Esc>F<i

"don't continue comments
autocmd BufNewFile,BufRead * setlocal formatoptions-=r

"autocomplete brackets
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()
inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap [[     [
inoremap []     []
inoremap "      ""<Left>
inoremap ""      "
inoremap `      ``<Left>
inoremap ``      `

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"matchit - use % to jump html tags
runtime macros/matchit.vim

"omnicomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"gvim hide stuff
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar

"
"
"
"
"Rest depends on whether we have Vim-plug
"Set up to be portable
"
"
"
"
"
if ! empty(globpath(&rtp, 'autoload/plug.vim'))
  """""""""""vim plug: which plugins?""""""""""""""""""""
  call plug#begin()

  "Plug 'preservim/nerdtree'
  "Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-fugitive'
  "Plug 'vim-airline/vim-airline'
  Plug 'itchyny/lightline.vim'
  Plug 'mattn/emmet-vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'EdenEast/nightfox.nvim'
  Plug 'sainnhe/everforest'
  Plug 'puremourning/vimspector'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'ntpeters/vim-better-whitespace'

  call plug#end()

  """""""""""FZF"""""""""""""""""""""""""""""""""""
  " Enter should open in a new tab by default
  let g:fzf_action = { 'enter': 'tab split' }

  """""""""""NERDTree"""""""""""""""""""""""""""""""""""
  " Start NERDTree and put the cursor back in the other window.
  "autocmd VimEnter * NERDTree | wincmd p
  " Exit Vim if NERDTree is the only window remaining in the only tab.
  "autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  " Open the existing NERDTree on each new tab.
  "autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

  """""""""""""EverForest""""""""""""""""""
  " Important!!
  if has('termguicolors')
    set termguicolors
  endif

  set background=dark
  "set background=light

  """""""""""""EverForest""""""""""""""""""
  " Set contrast.
  " This configuration option should be placed before `colorscheme everforest`.
  " Available values: 'hard', 'medium'(default), 'soft'
  let g:everforest_background = 'hard'

  " For better performance
  let g:everforest_better_performance = 1

  colorscheme everforest

  """""""""""""LightLine""""""""""""""""""
  set laststatus=2
  set noshowmode
  let g:lightline = {}
  let g:lightline.colorscheme = "everforest"
  let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
  let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
  let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
  let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
  "let g:lightline#asyncrun#indicator_none = ''
  "let g:lightline#asyncrun#indicator_run = 'Running...'
  "if g:vim_lightline_artify == 0
    let g:lightline.active = {
          \ 'left': [ [ 'mode', 'paste' ],
          \           [ 'readonly', 'filename', 'modified', 'fileformat', 'devicons_filetype' ] ],
          \ 'right': [ [ 'lineinfo' ],
          \            [ 'linter_errors', 'linter_warnings', 'linter_ok'], 
          \           [ 'coc_status' ] ]
          \ }
    let g:lightline.inactive = {
          \ 'left': [ [ 'filename' , 'modified', 'fileformat', 'devicons_filetype' ]],
          \ 'right': [ [ 'lineinfo' ] ]
          \ }
    let g:lightline.tabline = {
          \ 'left': [ [ 'vim_logo', 'tabs' ] ],
          \ 'right': [ [ 'git_global' ],
          \ [ 'git_buffer' ] ]
          \ }
    let g:lightline.tab = {
          \ 'active': [ 'tabnum', 'filename', 'modified' ],
          \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }
  "else
  "  let g:lightline.active = {
  "        \ 'left': [ [ 'artify_mode', 'paste' ],
  "        \           [ 'readonly', 'filename', 'modified', 'fileformat', 'devicons_filetype' ] ],
  "        \ 'right': [ [ 'artify_lineinfo' ],
  "        \            [ 'linter_errors', 'linter_warnings', 'linter_ok', 'pomodoro' ],
  "        \           [ 'asyncrun_status', 'coc_status' ] ]
  "        \ }
  "  let g:lightline.inactive = {
  "        \ 'left': [ [ 'filename' , 'modified', 'fileformat', 'devicons_filetype' ]],
  "        \ 'right': [ [ 'artify_lineinfo' ] ]
  "        \ }
  "  let g:lightline.tabline = {
  "        \ 'left': [ [ 'vim_logo', 'tabs' ] ],
  "        \ 'right': [ [ 'git_global' ],
  "        \ [ 'git_buffer' ] ]
  "        \ }
  "  let g:lightline.tab = {
  "        \ 'active': [ 'artify_activetabnum', 'artify_filename', 'modified' ],
  "        \ 'inactive': [ 'artify_inactivetabnum', 'filename', 'modified' ] }
  "endif
  let g:lightline.tab_component_function = {
        \ 'filename': 'lightline#tab#filename',
        \ 'modified': 'lightline#tab#modified',
        \ 'readonly': 'lightline#tab#readonly'
        \ }
  "      \ 'tabnum': 'custom#lightline#tabnum',
  "      \ 'artify_activetabnum': 'custom#lightline#artify_active_tabnum',
  "      \ 'artify_inactivetabnum': 'custom#lightline#artify_inactive_tabnum',
  "      \ 'artify_filename': 'custom#lightline#artify_tabname',
  let g:lightline.component = {
        \ 'git_buffer' : '%{get(b:, "coc_git_status", "")}',
        \ 'mode': '%{lightline#mode()}',
        \ 'vim_logo': "\ue7c5",
        \ 'fileformat': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
        \ 'modified': '%M',
        \ 'paste': '%{&paste?"PASTE":""}',
        \ 'readonly': '%R',
        \ 'lineinfo': '%2p%% %3l:%-2v'
        \ }
  "      \ 'git_global' : '%{custom#lightline#git_global()}',
  "      \ 'artify_mode': '%{custom#lightline#artify_mode()}',
  "      \ 'artify_lineinfo': ""%2{custom#lightline#artify_line_percent()}\uf295 %3{custom#lightline#artify_line_num()}:%-2{custom#lightline#artify_column_num()}",
  "      \ 'pomodoro': '%{custom#lightline#pomodoro()}',
  let g:lightline.component_function = {
        \ 'devicons_filetype': 'custom#lightline#devicons',
        \ 'filename': 'LightlineFilename',
        \ 'coc_status': 'custom#lightline#coc_status'
        \ }
  let g:lightline.component_expand = {
        \ 'linter_warnings': 'custom#lightline#coc_diagnostic_warning',
        \ 'linter_errors': 'custom#lightline#coc_diagnostic_error',
        \ 'linter_ok': 'custom#lightline#coc_diagnostic_ok',
        \ }
  "      \ 'asyncrun_status': 'lightline#asyncrun#status'
  let g:lightline.component_type = {
        \ 'linter_warnings': 'warning',
        \ 'linter_errors': 'error'
        \ }

  "get file path relative to git root
  "note: depends on fugitive
  "see https://github.com/itchyny/lightline.vim/issues/293
  function! LightlineFilename()
    let root = fnamemodify(get(b:, 'git_dir'), ':h')
    let path = expand('%:p')
    if path[:len(root)-1] ==# root
      return path[len(root)+1:]
    endif
    return expand('%')
  endfunction

  """""""""""""Prettier (CocInstalled)""""""""""""""""""
  command! -nargs=0 Pr :CocCommand prettier.forceFormatDocument

  """""""""""""CocExplorer""""""""""""""""""""""""""""""
  nmap <space>x <Cmd>CocCommand explorer<CR>

  """"""""""""""Rest is for Coc.nvim""""""""""""""""""""
  "Apparently this speeds things up
  set hidden
  " May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
  " utf-8 byte sequence
  set encoding=utf-8
  " Some servers have issues with backup files, see #649
  set nobackup
  set nowritebackup

  " Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
  " delays and poor user experience
  set updatetime=300

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate
  " NOTE: There's always complete item selected by default, you may want to enable
  " no select by `"suggest.noselect": true` in your configuration file
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config
  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

  " Make <CR> to accept selected completion item or notify coc.nvim to format
  " <C-g>u breaks current undo, please make your own choice
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window
  nnoremap <silent> K :call ShowDocumentation()<CR>

  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s)
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying code actions to the selected code block
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying code actions at the cursor position
  nmap <leader>ac  <Plug>(coc-codeaction-cursor)
  " Remap keys for apply code actions affect whole buffer
  nmap <leader>as  <Plug>(coc-codeaction-source)
  " Apply the most preferred quickfix action to fix diagnostic on the current line
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Remap keys for applying refactor code actions
  nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
  xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
  nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

  " Run the Code Lens action on the current line
  nmap <leader>cl  <Plug>(coc-codelens-action)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Remap <C-f> and <C-b> to scroll float windows/popups
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif

  " Use CTRL-S for selections ranges
  " Requires 'textDocument/selectionRange' support of language server
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer
  command! -nargs=0 Format :call CocActionAsync('format')

  " Add `:Fold` command to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer
  command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings for CoCList
  " Show all diagnostics
  nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item
  nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item
  nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
endif
" Show trailing whitepace and spaces before a tab:
" Must be after colo
":highlight ExtraWhitespace ctermbg=red guibg=red
":autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
