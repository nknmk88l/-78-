local FpsGui = Instance.new("ScreenGui") local FpsXS = Instance.new("TextLabel") FpsGui.Name = "FPSGui" FpsGui.ResetOnSpawn = false FpsGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling FpsXS.Name = "FpsXS" FpsXS.Size = UDim2.new(0, 100, 0, 50) FpsXS.Position = UDim2.new(0, 10, 0, 10) FpsXS.BackgroundTransparency = 1 FpsXS.Font = Enum.Font.SourceSansBold FpsXS.Text = "帧率: 0" FpsXS.TextSize = 20 FpsXS.TextColor3 = Color3.new(1, 1, 1) FpsXS.Parent = FpsGui function updateFpsXS() local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait()) FpsXS.Text = "帧率: " .. fps end game:GetService("RunService").RenderStepped:Connect(updateFpsXS) FpsGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/qwrt5589/eododo/64b30a2b84891f44f8feb324e3cc56c6e663d7f4/%E9%BB%8E%E6%98%8E%E7%9A%84%E7%8B%97%E5%B1%8E.lua"))()
local win = ui:new("таинственный脚本")
--
local UITab84 = win:Tab("信息",'16060333448')

local about = UITab84:section("『介绍』",true)
about:Label("таинственный脚本")
about:Label("永久免费")
about:Label("作者таинственный")
about:Label("本脚本为免费缝合脚本")
about:Button("点我复制作者QQ群",function()
    setclipboard("943953581")
end)

about:Toggle("脚本框架变小一点", "", false, function(state)
        if state then
        game:GetService("CoreGui")["frosty"].Main.Style = "DropShadow"
        else
            game:GetService("CoreGui")["frosty"].Main.Style = "Custom"
        end
    end)
    about:Button("关闭脚本",function()
        game:GetService("CoreGui")["frosty"]:Destroy()
    end)
    
task.spawn(function()
    while true do
        about:Label("当前时间: " .. os.date("%Y-%m-%d %H:%M:%S"))
        
        local springFestivalTime = os.time({
            year = 2025,
            month = 1,
            day = 29,
            hour = 0,
            min = 0,
            sec = 0,
        }) - os.time()
        
        if springFestivalTime > 0 then
            about:Label(string.format("春节倒计时: %d天%d小时%d分钟%d秒", 
                math.floor(springFestivalTime / 86400), 
                math.floor(springFestivalTime % 86400 / 3600), 
                math.floor(springFestivalTime % 3600 / 60), 
                springFestivalTime % 60))
        else
            about:Label("过年啦！！！")
        end
        
        local newYearTime = os.time({
            year = 2026,
            month = 1,
            day = 1,
            hour = 0,
            min = 0,
            sec = 0,
        }) - os.time()
        
        if newYearTime > 0 then
            about:Label(string.format("跨年倒计时: %d天%d小时%d分钟%d秒", 
                math.floor(newYearTime / 86400), 
                math.floor(newYearTime % 86400 / 3600), 
                math.floor(newYearTime % 3600 / 60), 
                newYearTime % 60))
        else
            about:Label("跨年啦！！！")
        end
        
        local newYearsEveTime = os.time({
            year = 2025,
            month = 1,
            day = 28,
            hour = 0,
            min = 0,
            sec = 0,
        }) - os.time()
        
        if newYearsEveTime > 0 then
            about:Label(string.format("除夕倒计时: %d天%d小时%d分钟%d秒", 
                math.floor(newYearsEveTime / 86400), 
                math.floor(newYearsEveTime % 86400 / 3600), 
                math.floor(newYearsEveTime % 3600 / 60), 
                newYearsEveTime % 60))
        else
            about:Label("除夕啦！！！")
        end
        
        local lanternFestivalTime = os.time({
            year = 2025,
            month = 2,
            day = 12,
            hour = 0,
            min = 0,
            sec = 0,
        }) - os.time()
        
        if lanternFestivalTime > 0 then
            about:Label(string.format("元宵节倒计时: %d天%d小时%d分钟%d秒", 
                math.floor(lanternFestivalTime / 86400), 
                math.floor(lanternFestivalTime % 86400 / 3600), 
                math.floor(lanternFestivalTime % 3600 / 60), 
                lanternFestivalTime % 60))
        else
            about:Label("元宵节啦！！！")
        end
        
        task.wait(1)
    end
end)

local UITab84 = win:Tab("通用",'16060333448')

local about = UITab84:section("『功能』",true)
  
about:Toggle("快跑开关","开关",false,function(v)
                if v == true then
                    sudu = game:GetService("RunService").Heartbeat:Connect(function()
                        if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Humanoid and game:GetService("Players").LocalPlayer.Character.Humanoid.Parent then
                            if game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                                game:GetService("Players").LocalPlayer.Character:TranslateBy(game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * Speed / 10)
                            end
                        end
                    end)
                elseif not v and sudu then
                    sudu:Disconnect()
                    sudu = nil
                end
            end)

about:Textbox("快速跑步『推荐调2』", "tpwalking", "输入", function(king)
local tspeed = king
local hb = game:GetService("RunService").Heartbeat
local tpwalking = true
local player = game:GetService("Players")
local lplr = player.LocalPlayer
local chr = lplr.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
  if hum.MoveDirection.Magnitude > 0 then
    if tspeed then
      chr:TranslateBy(hum.MoveDirection * tonumber(tspeed))
    else
      chr:TranslateBy(hum.MoveDirection)
    end
  end
end
end)

about:Slider('范围', '拉条',  1, 1, 50,false, function(v)
    _G.HeadSize = v
	_G.Disabled = true
		game:GetService('RunService').RenderStepped:connect(function()
			if _G.Disabled then
				for i,v in next, game:GetService('Players'):GetPlayers() do
				if v.Name ~= game:GetService('Players').LocalPlayer.Name then
					pcall(function()
					v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
					v.Character.HumanoidRootPart.Transparency = 0.9
					v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
					v.Character.HumanoidRootPart.Material = "Neon"
					v.Character.HumanoidRootPart.CanCollide = false
				end)
			end
		end
	end
end) 
end)

about:Slider('缩放距离!', 'ZOOOOOM OUT!',  128, 128, 200000,false, function(value)
    game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = value
    end)

about:Slider('缩放焦距(正常70)!', 'Sliderflag', 70, 0.1, 250, false, function(v)
        game.Workspace.CurrentCamera.FieldOfView = v
end)
  
about:Slider('相机焦距上限', 'ZOOOOOM OUT!',  128, 128, 200000,false, function(Value)
    game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = Value
end)

about:Slider('相机焦距【正常为70】', 'Sliderflag', 70, 0.1, 250, false, function(v)
        game.Workspace.CurrentCamera.FieldOfView = v
end)

about:Textbox("设置重力", "Gravity", "输入", function(gravity)
    spawn(function()
        while task.wait() do
            local workspace = game.Workspace
            workspace.Gravity = tonumber(gravity) or workspace.Gravity
        end
    end)
end)

local about = UITab84:section("『通用』",true)

about:Toggle("靠近自动攻击(需要拿起武器)", "AutoAttack", false, function(enabled)
    if enabled then
        if getgenv().configs and getgenv().configs.Disable then
            local configs = getgenv().configs
            local Disable = configs.Disable
            for _, connection in pairs(configs.connections) do
                connection:Disconnect()
            end
            Disable:Fire()
            Disable:Destroy()
            getgenv().configs = nil
        end
        
        local DisableEvent = Instance.new("BindableEvent")
        getgenv().configs = {
            connections = {},
            Disable = DisableEvent,
            Size = Vector3.new(10, 10, 10),
            DeathCheck = true,
        }
        
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local LocalPlayer = Players.LocalPlayer
        
        local isActive = true
        
        local function GetCharacter(player)
            return player and player.Character
        end
        
        local function GetHumanoid(model)
            if not model then return nil end
            return model:FindFirstChildWhichIsA("Humanoid")
        end
        
        local function IsAlive(humanoid)
            return humanoid and humanoid.Health > 0
        end
        
        local function FindToolTouchPart(tool)
            return tool and tool:FindFirstChildWhichIsA("TouchTransmitter", true)
        end
        
        local function GetOtherPlayerCharacters()
            local characters = {}
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    local char = GetCharacter(player)
                    if char then
                        table.insert(characters, char)
                    end
                end
            end
            return characters
        end
        
        local function AttackWithTool(tool, handle, target)
            if tool:IsDescendantOf(workspace) then
                tool:Activate()
                firetouchinterest(handle, target, 1)
                firetouchinterest(handle, target, 0)
            end
        end
        
        table.insert(getgenv().configs.connections, DisableEvent.Event:Connect(function()
            isActive = false
        end))
        
        while isActive do
            local character = GetCharacter(LocalPlayer)
            local humanoid = GetHumanoid(character)
            
            if IsAlive(humanoid) then
                local tool = character and character:FindFirstChildWhichIsA("Tool")
                local touchPart = tool and FindToolTouchPart(tool)
                
                if touchPart then
                    local toolHandle = touchPart.Parent
                    local otherCharacters = GetOtherPlayerCharacters()
                    
                    local overlapParams = OverlapParams.new()
                    overlapParams.FilterType = Enum.RaycastFilterType.Include
                    overlapParams.FilterDescendantsInstances = otherCharacters
                    
                    local nearbyParts = workspace:GetPartBoundsInBox(
                        toolHandle.CFrame,
                        toolHandle.Size + getgenv().configs.Size,
                        overlapParams
                    )
                    
                    for _, part in pairs(nearbyParts) do
                        local targetModel = part:FindFirstAncestorWhichIsA("Model")
                        if table.find(otherCharacters, targetModel) then
                            local targetHumanoid = GetHumanoid(targetModel)
                            if getgenv().configs.DeathCheck and IsAlive(targetHumanoid) then
                                AttackWithTool(tool, toolHandle, part)
                            elseif not getgenv().configs.DeathCheck then
                                AttackWithTool(tool, toolHandle, part)
                            end
                        end
                    end
                end
            end
            
            RunService.Heartbeat:Wait()
        end
        
    else
        if getgenv().configs and getgenv().configs.Disable then
            getgenv().configs.Disable:Fire()
            getgenv().configs.Disable:Destroy()
            
            for _, connection in pairs(getgenv().configs.connections) do
                connection:Disconnect()
            end
            
            getgenv().configs.connections = {}
            getgenv().configs = nil
        end
    end
end)

about:Toggle("自动互动", "AutoInteract", false, function(enabled)
    if enabled then
        autoInteract = true
        while autoInteract do
            for _, descendant in pairs(workspace:GetDescendants()) do
                if descendant:IsA("ProximityPrompt") then
                    fireproximityprompt(descendant)
                end
            end
            task.wait(0.25)
        end
    else
        autoInteract = false
    end
end)

about:Button("快速互动", function()
    game.ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt)
        prompt.HoldDuration = 0
    end)
end)

about:Toggle("人物不可见状态(隐身)", "Invisible Character", false, function(enabled)
    local localPlayer = game.Players.LocalPlayer
    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    
    for _, child in pairs(character:GetChildren()) do
        if child:IsA("BasePart") then
            child.Transparency = enabled and 1 or 0
            child.CanCollide = not enabled
        elseif child:IsA("Accessory") and child:FindFirstChild("Handle") then
            child.Handle.Transparency = enabled and 1 or 0
        end
    end
end)

about:Toggle("获取所有玩家背包", "GetBackPack", false, function(enabled)
    if enabled then
        while enabled do
            for _, player in pairs(game.Players:GetChildren()) do
                wait()
                for _, tool in pairs(player.Backpack:GetChildren()) do
                    tool.Parent = game.Players.LocalPlayer.Backpack
                    wait()
                end
            end
        end
    end
end)

about:Button("吸人(无法关闭)", function()
    loadstring(game:HttpGet("https://pastefy.app/fF3DMBNF/raw"))()
end)

about:Button("人物螺旋上天", function()
    loadstring(game:HttpGet("https://pastefy.app/xV1T3PAi/raw"))()
end)

about:Button("无限R币", function()
    loadstring(game:HttpGet("https://pastefy.app/SxhPVOyM/raw"))()
end)

about:Button("聊天气泡美化", function()
    loadstring(game:HttpGet("https://pastefy.app/lCEPuiQO/raw"))()
end)

about:Button("获取当前道具", function()
    loadstring(game:HttpGet("https://pastefy.app/3FU05Dyt/raw"))()
end)

about:Button("装备全部道具", function()
    loadstring(game:HttpGet("https://pastefy.app/uBqVR9JC/raw"))()
end)

about:Button("删除道具", function()
    loadstring(game:HttpGet("https://pastefy.app/r4LHK4p0/raw"))()
end)

about:Button("删除所有道具", function()
    loadstring(game:HttpGet("https://pastefy.app/8HB71Lbj/raw"))()
end)

about:Button("踢人脚本(仅娱乐)", function()
    loadstring(game:HttpGet([[https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/c8320f69b6aa4f5d.txt_2024-08-08_214628.OTed.lua]]))()
end)

about:Button("动画中心", function()
    loadstring(game:HttpGet([[https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui]], true))()
end)

about:Button("爬墙", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end)

about:Button("替身", function()
    loadstring(game:HttpGet([[https://raw.githubusercontent.com/SkrillexMe/SkrillexLoader/main/SkrillexLoadMain]]))()
end)

about:Button("聊天气泡美化", function()
    loadstring(game:HttpGet("https://pastefy.app/lCEPuiQO/raw"))()
end)

about:Button("人物绘制", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/pmgp7mdm"))()
end)

about:Toggle("人物显示", "RWXS", false, function(enabled)
    getgenv().enabled = enabled
    getgenv().filluseteamcolor = true
    getgenv().outlineuseteamcolor = true
    getgenv().fillcolor = Color3.new(1, 0, 0)
    getgenv().outlinecolor = Color3.new(1, 1, 1)
    getgenv().filltrans = 0.5
    getgenv().outlinetrans = 0.5
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/Highlight-ESP.lua"))()
end)

about:Button("无后坐快速射击", function()
    loadstring(game:HttpGet("https://pastefy.app/Vbnh3Ycg/raw"))()
end)

about:Button("无限子弹", function()
    loadstring(game:HttpGet("https://pastefy.app/bYg3smqm/raw"))()
end)

about:Button("弹人(实体)", function()
    loadstring(game:HttpGet("https://pastefy.app/4r9e4F3p/raw"))()
end)

about:Button("弹人(半实体)", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/UTWcDtzj"))()
end)

about:Button("获得管理员权限", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/sZpgTVas"))()
end)

about:Button("重新加入游戏", function()
    loadstring(game:HttpGet("https://pastefy.app/XXabqNiv/raw"))()
end)

about:Button("显示FPS", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/g54KFcUU"))()
end)

about:Button("显示时间", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/RycMWV3a"))()
end)

about:Button("F3X", function()
    loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
end)

about:Button("保存游戏", function()
    saveinstance()
end)

about:Button("离开游戏", function()
    game:Shutdown()
end)

about:Button("玩家加入与退出提示", function()
    loadstring(game:HttpGet("https://pastefy.app/KexNS25n/raw"))()
end)

about:Button("死亡笔记",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/tt/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0%20(1).txt"))()
end)

about:Button("飞行",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/tt/main/jm%E9%A3%9E..lua"))()
end)

about:Button("透视",function()  
    _G.FriendColor = Color3.fromRGB(0, 0, 255)
        local function ApplyESP(v)
       if v.Character and v.Character:FindFirstChildOfClass'Humanoid' then
           v.Character.Humanoid.NameDisplayDistance = 9e9
           v.Character.Humanoid.NameOcclusion = "NoOcclusion"
           v.Character.Humanoid.HealthDisplayDistance = 9e9
           v.Character.Humanoid.HealthDisplayType = "AlwaysOn"
           v.Character.Humanoid.Health = v.Character.Humanoid.Health -- triggers changed
       end
    end
    for i,v in pairs(game.Players:GetPlayers()) do
       ApplyESP(v)
       v.CharacterAdded:Connect(function()
           task.wait(0.33)
           ApplyESP(v)
       end)
    end
    
    game.Players.PlayerAdded:Connect(function(v)
       ApplyESP(v)
       v.CharacterAdded:Connect(function()
           task.wait(0.33)
           ApplyESP(v)
       end)
    end)
    
        local Players = game:GetService("Players"):GetChildren()
    local RunService = game:GetService("RunService")
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    
    for i, v in pairs(Players) do
        repeat wait() until v.Character
        if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = v.Character
            highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
            highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlightClone.Name = "Highlight"
        end
    end
    
    game.Players.PlayerAdded:Connect(function(player)
        repeat wait() until player.Character
        if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = player.Character
            highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
            highlightClone.Name = "Highlight"
        end
    end)
    
    game.Players.PlayerRemoving:Connect(function(playerRemoved)
        playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy()
    end)
    
    RunService.Heartbeat:Connect(function()
        for i, v in pairs(Players) do
            repeat wait() until v.Character
            if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                local highlightClone = highlight:Clone()
                highlightClone.Adornee = v.Character
                highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
                highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlightClone.Name = "Highlight"
                task.wait()
            end
    end
    end)
    end)

about:Toggle("夜视脚本", "", false, function(state)
        if state then
        game.Lighting.Ambient = Color3.new(1, 1, 1)
        else
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end)

about:Toggle("无限跳", "IJ", false, function(enabled)
    getgenv().InfJ = enabled
    game:GetService("UserInputService").JumpRequest:Connect(function()
        if InfJ == true then
            local character = game:GetService("Players").LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState("Jumping")
                end
            end
        end
    end)
end)

about:Button(
    "自瞄",
    function()
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local TextButton_2 = Instance.new("TextButton")
local TextLabel_2 = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
Frame.BorderColor3 = Color3.fromRGB(16, 16, 16)
Frame.Position = UDim2.new(0.326547235, 0, 0.442340851, 0)
Frame.Size = UDim2.new(0.346905529, 0, 0.194492236, 0)

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Frame_2.BorderColor3 = Color3.fromRGB(16, 16, 16)
Frame_2.Size = UDim2.new(1, 0, 0.26777932, 0)

TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(1.00234735, 0, 1.08253634, 0)
TextLabel.Font = Enum.Font.SourceSansSemibold
TextLabel.Text = "司光自瞄"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 16.000

TextButton.Parent = Frame_2
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.Position = UDim2.new(0.92957741, 0, 0, 0)
TextButton.Size = UDim2.new(0.0697798356, 0, 0.991438508, 0)
TextButton.Font = Enum.Font.SourceSansSemibold
TextButton.Text = "_"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 14.000

TextButton_2.Parent = Frame
TextButton_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextButton_2.BorderColor3 = Color3.fromRGB(20, 20, 20)
TextButton_2.Position = UDim2.new(0.0492957756, 0, 0.495575249, 0)
TextButton_2.Size = UDim2.new(0.0469483584, 0, 0.176991165, 0)
TextButton_2.Font = Enum.Font.SourceSansSemibold
TextButton_2.Text = ""
TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.TextScaled = true
TextButton_2.TextSize = 20.000
TextButton_2.TextWrapped = true

TextLabel_2.Parent = TextButton_2
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(1.54999995, 0, 0, 0)
TextLabel_2.Size = UDim2.new(17.7999992, 0, 1, 0)
TextLabel_2.Font = Enum.Font.SourceSansSemibold
TextLabel_2.Text = "开"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 16.000
TextLabel_2.TextWrapped = true
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

-- Scripts:

local function RPTXOJ_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	local state = true
	script.Parent.MouseButton1Down:Connect(function()
		print"t"
		state = not state
		local LB_Size = script.Parent.Parent.AbsoluteSize
		local NW_Size = UDim2.new(0, LB_Size.X, 0, LB_Size.Y)
		if not state then
			script.Parent.Text = "+"
			game:GetService("TweenService"):Create(script.Parent.Parent.Parent, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
				BackgroundTransparency = 1
			}):Play()
			for i, v in pairs(script.Parent.Parent.Parent:GetChildren()) do
				if v:IsA("TextButton") then 
					v.Visible = false
					v.TextLabel.Visible = false
				end
			end
		else
			script.Parent.Text = "_"
			game:GetService("TweenService"):Create(script.Parent.Parent.Parent, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
				BackgroundTransparency = 0
			}):Play()
			for i, v in pairs(script.Parent.Parent.Parent:GetChildren()) do
				if v:IsA("TextButton") then 
					v.Visible = true
					v.TextLabel.Visible = true
				end
			end
		end
	end)
end
coroutine.wrap(RPTXOJ_fake_script)()
local function CIXXD_fake_script() -- TextButton_2.LocalScript 
	local script = Instance.new('LocalScript', TextButton_2)

	local state = false
	script.Parent.MouseButton1Down:Connect(function()
		state = not state
		if state then 
			script.Parent.Text = "关闭"
		else
			script.Parent.Text = ""
		end
	end)
	
	local Cam = workspace.CurrentCamera
	
	local hotkey = true
	function lookAt(target, eye)
		Cam.CFrame = CFrame.new(target, eye)
	end
	
	function getClosestPlayerToCursor(trg_part)
		local nearest = nil
		local last = math.huge
		for i,v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character and v.Character and v.Character:FindFirstChild(trg_part) then
				if game.Players.LocalPlayer.Character:FindFirstChild(trg_part) then
					local ePos, vissss = workspace.CurrentCamera:WorldToViewportPoint(v.Character[trg_part].Position)
					local AccPos = Vector2.new(ePos.x, ePos.y)
					local mousePos = Vector2.new(workspace.CurrentCamera.ViewportSize.x / 2, workspace.CurrentCamera.ViewportSize.y / 2)
					local distance = (AccPos - mousePos).magnitude
					if distance < last and vissss and hotkey and distance < 400 then
						last = distance
						nearest = v
					end
				end
			end
		end
		return nearest
	end
	
	game:GetService("RunService").RenderStepped:Connect(function()
		local closest = getClosestPlayerToCursor("Head")
		if state and closest and closest.Character:FindFirstChild("Head") then
			lookAt(Cam.CFrame.p, closest.Character:FindFirstChild("Head").Position)
		end
	end)
end
coroutine.wrap(CIXXD_fake_script)()
local function QNWNII_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	script.Parent.Active = true
	script.Parent.Selectable = true
	script.Parent.Draggable = true
end
coroutine.wrap(QNWNII_fake_script)()

    end
)

about:Button(
    "飞车（可能别人看不见）",
    function()
        local Speed = 100

	-- Gui to Lua
	-- Version: 3.2
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	-- Instances:

	local ScreenGui = Instance.new("ScreenGui")
	local W = Instance.new("TextButton")
	local S = Instance.new("TextButton")
	local A = Instance.new("TextButton")
	local D = Instance.new("TextButton")
	local Fly = Instance.new("TextButton")
	local unfly = Instance.new("TextButton")
	local StopFly = Instance.new("TextButton")

	--Properties:

	ScreenGui.Parent = game.CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	unfly.Name = "上"
	unfly.Parent = ScreenGui
	unfly.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	unfly.Position = UDim2.new(0.694387913, 0, 0.181818187, 0)
	unfly.Size = UDim2.new(0, 72, 0, 50)
	unfly.Font = Enum.Font.SourceSans
	unfly.Text = "停止飞行"
	unfly.TextColor3 = Color3.fromRGB(127, 34, 548)
	unfly.TextScaled = true
	unfly.TextSize = 14.000
	unfly.TextWrapped = 
		unfly.MouseButton1Down:Connect(function()
		HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
		HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
	end)

	StopFly.Name = "关闭飞行"
	StopFly.Parent = ScreenGui
	StopFly.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	StopFly.Position = UDim2.new(0.695689976, 0, 0.0213903747, 0)
	StopFly.Size = UDim2.new(0, 71, 0, 50)
	StopFly.Font = Enum.Font.SourceSans
	StopFly.Text = "关闭飞行"
	StopFly.TextColor3 = Color3.fromRGB(170, 0, 255)
	StopFly.TextScaled = true
	StopFly.TextSize = 14.000
	StopFly.TextWrapped = true
	StopFly.MouseButton1Down:Connect(function()
		HumanoidRP.Anchored = true
	end)

	Fly.Name = "开启飞车"
	Fly.Parent = ScreenGui
	Fly.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Fly.Position = UDim2.new(0.588797748, 0, 0.0213903747, 0)
	Fly.Size = UDim2.new(0, 66, 0, 50)
	Fly.Font = Enum.Font.SourceSans
	Fly.Text = "飞行"
	Fly.TextColor3 = Color3.fromRGB(170, 0, 127)
	Fly.TextScaled = true
	Fly.TextSize = 14.000
	Fly.TextWrapped = true
	Fly.MouseButton1Down:Connect(function()
		local BV = Instance.new("BodyVelocity",HumanoidRP)
		local BG = Instance.new("BodyGyro",HumanoidRP)
		BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
		BG.D = 5000
		BG.P = 50000
		BG.CFrame = game.Workspace.CurrentCamera.CFrame
		BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
	end)

	W.Name = "W"
	W.Parent = ScreenGui
	W.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	W.Position = UDim2.new(0.161668837, 0, 0.601604283, 0)
	W.Size = UDim2.new(0, 58, 0, 50)
	W.Font = Enum.Font.SourceSans
	W.Text = "↑"
	W.TextColor3 = Color3.fromRGB(226, 226, 526)
	W.TextScaled = true
	W.TextSize = 5.000
	W.TextWrapped = true
	W.MouseButton1Down:Connect(function()
		HumanoidRP.Anchored = false
		HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
		HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
		wait(.1)
		local BV = Instance.new("BodyVelocity",HumanoidRP)
		local BG = Instance.new("BodyGyro",HumanoidRP)
		BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
		BG.D = 50000
		BG.P = 50000
		BG.CFrame = game.Workspace.CurrentCamera.CFrame
		BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
		BV.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed
	end)


	S.Name = "S"
	S.Parent = ScreenGui
	S.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	S.Position = UDim2.new(0.161668837, 0, 0.735294104, 0)
	S.Size = UDim2.new(0, 58, 0, 50)
	S.Font = Enum.Font.SourceSans
	S.Text = "↓"
	S.TextColor3 = Color3.fromRGB(255, 255, 255)
	S.TextScaled = true
	S.TextSize = 14.000
	S.TextWrapped = true
	S.MouseButton1Down:Connect(function()
		HumanoidRP.Anchored = false
		HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
		HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
		wait(.1)
		local BV = Instance.new("BodyVelocity",HumanoidRP)
		local BG = Instance.new("BodyGyro",HumanoidRP)
		BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
		BG.D = 5000
		BG.P = 50000
		BG.CFrame = game.Workspace.CurrentCamera.CFrame
		BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
		BV.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed
	end)
    end
)

about:Button(
        "汉化旋转甩飞脚本",
        function()
            game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "旋转甩飞"; Text ="汉化无"; Duration = 4; })
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "旋转甩飞"; Text ="原作者: topit "; Duration = 4; })

local PlayerService = game:GetService("Players")--:GetPlayers()
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local plr = PlayerService.LocalPlayer
local mouse = plr:GetMouse()
local BodyThrust = nil
local Dragging = {}

local Suggestions = {
    2298830673, 300, 365, --gamier (test game)
    1537690962, 250, 350, --bee swarm sim
    5580097107, 300, 400, --frappe
    2202352383, 275, 350, --super power training sim
    142823291, 350, 425,  --murder mystery 2
    155615604, 273, 462,  --prison life
    1990228024, 200, 235, --bloxton hotels
    189707, 250, 325,     --natural disaster survival
    230362888, 265, 415,  --the normal elevator       (may not work)
    5293755937, 335, 435, --speedrun sim
    537413528, 300, 350,  --build a boat              (may not work)
    18540115, 300, 425,   --survive the disasters
    2041312716, 350, 465  --Ragdoll engine
}


local version = ""
local font = Enum.Font.FredokaOne

local AxisPositionX = {
	0.05, 
	0.35,
	0.65
}

local AxisPositionY = {
	40, --edit fling speed
	90, --toggle fling types (normal, qfling, serverkek)
	140, --extra (respawn)
	190, --edit gui settings (hotkey, theme)
	240
}

local Fling = {
	false, --toggle
	"", --hotkey
	300, --speed
	false, --server
	false --stop vertfling
}


--[[themes:]]--

local Theme_JeffStandard = {
	Color3.fromRGB(15, 25, 35),   
	Color3.fromRGB(10, 20, 30),   
	Color3.fromRGB(27, 42, 53),   
	Color3.fromRGB(25, 35, 45),   
	Color3.fromRGB(20, 30, 40),   
	Color3.fromRGB(25, 65, 45),   
	Color3.fromRGB(255, 255, 255),
	Color3.fromRGB(245, 245, 255),
	Color3.fromRGB(155, 155, 255) 
}
local Theme_Dark = {
	Color3.fromRGB(25, 25, 25),   --Top bar
	Color3.fromRGB(10, 10, 10),   --Background
	Color3.fromRGB(40, 40, 40),   --Border color
	Color3.fromRGB(35, 35, 35),   --Button background
	Color3.fromRGB(20, 20, 20),   --Unused
	Color3.fromRGB(25, 100, 45),  --Button highlight
	Color3.fromRGB(255, 255, 255),--Text title
	Color3.fromRGB(245, 245, 255),--Text generic
	Color3.fromRGB(155, 155, 255) --Text highlight
}
local Theme_Steel = {
	Color3.fromRGB(25, 25, 35),   --Top bar
	Color3.fromRGB(10, 10, 20),   --Background
	Color3.fromRGB(40, 40, 50),   --Border color
	Color3.fromRGB(35, 35, 45),   --Button background
	Color3.fromRGB(20, 20, 25),   --Unused
	Color3.fromRGB(25, 100, 55),  --Button highlight
	Color3.fromRGB(255, 255, 255),--Text title
	Color3.fromRGB(245, 245, 255),--Text generic
	Color3.fromRGB(155, 155, 255) --Text highlight
}
local Theme_Rust = {
	Color3.fromRGB(45, 25, 25),   
	Color3.fromRGB(30, 10, 10),   
	Color3.fromRGB(60, 40, 40),   
	Color3.fromRGB(55, 35, 35),   
	Color3.fromRGB(40, 20, 20),   
	Color3.fromRGB(45, 100, 45),  
	Color3.fromRGB(255, 255, 255),
	Color3.fromRGB(255, 245, 255),
	Color3.fromRGB(175, 155, 255) 
}
local Theme_Violet = {
	Color3.fromRGB(35, 25, 45),   --Top bar
	Color3.fromRGB(20, 10, 30),   --Background
	Color3.fromRGB(50, 40, 60),   --Border color
	Color3.fromRGB(45, 35, 55),   --Button background
	Color3.fromRGB(30, 20, 40),   --Unused
	Color3.fromRGB(35, 100, 65),  --Button highlight
	Color3.fromRGB(255, 255, 255),--Text title
	Color3.fromRGB(245, 245, 255),--Text generic
	Color3.fromRGB(155, 155, 255) --Text highlight
}
local Theme_Space = {
	Color3.fromRGB(10, 10, 10),   --Top bar
	Color3.fromRGB(0, 0, 0),   --Background
	Color3.fromRGB(20, 20, 20),   --Border color
	Color3.fromRGB(15, 15, 15),   --Button background
	Color3.fromRGB(5, 5, 5),   --Unused
	Color3.fromRGB(20, 25, 50),  --Button highlight
	Color3.fromRGB(255, 255, 255),--Text title
	Color3.fromRGB(245, 245, 255),--Text generic
	Color3.fromRGB(155, 155, 255) --Text highlight
}
local Theme_SynX = {
	Color3.fromRGB(75, 75, 75),   --Top bar
	Color3.fromRGB(45, 45, 45),   --Background
	Color3.fromRGB(45, 45, 45),   --Border color
	Color3.fromRGB(75, 75, 75),   --Button background
	Color3.fromRGB(0, 0, 5),   --Unused
	Color3.fromRGB(150, 75, 20),  --Button highlight
	Color3.fromRGB(255, 255, 255),--Text title
	Color3.fromRGB(245, 245, 255),--Text generic
	Color3.fromRGB(155, 155, 255) --Text highlight
}


local SelectedTheme = math.random(1,6)
if SelectedTheme == 1 then
    SelectedTheme = Theme_Steel
elseif SelectedTheme == 2 then
    SelectedTheme = Theme_Dark
elseif SelectedTheme == 3 then
    SelectedTheme = Theme_Rust
elseif SelectedTheme == 4 then
    SelectedTheme = Theme_Violet
elseif SelectedTheme == 5 then
    SelectedTheme = Theme_Space
elseif SelectedTheme == 6 then
    if syn then
        SelectedTheme = Theme_SynX
    else
        SelectedTheme = Theme_JeffStandard
    end
end

--[[instances:]]--
local ScreenGui = Instance.new("ScreenGui")
local TitleBar = Instance.new("Frame")
local Shadow = Instance.new("Frame")
local Menu = Instance.new("ScrollingFrame")

local TitleText = Instance.new("TextLabel")
local TitleTextShadow = Instance.new("TextLabel")
local CreditText = Instance.new("TextLabel")
local SuggestionText = Instance.new("TextLabel")

local SpeedBox = Instance.new("TextBox")
local Hotkey = Instance.new("TextBox")

local SpeedUp = Instance.new("TextButton")
local SpeedDown = Instance.new("TextButton")
local ToggleFling = Instance.new("TextButton")
local ToggleServerKill = Instance.new("TextButton")
local NoVertGain = Instance.new("TextButton")
local Respawn = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

--local BodyThrust = Instance.new("BodyThrust")

ScreenGui.Name = "JeffFling"
ScreenGui.Parent = game.CoreGui
ScreenGui.Enabled = true

