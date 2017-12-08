--拖动地图到合适位置
--向上拖动
local function touchMoveUp()
  mSleep(1500)
  touchDown(1, 900, 300)
  mSleep(200+math.random(100))
  touchMove(1, 900, 100)
  mSleep(200+math.random(100))
  touchUp(1, 900, 100)  
end
--向下拖动
local function touchMoveDown()
  mSleep(1500)
  touchDown(1, 900, 300)
  mSleep(200+math.random(100))
  touchMove(1, 900, 500)
  mSleep(200+math.random(100))
  touchUp(1, 900, 500)  
end



--章节存储
local chap1={{231,680},{687,406},{994,792},{1184,263}}
local chap2={{1225,682},{1125,282},{435,405},{581,818}}
local chap3={{603,325},{342,742},{1183,204},{922,541}}
local chap4={{361,459},{637,706},{1238,820},{1169,433}}
local chapindex={chap1,chap2,chap3,chap4}
--单击
local function tap(x,y)
  
  touchDown(1, x, y)
  
  local randomsleep=math.random(-50,150)
  mSleep(100+randomsleep)
  touchUp(1, x, y)  
  
end
--进入开始界面
local function ent()
  while true do
    init("0", 1);
    x, y = findColor({0, 0, 1919, 1079}, 
      "0|0|0xf7c56d,-9|34|0xf2b03d,21|9|0xfafaf7,21|13|0xe8b969",
      95, 0, 0, 0)
    if x > -1 then
      sysLog("找到了")
      mSleep(1000)
      tap(1087,491)
      mSleep(500)
      tap(1087,491)
      
      break
    else
      sysLog("没找到")
      mSleep(10000)
    end
  end
end
--判断是否在开始界面
local function checkent()
  x, y = findColor({0, 0, 1919, 1079}, 
    "0|0|0xf7c56d,-9|34|0xf2b03d,21|9|0xfafaf7,21|13|0xe8b969",
    95, 0, 0, 0)
  if x > -1 then
    return true
  else
    return false
  end
end
--检查公告是否打开
local function checkpublic()
  x, y = findColor({0, 0, 1919, 1079}, 
    "0|0|0xaba8a7,6|-6|0x655410,9|-5|0x9f9164,18|-3|0xfbd545,30|1|0x746141,45|7|0xfcd953,52|7|0x69584d",
    95, 1, 0, 0)
  if x > -1 then
    return true
  else
    return false
  end
