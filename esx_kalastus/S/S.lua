ESX = nil

Itemit = {
    "vesi",
    "radio",
    "phone"
}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_fishing:caughtFish')
AddEventHandler('esx_fishing:caughtFish', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem(jokuitemi(), randomimaara())
end)

function jokuitemi()
    return Itemit[math.random(#Itemit)]
  end

  function randomimaara()
      return math.random(1,2)
  end

ESX.RegisterUsableItem('fishingrod', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
		TriggerClientEvent('esx_fishing:startFishing', source)
end)

RegisterServerEvent('esx_fishing:removeInventoryItem')
AddEventHandler('esx_fishing:removeInventoryItem', function(item, quantity)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem(item, quantity)
end)
