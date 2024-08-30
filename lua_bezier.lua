local bezier = {version = "bezier 0.1"}


-- 计算任意阶贝塞尔曲线的函数  
local function time_to_x(controlPoints,t)  
    -- 计算阶乘的辅助函数  
local function factorial(num)  
    if num == 0 then  
        return 1  
    else  
        local f = 1  
        for i = 1, num do  
            f = f * i  
        end  
        return f  
    end  
end  
    local n = #controlPoints - 1  
    local result = {0, 0}  -- 假设控制点为2D坐标  

    for i = 0, n do  
        -- 贝塞尔基函数的计算  
        local binomialCoeff = factorial(n) / (factorial(i) * factorial(n - i))  
        local term = binomialCoeff * (t ^ i) * ((1 - t) ^ (n - i))  

        result[1] = result[1] + term * controlPoints[i + 1][1]  
        result[2] = result[2] + term * controlPoints[i + 1][2]  
    end  

    return result
end  


function bezier:GetBezier(startTime, endTime, startValue, endValue,nowtime,bezierTable,accuracy)
    -- 计算时间点在时间范围内的百分比
    local timePercent = (nowtime - startTime) / (endTime - startTime)
    
    -- 限制时间范围在0到1之间
    timePercent = math.max(0, math.min(1, timePercent))
 
    if #bezierTable % 2 ~= 0 then
        return false
    end

    local bezier_tab = {{0,0}}
    for i=1,#bezierTable,2 do
        bezier_tab[#bezier_tab + 1] = {bezierTable[i],bezierTable[i + 1]}
    end
    bezier_tab[#bezier_tab + 1] = {1,1}
    bezierTable = bezier_tab

    --二分求解 
    local accuracy = 0.0005
    if accuracy then
        accuracy = accuracy
    end
    --精度
    local lf = 0
    local rl = 1
    local mid = 0.5

    if timePercent == 1 then
        local ky = startValue + (endValue - startValue) * time_to_x(bezierTable,timePercent)[2]
        return ky
    elseif timePercent == 0 then
        local ky = startValue + (endValue - startValue) * time_to_x(bezierTable,timePercent)[2]
        return ky
    end

    while rl - lf > accuracy do --精度之外
        --算出x和时间百分比的距离
        mid = (lf + rl) / 2
        local mid_x = time_to_x(bezierTable,mid)[1]
        if mid_x < timePercent then -- 往右偏
            lf = mid
        elseif mid_x > timePercent then --往左偏
            rl = mid
        else-- 同
            break
        end
    end
    timePercent = mid
    -- 根据插值点计算数值
    local ky = startValue + (endValue - startValue) * time_to_x(bezierTable,timePercent)[2]

    return ky
end

return bezier