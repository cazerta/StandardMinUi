local uiConfig = {
	minAlpha = 0.7,
	maxAlpha = 1,
	mainMenuScale = 0.7,
	playerTargetScale = 1.1,
	playerTargetFrame_X = 250,
	playerTargetFrame_Y = 220
}

--MENUBAR 
MainMenuBarLeftEndCap:Hide();
MainMenuBarRightEndCap:Hide();
MainMenuBar:SetScale(uiConfig.mainMenuScale);
MainMenuBar:SetAlpha(uiConfig.minAlpha) ;

--PLAYER & TARGET frames
PlayerFrame:SetScale(uiConfig.playerTargetScale);
PlayerFrame:ClearAllPoints();
PlayerFrame:SetPoint("CENTER",UIParent,-uiConfig.playerTargetFrame_X,-uiConfig.playerTargetFrame_Y);
PlayerFrame:SetUserPlaced(true);

TargetFrame:SetScale(uiConfig.playerTargetScale);
TargetFrame:ClearAllPoints();
TargetFrame:SetPoint("CENTER",UIParent,uiConfig.playerTargetFrame_X,-uiConfig.playerTargetFrame_Y); 
TargetFrame:SetUserPlaced(true);

--Frame to deal with instances and check IsInRaid
local f = CreateFrame("FRAME");
f:RegisterEvent("PLAYER_ENTERING_WORLD"); --Event that fires on loadingscreens
f:RegisterEvent("RAID_ROSTER_UPDATE");
f:RegisterEvent("PARTY_MEMBERS_CHANGED");
f:SetScript("OnEvent", function(self, event, ...)
	print('fired')
	print(IsInRaid())
	
	--print('UnitInRaid: ' .. UnitInRaid('player'))
	if IsInRaid() then --if player is in raid hides objective tracker else shows it
		print("TRIGGER InRaind() - Escondendo objetivos")
		ObjectiveTrackerFrame:Hide();
	else
		ObjectiveTrackerFrame:Show();
	end
end)

local balancePowerQuests = {
    ["[1] The Power Within - "] = 43496,
    ["[2] Eye of Azshara: The Heart of Zin-Azshari - "] = 40668,
    ["[3] Darkheart Thicket: Fallen Power - "] = 43517,
    ["[4] Lucid Strength - "] = 43519,
    ["[5] The Emerald Nightmare: In Nightmares - "] = 43520,
    ["[6] Essential Consumption - "] = 43522,
    ["[6.5] Saving the Guard - "] = 43527,
    ["[7] Repaid Debt - "] = 43523,
    ["[8] Lost Knowledge - "] = 40673
}

local function checkBalancePower() 
    for index,value in pairs(balancePowerQuests) do
        if (IsQuestFlaggedCompleted(value)) then
            print("|cff00ff00" .. index)
        else
            print("|cffff0000" .. index)
        end
    end
end

SLASH_BALANCEPOWER1 = '/smbop'
function SlashCmdList.BALANCEPOWER(msg, editbox)
    checkBalancePower()
end
