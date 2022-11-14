local map = vim.keymap.set
local default_options = { silent = true }
local expr_options = { expr = true, silent = true }

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--Temp for translate
-- Move cursor within insert mode
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-S-h>", "<C-o>b", opts) -- Move cursor next word
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-l>", "<Right>", opts)
-- keymap("i", "<C-S-l>", "<C-o>w", opts) -- Move cursor back word
keymap("i", "<C-a>", "<C-o>^", opts)
keymap("i", "<C-S-a>", "<Home>", opts)
keymap("i", "<C-S-e>", "<End>", opts)
keymap("i", "<C-e>", "<C-o>$", opts)
keymap("i", "<C-c>", "<ESC>", opts)
-- 命令行下 Ctrl+j/k  上一个下一个
keymap("c", "<C-j>", "<C-n>", { noremap = false })
keymap("c", "<C-k>", "<C-p>", { noremap = false })
-- save file
keymap("n", "j", "gj", opts)
keymap("n", "<tab>", "%", opts)
keymap("n", "k", "gk", opts)
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<C-q>", ":q<CR>", opts)
keymap("i", "<C-s>", "<C-o>:w<CR>", opts)
keymap("n", "<C-v>", "P", opts)
keymap("i", "<C-v>", "<C-o>P", opts)
keymap("n","<C-p>","<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",opts)
keymap("n","<C-f>","<cmd>Telescope current_buffer_fuzzy_find<cr>",opts)
keymap("n","<C-S-f>","<cmd>Telescope live_grep<cr>",opts)
keymap("n","<C-e>","<cmd>Telescope oldfiles<cr>",opts)
-- Move cursor in Normal mode
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
-- navigation between windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n","<C-/>","<Plug>(comment_toggle_linewise_current)", opts)
keymap("v","<C-/>","<Plug>(comment_toggle_linewise_current)", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<A-l>", ":bnext<CR>", opts)
keymap("n", "<A-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
-- keymap("n", "<C-j>", "5j", opts)
-- keymap("n", "<C-k>", "5k", opts)
keymap("n", "<C-S-d>", "30j", opts)
keymap("n", "<C-S-u>", "30k", opts)
keymap("v", "<C-j>", "5j", opts)
keymap("v", "<C-k>", "5k", opts)
map("i", "<C-S-l>", function()
  return require("utils").escapePair()
end, default_options)
-- Nvimtree, configured in whichkey
-- keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Telescope
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- bufferline
keymap("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)
keymap("n", "<leader>0", "<Cmd>BufferLineGoToBuffer 10<CR>", opts)

-- nvim-dap
keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
keymap("n", "<F6>", ":lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F7>", ":lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F8>", ":lua require'dap'.step_out()<CR>", opts)
-- configured in whichkey
-- vim.cmd([[
-- nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
-- nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
-- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
-- nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
-- nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
-- ]])
-- nvim-dap-ui, configured in whichkey
--vim.cmd([[
--nnoremap <silent> <space>dr :lua require("dapui").float_element(vim.Nil, { enter = true}) <CR>
--]])