TitleBar.Name = "Title Bar"
TitleBar.Parent = ScreenGui
TitleBar.BackgroundColor3 = SelectedTheme[1]
TitleBar.BorderColor3 = SelectedTheme[3]
TitleBar.Position = UDim2.new(-0.3, 0, 0.7, 0)
TitleBar.Size = UDim2.new(0, 400, 0, 250)
TitleBar.Draggable = true
TitleBar.Active = true
TitleBar.Selectable = true
TitleBar.ZIndex = 100

Shadow.Name = "Shadow"
Shadow.Parent = TitleBar
Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BackgroundTransparency = 0.5
Shadow.BorderSizePixel = 0
Shadow.Position = UDim2.new(0, 5, 0, 5)
Shadow.Size = TitleBar.Size
Shadow.ZIndex = 50

Menu.Name = "Menu"
Menu.Parent = TitleBar
Menu.BackgroundColor3 = SelectedTheme[2]
Menu.BorderColor3 = SelectedTheme[3]
Menu.AnchorPoint = Vector2.new(0,0)
Menu.Position = UDim2.new(0, 0, 0, 50)
Menu.Size = UDim2.new(0, 400, 0, 200)
Menu.CanvasSize = UDim2.new(0, TitleBar.Size.X, 0, 325)
Menu.ScrollBarImageTransparency = 0.5
Menu.ZIndex = 200

TitleText.Name = "Title Text"
TitleText.Parent = TitleBar
TitleText.AnchorPoint = Vector2.new(0, 0)
TitleText.Position = UDim2.new(0, 100, 0, 25)
TitleText.Font = font
TitleText.Text = "旋转甩飞脚本【汉化作者：无】"..version
TitleText.TextColor3 = SelectedTheme[8]
TitleText.TextSize = 28
TitleText.ZIndex = 300
TitleText.BackgroundTransparency = 1

TitleTextShadow.Name = "Shadow"
TitleTextShadow.Parent = TitleText
TitleTextShadow.Font = font
TitleTextShadow.Text = "甩飞"..version
TitleTextShadow.TextSize = 28
TitleTextShadow.TextColor3 = Color3.fromRGB(0, 0, 0)
TitleTextShadow.TextTransparency = 0.5
TitleTextShadow.Position = UDim2.new(0, 5, 0, 5)
TitleTextShadow.ZIndex = 250
TitleTextShadow.BackgroundTransparency = 1

SuggestionText.Name = "Suggestion Text"
SuggestionText.Parent = Menu
SuggestionText.Position = UDim2.new(0, 20, 0, 250)
SuggestionText.Font = font
SuggestionText.Text = "e"
SuggestionText.TextColor3 = SelectedTheme[7]
SuggestionText.TextSize = 24
SuggestionText.TextXAlignment = Enum.TextXAlignment.Left
SuggestionText.ZIndex = 300
SuggestionText.BackgroundTransparency = 1

CreditText.Name = "Credit Text"
CreditText.Parent = Menu
CreditText.Position = UDim2.new(0, 20, 0, 300)
CreditText.Font = font
CreditText.Text = "原作者: topit 汉化:无 "
CreditText.TextColor3 = SelectedTheme[7]
CreditText.TextSize = 20
CreditText.TextXAlignment = Enum.TextXAlignment.Left
CreditText.ZIndex = 300
CreditText.BackgroundTransparency = 1

SpeedBox.Name = "速度"
SpeedBox.Parent = Menu
SpeedBox.BackgroundColor3 = SelectedTheme[4]
SpeedBox.BorderColor3 = SelectedTheme[3]
SpeedBox.TextColor3 = SelectedTheme[7]
SpeedBox.Position = UDim2.new(AxisPositionX[1], 0, 0, AxisPositionY[1])
SpeedBox.Size = UDim2.new(0, 100, 0, 25)
SpeedBox.Font = Enum.Font.FredokaOne
SpeedBox.Text = "现在的速度: "..Fling[3]
SpeedBox.PlaceholderText = "甩飞速度"
SpeedBox.TextScaled = true
SpeedBox.ZIndex = 300

Hotkey.Name = "Custom Hotkey"
Hotkey.Parent = Menu
Hotkey.BackgroundColor3 = SelectedTheme[4]
Hotkey.BorderColor3 = SelectedTheme[3]
Hotkey.TextColor3 = SelectedTheme[7]
Hotkey.Position = UDim2.new(AxisPositionX[2], 0, 0, AxisPositionY[3])
Hotkey.Size = UDim2.new(0, 100, 0, 25)
Hotkey.Font = Enum.Font.FredokaOne
Hotkey.Text = "推荐5"
Hotkey.PlaceholderText = "数值:"
Hotkey.TextScaled = true
Hotkey.ZIndex = 300

SpeedUp.Name = "Speed Up"
SpeedUp.Parent = Menu
SpeedUp.BackgroundColor3 = SelectedTheme[4]
SpeedUp.BorderColor3 = SelectedTheme[3]
SpeedUp.TextColor3 = SelectedTheme[7]
SpeedUp.Position = UDim2.new((AxisPositionX[2]), 0, 0, (AxisPositionY[1]))
SpeedUp.Size = UDim2.new(0, 100, 0, 25)
SpeedUp.Font = Enum.Font.FredokaOne
SpeedUp.Text = "增加"
SpeedUp.TextScaled = true
SpeedUp.ZIndex = 300

SpeedDown.Name = "Speed Down"
SpeedDown.Parent = Menu
SpeedDown.BackgroundColor3 = SelectedTheme[4]
SpeedDown.BorderColor3 = SelectedTheme[3]
SpeedDown.TextColor3 = SelectedTheme[7]
SpeedDown.Position = UDim2.new((AxisPositionX[3]), 0, 0, (AxisPositionY[1]))
SpeedDown.Size = UDim2.new(0, 100, 0, 25)
SpeedDown.Font = Enum.Font.FredokaOne
SpeedDown.Text = "减少"
SpeedDown.TextScaled = true
SpeedDown.ZIndex = 300

ToggleFling.Name = "Fling toggle"
ToggleFling.Parent = Menu
ToggleFling.BackgroundColor3 = SelectedTheme[4]
ToggleFling.BorderColor3 = SelectedTheme[3]
ToggleFling.TextColor3 = SelectedTheme[7]
ToggleFling.Position = UDim2.new((AxisPositionX[1]), 0, 0, (AxisPositionY[2]))
ToggleFling.Size = UDim2.new(0, 100, 0, 25)
ToggleFling.Font = Enum.Font.FredokaOne
ToggleFling.Text = "点击旋转"
ToggleFling.TextScaled = true
ToggleFling.ZIndex = 300

Respawn.Name = "Respawn"
Respawn.Parent = Menu
Respawn.BackgroundColor3 = SelectedTheme[4]
Respawn.BorderColor3 = SelectedTheme[3]
Respawn.TextColor3 = SelectedTheme[7]
Respawn.Position = UDim2.new((AxisPositionX[1]), 0, 0, (AxisPositionY[3]))
Respawn.Size = UDim2.new(0, 100, 0, 25)
Respawn.Font = Enum.Font.FredokaOne
Respawn.Text = "关闭旋转"
Respawn.TextScaled = true
Respawn.ZIndex = 300

NoVertGain.Name = "NoVertGain"
NoVertGain.Parent = Menu
NoVertGain.BackgroundColor3 = SelectedTheme[4]
NoVertGain.BorderColor3 = SelectedTheme[3]
NoVertGain.TextColor3 = SelectedTheme[7]
NoVertGain.Position = UDim2.new((AxisPositionX[2]), 0, 0, (AxisPositionY[2]))
NoVertGain.Size = UDim2.new(0, 100, 0, 25)
NoVertGain.Font = Enum.Font.FredokaOne
NoVertGain.Text = "推荐"
NoVertGain.TextScaled = true
NoVertGain.ZIndex = 300

ToggleServerKill.Name = ""
ToggleServerKill.Parent = Menu
ToggleServerKill.BackgroundColor3 = SelectedTheme[4]
ToggleServerKill.BorderColor3 = SelectedTheme[3]
ToggleServerKill.TextColor3 = SelectedTheme[7]
ToggleServerKill.Position = UDim2.new((AxisPositionX[3]), 0, 0, (AxisPositionY[2]))
ToggleServerKill.Size = UDim2.new(0, 100, 0, 25)
ToggleServerKill.Font = Enum.Font.FredokaOne
ToggleServerKill.Text = "甩飞"
ToggleServerKill.TextScaled = true
ToggleServerKill.ZIndex = 300

CloseButton.Name = "Close Button"
CloseButton.AnchorPoint = Vector2.new(1, 0)
CloseButton.Parent = TitleBar
CloseButton.BackgroundColor3 = SelectedTheme[4]
CloseButton.BorderColor3 = SelectedTheme[3]
CloseButton.TextColor3 = SelectedTheme[7]
CloseButton.Position = UDim2.new(1, 0, 0, 0)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Font = Enum.Font.FredokaOne
CloseButton.Text = "关闭"
CloseButton.ZIndex = 300
CloseButton.TextSize = 14

--BodyThrust.Name = "Power"
--BodyThrust.Parent = plr.Character.Torso
--BodyThrust.Force = Vector3.new(0, 0, 0)
--BodyThrust.Location = Vector3.new(0, 0, 0)

--[[functions:]]--
local function DisplayText(title, text, duration)
	duration = duration or 1
	game.StarterGui:SetCore("SendNotification", 
		{
			Title = title;
			Text = text;
			Icon = "";
			Duration = duration;
		}
	)
end

local function DisplaySuggestion()
    for i,v in pairs(Suggestions) do
        if v >= 9999 and v == game.PlaceId then
            DisplayText("推荐速度调250-325","推荐速度调: "..Suggestions[i+1].." - "..Suggestions[i+2])
            SuggestionText.Text = "推荐速度调: "..Suggestions[i+1].." - "..Suggestions[i+2]
        end
    end
    if SuggestionText.Text == "e" then
        SuggestionText.Text = "No suggestion for this game"
    end
end


local function GetRigType()
    
    if plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
        return Enum.HumanoidRigType.R15
    elseif plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
        return Enum.HumanoidRigType.R6
    else
        return nil
    end
end

local function GetDeadState(player)
    if player.Character.Humanoid:GetState() == Enum.HumanoidStateType.Dead then
        return true
    else
        return false
    end
end


local function EnableNoClip()
    
    if GetDeadState(plr) == false then
        if GetRigType() == Enum.HumanoidRigType.R6 then
            plr.Character:FindFirstChild("Torso").CanCollide            = false
            plr.Character:FindFirstChild("Head").CanCollide             = false
            plr.Character:FindFirstChild("HumanoidRootPart").CanCollide = false
        elseif GetRigType() == Enum.HumanoidRigType.R15 then
            plr.Character:FindFirstChild("UpperTorso").CanCollide       = false
            plr.Character:FindFirstChild("LowerTorso").CanCollide       = false
            plr.Character:FindFirstChild("Head").CanCollide             = false
            plr.Character:FindFirstChild("HumanoidRootPart").CanCollide = false
        end
    end
end

local function DisableNoClip()
    
    if GetDeadState(plr) == false then
        if GetRigType() == Enum.HumanoidRigType.R6 then
            plr.Character:FindFirstChild("Torso").CanCollide            = true
            plr.Character:FindFirstChild("Head").CanCollide             = true
            plr.Character:FindFirstChild("HumanoidRootPart").CanCollide = true
        elseif GetRigType() == Enum.HumanoidRigType.R15 then
            plr.Character:FindFirstChild("UpperTorso").CanCollide       = true
            plr.Character:FindFirstChild("LowerTorso").CanCollide       = true
            plr.Character:FindFirstChild("Head").CanCollide             = true
            plr.Character:FindFirstChild("HumanoidRootPart").CanCollide = true
        end
    end
end

local function OpenObject(object)
    local OpenAnim = TweenService:Create(
    	object,
    	TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), --Enum.EasingStyle.Linear, Enum.EasingDirection.In
    	{Size = UDim2.new(0, 110, 0, 35), BackgroundColor3 = SelectedTheme[6] }
    )
    
    OpenAnim:Play()
end

local function CloseObject(object)
    local CloseAnim = TweenService:Create(
    	object,
    	TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    	{Size = UDim2.new(0, 100, 0, 25), BackgroundColor3 = SelectedTheme[4] }
    )
    
    CloseAnim:Play()
end

    
local function TToggleFling()
    Fling[1] = not Fling[1]
    if Fling[1] then
        OpenObject(ToggleFling)
        
        BodyThrust = Instance.new("BodyThrust")
        if GetRigType() == Enum.HumanoidRigType.R6 then
            BodyThrust.Parent = plr.Character.Torso
        elseif GetRigType() == Enum.HumanoidRigType.R15 then
            BodyThrust.Parent = plr.Character.UpperTorso
        end
        
        EnableNoClip()
        BodyThrust.Force = Vector3.new(Fling[3], 0, 0)
        BodyThrust.Location = Vector3.new(0, 0, Fling[3])
        
        
        print("Enabled fling")
    else
        CloseObject(ToggleFling)
        
        DisableNoClip()
        for i, v in pairs(plr.Character:GetDescendants()) do
            if v:IsA("BasePart") then
            v.Velocity, v.RotVelocity = Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)
            end
        end
        BodyThrust:Destroy()
        
        print("Disabled fling")
        
    end
end

local function GetIfPlayerInGame(PlayerToFind)
    if PlayerService:FindFirstChild(PlayerToFind) then
        return true
    else
        return false
    end
end

local function ServerKek()
    local TargetList = {}
    local index = 1
    local playercount = 0
    
    if Fling[1] == true then
        TToggleFling()
    end
    
    for i,v in pairs(PlayerService:GetPlayers()) do
        if v ~= plr then
            playercount = playercount + 1
            table.insert(TargetList, v)
        end
    end
    
    for i,v in pairs(TargetList) do
       print(i,v.Name) 
    end
    
    
    while Fling[4] do
        if index > playercount then
            CloseObject(ToggleServerKill)
            DisplayText("全部甩飞成功","汉化无")
            Fling[4] = false
            break
        else
            local InGame = GetIfPlayerInGame(TargetList[index].Name)
            local Dead = GetDeadState(TargetList[index])
            if InGame == true and Dead == false then
                plr.Character.HumanoidRootPart.CFrame = TargetList[index].Character.HumanoidRootPart.CFrame --tp to them
                
                TToggleFling() --enable fling
                
                for i = 0,2,1 do
                    plr.Character.HumanoidRootPart.CFrame = TargetList[index].Character.HumanoidRootPart.CFrame
                    wait(0.15)
                end
                
                TToggleFling() --disable fling
                
                wait(0.1) --wait until disabled
                
                if plr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Seated then --check if seated
                    plr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running) --get out if you are
                end
                
                index = index + 1 --go to next victim
                
                if Fling[4] == false then
                    break
                end
            else
                index = index + 1
            end
        end
    end
end

--[[events:]]--
CloseButton.MouseButton1Down:Connect(function()
    TitleBar:TweenPosition(UDim2.new(-0.3, 0, 0.7, 0), Enum.EasingDirection.In, Enum.EasingStyle.Back, 0.75)
	DisplayText("旋转甩飞关闭","汉化作者无")
	wait(0.8)
	ScreenGui.Enabled = false
	ScreenGui:Destroy()
	script:Destroy()
end)

SpeedUp.MouseButton1Down:Connect(function()
    Fling[3] = Fling[3] + 50
    SpeedBox.Text = "速度: "..Fling[3]
    
    if Fling[1] then
        BodyThrust.Force = Vector3.new(Fling[3], 0, 0)
        BodyThrust.Location = Vector3.new(0, 0, Fling[3])
    end
end)

SpeedDown.MouseButton1Down:Connect(function()
    Fling[3] = Fling[3] - 50
    SpeedBox.Text = "速度: "..Fling[3]
    
    if Fling[1] then
        BodyThrust.Force = Vector3.new(Fling[3], 0, 0)
        BodyThrust.Location = Vector3.new(0, 0, Fling[3])
    end
end)

SpeedBox.FocusLost:Connect(function()
    Fling[3] = SpeedBox.Text:gsub("%D",""):sub(0,5)
    if Fling[3] ~= nil then
        SpeedBox.Text = "速度: "..Fling[3]
        if Fling[1] then
            BodyThrust.Force = Vector3.new(Fling[3], 0, 0)
            BodyThrust.Location = Vector3.new(0, 0, Fling[3])
        end
    end
    
end)

Hotkey.FocusLost:Connect(function()
    Fling[2] = Hotkey.Text:split(" ")[1]:sub(1,1)
    if Fling[2] ~= nil then
        Hotkey.Text = "数值: "..Fling[2]
    end
end)


ToggleFling.MouseButton1Down:Connect(function()
    TToggleFling()
end)

Respawn.MouseButton1Down:Connect(function()
        
    if Fling[1] then --disable fling if its enabled
        TToggleFling()
    end
    
    wait(0.4) --wait for fling to stop
    
    for i=0,10,1 do
        plr.Character.Humanoid:ChangeState(2) --make player recover from falling
    end
    
    for i, v in pairs(plr.Character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Velocity, v.RotVelocity = Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)
        end
    end
end)

ToggleServerKill.MouseButton1Down:Connect(function()
    Fling[4] = not Fling[4]
    if Fling[4] then
        OpenObject(ToggleServerKill)
        DisplayText("开启全部甩飞","开启成功")
        ServerKek()
    else
        CloseObject(ToggleServerKill)
        DisplayText("关闭全部甩飞","全部甩飞已关闭")
    end
    
end)

NoVertGain.MouseButton1Down:Connect(function()
    Fling[5] = not Fling[5]
    if Fling[5] then
        OpenObject(NoVertGain)
    else
        CloseObject(NoVertGain)
    end
end)

RunService.Stepped:Connect(function()
    if Fling[1] then
        EnableNoClip()
    elseif Fling[5] then
        for i, v in pairs(plr.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Velocity, v.RotVelocity = Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)
            end
        end
    end
end)

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging[1] = true
        Dragging[2] = input.Position
        Dragging[3] = TitleBar.Position
    end
end)

TitleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging[1] = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        if Dragging[1] then
            local delta = input.Position - Dragging[2]
            TitleBar:TweenPosition(UDim2.new(Dragging[3].X.Scale, Dragging[3].X.Offset + delta.X, Dragging[3].Y.Scale, Dragging[3].Y.Offset + delta.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.035)
            wait()
        end
    end
end)

mouse.KeyDown:Connect(function(key)
    if key == Fling[2] then
        TToggleFling()
    end
end)


DisplaySuggestion()
TitleBar:TweenPosition(UDim2.new(0.25, 0, 0.7, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.75)
return nil
        end
    )

about:Button(
        "进入弹窗",
        function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
        end
    )
    
about:Button(
        "子弹追踪",
        function()
  loadstring(game:HttpGet("https://pastebin.com/raw/1AJ69eRG"))()          
end) 

about:Button(
        "管理员面板",
        function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploiterGuy/Aqua-Hub/refs/heads/main/Turn%20People%20Into%20Things.txt"))()           
end) 

about:Button(
        "表情菜单",
        function()
   loadstring(game:HttpGet("https://yarhm.goteamst.com/scr?channel=afem"))()         
end) 

about:Button(
        "音乐播放器",
        function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Maan04ka/CodingScripts/main/MusicUI.lua"))()
end)

about:Button(
        "蓝屏脚本（娱乐）",
        function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/ROBLOX-XIAOYE666.lua"))()         
end) 
    
about:Button(
        "甩飞",
        function()
            loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
        end
    )
    
    
about:Button(
        "点击传送",
        function()
            mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "点击传送的位置" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack
        end
    )
    
about:Button(
        "键盘脚本",
        function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()   
        end
    )
    
about:Button(
        "踏空行走",
        function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
        end
    )
    
about:Button(
        "动态模糊",
        function()
            local camera = workspace.CurrentCamera
local blurAmount = 10
local blurAmplifier = 5
local lastVector = camera.CFrame.LookVector

local motionBlur = Instance.new("BlurEffect", camera)

local runService = game:GetService("RunService")

workspace.Changed:Connect(function(property)
 if property == "CurrentCamera" then
  print("Changed")
  local camera = workspace.CurrentCamera
  if motionBlur and motionBlur.Parent then
   motionBlur.Parent = camera
  else
   motionBlur = Instance.new("BlurEffect", camera)
  end
 end
end)

runService.Heartbeat:Connect(function()
 if not motionBlur or motionBlur.Parent == nil then
  motionBlur = Instance.new("BlurEffect", camera)
 end
 
 local magnitude = (camera.CFrame.LookVector - lastVector).magnitude
 motionBlur.Size = math.abs(magnitude)*blurAmount*blurAmplifier/2
 lastVector = camera.CFrame.LookVector
end)
        end
    )
    
about:Button(
        "自杀脚本",
        function()
            game.Players.LocalPlayer.Character.Humanoid.Health=0
HumanDied = true
        end
    )    
    
about:Button(
        "指令脚本",
        function()
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
        end
    )
    
about:Button(
        "高亮脚本",
        function()
            loadstring(game:HttpGet("https://pastebin.com/raw/4LDKiJ5a"))()
        end
    )    
    
about:Button(
        "动作脚本",
        function()
            loadstring(game:HttpGet("https://pastebin.com/raw/Zj4NnKs6"))()
        end
    )
    
about:Button(
        "防止挂机",
        function()
            wait(2)
	print("Anti Afk On")
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
	local CoreGui = game:GetService("StarterGui")
CoreGui:SetCore("SendNotification", {
    Title = "司光提示10秒",
    Text = "防挂机已开启",
    Duration = 10,
})
        end
    )    
    
about:Button(
        "甩飞",
        function()
            loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
        end
    )

about:Label("修改时间")
about:Button("凌晨12点", function()
    loadstring(game:HttpGet("https://pastefy.app/xFX51PIw/raw"))()
end)
about:Button("下午4点", function()
    loadstring(game:HttpGet("https://pastefy.app/sIrAGJxJ/raw"))()
end)
about:Button("中午11点", function()
    loadstring(game:HttpGet("https://pastefy.app/rccCMBch/raw"))()
end)
about:Button("早上6点", function()
    loadstring(game:HttpGet("https://pastefy.app/h9VLRgYR/raw"))()
end)

about:Label("轰炸Webhook")
about:Textbox("Webhook链接", "text", "输入", function(webhookUrl)
    local webhook = webhookUrl
end)
about:Button("复制轰炸", function()
    setclipboard("", 9999)
end)

about:Label("设置相机")
about:Dropdown("选择相机方式", "CameraType", {
    "自定义",
    "附加", 
    "固定",
    "跟随",
    "动态观察",
    "可脚本化",
    "跟踪",
    "观看"
}, function(cameraType)
    if cameraType == "自定义" then
        game.Workspace.CurrentCamera.CameraType = "Custom"
    elseif cameraType == "附加" then
        game.Workspace.CurrentCamera.CameraType = "Attach"
    elseif cameraType == "固定" then
        game.Workspace.CurrentCamera.CameraType = "Fixed"
    elseif cameraType == "跟随" then
        game.Workspace.CurrentCamera.CameraType = "Follow"
    elseif cameraType == "动态观察" then
        game.Workspace.CurrentCamera.CameraType = "Orbital"
    elseif cameraType == "可脚本化" then
        game.Workspace.CurrentCamera.CameraType = "Scriptable"
    elseif cameraType == "跟踪" then
        game.Workspace.CurrentCamera.CameraType = "Track"
    elseif cameraType == "观看" then
        game.Workspace.CurrentCamera.CameraType = "Watch"
    end
end)

about:Toggle("切板摄像机的遮挡模式", "DevCameraOcclusionMode", false, function(state)
    if state then
        game:GetService("Players").LocalPlayer.DevCameraOcclusionMode = "Invisicam"
    else
        game:GetService("Players").LocalPlayer.DevCameraOcclusionMode = "Zoom"
    end
end)

about:Dropdown("相机", "Camera", {
    "经典",
    "第一人称"
}, function(cameraMode)
    if cameraMode == "经典" then
        game:GetService("Players").LocalPlayer.CameraMode = "Classic"
    elseif cameraMode == "第一人称" then
        game:GetService("Players").LocalPlayer.CameraMode = "LockFirstPerson"
    end
end)

local UITab84 = win:Tab("旋转与范围",'16060333448')

local about = UITab84:section("『功能』",true)

about:Label("旋转")
about:Textbox("设置旋转速度", "TextBoxFlag", "输入", function(speed)
    bin.speed = tonumber(speed) or 100
end)

about:Toggle("开启/关闭旋转", "Spinbot", false, function(enabled)
    local localPlayer = game:GetService("Players").LocalPlayer
    repeat
        task.wait()
    until localPlayer.Character
    
    local humanoidRootPart = localPlayer.Character:WaitForChild("HumanoidRootPart")
    localPlayer.Character:WaitForChild("Humanoid").AutoRotate = false
    
    if enabled then
        local angularVelocity = Instance.new("AngularVelocity")
        angularVelocity.Attachment0 = humanoidRootPart:WaitForChild("RootAttachment")
        angularVelocity.MaxTorque = math.huge
        angularVelocity.AngularVelocity = Vector3.new(0, bin.speed or 100, 0)
        angularVelocity.Parent = humanoidRootPart
        angularVelocity.Name = "Spinbot"
    else
        local spinbot = humanoidRootPart:FindFirstChild("Spinbot")
        if spinbot then
            spinbot:Destroy()
        end
    end
end)

about:Label("范围")
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
getgenv().HitboxSize = 15
getgenv().HitboxTransparency = 0.9
getgenv().HitboxStatus = false
getgenv().TeamCheck = false

about:Toggle("开启/关闭范围", "HitboxStatus", false, function(enabled)
    getgenv().HitboxStatus = enabled
    
    if enabled then
        game:GetService("RunService").RenderStepped:Connect(function()
            if not HitboxStatus then return end
            
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    if TeamCheck and player.Team == Players.LocalPlayer.Team then
                        -- 队友，不修改
                        pcall(function()
                            local hrp = player.Character.HumanoidRootPart
                            hrp.Size = Vector3.new(2, 2, 1)
                            hrp.Transparency = 1
                        end)
                    else
                        -- 敌人或队伍检测关闭
                        pcall(function()
                            local hrp = player.Character.HumanoidRootPart
                            hrp.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
                            hrp.Transparency = HitboxTransparency
                            if MovementConfig and MovementConfig.HitboxBrickColor then
                                hrp.BrickColor = BrickColor.new(MovementConfig.HitboxBrickColor)
                            end
                            hrp.Material = "Neon"
                            hrp.CanCollide = false
                        end)
                    end
                end
            end
        end)
    end
end)

about:Textbox("范围大小设置", "HitboxSize", "输入", function(size)
    local numSize = tonumber(size)
    if numSize then
        getgenv().HitboxSize = numSize
    end
end)

about:Toggle("队伍检测", "TeamCheck", false, function(enabled)
    getgenv().TeamCheck = enabled
end)

about:Textbox("范围透明度设置（调0更好区分队伍)", "HitboxTransparency", "输入", function(transparency)
    local numTrans = tonumber(transparency)
    if numTrans then
        getgenv().HitboxTransparency = numTrans
    end
end)

about:Dropdown("选择范围颜色", "Hitbox", {
    "深蓝色",
    "黑色",
    "红色", 
    "粉色",
    "棕色",
    "黄色",
    "绿色",
    "橙色",
    "紫色",
    "浅灰色"
}, function(color)
    if not MovementConfig then
        MovementConfig = {}
    end
    MovementConfig.HitboxBrickColor = color
end)

about:Label("范围")
about:Button("范围清空", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/RqrTrPF5"))()
end)
about:Button("范围10", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/DT94B37a"))()
end)
about:Button("范围20", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Kyyt1e4g"))()
end)
about:Button("范围50", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/pMtKEgWd"))()
end)
about:Button("范围100", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/aLBSXPYE"))()
end)
about:Button("范围150", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/RWxsQuU9"))()
end)
about:Button("范围200", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/hbp3RV2p"))()
end)
about:Button("范围300", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/x8cZhegq"))()
end)
about:Button("范围400", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/LixK0gG3"))()
end)
about:Button("范围500", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/yXWMGLYJ"))()
end)

about:Label("旋转")
about:Button("旋转清零", function()
    loadstring(game:HttpGet("https://pastefy.app/UOWFy58g/raw"))()
end)
about:Button("旋转10", function()
    loadstring(game:HttpGet("https://pastefy.app/pX8CKeHn/raw"))()
end)
about:Button("旋转30", function()
    loadstring(game:HttpGet("https://pastefy.app/1Ob0oE2h/raw"))()
end)
about:Button("旋转50", function()
    loadstring(game:HttpGet("https://pastefy.app/4UL7XrJU/raw"))()
end)
about:Button("旋转100", function()
    loadstring(game:HttpGet("https://pastefy.app/6agZDErY/raw"))()
end)
about:Button("旋转150", function()
    loadstring(game:HttpGet("https://pastefy.app/MqAalYjs/raw"))()
end)
about:Button("旋转200", function()
    loadstring(game:HttpGet("https://pastefy.app/00mtNBML/raw"))()
end)
about:Button("旋转250", function()
    loadstring(game:HttpGet("https://pastefy.app/CR2woYXY/raw"))()
end)
about:Button("旋转300", function()
    loadstring(game:HttpGet("https://pastefy.app/5SbEaumY/raw"))()
end)
about:Button("旋转400", function()
    loadstring(game:HttpGet("https://pastefy.app/pjkZd07i/raw"))()
end)
about:Button("旋转500", function()
    loadstring(game:HttpGet("https://pastefy.app/9emFsJ7N/raw"))()
end)

local UITab84 = win:Tab("『传送与甩飞』",'16060333448')

local about = UITab84:section("『功能』",true)

about:Dropdown("选择玩家名称", "PlayerSelect", {}, function(selectedPlayer)
    PlayerConfig.playernamedied = selectedPlayer
end)

about:Button("刷新玩家名称", function()
    local players = {}
    for _, player in pairs(game.Players:GetPlayers()) do
        table.insert(players, player.Name)
    end
    PlayerConfig.dropdown = players
    playerDropdown:SetOptions(players)
end)

about:Button("传送到玩家旁边", function()
    local localPlayer = game.Players.LocalPlayer
    local targetPlayer = game.Players:FindFirstChild(PlayerConfig.playernamedied)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        localPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        Notify("黎明中心", "已经传送到玩家身边", "rbxassetid://18941716391", 5)
    else
        Notify("黎明中心", "无法传送 原因: 玩家已消失", "rbxassetid://18941716391", 5)
    end
end)

about:Toggle("循环锁定传送", "LoopTeleport", false, function(enabled)
    if enabled then
        PlayerConfig.LoopTeleport = true
        Notify("黎明中心", "已开启循环传送", "rbxassetid://18941716391", 5)
        while PlayerConfig.LoopTeleport do
            local localPlayer = game.Players.LocalPlayer
            local targetPlayer = game.Players:FindFirstChild(PlayerConfig.playernamedied)
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                localPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
            end
            task.wait()
        end
    else
        PlayerConfig.LoopTeleport = false
        Notify("黎明中心", "已关闭循环传送", "rbxassetid://18941716391", 5)
    end
end)

about:Button("把玩家传送过来", function()
    local localPlayer = game.Players.LocalPlayer
    local targetPlayer = game.Players:FindFirstChild(PlayerConfig.playernamedied)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        targetPlayer.Character.HumanoidRootPart.CFrame = localPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        Notify("黎明中心", "已将玩家传送过来", "rbxassetid://18941716391", 5)
    else
        Notify("黎明中心", "无法传送 原因: 玩家已消失", "rbxassetid://18941716391", 5)
    end
end)

about:Toggle("吸全部玩家", "GetAllPlayers", false, function(enabled)
    if enabled then
        while enabled do
            local localPlayer = game.Players.LocalPlayer
            local localRootPart = localPlayer.Character.HumanoidRootPart
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local targetPos = localRootPart.Position + localRootPart.CFrame.lookVector * 3
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPos, targetPos + localRootPart.CFrame.lookVector)
                    task.wait()
                end
            end
        end
    end
end)

about:Toggle("查看玩家", "LookAtPlayer", false, function(enabled)
    local targetPlayer = game.Players:FindFirstChild(PlayerConfig.playernamedied)
    if enabled and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        game.Workspace.CurrentCamera.CameraSubject = targetPlayer.Character.Humanoid
        Notify("黎明中心", "已开启查看玩家", "rbxassetid://18941716391", 5)
    else
        game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
        Notify("黎明中心", "已关闭查看玩家", "rbxassetid://18941716391", 5)
    end
end)

about:Button("甩飞一次", function()
    if PlayerConfig.playernamedied then
        local targetPlayer = game.Players:FindFirstChild(PlayerConfig.playernamedied)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local localPlayer = game.Players.LocalPlayer
            local localCharacter = localPlayer.Character
            local localRootPart = localCharacter.HumanoidRootPart
            local targetRootPart = targetPlayer.Character.HumanoidRootPart
            
            local oldPos = localRootPart.CFrame
            
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = Vector3.new(100000, 100000, 100000)
            bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bodyVelocity.Parent = localRootPart
            
            for i = 1, 10 do
                localRootPart.CFrame = targetRootPart.CFrame * CFrame.new(0, 2, 0)
                localRootPart.Velocity = Vector3.new(50000, 50000, 50000)
                task.wait(0.1)
            end
            
            bodyVelocity:Destroy()
            localRootPart.CFrame = oldPos
            Notify("黎明中心", "已甩飞玩家", "rbxassetid://18941716391", 5)
        end
    end
end)

