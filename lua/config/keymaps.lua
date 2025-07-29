-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>cf", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
  -- OSC 52 sequence for remote clipboard
  if vim.env.SSH_TTY then
    local osc52 = require("vim.ui.clipboard.osc52")
    osc52.copy("+")(path)
  end
  vim.notify("Copied to clipboard: " .. path)
end, { desc = "Copy file path to register" })
