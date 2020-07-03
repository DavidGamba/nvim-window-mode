--[[
	/*
	 * IMPORTS
	 */
--]]

local contains     = vim.tbl_contains
local api          = vim.api
local nvim_command = api.nvim_command

--[[
	/*
	 * MODULE
	 */
--]]

local _combos = {
	['s'] = function() nvim_command('wincmd s')  end,
	['v'] = function() nvim_command('wincmd v')  end,
	['^'] = function() nvim_command('wincmd ^')  end,
	['q'] = function() nvim_command('wincmd q')  end,
	['r'] = function() nvim_command('wincmd r')  end,
}

local _move_left    = {'h', "<Left>"}
local _move_right   = {'l', "<Right>"}
local _move_up      = {'k', "<Up>"}
local _move_down    = {'j', "<Down>"}
local _resize_left  = {'H', '<', ','}
local _resize_right = {'L', '>', '.'}
local _resize_up    = {'K', '+'}
local _resize_down  = {'J', '-'}

--[[
	/*
	 * MODE "TABS"
	 */
--]]

local function _modeInstruction()
	-- local uinput = string.char(vim.api.nvim_get_var('tabsModeInput'))
	local uinput = string.char(api.nvim_get_var('windowModeInput'))

	    if contains(_move_left    , uinput) then nvim_command('wincmd h')
	elseif contains(_move_right   , uinput) then nvim_command('wincmd l')
	elseif contains(_move_up      , uinput) then nvim_command('wincmd k')
	elseif contains(_move_down    , uinput) then nvim_command('wincmd j')
	elseif contains(_resize_left  , uinput) then nvim_command('wincmd <')
	elseif contains(_resize_right , uinput) then nvim_command('wincmd >')
	elseif contains(_resize_up    , uinput) then nvim_command('wincmd +')
	elseif contains(_resize_down  , uinput) then nvim_command('wincmd -')
	elseif _combos[uinput]                  then _combos[uinput]()
	end
end

--[[
	/*
	 * PUBLICIZE MODULE
	 */
--]]

return require('libmodal').Mode.new('WINDOW', _modeInstruction)
