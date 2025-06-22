-- UNXHub "API" - Please Get Out.

local plr = game.Players.LocalPlayer

local BannedUsers = {
    {UserId = 1, Reason = "Hi Roblox Big Fan"},
    {UserId = 1845277449, Reason = ""},
    {UserId = 1932649501, Reason = ""}
}

local BannedGames = {
    {PlaceId = 4924922222, Reason = "Please get your stinky Brookhaven out of here."}
}

for _, banInfo in ipairs(BannedUsers) do
    if plr.UserId == banInfo.UserId then
        if plr:FindFirstChild("PlayerGui") and plr.PlayerGui:FindFirstChild("UNXHubUI") then
            plr.PlayerGui.UNXHubUI:Destroy()
        end
        print("[API]: User is banned from using UNXHub. Reason: " .. banInfo.Reason)
        plr:Kick("Sorry, but you are banned from using the main loadstring.\nReason: " .. banInfo.Reason)
        return
    end
end

for _, banInfo in ipairs(BannedGames) do
    if game.PlaceId == banInfo.PlaceId then
        if plr:FindFirstChild("PlayerGui") and plr.PlayerGui:FindFirstChild("UNXHubUI") then
            plr.PlayerGui.UNXHubUI:Destroy()
        end
        print("[API]: Game is banned from using UNXHub. Reason: " .. banInfo.Reason)
        plr:Kick("Sorry, but the game you are playing is banned from using UNXHub.\nReason: " .. banInfo.Reason)
        return
    end
end

print("[API]: All checks done. User is not banned and the game is not restricted.")
