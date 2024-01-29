-- title:   Liney Draw Nonsense
-- author:  Dave Pitt
-- desc:    An annoying toy as a kid, made into an annoying app for adults.
-- site:    https://github.com/Davethepitt/Liney-Draw-Nonsense
-- license: MIT License (change this to your license of choice)
-- version: 1.0 29th January 2024
-- script:  lua

x=120
y=60

currentFGColour = 0

--keyStatus Details
-- 0 = Control Palette
-- 1 = Draw
keyStatus = 1

--gameState Details
--0 = Title Screen
--1 = Game
gameState = 0

cls(0)

function TIC()
	if gameState == 0 then titleScreen() end
 if gameState == 1 then mainGameLoop() end
end

function titleScreen()

cls(0)
print("Liney Draw Nonsense",63,5,12)
print("by Dave Pitt",85,15,12)
print("Press Z to Start",75,50,12)
print("Switch between palette mode and draw mode",0,100,13)
print("by pressing [SPACE].",0,107,13)
print("Clear screen by pressing [ENTER]",0,114,13)
checkHomeScreenKeys()
end -- titleScreen()

function mainGameLoop()
	drawTopLine()
	drawPage()
	checkChangeKey()
	checkClearScreenKey()
	if keyStatus == 0 then	checkPaletteKeys() end
	if keyStatus == 1 then checkDrawKeys() end
 pix(x,y,math.random(0,8))

end --mainGameLoop()

function drawPage()

	rectb(0,9,240,120,15)
	spr(0,0,0)
	spr(1,8,0)
	spr(2,16,0)
 spr(3,24,0)
 spr(4,32,0)
 spr(5,40,0)
 spr(16,48,0)
 spr(17,56,0)
 spr(18,64,0)
 spr(19,72,0)
 spr(20,80,0)
 spr(21,88,0)
 
 -- Draw Selection Box
 spr(6,currentFGColour*8,0,0)

end --drawPage()

function checkPaletteKeys()
	if btnp(2) -- Left Arrow
		and currentFGColour*8 >0 
			then currentFGColour = currentFGColour - 1 
	end
	if btnp(3) -- Right Arrow
		and currentFGColour*8 <88 
			then currentFGColour = currentFGColour + 1 
	end
end --checkKeys()

function checkDrawKeys()
 pix(x,y,currentFGColour+1)
	if btn(0) -- Up Arrow
	 and y > 10
			then y = y - 1
	end
	if btn(1) -- Down Arrow
	 and y < 127
			then y = y + 1
	end
 if btn(2) -- Left Arrow
 	and x > 1
	 then x = x - 1
	end
	if btn(3) -- Right Arrow
		and x < 238
			then x = x + 1
	end
end --checkDrawKeys()

function checkChangeKey()

 if keyp(48) then
 	keyStatus = keyStatus +1
 end
 
 if keyStatus == 2 then
  	keyStatus = 0
 end
-- if key(48) and keyStatus ==1 then keyStatus = 0 end
 
end -- checkChangeKey()

function checkClearScreenKey()
	if keyp(50) 
		then
			x=120
			y=60
			cls(0)
			drawPage()
	end
end -- checkClearScreenKey()

function drawTopLine()
print("                                                          ",0,0)
end -- drawTopLine()

function checkHomeScreenKeys()
	if keyp(26) 
		then 
			gameState = 1 
			cls() 
	end
end -- checkHomeScreenKeys()
