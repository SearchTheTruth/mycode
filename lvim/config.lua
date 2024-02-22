-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.plugins = {
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      require("gitblame").setup { enabled = true}
    end,
  },
  {
    'jinh0/eyeliner.nvim',
    config = function()
      require'eyeliner'.setup {
        highlight_on_key = true, -- show highlights only after keypress
        dim = true              -- dim all other characters if set to true (recommended!)
      }
    end
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },
  {
    "dhananjaylatkar/cscope_maps.nvim",
    dependencies = {
      "folke/which-key.nvim", -- optional [for whichkey hints]
      "nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
      "ibhagwan/fzf-lua", -- optional [for picker="fzf-lua"]
      "nvim-tree/nvim-web-devicons", -- optional [for devicons in telescope or fzf]
    },
    opts = {
      -- USE EMPTY FOR DEFAULT OPTIONS
      -- DEFAULTS ARE LISTED BELOW
    },
  },
  -- {
  --   "ludovicchabant/vim-gutentags",
  --   init = function()
  --     vim.g.gutentags_modules = {"cscope_maps"} -- This is required. Other config is optional
  --     vim.g.gutentags_cscope_build_inverted_index_maps = 1
  --     vim.g.gutentags_cache_dir = vim.fn.expand("~/code/.gutentags")
  --     vim.g.gutentags_file_list_command = "fd -e c -e h"
  --     -- vim.g.gutentags_trace = 1
  --   end,
  -- }
  -- {
  --   'tomasky/bookmarks.nvim',
  --   -- tag = 'release' -- To use the latest release
  --   -- after = "telescope.nvim",
  --   event = "VimEnter",
  --   config = function()
  --     require('bookmarks').setup()
  --   end,
  -- },
  --   {
  --     "nvim-telescope/telescope-project.nvim",
  --     event = "BufWinEnter",
  --     after = "telescope.nvim",
  --     config = function()
  --       require'telescope'.load_extension('project')
  --     end
  --   },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  -- dir=vim.cmd('%:p:h'),
  f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
  v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
  h = { "<cmd>2ToggleTerm size=10 direction=horizontal<cr>", "Split horizontal" },
}