about:Toggle("循环甩飞", "AutoFling", false, function(enabled)
    if PlayerConfig.playernamedied then
        getgenv().autofling = enabled
        if enabled then
            spawn(function()
                while getgenv().autofling do
                    local targetPlayer = game.Players:FindFirstChild(PlayerConfig.playernamedied)
                    if targetPlayer and targetPlayer.Character then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 2, 0)
                    end
                    task.wait()
                end
            end)
        end
    end
end)

local UITab84 = win:Tab("音乐",'16060333448')

local about = UITab84:section("『功能』",true)

 about:Button("防空警报", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://792323017"
    sound.Parent = game.Workspace
    sound:Play()
    end)
    
about:Button("义勇军进行曲", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1845918434"
    sound.Parent = game.Workspace
    sound:Play()
    end)
    
    about:Button("雨中流浪", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1683110839393"
    sound.Parent = game.Workspace
    sound:Play()
    end)
    about:Button("米老鼠", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://8491769438"
    sound.Parent = game.Workspace
    sound:Play()
    end)
    
    about:Button("骨灰给你扬了", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://7691078503"
    sound.Parent = game.Workspace
    sound:Play()
    end)
    
    about:Button("齐天大圣", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://8195914641"
    sound.Parent = game.Workspace
    sound:Play()
    end)
    
    about:Button("卡车鸣笛", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://3900067524"
    sound.Parent = game.Workspace
    sound:Play()
    end)
    
    about:Button("算命先生", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://6086894326"
    sound.Parent = game.Workspace
    sound:Play()
    end)
    
    local UITab99 = win:Tab("『FE』",'7734068321')

local about = UITab99:section("『FE』",true)

about:Button("FE C00lgui", function()
loadstring(game:GetObjects("rbxassetid://8127297852")[1].Source)()
end)
about:Button("FE 1x1x1x1", function()
loadstring(game:HttpGet(('https://pastebin.com/raw/JipYNCht'),true))()
end)
about:Button("FE大长腿", function()
    loadstring(game:HttpGet('https://gist.githubusercontent.com/1BlueCat/7291747e9f093555573e027621f08d6e/raw/23b48f2463942befe19d81aa8a06e3222996242c/FE%2520Da%2520Feets'))()
end)
about:Button("FE用头", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/BK4Q0DfU"))()
end)
about:Button("复仇者", function()
    loadstring(game:HttpGet(('https://pastefy.ga/iGyVaTvs/raw'),true))()
end)
about:Button("鼠标", function()
    loadstring(game:HttpGet(('https://pastefy.ga/V75mqzaz/raw'),true))()
end)
about:Button("变怪物", function()
    loadstring(game:HttpGetAsync("https://pastebin.com/raw/jfryBKds"))()
end)
about:Button("香蕉枪", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/BananaGunByNerd.lua"))()
end)
about:Button("超长🐔巴", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/ESWSFND7", true))()
end)
about:Button("操人", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/AHAJAJAKAK/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A.LUA", true))()
end)
about:Button("FE动画中心", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
end)
about:Button("FE变玩家", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/XR4sGcgJ"))()
end)
about:Button("FE猫娘R63", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua"))()
end)
about:Button("FE", function()
    loadstring(game:HttpGet('https://pastefy.ga/a7RTi4un/raw'))()
end)
    
   local UITab84 = win:Tab("自瞄功能",'16060333448')

local about = UITab84:section("『功能』",true)

  about:Toggle("ESP 显示名字", "AMG", ENABLED, function(enabled)
    if enabled then ENABLED = true for _, player in ipairs(Players:GetPlayers()) do onPlayerAdded(player) end Players.PlayerAdded:Connect(onPlayerAdded) Players.PlayerRemoving:Connect(onPlayerRemoving) local localPlayer = Players.LocalPlayer if localPlayer and localPlayer.Character then for _, player in ipairs(Players:GetPlayers()) do if player.Character then createNameLabel(player) end end end RunService.Heartbeat:Connect(function() if ENABLED then for _, player in ipairs(Players:GetPlayers()) do if player.Character then createNameLabel(player) end end end end) else ENABLED = false for _, player in ipairs(Players:GetPlayers()) do onPlayerRemoving(player) end RunService:UnbindFromRenderStep("move") end
end)

about:Toggle("Circle ESP", "ESP", false, function(state)
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                if state then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = player.Character
                    highlight.Adornee = player.Character

                    local billboard = Instance.new("BillboardGui")
                    billboard.Parent = player.Character
                    billboard.Adornee = player.Character
                    billboard.Size = UDim2.new(0, 100, 0, 100)
                    billboard.StudsOffset = Vector3.new(0, 3, 0)
                    billboard.AlwaysOnTop = true

                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.Parent = billboard
                    nameLabel.Size = UDim2.new(1, 0, 1, 0)
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.Text = player.Name
                    nameLabel.TextColor3 = Color3.new(1, 1, 1)
                    nameLabel.TextStrokeTransparency = 0.5
                    nameLabel.TextScaled = true

                    local circle = Instance.new("ImageLabel")
                    circle.Parent = billboard
                    circle.Size = UDim2.new(0, 50, 0, 50)
                    circle.Position = UDim2.new(0.5, 0, 0.5, 0) -- Center the circle
                    circle.AnchorPoint = Vector2.new(0.5, 0.5) -- Set the anchor point to the center
                    circle.BackgroundTransparency = 1
                    circle.Image = "rbxassetid://2200552246" -- Replace with your circle image asset ID
                else
                    if player.Character:FindFirstChildOfClass("Highlight") then
                        player.Character:FindFirstChildOfClass("Highlight"):Destroy()
                    end
                    if player.Character:FindFirstChildOfClass("BillboardGui") then
                        player.Character:FindFirstChildOfClass("BillboardGui"):Destroy()
                    end
                end
            end
        end
    end)

about:Button("透视1",function()
loadstring(game:HttpGet('https://pastebin.com/raw/MA8jhPWT'))()
end)

about:Button("透视2",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
end)

about:Button("情云同款自瞄可调", function()
  local fov = 100 local smoothness = 10 local crosshairDistance = 5 local RunService = game:GetService("RunService") local UserInputService = game:GetService("UserInputService") local Players = game:GetService("Players") local Cam = game.Workspace.CurrentCamera local FOVring = Drawing.new("Circle") FOVring.Visible = true FOVring.Thickness = 2 FOVring.Color = Color3.fromRGB(0, 255, 0) FOVring.Filled = false FOVring.Radius = fov FOVring.Position = Cam.ViewportSize / 2 local Player = Players.LocalPlayer local PlayerGui = Player:WaitForChild("PlayerGui") local ScreenGui = Instance.new("ScreenGui") ScreenGui.Name = "FovAdjustGui" ScreenGui.Parent = PlayerGui local Frame = Instance.new("Frame") Frame.Name = "MainFrame" Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) Frame.BorderColor3 = Color3.fromRGB(128, 0, 128) Frame.BorderSizePixel = 2 Frame.Position = UDim2.new(0.3, 0, 0.3, 0) Frame.Size = UDim2.new(0.4, 0, 0.4, 0) Frame.Active = true Frame.Draggable = true Frame.Parent = ScreenGui local MinimizeButton = Instance.new("TextButton") MinimizeButton.Name = "MinimizeButton" MinimizeButton.Text = "-" MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255) MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) MinimizeButton.Position = UDim2.new(0.9, 0, 0, 0) MinimizeButton.Size = UDim2.new(0.1, 0, 0.1, 0) MinimizeButton.Parent = Frame local isMinimized = false MinimizeButton.MouseButton1Click:Connect(function() isMinimized = not isMinimized if isMinimized then Frame:TweenSize(UDim2.new(0.1, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) MinimizeButton.Text = "+" else Frame:TweenSize(UDim2.new(0.4, 0, 0.4, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) MinimizeButton.Text = "-" end end) local FovLabel = Instance.new("TextLabel") FovLabel.Name = "FovLabel" FovLabel.Text = "自瞄范围" FovLabel.TextColor3 = Color3.fromRGB(255, 255, 255) FovLabel.BackgroundTransparency = 1 FovLabel.Position = UDim2.new(0.1, 0, 0.1, 0) FovLabel.Size = UDim2.new(0.8, 0, 0.2, 0) FovLabel.Parent = Frame local FovSlider = Instance.new("TextBox") FovSlider.Name = "FovSlider" FovSlider.Text = tostring(fov) FovSlider.TextColor3 = Color3.fromRGB(255, 255, 255) FovSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) FovSlider.Position = UDim2.new(0.1, 0, 0.3, 0) FovSlider.Size = UDim2.new(0.8, 0, 0.2, 0) FovSlider.Parent = Frame local SmoothnessLabel = Instance.new("TextLabel") SmoothnessLabel.Name = "SmoothnessLabel" SmoothnessLabel.Text = "自瞄平滑度" SmoothnessLabel.TextColor3 = Color3.fromRGB(255, 255, 255) SmoothnessLabel.BackgroundTransparency = 1 SmoothnessLabel.Position = UDim2.new(0.1, 0, 0.5, 0) SmoothnessLabel.Size = UDim2.new(0.8, 0, 0.2, 0) SmoothnessLabel.Parent = Frame local SmoothnessSlider = Instance.new("TextBox") SmoothnessSlider.Name = "SmoothnessSlider" SmoothnessSlider.Text = tostring(smoothness) SmoothnessSlider.TextColor3 = Color3.fromRGB(255, 255, 255) SmoothnessSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) SmoothnessSlider.Position = UDim2.new(0.1, 0, 0.7, 0) SmoothnessSlider.Size = UDim2.new(0.8, 0, 0.2, 0) SmoothnessSlider.Parent = Frame local CrosshairDistanceLabel = Instance.new("TextLabel") CrosshairDistanceLabel.Name = "CrosshairDistanceLabel" CrosshairDistanceLabel.Text = "自瞄预判距离" CrosshairDistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255) CrosshairDistanceLabel.BackgroundTransparency = 1 CrosshairDistanceLabel.Position = UDim2.new(0.1, 0, 0.9, 0) CrosshairDistanceLabel.Size = UDim2.new(0.8, 0, 0.2, 0) CrosshairDistanceLabel.Parent = Frame local CrosshairDistanceSlider = Instance.new("TextBox") CrosshairDistanceSlider.Name = "CrosshairDistanceSlider" CrosshairDistanceSlider.Text = tostring(crosshairDistance) CrosshairDistanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255) CrosshairDistanceSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) CrosshairDistanceSlider.Position = UDim2.new(0.1, 0, 1.1, 0) CrosshairDistanceSlider.Size = UDim2.new(0.8, 0, 0.2, 0) CrosshairDistanceSlider.Parent = Frame local targetCFrame = Cam.CFrame local function updateDrawings() local camViewportSize = Cam.ViewportSize FOVring.Position = camViewportSize / 2 FOVring.Radius = fov end local function onKeyDown(input) if input.KeyCode == Enum.KeyCode.Delete then RunService:UnbindFromRenderStep("FOVUpdate") FOVring:Remove() end end UserInputService.InputBegan:Connect(onKeyDown) local function getClosestPlayerInFOV(trg_part) local nearest = nil local last = math.huge local playerMousePos = Cam.ViewportSize / 2 for _, player in ipairs(Players:GetPlayers()) do if player ~= Players.LocalPlayer then local part = player.Character and player.Character:FindFirstChild(trg_part) if part then local ePos, isVisible = Cam:WorldToViewportPoint(part.Position) local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude if distance < last and isVisible and distance < fov then last = distance nearest = player end end end end return nearest end RunService.RenderStepped:Connect(function() updateDrawings() local closest = getClosestPlayerInFOV("Head") if closest and closest.Character:FindFirstChild("Head") then local targetCharacter = closest.Character local targetHead = targetCharacter.Head local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart") local isMoving = targetRootPart.Velocity.Magnitude > 0.1 local targetPosition if isMoving then targetPosition = targetHead.Position + (targetHead.CFrame.LookVector * crosshairDistance) else targetPosition = targetHead.Position end targetCFrame = CFrame.new(Cam.CFrame.Position, targetPosition) else targetCFrame = Cam.CFrame end Cam.CFrame = Cam.CFrame:Lerp(targetCFrame, 1 / smoothness) end) FovSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newFov = tonumber(FovSlider.Text) if newFov then fov = newFov else FovSlider.Text = tostring(fov) end end end) SmoothnessSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newSmoothness = tonumber(SmoothnessSlider.Text) if newSmoothness then smoothness = newSmoothness else SmoothnessSlider.Text = tostring(smoothness) end end end) CrosshairDistanceSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newCrosshairDistance = tonumber(CrosshairDistanceSlider.Text) if newCrosshairDistance then crosshairDistance = newCrosshairDistance else CrosshairDistanceSlider.Text = tostring(crosshairDistance) end end end)
end)

about:Button("汉化阿尔宙斯自瞄",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/sgbs/main/%E4%B8%81%E4%B8%81%20%E6%B1%89%E5%8C%96%E8%87%AA%E7%9E%84.txt"))()
end)
about:Button("自瞄50",function()
loadstring(game:HttpGet("https://pastefy.app/b3uXjRF6/raw",true))()
end)

about:Button("自瞄100",function()
loadstring(game:HttpGet("https://pastefy.app/tQrd2r0L/raw",true))()
end)

about:Button("自瞄150",function()
loadstring(game:HttpGet("https://pastefy.app/UOQWFvGp/raw",true))()
end)

about:Button("自瞄200",function()
loadstring(game:HttpGet("https://pastefy.app/b5CuDuer/raw",true))()
end)

about:Button("自瞄250",function()
loadstring(game:HttpGet("https://pastefy.app/p2huH7eF/raw",true))()
end)

about:Button("自瞄300",function()
loadstring(game:HttpGet("https://pastefy.app/nIyVhrvV/raw",true))()
end)

about:Button("自瞄350",function()
loadstring(game:HttpGet("https://pastefy.app/pnjKHMvV/raw",true))()
end)

about:Button("自瞄400",function()
loadstring(game:HttpGet("https://pastefy.app/LQuP7sjj/raw",true))()
end)

about:Button("自瞄600",function()
loadstring(game:HttpGet("https://pastefy.app/WmcEe2HB/raw",true))()
end)

about:Button("自瞄全屏",function()
loadstring(game:HttpGet("https://pastefy.app/n5LhGGgf/raw",true))()
end)

local UITab84 = win:Tab("范围功能",'16060333448')

local about = UITab84:section("『功能』",true)
about:Textbox("自定义范围（尽量400以下）", "HitBox", "输入", function(Value)
   _G.HeadSize = Value
    _G.Disabled = true 
   game:GetService('RunService').RenderStepped:connect(function()
    if _G.Disabled then
    for i,v in next, game:GetService('Players'):GetPlayers() do
    if v.Name ~= game:GetService('Players').LocalPlayer.Name then 
    pcall(function()
    v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) 
   v.Character.HumanoidRootPart.Transparency = 0.7 
   v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
    v.Character.HumanoidRootPart.Material = "Neon"
    v.Character.HumanoidRootPart.CanCollide = false
    end)
    end 
   end 
   end
    end)
end)

about:Button("范围100", function()
    _G.HeadSize = 100 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
end)

about:Button("范围150", function()
    _G.HeadSize = 150 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
end)

about:Button("范围200", function()
    _G.HeadSize = 200 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
end)

about:Button("范围250", function()
    _G.HeadSize = 250 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
end)

about:Button("范围300", function()
    _G.HeadSize = 300 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
end)
local UITab4 = win:Tab("『画质光影』",'7734068321')

local about = UITab4:section("『画质光影』",true)

about:Button("光影", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)

about:Button("光影滤镜", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)

about:Button("超高画质",function()
loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end)

about:Button("光影V4",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)

about:Button("RTX高仿",function()
loadstring(game:HttpGet('https://pastebin.com/raw/Bkf0BJb3'))()
end)

about:Button("光影深", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)
about:Button("光影浅", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end)

local UITab84 = win:Tab("旋转",'16060333448')

local about = UITab84:section("『功能』",true)

about:Button(
    "旋转10",
    function()
    local speed = 10

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)

about:Button(
    "旋转30",
    function()
    local speed = 30

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)

about:Button(
    "旋转40",
    function()
    local speed = 40

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)

about:Button(
    "旋转50",
    function()
    local speed = 50

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)

about:Button(
    "旋转60",
    function()
    local speed = 60

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)
about:Button(
    "旋转70",
    function()
    local speed = 70

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)

about:Button(
    "旋转80",
    function()
    local speed = 80

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)

about:Button(
    "旋转90",
    function()
    local speed = 90

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)

about:Button(
    "旋转100",
    function()
    local speed = 100

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)

about:Button(
    "旋转150",
    function()
    local speed = 150

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)

about:Button(
    "旋转200",
    function()
    local speed = 200

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)

about:Button(
    "旋转250",
    function()
    local speed = 250

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)

about:Button(
    "旋转300",
    function()
    local speed = 300

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)

about:Button(
    "旋转350",
    function()
    local speed = 350

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)

about:Button(
    "旋转400",
    function()
    local speed = 400

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)
    
local UITab84 = win:Tab("隐藏或死亡",'16060333448')

local about = UITab84:section("『功能』",true)

about:Toggle("自瞄躲藏者", "AimHider", false, function(state)
    AimTog = state
    if AimTog then
        pcall(function()
            spawn(function()
                while task.wait(0.1) and AimTog do
                    local closestPlayer = nil
                    local closestDistance = math.huge
                    local camera = workspace.CurrentCamera
                    local localPlayer = game.Players.LocalPlayer
                    
                    for _, v in next, game.Players:GetPlayers() do
                        if v ~= localPlayer and v.Team and v.Team.Name == "Hider" and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                            if v.Character:FindFirstChild("HumanoidRootPart") then
                                local distance = (localPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
                                if distance < closestDistance then
                                    closestDistance = distance
                                    closestPlayer = v.Character
                                end
                            end
                        end
                    end
                    if closestPlayer then
                        camera.CFrame = CFrame.lookAt(camera.CFrame.p, closestPlayer.HumanoidRootPart.Position)
                    end
                end
            end)
        end)
    else
        local localPlayer = game.Players.LocalPlayer
        if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            camera.CFrame = CFrame.new(localPlayer.Character.HumanoidRootPart.Position, localPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 0, 1))
        end
    end
end)

about:Toggle("透视躲藏者", "ESPHider", false, function(state)
    if state then
        local localPlayer = game.Players.LocalPlayer
        for _,v in next, game.Players:GetPlayers() do
            if v ~= localPlayer and v.Team and v.Team.Name == "Hider" and v.Character then
                ESPHider("躲藏者"..v.Name, v.Character, Color3.new(0,0,1))
            end
        end
    else
        if workspace:FindFirstChild("HiderESPFloder") then
            workspace.HiderESPFloder:ClearAllChildren()
        end
    end
end)

about:Toggle("透视搜查者", "ESPSeeker", false, function(state)
    if state then
        local localPlayer = game.Players.LocalPlayer
        for _,v in next, game.Players:GetPlayers() do
            if v ~= localPlayer and v.Team and v.Team.Name == "Seeker" and v.Character then
                ESPSeeker("搜查者"..v.Name, v.Character, Color3.new(1,0,0))
            end
        end
    else
        if workspace:FindFirstChild("SeekerESPFloder") then
            workspace.SeekerESPFloder:ClearAllChildren()
        end
    end
end)

about:Toggle("自动获取金币", "AutoCollectCoins", false, function(state)
    AutoCollectCoins = state
    pcall(function()
        spawn(function()
            while task.wait(0.1) and AutoCollectCoins do
                if workspace:FindFirstChild("Trash") and workspace.Trash:FindFirstChild("Coins") then
                    local localCharacter = game.Players.LocalPlayer.Character
                    if localCharacter and localCharacter:FindFirstChild("HumanoidRootPart") then
                        for _,v in next, workspace.Trash.Coins:GetChildren() do
                            if v:FindFirstChild("Coin") then
                                firetouchinterest(v.Coin, localCharacter.HumanoidRootPart, 0)
                                firetouchinterest(v.Coin, localCharacter.HumanoidRootPart, 1)
                            end
                        end
                    end
                end
            end
        end)
    end)
end)

about:Toggle("完成岛屿挑战(每回合可以挑战一次)", "IslandChallenge", false, function(state)
    if state then
        local localCharacter = game.Players.LocalPlayer.Character
        if localCharacter and localCharacter:FindFirstChild("HumanoidRootPart") then
            if workspace:FindFirstChild("Obby") and workspace.Obby:FindFirstChild("Pad") and workspace.Obby.Pad:FindFirstChild("Pad") then
                firetouchinterest(workspace.Obby.Pad.Pad, localCharacter.HumanoidRootPart, 0)
                firetouchinterest(workspace.Obby.Pad.Pad, localCharacter.HumanoidRootPart, 1)
            end
        end
    end
end)

about:Toggle("穿墙", "Noclip", false, function(state)
    Noclip = state
    spawn(function()
        while Noclip do
            task.wait(0.1)
            pcall(function()
                local localCharacter = game.Players.LocalPlayer.Character
                if Noclip and localCharacter and localCharacter:FindFirstChild("HumanoidRootPart") then
                    for _, part in pairs(localCharacter:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = not state
                        end
                    end
                end
            end)
        end
    end)
end)

about:Toggle("永远成为搜查者", "AlwaysSeeker", false, function(state)
    AlwaysSeeker = state
    spawn(function()
        while AlwaysSeeker do
            task.wait(0.1)
            pcall(function()
                local localPlayer = game.Players.LocalPlayer
                local playerGui = localPlayer:FindFirstChild("PlayerGui")
                
                if playerGui then
                    local frames = playerGui:FindFirstChild("Frames")
                    if frames then
                        local role_reveal = frames:FindFirstChild("role_reveal")
                        if role_reveal then
                            local seeker_chance = role_reveal:FindFirstChild("seeker_chance")
                            if seeker_chance and seeker_chance:IsA("TextLabel") and seeker_chance.TextTransparency ~= 1 then
                                local role = role_reveal:FindFirstChild("role")
                                if role then
                                    local seekerRole = role:FindFirstChild("Seeker")
                                    local hiderRole = role:FindFirstChild("Hider")
                                    if seekerRole then seekerRole.Visible = true end
                                    if hiderRole then hiderRole.Visible = false end
                                end
                            end
                            if seeker_chance then
                                seeker_chance.Text = "Chance to be seeker: 100%"
                            end
                        end
                    end
                end
                
                if not localPlayer.Team or localPlayer.Team.Name == "Hider" then
                    local network = game:GetService("ReplicatedStorage"):FindFirstChild("Network")
                    if network then
                        local match = network:FindFirstChild("match")
                        if match then
                            local wantsToJoin = match:FindFirstChild("WantsToJoinMatch")
                            if wantsToJoin then
                                wantsToJoin:FireServer()
                            end
                        end
                    end
                    local teams = game:GetService("Teams")
                    local seekerTeam = teams:FindFirstChild("Seeker")
                    if seekerTeam then
                        localPlayer.Team = seekerTeam
                    end
                end
            end)
        end
    end)
end)

about:Button("攻击所有玩家", function()
    local localPlayer = game.Players.LocalPlayer
    local network = game:GetService("ReplicatedStorage"):FindFirstChild("Network")
    
    if network then
        local knife = network:FindFirstChild("knife")
        if knife then
            local slash = knife:FindFirstChild("slash")
            if slash then
                for _,player in next, game.Players:GetPlayers() do
                    if player ~= localPlayer and player.Character then
                        local character = player.Character
                        local humanoid = character:FindFirstChild("Humanoid")
                        if humanoid then
                            local secondary = localPlayer.Character:FindFirstChild("Secondary") or localPlayer.Backpack:FindFirstChild("Secondary")
                            if secondary then
                                for i=1, 4 do
                                    slash:FireServer(
                                        workspace:GetServerTimeNow(),
                                        secondary,
                                        character:GetPivot(),
                                        humanoid
                                    )
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

local UITab84 = win:Tab("幸运方块战争",'16060333448')

local about = UITab84:section("『功能』",true)

local generateCount = 1

about:Textbox("生成数量", "GenerateCount", "1", function(value)
    generateCount = tonumber(value) or 1
end)

about:Button("攻击体积！", function()
    _G.HeadSize = 25
    _G.Disabled = true

    game:GetService('RunService').RenderStepped:Connect(function()
        if _G.Disabled then
            for _, v in next, game:GetService('Players'):GetPlayers() do
                if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                    pcall(function()
                        if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                            v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                            v.Character.HumanoidRootPart.Transparency = 0.7
                            v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                            v.Character.HumanoidRootPart.Material = "Neon"
                            v.Character.HumanoidRootPart.CanCollide = false
                        end
                    end)
                end
            end
        end
    end)
end)

about:Button("获得所有幸运方块", function()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local spawnGalaxyBlock = replicatedStorage:FindFirstChild("SpawnGalaxyBlock")
    
    if spawnGalaxyBlock then
        for i = 1, 100 do
            spawnGalaxyBlock:FireServer()
        end
    end
end)

about:Button("幸运块", function()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local spawnLuckyBlock = replicatedStorage:FindFirstChild("SpawnLuckyBlock")
    
    if spawnLuckyBlock then
        for i = 1, generateCount do
            spawnLuckyBlock:FireServer()
        end
    end
end)

about:Button("钻石块", function()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local spawnDiamondBlock = replicatedStorage:FindFirstChild("SpawnDiamondBlock")
    
    if spawnDiamondBlock then
        for i = 1, generateCount do
            spawnDiamondBlock:FireServer()
        end
    end
end)

about:Button("超级块", function()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local spawnSuperBlock = replicatedStorage:FindFirstChild("SpawnSuperBlock")
    
    if spawnSuperBlock then
        for i = 1, generateCount do
            spawnSuperBlock:FireServer()
        end
    end
end)

about:Button("彩虹块", function()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local spawnRainbowBlock = replicatedStorage:FindFirstChild("SpawnRainbowBlock")
    
    if spawnRainbowBlock then
        for i = 1, generateCount do
            spawnRainbowBlock:FireServer()
        end
    end
end)

about:Button("银河块", function()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local spawnGalaxyBlock = replicatedStorage:FindFirstChild("SpawnGalaxyBlock")
    
    if spawnGalaxyBlock then
        for i = 1, generateCount do
            spawnGalaxyBlock:FireServer()
        end
    end
end)

local UITab84 = win:Tab("僵尸起义",'16060333448')

local about = UITab84:section("『功能』",true)

about:Toggle("子弹范围", "AimBot", false, function(bool)
    boolAimBot = bool
end)

about:Toggle("机器人模式", "TriggerBot", false, function(bool)
    boolTriggerBot = bool
end)

about:Toggle("收集能量", "CollectPowerUps", false, function(bool)
    boolCollectPowerUps = bool
    if bool then
        spawn(function()
            while boolCollectPowerUps do
                task.wait()
                local localPlayer = game.Players.LocalPlayer
                if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local hrp = localPlayer.Character.HumanoidRootPart
                    if workspace.Ignore and workspace.Ignore:FindFirstChild("PowerUps") then
                        for _,v in pairs(workspace.Ignore.PowerUps:GetChildren()) do
                            firetouchinterest(hrp, v, 0)
                            task.wait()
                            firetouchinterest(hrp, v, 1)
                        end
                    end
                end
            end
        end)
    end
end)

-- 获取最近僵尸的函数
local function fGetClosest()
    spawn(function()
        while task.wait() do
            local localPlayer = game.Players.LocalPlayer
            local hrp = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
            
            if hrp then
                local last = math.huge
                local ZombiesList = workspace.Zombies and workspace.Zombies:GetChildren() or {}
                closestZombie = nil
                
                if next(ZombiesList) ~= nil then
                    for _,v in pairs(ZombiesList) do
                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                            if v.Humanoid.Health ~= 0 then
                                local function obscured(part)
                                    return false
                                end
                                
                                if v:FindFirstChild("Head") and not obscured(v.Head) then
                                    local distance = (hrp.Position - v.Head.Position).magnitude
                                    if distance < last then
                                        last = distance
                                        closestZombie = v
                                    end 
                                elseif not obscured(v.HumanoidRootPart) then
                                    local distance = (hrp.Position - v.HumanoidRootPart.Position).magnitude
                                    if distance < last then
                                        last = distance
                                        closestZombie = v
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
end

fGetClosest()

-- 自瞄函数
local function fAimBot()
    spawn(function()
        while task.wait() do
            local localPlayer = game.Players.LocalPlayer
            
            if boolLeftControl and closestZombie ~= nil and boolAimBot then
                local closest = closestZombie
                localPlayer.CameraMode = "LockFirstPerson"
                
                if closest ~= nil then
                    repeat
                        task.wait()
                        local part = nil
                        
                        if closest:FindFirstChild("Head") then
                            workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.Position, closest.Head.CFrame.Position)
                            part = closest.Head
                        elseif closest:FindFirstChild("HumanoidRootPart") then
                            workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.Position, closest.HumanoidRootPart.CFrame.Position)
                            part = closest.HumanoidRootPart
                        end
                        
                        if boolTriggerBot and part then
                            mouse1press()
                        end
                    until not closest:FindFirstChild("Humanoid") or closest.Humanoid.Health == 0 or not boolAimBot or not boolLeftControl
                    mouse1release()
                end
            end
        end
    end)
end

fAimBot()

-- 鼠标输入监听
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        boolLeftControl = true
        local localPlayer = game.Players.LocalPlayer
        localPlayer.CameraMode = "LockFirstPerson"
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        boolLeftControl = false
    end
end)

local UITab84 = win:Tab("究极进化",'16060333448')

local about = UITab84:section("『功能』",true)

about:Toggle("自动耐力", "AutoEndurance", false, function(value)
    _G.AutoEndurance = value
end)

about:Toggle("自动力量", "AutoStrenght", false, function(value)
    _G.AutoStrenght = value
end)

about:Toggle("自动敏捷性", "AutoAgility", false, function(value)
    _G.AutoAgility = value
end)

about:Toggle("自动杀暴徒", "AutoKillNPC", false, function(value)
    _G.AutoKillNPC = value
end)

about:Toggle("自动收集硬币", "CollectCoin", false, function(value)
    _G.CollectCoin = value
end)

local UITab84 = win:Tab("Break-In",'16060333448')

local about = UITab84:section("『武器区』",true)

about:Button("锤子", function()
    game.ReplicatedStorage.RemoteEvents.BasementWeapon:FireServer(true, "Hammer")
end)

about:Button("球棒", function()
    game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Bat")
end)

about:Button("剑", function()
    game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("LinkedSword")
end)

local about = UITab84:section("『物品区』",true)

about:Button("薯片", function()
    game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Chips")
end)

about:Button("棒棒糖", function()
    game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Lollipop")
end)

about:Button("可乐", function()
    game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("BloxyCola")
end)

about:Button("苹果", function()
    game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Apple")
end)

about:Button("披萨", function()
    game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Pizza2")
end)

about:Button("饼干", function()
    game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Cookie")
end)

about:Button("医疗包", function()
    game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("MedKit")
end)

about:Button("药物", function()
    game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Cure")
end)

about:Button("木板", function()
    game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Plank")
end)

about:Button("泰迪熊", function()
    game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("TeddyBloxpin")
end)

local about = UITab84:section("『免费通行证角色』",true)

about:Button("玩具剑小孩", function()
    game:GetService("ReplicatedStorage").RemoteEvents.MakeRole:FireServer("LinkedSword", true, false)
end)

about:Button("警员", function()
    game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole:FireServer("Gun", true)
end)

about:Button("特警", function()
    game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole:FireServer("SwatGun", true)
end)

local about = UITab84:section("『传送区』",true)

about:Button("地下室", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(71, -15, -163)
end)

about:Button("房子", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-36, 3, -200)
end)

about:Button("顶楼", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-16, 35, -220)
end)

about:Button("超市", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-422, 3, -121)
end)

about:Button("下水道", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(129, 3, -125)
end)

about:Button("Boss房间", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39, -287, -1480)
end)

local about = UITab84:section("『解锁通知』",true)

about:Button("猫的朋友", function()
    game.ReplicatedStorage.RemoteEvents.Cattery:FireServer()
end)

about:Button("解锁地下室", function()
    game.ReplicatedStorage.RemoteEvents.UnlockDoor:FireServer()
end)

about:Button("地下室灯光", function()
    game.ReplicatedStorage.RemoteEvents.BasementMission:FireServer()
    game.ReplicatedStorage.RemoteFunctions.GetAmbient:InvokeServer()
end)

about:Button("地下室钥匙", function()
    game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Key")
end)

local UITab84 = win:Tab("Break-In2",'16060333448')

local about = UITab84:section("『主要功能』",true)

about:Button("训练力量", function()
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RainbowWhatStat"):FireServer("Strength")
end)

about:Button("训练速度", function()
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RainbowWhatStat"):FireServer("Speed")
end)

about:Button("杀死所有敌人", function()
    KillEnemies()
end)

about:Toggle("循环杀死所有敌人", "KillAllLoop", false, function(Value)
    KillAllLoop = Value
    while KillAllLoop do
        for i = 1, 3 do
            KillEnemies()
        end
        task.wait(0.1)
    end
end)

local about = UITab84:section("『物品』",true)

about:Button("盔甲", function()
    GiveItem("Armor")
end)

about:Button("医药箱", function()
    GiveItem("Med Kit")
end)

about:Button("钥匙", function()
    GiveItem("Key")
end)

about:Button("黄金钥匙", function()
    GiveItem("Gold Key")
end)

about:Button("老鼠", function()
    GiveItem("Louise")
end)

about:Button("棒棒糖", function()
    GiveItem("Lollipop")
end)

about:Button("薯片", function()
    GiveItem("Chips")
end)

about:Button("苹果", function()
    GiveItem("Apple")
end)

