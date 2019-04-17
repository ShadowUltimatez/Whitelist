-- [EN]
-- Do not delete or change the credits
-- Maked by Alessandro in Italy
-- [IT]
-- Non cambiare o eliminare i crediti
-- Creato da Alessandro in Italia


--------------------------------------


-- [EN]
-- Check if in whitelist
-- [IT]
-- Controlla se in whitelist

-- [IT]
function controlloWhitelist(indirizzoSteam)
	local risultato = MySQL.Sync.fetchScalar("SELECT whitelistato FROM whitelist WHERE identificatore = @nomeUtente AND whitelistato = 1", {['@nomeUtente'] = indirizzoSteam})
	if risultato then
		return true
	end
	return false
end

-- [EN]
--function whitelistCheck(steamIdentifier)
--	local result = MySQL.Sync.fetchScalar("SELECT whitelisted FROM whitelist WHERE identifier = @nameOfUser AND whitelisted = 1", {['@nameOfUser'] = steamIdentifier})
--	if result then
--		return true
--	end
--	return false
--end




-- [EN]
-- This is event check and send message on player join
-- [IT]
-- Questo è l'evento che controlla e invia il messaggio quando il gicatore entra

--[IT]
AddEventHandler("playerConnecting", function(nome, motivoKick)
	local indirizzoSteam = GetPlayerIdentifiers(source)[1]
	if not controlloWhitelist(indirizzoSteam) then
		motivoKick("Tu non sei whitelistato " ..nome.. " nel server.")
		CancelEvent()
    end
end)

--[EN]
--AddEventHandler("playerConnecting", function(name, kickReason)
--	local steamIdentifier = GetPlayerIdentifiers(source)[1]
--	if not whitelistCheck(steamIdentifier) then
--		kickReason("You are not whitelisted " ..name.. " in the server.")
--		CancelEvent()
--    end
--end)