local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
  Name = "Stateview Supa Cool Hax",
  LoadingTitle = "Stateview Supa Cool Hax",
  LoadingSubtitle = "My gift to siryeet",
  Theme = "Ocean"
})

local Tab = Window:CreateTab("Trolling", "crown")
Tab:CreateSection("General Scripts")
Tab:CreateButton({
  Name = "Become Cadet",
  Callback = function()
    local completeQuizEvent = game:GetService("ReplicatedStorage"):FindFirstChild("RankForQuiz")
    completeQuizEvent:InvokeServer()
    wait(0.1)
    local teamEvent = game:GetService("ReplicatedStorage"):FindFirstChild("ChangeTeams")
    local team = game:GetService("Teams")["Correctional Staff"]
    teamEvent:InvokeServer(team)
  end
})
Tab:CreateButton({
  Name = "Open Closest Door (Must hold fake keycard)",
  Callback = function()
    local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
    local Doors_upvr = workspace:WaitForChild("Doors")

    function findClosestDoor()
        local closestDoor
        for _, v in pairs(Doors_upvr:GetChildren()) do
            if v:FindFirstChild("Interact") then
                if not closestDoor then
                    closestDoor = v
                end
                if LocalPlayer_upvr:DistanceFromCharacter(v.Interact.Position) < LocalPlayer_upvr:DistanceFromCharacter(closestDoor.Interact.Position) then
                    closestDoor = v
                end
            end
        end
        return closestDoor
    end

    local closestDoor = findClosestDoor()
    if closestDoor then
        game.ReplicatedStorage.Doors.OpenDoor:FireServer(closestDoor)
    end
  end
})
Tab:CreateSection("AFK Scripts")
Tab:CreateToggle({
  Name = "AFK",
  Callback = function(Value)
    if Value then
      local Player = game.Players.LocalPlayer
      local AFKEvent = game:GetService("ReplicatedStorage"):FindFirstChild("AFK")
      AFKEvent:FireServer(true)
      Player:FindFirstChild("PlayerScripts"):FindFirstChild("AFKScript").Disabled = true
    else
      local Player = game.Players.LocalPlayer
      local AFKEvent = game:GetService("ReplicatedStorage"):FindFirstChild("AFK")
      AFKEvent:FireServer(false)
    end
  end
})
Tab:CreateButton({
  Name = "Fix AFK",
  Callback = function()
    local Player = game.Players.LocalPlayer
    Player:FindFirstChild("PlayerScripts"):FindFirstChild("AFKScript").Disabled = false
  end
})

local Tab = Window:CreateTab("Team Changer/Teleports", "map-pin")
Tab:CreateSection("Team Changes")
local teamSelect = Tab:CreateDropdown({
  Name = "Team",
  Options = {"Criminal", "Solitary Confinement", "Maximum Security Inmate"},
  CurrentOption = {"Team"},
  Callback = function(Option)
    return 
  end
})
Tab:CreateButton({
  Name = "Switch Teams",
  Callback = function ()
    local teamPositions = {
      ["Criminal"] = CFrame.new(-1794.8197021484375, 32.25, -776.1041870117188),
      ["Solitary Confinement"] = CFrame.new(-2185.895263671875, 48.06307983398375, -849.4471435546875),
      ["Maximum Security Inmate"] = CFrame.new(-2200.565185546875, 33.062950134277344, -784.281603515625)
    }

    local selectedTeam = teamSelect.CurrentOption[1]
    local targetPosition = teamPositions[selectedTeam]
    local player = game.Players.LocalPlayer

    local function isOnTeam()
      return player.Team and player.Team.Name == selectedTeam
    end
    
    if targetPosition then
      while not isOnTeam() do
        player.Character.HumanoidRootPart.CFrame = targetPosition
        wait(0.1)
      end
      player.Character.Humanoid.Health = 0
    end
  end
})
Tab:CreateSection("Teleports - MUST HOLD HANDCUFFS")
local teleportsMapping = {
    ["Admin Room"] = CFrame.new(-49990.703125, 4.000002861022949, -404.8084716796875),
    ["Session Room"] = CFrame.new(-2053.2978515625, 48.066322326660156, -731.2392578125),
    ["Control Room"] = CFrame.new(-2261.17626953125, 48.061492919921875, -771.6943359375),
    ["Prison"] = CFrame.new(-2195.911376953125, 33.06635665893555, -708.8546752929688),
    ["Sewers"] = CFrame.new(-2300.7353515625, 0.5608519315719604, -883.5501098632812),
    ["Table In Void"] = CFrame.new(593.965087890625, -155.41085815429688, 618.7930908203125)
}
local teleportChoices = {}
for key, _ in pairs(teleportsMapping) do
    teleportChoices[#teleportChoices + 1] = key
end
local teleportSelect = Tab:CreateDropdown({
  Name = "Location",
  Options = teleportChoices,
  CurrentOption = {"Location"},
  Callback = function(Option)
    return 
  end
})
Tab:CreateButton({
  Name = "Teleport",
  Callback = function ()
    local selectedLocation = teleportSelect.CurrentOption[1]
    local targetPosition = teleportsMapping[selectedLocation]
    local player = game.Players.LocalPlayer

    if targetPosition then
        player.Character.HumanoidRootPart.CFrame = targetPosition
    end
  end
})

local Tab = Window:CreateTab("External Scripts", "code")
Tab:CreateSection("External Scripts")
Tab:CreateButton({
  Name = "Infinite Yield",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
  end
})
Tab:CreateButton({
  Name = "CMD-X",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
  end
})
