local fzf_plugin_path = vim.fn.stdpath("data") .. "/plugins/telescope-fzf-native.nvim"
local plenary_path = vim.fn.stdpath("data") .. "/plugins/plenary.nvim"
local telescope_path = vim.fn.stdpath("data") .. "/plugins/telescope.nvim"

vim.opt.rtp:append(fzf_plugin_path)
vim.opt.rtp:append(plenary_path)
vim.opt.rtp:append(telescope_path)

if not vim.loop.fs_stat(fzf_plugin_path .. "/build/libfzf.so") then
    print("Building fuzzy finder native.")
    vim.fn.system(string.format("cd %s; make", fzf_plugin_path))
    print("Fuzzy finder native, built.")
end

-- Setup Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

pcall(require('telescope').load_extension, 'fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, {desc= '[S]earch [F]iles'})