about:Button("黄金苹果", function()
    GiveItem("Golden Apple")
end)

about:Button("披萨", function()
    GiveItem("Pizza")
end)

about:Button("黄金披萨", function()
    GiveItem("Gold Pizza")
end)

about:Button("彩虹披萨", function()
    GiveItem("Rainbow Pizza")
end)

about:Button("曲奇", function()
    GiveItem("Cookie")
end)

about:Button("可乐", function()
    GiveItem("Bloxy Cola")
end)

about:Button("瓶子", function()
    GiveItem("Bottle")
end)

about:Button("梯子", function()
    GiveItem("Ladder")
end)

about:Button("电池", function()
    GiveItem("Battery")
end)

local about = UITab84:section("『免费通行证人物』",true)

about:Button("书呆子小孩", function()
    game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole:FireServer("Book", true, false)
end)

about:Button("黑客", function()
    game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole:FireServer("Phone", true, false)
end)

local about = UITab84:section("『传送区』",true)

about:Button("Boss", function()
    TeleportTo(CFrame.new(-1565.78772, -368.711945, -1040.66626, 0.0929690823, -1.97564436e-08, 0.995669007, -1.53269308e-08, 1, 2.1273511e-08, -0.995669007, -1.72383299e-08, 0.0929690823))
end)

about:Button("商店", function()
    TeleportTo(CFrame.new(-246.653229, 30.4500484, -847.319275, 0.999987781, -9.18427645e-08, -0.00494772941, 9.19905787e-08, 1, 2.96483353e-08, 0.00494772941, -3.01031164e-08, 0.999987781))
end)

about:Button("厨房", function()
    TeleportTo(CFrame.new(-249.753555, 30.4500484, -732.703125, -0.999205947, -1.97705017e-08, 0.0398429185, -2.00601384e-08, 1, -6.86967372e-09, -0.0398429185, -7.66347341e-09, -0.999205947))
end)

about:Button("打斗区域", function()
    TeleportTo(CFrame.new(-255.521988, 62.7139359, -723.436035, -0.0542500541, 4.28905356e-09, -0.998527408, 1.07862625e-08, 1, 3.70936082e-09, 0.998527408, -1.05691456e-08, -0.0542500541))
end)

about:Button("健身房", function()
    TeleportTo(CFrame.new(-256.477448, 63.4500465, -840.825562, 0.999789953, 2.17116263e-08, 0.020495005, -2.15169358e-08, 1, -9.7199333e-09, -0.020495005, 9.27690191e-09, 0.999789953))
end)

about:Button("黄金苹果", function()
    TeleportTo(CFrame.new(61.8781624, 29.4499969, -534.381165, -0.584439218, -1.05103076e-07, 0.811437488, -3.12853778e-08, 1, 1.06993674e-07, -0.811437488, 3.71451705e-08, -0.584439218))
end)

about:Button("喂食说明", function()
    TeleportTo(CFrame.new(-207.885056, 60.4500465, -830.583557, 0.118373089, 3.89876789e-08, -0.992969215, 3.47791551e-09, 1, 3.96783406e-08, 0.992969215, -8.15031065e-09, 0.118373089))
end)

about:Button("中间房间", function()
    TeleportTo(CFrame.new(-209.951859, 30.4590473, -789.723877, -0.0485812724, 6.74905039e-08, 0.998819232, 1.19352916e-09, 1, -6.75122394e-08, -0.998819232, -2.08771045e-09, -0.0485812724))
end)

about:Button("外面的食物", function()
    local outsideParts = game:GetService("Workspace").OutsideParts
    if outsideParts then
        local targetPart = outsideParts:FindFirstChildWhichIsA("Part", true)
        if targetPart then
            TeleportTo(targetPart.CFrame + Vector3.new(10, 0, 0))
        end
    end
end)

about:Button("实验室", function()
    local finalFactory = game:GetService("Workspace").Final.Factory
    if finalFactory and finalFactory:FindFirstChild("RedDesk") then
        local redDesk = finalFactory.RedDesk
        if redDesk:FindFirstChild("Drawer") then
            local drawerChildren = redDesk.Drawer:GetChildren()
            if #drawerChildren >= 2 then
                TeleportTo(drawerChildren[2].CFrame + Vector3.new(20, 0, 0))
            end
        end
    end
end)

about:Button("自助餐厅", function()
    local finalFactory = game:GetService("Workspace").Final.Factory
    if finalFactory then
        local legsPart = finalFactory:FindFirstChild("Legs", true)
        if legsPart then
            TeleportTo(legsPart.CFrame)
        end
    end
end)

about:Button("彩虹披萨盒子", function()
    local rainbowPizzaBox = game:GetService("Workspace"):FindFirstChild("RainbowPizzaBox")
    if rainbowPizzaBox then
        TeleportTo(rainbowPizzaBox.CFrame)
    end
end)

local about = UITab84:section("『隐藏结局』",true)

about:Button("金色撬棍", function()
    TeleportTo(CFrame.new(-147.337204, 29.4477005, -929.365295, 0.756779075, 4.53537341e-09, -0.653670728, 5.82708326e-09, 1, 1.36845468e-08, 0.653670728, -1.4165173e-08, 0.756779075))
end)

about:Button("紫色口罩", function()
    TeleportTo(CFrame.new(102.560722, 29.2477055, -976.389954, -0.951403797, 3.76210636e-08, -0.307946175, 1.89752569e-08, 1, 6.35433466e-08, 0.307946175, 5.46120233e-08, -0.951403797))
end)

about:Button("流浪孩童", function()
    TeleportTo(CFrame.new(-79.4871826, 29.4477024, -932.782715, -0.215949073, 3.18771427e-08, 0.976404607, -7.60385461e-08, 1, -4.94647345e-08, -0.976404607, -8.49262562e-08, -0.215949073))
end)

local UITab84 = win:Tab("皮肤行者",'16060333448')

local about = UITab84:section("『功能』",true)

about:Toggle("幸存者透视", "ESPCivilians", false, function(state)
    if state then
        if civiliansconnection then civiliansconnection:Disconnect() end
        for _, v in next, workspace.Runners.Civilians:GetChildren() do
            ESPCivilians(v.Name, v, Color3.new(1, 0, 0))
        end
        civiliansconnection = workspace.Runners.Civilians.ChildAdded:Connect(function(v)
            ESPCivilians(v.Name, v, Color3.new(1, 0, 0))
        end)
    else
        if civiliansconnection then civiliansconnection:Disconnect() end
        if workspace:FindFirstChild("CiviliansESPFloder") then
            workspace.CiviliansESPFloder:ClearAllChildren()
        end
    end
end)

about:Toggle("怪物透视", "ESPSkinwalkers", false, function(state)
    if state then
        if skinwalkersconnection then skinwalkersconnection:Disconnect() end
        for _, v in next, workspace.Runners.Skinwalkers:GetChildren() do
            ESPSkinwalkers("怪物", v, Color3.new(0, 0, 1))
        end
        skinwalkersconnection = workspace.Runners.Skinwalkers.ChildAdded:Connect(function(v)
            ESPSkinwalkers("怪物", v, Color3.new(0, 0, 1))
        end)
    else
        if skinwalkersconnection then skinwalkersconnection:Disconnect() end
        if workspace:FindFirstChild("SkinwalkersESPFloder") then
            workspace.SkinwalkersESPFloder:ClearAllChildren()
        end
    end
end)

about:Toggle("杀死全部(皮肤行者)", "KillSkinwalkers", false, function(state)
    _G.Gunaura = state
    while _G.Gunaura do
        task.wait(0.3)
        local localPlayer = game.Players.LocalPlayer
        local character = localPlayer.Character
        
        if character then
            local shotTargets = {}
            local runners = workspace.Runners
            if runners then
                local skinwalkers = runners:FindFirstChild("Skinwalkers")
                if skinwalkers then
                    for _, v in next, skinwalkers:GetChildren() do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("Head") and v.Humanoid.Health > 0 and not shotTargets[v] then
                            for _,t in next, character:GetChildren() do
                                if t.Name == "Sniper" or t.Name == "Pistol" or t.Name == "Gatling" then
                                    local args = {
                                        [1] = Vector3.new(v.Head.Position.X, v.Head.Position.Y, v.Head.Position.Z),
                                        [2] = Vector3.new(v.Head.Position.X, v.Head.Position.Y, v.Head.Position.Z),
                                        [3] = v.Head
                                    }
                                    
                                    if t.Name == "Gatling" then
                                        args[4] = {
                                            ["BulletReduction"] = 0,
                                            ["Damage"] = math.huge
                                        }
                                    end
                                    
                                    local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
                                    if remotes then
                                        local sniperShot = remotes:FindFirstChild("SniperShot")
                                        if sniperShot then
                                            sniperShot:FireServer(unpack(args))
                                            shotTargets[v] = true
                                        end
                                    end
                                    break
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

about:Toggle("杀死全部(夜晚怪物)", "KillNightwalkers", false, function(state)
    _G.Gunaura = state
    while _G.Gunaura do
        task.wait(0.3)
        local localPlayer = game.Players.LocalPlayer
        local character = localPlayer.Character
        
        if character then
            local shotTargets = {}
            local nightwalkers = workspace:FindFirstChild("Nightwalkers")
            if nightwalkers then
                for _, v in next, nightwalkers:GetChildren() do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("Head") and v.Humanoid.Health > 0 and not shotTargets[v] then
                        for _,t in next, character:GetChildren() do
                            if t.Name == "Sniper" or t.Name == "Pistol" or t.Name == "Gatling" then
                                local args = {
                                    [1] = Vector3.new(v.Head.Position.X, v.Head.Position.Y, v.Head.Position.Z),
                                    [2] = Vector3.new(v.Head.Position.X, v.Head.Position.Y, v.Head.Position.Z),
                                    [3] = v.Head
                                }
                                
                                if t.Name == "Gatling" then
                                    args[4] = {
                                        ["BulletReduction"] = 0,
                                        ["Damage"] = math.huge
                                    }
                                end
                                
                                local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
                                if remotes then
                                    local sniperShot = remotes:FindFirstChild("SniperShot")
                                    if sniperShot then
                                        sniperShot:FireServer(unpack(args))
                                        shotTargets[v] = true
                                    end
                                end
                                break
                            end
                        end
                    end
                end
            end
        end
    end
end)

about:Toggle("自动收集钱袋", "AutoCollectMoney", false, function(state)
    _G.CoMoneybag = state
    while _G.CoMoneybag do
        task.wait(0.3)
        local gameObjects = workspace:FindFirstChild("GameObjects")
        if gameObjects then
            for _,v in next, gameObjects:GetChildren() do
                if v.Name == "MoneyBag" and v:FindFirstChild("ProximityPrompt") then
                    fireproximityprompt(v.ProximityPrompt)
                end
            end
        end
    end
end)

about:Toggle("自动售卖", "AutoSell", false, function(state)
    _G.Autostore = state
    while _G.Autostore do
        task.wait(0.3)
        local localPlayer = game.Players.LocalPlayer
        local character = localPlayer.Character
        
        if character then
            local runners = workspace.Runners
            if runners then
                local skinwalkers = runners:FindFirstChild("Skinwalkers")
                if skinwalkers then
                    for _, v in next, skinwalkers:GetChildren() do
                        if v:IsA("Model") and (v:GetPivot().Position - character:GetPivot().Position).Magnitude <= 15 then
                            local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
                            if remotes then
                                local storeRemote = remotes:FindFirstChild("Store")
                                if storeRemote then
                                    storeRemote:FireServer(v)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

about:Toggle("自动收集尸体", "AutoCollectBodies", false, function(state)
    _G.Autostore = state
    while _G.Autostore do
        task.wait(0.3)
        local localPlayer = game.Players.LocalPlayer
        local character = localPlayer.Character
        
        if character then
            local runners = workspace.Runners
            if runners then
                local skinwalkers = runners:FindFirstChild("Skinwalkers")
                if skinwalkers then
                    for _, v in next, skinwalkers:GetChildren() do
                        character:PivotTo(v:GetPivot().Position)
                        if v:IsA("Model") and (v:GetPivot().Position - character:GetPivot().Position).Magnitude <= 15 then
                            local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
                            if remotes then
                                local storeRemote = remotes:FindFirstChild("Store")
                                if storeRemote then
                                    storeRemote:FireServer(v)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

about:Toggle("自动放夹子(无需夹子直接放)", "AutoTrap", false, function(state)
    _G.AutoTrap = state
    while _G.AutoTrap do
        task.wait(0.3)
        local localPlayer = game.Players.LocalPlayer
        local character = localPlayer.Character
        
        if character and character:FindFirstChild("HumanoidRootPart") then
            local args = {
                [1] = Vector3.new(character.HumanoidRootPart.Position.X, character.HumanoidRootPart.Position.Y, character.HumanoidRootPart.Position.Z)
            }
            
            local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
            if remotes then
                local placeTrap = remotes:FindFirstChild("PlaceTrap")
                if placeTrap then
                    placeTrap:FireServer(unpack(args))
                end
            end
        end
    end
end)

about:Button("获取加特林", function()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local assets = replicatedStorage:FindFirstChild("Assets")
    
    if assets then
        local tools = assets:FindFirstChild("Tools")
        if tools then
            local gatling = tools:FindFirstChild("Gatling")
            local localPlayer = game.Players.LocalPlayer
            local backpack = localPlayer.Backpack
            
            if gatling then
                gatling.Parent = backpack
            elseif backpack:FindFirstChild("Gatling") then
                backpack.Gatling.Parent = tools
            end
        end
    end
end)

about:Button("获取可乐", function()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local assets = replicatedStorage:FindFirstChild("Assets")
    
    if assets then
        local tools = assets:FindFirstChild("Tools")
        if tools then
            local cola = tools:FindFirstChild("Cola")
            local localPlayer = game.Players.LocalPlayer
            local backpack = localPlayer.Backpack
            
            if cola then
                local amount = cola:FindFirstChild("Amount")
                if amount then
                    amount.Value = 99
                end
                cola.Parent = backpack
            elseif backpack:FindFirstChild("Cola") then
                backpack.Cola.Parent = tools
            end
        end
    end
end)

about:Button("获取夹子", function()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local assets = replicatedStorage:FindFirstChild("Assets")
    
    if assets then
        local tools = assets:FindFirstChild("Tools")
        if tools then
            local snapper = tools:FindFirstChild("Snapper")
            local localPlayer = game.Players.LocalPlayer
            local backpack = localPlayer.Backpack
            
            if snapper then
                local amount = snapper:FindFirstChild("Amount")
                if amount then
                    amount.Value = 99
                end
                snapper.Parent = backpack
            elseif backpack:FindFirstChild("Snapper") then
                backpack.Snapper.Parent = tools
            end
        end
    end
end)

about:Button("获取炮塔", function()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local assets = replicatedStorage:FindFirstChild("Assets")
    
    if assets then
        local tools = assets:FindFirstChild("Tools")
        if tools then
            local turret = tools:FindFirstChild("Turret")
            local localPlayer = game.Players.LocalPlayer
            local backpack = localPlayer.Backpack
            
            if turret then
                local amount = turret:FindFirstChild("Amount")
                if amount then
                    amount.Value = 99
                end
                turret.Parent = backpack
            elseif backpack:FindFirstChild("Turret") then
                backpack.Turret.Parent = tools
            end
        end
    end
end)

local UITab84 = win:Tab("一次尘土飞扬的旅行",'16060333448')

local about = UITab84:section("『功能』",true)

about:Button("自动到达20000", function()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local teleportLocations = {
        CFrame.new(-20.408166885375977, -11.34829044342041, 1809.8782958984375),
        CFrame.new(257.45782470703125, 58.954708099365234, -4186.28955078125),
        CFrame.new(515.4042358398438, 72.82687377929688, -10186.2861328125),
        CFrame.new(123.37289428710938, -66.69212341308594, -16188.0537109375),
        CFrame.new(232.33438110351562, 147.98423767089844, -22189.32421875),
        CFrame.new(713.6531982421875, 102.16617584228516, -28190.58984375),
        CFrame.new(910.4205322265625, -137.20584106445312, -34189.23046875),
        CFrame.new(1141.0308837890625, 148.53587341308594, -40185.35546875),
        CFrame.new(1357.2171630859375, 87.61758422851562, -46190.3125),
        CFrame.new(1606.8338623046875, -174.83712768554688, -52188.765625),
        CFrame.new(1503.0009765625, 210.8280792236328, -82185.9140625),
        CFrame.new(734.9932861328125, -117.6973876953125, -112190.21875),
    }
    local teleportDelay = 0.5
    
    local function teleportToLocations()
        for _, location in ipairs(teleportLocations) do
            humanoidRootPart.CFrame = location
            task.wait(teleportDelay)
        end
    end
    
    teleportToLocations()
end)

about:Label("传送点")

about:Button("距离1000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20.408166885375977, -11.34829044342041, 1809.8782958984375)
end)

about:Button("距离2000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(257.45782470703125, 58.954708099365234, -4186.28955078125)
end)

about:Button("距离3000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(515.4042358398438, 72.82687377929688, -10186.2861328125)
end)

about:Button("距离4000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(123.37289428710938, -66.69212341308594, -16188.0537109375)
end)

about:Button("距离5000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(232.33438110351562, 147.98423767089844, -22189.32421875)
end)

about:Button("距离6000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(713.6531982421875, 102.16617584228516, -28190.58984375)
end)

about:Button("距离7000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(910.4205322265625, -137.20584106445312, -34189.23046875)
end)

about:Button("距离8000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1141.0308837890625, 148.53587341308594, -40185.35546875)
end)

about:Button("距离9000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1357.2171630859375, 87.61758422851562, -46190.3125)
end)

about:Button("距离10000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1606.8338623046875, -174.83712768554688, -52188.765625)
end)

about:Button("距离15000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1503.0009765625, 210.8280792236328, -82185.9140625)
end)

about:Button("距离20000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(734.9932861328125, -117.6973876953125, -112190.21875)
end)

local UITab84 = win:Tab("生存7天",'16060333448')

local about = UITab84:section("『功能』",true)

about:Toggle("动物透视", "ESPAnimal", false, function(state)
    if state then
        if animalConnection then animalConnection:Disconnect() end
        for _, v in next, workspace.animals:GetChildren() do
            ESPAnimal(v.Name, v, Color3.new(1, 0, 0))
        end
        animalConnection = workspace.animals.ChildAdded:Connect(function(v)
            ESPAnimal(v.Name, v, Color3.new(1, 0, 0))
        end)
    else
        if animalConnection then animalConnection:Disconnect() end
        if workspace:FindFirstChild("AnimalESPFloder") then
            workspace.AnimalESPFloder:ClearAllChildren()
        end
    end
end)

about:Toggle("怪物透视", "ESPMonster", false, function(state)
    if state then
        if scpConnection then scpConnection:Disconnect() end
        for _, v in next, workspace.scps:GetChildren() do
            ESPMonster("怪物", v, Color3.new(0, 0, 1))
        end
        scpConnection = workspace.scps.ChildAdded:Connect(function(v)
            ESPMonster("怪物", v, Color3.new(0, 0, 1))
        end)
    else
        if scpConnection then scpConnection:Disconnect() end
        if workspace:FindFirstChild("ScpESPFloder") then
            workspace.ScpESPFloder:ClearAllChildren()
        end
    end
end)

about:Toggle("秒砍树", "InstantCutTree", false, function(state)
    local localPlayer = game.Players.LocalPlayer
    local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("remotes")
    
    if remotes then
        local swingAxe = remotes:FindFirstChild("swing_axe")
        if swingAxe then
            localPlayer.instantlycutofftree = state
            spawn(function()
                while localPlayer.instantlycutofftree do
                    task.wait()
                    swingAxe:FireServer()
                    if workspace:FindFirstChild("logs") then
                        for _,v in next, workspace.logs:GetChildren() do
                            if v.Name == "log" and v:FindFirstChild("main") then
                                local proximityPrompt = v.main:FindFirstChild("ProximityPrompt")
                                if proximityPrompt then
                                    fireproximityprompt(proximityPrompt)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

about:Toggle("自动钓鱼", "AutoFishing", false, function(state)
    local localPlayer = game.Players.LocalPlayer
    local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("remotes")
    
    if remotes then
        local castRemote = remotes:FindFirstChild("cast")
        local hitFishRemote = remotes:FindFirstChild("hit_fish")
        
        if castRemote and hitFishRemote then
            localPlayer.AutoCast = state
            spawn(function()
                while localPlayer.AutoCast do
                    castRemote:FireServer()
                    task.wait(0.2)
                    for i = 1, 8 do
                        hitFishRemote:FireServer()
                    end
                    task.wait()
                end
            end)
        end
    end
end)

about:Button("秒吃食物", function()
    local localPlayer = game.Players.LocalPlayer
    local character = localPlayer.Character
    
    if character then
        local backpack = localPlayer.Backpack
        local hungerValue = character:FindFirstChild("hunger")
        
        if backpack and hungerValue then
            for _,v in pairs(backpack:GetChildren()) do
                if v:FindFirstChild("eat") and hungerValue.Value < 30 then
                    v.Parent = character
                    for i = 1, 20 do
                        character[v.Name].eat:FireServer()
                    end
                end
            end
        end
    end
end)

about:Toggle("自动收集材料", "AutoCollectScraps", false, function(state)
    local localPlayer = game.Players.LocalPlayer
    localPlayer.AutoCollectScraps = state
    
    spawn(function()
        while localPlayer.AutoCollectScraps do
            if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local oldcf = localPlayer.Character.HumanoidRootPart.CFrame
                
                if workspace:FindFirstChild("scraps") then
                    for _, v in pairs(workspace.scraps:GetChildren()) do
                        local material = v:FindFirstChild("defaultMaterial10")
                        if material and localPlayer.AutoCollectScraps then
                            local prompt = material:FindFirstChild("ProximityPrompt")
                            if prompt and localPlayer.AutoCollectScraps then
                                localPlayer.Character.HumanoidRootPart.CFrame = material.CFrame + Vector3.new(0, 3, 0)
                                task.wait(0.2)
                                fireproximityprompt(prompt)
                                task.wait(0.2)
                                localPlayer.Character.HumanoidRootPart.CFrame = oldcf
                            end
                        end
                    end
                end
            end
            task.wait()
        end
    end)
end)

about:Button("传送回出生点", function()
    local localPlayer = game.Players.LocalPlayer
    if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
        localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(57, 42, 416)
    end
end)

about:Toggle("自动收集成熟品", "AutoCollectHarvest", false, function(state)
    local localPlayer = game.Players.LocalPlayer
    localPlayer.AutoCollectHarvt = state
    
    if localPlayer.AutoCollectHarvt then
        if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local oldpos = localPlayer.Character.HumanoidRootPart.CFrame
            spawn(function()
                while localPlayer.AutoCollectHarvt do
                    if workspace:FindFirstChild("harvest") then
                        for _,v in next, workspace.harvest:GetChildren() do
                            if v:FindFirstChild("main") then
                                localPlayer.Character.HumanoidRootPart.CFrame = v.main.CFrame
                                local prompt = v.main:FindFirstChild("ProximityPrompt")
                                if prompt then
                                    fireproximityprompt(prompt)
                                end
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end
    else
        if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if oldpos then
                localPlayer.Character.HumanoidRootPart.CFrame = oldpos
            end
        end
    end
end)

about:Toggle("自动收集生鹿肉", "AutoCollectDeer", false, function(state)
    local localPlayer = game.Players.LocalPlayer
    localPlayer.AutoCollectHarvt = state
    
    if localPlayer.AutoCollectHarvt then
        if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local oldpos = localPlayer.Character.HumanoidRootPart.CFrame
            spawn(function()
                while localPlayer.AutoCollectHarvt do
                    if workspace:FindFirstChild("interact") then
                        for _,v in next, workspace.interact:GetChildren() do
                            if v.Name == "deer" and v:FindFirstChild("lungs,heart,intestines") then
                                local organ = v["lungs,heart,intestines"]
                                localPlayer.Character.HumanoidRootPart.CFrame = organ.CFrame
                                local prompt = organ:FindFirstChild("ProximityPrompt")
                                if prompt then
                                    fireproximityprompt(prompt)
                                end
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end
    else
        if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if oldpos then
                localPlayer.Character.HumanoidRootPart.CFrame = oldpos
            end
        end
    end
end)

about:Toggle("自动收集包菜", "AutoCollectCabbage", false, function(state)
    local localPlayer = game.Players.LocalPlayer
    localPlayer.AutoCollectDirt = state
    
    if localPlayer.AutoCollectDirt then
        if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local oldpos = localPlayer.Character.HumanoidRootPart.CFrame
            spawn(function()
                while localPlayer.AutoCollectDirt do
                    local builds = workspace:FindFirstChild("builds")
                    if builds then
                        local cabbageFarm = builds:FindFirstChild("Cabbage Farm")
                        if cabbageFarm and cabbageFarm:FindFirstChild("dirt") then
                            local dirt = cabbageFarm.dirt
                            localPlayer.Character.HumanoidRootPart.CFrame = dirt.CFrame
                            local prompt = dirt:FindFirstChild("ProximityPrompt")
                            if prompt then
                                fireproximityprompt(prompt)
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end
    else
        if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if oldpos then
                localPlayer.Character.HumanoidRootPart.CFrame = oldpos
            end
        end
    end
end)

about:Toggle("枪械光环", "GunAura", false, function(state)
    local localPlayer = game.Players.LocalPlayer
    localPlayer.KillAll = state
    
    spawn(function()
        while localPlayer.KillAll do
            local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("remotes")
            if remotes then
                local shootRemote = remotes:FindFirstChild("shoot")
                local reloadRemote = remotes:FindFirstChild("reload")
                
                if shootRemote and reloadRemote then
                    for _,v in next, workspace.scps:GetChildren() do
                        if v:FindFirstChild("HumanoidRootPart") then
                            local args = {
                                [1] = CFrame.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y, v.HumanoidRootPart.Position.Z) * CFrame.Angles(0, 0, 0),
                                [2] = CFrame.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y, v.HumanoidRootPart.Position.Z) * CFrame.Angles(0, 0, 0),
                            }
                            shootRemote:FireServer(unpack(args))
                            reloadRemote:FireServer()
                        end
                    end
                    for _,v in next, workspace.animals:GetChildren() do
                        if v:FindFirstChild("HumanoidRootPart") then
                            local args = {
                                [1] = CFrame.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y, v.HumanoidRootPart.Position.Z) * CFrame.Angles(0, 0, 0),
                                [2] = CFrame.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y, v.HumanoidRootPart.Position.Z) * CFrame.Angles(0, 0, 0),
                            }
                            shootRemote:FireServer(unpack(args))
                            reloadRemote:FireServer()
                        end
                    end
                end
            end
            task.wait()
        end
    end)
end)

about:Toggle("子弹追踪(锁头)", "BulletTracking", false, function(state)
    local localPlayer = game.Players.LocalPlayer
    localPlayer.KillAura = state
    
    spawn(function()
        while localPlayer.KillAura do
            if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("remotes")
                if remotes then
                    local shootRemote = remotes:FindFirstChild("shoot")
                    if shootRemote then
                        for _, scp in ipairs(workspace.scps:GetChildren()) do
                            local HitPart = scp:FindFirstChild("HumanoidRootPart") or scp:FindFirstChild("Head")
                            if HitPart and scp:FindFirstChildWhichIsA("Humanoid") and scp.Humanoid.Health > 0 then
                                shootRemote:FireServer(HitPart.CFrame + Vector3.new(0, 0.5, 0), HitPart.CFrame)
                            end
                        end
                        for _, animal in ipairs(workspace.animals:GetChildren()) do
                            local HitPart = animal:FindFirstChild("HumanoidRootPart") or animal:FindFirstChild("Head")
                            if HitPart and animal:FindFirstChildWhichIsA("Humanoid") and animal.Humanoid.Health > 0 then
                                shootRemote:FireServer(HitPart.CFrame + Vector3.new(0, 0.5, 0), HitPart.CFrame)
                            end
                        end
                    end
                end
            end
            task.wait()
        end
    end)
end)

about:Toggle("自动传送最近的木头", "AutoTpWood", false, function(state)
    local localPlayer = game.Players.LocalPlayer
    localPlayer.AutoTpPine = state
    
    spawn(function()
        while localPlayer.AutoTpPine do
            local function findClosestPine()
                local closest = nil
                local closestDistance = math.huge
                if workspace:FindFirstChild("pines") then
                    for _, pine in pairs(workspace.pines:GetChildren()) do
                        if pine:FindFirstChild("PrimaryPart") then
                            local distance = (localPlayer.Character.HumanoidRootPart.Position - pine.PrimaryPart.Position).magnitude
                            if distance < closestDistance then
                                closestDistance = distance
                                closest = pine
                            end
                        end
                    end
                end
                return closest
            end
            
            local closestPine = findClosestPine()
            if closestPine and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = closestPine.PrimaryPart.Position
                localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(targetPosition.X, targetPosition.Y - 30, targetPosition.Z))
                localPlayer.Character.HumanoidRootPart.Anchored = localPlayer.AutoTpPine
            end
            task.wait()
        end
    end)
end)

about:Toggle("开启无限模式", "InfiniteMode", false, function(state)
    local infiniteValue = workspace:FindFirstChild("infinite")
    if infiniteValue then
        infiniteValue.Value = state
    end
end)

about:Toggle("开启雨天", "RainMode", false, function(state)
    local rainingValue = workspace:FindFirstChild("raining")
    if rainingValue then
        rainingValue.Value = state
    end
end)

about:Toggle("当前天数和手表时间", "TimeDisplay", false, function(state)
    if state then
        local currentDay = workspace:FindFirstChild("current_day")
        local waited = workspace:FindFirstChild("waited")
        
        if currentDay and waited then
            txtf("UpdateLine", "Left", "当前天数" .. currentDay.Value)
            txtf("UpdateLine", "Left", "当前时间" .. waited.Value)
        end
    else
        txtf("ClearText")
    end
end)

about:Toggle("自动拾取飞机残骸", "AutoCollectHeli", false, function(state)
    local localPlayer = game.Players.LocalPlayer
    localPlayer.AutoHeli = state
    
    spawn(function()
        while localPlayer.AutoHeli do
            if workspace:FindFirstChild("interact") then
                for _,v in next, workspace.interact:GetChildren() do
                    if v.Name == "heli" and v:FindFirstChild("Body") then
                        local prompt = v.Body:FindFirstChild("ProximityPrompt")
                        if prompt then
                            fireproximityprompt(prompt)
                        end
                    end
                end
            end
            task.wait()
        end
    end)
end)

 local UITab84 = win:Tab("自然灾害",'16060333448')

local about = UITab84:section("『功能』",true)

about:Button("自动农场胜出", "ToggleInfo", false, function(bool)
    _G.autowinfarm = bool;
    while wait(.1) do
        if _G.autowinfarm == true then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-236, 180, 360, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        end
end
end)
about:Toggle("地图投票用户界面", "t", false, function(Value)
		plr.PlayerGui.MainGui.MapVotePage.Visible = Value
	end)

local nextdis
about:Toggle("预测灾害", "t", false, function(val)
		nextdis = val

		while wait(1) and nextdis do
			local SurvivalTag = plr.Character:FindFirstChild("SurvivalTag")
			if SurvivalTag then
				if SurvivalTag.Value == "Blizzard" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：暴风雪"
				elseif SurvivalTag.Value == "Sandstorm" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：沙尘暴"
				elseif SurvivalTag.Value == "Tornado" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：龙卷风"
				elseif SurvivalTag.Value == "Volcanic Eruption" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：火山"
				elseif SurvivalTag.Value == "Flash Flood" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：洪水"
				elseif SurvivalTag.Value == "Deadly Virus" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：病毒"
				elseif SurvivalTag.Value == "Tsunami" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：海啸"
				elseif SurvivalTag.Value == "Acid Rain" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：酸雨"
				elseif SurvivalTag.Value == "Fire" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：火焰"
				elseif SurvivalTag.Value == "Meteor Shower" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：流星雨"
				elseif SurvivalTag.Value == "Earthquake" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：地震"
				elseif SurvivalTag.Value == "Thunder Storm" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：暴风雨"
				else
					Message.Visible = false
				end
			end
		end
	end)

about:Toggle("地图投票用户界面", "Map Voting UI", false, function(bool)
if bool == false then do game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible = false
    end
end
if bool == true then do game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible = true
    end
end
end)

about:Toggle("在水上行走", "ToggleInfo", false, function(bool)
 if bool == false then do game.Workspace.WaterLevel.CanCollide = false
                            game.Workspace.WaterLevel.Size = Vector3.new(10, 1, 10)
                        end
                    end
                    if bool == true then do game.Workspace.WaterLevel.CanCollide = true
                            game.Workspace.WaterLevel.Size = Vector3.new(5000, 1, 5000)
                        end
                    end
end)

about:Toggle("游戏岛悬崖碰撞", "Togglelnfo", false, function(bool)
for i, v in pairs (game.workspace:GetDescendants())do
                                if v.Name == 'LowerRocks' then
                                    v.CanCollide = bool
                                end
                            end
end)

about:Toggle("禁用坠落损坏",function()
local FallDamageScript = (game.Players.LocalPlayer.Character ~= nil) and game.Players.LocalPlayer.Character:FindFirstChild("FallDamageScript") or nil
                                if FallDamageScript then
                                FallDamageScript:Destroy()
                                end
end)

about:Toggle("自动禁用坠落伤害", "Toggleelnfo", false, function(bool)
_G.NoFallDamage = bool;
                            while wait(0.5) do
                                    if _G.NoFallDamage == true then
                            local FallDamageScript = (game.Players.LocalPlayer.Character ~= nil) and game.Players.LocalPlayer.Character:FindFirstChild("FallDamageScript") or nil
                            if FallDamageScript then
                            FallDamageScript:Destroy()
                            end end end
end)

about:Button("打印下一次灾难(/console)",function()
warn(game.Players.LocalPlayer.Character.SurvivalTag.Value)
end)

about:Button("移除灾难界面(暴风雪和沙尘暴)",function()
game.Players.LocalPlayer.PlayerGui.BlizzardGui:destroy()
		game.Players.LocalPlayer.PlayerGui.SandStormGui:destroy()
end)

about:Button("传送到地图",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-115.828506, 65.4863434, 18.8461514, 0.00697017973, 0.0789371505, -0.996855199, -3.13589936e-07, 0.996879458, 0.0789390653, 0.999975681, -0.000549906865, 0.00694845384)
end)

about:Button("游戏岛",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-83.5, 38.5, -27.5, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

about:Button("产卵塔",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-280, 170, 341, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)
about:Button(
    "自然灾害-高级脚本",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/9NLK7/93qjoadnlaknwldk/main/main"))()
    end
)
about:Button(
    "黑洞脚本（按E）",
    function()
        local UserInputService = game:GetService("UserInputService")
        local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
        local Folder = Instance.new("Folder", game:GetService("Workspace"))
        local Part = Instance.new("Part", Folder)
        local Attachment1 = Instance.new("Attachment", Part)
        Part.Anchored = true
        Part.CanCollide = false
        Part.Transparency = 1
        local Updated = Mouse.Hit + Vector3.new(0, 5, 0)
        local NetworkAccess =
            coroutine.create(
            function()
                settings().Physics.AllowSleep = false
                while game:GetService("RunService").RenderStepped:Wait() do
                    for _, Players in next, game:GetService("Players"):GetPlayers() do
                        if Players ~= game:GetService("Players").LocalPlayer then
                            Players.MaximumSimulationRadius = 0
                            sethiddenproperty(Players, "SimulationRadius", 0)
                        end
                    end
                    game:GetService("Players").LocalPlayer.MaximumSimulationRadius = math.pow(math.huge, math.huge)
                    setsimulationradius(math.huge)
                end
            end
        )
        coroutine.resume(NetworkAccess)

        local function EnhanceAndInvinciblePart(part)
            if
                part:IsA("Part") and part.Anchored == false and part.Parent:FindFirstChild("Humanoid") == nil and
                    part.Parent:FindFirstChild("Head") == nil and
                    part.Name ~= "Handle"
             then
                Mouse.TargetFilter = part
                for _, x in next, part:GetChildren() do
                    if
                        x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or
                            x:IsA("BodyThrust") or
                            x:IsA("BodyVelocity") or
                            x:IsA("RocketPropulsion")
                     then
                        x:Destroy()
                    end
                end
                if part:FindFirstChild("Attachment") then
                    part:FindFirstChild("Attachment"):Destroy()
                end
                if part:FindFirstChild("AlignPosition") then
                    part:FindFirstChild("AlignPosition"):Destroy()
                end
                if part:FindFirstChild("Torque") then
                    part:FindFirstChild("Torque"):Destroy()
                end
                part.CanCollide = false
                local Torque = Instance.new("Torque", part)
                Torque.Torque = Vector3.new(100000, 100000, 100000)
                local AlignPosition = Instance.new("AlignPosition", part)
                local Attachment2 = Instance.new("Attachment", part)
                Torque.Attachment0 = Attachment2
                AlignPosition.MaxForce = 9999999999999999
                AlignPosition.MaxVelocity = math.huge
                AlignPosition.Responsiveness = 200
                AlignPosition.Attachment0 = Attachment2
                AlignPosition.Attachment1 = Attachment1
            end
        end

        for _, part in next, game:GetService("Workspace"):GetDescendants() do
            EnhanceAndInvinciblePart(part)
        end

        game:GetService("Workspace").DescendantAdded:Connect(
            function(part)
                EnhanceAndInvinciblePart(part)
            end
        )
        -- 监听按键事件
        UserInputService.InputBegan:Connect(
            function(input, isProcessed)
                if input.KeyCode == Enum.KeyCode.E and not isProcessed then
                    Updated = Mouse.Hit + Vector3.new(0, 5, 0)
                end
            end
        )

        -- 使用物理引擎移动所有物体
        spawn(
            function()
                while game:GetService("RunService").RenderStepped:Wait() do
                    Attachment1.WorldCFrame = Updated
                end
            end
        )
    end
)
about:Button(
    "自然灾害-1脚本",
    function()
        loadstring(
            game:HttpGet(
                "https://gist.githubusercontent.com/TurkOyuncu99/7c75386107937fa006304efd24543ad4/raw/8d759dfcd95d39949c692735cfdf62baec0bf835/cafwetweg",
                true
            )
        )()
    end
)
about:Button(
    "自然灾害-2脚本",
    function()
        loadstring(
            game:HttpGet(
                "https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/    loadstringUjHI6RQpz2o8",
                true
            )
        )()
    end
)
about:Button(
    "自然灾害-3脚本",
    function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"), true))()
    end
)
local UITab84 = win:Tab("造船寻宝",'16060333448')

local about = UITab84:section("『功能』",true)
    
    about:Toggle(
    "自动刷金币",
    "text",
    false,
    function(FARM)
        _G.FARMs = FARM
        while _G.FARMs do
            wait()
            pcall(
                function()
                    game.Workspace.Gravity = 0
                    wait(0.5)
                    local TweenService = game:GetService("TweenService")
                    local Tw =
                        TweenService:Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {
                            CFrame = CFrame.new(
                                -51.05019,
                                43.5682182,
                                702.193481,
                                -0.999886811,
                                -0.000135422233,
                                0.0150433034,
                                8.65181704e-09,
                                0.999959469,
                                0.00900237076,
                                -0.0150439134,
                                0.00900135189,
                                -0.999846339
                            )
                        }
                    ):Play()
                    wait(1)
                    local TweenService = game:GetService("TweenService")
                    local Tw =
                        TweenService:Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(30, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {
                            CFrame = CFrame.new(
                                -50.4467354,
                                34.108551,
                                8676.95117,
                                -0.999937415,
                                -0.000405743311,
                                0.0111814411,
                                -6.1212857e-09,
                                0.999342263,
                                0.0362627953,
                                -0.0111888004,
                                0.0362605266,
                                -0.999279737
                            )
                        }
                    ):Play()
                    wait(30)
                    local TweenService = game:GetService("TweenService")
                    local Tw =
                        TweenService:Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {
                            CFrame = CFrame.new(
                                -54.1517258,
                                -359.077667,
                                9497.03418,
                                -0.99982208,
                                0.00359633542,
                                -0.0185163822,
                                -7.16419102e-09,
                                0.981655717,
                                0.190661997,
                                0.0188623965,
                                0.190628082,
                                -0.981481075
                            )
                        }
                    ):Play()
                    wait(5)
                    game.Workspace.Gravity = 200
                    wait(20)
                end
            )
        end
    end
)
about:Toggle(
    "自动刷金币快速版",
    "text",
    false,
    function(FARM2)
        _G.FARM2s = FARM2
        while _G.FARM2s do
            wait()
            pcall(
                function()
                    game.Workspace.Gravity = 0
                    wait(0.5)
                    local TweenService = game:GetService("TweenService")
                    local Tw =
                        TweenService:Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {
                            CFrame = CFrame.new(
                                -51.05019,
                                43.5682182,
                                702.193481,
                                -0.999886811,
                                -0.000135422233,
                                0.0150433034,
                                8.65181704e-09,
                                0.999959469,
                                0.00900237076,
                                -0.0150439134,
                                0.00900135189,
                                -0.999846339
                            )
                        }
                    ):Play()
                    wait(1)
                    local TweenService = game:GetService("TweenService")
                    local Tw =
                        TweenService:Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {
                            CFrame = CFrame.new(
                                -50.4467354,
                                34.108551,
                                8676.95117,
                                -0.999937415,
                                -0.000405743311,
                                0.0111814411,
                                -6.1212857e-09,
                                0.999342263,
                                0.0362627953,
                                -0.0111888004,
                                0.0362605266,
                                -0.999279737
                            )
                        }
                    ):Play()
                    wait(5)
                    local TweenService = game:GetService("TweenService")
                    local Tw =
                        TweenService:Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {
                            CFrame = CFrame.new(
                                -51.05019,
                                43.5682182,
                                702.193481,
                                -0.999886811,
                                -0.000135422233,
                                0.0150433034,
                                8.65181704e-09,
                                0.999959469,
                                0.00900237076,
                                -0.0150439134,
                                0.00900135189,
                                -0.999846339
                            )
                        }
                    ):Play()
                    wait(5)
                    local Event = game:GetService("Workspace").ClaimRiverResultsGold
                    Event:FireServer()
                    wait(0.1)
                    game.Players.LocalPlayer.Character.Humanoid.Health = -1000
                    wait(0.1)
                    game.Workspace.Gravity = 200
                    wait(7)
                end
            )
        end
    end
)
about:Toggle(
    "自动索赔金币",
    "text",
    false,
    function(GlaimGold)
        _G.ClaimGolds = ClaimGold
        while _G.ClaimGolds do
            wait()
            pcall(
                function()
                    local Event = game:GetService("Workspace").ClaimRiverResultsGold
                    Event:FireServer()
                end
            )
        end

        MainSection:Button(
            "ClearAllBoatParts",
            function()
                local Event = game:GetService("Workspace").ClearAllPlayersBoatParts
                Event:FireServer()
            end
        )

        wait(0.5)
        local ba = Instance.new("ScreenGui")
        local ca = Instance.new("TextLabel")
        local da = Instance.new("Frame")
        local _b = Instance.new("TextLabel")
        local ab = Instance.new("TextLabel")
        ba.Parent = game.CoreGui
        ba.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        ca.Parent = ba
        ca.Active = true
        ca.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
        ca.Draggable = true
        ca.Position = UDim2.new(0.698610067, 0, 0.098096624, 0)
        ca.Size = UDim2.new(0, 370, 0, 52)
        ca.Font = Enum.Font.SourceSansSemibold
        ca.Text = "Anti AFK Script"
        ca.TextColor3 = Color3.new(0, 1, 1)
        ca.TextSize = 22
        da.Parent = ca
        da.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
        da.Position = UDim2.new(0, 0, 1.0192306, 0)
        da.Size = UDim2.new(0, 370, 0, 107)
        _b.Parent = da
        _b.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
        _b.Position = UDim2.new(0, 0, 0.800455689, 0)
        _b.Size = UDim2.new(0, 370, 0, 21)
        _b.Font = Enum.Font.Arial
        _b.Text = "made by simon"
        _b.TextColor3 = Color3.new(0, 1, 1)
        _b.TextSize = 20
        ab.Parent = da
        ab.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
        ab.Position = UDim2.new(0, 0, 0.158377, 0)
        ab.Size = UDim2.new(0, 370, 0, 44)
        ab.Font = Enum.Font.ArialBold
        ab.Text = "Status: Active"
        ab.TextColor3 = Color3.new(0, 1, 1)
        ab.TextSize = 20

        local bb = game:service "VirtualUser"
        game:service "Players".LocalPlayer.Idled:connect(
            function()
                bb:CaptureController()
                bb:ClickButton2(Vector2.new())
                ab.Text = "机器人想踢你，但我踢了他"
                wait(2)
                ab.Text = "状态：Active"
            end
        )
    end
)

