@interface MRDNowPlayingClient
- (BOOL)_onQueue_anyPlayerIsPlaying;
- (BOOL)anyPlayerIsPlaying;
- (BOOL)canBeNowPlaying;
- (BOOL)canBeNowPlayingForPlayerClient:(id)a3;
- (BOOL)hasNowPlayingData;
- (BOOL)isForegrounded;
- (BOOL)perPlayerCanBeNowPlaying;
- (BOOL)supportsBackgroundAudio;
- (MRClient)client;
- (MRClient)pushStateClient;
- (MRDNowPlayingClient)initWithPlayerPath:(id)a3;
- (MRDNowPlayingClientDelegate)delegate;
- (MRDNowPlayingPlayerClient)activePlayerClient;
- (MRDNowPlayingPlayerClient)nowPlayingPlayerClient;
- (MRDNowPlayingPlayerClient)pushStateActivePlayerClient;
- (MRPlayerPath)activePlayerPath;
- (MRPlayerPath)playerPath;
- (NSArray)playerClients;
- (NSDate)canBeNowPlayingTimestamp;
- (id)_onQueue_activePlayerClient;
- (id)_onQueue_addPlayer:(id)a3;
- (id)_onQueue_existingPlayerClientForPlayer:(id)a3;
- (id)_onQueue_playerClientForPlayer:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)existingPlayerClientForPlayer:(id)a3;
- (id)existingPlayerClientForPlayerPath:(id)a3;
- (id)notificationPlayerPathFromPlayer:(id)a3;
- (id)playerClientForPlayer:(id)a3;
- (void)_onQueue_initializeDisplayName;
- (void)_onQueue_popState;
- (void)_onQueue_pushState;
- (void)_onQueue_removePlayerClientForPlayer:(id)a3;
- (void)_onQueue_setActivePlayerClient:(id)a3;
- (void)_reevaluateCanBeNowPlaying;
- (void)dealloc;
- (void)handleCanBeNowPlayingPlayerDidChange:(id)a3;
- (void)initializeBundleIdentifier;
- (void)initializeDisplayName;
- (void)removePlayerClientForPlayer:(id)a3;
- (void)setActivePlayerClient:(id)a3;
- (void)setCanBeNowPlaying:(BOOL)a3;
- (void)setCanBeNowPlayingTimestamp:(id)a3;
- (void)setClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsForegrounded:(BOOL)a3;
- (void)setNowPlayingPlayerClient:(id)a3;
- (void)setPerPlayerCanBeNowPlaying:(BOOL)a3;
- (void)setPushStateActivePlayerClient:(id)a3;
- (void)setPushStateClient:(id)a3;
- (void)setSupportsBackgroundAudio:(BOOL)a3;
- (void)updateClient:(id)a3;
@end

@implementation MRDNowPlayingClient

