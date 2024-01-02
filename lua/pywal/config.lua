local function clamp(component)
	return math.min(math.max(component, 0), 255)
end

--[[ Example: lightenDarkenColor("#171914", 10)
              #171914 -> #21231e ]]
local function lightenDarkenColor(col, amt)
	local num = tonumber(col:sub(2), 16)
	local r = math.floor(num / 0x10000) + amt
	local g = (math.floor(num / 0x100) % 0x100) + amt
	local b = (num % 0x100) + amt
	return string.format("#%x", clamp(r) * 0x10000 + clamp(g) * 0x100 + clamp(b))
end

local M = {}

M.highlights_base = function(colors)
	return {
		Normal = { fg = colors.foreground, bg = none },
		StatusLineNC = { bg = none, fg = colors.color8 },
		StatusLine = { bg = none, fg = lightenDarkenColor(colors.background, 10) },
		SignColumn = { bg = none, fg = lightenDarkenColor(colors.background, 10) },
		MsgArea = { fg = colors.foreground, bg = none },
		ModeMsg = { fg = colors.foreground, bg = none },
		MsgSeparator = { fg = colors.foreground, bg = none },
		SpellBad = { fg = colors.color2 },
		SpellCap = { fg = colors.color6 },
		SpellLocal = { fg = colors.color4 },
		SpellRare = { fg = colors.color6 },
		NormalNC = { fg = colors.foreground, bg = none },
		Pmenu = { fg = colors.foreground, bg = lightenDarkenColor(colors.background, 10) },
		PmenuSel = { fg = lightenDarkenColor(colors.background, 10), bg = colors.color4 },
		WildMenu = { fg = colors.color7, bg = colors.color4 },
		CursorLineNr = { fg = colors.color1 },
		Comment = { fg = colors.color1 },
		Folded = { fg = colors.color4, bg = none },
		FoldColumn = { fg = colors.color4, bg = none },
		LineNr = { fg = colors.color9, bg = none },
		FloatBorder = { fg = colors.foreground, bg = none },
		Whitespace = { fg = colors.color1 },
		VertSplit = { fg = lightenDarkenColor(colors.background, 10), bg = colors.color1 },
		CursorLine = { bg = lightenDarkenColor(colors.background, 10) },
		CursorColumn = { bg = none },
		ColorColumn = { bg = lightenDarkenColor(colors.background, 10) },
		NormalFloat = { bg = colors.color8 },
		Visual = { bg = colors.color1, fg = colors.foreground },
		VisualNOS = { bg = none },
		WarningMsg = { fg = colors.color3, bg = none },
		DiffAdd = { fg = lightenDarkenColor(colors.background, 10), bg = colors.color4 },
		DiffChange = { fg = lightenDarkenColor(colors.background, 10), bg = colors.color5 },
		DiffDelete = { fg = lightenDarkenColor(colors.background, 10), bg = colors.color11 },
		QuickFixLine = { bg = colors.color2 },
		PmenuSbar = { bg = lightenDarkenColor(colors.background, 10) },
		PmenuThumb = { bg = colors.color2 },
		MatchParen = { fg = colors.color4, bg = none },
		Cursor = { fg = colors.foreground, bg = colors.cursor },
		lCursor = { fg = colors.foreground, bg = colors.cursor },
		CursorIM = { fg = colors.foreground, bg = colors.cursor },
		TermCursor = { fg = colors.foreground, bg = colors.cursor },
		TermCursorNC = { fg = colors.foreground, bg = colors.cursor },
		Conceal = { fg = colors.color4, bg = none },
		Directory = { fg = colors.color4 },
		SpecialKey = { fg = colors.color4 },
		Title = { fg = colors.color4 },
		ErrorMsg = { fg = colors.color11, bg = none },
		Search = { fg = colors.foreground, bg = colors.color1 },
		IncSearch = { fg = colors.foreground, bg = colors.color1 },
		Substitute = { fg = colors.color1, bg = colors.color6 },
		MoreMsg = { fg = colors.color5 },
		Question = { fg = colors.color5 },
		EndOfBuffer = { fg = colors.foreground },
		NonText = { fg = colors.color1 },
		Variable = { fg = colors.color5 },
		String = { fg = colors.color12 },
		Character = { fg = colors.color12 },
		Constant = { fg = colors.color5 },
		Number = { fg = colors.color5 },
		Boolean = { fg = colors.color5 },
		Float = { fg = colors.color5 },
		Identifier = { fg = colors.color5 },
		Function = { fg = colors.color6 },
		Operator = { fg = colors.color6 },
		Type = { fg = colors.color5 },
		StorageClass = { fg = colors.color7 },
		Structure = { fg = colors.color6 },
		Typedef = { fg = colors.color6 },
		Keyword = { fg = colors.color6 },
		Statement = { fg = colors.color6 },
		Conditional = { fg = colors.color6 },
		Repeat = { fg = colors.color6 },
		Label = { fg = colors.color4 },
		Exception = { fg = colors.color6 },
		Include = { fg = colors.color6 },
		PreProc = { fg = colors.color6 },
		Define = { fg = colors.color6 },
		Macro = { fg = colors.color6 },
		PreCondit = { fg = colors.color6 },
		Special = { fg = colors.color6 },
		SpecialChar = { fg = colors.foreground },
		Tag = { fg = colors.color4 },
		Debug = { fg = colors.color11 },
		Delimiter = { fg = colors.foreground },
		SpecialComment = { fg = colors.color2 },
		Ignore = { fg = colors.color7, bg = none },
		Todo = { fg = colors.color11, bg = none },
		Error = { fg = colors.color11, bg = none },
		TabLine = { fg = colors.color2, bg = none },
		TabLineSel = { fg = colors.foreground, bg = none },
		TabLineFill = { fg = colors.foreground, bg = none },
		CmpDocumentationBorder = { fg = colors.foreground, bg = none },
		CmpItemAbbr = { fg = colors.foreground, bg = none },
		CmpItemAbbrDeprecated = { fg = colors.color2, bg = none },
		CmpItemAbbrMatch = { fg = colors.color7, bg = none },
		CmpItemAbbrMatchFuzzy = { fg = colors.color7, bg = none },
		CmpItemKind = { fg = colors.color4, bg = none },
		CmpItemMenu = { fg = colors.color2, bg = none },

		-- treesitter

		-- These groups are for the neovim tree-sitter highlights.
		-- As of writing, tree-sitter support is a WIP, group names may color5.
		-- By default, most of these groups link to an appropriate Vim group,
		-- TSError -> Error for example, so you do not have to define these unless
		-- you explicitly want to support Treesitter's improved syntax awareness.

		-- TSAnnotation        = { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
		-- TSAttribute         = { };    -- (unstable) TODO: docs
		-- TSBoolean           = { };    -- For booleans.
		-- TSCharacter         = { };    -- For characters.
		-- TSComment           = { };    -- For color1 blocks.
		TSNote = { fg = lightenDarkenColor(colors.background, 10), bg = colors.color5 },
		TSComment = { fg = colors.color1 },
		TSWarning = { fg = lightenDarkenColor(colors.background, 10), bg = colors.color5 },
		TSDanger = { fg = lightenDarkenColor(colors.background, 10), bg = colors.color3 },
		TSConstructor = { fg = colors.color6 }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
		-- TSConditional       = { };    -- For keywords related to conditionnals.
		-- TSConstant          = { };    -- For constants
		-- TSConstBuiltin      = { };    -- For constant that are built in the language: `nil` in Lua.
		-- TSConstMacro        = { };    -- For constants that are defined by macros: `NULL` in C.
		-- TSError             = { };    -- For syntax/parser errors.
		-- TSException         = { };    -- For exception related keywords.
		TSField = { fg = colors.color12 }, -- For fields.
		-- TSFloat             = { };    -- For floats.
		-- TSFunction          = { };    -- For function (calls and definitions).
		-- TSFuncBuiltin       = { };    -- For builtin functions: `table.insert` in Lua.
		-- TSFuncMacro         = { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		-- TSInclude           = { };    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		TSKeyword = { fg = colors.color6 },   -- For keywords that don't fall in previous categories.
		TSKeywordFunction = { fg = colors.color6 }, -- For keywords used to define a fuction.
		TSLabel = { fg = colors.color7 },     -- For labels: `label:` in C and `:label:` in Lua.
		-- TSMethod            = { };    -- For method calls and definitions.
		-- TSNamespace         = { };    -- For identifiers referring to modules and namespaces.
		-- TSNone              = { };    -- TODO: docs
		-- TSNumber            = { };    -- For all numbers
		TSOperator = { fg = colors.color7 },   -- For any operator: `+`, but also `->` and `*` in C.
		TSParameter = { fg = colors.color5 },  -- For parameters of a function.
		-- TSParameterReference= { };    -- For references to parameters of a function.
		TSProperty = { fg = colors.color4 },   -- Same as `TSField`.
		TSPunctDelimiter = { fg = colors.color7 }, -- For delimiters ie: `.`
		TSPunctBracket = { fg = colors.foreground }, -- For brackets and parens.
		TSPunctSpecial = { fg = colors.color7 }, -- For special punctutation that does not fall in the catagories before.
		-- TSRepeat            = { };    -- For keywords related to loops.
		-- TSString            = { };    -- For strings.
		TSStringRegex = { fg = colors.color7 }, -- For regexes.
		TSStringEscape = { fg = colors.color6 }, -- For escape characters within a string.
		-- TSSymbol            = { };    -- For identifiers referring to symbols or atoms.
		-- TSType              = { };    -- For types.
		-- TSTypeBuiltin       = { };    -- For builtin types.
		TSVariableBuiltin = { fg = colors.color11 }, -- Variable names that are defined by the languages, like `this` or `self`.

		-- TSTag               = { };    -- Tags like html tag names.
		-- TSTagDelimiter      = { };    -- Tag delimiter like `<` `>` `/`
		-- TSText              = { };    -- For strings considered text in a markup language.
		TSTextReference = { fg = colors.color8 },
		-- TSEmphasis          = { };    -- For text to be represented with emphasis.
		-- TSUnderline         = { };    -- For text to be represented with an underline.
		-- TSStrike            = { };    -- For strikethrough text.
		-- TSTitle             = { };    -- Text that is part of a title.
		-- TSLiteral           = { };    -- Literal text.
		-- TSURI               = { };    -- Any URI like a link or email.

		-- LspTrouble
		LspTroubleText = { fg = colors.foreground },
		LspTroubleCount = { fg = colors.color6, bg = colors.foreground },
		LspTroubleNormal = { fg = colors.foreground, bg = none },

		-- Illuminate
		illuminatedWord = { bg = colors.foreground },
		illuminatedCurWord = { bg = colors.foreground },

		-- diff
		diffAdded = { fg = colors.color4 },
		diffRemoved = { fg = colors.color11 },
		diffChanged = { fg = colors.color5 },
		diffOldFile = { fg = colors.color5 },
		diffNewFile = { fg = colors.color5 },
		diffFile = { fg = colors.color7 },
		diffLine = { fg = colors.color1 },
		diffIndexLine = { fg = colors.color6 },

		-- Neogit
		NeogitBranch = { fg = colors.color6 },
		NeogitRemote = { fg = colors.color6 },
		NeogitHunkHeader = { bg = none, fg = colors.foreground },
		NeogitHunkHeaderHighlight = { bg = colors.foreground, fg = colors.color7 },
		NeogitDiffContextHighlight = { bg = none, fg = colors.foreground },
		NeogitDiffDeleteHighlight = { fg = colors.color11, bg = colors.color11 },
		NeogitDiffAddHighlight = { fg = colors.color4, bg = colors.color4 },

		-- GitGutter
		GitGutterAdd = { fg = colors.color4 }, -- diff mode: Added line |diff.txt|
		GitGutterChange = { fg = colors.color5 }, -- diff mode: Changed line |diff.txt|
		GitGutterDelete = { fg = colors.color11 }, -- diff mode: Deleted line |diff.txt|

		-- GitSigns
		GitSignsAdd = { fg = colors.color4 }, -- diff mode: Added line |diff.txt|
		GitSignsChange = { fg = colors.color5 }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete = { fg = colors.color11 }, -- diff mode: Deleted line |diff.txt|

		-- Telescope
		TelescopeBorder = { fg = colors.color1, bg = none },
		TelescopeNormal = { fg = colors.foreground, bg = none },
		TelescopeSelection = { fg = lightenDarkenColor(colors.background, 10), bg = colors.color1 },

		-- Indent Blank Line
		IndentBlanklineChar = { fg = colors.color1, bg = none },

		-- NvimTree
		NvimTreeNormal = { fg = colors.foreground, bg = none },
		NvimTreeNormalNC = { fg = colors.foreground, bg = none },
		NvimTreeRootFolder = { fg = colors.color1 },
		NvimTreeGitDirty = { fg = colors.color5 },
		NvimTreeGitNew = { fg = colors.color4 },
		NvimTreeGitDeleted = { fg = colors.color11 },
		NvimTreeSpecialFile = { fg = colors.color6 },
		NvimTreeIndentMarker = { fg = colors.foreground },
		NvimTreeImageFile = { fg = colors.foreground },
		NvimTreeSymlink = { fg = colors.color7 },
		NvimTreeFolderIcon = { fg = colors.color2, bg = none },
		NvimTreeStatusLineNC = { bg = none, fg = lightenDarkenColor(colors.background, 10) },
		NvimTreeExecFile = { bold = true, fg = colors.color6 },

		-- LspSaga
		LspFloatWinNormal = { bg = none },
		LspFloatWinBorder = { fg = colors.foreground },
		LspSagaBorderTitle = { fg = colors.color7 },
		LspSagaHoverBorder = { fg = colors.color7 },
		LspSagaRenameBorder = { fg = colors.color4 },
		LspSagaDefPreviewBorder = { fg = colors.color4 },
		LspSagaCodeActionBorder = { fg = colors.color7 },
		LspSagaFinderSelection = { fg = colors.color1 },
		LspSagaCodeActionTitle = { fg = colors.color7 },
		LspSagaCodeActionContent = { fg = colors.color6 },
		LspSagaSignatureHelpBorder = { fg = colors.color11 },
		ReferencesCount = { fg = colors.color6 },
		DefinitionCount = { fg = colors.color6 },
		DefinitionIcon = { fg = colors.color7 },
		ReferencesIcon = { fg = colors.color7 },
		TargetWord = { fg = colors.color7 },

		-- NeoVim
		healthError = { fg = colors.color11 },
		healthSuccess = { fg = colors.color4 },
		healthWarning = { fg = colors.color5 },

		-- BufferLine
		BufferLineIndicatorSelected = { fg = colors.color5 },
		BufferLineFill = { bg = none },
	}
end

return M
