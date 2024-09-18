return {
  { "williamboman/mason.nvim", opts = {} },
  { "williamboman/mason-lspconfig.nvim", opts = {} },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-vsnip" },
  { "hrsh7th/vim-vsnip" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "css",
          "dockerfile",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "make",
          "prisma",
          "typescript",
          "tsx",
          "vim",
          "vimdoc"
        },
        sync_install = false,
        indent = { enable = true },
        incremental_selection = { enable = true },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[F]ind [F]iles using Telescope" },
      { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "[F]ind [S]tring using Telescope" },
      { "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "[F]uzzy find current [B]uffer using Telescope" },
      { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "List [B]uffers using Telescope" },
      { "<leader>c", "<cmd>Telescope commands<cr>", desc = "List [C]ommands using Telescope" },
      { "<leader>r", "<cmd>Telescope registers<cr>", desc = "List [R]egisters using Telescope" },
    },
    config = function()
      require("telescope").load_extension("fzf")
    end
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {}
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {}
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      { "MunifTanjim/nui.nvim" },
      { "rcarriga/nvim-notify" }
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = false,
        command_palette = false,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      views = {
        cmdline_popup = {
          border = {
            style = "none",
            padding = { 1, 2 }
          },
          filter_options = {},
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder"
          }
        }
      }
    }
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps" }
    },
    opts = {}
  },
  {
    "ms-jpq/chadtree",
    branch = "chad",
    keys = {
      { "<leader>tt", "<cmd>CHADopen<cr>", desc = "[T]oggle CHAD[T]ree" }
    },
    config = function()
      local chadtree_settings = {
        view = { open_direction = "right" }
      }
      vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
    end,
    build = function()
      vim.cmd("python3 -m chadtree deps")
    end
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },
  { "lewis6991/gitsigns.nvim", opts = {} },
  { "miikanissi/modus-themes.nvim", priority = 1000 },
  { "wakatime/vim-wakatime" }
}