- (MRDNowPlayingClient)initWithPlayerPath:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MRDNowPlayingClient;
  v5 = [(MRDNowPlayingClient *)&v23 init];
  if (v5)
  {
    id v6 = [v4 copy];
    v7 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.mediaremote.MRDNowPlayingClient", v8);
    v10 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v9;

    *(_WORD *)(v5 + 27) = 257;
    v11 = [*((id *)v5 + 4) origin];
    v12 = [*((id *)v5 + 4) client];
    v13 = [v12 bundleIdentifier];
    if ([v11 isLocallyHosted] && !objc_msgSend(v12, "processIdentifier"))
    {
      dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
      v21 = v5;
      id v22 = v12;
      v15 = v14;
      MRProcessIDForApplication();
      dispatch_time_t v16 = dispatch_time(0, 5000000000);
      if (!dispatch_semaphore_wait(v15, v16))
      {
        v17 = _MRLogForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v25 = v13;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingClient] Timeout trying to pid for %{public}@", buf, 0xCu);
        }
      }
    }
    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v5 selector:"handleCanBeNowPlayingPlayerDidChange:" name:kMRMediaRemoteNowPlayingPlayerDidRegisterCanBeNowPlaying object:0];

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v5 selector:"handleCanBeNowPlayingPlayerDidChange:" name:kMRMediaRemoteNowPlayingPlayerDidUnregisterCanBeNowPlaying object:0];

    [v5 initializeBundleIdentifier];
  }

  return (MRDNowPlayingClient *)v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MRDNowPlayingClient;
  [(MRDNowPlayingClient *)&v2 dealloc];
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p playerPath=\"%@\" playerClients=%@>", v4, self, self->_playerPath, self->_playerClients];

  return v5;
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  v19 = NSStringFromClass(v3);
  id v22 = [(MRDNowPlayingClient *)self playerPath];
  v24 = MRCreateIndentedDebugDescriptionFromObject();
  v21 = [(MRDNowPlayingClient *)self client];
  v18 = MRCreateIndentedDebugDescriptionFromObject();
  [(MRDNowPlayingClient *)self perPlayerCanBeNowPlaying];
  objc_super v23 = MRCreateIndentedDebugDescriptionFromObject();
  v17 = MRCreateIndentedDebugDescriptionFromObject();
  v13 = MRCreateIndentedDebugDescriptionFromObject();
  dispatch_time_t v16 = MRCreateIndentedDebugDescriptionFromObject();
  [(MRDNowPlayingClient *)self anyPlayerIsPlaying];
  v15 = MRCreateIndentedDebugDescriptionFromObject();
  [(MRDNowPlayingClient *)self hasNowPlayingData];
  id v4 = MRCreateIndentedDebugDescriptionFromObject();
  [(MRDNowPlayingClient *)self isForegrounded];
  v12 = MRCreateIndentedDebugDescriptionFromObject();
  [(MRDNowPlayingClient *)self supportsBackgroundAudio];
  v11 = MRCreateIndentedDebugDescriptionFromObject();
  dispatch_semaphore_t v14 = [(MRDNowPlayingClient *)self activePlayerClient];
  v5 = [v14 playerPath];
  id v6 = MRCreateIndentedDebugDescriptionFromObject();
  playerClients = self->_playerClients;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001035E8;
  v25[3] = &unk_10041CCC0;
  v25[4] = self;
  v8 = [(NSMutableArray *)playerClients sortedArrayUsingComparator:v25];
  dispatch_queue_t v9 = MRCreateIndentedDebugDescriptionFromObject();
  v20 = +[NSString stringWithFormat:@"%@ %p {\n    player path = %@\n    client = %@\n    perPlayerCanBeNowPlaying = %@\n    canBeNowPlaying = %@\n    canBeNowPlayingTimestamp = %@\n    effectiveCanBeNowPlaying = %@\n    any player is playing = %@\n    has now playing data = %@\n    foregrounded = %@\n    supportsBackgroundAudio = %@\n    active player client = %@\n    player clients = %@\n}", v19, self, v24, v18, v23, v17, v13, v16, v15, v4, v12, v11, v6, v9];

  return v20;
}

- (NSArray)playerClients
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = sub_1001037D0;
  v8 = sub_1001037E0;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

- (void)initializeBundleIdentifier
{
  v3 = [(MRPlayerPath *)self->_playerPath client];
  id v4 = [v3 processIdentifier];

  v5 = [(MRPlayerPath *)self->_playerPath origin];
  unsigned int v6 = [v5 isLocallyHosted];

  if (v6)
  {
    v7 = sub_10016A160((uint64_t)v4);
    v8 = [(MRPlayerPath *)self->_playerPath client];
    [v8 setBundleIdentifier:v7];

    id v9 = sub_10016A57C((int)v4);
    v10 = [(MRPlayerPath *)self->_playerPath client];
    [v10 setProcessUserIdentifier:v9];
  }
  v11 = [(MRPlayerPath *)self->_playerPath client];
  v12 = [v11 parentApplicationBundleIdentifier];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    v15 = [(MRPlayerPath *)self->_playerPath client];
    id v14 = [v15 bundleIdentifier];
  }
  dispatch_time_t v16 = _MRLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    playerPath = self->_playerPath;
    int v19 = 138543874;
    v20 = playerPath;
    __int16 v21 = 2114;
    CFStringRef v22 = @"effectiveBundleIdentifier";
    __int16 v23 = 2112;
    id v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ to <%@>", (uint8_t *)&v19, 0x20u);
  }

  v18 = [(MRPlayerPath *)self->_playerPath origin];
  [v18 isLocallyHosted];
}

