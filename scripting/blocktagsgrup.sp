#include <sourcemod>

public Plugin myinfo =
{
	name 		= 	"[ ZK Servidores™ ] Block Tag Groups Steam",
	author 		= 	"Geison, crashzk",
	description	=	"Block bind to switch Steam Group",
	version 	= 	"1.1",
	url 		= 	"https://github.com/zkservidores-clientes"
}

public Action OnClientCommandKeyValues(int client, KeyValues kv)
{
    char buffer[MAX_NAME_LENGTH];

    if(kv.GetSectionName(buffer, sizeof(buffer)) && StrEqual(buffer, "ClanTagChanged", false))
    {
        if(kv.GetString("tag", buffer, sizeof(buffer), "") && buffer[0] != '\0')
        {

            //PrintToServer("OnClientCommandKeyValues %s", buffer);
            
            // Option 1 - admin flag "a" or admin group override "ClanTagChanged" "allow"
            //return CheckCommandAccess(client, "ClanTagChanged", ADMFLAG_RESERVATION, true) ? Plugin_Continue:Plugin_Handled;
            
            // Option 2 - If player is added in admin cache, even without permissions (VIP ?)
            AdminId adminid = GetUserAdmin(client);
            
            return adminid == INVALID_ADMIN_ID ? Plugin_Handled:Plugin_Continue;
        }
    }
    
    return Plugin_Continue;
} 