about:Button(
    "无限方块（假）",
    function()
        spawn(
            function()
                local guiinf =
                    game:GetService("Players").LocalPlayer.PlayerGui.BuildGui.InventoryFrame.ScrollingFrame.BlocksFrame
                _G.Blocks = false
                while game:GetService("RunService").RenderStepped:wait() do
                    if _G.Blocks then
                        return
                    end
                    for i, v in pairs(guiinf:GetDescendants()) do
                        if v.Name == "AmountText" then
                            v.Text = math.huge
                        end
                    end
                end
            end
        )
    end
)

about:Button(
    "变蔡徐坤😎😎😎",
    function()
        local players = game:GetService("Players")
        local client = players.LocalPlayer
        local Chicken = workspace:WaitForChild("ChangeCharacter")
        Chicken:FireServer("ChickenCharacter")
    end
)
about:Button(
    "变成企鹅🤮🤮🤮",
    function()
        local players = game:GetService("Players")
        local client = players.LocalPlayer
        local penguin = workspace:WaitForChild("ChangeCharacter")
        penguin:FireServer("PenguinCharacter")
    end
)
about:Button(
    "变死狐狸🤮🤮🤮",
    function()
        local players = game:GetService("Players")
        local client = players.LocalPlayer
        local fox = workspace:WaitForChild("ChangeCharacter")
        fox:FireServer("FoxCharacter")
    end
)
local UITab84 = win:Tab("监狱人生",'16060333448')

local about = UITab84:section("『功能』",true)
    about:Toggle("开启杀戮气场","state",false,function(s)
States.KillAura = state
        if state then
            notifications:notify{
            Title = "司黎明中心",
            Description = "关闭杀戮气场",
            Icon = 6031302918,
            Accept = {
                Text = "好的",
                Callback = function()
                    print("云");print("山");print("清风");print("忍")
                end
            },
            Length = 10
        }
            CreateKillPart()
        else
            notifications:notify{
            Title = "司黎明中心",
            Description = "开启杀戮气场",
            Icon = 6031302918,
            Accept = {
                Text = "好的",
                Callback = function()
                    print("云");print("山");print("清风");print("忍")
                end
            },
            Length = 10
        }
            if Parts[1] and Parts[1].Name == "KillAura" then
                Parts[1]:Destroy()
                Parts[1] = nil
            end
         end
        end)
        
        function CreateKillPart()
            if Parts[1] then
             pcall(function()
                 Parts[1]:Destroy()
             end)
             Parts[1] = nil
        end
        local Part = Instance.new("Part",plr.Character)
        local hilight = Instance.new("Highlight",Part)
        hilight.FillTransparency = 1
    
        Part.Anchored = true
        Part.CanCollide = false
        Part.CanTouch = false
        Part.Material = Enum.Material.SmoothPlastic
        Part.Transparency = .98
        Part.Material = Enum.Material.SmoothPlastic
        Part.BrickColor = BrickColor.White()
        Part.Size = Vector3.new(20,2,20)
        Part.Name = "KillAura"
        Parts[1] = Part
        end
    
        task.spawn(function()
        repeat task.wait()until plr.Character and char and char:FindFirstChildOfClass("Humanoid")
    
        if States.KillAura then
            CreateKillPart()
        end
      end)
      
    game:GetService("RunService").Stepped:Connect(function()
        if States.KillAura then
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    if (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude <14 and v.Character.Humanoid.Health >0 then
                        local args = {
                            [1] = v
                        }
                        for i =1,2 do
                            task.spawn(function()
                                game:GetService("ReplicatedStorage").meleeEvent:FireServer(unpack(args))
                            end)
                        end
    
                    end
                end
            end
        end
end)
game:GetService("RunService").Stepped:Connect(function()
        if States.KillAura then
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    if (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude <14 and v.Character.Humanoid.Health >0 then
                        local args = {
                            [1] = v
                        }
                        for i =1,2 do
                            task.spawn(function()
                                game:GetService("ReplicatedStorage").meleeEvent:FireServer(unpack(args))
                            end)
                        end
    
                    end
                end
            end
        end  
     end)
     wait(1)
about:Toggle("自动杀所有人","text",false,function(state)
if state then
                print("Toggle On")
                isAutoKillRunning = true
                spawn(AutoKillLoop)
                spawn(AutoJump) -- Start the automatic jump function
            else
                print("Toggle Off")
                isAutoKillRunning = false
            end
end)
about:Toggle("删除门🚪","text",false,function(state)
if state then
        print("Toggle On")
        for i,v in pairs(workspace.Doors:GetChildren()) do
             v.Parent = game:service"ReplicatedStorage".nikodoors
    
        end
    else
        print("Toggle Off")
        for i,v in pairs(game:service"ReplicatedStorage".nikodoors:GetChildren()) do
            v.Parent = workspace.Doors
        end
    end
end)
about:Toggle("逮捕所有罪犯", function()
    wait(0.1)
	Player = game.Players.LocalPlayer
	Pcf = Player.Character.HumanoidRootPart.CFrame
	for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
		if v.Name ~= Player.Name then
			local i = 10
			repeat
				wait()
				i = i-1
				game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
				Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
			until i == 0
		end
	end
end)

about:Button("变成警察", function()
workspace.Remote.TeamEvent:FireServer("Bright blue");
end)

about:Button("变成囚犯", function()
workspace.Remote.TeamEvent:FireServer("Bright orange");
end)

local MT = getrawmetatable(game)
local __namecall = MT.__namecall
setreadonly(MT, false)
MT.__namecall = newcclosure(function(self, ...)
    local Method = getnamecallmethod()
    if Method == "FindPartOnRay" and not checkcaller() and tostring(getfenv(0).script) == "GunInterface" then
        local Character = ClosestChar()
        if Character then
            return Character.Torso, Character.Torso.Position
        end
    end

    return __namecall(self, ...)
end)
setreadonly(MT, true)
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
about:Button("无敌模式",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/LdTVujTA"))()
end)
about:Button(
    "杀死所有人",
    function()
        loadstring(game:HttpGet("https://pastebin.com/raw/kXjfpFPh"))()
    end
)
about:Button(
    "无敌神器（拿上范围秒杀）",
    function()
        loadstring(game:HttpGet("https://pastebin.com/raw/mSLiAZHk"))()
    end
)
about:Button(
    "变钢铁侠",
    function()
        loadstring(game:HttpGet("https://pastebin.com/raw/7prijqYH"))()
    end
)
about:Button(
    "变死神",
    function()
        loadstring(game:HttpGet("https://pastebin.com/ewv9bbRp"))()
    end
)
about:Button(
    "变车模型",
    function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zLe3e4BS"))()
    end
)


about:Button(
    "PRISONWARE V1.3",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))()
    end
)
about:Button(
    "红该 脚本",
    function()
        loadstring(game:HttpGetAsync("https://pastebin.com/raw/fYMnAEeJ"))()
        --紅该 脚本--
    end
)
about:Button(
    "Tiger脚本",
    function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/h17s3/TIGERADMIN/main/TIGERADMINSCRIPTFREE"), true))(

        )
    end
)
about:Button(
    "Moon脚本（不知道有什么用）",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IlikeyocutgHAH12/MoonUI-v10-/main/MoonUI%20v10"))()
    end
)
about:Button(
    "1脚本",
    function()
        -- This Script isn't mine credits to the owner.
        -- Works on krnl,Synapse,Sirhurt And other.
        loadstring(game:HttpGet("https://pastebin.com/raw/mHfK0Xk4", true))()
    end
)
about:Button(
    "2脚本",
    function()
        getgenv().http_request = http_request or request or (http and http.request) or syn.request
        repeat
        until http_request
        loadstring(
            http_request(
                {
                    Url = "https://raw.githubusercontent.com/alphaalt0409/WEIRDAPPLEBEEPANEL/main/weirdapplebee.lua",
                    Method = "GET"
                }
            ).Body
        )()
    end
)

about:Button(
    "警卫室",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(847.7261352539062, 98.95999908447266, 2267.387451171875)
    end
)
about:Button(
    "监狱室内",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(919.2575073242188, 98.95999908447266, 2379.74169921875)
    end
)
about:Button(
    "罪犯复活点",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-937.5891723632812, 93.09876251220703, 2063.031982421875)
    end
)
about:Button(
    "监狱室外",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(760.6033325195312, 96.96992492675781, 2475.405029296875)
    end
)

local UITab84 = win:Tab("河北唐县",'16060333448')

local about = UITab84:section("『功能』",true)

about:Label("需要先成为送货司机，才能自动刷钱")

local function autoFarm()
    while _G.autoFarm do
        local clickDetector = game:GetService("Workspace").DeliverySys.Misc["Package Pile"].ClickDetector
        if clickDetector then
            local success, errorMsg = pcall(function()
                fireclickdetector(clickDetector)
            end)
            if not success then
                warn("Failed to fire ClickDetector: " .. errorMsg)
            end
        else
            warn("ClickDetector not found!")
        end
        
        task.wait(2.2)

        local deliveryPoints = game:GetService("Workspace").DeliverySys.DeliveryPoints:GetChildren()
        local delivered = false
        for _, point in ipairs(deliveryPoints) do
            if point:FindFirstChild("Locate") and point.Locate.Locate.Enabled then
                local hrp = game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CFrame = point.CFrame
                    delivered = true
                    break
                end
            end
        end
        
        if not delivered then
            warn("No delivery point found!")
        end

        task.wait(0)
    end
end

about:Toggle("自动刷钱", "AutoFarm", false, function(enabled)
    _G.autoFarm = enabled
    
    if enabled then
        if not _G.autoFarmThread or not _G.autoFarmThread.Running then
            _G.autoFarmThread = coroutine.create(autoFarm)
            coroutine.resume(_G.autoFarmThread)
        end
    else
        if _G.autoFarmThread and _G.autoFarmThread.Running then
            coroutine.close(_G.autoFarmThread)
        end
    end
end)

about:Label("变身功能")

about:Button("变成警察(需要先购买警察通行证)", function()
    local args = {[1] = "Police"}
    game:GetService("ReplicatedStorage").TeamSwitch:FireServer(unpack(args))
end)

about:Button("变成平民", function()
    local args = {[1] = "Civilian"}
    game:GetService("ReplicatedStorage").TeamSwitch:FireServer(unpack(args))
end)

about:Button("变成混合冰淇淋", function()
    local args = {[1] = "Mixue Ice Cream"}
    game:GetService("ReplicatedStorage").TeamSwitch:FireServer(unpack(args))
end)

about:Button("变成咖啡师", function()
    local args = {[1] = "Teawen Barista"}
    game:GetService("ReplicatedStorage").TeamSwitch:FireServer(unpack(args))
end)

about:Button("变成送货司机", function()
    local args = {[1] = "Delivery Driver"}
    game:GetService("ReplicatedStorage").TeamSwitch:FireServer(unpack(args))
end)

about:Button("变成出租车司机", function()
    local args = {[1] = "Taxi Driver"}
    game:GetService("ReplicatedStorage").TeamSwitch:FireServer(unpack(args))
end)

about:Button("变成线上计程车", function()
    local args = {[1] = "Ole Online Taxi Sharing"}
    game:GetService("ReplicatedStorage").TeamSwitch:FireServer(unpack(args))
end)

about:Button("变成卡车司机", function()
    local args = {[1] = "Trucker"}
    game:GetService("ReplicatedStorage").TeamSwitch:FireServer(unpack(args))
end)

about:Button("变成超市收银员", function()
    local args = {[1] = "Grocery Cashier"}
    game:GetService("ReplicatedStorage").TeamSwitch:FireServer(unpack(args))
end)

about:Button("变成罪犯", function()
    local args = {[1] = "Criminal"}
    game:GetService("ReplicatedStorage").TeamSwitch:FireServer(unpack(args))
end)

about:Button("变成学生", function()
    local args = {[1] = "Student"}
    game:GetService("ReplicatedStorage").TeamSwitch:FireServer(unpack(args))
end)

about:Button("变成老师", function()
    local args = {[1] = "Teacher"}
    game:GetService("ReplicatedStorage").TeamSwitch:FireServer(unpack(args))
end)

about:Button("变成商店员工", function()
    local args = {[1] = "Store Worker"}
    game:GetService("ReplicatedStorage").TeamSwitch:FireServer(unpack(args))
end)

about:Button("变成变pao商店工人", function()
    local args = {[1] = "Pao Store Worker"}
    game:GetService("ReplicatedStorage").TeamSwitch:FireServer(unpack(args))
end)

about:Button("变成救援人员", function()
    local args = {[1] = "Paramedic"}
    game:GetService("ReplicatedStorage").TeamSwitch:FireServer(unpack(args))
end)

about:Button("变成巴车司机", function()
    local args = {[1] = "Bus Driver"}
    game:GetService("ReplicatedStorage").TeamSwitch:FireServer(unpack(args))
end)

about:Label("传送")

about:Button("警察局", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5513.97412109375, 8.656171798706055, 4964.291015625)
end)

about:Button("出生点", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3338.31982421875, 10.048742294311523, 3741.84033203125)
end)

about:Button("医院", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5471.482421875, 14.149418830871582, 4259.75341796875)
end)

about:Button("手机店", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6789.2041015625, 11.197686195373535, 1762.687255859375)
end)

about:Button("火锅店", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5912.84765625, 12.217276573181152, 1058.29443359375)
end)

about:Button("蜜雪冰城",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6984.87158203125, 9.332854270935059, 1734.770751953125)
end)

about:Button("小区",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2187.541259765625, 22.092992782592773, -636.7048950195312)
end)

about:Button("洗车店",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2578.51025390625, 23.332923889160156, -588.5584716796875)
end)

about:Button("卡车召唤地",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(10559.13671875, 39.31748580932617, 3236.519287109375)
end)

about:Button("庆都山山顶",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15042.9033203125, 325.29852294921875, 22355.177734375)
end)

about:Button("庆都山山底",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15580.1357421875, 8.09992790222168, 21171.939453125)
end)

about:Button("小学",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-13888.138671875, 10.943490982055664, 11059.0458984375)
end)

about:Button("签挂美食",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10332.763671875, 10.43997859954834, 7114.16064453125)
end)

about:Button("驾校",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8912.12109375, 9.963741302490234, 7302.568359375)
end)

local UITab4 = win:Tab("『力量传奇』",'7734068321')

local about = UITab4:section("『力量传奇』",true)

about:Toggle("自动比赛开关", "AR", false, function(AR)
  while AR do wait() wait(2) game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl") end
end)
about:Toggle("自动举哑铃", "ATYL", false, function(ATYL)
  local part = Instance.new('Part', workspace) part.Size = Vector3.new(500, 20, 530.1) part.Position = Vector3.new(0, 100000, 133.15) part.CanCollide = true part.Anchored = true local rs = game:GetService("RunService").RenderStepped while ATYL do wait() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0) for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v.ClassName == "Tool" and v.Name == "Weight" then v.Parent = game.Players.LocalPlayer.Character end end game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep") end
end)
about:Toggle("自动俯卧撑", "ATFWC", false, function(ATFWC)
  local part = Instance.new('Part', workspace) part.Size = Vector3.new(500, 20, 530.1) part.Position = Vector3.new(0, 100000, 133.15) part.CanCollide = true part.Anchored = true local rs = game:GetService("RunService").RenderStepped while ATFWC do wait() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0) for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v.ClassName == "Tool" and v.Name == "Pushups" then v.Parent = game.Players.LocalPlayer.Character end end game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep") end
end)
about:Toggle("自动仰卧起坐", "ATYWQZ", false, function(ATYWQZ)
  local part = Instance.new('Part', workspace) part.Size = Vector3.new(500, 20, 530.1) part.Position = Vector3.new(0, 100000, 133.15) part.CanCollide = true part.Anchored = true local rs = game:GetService("RunService").RenderStepped while ATYWQZ do wait() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0) for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v.ClassName == "Tool" and v.Name == "Situps" then v.Parent = game.Players.LocalPlayer.Character end end end game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
end)
about:Toggle("自动倒立身体", "ATDL", false, function(ATDL)
  local part = Instance.new('Part', workspace) part.Size = Vector3.new(500, 20, 530.1) part.Position = Vector3.new(0, 100000, 133.15) part.CanCollide = true part.Anchored = true local rs = game:GetService("RunService").RenderStepped while ATDL do wait() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0) for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v.ClassName == "Tool" and v.Name == "Handstands" then v.Parent = game.Players.LocalPlayer.Character end end end game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
end)
about:Toggle("自动锻炼", "ATAAA", false, function(ATAAA)
  local part = Instance.new('Part', workspace) part.Size = Vector3.new(500, 20, 530.1) part.Position = Vector3.new(0, 100000, 133.15) part.CanCollide = true part.Anchored = true while ATAAA do wait() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0) for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v.ClassName == "Tool" and v.Name == "Handstands" or v.Name == "Situps" or v.Name == "Pushups" or v.Name == "Weight" then v:FindFirstChildOfClass("NumberValue").Value = 0 repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool") game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v) game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep") end end end
end)

about:Toggle("自动重生", "ATRE", false, function(ATRE)
  while ATRE do wait() game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest") end
end)
about:Button("收集宝石", function()
  jk = {} for _, v in pairs(game:GetService("ReplicatedStorage").chestRewards:GetDescendants()) do if v.Name ~= "Light Karma Chest" or v.Name ~= "Evil Karma Chest" then table.insert(jk, v.Name) end end for i = 1, #jk do wait(2) game:GetService("ReplicatedStorage").rEvents.checkChestRemote:InvokeServer(jk[i]) end
end)

about:Toggle("沙滩跑步机10", "PPJ10", false, function(PPJ10)
    getgenv().PPJ10 = PPJ10 while getgenv().PPJ10 do wait() game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10 game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(238.671112, 5.40315914, 387.713165, -0.0160072874, -2.90710176e-08, -0.99987185, -3.3434191e-09, 1, -2.90212157e-08, 0.99987185, 2.87843993e-09, -0.0160072874) local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame local RunService = game:GetService("RunService") local Players = game:GetService("Players") local localPlayer = Players.LocalPlayer RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() if localPlayer.Character then local humanoid = localPlayer.Character:WaitForChild("Humanoid") if humanoid then humanoid:Move(Vector3.new(10000, 0, -1), true) end end end) end if not getgenv().PPJ10 then local RunService = game:GetService("RunService") local Players = game:GetService("Players") local localPlayer = Players.LocalPlayer RunService:UnbindFromRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() if localPlayer.Character then local humanoid = localPlayer.Character:FindFirstChild("Humanoid") if humanoid then humanoid:Move(Vector3.new(10000, 0, -1), true) end end end) end
end)
about:Toggle("健身房跑步机2000", "PPJ2000", false, function(PPJ2000)
    if game.Players.LocalPlayer.Agility.Value >= 2000 then getgenv().PPJ2000 = PPJ2000 while getgenv().PPJ2000 do wait() game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10 game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-3005.37866, 14.3221855, -464.697876, -0.015773816, -1.38508964e-08, 0.999875605, -5.13225586e-08, 1, 1.30429667e-08, -0.999875605, -5.11104332e-08, -0.015773816) local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame local RunService = game:GetService("RunService") local Players = game:GetService("Players") local localPlayer = Players.LocalPlayer RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() if localPlayer.Character then local humanoid = localPlayer.Character:WaitForChild("Humanoid") if humanoid then humanoid:Move(Vector3.new(10000, 0, -1), true) end end end) end end if not getgenv().PPJ2000 then local RunService = game:GetService("RunService") local Players = game:GetService("Players") local localPlayer = Players.LocalPlayer RunService:UnbindFromRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() if localPlayer.Character then local humanoid = localPlayer.Character:FindFirstChild("Humanoid") if humanoid then humanoid:Move(Vector3.new(10000, 0, -1), true) end end end) end
end)
about:Toggle("神话健身房跑步机2000", "SHPPJ2000", false, function(SHPPJ2000)
    if game.Players.LocalPlayer.Agility.Value >= 2000 then getgenv().SHPPJ2000 = SHPPJ2000 while getgenv().SHPPJ2000 do wait() game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10 game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2571.23706, 15.6896839, 898.650391, 0.999968231, 2.23868635e-09, -0.00797206629, -1.73198844e-09, 1, 6.35660768e-08, 0.00797206629, -6.3550246e-08, 0.999968231) local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame local RunService = game:GetService("RunService") local Players = game:GetService("Players") local localPlayer = Players.LocalPlayer RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() if localPlayer.Character then local humanoid = localPlayer.Character:WaitForChild("Humanoid") if humanoid then humanoid:Move(Vector3.new(10000, 0, -1), true) end end end) end end if not getgenv().SHPPJ2000 then local RunService = game:GetService("RunService") local Players = game:GetService("Players") local localPlayer = Players.LocalPlayer RunService:UnbindFromRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() if localPlayer.Character then local humanoid = localPlayer.Character:FindFirstChild("Humanoid") if humanoid then humanoid:Move(Vector3.new(10000, 0, -1), true) end end end) end
end)
about:Toggle("永恒健身房跑步机3500", "YHPPJ3500", false, function(YHPPJ3500)
    if game.Players.LocalPlayer.Agility.Value >= 3500 then getgenv().YHPPJ3500 = YHPPJ3500 while getgenv().YHPPJ3500 do wait() game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10 game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-7077.79102, 29.6702118, -1457.59961, -0.0322036594, -3.31122768e-10, 0.99948132, -6.44344267e-09, 1, 1.23684493e-10, -0.99948132, -6.43611742e-09, -0.0322036594) local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame local RunService = game:GetService("RunService") local Players = game:GetService("Players") local localPlayer = Players.LocalPlayer RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() if localPlayer.Character then local humanoid = localPlayer.Character:WaitForChild("Humanoid") if humanoid then humanoid:Move(Vector3.new(10000, 0, -1), true) end end end) end end if not getgenv().YHPPJ3500 then local RunService = game:GetService("RunService") local Players = game:GetService("Players") local localPlayer = Players.LocalPlayer RunService:UnbindFromRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() if localPlayer.Character then local humanoid = localPlayer.Character:FindFirstChild("Humanoid") if humanoid then humanoid:Move(Vector3.new(10000, 0, -1), true) end end end) end
