tabchi = dofile('./bot/funcation.lua')
--------------------------------
tabchi_id = 367972169
---------------------------------
json = dofile('./libs/JSON.lua')
---------------------------------
URL = require "socket.url"
----~~~~~~~~~~~~~~~~
serpent = dofile("./libs/serpent.lua")
------~~~~~~~~~~~~~~~~
http = require "socket.http"
-----~~~~~~~~~~~~~~~~
https = require "ssl.https"
-----~~~~~~~~~~~~~~~~
d = dofile('./libs/redis.lua')
-------------------------------
config_sudo = {143928486,210468070}
function dl_cb(arg, data)
end
function is_sudo(msg)
  local var = false
  for v,user in pairs(config_sudo) do
    if user == msg.sender_user_id_ then
      var = true
    end
  end
  return var
end
	  function showedit(msg,data)
         if msg then
  tabchi.viewMessages(msg.chat_id_, {[0] = msg.id_})
      if msg.send_state_.ID == "MessageIsSuccessfullySent" then
      return false 
      end     
 if msg.chat_id_ then
      local id = tostring(msg.chat_id_)
      if id:match('-100(%d+)') then
        chat_type = 'super'
        elseif id:match('^(%d+)') then
        chat_type = 'user'
        else
        chat_type = 'group'
        end
      end

 local text = msg.content_.text_
	if text and text:match('[QWERTYUIOPASDFGHJKLZXCVBNM]') then
		text = text
		end
    if msg.content_.ID == "MessageText" then
      msg_type = 'text'
    end
    if msg.content_.ID == "MessageChatAddMembers" then
      msg_type = 'user'
    end
    if msg.content_.ID == "MessageChatJoinByLink" then
      msg_type = 'Joins'
    end
   if msg.content_.ID == "MessageDocument" then
        print("This is [ File Or Document ]")
        msg_type = 'Document'
      end
      -------------------------
      if msg.content_.ID == "MessageSticker" then
        print("This is [ Sticker ]")
        msg_type = 'Sticker'
      end
      -------------------------
      if msg.content_.ID == "MessageAudio" then
        print("This is [ Audio ]")
        msg_type = 'Audio'
      end
      -------------------------
      if msg.content_.ID == "MessageVoice" then
        print("This is [ Voice ]")
        msg_type = 'Voice'
      end
      -------------------------
      if msg.content_.ID == "MessageVideo" then
        print("This is [ Video ]")
        msg_type = 'Video'
      end
      -------------------------
      if msg.content_.ID == "MessageAnimation" then
        print("This is [ Gif ]")
        msg_type = 'Gif'
      end
      -------------------------
      if msg.content_.ID == "MessageLocation" then
        print("This is [ Location ]")
        msg_type = 'Location'
      end
    
      -------------------------
      if msg.content_.ID == "MessageContact" then
        print("This is [ Contact ]")
        msg_type = 'Contact'
      end
      
 if not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
        print("This is [ MarkDown ]")
        msg_type = 'Markreed'
      end
    if msg.content_.ID == "MessagePhoto" then
      msg_type = 'Photo'
end
-----------------------------------------------
function check_markdown(text) 
		str = text
		if str:match('_') then
			output = str:gsub('_',[[\_]])
		elseif str:match('*') then
			output = str:gsub('*','\\*')
		elseif str:match('`') then
			output = str:gsub('`','\\`')
		else
			output = str
		end
	return output
end
    -------------------------------------------
    if msg_type == 'text' and text then
      if text:match('^[/]') then
      text = text:gsub('^[/]','')
      end
    end
  local savecontact = (d:get('savecontactXXX') or 'no') 
    if savecontact == 'yes' then
 if msg.content_.ID == "MessageContact" then
	  tabchi.importContacts(msg.content_.contact_.phone_number_, (msg.content_.contact_.first_name_ or '--'), '#CerNer Team', msg.content_.contact_.user_id_)
        print("ConTact Added")
