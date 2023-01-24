pico-8 cartridge // http://www.pico-8.com
version 36
__lua__

--avion

x=64
y=64
vx=0
vy=0

rot=0--rotation
rob=0.375--rotation of back points
rad=5--hitbox radius

spd=1--max speed
rsp=0.0125--rotation speed
acl=0.075--each frame v+=acl
drg=0.025--friction each frame
vto=0.25--velocity threshold

col=11
debugcol=8

-->8

function _draw()
	cls()

	local pfx=flr(x+cos(rot)*rad)
	local pfy=flr(y+sin(rot)*rad)

	local plx=flr(x+cos(rot+rob)*rad)
	local ply=flr(y+sin(rot+rob)*rad)

	local prx=flr(x+cos(rot-rob)*rad)
	local pry=flr(y+sin(rot-rob)*rad)
	
	local pbx=flr(x+cos(rot+0.5)*2)
	local pby=flr(y+sin(rot+0.5)*2)

	vel=0

	--draw on screen
	rect(0,0,127,127,1)

	--circ(x,y,rad,debugcol)
	--pset(x,y,debugcol)
	line(pfx,pfy,plx,ply,col)
	line(pfx,pfy,prx,pry,col)
	line(plx,ply,pbx,pby,col)
	line(pbx,pby,prx,pry,col)
	vel=abs(vx)+abs(vy)
	print("vel:"..vel,1,1)
end

-->8

function _update60()
	--rotation
	if btn(0) then
		rot+=rsp
	end
	if btn(1) then
		rot-=rsp
	end
	--acceleration
	if btn(2) then
		vx+=cos(rot)*acl
		vy+=sin(rot)*acl
		vel=abs(vx)+abs(vy)
		--velocity capping
		if(vel>1)then
			local d=atan2(vx,vy)
			vx=cos(d)
			vy=sin(d)
		end
	end

	--movement
	x+=vx
	y+=vy
end


__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
