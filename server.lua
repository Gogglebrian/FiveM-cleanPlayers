--Register event that notifies client to clean ped upon entering scope
RegisterServerEvent('playerEnteredScope')
AddEventHandler('playerEnteredScope', function( data )
	local observer = data["for"]
	local enterer = data["player"]
	TriggerClientEvent('clean:cleanPlayerPed', observer, enterer, "scope entry") -- tell the observer to clean the entererer's ped
end)

--If a client wants their ped cleaned across the network, tell all clients to do so
RegisterServerEvent('clean:cleanMyPed')
AddEventHandler('clean:cleanMyPed', function( reasonForCleaning )
	TriggerClientEvent('clean:cleanPlayerPed', -1, source, reasonForCleaning)
end)