local function c(a,b,c) 
  tabchi.sendContact(msg.chat_id_, msg.id_, 0, 1, nil, b.phone_number_, b.first_name_, (b.last_name_ or ''), 0)
 end
tabchi.getMe(c)
d:sadd('tcomXXX', msg.content_.contact_.user_id_)
local text = d:get('pmXXX')
if not text then
text = 'Addi Golam Bia Pv :0'
end
        tabchi.sendText(msg.chat_id_, msg.id_, 1, text,1, 'md')
        print("Tabchi [ Message ]")

end
end
   if text == 'leave sgp' and is_sudo(msg) then
          local list = d:smembers('tsgpsXXX')
          for k,v in pairs(list) do
       tabchi.changeChatMemberStatus(v, tabchi_id, "Left")
        print("Tabchi [ Left ]")

d:del('tsgpsXXX')
   end
tabchi.sendText(msg.sender_user_id_, 0, 1,'*Done \nthe bot ad trader from all Supergroups your exited*', 1, 'md')
   print("Tabchi [ Message ]")

      end
if text and text:match('^setapi (%d+)') and is_sudo(msg) then
          local id = text:match('^setapi (%d+)')
d:set('apiidXXX',id)
tabchi.sendText(msg.chat_id_, msg.id_, 1,'*Done*', 1, 'md')
end
		if text == 'git pull' and is_sudo(msg) then
text = io.popen("git pull"):read('*all')
 tabchi.sendText(msg.chat_id_, msg.id_, 1,text, 1, 'md')
end
 if text == 'addapi' and is_sudo(msg) then
if d:get('apiidXXX') then
local id = d:get('apiidXXX')
  local add = d:smembers("tsgpsXXX")
          for k,v in pairs(add) do
    tabchi.addChatMember(v, id,20)
  end
 local add = d:smembers("tgpXXX")
local id = d:get('apiidXXX')
          for k,v in pairs(add) do
    tabchi.addChatMember(v, id,20)
  end
tabchi.sendText(msg.chat_id_, msg.id_, 1,'*Done*', 1, 'md')
end
end
 if text == 'leave gp' and is_sudo(msg) then
          local list = d:smembers('tgpXXX')
          for k,v in pairs(list) do
       tabchi.changeChatMemberStatus(v, tabchi_id, "Left")
        print("Tabchi [ Left ]")
d:del('tgpXXX')       
   end
tabchi.sendText(msg.sender_user_id_, 0, 1,'*Done \nthe bot ad trader from all groups your exited*', 1, 'md')
   print("Tabchi [ Message ]")
      end
	  	if text:match("^adds @(.*)") then 
				          local username = text:match('^adds @(.*)')
				  function demreply(extra,result,success)
          if result.id_ then
        text = 'کاربر (<code>'..result.id_..'</code>) به لیست اضافه شد!'
		d:sadd("addsXXX",result.id_)
            else 
            text = '<i>کاربر یافت نشد!</i>'
            end 
tabchi.sendText(msg.sender_user_id_, 0, 1,text, 1, 'md')
          end
		  local function resolve_username(username,cb)
  tdcli_function ({
    ID = "SearchPublicChat",
    username_ = username
  }, cb, nil)
end
        resolve_username(username,demreply)
		elseif text=="rem adds" then 
		d:del("addsXXX")
		tabchi.sendText(msg.chat_id_, 0, 1,'همش پاک شد دادو // By:SinaXhpm', 1, 'md')

		end
	  	if text:match("^start @(.*)") then 
				  		local username = text:match('^start @(.*)')
						  --SinChi By:SinaXhpm
						function promreply(extra,result,success)
						  if result.id_ then
						    --SinChi By:SinaXhpm
								    tdcli_function ({
    ID = "SendBotStartMessage",
    bot_user_id_ = result.id_,
    chat_id_ = result.id_,
    parameter_ = 'start'
  }, dl_cb, nil)
    --SinChi By:SinaXhpm

						  text ='<code>'..result.id_..'</code><b>دراکانت استارت خورد!</b> ' 
						  else
						    --SinChi By:SinaXhpm
						  text = '<i>کاربر یافت نشد</i> @Sin_Chi' end
