
" LSP menu, example from
" https://vi.stackexchange.com/questions/24462/what-are-the-new-popup-windows-in-vim-8-2
func! MenuCB(id, result)
    if a:result == 1
        :LSClientGoToDefinition
    elseif a:result == 2
        :LSClientGoToDefinitionSplit
    elseif a:result == 3
        :LSClientShowHover
    elseif a:result == 4
        :LSClientAllDiagnostic
    elseif a:result == 5
        :LSClientRename
    elseif a:result == 6
        :OllamaChat
    elseif a:result == 7
        :OllamaReview
    elseif a:result == 8
        :Autoformat
    elseif a:result == 9
        :Rgrep
    endif
endfunc

func! Lsp()    
    if &filetype == "java"
        call popup_menu([
            \'LSClientGoToDefinition',
            \'LSClientGoToDefinitionSplit',
            \'LSClientShowHover', 
            \'LSClientAllDiagnostic',
            \'LSClientRename',
            \'OllamaChat',
            \'OllamaReview',
            \'Autoformat',
            \'Rgrep'
            \], 
            \ #{ title: "Well? Pick one", callback: 'MenuCB', line: 25, col: 40, 
            \ highlight: 'Question', border: [], close: 'click',  padding: [1,1,0,1]} )
    endif
endfunc

nmap <C-k> <ESC>:call Lsp()<CR>

