if pcall(require, "hotpot") then
    -- Setup hotpot.nvim
    require("hotpot").setup({
        enable_hotpot_diagnostics = true,
        provide_require_fennel = true,
    })
    -- Import neovim configuration
    require("core")
    vim.cmd([[
        if exists("g:neovide")
        set guifont=Monospace:h7
        let g:neovide_cursor_vfx_mode = "wireframe"
        let g:neovide_refresh_rate = 60
    " system clipboard
        nmap <c-c> "+y
        vmap <c-c> "+y
        nmap <c-v> "+p
        inoremap <c-v> <c-r>+
        cnoremap <c-v> <c-r>+
    " use <c-r> to insert original character without triggering things like auto-pairs
        inoremap <c-r> <c-v>
        autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
        autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
endif
]]
)
else
    print("Unable to require hotpot")
end
