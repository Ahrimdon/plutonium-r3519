main()
{
	// always allow team change
	replaceFunc( maps\mp\gametypes\_serversettings::init, ::serverSettings );

	// never forfeit
	replaceFunc( maps\mp\gametypes\_globallogic::updateGameEvents, ::updateGameEvents );
}

serverSettings()
{
	level.hostname = GetDvar( "sv_hostname" );
	if ( level.hostname == "" )
	{
		level.hostname = "CoDHost";
	}
	SetDvar( "sv_hostname", level.hostname );
	SetDvar( "ui_hostname", level.hostname );
	MakeDvarServerInfo( "ui_hostname", "CoDHost" );
	
	level.motd = GetDvar( "scr_motd" );
	if ( level.motd == "" )
	{
		level.motd = "";
	}
	SetDvar( "scr_motd", level.motd );
	SetDvar( "ui_motd", level.motd );
	MakeDvarServerInfo( "ui_motd", "" );
	
	level.allowvote = GetDvar( "g_allowVote" );
	if ( level.allowvote == "" )
	{
		level.allowvote = "1";
	}
	SetDvar( "g_allowvote", level.allowvote );
	SetDvar( "ui_allowvote", level.allowvote );
	MakeDvarServerInfo( "ui_allowvote", "1" );
	
	level.allow_teamchange = "1";
	SetDvar( "ui_allow_teamchange", level.allow_teamchange );
	
	level.friendlyfire = getgametypesetting( "friendlyfiretype" );
	SetDvar( "ui_friendlyfire", level.friendlyfire );
	MakeDvarServerInfo( "ui_friendlyfire", "0" );
	
	if ( GetDvar( "scr_mapsize" ) == "" )
	{
		SetDvar( "scr_mapsize", "64" );
	}
	else if ( GetDvarFloat( "scr_mapsize" ) >= 64 )
	{
		SetDvar( "scr_mapsize", "64" );
	}
	else if ( GetDvarFloat( "scr_mapsize" ) >= 32 )
	{
		SetDvar( "scr_mapsize", "32" );
	}
	else if ( GetDvarFloat( "scr_mapsize" ) >= 16 )
	{
		SetDvar( "scr_mapsize", "16" );
	}
	else
	{
		SetDvar( "scr_mapsize", "8" );
	}
	
	level.mapsize = GetDvarFloat( "scr_mapsize" );
	maps\mp\gametypes\_serversettings::constraingametype( GetDvar( "g_gametype" ) );
	maps\mp\gametypes\_serversettings::constrainmapsize( level.mapsize );
	
	for (;;)
	{
		maps\mp\gametypes\_serversettings::updateserversettings();
		wait 5;
	}
}

updateGameEvents()
{
	if ( !level.playerQueuedRespawn && !level.numLives && !level.inOverTime )
		return;
		
	if ( level.inGracePeriod )
		return;

	if ( level.playerQueuedRespawn )
	{
		maps\mp\gametypes\_globallogic::doSpawnQueueUpdates();
	}
	
	if ( maps\mp\gametypes\_globallogic::doDeadEventUpdates() )
		return;
		
	if ( maps\mp\gametypes\_globallogic::doOneLeftEventUpdates() )
		return;
}