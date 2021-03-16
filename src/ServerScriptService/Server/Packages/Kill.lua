local module = {
	Name = "Kill",
	Description = "Kills a player with the Humanoid method",
	Location = "Player",
}

module.Execute = function(Client, Type, Attachment)			
	if Type == "command" then
		local char = module.API.getCharacter(module.API.getPlayerWithName(Attachment))
		if char then
			char:FindFirstChildOfClass("Humanoid").Health = 0
			return true
		end
	end
end

return module
