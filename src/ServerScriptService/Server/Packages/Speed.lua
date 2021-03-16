local module = {
	Name = "Speed",
	Description = "Changes a player's WalkSpeed",
	Location = "Player",
}

module.Execute = function(Client, Type, Attachment)			
	if Type == "command" then
		local Input = module.API.sendModalToPlayer(Client).Event:Wait()
		
		if Input == false then
			return
		end

		local char = module.API.getCharacter(module.API.getPlayerWithName(Attachment))
		
		if char then
			char:FindFirstChildOfClass("Humanoid").WalkSpeed = tonumber(Input)
			return true
		end
	end
end

return module
