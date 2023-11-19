vim.opt.rtp:append(vim.fn.stdpath("data") .. "/plugins/darcula-dark.nvim")

require("darcula").setup()

vim.cmd.colorscheme("darcula-dark")

