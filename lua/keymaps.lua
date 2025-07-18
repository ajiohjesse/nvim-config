-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode easily
-- vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Helper for cleaner mappings
local function map(mode, lhs, rhs, desc) vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc }) end

map("i", "<C-p>", "<Esc>pi", "Paste in insert mode")

-- Save
map("i", "<C-s>", "<Esc>:write!<CR>i", "Save file")
map("n", "<Leader>w", ":write!<CR>", "Save file")

-- Exit insert mode
map("i", "jk", "<Esc>", "Exit insert mode")

-- Close terminal
map("t", "<C-q>", "<C-\\><C-n>:q<CR>", "Close terminal")

-- Barbar buffer navigation
map("n", "<A-l>", "<Cmd>BufferNext<CR>", "Next buffer")
map("n", "<A-h>", "<Cmd>BufferPrevious<CR>", "Previous buffer")
map("n", "<S-l>", "<Cmd>BufferNext<CR>", "Next buffer")
map("n", "<S-h>", "<Cmd>BufferPrevious<CR>", "Previous buffer")

-- Buffer reordering
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", "Move buffer previous")
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", "Move buffer next")

-- Go to buffer by number
for i = 1, 9 do
  map("n", "<A-" .. i .. ">", "<Cmd>BufferGoto " .. i .. "<CR>", "Go to buffer " .. i)
end
map("n", "<A-0>", "<Cmd>BufferLast<CR>", "Go to last buffer")

-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", "Pin/Unpin buffer")

-- Buffer commands
map("n", "<Leader>b", "", "Buffer")
map("n", "<Leader>x", "<Cmd>BufferClose<CR>", "Close buffer")
map("n", "<Leader>cc", "<Cmd>BufferClose<CR>", "Close buffer")
map("n", "<Leader>bc", "<Cmd>BufferClose<CR>", "Close buffer")
map("n", "<Leader>bq", ":q<CR>", "Close Window")
map("n", "<Leader>bx", "<Cmd>BufferCloseAllButCurrent<CR>", "Close all but current")
map("n", "<Leader>bP", "<Cmd>BufferCloseAllButCurrentOrPinned<CR>", "Close all but current/pinned")
map("n", "<Leader>b,", "<Cmd>BufferCloseBuffersLeft<CR>", "Close buffers left")
map("n", "<Leader>b.", "<Cmd>BufferCloseBuffersRight<CR>", "Close buffers right")

-- Buffer picking
map("n", "<C-p>", "<Cmd>BufferPick<CR>", "Buffer pick mode")
map("n", "<C-s-p>", "<Cmd>BufferPickDelete<CR>", "Buffer pick and delete")

-- Buffer sorting
map("n", "<Leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", "Sort buffers by number")
map("n", "<Leader>bn", "<Cmd>BufferOrderByName<CR>", "Sort buffers by name")
map("n", "<Leader>bd", "<Cmd>BufferOrderByDirectory<CR>", "Sort buffers by directory")
map("n", "<Leader>bl", "<Cmd>BufferOrderByLanguage<CR>", "Sort buffers by language")
map("n", "<Leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", "Sort buffers by window number")

-- LSP
map("n", "<Leader>l", "", "LSP")
map("n", "<Leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition")
map("n", "<Leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation")
map("n", "<Leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Go to type definition")
map("n", "<Leader>lR", "<cmd>lua vim.lsp.buf.references()<CR>", "Show references")
map("n", "<Leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>", "Show hover documentation")
map("n", "<Leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Show signature help")
map("n", "<Leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action")
map("n", "<Leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename symbol")
map("n", "<Leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", "Format file")
map("n", "<Leader>le", "<cmd>lua vim.diagnostic.open_float()<CR>", "Open float with diagnostic details")

-- Git prefix placeholder
map("n", "<Leader>g", "", "Git")

vim.keymap.set("i", "<C-n>", function()
  local cmp = require "cmp"
  if cmp and cmp.visible() then
    cmp.abort()
  else
    cmp.complete()
  end
end, { desc = "Trigger completion suggestions" })
