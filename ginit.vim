
let loaded_ginit_vim = 1

:GuiFont! SauceCodePro Nerd Font:h13

" werwer Disable gui tabline which is ugly
:GuiTabline 0

" Disable gui popup menu which is ugly
:GuiPopupmenu 0

" Maximize window
nnoremap <silent><F11> :call GuiWindowFullScreen(1)<CR>
nnoremap <silent><F10> :call GuiWindowFullScreen(0)<CR>
"----------------------------------------------------
set clipboard+=unnamedplus
map! <C-S-v> <C-R>+
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)
imap <C-c> <Esc>
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>
" let g:EasyMotion_do_mapping = 1 " Disable default mappings

" Turn on case-insensitive feature
" let g:EasyMotion_smartcase = 2

" JK motions: Line motions
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
map <C-m> vi'
nmap " ci"
nmap ' ci'
" Switch Wrap
function! ToggleWrap()
    " check if mouse is enabled
    if &wrap == 'true'
        " disable mouse
        set nowrap!
    else
        " enable wrap everywhere
        set wrap!
    endif
endfunc
" Switch mouse
function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc

" noh - no highlight
map <esc> :noh <CR>
" command Sw :execute ':silent w !sudo tee % > /dev/null' | :edit!
" nnoremap <leader>r <cmd>lua require('spectre').open()<CR>

"search current word
" nnoremap <C-S-f> <cmd> require('spectre').open_visual({select_word=true})<CR>
" map <leader>r <esc>: require('spectre').open_visual()<CR>
"  search in current file
" nnoremap <leader>sp viw: require('spectre').open_file_search()<cr>
" run command :Spectre
 " click enter on [[my_link]] or [[[my_link]]] to enter it
let g:im_select_default = '1033' 

function! GetImCallback(exit_code, stdout, stderr) abort
    return a:stdout
endfunction
let g:ImSelectGetImCallback = function('GetImCallback')
" Display Scrollbar
augroup ScrollbarInit
  autocmd!
  autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end
"Git Commands Add these to your neovim configuration

"Run git status (Entire Repo)
cnoremap gs !git status

"Git Diff Commands
"Git Diff of Single File
cnoremap gd<SPACE> !git diff %
"Git Diff of (Entire Repo)
cnoremap gdd !git diff
:command -nargs=* GitStatus !git diff <args>

"Git Commit
cnoremap gc GitCommit
:command -nargs=1 GitCommit !git commit % -m "<args>"

"Git Push
cnoremap gp !git push
