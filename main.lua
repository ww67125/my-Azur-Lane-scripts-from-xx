stopAudio()--检查是否在扫描敌军界面
local function checkscanner()
	x, y = findColor({0, 0, 1919, 1079}, 
		"0|0|0xd67d21,53|8|0x4a2400,83|10|0x847573,1|34|0xf7fbf7",
		95, 0, 0, 0)
	if x > -1 then
		return {true,x,y}
	else
		return {false}
	end
end
--匹配编辑框中的数字
local function matchnum(edit)
	a,b=string.find(edit,"%d+")
	
	c=string.sub(edit,a,b)
	
	return tonumber(c)
end

--拖动地图到合适位置
--向上拖动
local function touchMoveUp()
	mSleep(1500)
	touchDown(1, 900, 300)
	mSleep(200+math.random(100))
	touchMove(1, 900, 150)
	mSleep(200+math.random(100))
	touchUp(1, 900, 150)  
end
--向下拖动
local function touchMoveDown()
	mSleep(1500)
	touchDown(1, 900, 300)
	mSleep(200+math.random(100))
	touchMove(1, 900, 450)
	mSleep(200+math.random(100))
	touchUp(1, 900, 450)  
end

--检查是否在困难关卡
local function checkhard()
	x, y = findColor({0, 0, 1079, 1919}, 
		"0|0|0xf7f3f7,7|-4|0x102042,2|-29|0x73717b,-14|-34|0x001029",
		95, 0, 0, 0)
	if x > -1 then
		return {true,x,y}
	else
		return {false}
	end
end
--演习位置存储
local pvppos={{255,368},{619,356},{984,358},{1371,350}}
--章节存储
local chap1={{231,680},{687,406},{994,792},{1184,263}}
local chap2={{1225,682},{1125,282},{435,405},{581,818}}
local chap3={{603,325},{342,742},{1183,204},{922,541}}
local chap4={{361,459},{637,706},{1238,820},{1169,433}}
local chap5={{362,551},{1282,801},{1106,543},{889,318}}
local chap6={{1371,740},{1053,511},{640,321}}
--围剿斯佩伯爵
local chapex={{1368,454},{870,790},{588,369}}
local chapindex={chap1,chap2,chap3,chap4,chap5,chap6,chapex}
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
			tap(1086,490)
			
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
	local color1 = getColor(72,169)--获取(100,100)的颜色值，赋值给color变量
	sysLog(color1)
	if color1 == 15122993 then   --如果该点的颜色值等于0xffffff
		return true
	else
		return false
	end
	
end
--第二章
local function seconedchap()
	local color1 = getColor(72,169)--获取(100,100)的颜色值，赋值给color变量
	sysLog(color1)
	if color1 == 15647265 then   --如果该点的颜色值等于0xffffff
		return true
	else
		return false
	end
end
--第三章
local function thirdchap()
	local color1 = getColor(72,169)--获取(100,100)的颜色值，赋值给color变量
	sysLog(color1)
	if color1 == 16238121 then   --如果该点的颜色值等于0xffffff
		return true
	else
		return false
	end
end
--第四章
local function forthchap()
	local color1 = getColor(72,169)--获取(100,100)的颜色值，赋值给color变量
	sysLog(color1)
	if color1 == 5391632 then   --如果该点的颜色值等于0xffffff
		return true
	else
		return false
	end
end
--第五章
local function fifthchap()
	local color1 = getColor(72,169)--获取(100,100)的颜色值，赋值给color变量
	sysLog(color1)
	if color1 == 15123010 then   --如果该点的颜色值等于0xffffff
		return true
	else
		return false
	end
end
--第六章
local function sixchap()
	local color1 = getColor(72,169)--获取(100,100)的颜色值，赋值给color变量
	sysLog(color1)
	if color1 == 16237105 then   --如果该点的颜色值等于0xffffff
		return true
	else
		return false
	end
end
--第七章
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
	elseif fifthchap() then 
		return 5
	else
		return 6
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
	sysLog("小关坐标:"..levelx+levelrandom..","..levely+levelrandom)
	tap(levelx+levelrandom,levely+levelrandom)
	mSleep(500)
	
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
		"0|0|0xffffff,52|-36|0xd3d3d3,26|-31|0xe7e7e7,62|12|0xbbbbbb,95|-17|0x676564,96|11|0x000000,136|-15|0x605f5f,175|-36|0xb7b3af",
		95, 0, 0, 0)
	if x > -1 then
		
		return {true,x,y}
	else
		
		return {false,0,0}
	end