- (void)_onQueue_initializeDisplayName
{
  v3 = [(MRPlayerPath *)self->_playerPath client];
  id v4 = [v3 displayName];
  if (v4)
  {
  }
  else
  {
    v5 = [(MRPlayerPath *)self->_playerPath origin];
    unsigned int v6 = [v5 isLocallyHosted];

    if (v6)
    {
      uint64_t v7 = [v3 parentApplicationBundleIdentifier];
      v8 = (void *)v7;
      if (!v7 || (sub_10016A3F4(v7), (id v9 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v10 = [v3 bundleIdentifier];
        id v9 = sub_10016A3F4((uint64_t)v10);
      }
      v11 = _MRLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        playerPath = self->_playerPath;
        int v13 = 138543874;
        id v14 = playerPath;
        __int16 v15 = 2114;
        CFStringRef v16 = @"displayName";
        __int16 v17 = 2112;
        v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ to <%@>", (uint8_t *)&v13, 0x20u);
      }

      [v3 setDisplayName:v9];
    }
  }
}

- (void)initializeDisplayName
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100103C08;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (MRPlayerPath)playerPath
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = sub_1001037D0;
  v8 = sub_1001037E0;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRPlayerPath *)v2;
}

- (MRPlayerPath)activePlayerPath
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = sub_1001037D0;
  v8 = sub_1001037E0;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRPlayerPath *)v2;
}

- (void)setClient:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)updateClient:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (MRClient)client
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = sub_1001037D0;
  v8 = sub_1001037E0;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRClient *)v2;
}

- (void)setActivePlayerClient:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)_onQueue_setActivePlayerClient:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  [(MRDNowPlayingClient *)self _onQueue_pushState];
  v5 = [(MRDNowPlayingPlayerClient *)self->_nowPlayingPlayerClient playerPath];

  uint64_t v6 = _MRLogForCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      playerPath = self->_playerPath;
      id v9 = [(MRDNowPlayingPlayerClient *)self->_nowPlayingPlayerClient playerPath];
      v10 = [v4 playerPath];
      int v12 = 138544130;
      int v13 = playerPath;
      __int16 v14 = 2114;
      CFStringRef v15 = @"activePlayerClient";
      __int16 v16 = 2112;
      __int16 v17 = v9;
      __int16 v18 = 2112;
      int v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ from <%@> to <%@>", (uint8_t *)&v12, 0x2Au);

LABEL_6:
    }
  }
  else if (v7)
  {
    v11 = self->_playerPath;
    id v9 = [v4 playerPath];
    int v12 = 138543874;
    int v13 = v11;
    __int16 v14 = 2114;
    CFStringRef v15 = @"activePlayerClient";
    __int16 v16 = 2112;
    __int16 v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ to <%@>", (uint8_t *)&v12, 0x20u);
    goto LABEL_6;
  }

  [(MRDNowPlayingClient *)self setNowPlayingPlayerClient:v4];
  [(MRDNowPlayingClient *)self _onQueue_popState];
}

- (MRDNowPlayingPlayerClient)activePlayerClient
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  BOOL v7 = sub_1001037D0;
  v8 = sub_1001037E0;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRDNowPlayingPlayerClient *)v2;
}

- (id)_onQueue_activePlayerClient
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  nowPlayingPlayerClient = self->_nowPlayingPlayerClient;

  return nowPlayingPlayerClient;
}

- (void)_reevaluateCanBeNowPlaying
{
}

- (void)setPerPlayerCanBeNowPlaying:(BOOL)a3
{
}

- (void)setCanBeNowPlaying:(BOOL)a3
{
}

- (BOOL)canBeNowPlaying
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  msv_dispatch_sync_on_queue();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (NSDate)canBeNowPlayingTimestamp
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  char v7 = sub_1001037D0;
  v8 = sub_1001037E0;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSDate *)v2;
}

