return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local spectre = require "spectre"

    spectre.setup {
      find_engine = {
        ["rg"] = {
          cmd = "rg",
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob=!node_modules/*", -- explicitly ignore node_modules
            "--glob=!.git/*", -- ignore .git folder
            "--glob=!dist/*", -- ignore dist
          },
          options = {
            ["ignore-case"] = {
              value = "--ignore-case",
              icon = "[I]",
              desc = "ignore case",
            },
            ["hidden"] = {
              value = "--hidden",
              icon = "[H]",
              desc = "search hidden files",
            },
          },
        },
      },
    }

    -- Keymaps
    vim.keymap.set("n", "<leader>S", spectre.open, { desc = "Open Spectre" })
    vim.keymap.set(
      "n",
      "<leader>sw",
      function() spectre.open_visual { select_word = true } end,
      { desc = "Search current word" }
    )
    vim.keymap.set("v", "<leader>sw", spectre.open_visual, { desc = "Search selection" })
    vim.keymap.set("n", "<leader>sp", spectre.open_file_search, { desc = "Search in current file" })
  end,
}