tabchi.sendText(msg.chat_id_, 0, 1,text, 1, 'md')
						   end
						     --SinChi By:SinaXhpm
						 tdcli_function ({
    ID = "SearchPublicChat",
    username_ = username
  }, promreply, nil)
  end
		 if text and text:match('^setname (.*)') then
          local name = text:match('^setname (.*)')
		  tabchi.changeName(name, '')
		       local text = '*Name Changed To* `'..name..'`'
			 tabchi.sendText(msg.chat_id_, msg.id_, 1,text, 1, 'md')


		  end
if text == 'panel' and is_sudo(msg) then
local gps = d:scard("tsgpsXXX") or 0
local user = d:scard("tusersXXX")
local gp = d:scard("tgpXXX") or 0
local com = d:scard("tcomXXX") or 0
local block = d:scard("tblockXXX") or 0
local allmsg = d:get("tallmsgXXX") or 0
local link = d:scard('linksXXX') or 0 
local text = '> Stats For Tabchi Bot : \n\n> `All Msg :` *'..allmsg..'*\n\n`> SuperGroup  :`* '..gps..'*\n\n`> Group  :` *'..gp..'*`\n\n> Users : `*'..user..'*\n\n`> Contact  :` *'..com..'*`\n\n> Total Links :` *'..link..'*`\n\n> Blocked :` *'..block..'*\n\n> `Create By` *CerNer Team*'
 tabchi.sendText(msg.chat_id_, msg.id_,1,text,1,'md')
 end
 if text == 'settings' and is_sudo(msg) then
local pm = d:get('pm')
if not pm then
pm = 'Addi Golam Bia Pv :0'
end
 if d:get('savecontactXXX') then
              co = 'Enable'
            else
              co = 'Disable'
            end
 if d:get('joinlinkXXX') then
              join = 'Enable'
            else
              join = 'Disable'
            end
   tabchi.sendText(msg.chat_id_, msg.id_, 1, '>* Settings For Tabchi Bot :*\n> Pm  : *'..pm..'*\n\n> Auto Join : *'..join..'*\n> Save Contact : *'..co..'*\n\n`Create By` *CerNer Team*', 1, 'md')
        print("Tabchi [ Message ]")

end
if text == 'addmembers' and is_sudo(msg) then
  local pv = d:smembers("tusersXXX")
  for i = 1, #pv do
    tabchi.addChatMember(msg.chat_id_, pv[i], 5)
  end
 local co = d:smembers("tcomXXX")
  for i = 1, #co do
    tabchi.addChatMember(msg.chat_id_, co[i], 5)
  end
  tabchi.sendText(msg.chat_id_, msg.id_,1,'All Members Has Been Added To Group ',1,'md')
 end
  if text and text:match('^addtoall (%d+)')  then
          local id = text:match('^addtoall (%d+)')
  local add = d:smembers("tsgpsXXX")
          for k,v in pairs(add) do
    tabchi.addChatMember(v, id,5)
  end
 local add = d:smembers("tgpXXX")
          for k,v in pairs(add) do
    tabchi.addChatMember(v, id,5)
  end
  tabchi.sendText(msg.chat_id_, msg.id_,1,'User '..id..' Has Been Added To All Group ',1,'md')
end

--[[if text == 'panel' and is_sudo(msg) then
function Helper(code,lua)
          tdcli_function({
        ID = "SendInlineQueryResultMessage",
        chat_id_ = msg.chat_id_,
        reply_to_message_id_ = msg.id_,
        disable_notification_ = 0,
        from_background_ = 1,
        query_id_ = lua.inline_query_id_,
        result_id_ = lua.results_[0].id_
      }, dl_cb, nil)
end
          tdcli_function({
      ID = "GetInlineQueryResults",
      bot_user_id_ = 000000000,
      chat_id_ = msg.chat_id_,
      user_location_ = {
        ID = "Location",
        latitude_ = 0,
        longitude_ = 0
      },
      query_ = '----------',
      offset_ = 0
    }, Helper, nil)
       end]]--
