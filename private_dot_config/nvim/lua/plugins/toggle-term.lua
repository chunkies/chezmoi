return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup {
        size = 20,
        open_mapping = [[<c-t>]],
        hide_numbers = true,
        direction = 'float',
        float_opts = {
          border = 'curved',
        },
        start_in_insert = true,
        autochdir = true,
      }

      -- custom terminals
      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

      function _lazygit_toggle()
        lazygit:toggle()
      end

      vim.api.nvim_set_keymap("n", [[<c-g>]], "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
    end
  }
}
