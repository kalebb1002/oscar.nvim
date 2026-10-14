local M = {}

-- Setup function invoked automatically by lazy.nvim
function M.setup(opts)
    -- Default greeting if no configuration is provided
    local msg = (opts and opts.message) or "Oscar says hello!"

    -- Create a custom command :Oscar
    vim.api.nvim_create_user_command("Oscar", function()
        print(msg)
    end, {})
end

return M

