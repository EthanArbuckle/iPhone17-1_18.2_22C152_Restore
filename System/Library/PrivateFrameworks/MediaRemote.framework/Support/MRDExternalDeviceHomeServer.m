@interface MRDExternalDeviceHomeServer
- (BOOL)_shouldSendCompanionLinkMessage;
- (BOOL)sendingPlaybackStateToCompanion;
- (MRDExternalDeviceHomeServer)init;
- (MRDExternalDeviceHomeServerRecentlyPlayedEntry)lastSentEntry;
- (NSMutableArray)entries;
- (NSString)mostRecentDeviceUID;
- (NSUserDefaults)userDefaults;
- (id)decodeEntries;
- (id)encodeEntries;
- (void)_addEntry:(id)a3;
- (void)_handleLocalPlaybackBeganNotification:(id)a3;
- (void)_handleSetNearbyDevicesToRemoteControlMessage:(id)a3 fromClient:(id)a4;
- (void)_maybeMostRecentlyPlayedDeviceChanged:(id)a3;
- (void)_maybeSendPlaybackStateMessageToCompanion;
- (void)_registerCompanionLinkHandlers;
- (void)_registerNotifications;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
- (void)setEntries:(id)a3;
- (void)setLastSentEntry:(id)a3;
- (void)setSendingPlaybackStateToCompanion:(BOOL)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation MRDExternalDeviceHomeServer

- (MRDExternalDeviceHomeServer)init
{
  v8.receiver = self;
  v8.super_class = (Class)MRDExternalDeviceHomeServer;
  v2 = [(MRDExternalDeviceHomeServer *)&v8 init];
  if (v2)
  {
    v3 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mediaremote"];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = v3;

    uint64_t v5 = [(MRDExternalDeviceHomeServer *)v2 decodeEntries];
    entries = v2->_entries;
    v2->_entries = (NSMutableArray *)v5;

    [(MRDExternalDeviceHomeServer *)v2 _registerNotifications];
    [(MRDExternalDeviceHomeServer *)v2 _registerCompanionLinkHandlers];
  }
  return v2;
}

- (NSString)mostRecentDeviceUID
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NSMutableArray *)v2->_entries lastObject];
  v4 = [v3 deviceInfo];
  uint64_t v5 = [v4 deviceUID];

  objc_sync_exit(v2);

  return (NSString *)v5;
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  if (xpc_dictionary_get_uint64(xdict, "MRXPC_MESSAGE_ID_KEY") == 0x300000000000022) {
    [(MRDExternalDeviceHomeServer *)self _handleSetNearbyDevicesToRemoteControlMessage:xdict fromClient:v6];
  }
}

- (void)_registerCompanionLinkHandlers
{
  v3 = +[MRCompanionLinkClient sharedIDSCompanionLinkClient];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000830A0;
  v12[3] = &unk_100419248;
  v12[4] = self;
  id v4 = [v3 registerEvent:MRCompanionLinkClientEventPlaybackSessionChanged callback:v12];

  uint64_t v5 = +[MRCompanionLinkClient sharedIDSCompanionLinkClient];
  id v6 = [v5 registerRequest:MRCompanionLinkClientRequestNowPlayingState callback:&stru_100419288];

  v7 = +[MRCompanionLinkClient sharedIDSCompanionLinkClient];
  id v8 = [v7 registerRequest:MRCompanionLinkClientRequestPlaybackSession callback:&stru_100419348];

  v9 = +[MRCompanionLinkClient sharedCompanionLinkClient];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100083808;
  v11[3] = &unk_100419248;
  v11[4] = self;
  id v10 = [v9 registerEvent:MRCompanionLinkClientEventUpdateActiveSystemEndpoint callback:v11];
}

- (void)_registerNotifications
{
  v3 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification;
  [v3 addObserver:self selector:"_handleLocalPlaybackBeganNotification:" name:kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification object:0];

  uint64_t v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_maybeMostRecentlyPlayedDeviceChanged:" name:v4 object:0];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_maybeMostRecentlyPlayedDeviceChanged:" name:kMRMediaRemoteOriginSupportedCommandsDidChangeNotification object:0];

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"_maybeMostRecentlyPlayedDeviceChanged:" name:kMROriginNowPlayingPlaybackQueueChangedNotification object:0];

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"_maybeMostRecentlyPlayedDeviceChanged:" name:kMROriginPlaybackQueueContentItemsChangedNotification object:0];

  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"_maybeMostRecentlyPlayedDeviceChanged:" name:kMRDeviceInfoDidChangeNotification object:0];
}

