
" LSP menu, example from
" https://vi.stackexchange.com/questions/24462/what-are-the-new-popup-windows-in-vim-8-2
func! MenuCB(id, result)
    if a:result == 1
        :LSClientGoToDefinition
    elseif a:result == 2
        :LSClientFindCodeActions
    elseif a:result == 3
        :LSClientShowHover
    elseif a:result == 4
        :LSClientAllDiagnostic
    elseif a:result == 5
        :LSClientFindReferences
    elseif a:result == 6
        :LSClientFindImplementations
    elseif a:result == 7
        :LSClientRename
    elseif a:result == 8
        :normal gg=G
    elseif a:result == 9
        :OllamaChat
    elseif a:result == 10
        :OllamaReview
    endif
endfunc

func! Lsp()    
    if &filetype == "java"
        call popup_menu([
            \'LSClientGoToDefinition',
            \'LSClientFindCodeActions',
            \'LSClientShowHover', 
            \'LSClientAllDiagnostic',
            \'LSClientFindReferences',
            \'LSClientFindImplementations',
            \'LSClientRename',
            \'AutoFormat',
            \'OllamaChat',
            \'OllamaReview',
            \], 
            \ #{ title: "Well? Pick one", callback: 'MenuCB', line: 25, col: 40, 
            \ highlight: 'Question', border: [], close: 'click',  padding: [1,1,0,1]} )
    endif
endfunc

nmap <C-k> <ESC>:call Lsp()<CR>