- (BOOL)anyPlayerIsPlaying
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  msv_dispatch_sync_on_queue();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (BOOL)_onQueue_anyPlayerIsPlaying
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = self->_playerClients;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "isPlaying", (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (BOOL)canBeNowPlayingForPlayerClient:(id)a3
{
  id v4 = a3;
  if ([(MRDNowPlayingClient *)self perPlayerCanBeNowPlaying]
    || ![(MRDNowPlayingClient *)self canBeNowPlaying])
  {
    unsigned __int8 v5 = [v4 canBeNowPlayingPlayer];
  }
  else
  {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (void)setIsForegrounded:(BOOL)a3
{
}

- (id)playerClientForPlayer:(id)a3
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = sub_1001037D0;
  long long v10 = sub_1001037E0;
  id v11 = 0;
  id v5 = a3;
  msv_dispatch_sync_on_queue();
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_onQueue_playerClientForPlayer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v4
    || (+[MRPlayer defaultPlayer],
        (id v4 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v5 = [(MRDNowPlayingClient *)self _onQueue_existingPlayerClientForPlayer:v4];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
    }
    else
    {
      id v7 = objc_alloc((Class)MRPlayerPath);
      uint64_t v8 = [(MRPlayerPath *)self->_playerPath origin];
      long long v9 = [(MRPlayerPath *)self->_playerPath client];
      id v10 = [v7 initWithOrigin:v8 client:v9 player:v4];

      uint64_t v6 = [(MRDNowPlayingClient *)self _onQueue_addPlayer:v10];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_onQueue_addPlayer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v5 = [(MRPlayerPath *)self->_playerPath client];
  [v4 setClient:v5];

  uint64_t v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingClient] Creating playerClient for %{public}@", (uint8_t *)&v15, 0xCu);
  }

  id v7 = [[MRDNowPlayingPlayerClient alloc] initWithPlayerPath:v4];
  uint64_t v8 = +[MRDMediaRemoteServer server];
  long long v9 = [v8 nowPlayingServer];
  [(MRDNowPlayingPlayerClient *)v7 setDelegate:v9];

  playerClients = self->_playerClients;
  if (!playerClients)
  {
    id v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    int v12 = self->_playerClients;
    self->_playerClients = v11;

    playerClients = self->_playerClients;
  }
  [(NSMutableArray *)playerClients addObject:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained nowPlayingClient:self playerDidRegister:v7];

  if ([(NSMutableArray *)self->_playerClients count] == (id)1) {
    [(MRDNowPlayingClient *)self _onQueue_setActivePlayerClient:v7];
  }

  return v7;
}

- (id)existingPlayerClientForPlayerPath:(id)a3
{
  id v4 = [a3 player];
  uint64_t v5 = [(MRDNowPlayingClient *)self existingPlayerClientForPlayer:v4];

  return v5;
}

- (id)existingPlayerClientForPlayer:(id)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = sub_1001037D0;
  id v10 = sub_1001037E0;
  id v11 = 0;
  id v5 = a3;
  msv_dispatch_sync_on_queue();
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_onQueue_existingPlayerClientForPlayer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_playerClients;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "player", (void)v12);
        if ([v10 isEqual:v4])
        {
          id v6 = v9;

          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)removePlayerClientForPlayer:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)_onQueue_removePlayerClientForPlayer:(id)a3
{
  serialQueue = self->_serialQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)serialQueue);
  id v7 = [(MRDNowPlayingClient *)self _onQueue_existingPlayerClientForPlayer:v5];

  if (v7)
  {
    [(MRDNowPlayingClient *)self _onQueue_pushState];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained nowPlayingClient:self playerDidUnregister:v7];

    [(NSMutableArray *)self->_playerClients removeObject:v7];
    [(MRDNowPlayingClient *)self _onQueue_popState];
  }
}

- (BOOL)hasNowPlayingData
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  msv_dispatch_sync_on_queue();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (id)notificationPlayerPathFromPlayer:(id)a3
{
  id v4 = [a3 playerPath];
  id v5 = [(MRPlayerPath *)self->_playerPath client];
  [v4 setClient:v5];

  if (!v4) {
    id v4 = [(MRPlayerPath *)self->_playerPath copy];
  }

  return v4;
}

- (void)_onQueue_pushState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = [(MRPlayerPath *)self->_playerPath client];
  id v4 = [v3 copy];
  [(MRDNowPlayingClient *)self setPushStateClient:v4];

  id v5 = [(MRDNowPlayingClient *)self _onQueue_activePlayerClient];
  [(MRDNowPlayingClient *)self setPushStateActivePlayerClient:v5];
}

