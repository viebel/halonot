-- Window management and navigation

vim.o.winminwidth = 0
vim.o.winminheight = 0

vim.g.halonot_key = 'o'

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

function close_small_windows()
  for j = num_windows(), 1, -1 do
    close_window_if_small(j)
  end
end

local function winkey_cmd(k)
  local basic_cmd = ':wincmd ' .. k 
  if k == '|' or k == '_' then
    return basic_cmd .. ' | lua close_small_windows()<CR>'
  else
    return basic_cmd .. '<CR>'
  end
end

local function set_key_map(leader_key, k1, k2) 
  vim.api.nvim_set_keymap(
      'n',
      '<leader>' .. leader_key .. k1, 
      winkey_cmd(k2),
      { noremap = true, silent = true })
end

local function set_key_map_to_cmd(leader_key, k, cmd)
  vim.api.nvim_set_keymap(
    'n',
    '<leader>' .. leader_key .. k,
    ':' .. cmd .. '<CR>',
    { noremap = true, silent = true })
end

local default_main_key = 'w'

local winkeys = {'j', 'k', 'h', 'l', '=', 'w', 'o', 'x', '>', '<', 'J', 'K', 'H', 'L', '|', '_', 'p'}

local keymap_conversion = {
  [']'] = '>',
  ['['] = '<',
  ['{'] = '-',
  ['}'] = '+',
  ['m'] = 'o',
  ['<TAB>'] = 'p',
}

local key_cmd = {
  ['v'] = 'vsplit',
  ['/'] = 'vsplit',
  ['s'] = 'split',
  ['-'] = 'split',
  ['d'] = 'hide',
}

local function set_window_management_keymaps(opts)  
  local leader_key = opts['main_key'] or default_main_key

  for _, winkey in ipairs(winkeys) do
    set_key_map(leader_key, winkey, winkey)
  end

  for winkey, k in pairs(keymap_conversion) do
    set_key_map(leader_key, winkey, k)
  end

  for winkey, cmd in pairs(key_cmd) do
    set_key_map_to_cmd(leader_key, winkey, cmd)
  end
end

return {
  setup = set_window_management_keymaps,
}