- (void)_handleLocalPlaybackBeganNotification:(id)a3
{
  id v16 = a3;
  uint64_t v4 = +[MRUserSettings currentSettings];
  unsigned int v5 = [v4 notifyDevicesInHomeThatPlaybackStarted];

  id v6 = v16;
  if (v5)
  {
    v7 = [v16 userInfo];
    id v8 = MRGetOriginFromUserInfo();

    if ([v8 isLocal])
    {
      id v9 = [v16 userInfo];
      id v10 = [v9 objectForKeyedSubscript:kMRMediaRemoteNowPlayingApplicationIsPlayingUserInfoKey];
      unsigned int v11 = [v10 BOOLValue];

      if (v11)
      {
        if ([(MRDExternalDeviceHomeServer *)self _shouldSendCompanionLinkMessage])
        {
          id v12 = objc_alloc_init((Class)NSMutableDictionary);
          v13 = [v16 userInfo];
          v14 = MRGetPlayerPathFromUserInfo();
          MRAddPlayerPathToUserInfo();

          v15 = +[MRCompanionLinkClient sharedCompanionLinkClient];
          [v15 sendEventToHome:MRCompanionLinkClientEventIsPlaying userInfo:v12];
        }
      }
    }

    id v6 = v16;
  }
}

- (void)_maybeMostRecentlyPlayedDeviceChanged:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  unsigned int v5 = MRGetOriginFromUserInfo();

  if ([v5 isLocal])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100083C68;
    block[3] = &unk_100415CC8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_handleSetNearbyDevicesToRemoteControlMessage:(id)a3 fromClient:(id)a4
{
  uint64_t v4 = MRCreateStringFromXPCMessage();
  if (v4)
  {
    unsigned int v5 = (void *)MRMediaRemoteAirPlayReceiverCopyPairingIdentity();
    if (v5)
    {
      id v6 = +[MRCompanionLinkClient sharedCompanionLinkClient];
      uint64_t v7 = MRCompanionLinkClientEventUpdateActiveSystemEndpoint;
      uint64_t v9 = MRCompanionLinkClientActiveSystemEndpointUIDUserInfoKey;
      id v10 = v5;
      id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      [v6 sendEvent:v7 toDevicesOfHomeUser:v4 userInfo:v8];
    }
  }
}

- (void)_maybeSendPlaybackStateMessageToCompanion
{
  v2 = +[MRUserSettings currentSettings];
  unsigned int v3 = [v2 supportLastPlayingDevice];

  if (v3 && [(MRDExternalDeviceHomeServer *)self _shouldSendCompanionLinkMessage])
  {
    uint64_t v4 = +[MRDMediaRemoteServer server];
    unsigned int v5 = [v4 nowPlayingServer];
    v35 = [v5 localOriginClient];

    id v6 = [v35 activeNowPlayingClient];
    v37 = [v6 activePlayerClient];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = [v37 supportedRemoteControlCommands];
    id v7 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v7)
    {
      v40 = 0;
      id v8 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v42;
      uint64_t v38 = kMRMediaRemoteCommandInfoCurrentPlaybackSessionTypes;
      uint64_t v11 = kMRMediaRemoteCommandInfoSupportedPlaybackSessionTypes;
      uint64_t v12 = kMRMediaRemoteCommandInfoPlaybackSessionIdentifier;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v42 != v10) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          if (objc_msgSend(v14, "command", v35) == 133)
          {
            v15 = [v14 options];
            uint64_t v16 = [v15 objectForKeyedSubscript:v38];

            v17 = [v14 options];
            uint64_t v18 = [v17 objectForKeyedSubscript:v11];

            v19 = [v14 options];
            uint64_t v20 = [v19 objectForKeyedSubscript:v12];

            v40 = (void *)v20;
            id v8 = (void *)v18;
            uint64_t v9 = (void *)v16;
          }
        }
        id v7 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v7);
    }
    else
    {
      v40 = 0;
      id v8 = 0;
      uint64_t v9 = 0;
    }

    v21 = objc_alloc_init(MRDExternalDeviceHomeServerRecentlyPlayedEntry);
    [(MRDExternalDeviceHomeServerRecentlyPlayedEntry *)v21 setCurrentPlaybackSessionTypes:v9];
    [(MRDExternalDeviceHomeServerRecentlyPlayedEntry *)v21 setSupportedPlaybackSessionTypes:v8];
    [(MRDExternalDeviceHomeServerRecentlyPlayedEntry *)v21 setCurrentPlaybackSessionIdentifier:v40];
    -[MRDExternalDeviceHomeServerRecentlyPlayedEntry setIsPlaying:](v21, "setIsPlaying:", [v37 isPlaying]);
    v22 = [v37 snapshotForIsPlaying:1];
    v23 = [v22 date];
    [(MRDExternalDeviceHomeServerRecentlyPlayedEntry *)v21 setLastPlayingDate:v23];

    v24 = [v37 snapshotForIsPlaying:0];
    v25 = [v24 date];
    [(MRDExternalDeviceHomeServerRecentlyPlayedEntry *)v21 setLastNotPlayingDate:v25];

    v26 = [v37 nowPlayingContentItem];
    [(MRDExternalDeviceHomeServerRecentlyPlayedEntry *)v21 setContentItem:v26];

    v27 = [v37 playerPath];
    [(MRDExternalDeviceHomeServerRecentlyPlayedEntry *)v21 setPlayerPath:v27];

    v28 = [v35 deviceInfo];
    [(MRDExternalDeviceHomeServerRecentlyPlayedEntry *)v21 setDeviceInfo:v28];

    v29 = self;
    objc_sync_enter(v29);
    if (![(MRDExternalDeviceHomeServerRecentlyPlayedEntry *)v29->_lastSentEntry isEqual:v21])
    {
      id v30 = objc_alloc_init((Class)NSMutableDictionary);
      v31 = [(MRDExternalDeviceHomeServerRecentlyPlayedEntry *)v21 dictionaryRepresentation];
      [v30 addEntriesFromDictionary:v31];

      v32 = +[MRUserSettings currentSettings];
      unsigned int v33 = [v32 sendLastPlayingDeviceToHome];

      +[MRCompanionLinkClient sharedIDSCompanionLinkClient];
      if (v33) {
        v34 = {;
      }
        [v34 sendEventToHome:MRCompanionLinkClientEventPlaybackSessionChanged userInfo:v30];
      }
      else {
        v34 = {;
      }
        [v34 sendEventToCompanion:MRCompanionLinkClientEventPlaybackSessionChanged userInfo:v30];
      }

      objc_storeStrong((id *)&v29->_lastSentEntry, v21);
    }
    objc_sync_exit(v29);
  }
}

