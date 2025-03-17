local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
    },
    {
        -- Theme
        "luisiacc/gruvbox-baby",
        name = "gruvbox-baby",
        -- "rose-pine/neovim",
        -- name = "rose-pine",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
    },
    {
        'ThePrimeagen/harpoon',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },
    {
        'mbbill/undotree',
    },
    {
        -- tmux plugins
        'christoomey/vim-tmux-navigator',
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    {
        'tpope/vim-fugitive',
    },
    {
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },

        { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
        { 'neovim/nvim-lspconfig' },
        { 'L3MON4D3/LuaSnip' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/nvim-cmp' },
        -- Help with Vimtex completions
        { 'hrsh7th/cmp-omni' },
        -- {'SirVer/ultisnips'},
        -- {'quangnguyen30192/cmp-nvim-ultisnips'},
        -- {'honza/vim-snippets'},


        {
            'huggingface/llm.nvim',
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },
    {
        'numToStr/Comment.nvim',
        lazy = false,
    },
    {
        'scalameta/nvim-metals',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },
    {
        'lervag/vimtex'
    },
    {
        'GCBallesteros/jupytext.nvim',
        config = true,
    },
    {
        "GCBallesteros/NotebookNavigator.nvim",
        keys = {
            { "]h",        function() require("notebook-navigator").move_cell "d" end },
            { "[h",        function() require("notebook-navigator").move_cell "u" end },
            { "<leader>X", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
            { "<leader>x", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
        },
        dependencies = {
            "echasnovski/mini.comment",
            "Vigemus/iron.nvim", -- repl provider
            -- "akinsho/toggleterm.nvim", -- alternative repl provider
            -- "benlubas/molten-nvim", -- alternative repl provider
            "anuvyklack/hydra.nvim",
        },
        event = "VeryLazy",
        config = function()
            local nn = require "notebook-navigator"
            nn.setup({ activate_hydra_keys = "<leader>h" })
        end,
    },
    {
        "echasnovski/mini.hipatterns",
        event = "VeryLazy",
        dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
        opts = function()
            local nn = require "notebook-navigator"

            local opts = { highlighters = { cells = nn.minihipatterns_spec } }
            return opts
        end,
    },
}

local opts = {}

require("lazy").setup(plugins, opts)