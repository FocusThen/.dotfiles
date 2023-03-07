local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local ok, lazy = pcall(require, "lazy")
if not ok then return end

lazy.setup({
  -- Theme
  { 'rose-pine/neovim', name = 'rose-pine' },

  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/nvim-cmp",
    }
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    event = "BufRead",
  },

  { -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },
  -- Comment gc
  { "numToStr/Comment.nvim", config = true, event = "BufEnter" },

  -- Autopairs
  "windwp/nvim-ts-autotag",
  { "windwp/nvim-autopairs", config = true, event = "InsertEnter" },

    -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  -- BufferLine
  "akinsho/bufferline.nvim",

  -- Hop
  { "phaazon/hop.nvim", branch = "v2", config = true, event = "BufEnter" },


  { 'akinsho/toggleterm.nvim', version = "*", config = true },
  { "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    }
  },
  "nvim-treesitter/nvim-treesitter",
  "nvim-telescope/telescope-ui-select.nvim",
  "nvim-tree/nvim-web-devicons",
  { "lewis6991/gitsigns.nvim", config = true, event = "BufEnter" },
  { "iamcco/markdown-preview.nvim", ft = "markdown" },
  {
    "karb94/neoscroll.nvim",
    event = "BufEnter",
    enabled = false
  },
  { "David-Kunz/markid", enabled = false },
  "nvim-treesitter/nvim-treesitter-textobjects",
  {
    "kylechui/nvim-surround",
    config = true
  },
})