- (BOOL)_shouldSendCompanionLinkMessage
{
  return 0;
}

- (void)_addEntry:(id)a3
{
  id v27 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  v24 = v4;
  id v5 = [(NSMutableArray *)v4->_entries copy];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    uint64_t v25 = *(void *)v30;
    do
    {
      id v26 = v6;
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(obj);
        }
        v28 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v8 = [v28 deviceInfo];
        uint64_t v9 = [v8 deviceUID];
        uint64_t v10 = [v27 deviceInfo];
        uint64_t v11 = [v10 deviceUID];
        uint64_t v12 = v11;
        if (v9 == v11)
        {

LABEL_10:
          [(NSMutableArray *)v24->_entries removeObject:v28];
          continue;
        }
        v13 = [v28 deviceInfo];
        v14 = [v13 deviceUID];
        v15 = [v27 deviceInfo];
        uint64_t v16 = [v15 deviceUID];
        unsigned __int8 v17 = [v14 isEqualToString:v16];

        if (v17) {
          goto LABEL_10;
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v6);
  }

  entries = v24->_entries;
  if (!entries)
  {
    v19 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v20 = v24->_entries;
    v24->_entries = v19;

    entries = v24->_entries;
  }
  [(NSMutableArray *)entries addObject:v27];
  userDefaults = v24->_userDefaults;
  v22 = [(MRDExternalDeviceHomeServer *)v24 encodeEntries];
  [(NSUserDefaults *)userDefaults setObject:v22 forKey:@"RecentlyPlayedEntries"];

  objc_sync_exit(v24);
}

- (id)encodeEntries
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = v2->_entries;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "dictionaryRepresentation", (void)v11);
        uint64_t v9 = MRCreateEncodedUserInfo();

        [v3 addObject:v9];
      }
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v2);

  return v3;
}

- (id)decodeEntries
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v4 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"RecentlyPlayedEntries"];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000847F4;
  v7[3] = &unk_100419370;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];
  [v5 sortUsingComparator:&stru_1004193B0];

  return v5;
}

- (MRDExternalDeviceHomeServerRecentlyPlayedEntry)lastSentEntry
{
  return self->_lastSentEntry;
}

- (void)setLastSentEntry:(id)a3
{
}

- (NSMutableArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (BOOL)sendingPlaybackStateToCompanion
{
  return self->_sendingPlaybackStateToCompanion;
}

- (void)setSendingPlaybackStateToCompanion:(BOOL)a3
{
  self->_sendingPlaybackStateToCompanion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_entries, 0);

  objc_storeStrong((id *)&self->_lastSentEntry, 0);
}

@end