if text == 'reset' and is_sudo(msg) then
d:del("tallmsgXXX")
d:del("tsgpsXXX")
d:del("tgpXXX")
d:del("tcomXXX")
d:del("tblockXXX")
d:del("tusersXXX")
d:del("linksXXX")
d:del("tbotmsgXXX")
tabchi.sendText(msg.chat_id_, msg.id_,1,' Stats TabChi Has Been Reseted ',1,'md')
        print("Tabchi [ Message ]")

end
if text == 'join enable' and is_sudo(msg) then

          d:set('joinlinkXXX','yes')
         tabchi.sendText(msg.chat_id_, msg.id_, 1,'`Auto Join` *Has Been Enabled*', 1, 'md')
                  print("Tabchi [ Message ]")

end
        if text == 'join disable' and is_sudo(msg) then

          d:set('joinlinkXXX','no')
         d:del('joinlinkXXX','yes')  
        tabchi.sendText(msg.chat_id_, msg.id_, 1,'`Auto Join` *Has Been Disabled*', 1, 'md')
                print("Tabchi [ Message ]")

  end
if text == 'savecontact enable' and is_sudo(msg) then

          d:set('savecontactXXX','yes')
         tabchi.sendText(msg.chat_id_, msg.id_, 1,'`Save Contact`  *Has Been Enabled*', 1, 'md')
                 print("Tabchi [ Message ]")

 end
        if text == 'savecontact disable' and is_sudo(msg) then

          d:set('savecontactXXX','no')
          d:del('savecontactXXX','yes')

          tabchi.sendText(msg.chat_id_, msg.id_, 1,'`Save Contact`  *Has Been Disabled*', 1, 'md')
                  print("Tabchi [ Message ]")

end
if text and text:match("^(pm) (%d+) (.*)") and is_sudo(msg) then

      local matches = {
        text:match("^(pm) (%d+) (.*)")
      }
      if #matches == 3 then
        tabchi.sendText((matches[2]), 0, 1, matches[3], 1, "html")
                    print("Tabchi [ Message ]")
 
  tabchi.sendText(msg.chat_id_, msg.id_, 1, '*Send!*', 1, 'md')
      end
end
 if text and text:match('^jointo (.*)') and is_sudo(msg) then

  local link = text:match('^jointo (.*)')
tabchi.importChatInviteLink(link, dl_cb, nil)
            print("Tabchi [ Message ]")

    tabchi.sendText(msg.chat_id_, msg.id_, 1, '*Done!*', 1, 'md')
end
   if text and text:match('^block (%d+)') and is_sudo(msg) then

  local b = text:match('block (%d+)')
d:sadd('tblockXXX',b)
   tabchi.blockUser(b)
 tabchi.sendText(msg.chat_id_, msg.id_, 1, '*User Blocked*', 1, 'md')
end
             if text and text:match('^unblock (%d+)') and is_sudo(msg) then

  local b = text:match('^unblock (%d+)')
d:srem('tblockXXX',b)
     tabchi.unblockUser(b)
      tabchi.sendText(msg.chat_id_, msg.id_, 1, '*User Unblocked*', 1, 'md') 
end

if text == 'tabliqgar' and is_sudo(msg) then
tabchi.sendText(msg.chat_id_, msg.id_, 1,'*TbabliqGar\n*telegra.ph/CernerTeam-05-26', 1, 'md')
end


if text and text:match('^setpm (.*)') and is_sudo(msg) then
            local link = text:match('setpm (.*)')
            d:set('pmXXX', link)
          tabchi.sendText(msg.chat_id_, msg.id_, 1,'*Seted*', 1, 'md')
            end
 if text == 'delpm' then
            d:del('pmXXX')
          tabchi.sendText(msg.chat_id_, msg.id_, 1,'*Pm Removed*', 1, 'md')
            end
