--Event handler for when we respawn, tell the server to clean us (for all players)
RegisterNetEvent('playerSpawned')
AddEventHandler('playerSpawned', function()
	TriggerServerEvent('clean:cleanMyPed', "respawn")
end)

--Event handler when the server tells us to clean a particular ped
RegisterNetEvent('clean:cleanPlayerPed')
AddEventHandler('clean:cleanPlayerPed', function( source , reasonForCleaning )
	local ped = GetPlayerPed(GetPlayerFromServerId(source))
	if (ped ~= nil) then
		CleanPed(ped)
		if (tonumber(source) == tonumber(GetPlayerServerId(PlayerId()))) then
			print("Local ped (" .. source .. ") cleaned (" .. reasonForCleaning .. ")") --DEBUG
		else
			print("Remote ped (" .. source .. ") cleaned (" .. reasonForCleaning .. ")") --DEBUG
		end
	else 
		print("Remote ped (" .. source .. ") not found for cleaning (" .. reasonForCleaning .. ")") --DEBUG
	end
end)

--Cleans particular ped of blood, dirt, and wetness
function CleanPed( ped )
	ClearPedBloodDamage(ped)
	ClearPedEnvDirt(ped)
	ClearPedWetness(ped)
	ClearPedDamageDecalByZone(ped, 0, "ALL")
 	ClearPedDamageDecalByZone(ped, 1, "ALL")
 	ClearPedDamageDecalByZone(ped, 2, "ALL")
 	ClearPedDamageDecalByZone(ped, 3, "ALL")
 	ClearPedDamageDecalByZone(ped, 4, "ALL")
 	ClearPedDamageDecalByZone(ped, 5, "ALL")
	ResetPedVisibleDamage(ped)
end