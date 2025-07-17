local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
local fusion = require(game.ReplicatedStorage.Packages.fusion)
local scope = fusion.scoped()

local text = scope:Value("Carregando...")

local textLabel = scope:New("TextLabel")({
	Size = UDim2.fromScale(0.35, 0.35),
	Position = UDim2.fromScale(0.35, 0.35),
	Parent = playerGui,
	Text = text,
})

task.delay(5, function()
	text:set("Done!")
end)