if text == 'reload' and is_sudo(msg) then
 dofile('./bot/funcation.lua')
 dofile('./bot/tabchi.lua')
tabchi.sendText(msg.chat_id_,msg.id_,1,'*Tabchi BOT Reloaded*',1,'md')
end
if text and text:match('^leave(-100)(%d+)$') then
local leave = text:match('leave(-100)(%d+)$') 
       tabchi.sendText(msg.chat_id_,msg.id_,1,'騎필 훌 新繃綽 할 落 '..leave..' 曠緊 冬.',1,'md')
     tabchi.changeChatMemberStatus(leave, tabchi_id, "Left")
  end

  local joinlink = (d:get('joinlinkXXX') or 'no') 
    if joinlink == 'yes' then
	if text and text:match("https://telegram.me/joinchat/%S+") or text and text:match("https://t.me/joinchat/%S+") or text and text:match("https://t.me/joinchat/%S+")  or text and text:match("https://telegram.dog/joinchat/%S+") then
		local text = text:gsub("t.me", "telegram.me")
		for link in text:gmatch("(https://telegram.me/joinchat/%S+)") do
			if not d:sismember("linksXXX", link) then
				d:sadd("linksXXX", link)
				tabchi.importChatInviteLink(link)
			end
		end
end
end
------------------------------------
------------------------------------
d:incr("tallmsg")
------------------------------------
 if msg.chat_id_ then
      local id = tostring(msg.chat_id_)
      if id:match('-100(%d+)') then
        if not d:sismember("sgpsXXX",msg.chat_id_) then
          d:sadd("tsgpsXXX",msg.chat_id_)
          d:sadd("sgpsXXX",msg.chat_id_)
  d:setex("eXXX"..msg.chat_id_,2400,true)
				for v,user in pairs(d:smembers("addsXXX")) do
			tdcli_function ({
								ID = "AddChatMember",
								chat_id_ = id,
								user_id_ = user,
								forward_limit_ =  50
							}, dl_cb, nil)						  
			end
elseif d:get("eXXX"..msg.chat_id_)==nil then
 function lkj(arg, data)
			bot_id=data.id_ 
			          d:srem("tsgpsXXX",msg.chat_id_)
			          d:srem("sgpsXXX",msg.chat_id_)

			tdcli_function ({
							ID = "ChangeChatMemberStatus",
							chat_id_ = msg.chat_id_,
							user_id_ = bot_id,
							status_ = {ID = "ChatMemberStatusLeft"},
						}, dl_cb, nil)
		end 
			tdcli_function({ID="GetMe",},lkj, nil)
        end
-----------------------------------
elseif id:match('^-(%d+)') then
if not d:sismember("tgpXXX",msg.chat_id_) then
d:sadd("tgpXXX",msg.chat_id_)

end
-----------------------------------------
elseif id:match('') then
if not d:sismember("tusers",msg.chat_id_) then
d:sadd("tusersXXX",msg.chat_id_)
end
   else
        if not d:sismember("tsgpsXXX",msg.chat_id_) then
            d:sadd("tsgpsXXX",msg.chat_id_)
           
end
end
end
end
end
      function tdcli_update_callback(data)
 ------vardump(data)
    if (data.ID == "UpdateNewMessage") then
     showedit(data.message_,data)
  elseif (data.ID == "UpdateMessageEdited") then
    data = data
    local function edit(extra,result,success)
      showedit(result,data)
    end
     tdcli_function ({ ID = "GetMessage", chat_id_ = data.chat_id_,message_id_ = data.message_id_}, edit, nil)
  elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
    tdcli_function ({ ID="GetChats",offset_order_="9223372036854775807", offset_chat_id_=0,limit_=20}, dl_cb, nil)
  end
end