end
--判断未执行操作情况
local function checkelse()
	if appIsRunning("com.bilibili.azurlane")==false then
		return main()
	elseif loss()[1] then
		sysLog("断连")
		tap(loss()[2]+math.random(-5,5),loss()[3]+math.random(-5,5))
		mSleep(3000)
	elseif avoid()[1] then
		sysLog("规避")
		tap(avoid()[2]+math.random(-5,5),avoid()[3]+math.random(-5,5))
	elseif checkpublic() then
		sysLog("公告") 
		closepublic()
	elseif index()[1] then
		sysLog("主页面")
		attack(index()[2],index()[3])
		--  elseif checkscanner()[1] then
		--    sysLog("扫描敌军界面")
		--    attack(checkscanner()[2],checkscanner()[3])
	else
		attack(773,17)
	end
end
--捞船出击
local function shipattack()
	while true do
		point = findColors({0, 0, 1919, 1079}, 
			{
				{x=0,y=0,color=0x9c3d08},
				{x=-26,y=12,color=0xffdb4a},
				{x=-55,y=17,color=0xffffff}
			},
			95, 0, 0, 0)
		if #point ~= 0 then
			local randomship=math.random(#point)
			sysLog(randomship)
			tap(point[randomship].x,point[randomship].y)
			break
		else
			sysLog("没找到捞船出击页面")
			checkelse()
			mSleep(1000)
		end
	end
end
--寻找主力
local function findExmainship(ltx,lty,rbx,rby)
	local lock=1
	x, y = findColor({ltx, lty, rbx, rby}, 
		"0|0|0xa41029,-52|42|0xd6d6de,-103|32|0x6b696b,28|-28|0x848184",
		95, 0, 0, 0)
	if x > -1 then
		return {true,(x-40),y,lock}
	else
		return {false,0,0}
	end
	
end
--寻找活动主力
local function findmainship(ltx,lty,rbx,rby)
	local lock=1
	x, y = findColor({ltx, lty, rbx, rby}, 
		"0|0|0x831831,63|46|0x5a555b,-7|75|0xded6de",
		95, 0, 0, 0)
	if x > -1 then
		return {true,(x+10),(y+40),lock}
	else
		return {false,0,0}
	end
	
end
--寻找侦查
local function findReconship(ltx,lty,rbx,rby)
	local lock=2
	sysLog("寻找侦查时的范围:"..ltx..","..lty..","..rbx..","..rby)
	x, y = findColor({ltx,lty,rbx,rby}, 
		"0|0|0xe6e3e6,14|-10|0xdee3de,55|11|0x8c7563,77|-14|0x000008",
		95, 0, 0, 0)
	if x > -1 then
		sysLog("reshipx:"..x)
		sysLog("reshipy:"..y)
		return {true,(x+40),y,lock}
	else
		return {false,0,0}
	end
end
--寻找航母
local function findCVA(ltx,lty,rbx,rby)
	local lock=3
	x, y = findColor({ltx,lty,rbx,rby}, 
		"0|0|0x295450,11|0|0xe1cb99,23|-11|0x145e57",
		95, 0, 0, 0)
	if x > -1 then
		return {true,x,(y+20),lock}
	else
		return {false,0,0}
	end
end
--寻找boss
local function findBoss(ltx,lty,rbx,rby)
	
	local lock=4
	x, y = findColor({ltx,lty,rbx,rby}, 
		"0|0|0xff4d52,17|-17|0x422431,39|-5|0xee4d52,17|25|0x7b0410",
		95, 0, 0, 0)
	if x > -1 then
		return {true,(x+50),(y+10),lock}
	elseif battlcount>matchnum(result["Edit2"])-1 then
		local st,va=coroutine.resume(co)
		if va[1]==false then
			vacount=vacount+1;
		end
		if vacount==1 or va[1] then 
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
	local lock=5
	x, y = findColor({ltx,lty,rbx,rby}, 
		"0|0|0xd6b25a,11|1|0xd6c273,35|-34|0x635d63,40|-46|0x9c455a",
		95, 0, 0, 0)
	if x > -1 then
		return {true,(x+30),y,lock}
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
		return {true,x,(y+80)}
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
		
		return {true,(x+5),(y+130)}
	else
		return {false,0,0}
	end
end
--寻找自己
local function findme()
	x, y = findColor({0, 0, 1919, 1079}, 
		"0|0|0x008e31,32|0|0x005921,1|22|0x19ff6b,31|20|0x7bffa4",
		96, 0, 0, 0)
	if x > -1 then
		sysLog(x..","..y)
		return {true,(x+30),(y+300)}
	else
		return {false,0,0}             
	end
end
--自律
local function selfdiscipline(selfdis)
	
	if selfdisflag then
		sysLog("判断自律中:"..selfdis)
		if tonumber(selfdis)==0 then
			sysLog("选择开启自律")
			local color = getColor(155,65); --获取(100,100)的颜色值，赋值给color变量
			sysLog("自律颜色数值："..color)
			if color == 16777215 then   --未自律
				sysLog("没有自律")
				local selfrandom=math.random(-20,20)
				tap(209+selfrandom,80+selfrandom)	
				selfdisflag=false
			elseif color~=16777215 then 
				selfdisflag=false
			end
		else
			sysLog("选择关闭自律")
			local color = getColor(155,65); --获取(100,100)的颜色值，赋值给color变量
			if color ~= 16777215 then   --自律中
				sysLog("自律中")
				local selfrandom=math.random(-20,20)
				tap(209+selfrandom,80+selfrandom)	
			end
		end
	end
end
--战斗出击
local function battlestart()
	x, y = findColor({0, 0, 1919, 1079}, 
		"0|0|0xeea652,2|-59|0xc5e7e6,9|46|0x8ccece,-74|-8|0xf7f3e6",
		95, 0, 0, 0)
	if x > -1 then
		return {true,x,y}
	else
		return {false}
	end
end
--判断是否在战斗界面
local function checkbattle()
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
local function stopservice(targetx,targety)
	local stopy=vector
	local meflag
	local mex=0
	local mey=0
	sysLog("进入阻挡方案")
	while true do
		local fmtable=findme()
		 meflag=fmtable[1]
		 mex=fmtable[2]
		 mey=fmtable[3]
		if meflag then
			sysLog("找到自己了")
			sysLog("我的坐标："..mex..","..(mey+stopy))
			break
		else
			local st,va=coroutine.resume(co)
			stopy=va[2]+stopy
			checkelse()
			sysLog("找一下自己")
		end
	end
	if mex<(myx+20) and mex>(myx-20) and (mey+stopy)<(myy+50) and (mey+stopy)>(myy-50) then
		sysLog("有阻挡无法到达")
		
		
		if myx>targetx then
			ltx=targetx-150
			rbx=myx+150
			
		else
			ltx=myx-150
			rbx=targetx+150
			
		end
		if myy>targety then
			lty=targety-150
			rby=myy+150
		else
			lty=myy-150
			rby=targety+150
		end
		if math.abs(myx-targetx)>math.abs(myy-targety) then
			if (myx-targetx)>0 then
				ltx=ltx+255
			else
				rbx=rbx-255
			end
		else
			if (myy-targety)>0 then
				lty=lty+255
			else
				rby=rby-255
			end
			
		end
		
		
		sysLog("改变的大小："..ltx..","..lty..","..rbx..","..rby)
		battlcount=0
		stopflag=true
	else
		sysLog("遭到轰炸了，继续执行")
		tap(targetx,targety)
		mSleep(1000)
		stopbutmovecount=stopbutmovecount+1
		if stopbutmovecount>2 then
			stopflag=true
		end
	end
end
--准备战斗
local function preparebattle()
	mSleep(1000)
	if battlestart()[1] then
		
		
		sysLog("点击开始战斗")
		attack(battlestart()[2],battlestart()[3])
		mSleep(1000)
		while true do
			
			if checkbattle() then
				
				mSleep(2000);
				sysLog("在battle中")
				selfdiscipline(result["CheckBoxGroup1"]) 
			elseif finishbattle()[1] then			
				sysLog("结束战斗")
				attack(finishbattle()[2],finishbattle()[3])
				anyfinishcount=anyfinishcount+1
				sysLog("finisherverdaycount or pvpfinishcount:"..anyfinishcount)        
				break
			else
				checkelse()
				sysLog("战斗中检查其他问题")
				if battlestart()[1] then
					break
				end
			end
		end
	else
		sysLog("准备战斗方法里检查其他")
		checkelse()
	end
end
--进入战斗逻辑
local function battleservice(findfunction)
	stopbutmovecount=0
	stopflag=false
	findmeflag=true
	local anytable=findfunction
	local num=0
	local num1=0
	
	local positionx=anytable[2]+findmorerandom
	local positiony=anytable[3]+findmorerandom
	tap(positionx,positiony)
	sysLog("敌人坐标："..positionx..","..positiony)
	mSleep(2000)
	while true do
		mSleep(3000)
		if battlestart()[1] then
			sysLog("点击开始战斗")
			attack(battlestart()[2],battlestart()[3])
			
			while true do
				if checkbattle() then
					
					
					sysLog("在battle中")
					selfdiscipline(result["CheckBoxGroup1"]) 
					mSleep(2000)
				elseif finishbattle()[1] then
					
					sysLog("结束战斗")
					attack(finishbattle()[2],finishbattle()[3])
					battlcount=battlcount+1
					sysLog("battlcount:"..battlcount)
					ltx,lty,rbx,rby=0,70,1919,1079
					publicLock=0
					if bossflag then
						battlefinish=true
						sysLog("小关战斗已经结束")
					end
					break
				else
					
					checkelse()
					if checkscanner()[1] then
						sysLog("扫描敌军界面")
						attack(checkscanner()[2],checkscanner()[3])
					end
					  sysLog("战斗中检查其他问题")
				end
			end
			break
		elseif findme()[1] and checkscanner()[1] then
			num1=num1+1
			if num1 <5 then
				stopservice(anytable[2],anytable[3]+vector)
				if stopflag then
					break
				end
			else
				break
			end
		else
			sysLog("查找其他问题")
			checkelse()
			num=num+1
			if num>4 then
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
	vacount=0
	if obscount>3 then
		ltx,lty,rbx,rby=0,70,1919,1079
		obscount=0
		sysLog("阻挡方案失败，重新开始")
	end
	findmorerandom=math.random(10)
	mSleep(1000) 
	--	if findme()[1] then
	--		sysLog("找到自己了")
	--		myx=findme()[2]
	--		myy=findme()[3]
	--		sysLog("我的坐标："..myx..","..myy)
	--		vector=0
	--		findmeflag=false
	--	end
	while findmeflag do
		local fmtable=findme()
		local meflag=fmtable[1]
		local mex=fmtable[2]
		local mey=fmtable[3]
		if meflag then
			sysLog("找到自己了")
			myx=mex
			myy=mey
			sysLog("我的坐标："..myx..","..myy)
			vector=0
			findmeflag=false
		else
			coroutine.resume(co)
			checkelse()
			sysLog("找一下自己")
		end
	end
	if battlcount>=3 and tonumber(result["CheckBoxGroup6"])==0 and bulletflag then
		sysLog("寻找弹药")
		if findammunition()[1] then
			bossflag=false
			sysLog("弹药")
			findmeflag=true
			attack(findammunition()[2],findammunition()[3])
			bulletflag=false
		end
	end
	if findquestion(ltx,lty,rbx,rby)[1] then
		bossflag=false
		sysLog("问号")
		battleservice(findquestion(ltx,lty,rbx,rby))
	elseif findBoss(ltx,lty,rbx,rby)[1] then
		bossflag=true
		sysLog("boss")
		battleservice(findBoss(ltx,lty,rbx,rby))
		
	elseif findmainship(ltx,lty,rbx,rby)[1] or findExmainship(ltx,lty,rbx,rby)[1]then
		bossflag=false
		sysLog("主力")
		if findmainship(ltx,lty,rbx,rby)[1] then
			battleservice(findmainship(ltx,lty,rbx,rby))
		else
			battleservice(findExmainship(ltx,lty,rbx,rby))
		end
	elseif findReconship(ltx,lty,rbx,rby)[1] then
		bossflag=false
		sysLog("侦查")
		battleservice(findReconship(ltx,lty,rbx,rby))
	elseif findCVA(ltx,lty,rbx,rby)[1] then
		bossflag=false
		sysLog("航母")
		battleservice(findCVA(ltx,lty,rbx,rby))
		
	elseif findMaterialship(ltx,lty,rbx,rby)[1] then
		bossflag=false
		sysLog("物资")
		battleservice(findMaterialship(ltx,lty,rbx,rby))
	else
		sysLog("什么都没找到")
		checkelse()
		if ltx~=0 then
			obscount=obscount+1
		end
		local st,va=coroutine.resume(co)
		vector=vector+va[2]
		mSleep(1000)
	end
end
--寻路逻辑
local function findservice()
	bossflag=false
	battlcount=0
	selfdisflag=true
	obscount=0
	bulletflag=true
	findmeflag=true
	--拖动协同程序
	co=coroutine.create(function()
			while true do
				sysLog("向上拖动")
				touchMoveUp()
				coroutine.yield({true,200})
				sysLog("向下拖动")
				touchMoveDown()
				coroutine.yield({true,-200})
				sysLog("向下拖动")
				touchMoveDown()
				coroutine.yield({true,-200})
				sysLog("向上拖动")
				touchMoveUp()
				coroutine.yield({false,200})
			end
		end
	)
	
	while true do
		mSleep(1000)
		battlefinish=false
		sysLog("进入主逻辑")
		obstructservice(ltx,lty,rbx,rby)
		if battlefinish then
			break
		end
	end
end
--选择困难模式
local function selecthardmode()
	x, y = findColor({0, 0, 1919, 1079}, 
		"0|0|0xcb1214,5|5|0xf6f6f6,8|11|0xd03335,-5|20|0x631314",
		95, 0, 1, 0)
	if x > -1 then
		attack(x,y)
		mSleep(500)
		sysLog("进入困难模式")
	else
		checkelse()
	end
end
--撤退
local function comeback()
	x, y = findColor({0, 0, 1919, 1079}, 
		"0|0|0xce1010,-3|23|0x631010,-42|16|0xfffbf7,11|22|0xf7f3f7",
		95, 0, 0, 0)
	if x > -1 then
		attack(x,y)
		mSleep(500)
		sysLog("撤退")
		mSleep(500)
		attack(loss()[2],loss()[3])
	end
end
--确认已经进入每日分类
local function checkeveryday()
	x, y = findColor({0, 0, 1919, 1079}, 
		"0|0|0xf7c25a,34|-3|0x73aeff,74|-13|0xce494a",
		95, 0, 0, 0)
	if x > -1 then
		sysLog("已经在每日分类中")
		return true
	else
		return false
	end
end
--确认在每日选关中
local function checkeverylevel()
	x, y = findColor({0, 0, 1919, 1079}, 
		"0|0|0xeec273,2|-300|0xa42863,0|-282|0xffaaa4,83|21|0xf7fbf7,141|292|0x29315a",
		95, 0, 0, 0)
	if x > -1 then
		return true
	else
		return false
	end
end
--确认在演习选择界面
local function checkpvpselect()
	x, y = findColor({1529, 494, 1899, 641}, 
		"0|0|0xf7f3f7,2|-38|0x00aade,-4|20|0x08556b",
		95, 0, 0, 0)
	if x > -1 then
		return true
	else
		return false
	end
end
--检查在确认对手界面
local function checkwho()
	x, y = findColor({1369, 897, 1793, 1025}, 
		"0|0|0xffffff,51|-28|0xefce42,193|-40|0x943900",
		95, 0, 0, 0)
	if x > -1 then
		
		return {true,x,y}
	else
		return {false,0,0}
	end
end
--演习总逻辑
local function pvpservice()
	local pvpnum=0
	local pvpnum1=0
	anyfinishcount=0
	if tonumber(result["CheckBoxGroup3"])==0 then
		
		mSleep(2500)
		attack(1784+math.random(-20,20),1015+math.random(-20,20))
		sysLog("进入演习")
		while anyfinishcount<matchnum(result["Edit4"]) and pvpnum<(matchnum(result["Edit4"])) and pvpnum1<4 do
			if checkpvpselect then
				mSleep(3000)
				local pvprandom=math.random(1,4)
				attack(pvppos[pvprandom][1]+math.random(-50,50),pvppos[pvprandom][2]+math.random(-50,50))
				sysLog("我选择的是第"..pvprandom.."个对手")
				
				while true do
					mSleep(2000)
					
					if checkwho()[1] then 
						sysLog("在确认对手界面")
						attack(checkwho()[2]+math.random(-50,50),checkwho()[3]+math.random(-20,20))
						mSleep(2000)
						preparebattle()
						pvpnum=pvpnum+1
						break
					else
						sysLog("演习中检查别的问题")
						if appIsRunning("com.bilibili.azurlane")==false then
							return main()
						elseif loss()[1] then
							sysLog("断连")
							tap(loss()[2]+math.random(-5,5),loss()[3]+math.random(-5,5))
						end
						pvpnum1=pvpnum1+1
						if pvpnum1>4 then
							break
						end
					end
				end
				sysLog("pvpnum:"..pvpnum)
				if anyfinishcount~=pvpnum then
					mSleep(2000)
					attack(49,29)
					sysLog("演习退出第一次")
				end
			else
				checkelse();
				pvpnum1=pvpnum1+1
			end
		end
		
		
		while true do
			mSleep(2000)
			if checkpvpselect() then
				attack(49,29)
				sysLog("演习应该已经完成")
				break
			end
		end
		
	end
end
--每日总逻辑
local function everydayservice()
	
	selfdisflag=true
	if tonumber(result["CheckBoxGroup4"])==0 and everydayflag then
		local alleverynum=0
		while everydayflag do
			sysLog("每日")
			local everydaynum=0
			local everydaynum1=0
			
			
			attack(1215+math.random(-50,50),1015)
			sysLog("进入每日")
			mSleep(2000)
			if checkeveryday() then
				anyfinishcount=0
				attack(999+math.random(-50,50),516+math.random(-100,100))
				mSleep(1000)
				while anyfinishcount<result["RadioGroup2"]+1 do
					
					if checkeverylevel() then
						attack(879+math.random(-100,100),314+math.random(-50,50))
						mSleep(2000)
						preparebattle()
						mSleep(2000)
						if anyfinishcount==0 then
							everydaynum1=everydaynum1+1
						end
						if everydaynum1>2 then
							sysLog("每日可能已经完成1")
							
							break
						end
						
					else
						if everydaynum>2 then
							sysLog("每日可能已经完成2")
							
							break
						end
						everydaynum=everydaynum+1
						sysLog("每日选关里出了问题")
						checkelse()
					end
				end
				alleverynum=alleverynum+1
				mSleep(1000)
				if anyfinishcount~=0 or alleverynum==1 or tonumber(result["CheckBoxGroup5"])==0 then
					mSleep(2000)
					attack(49,29)
					sysLog("每日退出第一次")
				end
				mSleep(1000)
				if alleverynum>2 then
					everydayflag=false
				end
				if tonumber(result["CheckBoxGroup5"])==0 and everydayflag then
					if anyfinishcount~=0 then
						for var=1,alleverynum do
							attack(566+math.random(-30,30),528+math.random(-100,100))
							mSleep(500)
						end
					else
						attack(566+math.random(-30,30),528+math.random(-100,100))
					end
					sysLog("进入下一每日")
					anyfinishcount=0
				else
					mSleep(1000)
					attack(49,29)
					sysLog("每日正常完成")
					everydayflag=false
				end
				
				
				mSleep(2000)
			else
				sysLog("每日分类里出了问题")
				
			end
		end
	end
end
--普通和困难切换
local function changemode(compare1,compare2,normal,hard)
	if compare1==0 and compare2 then
		sysLog("hard")
		return hard
		
	else
		sysLog("normal")
		return normal
	end
end
--捞船总逻辑
local function Fishingboatallservice()
	sysLog("进入选章界面")
	if (hardflag==false and checkhard()[1]) or (checkhard()[1] and tonumber(result["CheckBoxGroup2"])~=0) then
		sysLog("切换到普通")
		attack(checkhard()[2],checkhard()[3])
		mSleep(1000)
	end
	mSleep(1500)
	local chapflag=changechap(changemode(tonumber(result["CheckBoxGroup2"]),hardflag,result["ComboBox1"]+1,result["ComboBox3"]+1),newsearchchap()) 
	if chapflag then
		mSleep(3000)
		
		if tonumber(result["CheckBoxGroup2"])==0 and checkattackpage() and hardflag then
			sysLog("判断是否需要进入困难")
			
			selecthardmode()
		end
		mSleep(1500)
		local finishcount=0
		while finishcount<matchnum(changemode(tonumber(result["CheckBoxGroup2"]),hardflag,result["Edit1"],result["Edit3"])) do
			mSleep(2000)
			checkelse()
			selectlevel(changemode(tonumber(result["CheckBoxGroup2"]),hardflag,result["ComboBox1"]+1,result["ComboBox3"]+1),changemode(tonumber(result["CheckBoxGroup2"]),hardflag,result["ComboBox2"]+1,result["ComboBox4"]+1))
			shipattack()
			mSleep(500)
			shipattack()
			
			sysLog("剩余"..(matchnum(changemode(tonumber(result["CheckBoxGroup2"]),hardflag,result["Edit1"],result["Edit3"]))-finishcount-1).."次")
			findservice()
			finishcount=finishcount+1
			mSleep(5000)
			
		end 
		
		if tonumber(result["CheckBoxGroup2"])~=0 then
			hardflag=false
		end
		
		if hardflag then
			sysLog("所有困难模式战斗结束")
			sysLog("开始普通战斗")
		end
	else
		checkelse()
		if checkscanner()[1] then
			sysLog("扫描敌军界面")
			attack(checkscanner()[2],checkscanner()[3])
		end
	end
end
--斯佩伯爵入口
local function findExEter()
	x, y = findColor({0, 0, 1919, 1079}, 
		"0|0|0xeedfd6,23|-12|0xbd1c31,9|-10|0xc5eff7,-25|-7|0xc5efef,-8|18|0xbd1021,-4|30|0x000000",
		95, 0, 0, 0)
	if x > -1 then
		return {true,x,y}
	else
		return {false}
	end
end
--围剿斯佩伯爵逻辑
local function battleofEX()
	if tonumber(result["CheckBoxGroup7"])==0 then
		while true do
			if findExEter() then
				sysLog("找到特殊活动")
				attack(findExEter()[2]+math.random(-30,30),findExEter()[3]+math.random(-30,30))
				mSleep(2000)
				sysLog("进入特殊活动")
				x, y = findColor({0, 0, 1919, 1079}, 
					"0|0|0x8c4d42,23|8|0x191821,61|27|0xb57563,72|34|0xa44142,21|62|0x211c29",
					95, 0, 0, 0)
				if x > -1 then
					finishcount=0
					while finishcount<matchnum(result["Edit5"]) do
						selectlevel(7,result["ComboBox5"]+1)
						shipattack()
						mSleep(500)
						shipattack()
						sysLog("剩余"..(matchnum(result["Edit5"]-finishcount-1).."次"))
						findservice()
						finishcount=finishcount+1
						mSleep(5000)
					end
					sysLog("活动关卡完成")
					break
				else
					checkelse()
				end
			else
				sysLog("没找到特殊活动入口")
				checkelse()
			end
		end
	end
end
myx,myy=2000,2000
ltx,lty,rbx,rby=0,70,1919,1079
publicLock=0
everydayflag=true
hardflag=true
vector=0
init("0", 1); --以当前应用 Home 键在右边初始化
--while true do
--	local color=getColor(65,151)
--	sysLog(color)
--	mSleep(500)
--end
setScreenScale(1080,1920)    --在540*960分辨率的手机中开发了脚本，要在720*1280的设备中运行 -
setSysConfig("isLogFile","1") --将日志写入文件
--开发助手 
--Android：/sdcard/com.xxscript.idehelper/tengine/log/user/脚本名.log 
--叉叉助手 
--Android：/sdcard/com.xxAssistant/tengine/log/user/脚本id.log 
st,result=showUI("ui.json")

if st==0 then
	lua_exit()
end

local function main()
	start()
	while true do
		
		if index()[1]==true then
			attack(index()[2],index()[3])
			
		elseif checkpublic()==true then
			closepublic()
			
		elseif checkattackpage() or checkhard()[1] then
			everydayservice()	
			
			pvpservice()
			
			Fishingboatallservice()
			battleofEX()
			if hardflag==false then
				sysLog("所有战斗结束")
				break
			end
			hardflag=false
			
		elseif checkscanner()[1] then
			sysLog("扫描敌军界面")
			
			comeback()
			
		else
			toast("请返回主界面")
			
			mSleep(3000)
		end
	end
end
main()
--while true do
--local color1 = getColor(72,169)--获取(100,100)的颜色值，赋值给color变量
--sysLog(color1)
--end

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
--尼玛屎一样的代码自己都不想看
--每次拖动应该在敌人基础坐标上加上拖动距离
--判断困难次数不够的情况
--找boss的回合还是有问题
--困难模式完成
--每日解决
--getcolor返回数字
--找船界面需要位移
--没有检测到是否进入战斗
--主力和侦查舰都找不到 主力解决 侦察舰问题很大 解决
--章节转换错误
--没有自律
--是否直接在战斗界面