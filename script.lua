--// GUI principal
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local OpenClose = Instance.new("TextButton")
local DuplicateButton = Instance.new("TextButton")
local dragging, dragInput, dragStart, startPos

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

--// Marco del menú
MainFrame.Size = UDim2.new(0, 200, 0, 120)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

--// Botón para abrir y cerrar
OpenClose.Size = UDim2.new(0, 60, 0, 60)
OpenClose.Position = UDim2.new(0.05, 0, 0.1, 0)
OpenClose.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OpenClose.Text = "Teipx Hub"
OpenClose.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenClose.Font = Enum.Font.GothamBold
OpenClose.TextScaled = true
OpenClose.Parent = ScreenGui
OpenClose.AutoButtonColor = true
OpenClose.Style = Enum.ButtonStyle.RobloxRoundButton

--// Botón duplicar
DuplicateButton.Size = UDim2.new(0, 160, 0, 50)
DuplicateButton.Position = UDim2.new(0.1, 0, 0.3, 0)
DuplicateButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DuplicateButton.Text = "Duplicar"
DuplicateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DuplicateButton.Font = Enum.Font.GothamBold
DuplicateButton.TextScaled = true
DuplicateButton.Parent = MainFrame

--// Función para abrir/cerrar
OpenClose.MouseButton1Click:Connect(function()
	MainFrame.Visible = not MainFrame.Visible
end)

--// Función para duplicar el objeto en la mano
DuplicateButton.MouseButton1Click:Connect(function()
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local tool = player.Character:FindFirstChildOfClass("Tool")

	if tool then
		local clone = tool:Clone()
		clone.Parent = player.Backpack
	else
		warn("No tienes ninguna herramienta en la mano.")
	end
end)
