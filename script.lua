local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
  Name = "Stateview Supa Cool Hax",
  LoadingTitle = "Stateview Supa Cool Hax",
  LoadingSubtitle = "by GrimWolverine (Love ya siryeet)",
  Theme = "Serenity"
})

local Tab = Window:CreateTab("Trolling", "crown")
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
Tab:CreateToggle({
  Name = "Lock AFK On",
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
      Player:FindFirstChild("PlayerScripts"):FindFirstChild("AFKScript").Disabled = false
    end
  end
})

local Tab = Window:CreateTab("External Scripts", "code")
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
