return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup()
      -- vim.cmd.colorscheme "kanagawa"
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    -- config = function() vim.cmd "colorscheme rose-pine-moon" end,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("tokyonight").setup {
        style = "night",
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }

      -- vim.cmd.colorscheme "tokyonight-night"
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup { flavour = "mocha" }
      -- require("catppuccin").setup { flavour = "mocha", transparent_background = true }
      -- vim.cmd.colorscheme "catppuccin"
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup {
        constrast = "soft",
      }
      vim.cmd.colorscheme "gruvbox"
    end,
  },
}
