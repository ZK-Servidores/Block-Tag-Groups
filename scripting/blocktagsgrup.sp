#include <sourcemod>

public Plugin myinfo =
{
	name 		= 	"[ ZK Servidores™ ] - Block Tag Groups Steam",
	author 		= 	"Geison, crashzk",
	description	=	"Block bind to switch Steam Group",
	version 	= 	"1.0",
	url 		= 	"https://github.com/zkservidores-clientes"
}

public Action OnClientCommandKeyValues(int client, KeyValues kv) 
{ 
    char sCmd[64]; 
     
    if (kv.GetSectionName(sCmd, sizeof(sCmd)) && StrEqual(sCmd, "ClanTagChanged", false)) 
    { 
	   return Plugin_Handled; 
    } 
     
    return Plugin_Continue; 
}
