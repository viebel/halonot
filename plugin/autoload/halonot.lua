local function num_windows()
  return vim.api.nvim_eval("winnr('$')")
end

local function close_window(n)
  if (n > 0) then
    vim.cmd(n .. "wincmd c")
  end
end

local function close_window_if_small(n)
  local width = vim.api.nvim_eval('winwidth(' .. n .. ')')
  local height = vim.api.nvim_eval('winheight(' .. n .. ')')
  if ((width <  2) or (height < 2)) then
    close_window(n)
  end
end

vim.fn['halonot#close_small_windows'] = function()
  for j = num_windows(), 1, -1 do
    close_window_if_small(j)
  end
end


