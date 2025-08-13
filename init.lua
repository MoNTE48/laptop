laptop = {}
laptop.class_lib = {}
laptop.S = core.get_translator("laptop")

function laptop.close_btn(pos, player)
	pos = pos or "15.5,-0.4"
	-- Note: player must be nil when node meta formspecs are used
	if player and minetest.global_exists("inv_themes") and inv_themes then -- for default game
		return inv_themes.get_theme(player):close_btn(pos)
	end

	return "style[exit;content_offset=0]" ..
		-- Make the close texture opaque
		"image_button_exit[" .. pos .. ";0.75,0.75;close_pressed.png^[colorize:#D6D5E6^close.png;" ..
			"exit;;true;false;close_pressed.png]"
end

-- These sizes are in bytes
laptop.max_filename_size = 1000
laptop.max_text_size = 10000
laptop.max_files = 8

function laptop.truncate_text(text, max_size)
	-- Like text:sub(1, max_size) but won't split a multi-byte character (which
	-- causes the text to be shown as <invalid UTF-8 string> or something)
	if #text > max_size then
		return utf8.remove(text:sub(1, max_size + 1))
	end
	return text
end

dofile(minetest.get_modpath('laptop')..'/themes.lua')
dofile(minetest.get_modpath('laptop')..'/block_devices.lua')
dofile(minetest.get_modpath('laptop')..'/app_fw.lua')
dofile(minetest.get_modpath('laptop')..'/mtos.lua')
dofile(minetest.get_modpath('laptop')..'/hardware_fw.lua')
dofile(minetest.get_modpath('laptop')..'/recipe_compat.lua')
dofile(minetest.get_modpath('laptop')..'/hardware_nodes.lua')
dofile(minetest.get_modpath('laptop')..'/craftitems.lua')
