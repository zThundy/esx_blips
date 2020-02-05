ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local function checkAdmin(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local result = {}
	if xPlayer ~= nil then
		result = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {['identifier'] = xPlayer.identifier})
	end
	if result[1].group ~= nil and result[1].group == "superadmin" then
		return true
	end
	return false
end

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

AddEventHandler('chatMessage', function(source, name, msg)
    sm = stringsplit(msg, " ");

	if source ~= nil then
		local check = checkAdmin(source)
		if check then
			if sm[1] == "/blips" then
				CancelEvent()
				TriggerClientEvent('mostraBlips', source)
			end
		else
			TriggerClientEvent(source, 'chatMessage', 'SYSTEM ', {0, 255, 0}, "Non hai i permessi per eseguire questo comando.")
		end
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
    sm = stringsplit(msg, " ");

	if source ~= nil then
		local check = checkAdmin(source)
		if check then
			if sm[1] == "/names" then
				CancelEvent()
				TriggerClientEvent('mostraNomi', source)
			end
		else
			TriggerClientEvent(source, 'chatMessage', 'SYSTEM ', {0, 255, 0}, "Non hai i permessi per eseguire questo comando.")
		end
	end
end)

--[[AddEventHandler('chatMessage', function(source, name, msg)
    sm = stringsplit(msg, " ");
    if sm[1] == "/names" then
        CancelEvent()
        TriggerClientEvent('mostraNomi', source)
    end
end)]]
