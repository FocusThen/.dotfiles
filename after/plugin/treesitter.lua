local ok, ts = pcall(require, 'nvim-treesitter.configs')
if not ok then return end

ts.setup {
  ensure_installed = { "go", "lua", "javascript", "html", "css", "json" , "typescript", "tsx"},
  auto_install = false,
  ignore_install = { "javascript" },

  highlight = {
    enable = true,
  },

  autotag = {
    enable = true
  },

  textobjects = {
    select = {
      enable = true
    },
    swap = {
      enable = true
    }
  }
}