end)
about:Toggle("传奇健身房跑步机3000", "CQPPJ3000", false, function(CQPPJ3000)
    if game.Players.LocalPlayer.Agility.Value >= 3000 then getgenv().CQPPJ3000 = CQPPJ3000 while getgenv().CQPPJ3000 do wait() game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10 game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4370.82812, 999.358704, -3621.42773, -0.960604727, -8.41949266e-09, -0.27791819, -6.12478646e-09, 1, -9.12496567e-09, 0.27791819, -7.06329528e-09, -0.960604727) local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame local RunService = game:GetService("RunService") local Players = game:GetService("Players") local localPlayer = Players.LocalPlayer RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() if localPlayer.Character then local humanoid = localPlayer.Character:WaitForChild("Humanoid") if humanoid then humanoid:Move(Vector3.new(10000, 0, -1), true) end end end) end end if not getgenv().CQPPJ3000 then local RunService = game:GetService("RunService") local Players = game:GetService("Players") local localPlayer = Players.LocalPlayer RunService:UnbindFromRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() if localPlayer.Character then local humanoid = localPlayer.Character:FindFirstChild("Humanoid") if humanoid then humanoid:Move(Vector3.new(10000, 0, -1), true) end end end) end
end)

about:Toggle("石头0", "RK0", false, function(RK0)
    getgenv().RK0 = RK0 while getgenv().RK0 do wait() for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v:IsA("Tool") and v.Name == "Punch" then game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v) end end for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if h:IsA("Tool") and h.Name == "Punch" then h:Activate() end end game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(7.60643005, 4.02632904, 2104.54004, -0.23040159, -8.53662385e-08, -0.973095655, -4.68743764e-08, 1, -7.66279342e-08, 0.973095655, 2.79580536e-08, -0.23040159) end if not getgenv().RK0 then game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools() end
end)
about:Toggle("石头10", "RK10", false, function(RK10)
    if game.Players.LocalPlayer.Durability.Value >= 10 then getgenv().RK10 = RK10 while getgenv().RK10 do wait() for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v:IsA("Tool") and v.Name == "Punch" then game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v) end end for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if h:IsA("Tool") and h.Name == "Punch" then h:Activate() end end game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-157.680908, 3.72453046, 434.871185, 0.923298299, -1.81774684e-09, -0.384083599, 3.45247031e-09, 1, 3.56670582e-09, 0.384083599, -4.61917082e-09, 0.923298299) end if not getgenv().RK10 then game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools() end end
end)
about:Toggle("石头100", "RK100", false, function(RK100)
    if game.Players.LocalPlayer.Durability.Value >= 100 then getgenv().RK100 = RK100 while getgenv().RK100 do wait() for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v:IsA("Tool") and v.Name == "Punch" then game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v) end end for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if h:IsA("Tool") and h.Name == "Punch" then h:Activate() end end game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(162.233673, 3.66615629, -164.686783, -0.921312928, -1.80826774e-07, -0.38882193, -9.13036544e-08, 1, -2.48719346e-07, 0.38882193, -1.93647494e-07, -0.921312928) end if not getgenv().RK100 then game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools() end end
end)
about:Toggle("石头5000", "RK5000", false, function(RK5000)
    if game.Players.LocalPlayer.Durability.Value >= 5000 then getgenv().RK5000 = RK5000 while getgenv().RK5000 do wait() for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v:IsA("Tool") and v.Name == "Punch" then game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v) end end for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if h:IsA("Tool") and h.Name == "Punch" then h:Activate() end end game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(329.831482, 3.66450214, -618.48407, -0.806075394, -8.67358096e-08, 0.591812849, -1.05715522e-07, 1, 2.57029176e-09, -0.591812849, -6.04919563e-08, -0.806075394) end if not getgenv().RK5000 then game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools() end end
end)
about:Toggle("石头150000", "RK150000", false, function(RK150000)
    if game.Players.LocalPlayer.Durability.Value >= 150000 then getgenv().RK150000 = RK150000 while getgenv().RK150000 do wait() for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v:IsA("Tool") and v.Name == "Punch" then game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v) end end for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if h:IsA("Tool") and h.Name == "Punch" then h:Activate() end end game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-2566.78076, 3.97019577, -277.503235, -0.923934579, -4.11600105e-08, -0.382550538, -3.38838042e-08, 1, -2.57576183e-08, 0.382550538, -1.08360858e-08, -0.923934579) end if not getgenv().RK150000 then game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools() end end
end)
about:Toggle("石头400000", "RK400000", false, function(RK400000)
    if game.Players.LocalPlayer.Durability.Value >= 400000 then getgenv().RK400000 = RK400000 while getgenv().RK400000 do wait() for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v:IsA("Tool") and v.Name == "Punch" then game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v) end end for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if h:IsA("Tool") and h.Name == "Punch" then h:Activate() end end game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2155.61743, 3.79830337, 1227.06482, -0.551303148, -9.16796949e-09, -0.834304988, -5.61318245e-08, 1, 2.61027839e-08, 0.834304988, 6.12216127e-08, -0.551303148) end if not getgenv().RK400000 then game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools() end end
end)
about:Toggle("石头750000", "RK750000", false, function(RK750000)
    if game.Players.LocalPlayer.Durability.Value >= 750000 then getgenv().RK750000 = RK750000 while getgenv().RK750000 do wait() for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v:IsA("Tool") and v.Name == "Punch" then game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v) end end for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if h:IsA("Tool") and h.Name == "Punch" then h:Activate() end end game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-7285.6499, 3.66624784, -1228.27417, 0.857643783, -1.58175091e-08, -0.514244199, -1.22581563e-08, 1, -5.12025977e-08, 0.514244199, 5.02172774e-08, 0.857643783) end if not getgenv().RK750000 then game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools() end end
end)
about:Toggle("石头100万", "RK1M", false, function(RK1M)
    if game.Players.LocalPlayer.Durability.Value >= 1000000 then getgenv().RK1M = RK1M while getgenv().RK1M do wait() for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v:IsA("Tool") and v.Name == "Punch" then game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v) end end for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if h:IsA("Tool") and h.Name == "Punch" then h:Activate() end end game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4160.87109, 987.829102, -4136.64502, -0.893115997, 1.25481356e-05, 0.44982639, 5.02490684e-06, 1, -1.79187136e-05, -0.44982639, -1.37431543e-05, -0.893115997) end if not getgenv().RK1M then game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools() end end
end)
about:Toggle("石头500万", "RK5M", false, function(RK5M)
    if game.Players.LocalPlayer.Durability.Value >= 5000000 then getgenv().RK5M = RK5M while getgenv().RK5M do wait() for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v:IsA("Tool") and v.Name == "Punch" then game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v) end end for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if h:IsA("Tool") and h.Name == "Punch" then h:Activate() end end game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-8957.54395, 5.53625107, -6126.90186, -0.803919137, 6.6065212e-08, 0.594738603, -8.93136143e-09, 1, -1.23155459e-07, -0.594738603, -1.04318865e-07, -0.803919137) end if not getgenv().RK5M then game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools() end end
end)

about:Button("传送到出生点",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(7, 3, 108)
end)

about:Button("传送到安全岛",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39, 10, 1838)
end)

about:Button("传送到幸运抽奖区域😏😏😏",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2606, -2, 5753)
end)

about:Button("传送到肌肉之王健身房",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8554, 22, -5642)
end)

about:Button("传送到传说健身房",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4676, 997, -3915)
end)

about:Button("传送到永恒健身房",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6686, 13, -1284)
end)

about:Button("传送到神话健身房",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2177, 13, 1070)
end)

about:Button("传送到冰霜健身房",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2543, 13, -410)
end)

about:Button("力量传奇改力量",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/jynzl/main/main/Musclas%20Legenos.lua'))()
end)


local UITab84 = win:Tab("钓鱼模拟器",'16060333448')

local about = UITab84:section("『功能』",true)

about:Toggle("跳跃","text",false,function(s)
shared.toggle = State
     if shared.toggle then
    fuckMonster = RunService.Stepped:Connect(function()
     for i, v in pairs(game.Workspace:GetChildren()) do
     if v:FindFirstChild("Health") and v:FindFirstChild("IsSeaMonster") then
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then


                    for i, getTools in pairs(player.Character:GetChildren()) do
                        if getTools:IsA("Tool") and  getTools:FindFirstChild("GripC1") then
                            plrTools = getTools.Name
                        end
                    end

                    teleport(v.HumanoidRootPart.CFrame + Vector3.new(0, 30, 0))
                    wait(1)
                    game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.MonsterHit:FireServer(workspace[v.Name], tostring(plrTools), true)
                    break
                elseif not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    EquipTool()
               break
            end
        end
     end
     end)
    else
         fuckMonster:Disconnect()
          teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))
        end
end)
about:Toggle("自动杀鲨鱼","text",false,function(State)
 shared.toggle = State
     if shared.toggle then
    fuckMonster = RunService.Stepped:Connect(function()
     for i, v in pairs(game.Workspace:GetChildren()) do
     if v:FindFirstChild("Health") and v:FindFirstChild("IsSeaMonster") then
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then


                    for i, getTools in pairs(player.Character:GetChildren()) do
                        if getTools:IsA("Tool") and  getTools:FindFirstChild("GripC1") then
                            plrTools = getTools.Name
                        end
                    end

                    teleport(v.HumanoidRootPart.CFrame + Vector3.new(0, 30, 0))
                    wait(1)
                    game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.MonsterHit:FireServer(workspace[v.Name], tostring(plrTools), true)
                    break
                elseif not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    EquipTool()
               break
            end
        end
     end
     end)
    else
         fuckMonster:Disconnect()
          teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))
        end
end)
about:Toggle("自动钓鱼","text",false,function(bool)
 if bool then
            local rodName = false
            while not rodName do
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:FindFirstChild("FishingRodScript") then
                        rodName = v.Name
                        break
                    end
                end
                wait()
            end

            bBobber = game.Players.LocalPlayer.Character:WaitForChild(rodName).Bobbers.Bobber.Fish.Changed:Connect(
                function(fishVal)
                    if fishVal ~= nil then
                        --if not legendToggle then
                            game.Workspace:WaitForChild(tostring(fishVal))
                            wait()
                            game.ReplicatedStorage.CloudClientResources.Communication.Events.FishedDone:FireServer()
                            wait()
                            game.ReplicatedStorage.CloudClientResources.Communication.Events.ResetFishingRod:FireServer()
                            wait()
                        --[[else
                            if game.Workspace:WaitForChild(tostring(fishVal)).RarityLevel.Value >= 5 then
                                game.ReplicatedStorage.CloudClientResources.Communication.Events.FishedDone:FireServer()
                                wait()
                                game.ReplicatedStorage.CloudClientResources.Communication.Events.ResetFishingRod:FireServer()
                                wait()
                            end                                                                                                 
                        end                                                                                                        --]]
					end
					if game.Players.LocalPlayer.Character:WaitForChild(rodName).Bobbers.Bobber:FindFirstChild("FishWeld") then
						for p, q in pairs(game.Players.LocalPlayer.Character:WaitForChild(rodName).Bobbers.Bobber:GetChildren()) do
							if q.Name == "FishWeld" then
								q:Destroy()
							end
						end
					end
                end
            )
        else 
            bBobber:Disconnect()
        end
end)
about:Toggle("自动杀boss","text",false,function(State)
 shared.toggle = State
     if shared.toggle then
    fuckMobby = RunService.Stepped:Connect(function()
     for i, v in pairs(game.Workspace:GetChildren()) do
     if v:FindFirstChild("Health") and v:FindFirstChild("IsSeaMonster") and v.Name == "MobbyWood" then
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then


                    for i, getTools in pairs(player.Character:GetChildren()) do
                        if getTools:IsA("Tool") and  getTools:FindFirstChild("GripC1") then
                            plrTools = getTools.Name
                        end
                    end

                    teleport(v.HumanoidRootPart.CFrame + Vector3.new(0, 50, 0))
                    wait(1)
                    game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.MonsterHit:FireServer(workspace[v.Name], tostring(plrTools), true)
                    break
                elseif not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    EquipTool()
               break
            end
        end
     end
     end)
    else
         fuckMobby:Disconnect()
          teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))
        end
end)
about:Toggle("减少延迟","text",false,function(State)
 toggle = State
     if toggle then
        while toggle do 
            wait(30)
            for i, v in pairs(game.Workspace.DroppedItems:GetChildren()) do
                if v:IsA("Model") then
                    v:Destroy()
                end
            end
        end
      end
end)
about:Toggle("自动锁定稀有物品","text",false,function(State)
 toggle = State
     if toggle then
        while toggle do 
            wait(.1)
for i, v in pairs(game.Players.LocalPlayer.PlayerGui.Interface.Inventory.Inventory.Frame.Backpack.List.Container:GetChildren()) do
        if string.match(v.Name, "key") then
            for i, model in pairs(v:GetDescendants()) do
                if model:IsA("Tool") then
                    if model.RarityLevel.Value >= 5 then

                        if v.DraggableComponent.Contents.LockIcon.Visible == false then
                            print(v.Name, model.Name, model.RarityLevel.Value)
                        local args = {
                            [1] = "Tools",
                            [2] = v.Name,
                            [3] = true
                        }
                        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetInventoryItemLock:InvokeServer(unpack(args))

                        end
                    end
                end
            end
        end
end

        end
      end
end)
about:Toggle("自动抓捕","text",false,function(State)
 toggle = State
    while toggle do
        wait(2.6)
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.FishCaught:FireServer()
    end
end)
about:Toggle("自动售卖","text",false,function(State)
 toggle = State
    while toggle do
        wait(2.6)
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.processGameItemSold:InvokeServer("SellEverything")
    end
end)
about:Toggle("每日宝箱","text",false,function(State)
 toggle = State
        while toggle do
                for i, v in pairs(game.Workspace.Islands:GetDescendants()) do
                    if v:IsA("Model") and string.match(v.Name, "Chest") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                        wait(1)
                        fireproximityprompt(v.HumanoidRootPart.ProximityPrompt)
                    end
                end            
        end
end)
about:Toggle("随机宝箱","text",false,function(State)
 toggle = State
        while toggle do
                for i, v in pairs(game.Workspace.RandomChests:GetDescendants()) do
                    if v:IsA("Model") and string.match(v.Name, "Chest") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                        wait(1)
                        fireproximityprompt(v.HumanoidRootPart.ProximityPrompt)
                    end
                end            
        end
end)
local wood_types = {"选择", "Earth Egg","Alien Egg","Dominus Egg","Ice Egg","Lava Egg","Heavens Egg","Toy Egg","Mine Egg"}
if not game.workspace:FindFirstChild("PFA") then 
    local part = Instance.new("Part") 
    part.Name = "PFA" 
    part.Parent = game.workspace 
    part.CFrame = CFrame.new(-1087, -40, 1670) 
    part.Size = Vector3.new(50, 0, 50) 
    part.Anchored = true 
    part.Reflectance = 1 
end

function C() 
    spawn(function () 
        while getgenv().C do
            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
                TPCFrame(CFrame.new(-1087, -35, 1670))
                if v.ToolTip == "Weight" then 
                    v.Parent = game.Players.LocalPlayer.Character 
                end
                if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then 
                    game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Activate() 
                end
            end 
            wait()
        end
    end)
end

function U() 
    spawn(function () 
        while getgenv().U do
            local args = {[1] = "S_Controller_Upgrades_Upgrade",[2] = {[1] = "Damage_Multiplier"}}
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
            local args = {[1] = "S_Controller_Upgrades_Upgrade",[2] = {[1] = "Health_Multiplier"}}
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
            local args = {[1] = "S_Controller_Upgrades_Upgrade",[2] = {[1] = "Jump_Power"}}
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
            local args = {[1] = "S_Controller_Upgrades_Upgrade",[2] = {[1] = "Walk_Speed"}}
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
            local args = {[1] = "S_Controller_Upgrades_Upgrade",[2] = {[1] = "Pet_Space"}}
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
            local args = {[1] = "S_Controller_Upgrades_Upgrade",[2] = {[1] = "Pet_Inventory"}}
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
            wait()
        end
    end)
end

function R() 
    spawn(function () 
        while getgenv().R do
            local args = {[1] = "S_Controller_Rebirth_Rebirth",[2] = {}}
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
            wait()
        end
    end)
end

function H(E) 
    spawn(function () 
        while getgenv().H do
            local args = {[1] = "S_Controller_Eggs_Buy",[2] = {[1] = E}}
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteFunction:InvokeServer(unpack(args))
            wait()
        end
    end)
end


local UITab11 = win:Tab("『火箭发射模拟器』",'7734068321')

local about = UITab11:section("『火箭发射模拟器』",true)

about:Toggle("自动收集燃料", "ARL", false, function(ARL)
    isFuelScoopEnabled = ARL while true do wait() if isFuelScoopEnabled then for i, h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if h:IsA("Tool") and h.Name == "FuelScoop" then h:Activate() end end end end
end)
about:Button("登上火箭", function()
    game:GetService("ReplicatedStorage"):WaitForChild("BoardRocket"):FireServer()
end)
about:Button("将玩家从所有者座位移除", function()
    game:GetService("ReplicatedStorage"):WaitForChild("RemovePlayer"):FireServer()
end)

about:Button("发射台岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-123.15931701660156, 2.7371432781219482, 3.491959810256958)
end)
about:Button("白云岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-76.13252258300781, 170.55825805664062, -60.4516716003418)
end)
about:Button("浮漂岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-66.51714324951172, 720.4866333007812, -5.391753196716309)
end)
about:Button("卫星岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-34.2462043762207, 1429.4990234375, 1.3739361763000488)
end)
about:Button("蜜蜂迷宫岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6.5361199378967285, 3131.249267578125, -29.759048461914062)
end)
about:Button("月球人救援", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7.212917804718018, 5016.341796875, -19.815933227539062)
end)
about:Button("暗物质岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(68.43186950683594, 6851.94091796875, 7.890637397766113)
end)
about:Button("太空岩石岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(49.92888641357422, 8942.955078125, 8.674375534057617)
end)
about:Button("零号火星岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(54.44503402709961, 11270.0927734375, -1.273137092590332)
end)
about:Button("太空水晶小行星岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11.579089164733887, 15295.6318359375, -27.54974365234375)
end)
about:Button("月球浆果岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-14.601255416870117, 18410.9609375, 0.9418511986732483)
end)
about:Button("铺路石岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3.272758960723877, 22539.494140625, 63.283935546875)
end)
about:Button("流星岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-45.515689849853516, 27961.560546875, -7.358333110809326)
end)
about:Button("升级岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2.7595248222351074, 33959.98828125, 53.93095397949219)
end)

about:Button("火箭发射模拟器1",function()
loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/9245/%E7%8C%AB%E9%80%9A%E7%94%A8.txt?sign=hrWROZdVfK2mtJcIFa3Tvbl-TojP1C86_Zd3q03qttc%3D%3A0"))()
end)

about:Button("火箭发射模拟器2",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/dizyhvh/rbx_scripts/main/321_blast_off_simulator')))()
end)

about:Button("火箭发射模拟器3",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/odhdshhe/jm-/refs/heads/main/jm%E7%81%AB%E7%AE%AD%E5%8F%91%E5%B0%84%E9%87%8D%E5%81%9A(1).lua"))()
end)
local UITab39 = win:Tab("『巴掌模拟器』",'7734068321')

local about = UITab39:section("『巴掌模拟器』",true)

about:Toggle("无CD","Toggle" ,false, function(Value)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local tool = character:FindFirstChildOfClass("Tool") or player.Backpack:FindFirstChildOfClass("Tool")
    
    bazhangmnq = Value
    
    while bazhangmnq do
    local localscript = tool:FindFirstChildOfClass("LocalScript")
    local localscriptclone = localscript:Clone()
    localscriptclone = localscript:Clone()
    localscriptclone:Clone()
    localscript:Destroy()
    localscriptclone.Parent = tool
    wait(0.1)
    end
    end)
    
    about:Button("获取计数器手套", function()
    fireclickdetector(game.Workspace.CounterLever.ClickDetector)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,100,0)
    wait(0.2)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    wait(121)
    for i,v in pairs(workspace.Maze:GetDescendants()) do
    if v:IsA("ClickDetector") then
    fireclickdetector(v)
    end
    end
    end)
    
    about:Toggle("地牢亮度","Toggle" ,false, function(Value)
     Light = Value
        if not Light then
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end)
    
    about:Dropdown("传送","Dropdown",{"安全区","竞技场","埃及岛","果实岛","盘子","锦标赛","默认竞技场"},function(Value)
    if Value == "安全区" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Spot.CFrame * CFrame.new(0,40,0)
    elseif Value == "竞技场" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0,-5,0)
    elseif Value == "埃及岛" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(215, -15.5, 0.5)
    elseif Value == "果实岛" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Arena.island5.Union.CFrame * CFrame.new(0,3.25,0)
    elseif Value == "盘子" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.Plate.CFrame * CFrame.new(0,2,0)
    elseif Value == "锦标赛" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Battlearena.Arena.CFrame * CFrame.new(0,10,0)
    elseif Value == "默认竞技场" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(120,360,-3)
    end
    end)
    
    about:Toggle("复古技能","Toggle" ,false, function(Value)
    RetroSpam = Value
    while RetroSpam do
    game:GetService("ReplicatedStorage").RetroAbility:FireServer(RetroAbility)
    task.wait()
    end
    end)
    
    about:Dropdown("复古技能选择","Dropdown",{"Rocket Launcher","Ban Hammer","Bomb"}, function(Value)
    RetroAbility = Value
    end)
    
    about:Toggle("自动捡糖果","Toggle",false, function(Value)
    CandyCornFarm = Value
    while CandyCornFarm do
    for i, v in pairs(workspace.CandyCorns:GetChildren()) do
                    if v:FindFirstChildWhichIsA("TouchTransmitter") then
    v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
    task.wait()
    end
    end)
    
    about:Toggle("获取炼金术师材料","Toggle", false, function(Value)
    AlchemistIngredients = Value
    if game.Players.LocalPlayer.leaderstats.Glove.Value == "Alchemist" then
    while AlchemistIngredients do
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Mushroom")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Glowing Mushroom")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Fire Flower")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Winter Rose")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Dark Root")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Dire Flower")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Autumn Sprout")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Elder Wood")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Hazel Lily")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Wild Vine")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Jade Stone")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Lamp Grass")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Plane Flower")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Blood Rose")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Red Crystal")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Blue Crystal")
    task.wait()
    end
    end
    end)
    
    about:Toggle("自动加入竞技场","Toggle", false, function(Value)
    AutoEnterArena = Value
    while AutoEnterArena do
    if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 0)
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 1)
        end
    task.wait()
    end
    end)
    
    about:Toggle("自动光波球","Toggle", false, function(Value)
    if Person == nil then
    Person = game.Players.LocalPlayer.Name
    end
    _G.RojoSpam = Value
    while _G.RojoSpam do
    game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players[Person].Character.HumanoidRootPart.CFrame})
    task.wait()
    end
    end)
    
    about:Button("Rojo技能", function(Value)
    _G.RojoSpam = Value
    game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Charge")
    wait(6)
    game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame})
    task.wait()
    end)
    
    about:Toggle("音符技能","Toggle", false, function(Value)
    _G.RhythmSpam = Value
    while _G.RhythmSpam do
    game:GetService("ReplicatedStorage").rhythmevent:FireServer("AoeExplosion",0)
    task.wait()
    end
    end)
    
    about:Toggle("Null技能","Toggle", false, function(Value)
    NullSpam = Value
    while NullSpam do
    game:GetService("ReplicatedStorage").NullAbility:FireServer()
    task.wait()
    end
    end)
    
    about:Toggle("自动拾取黄金果实","Toggle", false, function(Value)
    SlappleFarm = Value
    while SlappleFarm do
    for i, v in ipairs(workspace.Arena.island5.Slapples:GetDescendants()) do
                    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") and v.Name == "Glove" and v:FindFirstChildWhichIsA("TouchTransmitter") then
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
                    end
                end
    task.wait()
    end
    end)
    
    about:Toggle("自动捡飞行宝珠","Toggle", false, function(Value)
    Jetfarm = Value
    while Jetfarm do
    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "JetOrb" and v:FindFirstChild("TouchInterest") then
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 0)
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 1)
                        end
                    end
    task.wait()
    end
    end)
    
    about:Toggle("自动捡相位球","Toggle", false, function(Value)
    Phasefarm = Value
    while Phasefarm do
    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "PhaseOrb" and v:FindFirstChild("TouchInterest") then
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 0)
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 1)
                        end
                    end
    task.wait()
    end
    end)
    
    about:Toggle("自动刷bob","Toggle", false, function(Value)
    ReplicaFarm = Value
    while ReplicaFarm do
    for i, v in pairs(workspace:GetChildren()) do
                    if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("HumanoidRootPart") then
    game.ReplicatedStorage.b:FireServer(v:WaitForChild("HumanoidRootPart"))
                    end
                end
    task.wait()
    game:GetService("ReplicatedStorage").Duplicate:FireServer()
    task.wait(7)
    end
    end)
    
    about:Toggle("无限反转","Toggle", false, function(Value)
    _G.InfReverse = Value
    while _G.InfReverse do
    game:GetService("ReplicatedStorage").ReverseAbility:FireServer()
    wait(6)
    end
    end)
    
    about:Toggle("彩虹角色(装备黄金手套)","Toggle", false, function(Value)
    _G.Rainbow = Value
    while _G.Rainbow do
    for i = 0,1,0.001*25 do
    game:GetService("ReplicatedStorage").Goldify:FireServer(false, BrickColor.new(Color3.fromHSV(i,1,1)))
    task.wait()
    end
    end
    end)
    
    about:Toggle("防击飞","Toggle", false, function(Value)
    AntiRagdoll = Value
    if AntiRagdoll then
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    game.Players.LocalPlayer.CharacterAdded:Connect(function()
    game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Changed:Connect(function()
    if game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true and AntiRagdoll then
    repeat task.wait() game.Players.LocalPlayer.Character.Torso.Anchored = true
    until game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
    game.Players.LocalPlayer.Character.Torso.Anchored = false
    end
    end)
    end)
    end
    end)
    
    about:Toggle("反虚空(锦标赛也有效果)","Toggle", false, function(Value)
    game.Workspace.dedBarrier.CanCollide = Value
    game.Workspace.TAntiVoid.CanCollide = Value
    end)

about:Toggle("防死亡屏障","Toggle", false, function(Value)
    if Value == true then
    for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
                        if v.ClassName == "Part" and v.Name == "BLOCK" then
                            v.CanTouch = false
                        end
                    end
    workspace.DEATHBARRIER.CanTouch = false
    workspace.DEATHBARRIER2.CanTouch = false
    workspace.dedBarrier.CanTouch = false
    workspace.ArenaBarrier.CanTouch = false
    workspace.AntiDefaultArena.CanTouch = false
    else
    for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
                        if v.ClassName == "Part" and v.Name == "BLOCK" then
                            v.CanTouch = true
                        end
                    end
    workspace.DEATHBARRIER.CanTouch = true
    workspace.DEATHBARRIER2.CanTouch = true
    workspace.dedBarrier.CanTouch = true
    workspace.ArenaBarrier.CanTouch = true
    workspace.AntiDefaultArena.CanTouch = true
    end
    end)
    
    about:Toggle("反巴西","Toggle", false, function(Value)
    if Value == true then
    for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do
                            v.CanTouch = false
                    end
    else
    for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do
                            v.CanTouch = true
                    end
    end
    end)
    
    about:Toggle("反死亡方块","Toggle", false, function(Value)
    if Value == true then
            workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
            else
                    workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true
            end
    end)
    
    about:Toggle("反上帝技能","Toggle", false, function(Value)
    AntiTimestop = Value
    while AntiTimestop do
                    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if v.ClassName == "Part" then
                            v.Anchored = false
                        end
                    end
    task.wait()
    end
    end)
    
    about:Toggle("反鱿鱼","Toggle", false, function(Value)
    AntiSquid = Value
    if AntiSquid == false then
            game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = true
            end
    while AntiSquid do
    if game.Players.LocalPlayer.PlayerGui:FindFirstChild("SquidInk") then
            game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = false
    end
    task.wait()
    end
    end)
    
    about:Toggle("反神圣杰克","Toggle", false, function(Value)
    game.Players.LocalPlayer.PlayerScripts.HallowJackAbilities.Disabled = Value
    end)
    
    about:Toggle("反传送带","Toggle", false, function(Value)
    game.Players.LocalPlayer.PlayerScripts.ConveyorVictimized.Disabled = Value
    end)
    
    about:Toggle("反板砖","Toggle", false, function(Value)
    AntiBrick = Value
    while AntiBrick do
    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "Union" then
                            v.CanTouch = false
                        end
                    end
    task.wait()
    end
    end)
    
    about:Toggle("反Null","Toggle", false, function(Value)
    AntiNull = Value
    while AntiNull do
    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "Imp" and v:FindFirstChild("Body") then
    shared.gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v.Body,true)
    end
    end
    task.wait()
    end
    end)
    
about:Button("自动刷巴掌",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Farm'))()
end)

about:Button("巴掌模拟器1",function()
loadstring(game:HttpGet("https://lkhub.net/s/loader.lua"))()
end)

about:Button("巴掌模拟器2",function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Battles")))()
end)

about:Button("巴掌模拟器3",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/slap_battles_gui/main/0.lua"))()
end)

local UITab1 = win:Tab("『超级大力士模拟器』",'7734068321')

local about = UITab1:section("『超级大力士模拟器』",true)

about:Button("传送到开始区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(85.86943817138672, 11.751949310302734, -198.07127380371094)
    end)
    
about:Button("传送到健身区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(93.60747528076172, 11.751947402954102, -10.266206741333008)
    end)
    
about:Button("传送到食物区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(78.86384582519531, 11.751947402954102, 228.9690399169922)
    end)
    
about:Button("传送到街机区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88.99887084960938, 11.751949310302734, 502.90997314453125)
    end)
    
about:Button("传送到农场区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(85.6707763671875, 11.751947402954102, 788.5997314453125)
    end)
    
about:Button("传送到城堡区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(84.87281036376953, 11.84177017211914, 1139.7509765625)
    end)
    
about:Button("传送到蒸汽朋克区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(92.63227081298828, 11.841767311096191, 1692.7890625)
    end)
    
about:Button("传送到迪斯科区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(98.69613647460938, 16.015085220336914, 2505.213134765625)
    end)
    
about:Button("传送到太空区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88.42948150634766, 11.841769218444824, 3425.941650390625)
    end)
    
about:Button("传送到糖果区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(63.55805969238281, 11.841663360595703, 4340.69921875)
    end)
    
about:Button("送到实验室区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(78.00920867919922, 11.841663360595703, 5226.60205078125)
    end)
    
about:Button("传送到热带区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(80.26090240478516, 12.0902681350708, 6016.16552734375)
    end)
    
about:Button("传送到恐龙区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(38.4753303527832, 25.801530838012695, 6937.779296875)
    end)
    
about:Button("传送到复古区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(99.81867218017578, 12.89099407196045, 7901.74755859375)
    end)
    
about:Button("传送到冬季区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(63.47243881225586, 11.841662406921387, 8983.810546875)
    end)
    
about:Button("传送到深海区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(105.36250305175781, 26.44820213317871, 9970.0849609375)
    end)
    
about:Button("传送到狂野西部区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(68.69414520263672, 15.108586311340332, 10938.654296875)
    end)
    
about:Button("传送到豪华公寓区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.75145721435547, 11.313281059265137, 12130.349609375)
    end)
    
about:Button("传送到宝剑战斗区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(111.25597381591797, 11.408829689025879, 12945.57421875)
    end)
    
about:Button("传送到童话区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(121.14932250976562, 11.313281059265137, 14034.50390625)
    end)
    
about:Button("传送到桃花区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(108.2142333984375, 11.813281059265137, 15131.861328125)
    end)
    
about:Button("传送到厨房区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.78338623046875, 21.76291847229004, 16204.9755859375)
    end)
    
about:Button("传送到下水道区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(47.36086654663086, 12.25178050994873, 17656.04296875)
    end)
    
about:Button("超级大力士模拟器1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe2/ToraIsMe2/main/0strongman", true))()
end)

about:Button("超级大力士模拟器2",function()
loadstring(game:HttpGet("https://pastefy.app/aO18ZEB9/raw"))()
end)

about:Button("超级大力士模拟器3",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/hngamingroblox/scripts/main/strongman%20simulator'))()
end)

about:Button("超级大力士模拟器4",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe2/ToraIsMe2/main/0strongman", true))()
end)
local UITab1 = win:Tab("『doors』",'7734068321')

local about = UITab1:section("『Doors』",true)

about:Button("能用ms",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/mspaint/main/main.lua"))()
end)

about:Toggle("刷新时通知", "TZ", false, function(TZ)
     _G.IE = (TZ and true or false) LatestRoom.Changed:Connect(function() if _G.IE == true then local n = ChaseStart.Value - LatestRoom.Value if 0 < n and n < 4 then Notification:Notify("请注意", "事件可能刷新于" .. tostring(n) .. " 房间","rbxassetid://17360377302",3) end end end) workspace.ChildAdded:Connect(function(inst) if inst.Name == "RushMoving" and _G.IE == true then Notify("请注意", "Rush 已刷新","rbxassetid://17360377302",3) elseif inst.Name == "AmbushMoving" and _G.IE == true then Notify("请注意", "Ambush 已刷新","rbxassetid://17360377302",3) end end)
end)

about:Toggle("自动躲避Rush/Ambush", "ADB", false, function(ADB)
    _G.Avoid = (ADB and true or false) workspace.ChildAdded:Connect(function(inst) if inst.Name == "RushMoving" and _G.Avoid == true then Notify("请注意!", "正在躲避 Rush.","rbxassetid://17360377302",3) local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position local con = game:GetService("RunService").Heartbeat:Connect(function() game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0)) end) inst.Destroying:Wait() con:Disconnect() game.Players.LocalPlayer.Character:MoveTo(OldPos) elseif inst.Name == "AmbushMoving" and _G.Avoid == true then Notify("注意!", "正在躲避 Ambush.","rbxassetid://17360377302",3) local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position local con = game:GetService("RunService").Heartbeat:Connect(function() game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0)) end) inst.Destroying:Wait() con:Disconnect() game.Players.LocalPlayer.Character:MoveTo(OldPos) end end)
