This is a bezier function where you can get a bezier of any order  
https://github.com/qwwshs/lua_bezier  
example:  
bez = require "bezier"  
print(bez:GetBezier(0,1,0,1,0.5,{0,0,1,1,1,1}))  
  
function love.load()  
  
end  

function love.draw()  
  for i=0,1,0.001 do  
    local int = bez:GetBezier(0,1,0,1,i,{0,0,1,1,1,1,1,1,0.5,0.5})  
    love.graphics.rectangle("fill",i*300,int*300,1,1)  
  end  
end  
