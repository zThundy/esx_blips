description "Enable / Disable Blips on map and names on head."

client_scripts{
  'client.lua',
  '@es_extended/locale.lua',
}

server_scripts{ 
    'server.lua',
    '@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
}