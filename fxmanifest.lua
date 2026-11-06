fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'pigeon-no-wanted'
author 'Pigeon Studios'
description 'Turns off GTA\'s wanted level, AI police and the AI ambulances and fire engines, with each service chosen in the config.'
version '0.1.0'
repository 'https://github.com/pigeon-studios-uk/pigeon-no-wanted'

-- Pigeon Studios version registry entry, read by server/version_check.lua.
pigeon_slug 'pigeon-no-wanted'

client_scripts {
    'configuration/config.lua',
    'client/main.lua',
}

server_scripts {
    'server/version_check.lua',
}
