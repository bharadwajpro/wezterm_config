-- This file contains placeholder SSH configuration.
-- Your actual SSH configuration should be placed in a file
-- named `local_ssh_config.lua` in the same directory.
-- `local_ssh_config.lua` is git-ignored to protect your sensitive data.

local function load_config()
	-- Check for the local configuration file
	local success, local_config = pcall(require, "local_ssh_config")

	if success then
		-- If the local config exists, return it
		return local_config
	else
		-- Otherwise, return a placeholder configuration
		return {
			ssh_domains = {
				{
					name = "example.com",
					remote_address = "192.168.1.1",
					username = "user",
					-- ssh_option = {
					--   identityfile = "~/.ssh/id_rsa",
					-- },
				},
			},
		}
	end
end

return load_config()

