local f = {}

f.replace_pick_with_fixup = function()
  local start_line = 1
  local end_line = vim.api.nvim_buf_line_count(0)

  for line_number = start_line, end_line do
    local line = vim.api.nvim_buf_get_lines(0, line_number, line_number+1, false)[1]
    if line then
      if line:find('pick') then
        local new_line = line:gsub('pick', 'f')
        vim.api.nvim_buf_set_lines(0, line_number, line_number+1, false, {new_line})
      end
    end
  end
end

return f
