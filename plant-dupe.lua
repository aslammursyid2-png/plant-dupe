-- PLANT DUPE - Delta Executor
-- created by me

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- ================= GUI =================
local gui = Instance.new("ScreenGui")
gui.Name = "PlantDupeGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ================= DRAG FUNCTION =================
local function makeDraggable(frame)
	local dragging = false
	local dragStart, startPos

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)

	UIS.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)
end

-- ================= PANEL 1 =================
local panel1 = Instance.new("Frame", gui)
panel1.Size = UDim2.new(0, 320, 0, 180)
panel1.Position = UDim2.new(0.5, -160, 0.5, -90)
panel1.BackgroundColor3 = Color3.fromRGB(35,35,35)
panel1.BorderSizePixel = 0
makeDraggable(panel1)

Instance.new("UICorner", panel1).CornerRadius = UDim.new(0,12)

local title1 = Instance.new("TextLabel", panel1)
title1.Size = UDim2.new(1,0,0,40)
title1.BackgroundTransparency = 1
title1.Text = "PLANT DUPE"
title1.Font = Enum.Font.GothamBold
title1.TextSize = 20
title1.TextColor3 = Color3.fromRGB(0,255,0)

local loadingText = Instance.new("TextLabel", panel1)
loadingText.Size = UDim2.new(1,0,0,30)
loadingText.Position = UDim2.new(0,0,0.45,0)
loadingText.BackgroundTransparency = 1
loadingText.Text = ""
loadingText.Font = Enum.Font.Gotham
loadingText.TextSize = 16
loadingText.TextColor3 = Color3.new(1,1,1)

local startBtn = Instance.new("TextButton", panel1)
startBtn.Size = UDim2.new(0.7,0,0,40)
startBtn.Position = UDim2.new(0.15,0,0.65,0)
startBtn.Text = "MULAI"
startBtn.Font = Enum.Font.GothamBold
startBtn.TextSize = 18
startBtn.TextColor3 = Color3.new(1,1,1)
startBtn.BackgroundColor3 = Color3.fromRGB(0,170,0)
Instance.new("UICorner", startBtn).CornerRadius = UDim.new(0,8)

-- ================= PANEL 2 =================
local panel2 = Instance.new("Frame", gui)
panel2.Size = UDim2.new(0, 350, 0, 200)
panel2.Position = UDim2.new(0.5, -175, 0.5, -100)
panel2.BackgroundColor3 = Color3.fromRGB(30,30,30)
panel2.Visible = false
panel2.BorderSizePixel = 0
makeDraggable(panel2)

Instance.new("UICorner", panel2).CornerRadius = UDim.new(0,12)

local warning = Instance.new("TextLabel", panel2)
warning.Size = UDim2.new(1,-20,0,70)
warning.Position = UDim2.new(0,10,0,10)
warning.BackgroundTransparency = 1
warning.TextWrapped = true
warning.Text = "PERINGATAN:\nPegang tanaman saat memencet tombol DUPE"
warning.Font = Enum.Font.GothamBold
warning.TextSize = 16
warning.TextColor3 = Color3.fromRGB(255,200,0)

local dupeBtn = Instance.new("TextButton", panel2)
dupeBtn.Size = UDim2.new(0.6,0,0,45)
dupeBtn.Position = UDim2.new(0.2,0,0.6,0)
dupeBtn.Text = "DUPE"
dupeBtn.Font = Enum.Font.GothamBold
dupeBtn.TextSize = 20
dupeBtn.TextColor3 = Color3.new(1,1,1)
dupeBtn.BackgroundColor3 = Color3.fromRGB(170,0,0)
Instance.new("UICorner", dupeBtn).CornerRadius = UDim.new(0,8)

-- ================= BLACK SCREEN =================
local black = Instance.new("Frame", gui)
black.Size = UDim2.new(1,0,1,0)
black.BackgroundColor3 = Color3.new(0,0,0)
black.Visible = false

local resultText = Instance.new("TextLabel", black)
resultText.Size = UDim2.new(1,0,1,0)
resultText.BackgroundTransparency = 1
resultText.Text = "dupe telah berhasil"
resultText.Font = Enum.Font.GothamBold
resultText.TextSize = 28
resultText.TextColor3 = Color3.new(1,1,1)
resultText.Visible = false

-- ================= LOGIC =================
startBtn.MouseButton1Click:Connect(function()
	startBtn.Visible = false
	for i = 1,100 do
		loadingText.Text = "Loading... "..i.."%"
		wait(0.2) -- 20 detik total
	end
	panel1.Visible = false
	panel2.Visible = true
end)

dupeBtn.MouseButton1Click:Connect(function()
	panel2.Visible = false
	black.Visible = true
	resultText.Visible = false

	wait(5)
	resultText.Visible = true

	wait(2)
	black.Visible = false
	panel2.Visible = true
end)
