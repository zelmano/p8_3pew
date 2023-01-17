pico-8 cartridge // http://www.pico-8.com
version 36
__lua__

x=64
y=64
vx=0
vy=0

rot=0--rotation
len=7--len front-back
wid=3--width center-side
rad=7--hitbox radius

spd=1--max speed
acl=0.075--each frame v+=acl
drg=0.025--friction each frame

col=11
debugcol=8

-->8

function _draw()
	cls()
	
	local tf=0.6
	local ts=0.4
	
	--how much ship extend in front
	local lenx=cos(rot)*len
	local leny=sin(rot)*len
	
	--same on side
	local sidex=cos(rot+0.25)*wid
	local sidey=sin(rot+0.25)*wid
	
	--point at front
	--60% of ship len front of cent
	local pfx=x+lenx*tf
	--point(x,y)
	local pfy=y+leny*tf
	
	--point at left
	--40% of ship len behind cent
	local plx=x-lenx*ts+sidex
	--point(x,y)
	local ply=y-leny*ts+sidey
	
	--point at right
	local prx=x-lenx*ts-sidex
	local pry=y-leny*ts-sidey
	
	--draw on screen
	line(pfx,pfy,plx,ply,col)
	line(pfx,pfy,prx,pry,col)
	line(plx,ply,prx,pry,col)

	circ(x,y,rad,debugcol)
	pset(x,y,debugcol)

	--push test from vscode

end


-->8

function _update60()
	if btn(0) then
		rot+=0.0125
	end
	if btn(1) then
		rot-=0.0125
	end
end


__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
