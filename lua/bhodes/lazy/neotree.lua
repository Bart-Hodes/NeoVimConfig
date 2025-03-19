return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      -- fill any relevant options here
    },
  

    config = function()
        require("neo-tree").setup({
            filesystem = {
              window = {
                position = "right",
                popup = {
                  position = { col = "100%", row = "2" },
                  size = function(state)
                    local root_name = vim.fn.fnamemodify(state.path, ":~")
                    local root_len = string.len(root_name) + 4
                    return {
                      width = math.max(root_len, 50),
                      height = vim.o.lines - 6
                    }
                  end
                },
              }
            }
          })
    end


}