end)
about:Toggle("无 Screech", "NCH", false, function(NCH)
    _G.NS = (NCH and true or false) workspace.CurrentCamera.ChildAdded:Connect(function(child) if child.Name == "Screech" and _G.NS == true then child:Destroy() end end)
end)

about:Button("最强汉化",function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
end)

about:Button("最新",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KINGHUB01/BlackKing-obf/main/Doors%20Blackking%20And%20BobHub"))()
end)

about:Button("DX",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/DXuwu/replicator-lol/main/dor.lua"))()
end)

about:Button("RP变怪",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))()
end)

about:Button("剪刀",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/shears_done.lua"))()
end)

about:Button("十字架",function()
loadstring(game:HttpGet("https://pastebin.com/raw/FCSyG6Th"))()
end)

about:Button("神圣炸弹",function()
loadstring(game:HttpGet("https://pastebin.com/raw/u5B1UjGv"))()
end)

about:Button("吸铁石",function()
loadstring(game:HttpGet("https://pastebin.com/raw/xHxGDp51"))()
end)

about:Button("刷怪变怪",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shuaguai"))()
end)

about:Button("变身",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))()
end)
about:Button("最强英文",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/mspaint/main/main.lua"))()
end)

about:Button("最强英文汉化",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/nnzhonhxin/114514/refs/heads/main/DOORS.txt"))()
end)

about:Button("room",function()
loadstring(game:HttpGet(('https://pastebin.com/raw/R8QMbhzv')))()
end)
local UITab84 = win:Tab("感染性微笑",'16060333448')

local about = UITab84:section("『功能』",true)

about:Button("防止微笑感染",function()
for _,v in pairs(game.workspace:GetDescendants()) do

if string.find(v.Name,"Infector") then
v:Destroy()
end
end
end)
about:Button("取消门",function()
for _,v in pairs(game.workspace:GetDescendants()) do

if string.find(v.Name,"AntiSmiler") then
v:Destroy()
end
end
end)
about:Button("开启反外挂",function()
workspace.Map.AntiHack:Destroy() game.Players.LocalPlayer.Character.AntiFly:Destroy()
end)
about:Toggle("速度-微笑感染","text",false,function(s)
getgenv().SlowDownSpeed = getgenv().SlowDownSpeed or 16
        getgenv().NoSlowDown = Value
        if getgenv().NoSlowDown then
            SteppedConnection = game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().SlowDownSpeed
                end)
            end)
        else
            if SteppedConnection then
                SteppedConnection:Disconnect()
                SteppedConnection = nil
            end
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
end)
about:Toggle("打击微笑感染","text",false,function(s)
getgenv().InfectAura = Value
        if getgenv().InfectAura then
            getgenv().InfectAuraConnection = game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    game:GetService("Players").LocalPlayer.Character.Infected.InfectEvent:FireServer()
                end)
            end)
        else
            if getgenv().InfectAuraConnection then
                getgenv().InfectAuraConnection:Disconnect()
                getgenv().InfectAuraConnection = nil
            end
        end
end)
about:Toggle("Bat打击","text",false,function(s)
getgenv().HitAura = s
        if getgenv().HitAura then
            getgenv().HitAuraConnection = game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    local character = game:GetService("Players").LocalPlayer.Character
                    if character then
                        local bat = character:FindFirstChildOfClass("Tool")
                        if bat and bat.Name == "Bat" and bat:FindFirstChild("SwingEvent") then
                            bat.SwingEvent:FireServer()
                        end
                           if packedice and packedice.Name == "Packed Ice" and packedice:FindFirstChild("SwingEvent") then
                           packedice.SwingEvent:FireServer()
                        end
                    end
                end)
            end)
        else
            if getgenv().HitAuraConnection then
                getgenv().HitAuraConnection:Disconnect()
                getgenv().HitAuraConnection = nil
            end
        end
end)
about:Toggle("瓶子打击","text",false,function(s)
getgenv().HitAura = s
        if getgenv().HitAura then
            getgenv().HitAuraConnection = game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    local character = game:GetService("Players").LocalPlayer.Character
                    if character then
                        local bottle = character:FindFirstChildOfClass("Tool")
                        if bottle and bottle.Name == "Bottle" and bottle:FindFirstChild("SwingEvent") then
                            bottle.SwingEvent:FireServer()
                        end
                           if packedice and packedice.Name == "Packed Ice" and packedice:FindFirstChild("SwingEvent") then
                           packedice.SwingEvent:FireServer()
                        end
                    end
                end)
            end)
        else
            if getgenv().HitAuraConnection then
                getgenv().HitAuraConnection:Disconnect()
                getgenv().HitAuraConnection = nil
            end
        end
end)   

local UITab18 = win:Tab("『其他脚本』",'7734068321')
local about = UITab18:section("『其他脚本』",true)

about:Button("山脚本",function()
loadstring(game:HttpGet("https://h.lkmc.asia/script/ssfb.lua"))()
end)

about:Button("青脚本",function()
    loadstring(game:HttpGet('https://rentry.co/ct293/raw'))()
end)

about:Button("陈脚本",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/QxDD9SpW"))()
end)

about:Button("杯脚本",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zuohongjian/bjb/main/llcq"))()
end)

about:Button("北极脚本『中心』",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/KwARpDxV",true))()
end)

about:Button("地岩脚本",function()
 loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\98\98\97\109\120\98\98\97\109\120\98\98\97\109\120\47\99\111\100\101\115\112\97\99\101\115\45\98\108\97\110\107\47\109\97\105\110\47\37\69\55\37\57\57\37\66\68\34\41\41\40\41")()
end)

about:Button("导管中心",function()
 loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\117\115\101\114\97\110\101\119\114\102\102\47\114\111\98\108\111\120\45\47\109\97\105\110\47\37\69\54\37\57\68\37\65\49\37\69\54\37\65\67\37\66\69\37\69\53\37\56\68\37\56\70\37\69\56\37\65\69\37\65\69\34\41\41\40\41\10")()
end)

about:Button("脚本中心1.5版本",function()
 loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\103\101\109\120\72\119\65\49"))()
end)

about:Button("玖恶脚本",function()
    loadstring(game:HttpGet('https://ayangwp.cn/api/v3/file/get/8508/%E7%8E%96%E6%81%B6%E4%B8%AD%E5%BF%83.lua?sign=wt54yWf_f0LDB3gXXyQu0SFQ0oUDUXZBOaWQShwCFGg%3D%3A0'))()
end)

about:Button("老大脚本",function()
    loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/8401/%E8%80%81%E5%A4%A7%E8%84%9A%E6%9C%AC1.0%E7%89%88.txt?sign=XHxQ1ja8djAnEjVEG-eEZFPeZKFHJ0FHeybHpSbtBW4%3D%3A0"))()
end)

about:Button("乌云脚本",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/dT4ZGge8"))()
end)

about:Button("皇脚本",function()
    loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/8577/%E7%9A%87v5.txt?sign=ToDT3Udyh4r3WwDu_yVblRL849qC2GJjjjQ7FTidF_w%3D%3A0"))()
end)

about:Button("冰红茶脚本",function()
    loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/8582/Protected_9297682332119129.lua?sign=jP-h1AGooC90C0A0O5eDboOCoaQTZpOzLoWzg_oz1eE%3D%3A0"))()
end)

about:Button("静新脚本",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jxdjbx/ggff/main/%E5%B8%85%E9%94%85%E4%B8%80%E6%9E%9A%E5%B0%8F%E5%8F%AF%E7%88%B1%E5%91%80%E5%8F%91%E8%B4%A7%E5%A5%BD%E7%9A%84%E5%90%83%E4%B8%8D%E5%90%83%E8%AE%B0%E5%BE%97%E8%AE%B0%E5%BE%97%E4%BD%A0%E6%96%B9%E4%BE%BF%E6%89%93%E5%BC%80%E7%94%B5%E8%84%91%E6%96%B9%E4%B8%8D%E6%96%B9%E4%BE%BF%E8%AE%B0%E5%BE%97%E9%83%BD%E8%A7%81%E4%B8%8D%E5%88%B0%E6%96%B9%E4%BE%BF%E7%9A%84%E8%AF%9D%E6%89%8B%E6%9C%BA%E6%96%B9%E4%B8%8D%E6%96%B9%E4%BE%BF%E5%B0%B1"))()
end)

about:Button("小魔脚本",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaomoNB666/xiaomoNB666/main/%E6%9E%81.lua"))()
end)

about:Button("鲨新ui脚本",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fvvhhh/sturdy-octo-engine/main/Protected_1221338743706560.lua.txt"))()
end)

about:Button("雷脚本",function()
    loadstring(game:HttpGet(('https://pastebin.com/raw/tPB47inG')))()
end)

about:Button("皮脚本",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
end)

about:Button("禁漫中心",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/anlushanjinchangantangwanle/main/jmjmjmjmjmjmjmjmjmjmjmjmjmjmjmjm.lua"))()
end)

about:Button("霜脚本",function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\115\104\117\97\110\103\122\117\105\115\104\117\97\105\47\49\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\37\69\57\37\57\67\37\57\67\37\69\53\37\56\68\37\65\49\37\69\53\37\65\70\37\56\54\37\69\55\37\66\51\37\66\66\37\69\55\37\66\66\37\57\70\37\69\54\37\57\54\37\66\48\37\69\52\37\66\68\37\57\67\46\116\120\116\34\41\41\40\41\10\10")()
end)

about:Button("初脚本",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/odhdshhe/nianchuchuchuchuchu/refs/heads/main/Protected_2427816874224132.txt"))()
end)

about:Button("鹤脚本",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/qazpin66/-/refs/heads/main/%E9%B9%A41.5.lua"))()
end)

local UITab1 = win:Tab("『doors』",'7734068321')

local about = UITab1:section("『Doors』",true)

about:Button("能用ms",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/mspaint/main/main.lua"))()
end)

about:Toggle("刷新时通知", "TZ", false, function(TZ)
     _G.IE = (TZ and true or false) LatestRoom.Changed:Connect(function() if _G.IE == true then local n = ChaseStart.Value - LatestRoom.Value if 0 < n and n < 4 then Notification:Notify("请注意", "事件可能刷新于" .. tostring(n) .. " 房间","rbxassetid://17360377302",3) end end end) workspace.ChildAdded:Connect(function(inst) if inst.Name == "RushMoving" and _G.IE == true then Notify("请注意", "Rush 已刷新","rbxassetid://17360377302",3) elseif inst.Name == "AmbushMoving" and _G.IE == true then Notify("请注意", "Ambush 已刷新","rbxassetid://17360377302",3) end end)
end)

about:Toggle("自动躲避Rush/Ambush", "ADB", false, function(ADB)
    _G.Avoid = (ADB and true or false) workspace.ChildAdded:Connect(function(inst) if inst.Name == "RushMoving" and _G.Avoid == true then Notify("请注意!", "正在躲避 Rush.","rbxassetid://17360377302",3) local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position local con = game:GetService("RunService").Heartbeat:Connect(function() game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0)) end) inst.Destroying:Wait() con:Disconnect() game.Players.LocalPlayer.Character:MoveTo(OldPos) elseif inst.Name == "AmbushMoving" and _G.Avoid == true then Notify("注意!", "正在躲避 Ambush.","rbxassetid://17360377302",3) local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position local con = game:GetService("RunService").Heartbeat:Connect(function() game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0)) end) inst.Destroying:Wait() con:Disconnect() game.Players.LocalPlayer.Character:MoveTo(OldPos) end end)
end)
about:Toggle("无 Screech", "NCH", false, function(NCH)
    _G.NS = (NCH and true or false) workspace.CurrentCamera.ChildAdded:Connect(function(child) if child.Name == "Screech" and _G.NS == true then child:Destroy() end end)
end)

about:Button("最强汉化",function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
end)

about:Button("最新",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KINGHUB01/BlackKing-obf/main/Doors%20Blackking%20And%20BobHub"))()
end)

about:Button("DX",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/DXuwu/replicator-lol/main/dor.lua"))()
end)

about:Button("RP变怪",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))()
end)

about:Button("剪刀",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/shears_done.lua"))()
end)

about:Button("十字架",function()
loadstring(game:HttpGet("https://pastebin.com/raw/FCSyG6Th"))()
end)

about:Button("神圣炸弹",function()
loadstring(game:HttpGet("https://pastebin.com/raw/u5B1UjGv"))()
end)

about:Button("吸铁石",function()
loadstring(game:HttpGet("https://pastebin.com/raw/xHxGDp51"))()
end)

about:Button("刷怪变怪",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shuaguai"))()
end)

about:Button("变身",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))()
end)
about:Button("最强英文",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/mspaint/main/main.lua"))()
end)

about:Button("最强英文汉化",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/nnzhonhxin/114514/refs/heads/main/DOORS.txt"))()
end)

about:Button("room",function()
loadstring(game:HttpGet(('https://pastebin.com/raw/R8QMbhzv')))()
end)

local UITab13 = win:Tab("『铲雪模拟器』",'7734068321')

local about = UITab13:section("『铲雪模拟器』",true)

about:Toggle("自动收集雪","", false, function(Value)
        toggle = Value
    while toggle do wait()
    local args = {
        [1] = workspace:WaitForChild("HitParts"):WaitForChild("Snow1"),
        [2] = "Snow1",
        [3] = "MagicWand"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("e8eGb8RgRXFcug8q"):FireServer(unpack(args))
        end
    end)
    
    about:Toggle("自动出售雪（要传送到指定地方）",   "",false, function(Value)
    toggle = Value
    while toggle do wait()
    local args = {
        [1] = "SellSnow",
        [2] = "Frosty"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
        end
    end)
    
    about:Button("传送出售雪的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(481.4659423828125, 15.846257209777832, -66.55204010009766)
    end)
    
    about:Button("传送买车的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(90.10160064697266, 16.051794052124023, -141.703125)
    end)
    
    about:Button("传送买工具的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(131.7429962158203, 16.39700698852539, -12.935890197753906)
    end)
    
    about:Button("传送买背包的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(348.6633605957031, 17.03822898864746, -16.793842315673828)
    end)
    
    about:Button("传送买假日礼物的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(154.57424926757812, 16.215335845947266, 147.10423278808594)
    end)
    
    about:Button("传送买宠物的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(138.49563598632812, 17.887277603149414, 278.3686218261719)
    end)
    
    about:Button("传送超大铲雪的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-391.4309997558594, 15.84949016571045, 150.15187072753906)
    end)
    
    local UITab36 = win:Tab("『BF』",'7734068321')

local about = UITab36:section("『BF』",true)

about:Button("BF 『汉化』",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Xiao-Yun-UWU/main/%E6%B5%B7%E8%B4%BC%E7%8E%8Bbf.lua", true))()
end)

about:Button("最强",function()
_G.HohoVersion = "v4"
loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
end)

about:Button("最强",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AkiraNus/UniquehubKak/main/FreeCr.Xenonhub"))()
end)

about:Button("刷怪",function()
loadstring(game:HttpGet('https://rawscripts.net/raw/UPDATE-16-Blox-Fruits-Nub-V1-Hub-4583'))()
end)

about:Button("自动升级",function()
loadstring(game:HttpGet"https://raw.githubusercontent.com/xDepressionx/Free-Script/main/AllScript.lua")()
end)

about:Button("自动箱子",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMael7/NewIceHub/main/Brookhaven"))()
end)

about:Button("找的",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScriptsExploit/Blox-Fruits/main/Ripper%20M"))()
end)

about:Button("超强",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Augustzyzx/UraniumMobile/main/UraniumKak.lua"))()
end)

about:Button("BF『HOHO脚本』1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HohoV2/Free/BloxFruitFreeV3.lua"))()
end)

about:Button("BF『HOHO脚本』2",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))()
end)


about:Label("卡密自己去DC")local UITab52 = win:Tab("『鲨口求生』",'7734068321')

local about = UITab52:section("『鲨口求生』",true)

about:Dropdown("船只提取器", "FreeBoat", { "摩托艇", "摩托艇", "独角兽挺", "摩托艇", "红马林鱼", "单栀帆船", "拖船", "小船摩托艇", "摩托艇甜甜圈", "马林鱼", "管船", "渔船", "维京船", "小树林帆船", "红冠摩托艇", "双体船", "战斗船", "游船", "鸭海军陆战队", "派对船", "军事潜艇", "姜饼蒸汽船", "雪橇2022", "雪地摩托", "游轮"}, function(CS)
  game:GetService("ReplicatedStorage").EventsFolder.BoatSelection.UpdateHostBoat:FireServer(CS)
end)

about:Button("自动杀鲨鱼", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Sw1ndlerScripts/RobloxScripts/main/Misc%20Scripts/sharkbite2.lua",true))()
end)

about:Button("鲨口求生1",function()
loadstring(game:HttpGet("https://pastebin.com/raw/YYVLbzVg", true))()
end)

about:Button("鲨口求生2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/LOOF-sys/Roblox-Shit/main/SharkBite.lua",true))()
end)

about:Button("鲨口求生3",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Lolboxo/SharkBiteV3/main/SharkBiteV3.1'))()
end)

about:Button("鲨口求生刷船",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/ghostapustaja/legionhub/main/sharkbite2'),true))()
end)

local UITab59 = win:Tab("『奎尔湖』",'7734068321')

local about = UITab59:section("『奎尔湖』",true)

about:Button("奎尔湖1",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Solx69/Shit-Boy-Hub-Main/main/Master.lua'))()
end)

about:Toggle("无敌模式","", false, function(Value)
        game.ReplicatedStorage.DamageHumanoid:FireServer(-2e9)
    end)
    
    about:Button("无限金钱", function()
    local money = {
       [1] = -9999,
       [2] = "Buy"
    }
    
    game:GetService("ReplicatedStorage").Pay:FireServer(unpack(money))
    end)
    
    about:Button("无限金币", function()
    local gold = {
       [1] = game:GetService("Players").LocalPlayer.GoldCoins,
       [2] = 99999
    }
    
    game:GetService("ReplicatedStorage").ChangeValue:FireServer(unpack(gold))
    end)
    
    about:Button("给所有物品", function()
    game.ReplicatedStorage.GiveTool:FireServer("SeaScooter")
    game.ReplicatedStorage.GiveTool:FireServer("Lantern")
    game.ReplicatedStorage.GiveTool:FireServer("Compass")
    game.ReplicatedStorage.GiveTool:FireServer("ItemFinder")
    game.ReplicatedStorage.GiveTool:FireServer("Aquabreather")
    end)
    
    about:Button("红色套装", function()
    game.ReplicatedStorage.ChangeOutfits:FireServer("FireSuit")
    end)
    
    about:Button("黄色套装", function()
    game.ReplicatedStorage.ChangeOutfits:FireServer("HazmatSuit")
    end)
    
    about:Button("海盗套装", function()
    game.ReplicatedStorage.ChangeOutfits:FireServer("PirateCostume")
    end)
    
    about:Button("动力套装", function()
    game.ReplicatedStorage.ChangeOutfits:FireServer("SuperScuba")
    end)
    
    local UITab60 = win:Tab("『旗帜战争』",'7734068321')

local about = UITab60:section("『旗帜战争』",true)

about:Button("旗帜战争1",function()
loadstring(game:HttpGet("https://pastefy.app/otEg6PJV/raw"))()
end)

about:Button("旗帜战争2",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Flag%20Wars.txt'))()
end)

local UITab61 = win:Tab("『COOP 合作社』",'7734068321')

local about = UITab61:section("『COOP 合作社』",true)

about:Button("禁漫中心",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/lililiugg/main/coo.lua"))()
end)

local UITab62 = win:Tab("『冲突之海』",'7734068321')

local about = UITab62:section("『冲突之海』",true)

about:Button("禁漫中心",function()
loadstring(game:HttpGet("https://pastebin.com/raw/eGtFQy2"))()
end)

local UITab63 = win:Tab("『怪兽宇宙』",'7734068321')

local about = UITab63:section("『怪兽宇宙』",true)

about:Button("怪兽宇宙1",function()
loadstring(game:HttpGet("https://pastefy.app/oRWEIEcJ/raw"))()
end)

local UITab64 = win:Tab("『恐怖奶奶』",'7734068321')

local about = UITab64:section("『恐怖奶奶』",true)

about:Button("恐怖奶奶1",function()
loadstring(game:HttpGet("https://pastefy.app/o688Jvmn/raw"))()
end)

local UITab65 = win:Tab("『奶酪逃亡』",'7734068321')

local about = UITab65:section("『奶酪逃亡』",true)

about:Button("奶酪逃亡1",function()
loadstring(game:HttpGet("https://pastefy.app/IIpzN8f5/raw"))()
end)

local UITab84 = win:Tab("柔术",'16060333448')

local about = UITab84:section("『功能』",true)

about:Button("无限:红色逆转", function()
    local args = {
        [1] = "Infinity: Reversal Red"
    }
    game:GetService("ReplicatedStorage").Remotes.Server.Combat.Skill:FireServer(unpack(args))
end)

about:Button("自动腿击", function()
    local mobs = workspace.Objects.Mobs
    local kingOfCurses = mobs and mobs:FindFirstChild("King Of Curses")
    
    if kingOfCurses and kingOfCurses:FindFirstChild("Humanoid") then
        local args = {
            [1] = 1,
            [2] = {[1] = kingOfCurses.Humanoid},
            [3] = 16
        }
        game:GetService("ReplicatedStorage").Remotes.Server.Combat.M1:FireServer(unpack(args))
    end
end)

about:Button("无限:蓝色失效", function()
    local args = {
        [1] = "Infinity: Lapse Blue"
    }
    game:GetService("ReplicatedStorage").Remotes.Server.Combat.Skill:FireServer(unpack(args))
end)

about:Button("无限:空间打击", function()
    local args = {
        [1] = "Infinity: Spatial Pummel"
    }
    game:GetService("ReplicatedStorage").Remotes.Server.Combat.Skill:FireServer(unpack(args))
end)

about:Button("无限:穆根", function()
    local args = {
        [1] = "Infinity: Mugen"
    }
    game:GetService("ReplicatedStorage").Remotes.Server.Combat.Skill:FireServer(unpack(args))
end)

about:Button("无限:红色传说", function()
    local args = {
        [1] = "Infinity: Red Transmission"
    }
    game:GetService("ReplicatedStorage").Remotes.Server.Combat.Skill:FireServer(unpack(args))
end)

about:Button("无限:空间紫色", function()
    local args = {
        [1] = "Infinity: Hollow Purple"
    }
    game:GetService("ReplicatedStorage").Remotes.Server.Combat.Skill:FireServer(unpack(args))
end)

about:Button("空间:域扩展", function()
    local args = {
        [1] = "Domain Expansion: Unlimited Void"
    }
    game:GetService("ReplicatedStorage").Remotes.Server.Combat.Skill:FireServer(unpack(args))
end)

about:Button("无限:重拳", function()
    game:GetService("ReplicatedStorage").Remotes.Server.Combat.M2:FireServer()
end)

about:Button("烛光甘蓝", function()
    local args = {
        [1] = "CanDomain",
        [2] = true
    }
    game:GetService("ReplicatedStorage").Remotes.Server.Combat.ReplicateClientInfo:FireServer(unpack(args))
end)

about:Button("最大:六只眼睛", function()
    local args = {
        [1] = "Maximum: Six Eyes"
    }
    game:GetService("ReplicatedStorage").Remotes.Server.Combat.Skill:FireServer(unpack(args))
end)

about:Label("柔术遗产功能")

about:Button("点我远程接受任务", function()
    local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
    if playerGui:FindFirstChild("QuestGui") and playerGui.QuestGui.Frame:FindFirstChild("K") then
        playerGui.QuestGui.Frame.K:FireServer()
    end
end)

about:Button("自动开大", function()
    local args = {
        [1] = "Combat",
        [2] = "UseZ"
    }
    game:GetService("ReplicatedStorage").RemoteEvent.information:FireServer(unpack(args))
end)

about:Button("自动攻击", function()
    local localPlayer = game:GetService("Players").LocalPlayer
    local character = localPlayer.Character
    
    if character and character:FindFirstChild("Combat") then
        local combat = character.Combat
        if combat:FindFirstChild("RemoteEvent") then
            local args = {
                [1] = "Combat",
                [2] = "Combo"
            }
            combat.RemoteEvent:FireServer(unpack(args))
        end
    end
end)

about:Label("以上功能都有bug，希望轻喷")

about:Button("传送到接收任务的地方", function()
    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(-4046.29931640625, 1190.1025390625, -4340.392578125)
    end
end)

about:Label("柔术神器功能")

about:Button("无限快速冲刺", function()
    local knitServices = game:GetService("ReplicatedStorage").Knit.Knit.Services
    if knitServices.GojoService and knitServices.GojoService.RE and knitServices.GojoService.RE:FindFirstChild("Chase") then
        knitServices.GojoService.RE.Chase:FireServer()
    end
end)

about:Button("无限逆转红色", function()
    local knitServices = game:GetService("ReplicatedStorage").Knit.Knit.Services
    if knitServices.ReversalRedService and knitServices.ReversalRedService.RE and knitServices.ReversalRedService.RE:FindFirstChild("Activated") then
        local args = {[1] = false}
        knitServices.ReversalRedService.RE.Activated:FireServer(unpack(args))
    end
end)

about:Button("无限双倍踢球", function()
    local knitServices = game:GetService("ReplicatedStorage").Knit.Knit.Services
    if knitServices.TwofoldKickService and knitServices.TwofoldKickService.RE and knitServices.TwofoldKickService.RE:FindFirstChild("Activated") then
        local args = {[1] = false}
        knitServices.TwofoldKickService.RE.Activated:FireServer(unpack(args))
    end
end)

about:Button("无限自动攻击", function()
    local knitServices = game:GetService("ReplicatedStorage").Knit.Knit.Services
    if knitServices.GojoService and knitServices.GojoService.RE and knitServices.GojoService.RE:FindFirstChild("Activated") then
        local args = {[1] = false}
        knitServices.GojoService.RE.Activated:FireServer(unpack(args))
    end
end)

about:Button("自动防御", function()
    local knitServices = game:GetService("ReplicatedStorage").Knit.Knit.Services
    if knitServices.BlockService and knitServices.BlockService.RE and knitServices.BlockService.RE:FindFirstChild("Deactivated") then
        knitServices.BlockService.RE.Deactivated:FireServer()
    end
end)

about:Button("无限拉普斯蓝色", function()
    local knitServices = game:GetService("ReplicatedStorage").Knit.Knit.Services
    if knitServices.LapseBlueService and knitServices.LapseBlueService.RE and knitServices.LapseBlueService.RE:FindFirstChild("Activated") then
        knitServices.LapseBlueService.RE.Activated:FireServer()
    end
end)

local UITab84 = win:Tab("水下公司",'16060333448')

local about = UITab84:section("『功能』",true)

about:Toggle("自动拾取物品", "AutoPickup", false, function(state)
    autoPickupRunning = state
    if state and not autoPickupThread then
        autoPickupThread = coroutine.create(function()
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            local startPosition = Vector3.new(-503.2907409667969, -43.40001678466797, -1464.4521484375)
            local dropPosition = Vector3.new(-503.2907409667969, -43.40001678466797, -1464.4521484375)  
            local distanceThreshold = 200
            
            while autoPickupRunning do
                local itemsFolder = workspace:FindFirstChild("Items")
                if itemsFolder then
                    for _, item in ipairs(itemsFolder:GetChildren()) do
                        if not autoPickupRunning then break end
                        
                        local primaryPart = item.PrimaryPart or item:FindFirstChild("PrimaryPart")
                        if primaryPart then
                            local position = primaryPart.Position
                            if (position - startPosition).magnitude > distanceThreshold then
                                humanoidRootPart.CFrame = CFrame.new(position + Vector3.new(0, 1, 0))
                                task.wait(0.5)
                                
                                for _, prompt in ipairs(item:GetDescendants()) do
                                    if prompt:IsA("ProximityPrompt") then
                                        fireproximityprompt(prompt)
                                        break
                                    end
                                end
                                
                                task.wait(0.5)
                                humanoidRootPart.CFrame = CFrame.new(dropPosition)
                                task.wait(0.5)
                                
                                local replicatedStorage = game:GetService("ReplicatedStorage")
                                local dropRemote = replicatedStorage:FindFirstChild("Drop")
                                if dropRemote then
                                    dropRemote:FireServer()
                                end
                                
                                task.wait(0.5)
                            end
                        end
                    end
                end
                task.wait(1)
            end
            autoPickupThread = nil
        end)
        coroutine.resume(autoPickupThread)
    elseif not state and autoPickupThread then
        autoPickupRunning = false
        autoPickupThread = nil
    end
end)

local UITab84 = win:Tab("在超市生活一周",'16060333448')

local about = UITab84:section("『功能』",true)

about:Toggle("自动收集食物", "AutoCollectFood", false, function(state)
    while state do
        task.wait()
        local mapUtil = workspace.Map.Util
        if mapUtil and mapUtil:FindFirstChild("Items") then
            for _,v in next, mapUtil.Items:GetChildren() do
                if v:FindFirstChild("ToolStats") and v.ToolStats:FindFirstChild("ItemType") and v.ToolStats.ItemType.Value == "Food" then
                    game:GetService("ReplicatedStorage").Remotes.RequestPickupItem:FireServer(v)
                end
            end
        end
    end
end)

about:Toggle("自动收集手电筒", "AutoCollectFlashlight", false, function(state)
    while state do
        task.wait()
        local mapUtil = workspace.Map.Util
        if mapUtil and mapUtil:FindFirstChild("Items") then
            for _,v in next, mapUtil.Items:GetChildren() do
                if v:FindFirstChild("ToolStats") and v.ToolStats:FindFirstChild("ItemType") and v.ToolStats.ItemType.Value == "Flashlight" then
                    game:GetService("ReplicatedStorage").Remotes.RequestPickupItem:FireServer(v)
                end
            end
        end
    end
end)

about:Toggle("自动收集近战武器", "AutoCollectMelee", false, function(state)
    while state do
        task.wait()
        local mapUtil = workspace.Map.Util
        if mapUtil and mapUtil:FindFirstChild("Items") then
            for _,v in next, mapUtil.Items:GetChildren() do
                if v:FindFirstChild("ToolStats") and v.ToolStats:FindFirstChild("ItemType") and v.ToolStats.ItemType.Value == "Melee" then
                    game:GetService("ReplicatedStorage").Remotes.RequestPickupItem:FireServer(v)
                end
            end
        end
    end
end)

about:Toggle("自动收集枪", "AutoCollectGun", false, function(state)
    while state do
        task.wait()
        local mapUtil = workspace.Map.Util
        if mapUtil and mapUtil:FindFirstChild("Items") then
            for _,v in next, mapUtil.Items:GetChildren() do
                if v:FindFirstChild("ToolStats") and v.ToolStats:FindFirstChild("ItemType") and v.ToolStats.ItemType.Value == "Gun" then
                    game:GetService("ReplicatedStorage").Remotes.RequestPickupItem:FireServer(v)
                end
            end
        end
    end
end)

about:Toggle("自动收集药品", "AutoCollectHealth", false, function(state)
    while state do
        task.wait()
        local mapUtil = workspace.Map.Util
        if mapUtil and mapUtil:FindFirstChild("Items") then
            for _,v in next, mapUtil.Items:GetChildren() do
                if v:FindFirstChild("ToolStats") and v.ToolStats:FindFirstChild("ItemType") and v.ToolStats.ItemType.Value == "Health" then
                    game:GetService("ReplicatedStorage").Remotes.RequestPickupItem:FireServer(v)
                end
            end
        end
    end
end)

about:Toggle("自动装弹", "AutoReload", false, function(state)
    while state do
        task.wait()
        game:GetService("ReplicatedStorage").Remotes.Weapon.GunReloaded:FireServer()
    end
end)

about:Toggle("自动开枪", "AutoShoot", false, function(state)
    while state do
        task.wait()
        local localPlayer = game.Players.LocalPlayer
        local backpack = localPlayer.Backpack
        local character = localPlayer.Character
        
        if character and workspace:FindFirstChild("Enemies") then
            for _, v in next, backpack:GetChildren() do
                if v:FindFirstChild("ToolStats") and v.ToolStats:FindFirstChild("Ammo") then
                    for _,e in next, workspace.Enemies:GetChildren() do
                        if e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 and e:FindFirstChild("Head") then
                            local BulletsPerShot = v.ToolStats.BulletsPerShot.Value
                            local DirectionTbl = {}
                            
                            for i = 1, BulletsPerShot do
                                table.insert(DirectionTbl, Vector3.new(e.Head.Position.X, e.Head.Position.Y, e.Head.Position.Z).Unit)
                            end
                            
                            local args = {
                                [1] = {
                                    ["FiringPlayer"] = localPlayer,
                                    ["FiredTime"] = os.time(),
                                    ["FiringPlayerUserId"] = localPlayer.UserId,
                                    ["Origin"] = Vector3.new(character:GetPivot().Position),
                                    ["UID"] = localPlayer.UserId .. "_1",
                                    ["WeaponInstance"] = v,
                                    ["ThisBulletProperties"] = {
                                        ["BulletSpread"] = v.ToolStats.BulletSpread.Value,
                                        ["BulletsPerShot"] = v.ToolStats.BulletsPerShot.Value,
                                        ["BulletPenetration"] = v.ToolStats.BulletPenetration.Value,
                                        ["BulletSpeed"] = v.ToolStats.BulletSpeed.Value,
                                        ["FireSound"] = v.ToolStats.FireSound.Value,
                                        ["BulletSize"] = v.ToolStats.BulletSize.Value
                                    },
                                    ["DirectionTbl"] = DirectionTbl
                                }
                            }
                            game:GetService("ReplicatedStorage").Remotes.Weapon.GunFired:FireServer(unpack(args))
                        end
                    end
                end
            end
        end
    end
end)