- (void)_onQueue_popState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = [(MRDNowPlayingClient *)self _onQueue_activePlayerClient];
  if (self->_pushStateActivePlayerClient != v3)
  {
    id v4 = _MRLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(MRDNowPlayingPlayerClient *)self->_pushStateActivePlayerClient playerPath];
      uint64_t v6 = [v5 player];
      char v7 = [v6 identifier];
      uint64_t v8 = [(MRDNowPlayingPlayerClient *)v3 playerPath];
      long long v9 = [v8 player];
      id v10 = [v9 identifier];
      playerPath = self->_playerPath;
      *(_DWORD *)buf = 138543874;
      uint64_t v71 = (uint64_t)v7;
      __int16 v72 = 2114;
      v73 = v10;
      __int16 v74 = 2114;
      v75 = playerPath;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingClient] ActiveNowPlayingPlayer changed from %{public}@ to %{public}@ for %{public}@", buf, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained nowPlayingClient:self activePlayerDidChangeFromPlayerClient:self->_pushStateActivePlayerClient toPlayerClient:v3];
  }
  long long v13 = [(MRPlayerPath *)self->_playerPath client];
  long long v14 = [v13 displayName];
  uint64_t v15 = [(MRClient *)self->_pushStateClient displayName];
  v64 = v3;
  v62 = (void *)v15;
  if (v14 && (uint64_t v16 = v15, ([v14 isEqualToString:v15] & 1) == 0))
  {
    __int16 v18 = _MRLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = self->_playerPath;
      *(_DWORD *)buf = 138543874;
      uint64_t v71 = v16;
      __int16 v72 = 2114;
      v73 = v14;
      __int16 v74 = 2114;
      v75 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingClient] DisplayName changed from %{public}@ to %{public}@ for %{public}@", buf, 0x20u);
    }

    [(MRDNowPlayingClient *)self _onQueue_initializeDisplayName];
    int v17 = 1;
  }
  else
  {
    int v17 = 0;
  }
  v20 = [v13 parentApplicationBundleIdentifier];
  uint64_t v21 = [(MRClient *)self->_pushStateClient parentApplicationBundleIdentifier];
  if (v20 && ([v20 isEqualToString:v21] & 1) == 0)
  {
    CFStringRef v22 = _MRLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v23 = self->_playerPath;
      *(_DWORD *)buf = 138543874;
      uint64_t v71 = v21;
      __int16 v72 = 2114;
      v73 = v20;
      __int16 v74 = 2114;
      v75 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingClient] ParentAppBundleIdentifier changed from %{public}@ to %{public}@ for %{public}@", buf, 0x20u);
    }

    [(MRDNowPlayingClient *)self initializeBundleIdentifier];
    [(MRDNowPlayingClient *)self _onQueue_initializeDisplayName];
    int v17 = 1;
  }
  v61 = (void *)v21;
  id v24 = (void *)MRNowPlayingClientCopyBundleIdentifierExtendedHierarchy();
  v25 = v24;
  v63 = v14;
  if (v24 && [v24 count])
  {
    v26 = (void *)MRNowPlayingClientCopyBundleIdentifierExtendedHierarchy();
    unsigned int v27 = [v25 isEqualToArray:v26];
    if ((v27 & 1) == 0)
    {
      v28 = _MRLogForCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = self->_playerPath;
        *(_DWORD *)buf = 138543874;
        uint64_t v71 = (uint64_t)v26;
        __int16 v72 = 2114;
        v73 = v25;
        __int16 v74 = 2114;
        v75 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingClient] BundleIdentifierHierarchy changed from %{public}@ to %{public}@ for %{public}@", buf, 0x20u);
      }

      int v17 = 1;
    }
    int v60 = v27 ^ 1;
  }
  else
  {
    int v60 = 0;
  }
  id v30 = [v13 visibility];
  if (v30 && [(MRClient *)self->_pushStateClient visibility] != v30)
  {
    v31 = NSStringFromMRClientVisibility();
    v32 = NSStringFromMRClientVisibility();
    v33 = _MRLogForCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = self->_playerPath;
      *(_DWORD *)buf = 138543874;
      uint64_t v71 = (uint64_t)v31;
      __int16 v72 = 2114;
      v73 = v32;
      __int16 v74 = 2114;
      v75 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingClient] Visibility changed from %{public}@ to %{public}@ for %{public}@", buf, 0x20u);
    }

    int v17 = 1;
  }
  v35 = [v13 tintColor];
  if (v35)
  {
    v36 = [(MRClient *)self->_pushStateClient tintColor];
    if (([v36 isEqual:v35] & 1) == 0)
    {
      v37 = [v36 description];
      v38 = [v35 description];
      v39 = _MRLogForCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = self->_playerPath;
        *(_DWORD *)buf = 138543874;
        uint64_t v71 = (uint64_t)v37;
        __int16 v72 = 2114;
        v73 = v38;
        __int16 v74 = 2114;
        v75 = v40;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingClient] TintColor changed from %{public}@ to %{public}@ for %{public}@", buf, 0x20u);
      }

      int v17 = 1;
    }
  }
  id v41 = [v13 appIcon];
  id v42 = [(MRClient *)self->_pushStateClient appIcon];
  if (v41 == v42)
  {

LABEL_41:
    if (!v17) {
      goto LABEL_51;
    }
    goto LABEL_42;
  }
  v43 = v42;
  unsigned __int8 v44 = [v41 isEqual:v42];

  if (v44) {
    goto LABEL_41;
  }
  v45 = _MRLogForCategory();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v46 = [(MRClient *)self->_pushStateClient appIcon];
    v47 = [v46 absoluteString];
    v48 = [v13 appIcon];
    v49 = [v48 absoluteString];
    v50 = self->_playerPath;
    *(_DWORD *)buf = 138543874;
    uint64_t v71 = (uint64_t)v47;
    __int16 v72 = 2114;
    v73 = v49;
    __int16 v74 = 2114;
    v75 = v50;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingClient] AppIcon changed from %{public}@ to %{public}@ for %{public}@", buf, 0x20u);
  }
