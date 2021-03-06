--[[
	   ____      _  _      ___    ___       ____      ___      ___     __     ____      _  _          _        ___     _  _       ____   
	  F ___J    FJ  LJ    F _ ", F _ ",    F ___J    F __".   F __".   FJ    F __ ]    F L L]        /.\      F __".  FJ  L]     F___ J  
	 J |___:    J \/ F   J `-' |J `-'(|   J |___:   J (___|  J (___|  J  L  J |--| L  J   \| L      //_\\    J |--\ LJ |  | L    `-__| L 
	 | _____|   /    \   |  __/F|  _  L   | _____|  J\___ \  J\___ \  |  |  | |  | |  | |\   |     / ___ \   | |  J |J J  F L     |__  ( 
	 F L____:  /  /\  \  F |__/ F |_\  L  F L____: .--___) \.--___) \ F  J  F L__J J  F L\\  J    / L___J \  F L__J |J\ \/ /F  .-____] J 
	J________LJ__//\\__LJ__|   J__| \\__LJ________LJ\______JJ\______JJ____LJ\______/FJ__L \\__L  J__L   J__LJ______/F \\__//   J\______/F
	|________||__/  \__||__L   |__|  J__||________| J______F J______F|____| J______F |__L  J__|  |__L   J__||______F   \__/     J______F 

	::Player Extension::
]]

local extension = EXPR_LIB.RegisterExtenstion("player")

extension:RegisterLibrary("ply");

--[[
	CLASS
]]

local function isPlayer(p)
	return p:IsPlayer()
end

extension:RegisterClass("p", {"player"}, isPlayer, IsValid)

--extension:RegisterConstructor("p", "n", Player, true)

--[[
	Operators
]]

extension:RegisterOperator("eq", "p,p", "b", 1, function(a, b) return a == b end, true)
extension:RegisterOperator("neq", "p,p", "b", 1, function(a, b) return a != b end, true)

--[[
	Methods
]]

extension:RegisterMethod("p", "isValid", "", "b", 1, function(e)
	return IsValid(e)
end, true)

--[[
	Functions
]]

extension:RegisterFunction("ply", "owner", "", "p", 1, function(context) return context.player end, false)

extension:RegisterFunction("ply", "getAll", "", "t", 1, player.GetAll, true)

extension:RegisterFunction("ply", "getBySteamID", "s", "p", 1, player.GetBySteamID, true)

extension:RegisterFunction("ply", "getBySteamID64", "s", "p", 1, player.GetBySteamID64, true);

extension:RegisterFunction("ply", "getByName", "s", "t", 1, function(s)
	local list = {}
	
	for k, ply in pairs(player.GetAll()) do
		if string.find(string.lower(ply:Name()), string.lower(s)) then
			table.insert(list, ply)
		end
	end
	
	return list
end, true);

--[[
]]

extension:EnableExtenstion()