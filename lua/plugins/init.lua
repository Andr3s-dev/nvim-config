return {
  { 
    "github/copilot.vim",
  }, -- or zbirenbaum/copilot.lua
  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- require("nvchad.config.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettierd",
        "typescript-language-server",
        "pyright",
        "clangd",
        "eslint-lsp",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "python",
        "cpp",
        "bash",
        "fish",
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      prompts={
        Rename = {
          prompt = 'Please rename the variable correctly in given selection based on context',
          selextion = function (source)
            local select = require('CopilotChat.select')
            return select.visual(source)
          end
        },
      },
    },
    keys = {
      {"<leader>zc", ":CopilotChat<CR>", mode="n", desc = "Chat with Copilot"},
      {"<leader>ze", ":CopilotChatExplain<CR>", mode="v", desc = "Explain code"},
      {"<leader>zr", ":CopilotChatReview<CR>", mode="v", desc = "Review code"},
      {"<leader>zf", ":CopilotChatFix<CR>", mode="v", desc = "Fix code Issues"},
      {"<leader>zo", ":CopilotChatOptimize<CR>", mode="v", desc = "Optimize code"},
      {"<leader>zd", ":CopilotChatDocs<CR>", mode="v", desc = "Generater docs"},
      {"<leader>zt", ":CopilotChatTests<CR>", mode="v", desc = "Generate tests"},
      {"<leader>zm", ":CopilotChatCommit<CR>", mode="n", desc = "Generate commit message"},
      {"<leader>zs", ":CopilotChatCommit<CR>", mode="v", desc = "Generate commit for selection"},
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  -- {
  --   "David-Kunz/gen.nvim",
  --   lazy = false,
  --   config = function()
  --     require "configs.gen"
  --   end,
  -- },
}
