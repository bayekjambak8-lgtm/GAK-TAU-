-- GAKTAU GABUT - Grow a Garden
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local autoCollect = false
local autoSell = false
local autoPlant = false
local autoWater = false

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GAGHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 350, 0, 420)
Frame.Position = UDim2.new(0.5, -175, 0.5, -210)
Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
Frame.BorderSizePixel = 0
Frame.Active = false
Frame.Draggable = true
Frame.ZIndex = 1
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

local Judul = Instance.new("TextLabel")
Judul.Size = UDim2.new(1, 0, 0, 50)
Judul.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
Judul.BorderSizePixel = 0
Judul.Text = "🌱 GAKTAU GARDEN"
Judul.TextColor3 = Color3.fromRGB(255, 255, 255)
Judul.TextScaled = true
Judul.Font = Enum.Font.GothamBold
Judul.ZIndex = 2
Judul.Parent = Frame

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 12)
UICorner2.Parent = Judullocal function bikinTombol(nama, posY, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Position = UDim2.new(0.05, 0, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
    btn.BorderSizePixel = 0
    btn.Text = nama
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.ZIndex = 5
    btn.Parent = Frame
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = btn
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local Kat1 = Instance.new("TextLabel")
Kat1.Size = UDim2.new(0.9, 0, 0, 20)
Kat1.Position = UDim2.new(0.05, 0, 0, 60)
Kat1.BackgroundTransparency = 1
Kat1.Text = "🌾 FARMING"
Kat1.TextColor3 = Color3.fromRGB(50, 200, 50)
Kat1.TextScaled = true
Kat1.Font = Enum.Font.GothamBold
Kat1.TextXAlignment = Enum.TextXAlignment.Left
Kat1.ZIndex = 2
Kat1.Parent = Frame

local BtnCollect = bikinTombol("Auto Collect: OFF", 85, function()
    autoCollect = not autoCollect
    BtnCollect.Text = "Auto Collect: " .. (autoCollect and "ON" or "OFF")
    BtnCollect.BackgroundColor3 = autoCollect and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(20, 20, 40)
end)

local BtnSell = bikinTombol("Auto Sell: OFF", 125, function()
    autoSell = not autoSell
    BtnSell.Text = "Auto Sell: " .. (autoSell and "ON" or "OFF")
    BtnSell.BackgroundColor3 = autoSell and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(20, 20, 40)
end)

local BtnPlant = bikinTombol("Auto Plant: OFF", 165, function()
    autoPlant = not autoPlant
    BtnPlant.Text = "Auto Plant: " .. (autoPlant and "ON" or "OFF")
    BtnPlant.BackgroundColor3 = autoPlant and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(20, 20, 40)
end)

local BtnWater = bikinTombol("Auto Water: OFF", 205, function()
    autoWater = not autoWater
    BtnWater.Text = "Auto Water: " .. (autoWater and "ON" or "OFF")
    BtnWater.BackgroundColor3 = autoWater and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(20, 20, 40)
end)local BtnClose = Instance.new("TextButton")
BtnClose.Size = UDim2.new(0.9, 0, 0, 35)
BtnClose.Position = UDim2.new(0.05, 0, 1, -45)
BtnClose.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
BtnClose.BorderSizePixel = 0
BtnClose.Text = "❌ TUTUP"
BtnClose.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnClose.TextScaled = true
BtnClose.Font = Enum.Font.GothamBold
BtnClose.ZIndex = 10
BtnClose.Parent = Frame

local cClose = Instance.new("UICorner")
cClose.CornerRadius = UDim.new(0, 6)
cClose.Parent = BtnClose

-- Tombol buka lagi
local BtnOpen = Instance.new("TextButton")
BtnOpen.Size = UDim2.new(0, 60, 0, 60)
BtnOpen.Position = UDim2.new(0, 20, 0.5, -30)
BtnOpen.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
BtnOpen.BorderSizePixel = 0
BtnOpen.Text = "🌱"
BtnOpen.TextScaled = true
BtnOpen.Font = Enum.Font.GothamBold
BtnOpen.ZIndex = 10
BtnOpen.Parent = ScreenGui
BtnOpen.Visible = false

local cOpen = Instance.new("UICorner")
cOpen.CornerRadius = UDim.new(0, 30)
cOpen.Parent = BtnOpen

BtnClose.MouseButton1Click:Connect(function()
    Frame.Visible = false
    BtnOpen.Visible = true
end)

BtnOpen.MouseButton1Click:Connect(function()
    Frame.Visible = true
    BtnOpen.Visible = false
end)

-- Loop fitur (placeholder)
game:GetService("RunService").Heartbeat:Connect(function()
    if not char or not char.Parent then return end
    -- Fitur auto collect, sell, plant, water bakal ditambahin nanti
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "GAKTAU GARDEN",
    Text = "Script berhasil dimuat!",
    Duration = 3
})
