NewTex("c",7001,"Crash Block")
cellinfo[7001] = {name="Crash Block",desc="Crash the game if touch it"}
table.insert(lists[9].cells,{name = "Crash Block",max=99,7001})
cellcalls[7001] = {
	nonsolid = true,
	FirstTick = function(x,y,cell)
		return 0
	end,
	FinalTick = function(x,y,cell)
		return 0
	end,
	HandleNudge = function(cell,dir,x,y,vars)
		vars.lastcell.vars.coins = (vars.lastcell.vars.coins or 0)+inf
		coinparticles:setPosition(x*20-10,y*20-10)
		if fancy then coinparticles:emit(25) end
		Play(coinsound)
		SetCell(x,y,getempty())
		return 1
	end,
	HandlePush = function(force,cell,dir,x,y,vars)
		vars.lastcell.vars.coins = (vars.lastcell.vars.coins or 0)+inf
		coinparticles:setPosition(x*20-10,y*20-10)
		if fancy then coinparticles:emit(25) end
		Play(coinsound)
		SetCell(x,y,getempty())
		return 1
	end,
	HandlePull = function(force,cell,dir,x,y,vars)
		return 1
	end,
	HandleGrasp = function(force,cell,dir,x,y,vars)
		return 1
	end,
	HandleSwap = function(cell,dir,x,y,vars)
		vars.lastcell.vars.coins = (vars.lastcell.vars.coins or 0)+1
		coinparticles:setPosition(x*20-10,y*20-10)
		if fancy then coinparticles:emit(25) end
		Play(coinsound)
		return 0
	end
}