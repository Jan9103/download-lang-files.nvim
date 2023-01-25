-- luacheck: globals vim

local M = {website = "https://ftp.pl.vim.org/pub/vim/runtime/spell/"}

function M.download_current_lang()
	if not vim.o.spelllang then
		vim.notify('No spelllang specified. Specify one with ":set spelllang=en"')
		return
	end
	local dir = vim.fn.stdpath("config") .. "/spell/"
	local file = vim.o.spelllang .. ".utf-8.spl"
	if not vim.loop.fs_stat(dir) then
		require('plenary.path'):new(dir):mkdir()
	elseif vim.loop.fs_stat(dir .. file) then
		vim.notify('Language "' .. vim.o.spelllang .. '" already installed.')
		return
	end
	vim.notify("Attempting to download " .. file)
	require('plenary.curl').get(M.website .. file, {
		output = dir .. file,
	})
	vim.notify("Downloaded " .. file)
end

function M.setup(config)
	config = config or {}
	if config.website then M.website = config.website end

	vim.api.nvim_create_user_command('DownloadSpellLang', M.download_current_lang, {})
end

return M
