local M = {}

local cat = { " /\\_/\\ ", "( o.o )", " > ^ < " }
local win

function M.setup(opts)
  opts = opts or {}
  vim.api.nvim_create_user_command("Oscar", function()
    if win and vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
      win = nil
      return
    end
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, cat)
    win = vim.api.nvim_open_win(buf, false, {
      relative = "editor",
      width = 7,
      height = #cat,
      row = vim.o.lines - #cat - 3,
      col = vim.o.columns - 9,
      style = "minimal",
      focusable = false,
    })
  end, {})
end

return M