about:Toggle("修改超级枪", "SuperGun", false, function(state)
    while state do
        task.wait()
        local localPlayer = game.Players.LocalPlayer
        local backpack = localPlayer.Backpack
        
        for _,v in next, backpack:GetChildren() do
            if v:FindFirstChild("ToolStats") and v.ToolStats:FindFirstChild("Ammo") then
                v.ToolStats.ReloadTime.Value = 0
                v.ToolStats.FireDelay.Value = 0
                v.ToolStats.Ammo.Value = math.huge
                v.ToolStats.Damage.Value = math.huge
            end
        end
    end
end)

about:Toggle("无限体力和饥饿度", "InfiniteStats", false, function(state)
    while state do
        task.wait()
        local localPlayer = game.Players.LocalPlayer
        local character = localPlayer.Character
        
        if character and character:FindFirstChild("CharacterData") then
            local characterData = character.CharacterData
            
            if characterData:FindFirstChild("MaxStamina") and characterData:FindFirstChild("MaxEnergy") then
                characterData.MaxStamina.Value = math.huge
                characterData.MaxEnergy.Value = math.huge
                
                if characterData:FindFirstChild("Energy") then
                    characterData.Energy.Value = characterData.MaxEnergy.Value
                end
                
                if characterData:FindFirstChild("Stamina") then
                    characterData.Stamina.Value = characterData.MaxStamina.Value
                end
            end
        end
    end
end)

about:Toggle("夜晚自动躲避", "NightAutoHide", false, function(state)
    while state do
        task.wait()
        local localPlayer = game.Players.LocalPlayer
        local character = localPlayer.Character
        
        if character then
            local gameInfo = game:GetService("ReplicatedStorage").GameInfo
            if gameInfo and gameInfo:FindFirstChild("TimeOfDay") then
                if gameInfo.TimeOfDay.Value == "Night" then
                    local oldpos = character:GetPivot().Position
                    
                    repeat 
                        task.wait()
                        character:PivotTo(CFrame.new(306.18927001953125, 36.67450714111328, -519.2435913085938))
                        if character:FindFirstChild("HumanoidRootPart") then
                            character.HumanoidRootPart.Anchored = true
                        end
                    until gameInfo.TimeOfDay.Value ~= "Night"
                    
                    if character:FindFirstChild("HumanoidRootPart") then
                        character.HumanoidRootPart.CFrame = CFrame.new(oldpos)
                        character.HumanoidRootPart.Anchored = false
                    end
                end
            end
        end
    end
end)

local UITab84 = win:Tab("寻宝模拟器",'16060333448')

local about = UITab84:section("『功能』",true)

local ToolName = ""
local PlayerTool = {}

local ToolDropdown = about:Dropdown("选择工具", "SelectTool", PlayerTool, function(Value)
    ToolName = Value
end)

about:Button("刷新工具名称", function()
    PlayerTool = {}
    local localPlayer = game.Players.LocalPlayer
    local backpack = localPlayer.Backpack
    
    for i, v in pairs(backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(PlayerTool, v.Name)
        end
    end
    ToolDropdown:SetOptions(PlayerTool)
end)

about:Toggle("自动农场", "AutoFarm", false, function(state)
    while state do
        task.wait()
        local localPlayer = game.Players.LocalPlayer
        local character = localPlayer.Character
        
        if character then
            local tool = character:FindFirstChild(ToolName) or localPlayer.Backpack:FindFirstChild(ToolName)
            local humanoid = character:FindFirstChild("Humanoid")
            
            if not character:FindFirstChild(ToolName) and tool and humanoid then
                humanoid:EquipTool(tool)
            elseif not tool then
                warn("工具未找到: " .. ToolName)
                break
            end
            
            if workspace:FindFirstChild("SandBlocks") then
                local playerHead = character:FindFirstChild("Head")
                if playerHead then
                    for i, v in pairs(workspace.SandBlocks:GetChildren()) do
                        if v and v:IsA("BasePart") then
                            local distance = (playerHead.Position - v.Position).magnitude
                            if distance <= 30 and character:FindFirstChild("Bucket") then
                                local bucket = character.Bucket
                                if bucket:FindFirstChild("RemoteClick") then
                                    bucket.RemoteClick:FireServer(v)
                                    task.wait()
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

about:Toggle("自动传送至宝箱", "AutoTeleportChest", false, function(state)
    chest = state
    while chest do
        task.wait(3)
        local character = game.Players.LocalPlayer.Character
        
        if character and character:FindFirstChild("HumanoidRootPart") and workspace:FindFirstChild("SandBlocks") then
            for _, sandBlock in ipairs(workspace.SandBlocks:GetChildren()) do
                if sandBlock:FindFirstChild("Chest") then
                    local chestPosition = sandBlock.CFrame
                    character.HumanoidRootPart.CFrame = chestPosition
                    task.wait(0.5)
                    break
                end
            end
        end
    end
end)

about:Toggle("自动重生", "AutoRebirth", false, function(state)
    Rebirth = state
    spawn(function()
        while true do
            task.wait(1)
            if Rebirth then
                local localPlayer = game.Players.LocalPlayer
                local playerGui = localPlayer.PlayerGui
                
                if playerGui:FindFirstChild("Gui") then
                    local gui = playerGui.Gui
                    local coinsText = gui.Buttons.Coins.Amount.Text:gsub(',', '')
                    local neededText = gui.Rebirth.Needed.Coins.Amount.Text:gsub(',', '')
                    
                    local currentCoins = tonumber(coinsText)
                    local neededCoins = tonumber(neededText)
                    
                    if currentCoins and neededCoins and currentCoins > neededCoins then
                        game.ReplicatedStorage.Events.Rebirth:FireServer()
                        task.wait(0.1)
                        
                        if gui.Popups:FindFirstChild("GiveReward") then
                            gui.Popups.GiveReward.Visible = false
                        end
                    end
                end
            end
        end
    end)
end)

about:Toggle("自动购买收集工具", "AutoBuyTools", false, function(state)
    while state do
        task.wait()
        local localPlayer = game.Players.LocalPlayer
        local leaderstats = localPlayer:FindFirstChild("leaderstats")
        
        if leaderstats then
            local coinsStat = leaderstats:FindFirstChild("Coins")
            if coinsStat then
                local coins = coinsStat.Value
                
                if coins >= 0 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Bucket")
                end
                
                if coins >= 100 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Spade")
                end
                
                if coins >= 250 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Toy Shovel")
                end
                
                if coins >= 600 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Small Shovel")
                end
                
                if coins >= 2100 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Medium Shovel")
                end
                
                if coins >= 8800 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Large Shovel")
                end
                
                if coins >= 24000 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Big Scooper")
                end
                
                if coins >= 65000 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Vacuum")
                end
                
                if coins >= 250000 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Giant Shovel")
                end
                
                if coins >= 500000 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Metal Detector")
                end
                
                if coins >= 3000000 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Jack Hammer")
                end
                
                if coins >= 10000000 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Golden Spoon")
                end
            end
        end
    end
end)

about:Toggle("自动购买填充背包", "AutoBuyBags", false, function(state)
    while state do
        task.wait()
        local localPlayer = game.Players.LocalPlayer
        local leaderstats = localPlayer:FindFirstChild("leaderstats")
        
        if leaderstats then
            local coinsStat = leaderstats:FindFirstChild("Coins")
            if coinsStat then
                local coins = coinsStat.Value
                
                if coins >= 0 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Starterpack")
                end
                
                if coins >= 150 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Small Bag")
                end
                
                if coins >= 375 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Medium Bag")
                end
                
                if coins >= 900 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Large Bag")
                end
                
                if coins >= 3150 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("XL Bag")
                end
                
                if coins >= 13200 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("XXL Bag")
                end
                
                if coins >= 36000 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("SuperStorage™")
                end
                
                if coins >= 75000 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("SuperStorage™ 2")
                end
                
                if coins >= 150000 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Sand Safe")
                end
                
                if coins >= 350000 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Sand Vault")
                end
                
                if coins >= 700000 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("SuperStorage™ 3")
                end
                
                if coins >= 1500000 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Small Canister")
                end
                
                if coins >= 4000000 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Medium Canister")
                end
                
                if coins >= 8000000 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Large Canister")
                end
                
                if coins >= 9000000000 then
                    game:GetService("ReplicatedStorage").Events.Checkout:FireServer("Infinite")
                end
            end
        end
    end
end)

local CratesName = ""
local CratesDropdown = {}

local CratesDropdown = about:Dropdown("选择箱子", "SelectCrate", CratesDropdown, function(Value)
    CratesName = Value
end)

about:Toggle("自动购买", "AutoBuyCrate", false, function(state)
    while state do
        game:GetService("ReplicatedStorage").Events.BuyCrate:FireServer(CratesName, game.Players.LocalPlayer.Name, 1)
        task.wait()
    end
end)

local UITab84 = win:Tab("汽车破坏模拟器",'16060333448')

local about = UITab84:section("『功能』",true)

about:Toggle("自动刷钱", "AutoFarm", false, function(bool)
    if bool == true then
        AutofarmEnabled = true
        
        while AutofarmEnabled do
            task.wait(0.5)
            if canSpawn() then
                doBreak = true
                task.delay(10, function()
                    doBreak = false
                end)
                pcall(function()
                    spawnBestCar()
                    destroyCar()
                end)
            end
        end
    else
        AutofarmEnabled = false
    end
end)

about:Toggle("自动逃脱", "AutoEscape", false, function(state)
    heleicopterspawn = state
end)

about:Toggle("反挂机", "AntiAFK", false, function(bool)
    local localPlayer = game.Players.LocalPlayer
    
    if bool == true then
        for i,v in pairs(getconnections(localPlayer.Idled)) do
            v:Disable()
        end
    else
        for i,v in pairs(getconnections(localPlayer.Idled)) do
            v:Enable()
        end
    end
end)

about:Button("生成车辆", function()
    spawnBestCar()
end)

about:Button("摧毁车辆", function()
    doBreak = true
    task.delay(10, function() 
        doBreak = false 
    end)
    pcall(function()
        destroyCar()
    end)
end)

workspace.ChildAdded:Connect(function(newpart)
    task.wait(1)
    if newpart.Name == "Helicopter" then
        task.wait(0.5)
        if heleicopterspawn then
            local localPlayer = game.Players.LocalPlayer
            local character = localPlayer.Character
            
            if character then
                local humanoid = character:FindFirstChild("Humanoid")
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                
                if humanoid and humanoidRootPart then
                    humanoid:ChangeState("GettingUp")
                    task.wait(0.1)
                    humanoid:ChangeState("Jumping")
                    task.wait(0.5)
                    
                    if workspace:FindFirstChild("Helicopter") and workspace.Helicopter:FindFirstChild("Start") then
                        humanoidRootPart.CFrame = workspace.Helicopter.Start.CFrame
                    end
                end
            end
        end
    end
end)


local UITab66 = win:Tab("『极速奔驰』",'7734068321')

local about = UITab66:section("『极速奔驰』",true)

about:Toggle("自动跳过", "AutoSkipFast", false, function(bool)
    getgenv().AutoFarmMainFast = bool
    while getgenv().AutoFarmMainFast do
        for _ = 1, 30 do
            game:GetService("ReplicatedStorage").BeatLevel:FireServer(0.1, "Level 1", "Normal", false)
            task.wait(0.07)
        end
        for _ = 1, 3 do
            game:GetService("ReplicatedStorage").SetLevel:FireServer(0)
            task.wait(0.1)
        end
        task.wait(0.4)
    end
end)

about:Toggle("自动跳过2", "AutoSkipSlow", false, function(bool)
    getgenv().AutoFarmMainSlow = bool
    while getgenv().AutoFarmMainSlow do
        for _ = 1, 33 do
            game:GetService("ReplicatedStorage").BeatLevel:FireServer(0.1, "Level 1", "Normal", false)
            task.wait(0.25)
        end
        for _ = 1, 3 do
            game:GetService("ReplicatedStorage").SetLevel:FireServer(0)
            task.wait(0.3)
        end
        task.wait(0.5)
    end
end)

about:Button("获取速度线圈", function()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local speedCoil = replicatedStorage:FindFirstChild("Speed Coil")
    
    if speedCoil then
        local copy = speedCoil:Clone()
        local localPlayer = game:GetService("Players").LocalPlayer
        local backpack = localPlayer.Backpack
        
        copy.Parent = backpack
    end
end)

about:Button("极速奔驰1",function()
loadstring(game:HttpGet("https://pastefy.app/Y7607jwb/raw"))()
end)

local UITab67 = win:Tab("『射击光束模拟器』",'7734068321')

local about = UITab67:section("『射击光束模拟器』",true)

about:Button("射击光束模拟器1",function()
loadstring(game:HttpGet("https://pastefy.app/51yMuaCc/raw"))()
end)

local UITab68 = win:Tab("『合并滴管』",'7734068321')

local about = UITab68:section("『合并滴管』",true)

about:Toggle("自动收集", "AutoCollect", false, function(bool)
    getgenv().collect = bool 
    while getgenv().collect do
        local plr = game.Players.LocalPlayer
        if workspace.Tycoon.Plot[plr.Team.Name] and workspace.Tycoon.Plot[plr.Team.Name]:FindFirstChild("DropParts") then
            for _, part in pairs(workspace.Tycoon.Plot[plr.Team.Name].DropParts:GetDescendants()) do
                if part.Name == "Wool" and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    part.CFrame = plr.Character.HumanoidRootPart.CFrame
                end
            end
        end
        task.wait(0.25)
    end
end)

about:Toggle("自动存款", "AutoDeposit", false, function(bool)
    getgenv().deposit = bool 
    while getgenv().deposit do
        local plr = game.Players.LocalPlayer
        if workspace.Tycoon.Plot[plr.Team.Name] and workspace.Tycoon.Plot[plr.Team.Name]:FindFirstChild("Buttons_E") and workspace.Tycoon.Plot[plr.Team.Name].Buttons_E:FindFirstChild("Put") and workspace.Tycoon.Plot[plr.Team.Name].Buttons_E.Put:FindFirstChild("Head") and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            firetouchinterest(workspace.Tycoon.Plot[plr.Team.Name].Buttons_E.Put.Head, plr.Character.HumanoidRootPart, 0)
            firetouchinterest(workspace.Tycoon.Plot[plr.Team.Name].Buttons_E.Put.Head, plr.Character.HumanoidRootPart, 1)
        end
        task.wait(0.25)
    end
end)

about:Toggle("自动升级", "AutoUpgrade", false, function(bool)
    getgenv().upgrade = bool 
    while getgenv().upgrade do
        local plr = game.Players.LocalPlayer
        if workspace.Tycoon.Plot[plr.Team.Name] and workspace.Tycoon.Plot[plr.Team.Name]:FindFirstChild("Buttons_E") and workspace.Tycoon.Plot[plr.Team.Name].Buttons_E:FindFirstChild("Upgrade") and workspace.Tycoon.Plot[plr.Team.Name].Buttons_E.Upgrade:FindFirstChild("Head") and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            firetouchinterest(workspace.Tycoon.Plot[plr.Team.Name].Buttons_E.Upgrade.Head, plr.Character.HumanoidRootPart, 0)
            firetouchinterest(workspace.Tycoon.Plot[plr.Team.Name].Buttons_E.Upgrade.Head, plr.Character.HumanoidRootPart, 1)
        end
        task.wait(0.25)
    end
end)

about:Toggle("自动滴管", "AutoMerge", false, function(bool)
    getgenv().merge = bool 
    while getgenv().merge do
        local plr = game.Players.LocalPlayer
        if workspace.Tycoon.Plot[plr.Team.Name] and workspace.Tycoon.Plot[plr.Team.Name]:FindFirstChild("Buttons_E") and workspace.Tycoon.Plot[plr.Team.Name].Buttons_E:FindFirstChild("Merge") and workspace.Tycoon.Plot[plr.Team.Name].Buttons_E.Merge:FindFirstChild("Head") and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            firetouchinterest(workspace.Tycoon.Plot[plr.Team.Name].Buttons_E.Merge.Head, plr.Character.HumanoidRootPart, 0)
            firetouchinterest(workspace.Tycoon.Plot[plr.Team.Name].Buttons_E.Merge.Head, plr.Character.HumanoidRootPart, 1)
        end
        task.wait(0.25)
    end
end)

about:Button("合并滴管1",function()
loadstring(game:HttpGet("https://pastefy.app/NpBrBCqM/raw"))()

local UITab84 = win:Tab("开战宇宙",'16060333448')

local about = UITab84:section("『功能』",true)

about:Label("自动使用技能")

about:Textbox("技能名称", "SkillName", "请输入", function(text)
    _G.skillname = tostring(text)
    for i,v in pairs(getgc(true)) do
        if type(v) == "table" and rawget(v,"ID") ~= nil then
            if type(v.ID) ~= "number" then
                local test = string.split(v.ID, "#")
                if test[1] == _G.skillname then
                    _G.skillname = v.ID
                end
            end
        end
    end
end)

about:Label("攻击范围")

about:Textbox("范围数值", "AttackRange", "请输入", function(text)
    _G.distance = tonumber(text)
end)

about:Toggle("自动使用所有能力", "UseAllAbilities", false, function(state)
    _G.abilitiestouse = state
    while _G.abilitiestouse do
        task.wait(0.5)
        pcall(function()
            for i,v in pairs(getgc(true)) do
                if type(v) == "table" and rawget(v,"globalCooldown") ~= nil then
                    task.wait()
                    for a,b in pairs(v) do
                        if a == "ID" then
                            task.wait(0.1)
                            game.Players.LocalPlayer.Character.ClientRunner.KaijuControlEvent:FireServer(b)
                        end
                    end
                end
            end
        end)
    end
end)

about:Toggle("自动使用所有攻击能力", "UseAttackAbilities", false, function(state)
    _G.abilitiestouse2 = state
    while _G.abilitiestouse2 do
        task.wait(0.5)
        pcall(function()
            for i,v in pairs(getgc(true)) do
                if type(v) == "table" and rawget(v,"globalCooldown") ~= nil and v.Cooldown < 6.1 then
                    task.wait(0.5)
                    game.Players.LocalPlayer.Character.ClientRunner.KaijuControlEvent:FireServer(v.ID)
                end
            end
        end)
    end
end)

about:Toggle("自动传送", "AutoTeleport", false, function(state)
    _G.test = state
    while _G.test do
        task.wait()
        pcall(function()
            _G.rat = nil
            local distance = math.huge
            local localPlayer = game.Players.LocalPlayer
            local character = localPlayer.Character
            
            if character and character:FindFirstChild("HumanoidRootPart") then
                for i,v in pairs(game:GetService("Workspace").Map:GetDescendants()) do
                    if v.Name == "BoundingBox" and v.Parent:FindFirstChild("bValues") and v.Parent.bValues:FindFirstChild("Health") then
                        local healthValue = v.Parent.bValues.Health.Value
                        local maxHealthValue = v.Parent.bValues.MaxHealth.Value
                        local distanceToTarget = (character.HumanoidRootPart.Position - v.Position).Magnitude
                        
                        if healthValue > maxHealthValue/2 and distanceToTarget < (_G.distance or 100) then
                            if distanceToTarget < distance then
                                distance = distanceToTarget
                                _G.rat = v
                            end
                        end
                    end
                end
                
                if _G.rat then
                    repeat 
                        task.wait()
                        local location = _G.rat.Position
                        local PlayerModule = require(localPlayer.PlayerScripts.PlayerModule)
                        local ClickToMoveController = PlayerModule:GetClickToMoveController()
                        ClickToMoveController:SetShowPath(false)
                        ClickToMoveController:SetUserJumpEnabled(false)
                        ClickToMoveController:MoveTo(location, true)
                    until localPlayer:DistanceFromCharacter(_G.rat.Position) < 60 or not _G.test
                    
                    if character:FindFirstChild("ClientRunner") then
                        character.ClientRunner.KaijuControlEvent:FireServer(_G.skillname)
                    end
                end
            end
        end)
    end
end)

about:Toggle("自动重生", "AutoRespawn", false, function(state)
    _G.autospawn = state
    while _G.autospawn do
        task.wait()
        pcall(function()
            local localPlayer = game.Players.LocalPlayer
            local playerGui = localPlayer.PlayerGui
            
            if playerGui:FindFirstChild("newUI") then
                local newUI = playerGui.newUI
                if newUI:FindFirstChild("PlayingUI") then
                    local playingUI = newUI.PlayingUI
                    
                    if _G.crack and playingUI.Visible == false then
                        game:GetService("ReplicatedStorage").Packages.Knit.Services.KaijuService.RF.Morph:InvokeServer(_G.crack, _G.crack1, nil, _G.crack3)
                        task.wait(5)
                        for i,v in pairs(getgc(true)) do
                            if type(v) == "table" and rawget(v,"ID") ~= nil and type(v.ID) ~= "number" then
                                local test = string.split(v.ID, "#")
                                local test2 = string.split(_G.skillname, "#")
                                if test[1] == test2[1] then
                                    _G.skillname = v.ID
                                end
                            end
                        end
                        task.wait(10)
                    elseif _G.crack2 and playingUI.Visible == false then
                        local test = math.random(1,4)
                        local spawnLocations = game:GetService("ReplicatedStorage").ReplicatedAssets.SpawnLocations
                        
                        if spawnLocations then
                            local count = 0
                            for i,v in pairs(spawnLocations:GetChildren()) do
                                count = count + 1
                                if count == test and localPlayer.Character == nil then
                                    game:GetService("ReplicatedStorage").Packages.Knit.Services.KaijuService.RF.Morph:InvokeServer(_G.crack2, v, nil, _G.crack3)
                                    task.wait(5)
                                    for i,v in pairs(getgc(true)) do
                                        if type(v) == "table" and rawget(v,"ID") ~= nil and type(v.ID) ~= "number" then
                                            local test = string.split(v.ID, "#")
                                            local test2 = string.split(_G.skillname, "#")
                                            if test[1] == test2[1] then
                                                _G.skillname = v.ID
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        task.wait(1)
                    end
                end
            end
        end)
    end
end)

about:Toggle("自动隐藏用户", "HideNameTag", false, function(state)
    _G.nametag = state
    while _G.nametag do
        task.wait()
        pcall(function()
            local character = game.Players.LocalPlayer.Character
            if character and character:FindFirstChild("Head") then
                local head = character.Head
                if head:FindFirstChild("Nametag") then
                    head.Nametag:Destroy()
                end
            end
        end)
    end
end)

about:Button("Kill Yourself", function()
    local character = game.Players.LocalPlayer.Character
    if character then
        character:BreakJoints()
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.crack2 == nil and game.Players.LocalPlayer.Character ~= nil then
                _G.crack2 = game.Players.LocalPlayer.Character.Name
            end
        end)
    end
end)

end)local UITab69 = win:Tab("『狂野西部』",'7734068321')

local about = UITab69:section("『狂野西部』",true)

about:Button("狂野西部",function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/KeoneGithub/KeoneGithub/main/WildWestLean"),true))()
end)
local UITab70 = win:Tab("『剑斗士模拟器』",'7734068321')

local about = UITab70:section("『剑斗士模拟器』",true)

about:Button("剑斗士模拟器",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/bebedi15/DisticHub/main/Loader.lua"))()
end)

local UITab71 = win:Tab("『军事大亨』",'7734068321')

local about = UITab71:section("『军事大亨』",true)

about:Button("军事大亨",function()
loadstring(game:HttpGet"https://raw.githubusercontent.com/thedragonslayer2/Key-System/main/Load.lua")()
end)

local UITab72 = win:Tab("『最强战场』",'7734068321')

local about = UITab72:section("『最强战场』",true)

about:Button("最强战场",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/SaitamaBattlegrounds.lua"))()
end)

about:Button("最强战场2",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/zeuise0002/SSSWWW222/main/README.md'),true))()
end)

local UITab73 = win:Tab("『速度模拟器』",'7734068321')

local about = UITab73:section("『速度模拟器』",true)

about:Button("速度模拟器",function()
loadstring(game:HttpGet("https://pastebin.com/raw/DtfvE1B6"))()
end)

local UITab74 = win:Tab("武器库",'7734068321')

local about = UITab74:section("『武器库』",true)

about:Button("武器库",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/s-o-a-b/nexus/main/loadstring"))()
end)

local UITab75 = win:Tab("Papers Pls",'7734068321')

local about = UITab75:section("『Papers Pls』",true)

about:Button("Papers Pls无限金钱",function()
local Players = game:GetService("Players")
local workspace = game:GetService("Workspace")
local vehicleShop = game:GetService("Workspace").Buildings.VehicleShop
local humanoidRootPart = Players.LocalPlayer.Character.HumanoidRootPart


humanoidRootPart.CFrame = vehicleShop.MeshPart.CFrame
fireproximityprompt(vehicleShop.MeshPart.ProximityPrompt)
task.wait(0.1)
fireproximityprompt(vehicleShop.MeshPart.ProximityPrompt)
task.wait(0.1)
humanoidRootPart.CFrame = vehicleShop.MeshPart.CFrame
fireproximityprompt(vehicleShop.MeshPart.ProximityPrompt)
task.wait(0.1)
humanoidRootPart.CFrame = vehicleShop.MeshPart.CFrame
fireproximityprompt(vehicleShop.MeshPart.ProximityPrompt)
task.wait(0.1)

--poorly coded but what ever took me 2 mins inf money!! SOURCE
humanoidRootPart.CFrame = CFrame.new(325.4398498535156, 2.3936524391174316, 84.23402404785156)
fireproximityprompt(vehicleShop.MeshPart.ProximityPrompt)
task.wait(0.5)



while true do
for _,v in ipairs(vehicleShop:GetChildren()) do
    if v.Name 
    == "CarMake" or v.Name == "Carmake2" then
        for _, sigh in ipairs(v:GetDescendants()) do
            if sigh:IsA("ProximityPrompt") then
                    fireproximityprompt(sigh)
                    sigh.RequiresLineOfSight = false
            end
        end
    end
end
task.wait()
end
end)

local UITab53 = win:Tab("『驾驶帝国』",'7734068321')

local about = UITab53:section("『驾驶帝国』",true)

about:Button("驾驶帝国1",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/zeuise0002/SSSWWW222/main/README.md'),true))()
end)

about:Button("驾驶帝国2",function()
loadstring(game:HttpGet("https://soggyhubv2.vercel.app"))()
end)

about:Button("驾驶帝国3",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/drivingempire", true))()
end)

about:Button("驾驶帝国NEO",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/cool83birdcarfly02six/Lightux/main/README.md'),true))()
end)

local UITab54 = win:Tab("『飞行比赛』",'7734068321')

local about = UITab54:section("『飞行比赛』",true)

about:Button("飞行比赛1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NightCoded/script/main/fly-race.lua"))()
end)

local UITab52 = win:Tab("『破坏模拟器』",'7734068321')

local about = UITab52:section("『破坏模拟器』",true)

about:Toggle("无武器冷却", "NoWeaponCooldown", false, function(Value)
    rapidFire = Value
    spawn(function()
        while task.wait() do
            if rapidFire then
                for _,obj in pairs(debug.getregistry()) do
                    if type(obj) == "table" then
                        if obj.Cooldown then
                            obj.Cooldown = 0
                            obj.BurstWait = 0
                            obj.Bursts = 1
                        end
                    end
                end
            else
                for _,obj in pairs(debug.getregistry()) do
                    if type(obj) == "table" then
                        if obj.Cooldown then
                            obj.Cooldown = 5
                        end
                    end
                end
            end
        end
    end)
end)

about:Toggle("自动出售", "AutoSell", false, function(Value)
    autoSell = Value
    spawn(function()
        while task.wait(2) do
            if autoSell then
                game:GetService("ReplicatedStorage").Remotes.sellBricks:FireServer()
            end
        end
    end)
end)

about:Toggle("自动段位提升", "AutoRankUp", false, function(Value)
    autoRankUp = Value
    while autoRankUp do
        for i = 1, 7 do
            game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)
        end
        task.wait(1)
        game:GetService("ReplicatedStorage").Remotes.rankUp:FireServer()
        task.wait(2)
    end
end)

about:Toggle("自动刷金币", "AutoCoins", false, function(Value)
    autoCoins = Value
    while autoCoins do
        for i = 1, 50 do
            game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
        end
        task.wait(0.05)
    end
end)

about:Button("一键满级", function()
    for i = 1, 7 do
        game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)
    end
end)

about:Label("地点传送")

local locations = {
    ["出生点"] = {CFrame.new(-43.3, 5.5, -449.2), "NoZone"},
    ["赛道"] = {CFrame.new(37.0, 4.0, -454.5), "Area1"},
    ["工地"] = {CFrame.new(-108.2, 4.0, -459.9), "Area2"},
    ["农场"] = {CFrame.new(37.0, 4.0, -154.7), "Area3"},
    ["城镇"] = {CFrame.new(-108.2, 4.0, -159.6), "Area4"},
    ["港口"] = {CFrame.new(37.3, 4.0, 145.4), "Area5"},
    ["火箭"] = {CFrame.new(-108.2, 4.0, 140.4), "Area6"},
    ["军事基地"] = {CFrame.new(37.0, 4.0, 445.5), "Area7"},
    ["金字塔"] = {CFrame.new(-108.3, 4.0, 440.6), "Area8"},
    ["城堡"] = {CFrame.new(36.8, 4.0, 745.5), "Area9"},
    ["高楼"] = {CFrame.new(-108.2, 4.0, 740.4), "Area10"},
    ["火山"] = {CFrame.new(37.0, 4.0, 1096.0), "Area11"},
    ["红蓝绿黄"] = {CFrame.new(-108.0, 4.0, 1090.5), "Area12"},
    ["Emoji"] = {CFrame.new(36.9, 4.0, -754.5), "Area13"},
    ["NOOB"] = {CFrame.new(-108.3, 4.0, -759.5), "Area14"},
    ["游戏机"] = {CFrame.new(37.0, 4.0, -1054.5), "Area15"},
    ["魔方"] = {CFrame.new(-108.0, 4.0, -1059.6), "Area16"}
}

for name, data in pairs(locations) do
    about:Button(name, function()
        local localPlayer = game.Players.LocalPlayer
        local character = localPlayer.Character
        
        if character and character:FindFirstChild("HumanoidRootPart") then
            game:GetService("ReplicatedStorage").Remotes.areaChanged:FireServer(data[2])
            character.HumanoidRootPart.CFrame = data[1]
        end
    end)
end

about:Button("破坏模拟器1",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/AquaModz/DestructionSIMModded/main/DestructionSimAqua.lua'))()
end)

about:Button("无限射击",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/AquaModz/DestructionSIMModded/main/DestructionSimAqua.lua'))()
end)
local UITab49 = win:Tab("『国王遗产』",'7734068321')

local about = UITab49:section("『国王遗产』",true)

about:Button("国王遗产1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sannin9000/scripts/main/kinglegacy.lua"))()
end)

about:Button("国王遗产2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/master/legacy"))()
end)

about:Button("国王遗产3",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/hajibeza/RIPPER-HUB/main/King%20Leagacy"))()
end)

about:Button("国王遗产4",function()
loadstring(game:HttpGet"https://raw.githubusercontent.com/xDepressionx/Free-Script/main/KingLegacy.lua")()
end)

about:Button("国王遗产5",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/xOne2/King-Legacy/main/README.md"))()
end)
local UITab46 = win:Tab("『彩虹朋友』",'7734068321')

local about = UITab46:section("『彩虹朋友』",true)

about:Button("彩虹朋友1",function()
loadstring(game:HttpGet("https://pastefy.app/XoNv04vR/raw"))()
end)

about:Button("彩虹朋友2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/JNHHGaming/Rainbow-Friends/main/Rainbow%20Friends"))()
end)

local UITab47 = win:Tab("『破坏者谜团2』",'7734068321')

local about = UITab47:section("『破坏者谜团2』",true)

about:Button("破坏者谜团2  1",function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/Ethanoj1/EclipseMM2/master/Script"),true))()
end)

local UITab45 = win:Tab("『背上只因剑』",'7734068321')

local about = UITab45:section("『背上只因剑』",true)

about:Button("背上只因剑1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0SwordWarriors"))()
end)

about:Button("背上只因剑2",function()
loadstring(game:HttpGet(('https://gist.githubusercontent.com/blox-hub-roblox/021bad62bbc6a0adc4ba4e625f9ad7df/raw/c89af6e1acf587d09e4ce4bc7510e7100e0c0065/swordWarrior.lua'),true))()
end)
local UITab43 = win:Tab("『刀刃球』",'7734068321')

local about = UITab43:section("『刀刃球』",true)

about:Button("禁漫中心",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/ghbdrc/main/%E4%B8%81%E4%B8%81%E5%88%80%E5%88%83%E7%90%83.txt"))()
end)

about:Button("刀刃球自动格挡",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3ABlade%20Ball%20Parry%20V4.0.0",true))()
end)

about:Button("刀刃球1",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/Unknownkellymc1/Unknownscripts/main/slap-battles')))()
end)

about:Button("刀刃球2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BladeBall/main/redz9999"))()
end)

about:Button("刀刃球3",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Neoncat765/Neon.C-Hub-X/main/UnknownVersion"))()
end)



