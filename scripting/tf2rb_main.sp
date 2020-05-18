#pragma semicolon 1

#include <sourcemod>

#define SHORTSTOP 220

public Plugin:myinfo = 
{
    name = "TF2 Rebalanced",
    author = "Just 3 Boys",
    description = "Rebalances and reworks TF2's weapons, classes, and gameplay.",
    version = "0.1",
    url = ""
};

public void OnPluginStart()
{
    PrintToServer("TF2 Rebalanced plugin loaded!");
}

public Action OnPlayerRunCmd(int client, int &buttons, int &impulse, float vel[3], float angles[3], int &weapon, int &subtype, int &cmdnum, int &tickcount, int &seed, int mouse[2])
{
    if(client >= 1 && client <= MaxClients && IsClientInGame(client))
    {
        int iActiveWep = GetEntPropEnt(client, Prop_Send, "m_hActiveWeapon");   // Get the active weapon of the player.        
        PrintToConsole(client, "Active weapon ID: \"%i\"", iActiveWep);         // TODO: Remove

        // If active weapon is valid and shortstop and player is pressing secondary fire
        if (iActiveWep > MaxClients && GetEntProp(iActiveWep, Prop_Send, "m_iItemDefinitionIndex") == SHORTSTOP && buttons & IN_ATTACK2)
        {           
            buttons ^= IN_ATTACK2;      // Remove input
        }
    }
}