LABEL_42:
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v51 = self->_playerClients;
  id v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v52)
  {
    id v53 = v52;
    uint64_t v54 = *(void *)v66;
    do
    {
      v55 = 0;
      do
      {
        if (*(void *)v66 != v54) {
          objc_enumerationMutation(v51);
        }
        [*(id *)(*((void *)&v65 + 1) + 8 * (void)v55) updateClient:v13];
        v55 = (char *)v55 + 1;
      }
      while (v53 != v55);
      id v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v65 objects:v69 count:16];
    }
    while (v53);
  }

  id v56 = objc_loadWeakRetained((id *)&self->_delegate);
  id v57 = [v13 copy];
  [v56 nowPlayingClient:self clientStateDidChange:v57];

  if (v60)
  {
    id v58 = objc_loadWeakRetained((id *)&self->_delegate);
    [v58 nowPlayingClient:self activePlayerDidChangeFromPlayerClient:v64 toPlayerClient:v64];
  }
LABEL_51:
  pushStateClient = self->_pushStateClient;
  self->_pushStateClient = 0;

  [(MRDNowPlayingClient *)self setPushStateActivePlayerClient:0];
}

- (void)handleCanBeNowPlayingPlayerDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  MRGetPlayerPathFromUserInfo();
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [v12 origin];
  uint64_t v6 = [(MRDNowPlayingClient *)self playerPath];
  char v7 = [v6 origin];
  if ([v5 isEqual:v7])
  {
    uint64_t v8 = [v12 client];
    long long v9 = [(MRDNowPlayingClient *)self playerPath];
    id v10 = [v9 client];
    unsigned int v11 = [v8 isEqual:v10];

    if (v11) {
      [(MRDNowPlayingClient *)self _reevaluateCanBeNowPlaying];
    }
  }
  else
  {
  }
}

- (BOOL)perPlayerCanBeNowPlaying
{
  return self->_perPlayerCanBeNowPlaying;
}

- (void)setCanBeNowPlayingTimestamp:(id)a3
{
}

- (BOOL)isForegrounded
{
  return self->_isForegrounded;
}

- (BOOL)supportsBackgroundAudio
{
  return self->_supportsBackgroundAudio;
}

- (void)setSupportsBackgroundAudio:(BOOL)a3
{
  self->_supportsBackgroundAudio = a3;
}

- (MRDNowPlayingClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDNowPlayingClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRDNowPlayingPlayerClient)nowPlayingPlayerClient
{
  return self->_nowPlayingPlayerClient;
}

- (void)setNowPlayingPlayerClient:(id)a3
{
}

- (MRDNowPlayingPlayerClient)pushStateActivePlayerClient
{
  return self->_pushStateActivePlayerClient;
}

- (void)setPushStateActivePlayerClient:(id)a3
{
}

- (MRClient)pushStateClient
{
  return self->_pushStateClient;
}

- (void)setPushStateClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushStateClient, 0);
  objc_storeStrong((id *)&self->_pushStateActivePlayerClient, 0);
  objc_storeStrong((id *)&self->_nowPlayingPlayerClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_canBeNowPlayingTimestamp, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_playerClients, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end