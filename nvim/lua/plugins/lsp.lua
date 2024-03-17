return {
    -- add any tools you want to have installed below
    {
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"stylua",
				"selene",
				"luacheck",
				"shellcheck",
				"shfmt",
				"tailwindcss-language-server",
				"typescript-language-server",
				"css-lsp",
			})
		end,
	},

    -- LSP servers
	{
			"neovim/nvim-lspconfig",
			init = function()
                local keys = require("lazyvim.plugins.lsp.keymaps").get()
                keys[#keys + 1] = {
                    "gd",
                    function()
                        -- DO NOT RESUSE WINDOW
                        require("telescope.builtin").lsp_definitions({ reuse_win = false })
                    end,
                    desc = "Goto Definition",
                    has = "definition",
                }
            end,
			---@class PluginLspOpts
			opts = {
                inlay_hints = { enabled = false },
				---@type lspconfig.options
				servers = {
                    -- css-lsp will be automatically installed with mason and loaded with lspconfig
                    cssls = {},
                    -- tailwindcss configuration for tailwind components
                    tailwindcss = {
                        root_dir = function(...)
                            return require("lspconfig.util").root_pattern(".git")(...)
                        end,
                    },
                    -- terraform 
                    terraformls = {
                        settings = {
                            terraform = {
                                --
                            },
                        },
                    },
                    -- tsserver configuration for ts, tsx, js, jsx
                    tsserver = {
                        root_dir = function(...)
                            return require("lspconfig.util").root_pattern(".git")(...)
                        end,
                        single_file_support = false,
                        settings = {
                            typescript = {
                                inlayHints = {
                                    includeInlayParameterNameHints = "literal",
                                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                    includeInlayFunctionParameterTypeHints = true,
                                    includeInlayVariableTypeHints = false,
                                    includeInlayPropertyDeclarationTypeHints = true,
                                    includeInlayFunctionLikeReturnTypeHints = true,
                                    includeInlayEnumMemberValueHints = true,
                                },
                            },
                            javascript = {
                                inlayHints = {
                                    includeInlayParameterNameHints = "all",
                                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                    includeInlayFunctionParameterTypeHints = true,
                                    includeInlayVariableTypeHints = true,
                                    includeInlayPropertyDeclarationTypeHints = true,
                                    includeInlayFunctionLikeReturnTypeHints = true,
                                    includeInlayEnumMemberValueHints = true,
                                },
                            },
                        },
                    },
                    -- html will be automatically installed with mason and loaded with lspconfig
                    html = {},
                    -- yaml
                    yamlls = {
                        settings = {
                            yaml = {
                                keyOrdering = false,
                            },
                        },
                    },
                    -- pyright will be automatically installed with mason and loaded with lspconfig
                    pyright = {},
                    lua_ls = {
                        -- enabled = false,
                        single_file_support = true,
                        settings = {
                            Lua = {
                                workspace = {
                                    checkThirdParty = false,
                                },
                                completion = {
                                    workspaceWord = true,
                                    callSnippet = "Both",
                                },
                                misc = {
                                    parameters = {
                                        -- "--log-level=trace",
                                    },
                                },
                                hint = {
                                    enable = true,
                                    setType = false,
                                    paramType = true,
                                    paramName = "Disable",
                                    semicolon = "Disable",
                                    arrayIndex = "Disable",
                                },
                                doc = {
                                    privateName = { "^_" },
                                },
                                type = {
                                    castNumberToInteger = true,
                                },
                                diagnostics = {
                                    disable = { "incomplete-signature-doc", "trailing-space" },
                                    -- enable = false,
                                    groupSeverity = {
                                        strong = "Warning",
                                        strict = "Warning",
                                    },
                                    groupFileStatus = {
                                        ["ambiguity"] = "Opened",
                                        ["await"] = "Opened",
                                        ["codestyle"] = "None",
                                        ["duplicate"] = "Opened",
                                        ["global"] = "Opened",
                                        ["luadoc"] = "Opened",
                                        ["redefined"] = "Opened",
                                        ["strict"] = "Opened",
                                        ["strong"] = "Opened",
                                        ["type-check"] = "Opened",
                                        ["unbalanced"] = "Opened",
                                        ["unused"] = "Opened",
                                    },
                                    unusedLocalExclude = { "_*" },
                                },
                                format = {
                                    enable = false,
                                    defaultConfig = {
                                        indent_style = "space",
                                        indent_size = "2",
                                        continuation_indent_size = "2",
                                    },
                                },
                            },
                        },
                    },
                },
				-- you can do any additional lsp server setup here
				-- return true if you don't want this server to be setup with lspconfig
				---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
				setup = {
					-- Specify * to use this function as a fallback for any server
					["*"] = function(server, opts) end,
				},
			},
	},

}