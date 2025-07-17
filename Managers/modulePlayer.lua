local modulePlayer = {}
modulePlayer.__index = modulePlayer

export type typeState = {
	Name: string,
	Duration: number,
	Completed: () -> (),
	Enter: (string) -> boolean,
}

export type typeModulePlayer = {
	Player: Player,
	Name: string,
	ID: number,
	Character: Model & { Humanoid: Humanoid },
	UI: PlayerGui,
	Data: {},
	Inventory: {},
	State: typeState,
}

function modulePlayer:GetCharacter()
	local char = self.Player.Character
	local Humanoid = char and char:FindFirstChildOfClass("Humanoid") or nil
	if Humanoid then
		return char :: Model & { Humanoid: Humanoid }
	else
		error("Character ou Humanoid não encontrados")
	end
end

function modulePlayer.New(player: Player)
	local newPlayer: typeModulePlayer = {} :: any
	setmetatable(newPlayer, modulePlayer)
	newPlayer.Player = player
	newPlayer.Name = player.Name
	newPlayer.ID = player.UserId
	newPlayer.UI = player.PlayerGui

	newPlayer.Character = newPlayer:GetCharacter()
	newPlayer.Data = {}
	newPlayer.Inventory = {}
	newPlayer.State = {} :: typeState

	return newPlayer
end

return modulePlayer
