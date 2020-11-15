" toggle colored right border after 72 or 80 chars " actually you should not write any more after 77 chars
" have been written
" http://stackoverflow.com/questions/2182427/right-margin-in-vim

"   78 in case of 77 chars limit
"   73 in case of 72 chars limit
set colorcolumn=73

" put the following line into _vimrc in a suitable place if you need
" :hi ColorColumn ctermbg=lightgrey guibg=lightgrey
let s:color_column_old = 0

function! s:ToggleColorColumn()
    if s:color_column_old == 0
        let s:color_column_old = &colorcolumn
        windo let &colorcolumn = 0
    else
        windo let &colorcolumn=s:color_column_old
        let s:color_column_old = 0
    endif
endfunction

nnoremap <Leader>8 :call <SID>ToggleColorColumn()<cr>
:amenu Plugin.-Sep-	:
:amenu Plugin.Right\ Border\ ON-OFF\ \ \ \ \ \ \ \\8 :call <SID>ToggleColorColumn()<cr>

