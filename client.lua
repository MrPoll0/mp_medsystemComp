ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local health = GetEntityHealth(GetPlayerPed(-1)) 
local armour = GetPedArmour(GetPlayerPed(-1))
local allHealth = (math.max(health-100,0)/2) + (armour/2)

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(0)
		health = GetEntityHealth(GetPlayerPed(-1)) 
    	armour = GetPedArmour(GetPlayerPed(-1))
    	allHealth = (math.max(health-100,0)/2) + (armour/2)
	end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

    local prevHealth = allHealth
    if prevHealth then 
    	Citizen.Wait(1000)
    	local currentHealth = allHealth
    	if currentHealth < prevHealth or currentHealth > prevHealth then
		    SendNUIMessage({
		    	heal = allHealth
		    });
	 	end
	end
  end
end)