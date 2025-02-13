local DataStoreService = game:GetService("DataStoreService")
local dataStore = DataStoreService:GetDataStore("commander.bans")
local module = {
	Name = "Check ban",
	Description = "Check a player's ban status",
	Location = "Player",
}

module.Execute = function(Client, Type, Attachment)			
	if Type == "command" then
		local player = module.API.getUserIdWithName(Attachment)
		local success, result = pcall(dataStore.GetAsync, dataStore, player)
		
		if success then
			if result or result.End == math.huge or os.time() < tonumber(result.End) then
				module.Remotes.Event:FireClient(Client, "newMessage", "", {From = "System; CheckBan (" .. player .. ")", Content = "This player is currently banned, here are the details:\nName: " .. Attachment .. "\nUserId: " .. player .. "\nBanned by: " .. tostring(result.By) .. "\nDuration: " .. tostring(result.End) .. "\nReason: " .. result.Reason or "N/A"})
			else
				module.Remotes.Event:FireClient(Client, "newMessage", "", {From = "System; CheckBan (" .. player .. ")", Content = "This player is not banned"})
			end
			return true
		else
			module.Remotes.Event:FireClient(Client, "newMessage", "", {From = "System; CheckBan (" .. player .. ")", Content = "An error occured, please retry later."})
		end
	end
end

return module