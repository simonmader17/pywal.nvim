local M = {}

function M.get_colors()
	if pcall(vim.cmd, [[ source $HOME/.cache/wal/colors-wal.vim ]]) then
	  return {
	    background = vim.g.background,
	    foreground = vim.g.foreground,
	    cursor = vim.g.cursor,
	    color0 = vim.g.color0,
	    color1 = vim.g.color1,
	    color2 = vim.g.color2,
	    color3 = vim.g.color3,
	    color4 = vim.g.color4,
	    color5 = vim.g.color5,
	    color6 = vim.g.color6,
	    color7 = vim.g.color7,
	    color8 = vim.g.color8,
	    color9 = vim.g.color9,
	    color10 = vim.g.color10,
	    color11 = vim.g.color11,
	    color12 = vim.g.color12,
	    color13 = vim.g.color13,
	    color14 = vim.g.color14,
	    color15 = vim.g.color15,
	  }
	else
		return {
      background = "#282C34",
      foreground = "#ABB2BF",
      cursor = "#ABB2BF",
      color1 = "#5C6370",
      color2 = "#E06C75",
      color3 = "#98C379",
      color4 = "#E5C07B",
      color5 = "#61AFEF",
      color6 = "#C678DD",
      color7 = "#56B6C2",
      color8 = "#ABB2BF",
      color9 = "#7F848E",
      color10 = "#E06C75",
      color11 = "#98C379",
      color12 = "#E5C07B",
      color13 = "#61AFEF",
      color14 = "#C678DD",
      color15 = "#56B6C2",
      color16 = "#ABB2BF"
    }
	end
end

return M
