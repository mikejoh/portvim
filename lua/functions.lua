local f = {}

-- replace_pick_with_fixup is a utility function to help out during git rebases and when all i want to do
-- is to do a fixup into one commit.
f.replace_pick_with_fixup = function()
  local start_line = 2
  local end_line = vim.api.nvim_buf_line_count(0)

  for line_number = start_line, end_line do
    local line = vim.api.nvim_buf_get_lines(0, line_number-1, line_number, false)[1]
    if line then
      -- Skip if the line is a comment (#)
      if line:find('^%s*#') then
        goto continue
      end
      if line:find('pick') then
        local new_line = line:gsub('pick', 'f')
        vim.api.nvim_buf_set_lines(0, line_number-1, line_number, false, {new_line})
      end
    end
    ::continue::
  end
end

return f
