#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "Zedruc"
#define PLUGIN_VERSION "1.00"

#define BOT_ID "STEAM_ID_STOP_IGNORING_RETVALS"

#include <sourcemod>
#include <sdktools>

#pragma newdecls required

public Plugin myinfo = 
{
	name = "NoSteamIDAutoBan", // NSIDAB
	author = PLUGIN_AUTHOR,
	description = "Auto bans every player joining without a Steam ID. (Steam exploit)",
	version = PLUGIN_VERSION,
	url = "https://www.github.com/Zedruc/NSIDAB"
};

public void OnPluginStart()
{
}

public void OnClientPutInServer(int client) {
	char authid[64];
	char name[32];
	GetClientName(client, name, 31);
	GetClientAuthId(client, AuthId_SteamID64, authid, 63);
	PrintToChatAll("SteamID of %s is %s", name, authid);
	if(StrEqual(authid, BOT_ID)) {
		PrintToChatAll("%s has been flagged and kicked", authid);
		KickClient(client);
	}
}