end
--关闭公告
local function closepublic()
  local num = 0
  while true do
    point = findColors({0, 0, 1919, 1079}, 
      "0|0|0xfbd545,-11|0|0x554a44,-25|0|0xaaa9aa",
      95, 0, 0, 0)
    if #point ~= 0 then
      local randomclose=math.random(#point)
      sysLog(randomclose)
      tap(point[randomclose].x,point[randomclose].y)
      --			for var = 1, #point do
      --				sysLog(point[var].x..":"..point[var].y)
      
      --			end
      break
    else
      sysLog("还没找到")
      if num > 10 then
        break
      end
    end
  end
end
--开始游戏
local function start()
  flag = appIsRunning("com.bilibili.azurlane"); --检测是否在运行
  sysLog(flag)
  if flag == 0 then --如果没有运行
    runApp("com.bilibili.azurlane") --运行
    
    ent()
  else
    
    sysLog("完成")
  end
end
--判断是否在主页面
local function index()
  x, y = findColor({0, 0, 1920, 1080}, 
    "0|0|0xffffff,-7|4|0xd48a06,-10|18|0xf6cd24,-10|25|0xefa604,-9|31|0x7d3906,-6|33|0xd3c4c4,14|52|0xe08b03",
    95, 1, 0, 0)
  if x > -1 then
    return {true,x,y}
  else
    return {false}
  end
end
--出击
local function attack(x,y)
  local randomattack=math.random(-10,10)
  tap(x+randomattack,y+randomattack)
  
end
--前后去空字符
local function trim(s)   
  return (string.gsub(s, "^%s*(.-)%s*$", "%1"))  
end  
--第一章
local function firstchap()
  local color1 = getColor(65,151)--获取(100,100)的颜色值，赋值给color变量
  sysLog(color1)
  if color1 == 2169881 then   --如果该点的颜色值等于0xffffff
    return true
  else
    return false
  end
  
end
--第二章
local function seconedchap()
  local color1 = getColor(65,151)--获取(100,100)的颜色值，赋值给color变量
  sysLog(color1)
  if color1 == 8615225 then   --如果该点的颜色值等于0xffffff
    return true
  else
    return false
  end
end
--第三章
local function thirdchap()
  local color1 = getColor(65,151)--获取(100,100)的颜色值，赋值给color变量
  sysLog(color1)
  if color1 == 4865313 then   --如果该点的颜色值等于0xffffff
    return true
  else
    return false
  end
end
--第四章
local function forthchap()
  local color1 = getColor(65,151)--获取(100,100)的颜色值，赋值给color变量
  sysLog(color1)
  if color1 == 1644569 then   --如果该点的颜色值等于0xffffff
    return true
  else
    return false
  end
end
--检测章数
local function searchchap() -- 废弃
  local ocr, msg = createOCR({
      type = "tesseract", -- 指定tesseract引擎
      --	path = "[external]", -- 使用开发助手/叉叉助手的扩展字库
      --	lang = "chi_sim" -- 使用英文增强字库(注意需要提前下载好)
    })
  colorTbl = binarizeImage({
      rect = {358,109,386,137},
      diff = {"0x647a7f-0x000000","0x2f3333-0x000000","0x282829-0x000000","0x303435-0x000000","0x353a3c-0x000000","0x353a3c-0x000000","0x434c4d-0x000000","0x353a3c-0x000000","0x333839-0x000000","0x2a2c2d-0x000000","0x3e4749-0x000000","0x383f40-0x000000","0x383f40-0x000000","0x2e3031-0x000000","0x303333-0x000000","0x404849-0x000000","0x2a2b2b-0x000000","0x262626-0x000000","0x262626-0x000000","0x262626-0x000000"},
      
    })
  
  
  local code, text = ocr:getText({
      data = colorTbl,
      whitelist = "0123456789"
    })
  if code==0 then
    if #text>0 then
      ocr:release()
      return tonumber(trim(text))
    end
  else
    sysLog("错误")
    ocr:release()
    return 0
    
  end
  
end
local function newsearchchap()
  if firstchap() then
    return 1
  elseif seconedchap() then 
    return 2
  elseif thirdchap() then
    return 3
  elseif forthchap() then
    return 4
  else
    return 5
  end
  
end
--改变章节
local function changechap(mychap,oldchap)
  
  while true do
    local randomchap=math.random(-20,20)
    if mychap==oldchap then
      sysLog("已在第"..mychap.."章")
      toast("已在第"..mychap.."章")
      return	true
    elseif mychap>oldchap then
      sysLog("当前章"..oldchap)
      tap(1824+randomchap,536+randomchap)
      oldchap=oldchap+1
      mSleep(200)
    else
      sysLog("当前章"..oldchap)
      tap(82+randomchap,536+randomchap)
      oldchap=oldchap-1
      mSleep(200)
    end
  end
end
--检查是否在出击页面
local function checkattackpage()
  x, y = findColor({0, 0, 1919, 1079}, 
    "0|0|0xcb1214,5|5|0xf6f6f6,8|11|0xd03335,-5|20|0x631314",
    95, 0, 1, 0)
  if x > -1 then
    return true
  else
    return false
  end
end
--选择小关
local function selectlevel(lchap,level)
  sysLog("输入章节"..lchap)
  sysLog("输入关卡"..level)
  local levelx=chapindex[lchap][level][1]
  local levely=chapindex[lchap][level][2]
  local levelrandom=math.random(-50,50)
  tap(levelx+levelrandom,levely+levelrandom)
  mSleep(500)
  
end
--捞船出击
local function shipattack()
  while true do
    point = findColors({0, 0, 1919, 1079}, 
      {
        {x=0,y=0,color=0xf7db4a},
        {x=40,y=9,color=0x846d29},
        {x=54,y=29,color=0xffffff},
        {x=64,y=39,color=0xffb221}
      },
      95, 0, 0, 0)
    if #point ~= 0 then
      local randomship=math.random(#point)
      sysLog(randomship)
      tap(point[randomship].x,point[randomship].y)
      break
    else
      sysLog("没找到捞船出击页面")
      mSleep(1000)
    end
  end
end
--捞船出击页面确定
local function checkshipattack()
  point = findColors({0, 0, 1919, 1079}, 
    {
      {x=0,y=0,color=0xf7db4a},
      {x=40,y=9,color=0x846d29},
      {x=54,y=29,color=0xffffff},
      {x=64,y=39,color=0xffb221}
    },
    95, 0, 0, 0)
  if #point ~= 0 then
    return true
  else
    return false
  end
end
--弹出断开框
local function loss()
  x, y = findColor({0, 0, 1919, 1079}, 
    "0|0|0xf8d849,0|4|0x826f23,4|8|0xfcfcfa,24|11|0x7c691a,45|15|0x957f29,105|14|0xfbd13f,150|-11|0x8d3800",
    96, 0, 0, 0)
  if x > -1 then
    return {true,x,y}
  else
    return {false}
  end
end
--规避战斗
local function avoid()
  x, y = findColor({0, 0, 1919, 1079}, 
    "0|0|0xffffff,4|0|0xb5b6b5,17|-1|0xeeeaee,79|29|0xc5bebd,105|3|0xd6d6d6,176|-36|0xbdb6b5",
    95, 0, 0, 0)
  if x > -1 then
    return {true,x,y}
  else 
    return {false}
  end
end
--战斗完成
local function finishbattle()
  x, y = findColor({0, 0, 1919, 1079}, 
    "0|0|0xf7f7f7,82|-16|0x919191,82|4|0x353435,138|12|0xbab9b6,159|-28|0xb6b5ae",
    95, 0, 0, 0)
  if x > -1 then
    return {true,x,y}
  else
    return {false}
  end
end
--判断未执行操作情况
local function checkelse()
  if appIsRunning("com.bilibili.azurlane")==false then
    start()
  elseif loss()[1] then
    sysLog("断连")
    tap(loss()[2],loss()[3])
  elseif avoid()[1] then
    sysLog("规避")
    tap(avoid()[2],avoid()[3])
  elseif checkpublic() then
    sysLog("公告")
    closepublic()
  elseif index()[1] then
    sysLog("主页面")
    attack(index()[2],index()[3])
    
  else
    attack(1116,156)
  end
end
--寻找主力
local function findmainship(ltx,lty,rbx,rby)
  x, y = findColor({ltx, lty, rbx, rby}, 
    "0|0|0x831831,63|46|0x5a555b,-7|75|0xded6de",
    95, 0, 0, 0)
  if x > -1 then
    return {true,x+10,y+40}
  else
    return {false,0,0}
  end
end
--寻找侦查
local function findReconship(ltx,lty,rbx,rby)
  sysLog(ltx..lty..rbx..rby)
  x, y = findColor({ltx,lty,rbx,rby}, 
    "0|0|0x634931,25|1|0xe6e7e6,55|30|0x84715a,0|20|0xe6e7e6",
    95, 0, 0, 0)
  if x > -1 then
    sysLog("reshipx:"..x)
    sysLog("reshipy:"..y)
    return {true,x+50,y+10}
  else
    return {false,0,0}
  end
end
--寻找航母
local function findCVA(ltx,lty,rbx,rby)
  x, y = findColor({ltx,lty,rbx,rby}, 
    "0|0|0x295450,11|0|0xe1cb99,23|-11|0x145e57",
    96, 0, 0, 0)
  if x > -1 then
    return {true,x,y+20}
  else
    return {false,0,0}
  end
end
--寻找boss
local function findBoss(ltx,lty,rbx,rby)
  x, y = findColor({ltx,lty,rbx,rby}, 
    "0|0|0xff4d52,17|-17|0x422431,39|-5|0xee4d52,17|25|0x7b0410",
    95, 0, 0, 0)
  if x > -1 then
    return {true,x+50,y+10}
  elseif battlcount>3 then
    local st,va=coroutine.resume(co)
    if va then 
      mSleep(1500)
      return findBoss(ltx,lty,rbx,rby)
    else
      return {false,0,0}
    end
	else
		return {false,0,0}
  end
end
--寻找物资船
local function findMaterialship(ltx,lty,rbx,rby)
  x, y = findColor({ltx,lty,rbx,rby}, 
    "0|0|0xd6b25a,11|1|0xd6c273,35|-34|0x635d63,40|-46|0x9c455a",
    95, 0, 0, 0)
  if x > -1 then
    return {true,x+30,y}
  else
    return {false,0,0}
  end
end
--寻找问号
local function findquestion(ltx,lty,rbx,rby)
  x, y = findColor({ltx,lty,rbx,rby}, 
    "0|0|0x91fff5,-3|-11|0x2e2e2e,-2|-14|0x717171,2|-31|0x97fff6,35|-6|0xebebeb",
    95, 0, 0, 0)
  if x > -1 then
    return {true,x,y+80}
  else
    return {false,0,0}
  end
end
--寻找弹药
local function findammunition()
  x, y = findColor({0, 0, 1919, 1079}, 
    "0|0|0xce8142,36|20|0xb58a29,-24|25|0xbdbabd,41|47|0xeeefee",
    95, 0, 0, 0)
  if x > -1 then
    return {true,x+5,y+130}
  else
    return {false,0,0}
  end
end
--寻找自己
local function findme()
  x, y = findColor({0, 0, 1919, 1079}, 
    "0|0|0xf8efbe,-7|8|0xd7823e,-24|19|0xa64b4b,-27|25|0x701e1e",
    95, 0, 0, 0)
  if x > -1 then
    return {true,x-60,y+200}
  else
    return {false,0,0}             
  end
end
--自律
local function selfdiscipline(selfdis)
  sysLog("判断自律中:"..selfdis)
  if tonumber(selfdis)==0 then
    sysLog("选择开启自律")
    local color = getColor(155,65); --获取(100,100)的颜色值，赋值给color变量
    sysLog("自律颜色数值："..color)
    if color == 5398883 then   --未自律
      sysLog("没有自律")
      local selfrandom=math.random(-20,20)
      tap(209+selfrandom,80+selfrandom)	
    end
  else
    sysLog("选择关闭自律")
    local color = getColor(147,64); --获取(100,100)的颜色值，赋值给color变量
    if color == 15133670 then   --自律中
      sysLog("自律中")
      local selfrandom=math.random(-20,20)
      tap(209+selfrandom,80+selfrandom)	
    end
  end
  
end
--战斗出击
local function battlestart()
  x, y = findColor({0, 0, 1919, 1079}, 
    "0|0|0x9486a5,28|0|0xdeba8c,43|0|0xf7d2a4,57|0|0xd6a684,126|-3|0xbdebe6",
    95, 0, 0, 0)
  if x > -1 then
    return {true,x,y}
  else
    return {false}
  end
end
--判断是否在战斗界面
local function checkbattle()
  sysLog("进入checkbattle方法")
  x, y = findColor({1792, 20, 1884, 112}, 
    "0|0|0x343334,7|2|0x4c4c4c,12|2|0xdfdddb,24|2|0x303230",
    95, 0, 0, 0)
  if x > -1 then
    return true
  else
    return false
  end
end
--阻挡方案
local function stopservice(targetx,targety,findfunction)
  sysLog("进入阻挡方案")
  if findme()[2]==myx and findme()[3]==myy then
    sysLog("有阻挡无法到达")
    if findme()[2]>targetx then
      ltx=targetx-100
      rbx=findme()[2]+100
    else
      ltx=findme()[2]-100
      rbx=targetx+100
    end
    if findme()[3]>targety then
      lty=targety-100
      rby=findme()[3]+100
    else
      lty=findme()[3]-100
      rby=targety+100
    end
    return obstructservice(ltx,lty,rbx,rby)
  else
    sysLog("遭到轰炸了，继续执行")
    tap(targetx,targety)
  end
end
--进入战斗逻辑
local function battleservice(findfunction)
  local anytable=findfunction
  local num=0
  tap(anytable[2]+findmorerandom,anytable[3]+findmorerandom)
  local positionx=anytable[2]+findmorerandom
  local positiony=anytable[3]+findmorerandom
  sysLog(positionx..","..positiony)
  mSleep(3500)
  while true do
    
    if battlestart()[1] then
      sysLog("点击开始战斗")
      attack(battlestart()[2],battlestart()[3])
      
      while true do
        if checkbattle() then
          
          
          sysLog("在battle中")
          selfdiscipline(result["CheckBoxGroup1"]) 
        elseif finishbattle()[1] then
          sysLog("结束战斗")
          attack(finishbattle()[2],finishbattle()[3])
					battlcount=battlcount+1
          break
        else
          
          checkelse()
        end
      end
      break
    elseif findme()[1] then
      return stopservice(anytable[2],anytable[3],findfunction)
      
    else
      sysLog("查找其他问题")
      tap(positionx,positiony)
      checkelse()
      num=num+1
      if num>5 then
        break
      end
      
    end
  end
  
end
--主阻挡逻辑
local function obstructservice(ltx,lty,rbx,rby)
  --  local findmetable={findme()}
  --  local findquestiontable={findquestion(ltx,lty,rbx,rby)}
  --  local findBosstable={findBoss(ltx,lty,rbx,rby)}
  --  local findmainshiptable={findmainship(ltx,lty,rbx,rby)}
  --  local findReconshiptable={findReconship(ltx,lty,rbx,rby)}
  --  local findCVAtable={findCVA(ltx,lty,rbx,rby)}
  --  local findMaterialshiptable={findMaterialship(ltx,lty,rbx,rby)}
  
  findmorerandom=math.random(10)
  if findme()[1] then
    sysLog("找到自己了")
    myx=findme()[2]
    myy=findme()[3]
  end
  if findquestion(ltx,lty,rbx,rby)[1] then
    sysLog("问号")
    battleservice(findquestion(ltx,lty,rbx,rby))
  elseif findBoss(ltx,lty,rbx,rby)[1] then
    sysLog("boss")
    battleservice(findBoss(ltx,lty,rbx,rby))
    battlefinish=false
  elseif findmainship(ltx,lty,rbx,rby)[1] then
    sysLog("主力")
    battleservice(findmainship(ltx,lty,rbx,rby))
  elseif findReconship(ltx,lty,rbx,rby)[1] then
    sysLog("侦查")
    battleservice(findReconship(ltx,lty,rbx,rby))
  elseif findCVA(ltx,lty,rbx,rby)[1] then
    sysLog("航母")
    battleservice(findCVA(ltx,lty,rbx,rby))
    
  elseif findMaterialship(ltx,lty,rbx,rby)[1] then
    sysLog("物资")
    battleservice(findMaterialship(ltx,lty,rbx,rby))
  else
    sysLog("什么都没找到")
    coroutine.resume(co)
    mSleep(1500)
  end
end
--寻路逻辑
local function findservice()
  local ltx,lty,rbx,rby=0,0,1919,1079
  --拖动协同程序
  co=coroutine.create(function()
      while true do
        sysLog("向上拖动")
        touchMoveUp()
        coroutine.yield(true)
        sysLog("向下拖动")
        touchMoveDown()
        coroutine.yield(true)
        sysLog("向下拖动")
        touchMoveDown()
        coroutine.yield(true)
        sysLog("向上拖动")
        touchMoveUp()
        coroutine.yield(false)
      end
    end
  )
  while true do
		battlcount=0
    local battlefinish=false
    sysLog("进入主逻辑")
    obstructservice(ltx,lty,rbx,rby)
    if battlefinish then
      break
    end
  end
end


init("0", 1); --以当前应用 Home 键在右边初始化
--while true do
--	local color=getColor(65,151)
--	sysLog(color)
--	mSleep(500)
--end
st,result=showUI("ui.json")

start()
--sysLog(searchchap())

while true do
  
  if index()[1]==true then
    attack(index()[2],index()[3])
    
  elseif checkpublic()==true then
    closepublic()
  elseif checkattackpage() then
    sysLog("进入选章界面")
    local chapflag=changechap(result["ComboBox1"]+1,newsearchchap())
    
    if chapflag then
      selectlevel(result["ComboBox1"]+1,result["ComboBox2"]+1)
      shipattack()
      mSleep(500)
      shipattack()
      findservice()
      break
    else
      checkelse()
    end
  else
    toast("请返回主界面")
    
    mSleep(3000)
  end
end
--x, y = findColor({0, 0, 1919, 1079}, 
--"0|0|0x2a87ae,-8|-15|0xffffff,-14|-33|0x2e8bb2,-17|-39|0xf6f6f4",
--95, 0, 0, 0)
--if x > -1 then


--else
--	sysLog("失败")
--end
--for re1,re2 in pairs(result) do
--	sysLog(re1)
--	sysLog(re2)


--	end
--getcolor返回数字
--找船界面需要位移
--没有检测到是否进入战斗
--主力和侦查舰都找不到
--章节转换错误
--没有自律
--是否直接在战斗界面