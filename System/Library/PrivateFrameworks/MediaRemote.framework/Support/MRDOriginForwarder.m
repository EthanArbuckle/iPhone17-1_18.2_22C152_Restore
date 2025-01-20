@interface MRDOriginForwarder
+ (id)localizedPlayerIDFromPlayerPath:(id)a3;
+ (void)waitUntilForwardingOperationsHaveFinished:(id)a3;
- (MRClient)destinationClient;
- (MRDOriginForwarder)initWithOrigin:(id)a3 destinationOrigin:(id)a4;
- (MROrigin)destinationOrigin;
- (MROrigin)sourceOrigin;
- (id)createDelocalizedPlayerPath:(id)a3;
- (id)createLocalizedPlayerPath:(id)a3;
- (id)debugDescription;
- (void)_handleActiveApplicationDidChangeNotification:(id)a3;
- (void)_handleActivePlayerDidChangeNotification:(id)a3;
- (void)_handleApplicationClientStateDidChangeNotification:(id)a3;
- (void)_handleApplicationDidRegisterNotification:(id)a3;
- (void)_handleApplicationDidUnregisterNotification:(id)a3;
- (void)_handleParticipantsDidChangeNotification:(id)a3;
- (void)_handlePlaybackStateDidChangeNotification:(id)a3;
- (void)_handlePlayerDidRegisterCanBeNowPlayingNotification:(id)a3;
- (void)_handlePlayerDidRegisterNotification:(id)a3;
- (void)_handlePlayerDidUnregisterCanBeNowPlayingNotification:(id)a3;
- (void)_handlePlayerDidUnregisterNotification:(id)a3;
- (void)_handlePlayerPlaybackQueueCapabilitiesDidChangeNotification:(id)a3;
- (void)_handlePlayerPlaybackQueueContentItemArtworkDidChangeNotification:(id)a3;
- (void)_handlePlayerPlaybackQueueContentItemsDidChangeNotification:(id)a3;
- (void)_handlePlayerPlaybackQueueDidChangeNotification:(id)a3;
- (void)_handlePlayerStateDidChangeNotification:(id)a3;
- (void)_handleSupportedCommandsDidChangeNotification:(id)a3;
- (void)_handleVolumeCapabilitiesDidChangeNotification:(id)a3;
- (void)cleanupForwarding;
- (void)dealloc;
- (void)forwardParticipantDataSourceIfNeeded;
- (void)initializeDestinationOriginWithSourceOriginData;
- (void)registerDestinationOriginCallbacksToRelayToSourceOrigin;
- (void)registerSourceOriginNotifications;
@end

@implementation MRDOriginForwarder

- (MRDOriginForwarder)initWithOrigin:(id)a3 destinationOrigin:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MRDOriginForwarder;
  v9 = [(MRDOriginForwarder *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceOrigin, a3);
    objc_storeStrong((id *)&v10->_destinationOrigin, a4);
    uint64_t v11 = +[MRClient localClient];
    destinationClient = v10->_destinationClient;
    v10->_destinationClient = (MRClient *)v11;

    [(MRDOriginForwarder *)v10 registerSourceOriginNotifications];
    [(MRDOriginForwarder *)v10 registerDestinationOriginCallbacksToRelayToSourceOrigin];
    [(MRDOriginForwarder *)v10 initializeDestinationOriginWithSourceOriginData];
    v13 = +[MRDMediaRemoteServer server];
    v14 = [v13 nowPlayingServer];
    [v14 registerOriginForwarder:v10];
  }
  return v10;
}

- (void)dealloc
{
  [(MRDOriginForwarder *)self cleanupForwarding];
  v3 = +[MRDMediaRemoteServer server];
  v4 = [v3 nowPlayingServer];
  [v4 unregisterOriginForwarder:self];

  v5.receiver = self;
  v5.super_class = (Class)MRDOriginForwarder;
  [(MRDOriginForwarder *)&v5 dealloc];
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class();
  v4 = [(MRDOriginForwarder *)self sourceOrigin];
  objc_super v5 = [(MRDOriginForwarder *)self destinationOrigin];
  v6 = +[NSString stringWithFormat:@"<%@, %p: sourceOrigin: %@ - destinationOrigin: %@>", v3, self, v4, v5];

  return v6;
}

- (void)registerSourceOriginNotifications
{
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_handleVolumeCapabilitiesDidChangeNotification:" name:kMRAVEndpointVolumeControlCapabilitiesDidChangeNotification object:0];
  [v5 addObserver:self selector:"_handleApplicationDidRegisterNotification:" name:kMRMediaRemoteNowPlayingApplicationDidRegister object:0];
  [v5 addObserver:self selector:"_handleApplicationDidUnregisterNotification:" name:kMRMediaRemoteNowPlayingApplicationDidUnregister object:0];
  [v5 addObserver:self selector:"_handleApplicationClientStateDidChangeNotification:" name:kMRMediaRemoteApplicationClientStateDidChange object:0];
  uint64_t v3 = +[MRUserSettings currentSettings];
  unsigned __int8 v4 = [v3 computeNowPlayingApplication];

  if ((v4 & 1) == 0) {
    [v5 addObserver:self selector:"_handleActiveApplicationDidChangeNotification:" name:kMRMediaRemoteOriginNowPlayingApplicationDidChangeNotification object:0];
  }
  [v5 addObserver:self selector:"_handlePlayerDidRegisterNotification:" name:kMRMediaRemoteNowPlayingPlayerDidRegister object:0];
  [v5 addObserver:self selector:"_handlePlayerDidUnregisterNotification:" name:kMRMediaRemoteNowPlayingPlayerDidUnregister object:0];
  [v5 addObserver:self selector:"_handlePlayerDidRegisterCanBeNowPlayingNotification:" name:kMRMediaRemoteNowPlayingPlayerDidRegisterCanBeNowPlaying object:0];
  [v5 addObserver:self selector:"_handlePlayerDidUnregisterCanBeNowPlayingNotification:" name:kMRMediaRemoteNowPlayingPlayerDidUnregisterCanBeNowPlaying object:0];
  [v5 addObserver:self selector:"_handlePlayerStateDidChangeNotification:" name:kMRMediaRemotePlayerStateDidChange object:0];
  [v5 addObserver:self selector:"_handleActivePlayerDidChangeNotification:" name:kMRMediaRemoteActivePlayerDidChange object:0];
  [v5 addObserver:self selector:"_handlePlaybackStateDidChangeNotification:" name:kMRMediaRemotePlayerPlaybackStateDidChangeNotification object:0];
  [v5 addObserver:self selector:"_handleSupportedCommandsDidChangeNotification:" name:kMRMediaRemotePlayerSupportedCommandsDidChangeNotification object:0];
  [v5 addObserver:self selector:"_handlePlayerPlaybackQueueCapabilitiesDidChangeNotification:" name:kMRPlaybackQueueCapabilitiesChangedNotification object:0];
  [v5 addObserver:self selector:"_handlePlayerPlaybackQueueDidChangeNotification:" name:kMRPlayerPlaybackQueueChangedNotification object:0];
  [v5 addObserver:self selector:"_handlePlayerPlaybackQueueContentItemsDidChangeNotification:" name:kMRPlayerPlaybackQueueContentItemsChangedNotification object:0];
  [v5 addObserver:self selector:"_handlePlayerPlaybackQueueContentItemArtworkDidChangeNotification:" name:kMRPlayerPlaybackQueueContentItemArtworkChangedNotification object:0];
  [v5 addObserver:self selector:"_handleParticipantsDidChangeNotification:" name:MRPlaybackQueueParticipantsDidChangeForPlayerNotification object:0];
}

- (void)registerDestinationOriginCallbacksToRelayToSourceOrigin
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(MRDOriginForwarder *)self destinationOrigin];
  v16[1] = _NSConcreteStackBlock;
  v16[2] = (id)3221225472;
  v16[3] = sub_100053DE4;
  v16[4] = &unk_100417BD0;
  objc_copyWeak(&v17, &location);
  MRMediaRemoteSetCommandHandlerCallbackForOrigin();

  unsigned __int8 v4 = [(MRDOriginForwarder *)self destinationOrigin];
  v15[1] = _NSConcreteStackBlock;
  v15[2] = (id)3221225472;
  v15[3] = sub_100054068;
  v15[4] = &unk_100417C20;
  objc_copyWeak(v16, &location);
  MRMediaRemotePlaybackQueueDataSourceSetRequestCallback();

  id v5 = [(MRDOriginForwarder *)self destinationOrigin];
  v14[1] = _NSConcreteStackBlock;
  v14[2] = (id)3221225472;
  v14[3] = sub_100054238;
  v14[4] = &unk_100417C20;
  objc_copyWeak(v15, &location);
  MRMediaRemotePlaybackSessionSetRequestCallbackForOrigin();

  v6 = +[MRNowPlayingOriginClientManager sharedManager];
  id v7 = [(MRDOriginForwarder *)self destinationOrigin];
  id v8 = [v6 originClientForOrigin:v7];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100054408;
  v13[3] = &unk_100417C70;
  objc_copyWeak(v14, &location);
  [v8 setPlaybackSessionMigrateRequestCallback:v13];
  v9 = [(MRDOriginForwarder *)self destinationOrigin];
  v11[1] = _NSConcreteStackBlock;
  v11[2] = (id)3221225472;
  v11[3] = sub_100054608;
  v11[4] = &unk_100417C98;
  objc_copyWeak(&v12, &location);
  MRMediaRemotePlaybackSessionSetMigrateBeginCallbackForOrigin();

  v10 = [(MRDOriginForwarder *)self destinationOrigin];
  objc_copyWeak(v11, &location);
  MRMediaRemotePlaybackSessionSetMigrateEndCallbackForOrigin();

  objc_destroyWeak(v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(v14);

  objc_destroyWeak(v15);
  objc_destroyWeak(v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)initializeDestinationOriginWithSourceOriginData
{
  uint64_t v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v63 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] %@ Initializing OriginForwarder", buf, 0xCu);
  }

  unsigned __int8 v4 = +[MRDMediaRemoteServer server];
  id v5 = [v4 nowPlayingServer];
  v6 = [(MRDOriginForwarder *)self sourceOrigin];
  id v7 = [v5 originClientForOrigin:v6];

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = [v7 nowPlayingClients];
  id v49 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v49)
  {
    uint64_t v47 = *(void *)v57;
    v48 = v7;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v57 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v51 = v8;
        v9 = *(void **)(*((void *)&v56 + 1) + 8 * v8);
        v10 = [v9 client];
        uint64_t v11 = [v9 client];
        id v12 = [(MRDOriginForwarder *)self destinationOrigin];
        MRMediaRemoteSyncClientProperties();

        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        v50 = v9;
        v13 = [v9 playerClients];
        id v14 = [v13 countByEnumeratingWithState:&v52 objects:v60 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v53;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v53 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v52 + 1) + 8 * i);
              v19 = [v18 playerPath];
              v20 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v19];
              v21 = [v20 player];
              unsigned int v22 = [v21 hasAuxiliaryProperties];

              if (v22) {
                MRMediaRemoteSetPlayerProperties();
              }
              if ([v18 playbackState])
              {
                [v18 playbackState];
                MRMediaRemoteSetPlaybackStateForPlayer();
              }
              v23 = [v18 supportedRemoteControlCommands];
              if (v23) {
                MRMediaRemoteSetSupportedCommandsForPlayer();
              }
              v24 = [v18 playbackQueue];
              if (v24) {
                MRMediaRemotePlaybackQueueDataSourceInvalidateWithPlaybackQueueForPlayer();
              }
              if ([v18 playbackQueueCapabilities]) {
                MRMediaRemoteSetPlaybackQueueCapabilities();
              }
              if ([v18 canBeNowPlayingPlayer]) {
                MRMediaRemoteSetCanBeNowPlayingForPlayer();
              }
            }
            id v15 = [v13 countByEnumeratingWithState:&v52 objects:v60 count:16];
          }
          while (v15);
        }

        v25 = [v50 activePlayerClient];
        v26 = [v25 playerPath];
        v27 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v26];

        v28 = [v50 client];
        v29 = [v28 bundleIdentifier];
        id v7 = v48;
        v30 = [v48 defaultSupportedCommandsForClient:v29];

        if (v30)
        {
          v31 = [v27 client];
          v32 = [(MRDOriginForwarder *)self destinationOrigin];
          MRMediaRemoteSetDefaultSupportedCommandsForClient();
        }
        v33 = [v27 client];
        unsigned int v34 = [v33 hasAuxiliaryProperties];

        if (v34)
        {
          v35 = [v27 client];
          v36 = [v27 origin];
          MRMediaRemoteSetClientProperties();
        }
        v37 = [v27 player];

        if (v37) {
          MRMediaRemoteSetNowPlayingPlayer();
        }

        uint64_t v8 = v51 + 1;
      }
      while ((id)(v51 + 1) != v49);
      id v49 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v49);
  }

  v38 = [v7 activePlayerPath];
  v39 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v38];

  if ([v7 volumeControlCapabilities])
  {
    [v7 volumeControlCapabilities];
    v40 = [v39 origin];
    MRMediaRemoteSetPickedRouteVolumeControlCapabilities();
  }
  v41 = +[MRUserSettings currentSettings];
  unsigned __int8 v42 = [v41 computeNowPlayingApplication];

  if ((v42 & 1) == 0)
  {
    v43 = [v39 client];
    v44 = [(MRDOriginForwarder *)self destinationOrigin];
    MRMediaRemoteSetNowPlayingClientForOrigin();
  }
  [(MRDOriginForwarder *)self forwardParticipantDataSourceIfNeeded];
  v45 = _MRLogForCategory();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v63 = self;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] %@ End Initializing OriginForwarder", buf, 0xCu);
  }
}

- (void)cleanupForwarding
{
  uint64_t v3 = +[MRDMediaRemoteServer server];
  unsigned __int8 v4 = [v3 nowPlayingServer];
  id v5 = [(MRDOriginForwarder *)self destinationOrigin];
  v6 = [v4 originClientForOrigin:v5];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v18 = v6;
  id obj = [v6 nowPlayingClients];
  id v21 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v7;
        uint64_t v8 = *(void **)(*((void *)&v27 + 1) + 8 * v7);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v9 = [v8 playerClients];
        id v10 = [v9 countByEnumeratingWithState:&v23 objects:v35 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v24;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v24 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              id v15 = [v14 participantDataSource];
              if (v15)
              {
                uint64_t v16 = _MRLogForCategory();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  id v17 = [v14 playerPath];
                  *(_DWORD *)buf = 138412546;
                  v32 = v15;
                  __int16 v33 = 2112;
                  unsigned int v34 = v17;
                  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] <participantDataSource> Removing participantDataSource instance %@ on playerPath: %@", buf, 0x16u);
                }
                [v14 setParticipantDataSource:0];
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v23 objects:v35 count:16];
          }
          while (v11);
        }

        uint64_t v7 = v22 + 1;
      }
      while ((id)(v22 + 1) != v21);
      id v21 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v21);
  }
}

- (void)forwardParticipantDataSourceIfNeeded
{
  uint64_t v3 = +[MRDMediaRemoteServer server];
  v35 = [v3 nowPlayingServer];
  unsigned int v34 = [v3 daemonClient];
  if (v34)
  {
    long long v26 = v3;
    unsigned __int8 v4 = +[MRDMediaRemoteServer server];
    id v5 = [v4 nowPlayingServer];
    v6 = [(MRDOriginForwarder *)self sourceOrigin];
    uint64_t v7 = [v5 originClientForOrigin:v6];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v25 = v7;
    id obj = [v7 nowPlayingClients];
    id v29 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
    if (!v29) {
      goto LABEL_27;
    }
    uint64_t v28 = *(void *)v41;
    uint64_t v31 = MRPlaybackQueueParticipantsDidChangeForPlayerNotification;
    v32 = self;
    while (1)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v41 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = v8;
        v9 = *(void **)(*((void *)&v40 + 1) + 8 * v8);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v33 = [v9 playerClients];
        id v10 = [v33 countByEnumeratingWithState:&v36 objects:v50 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v37;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v37 != v12) {
                objc_enumerationMutation(v33);
              }
              id v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              id v15 = [v14 participantDataSource];
              if (v15)
              {
                uint64_t v16 = [v14 playerPath];
                id v17 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v16];
                v18 = [v35 queryPlayerPath:v17 forClient:v34];
                v19 = [v18 playerClient];
                uint64_t v20 = v19;
                if (v19)
                {
                  id v21 = [v19 participantDataSource];

                  if (v21 != v15)
                  {
                    uint64_t v22 = _MRLogForCategory();
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412802;
                      v45 = v15;
                      __int16 v46 = 2112;
                      uint64_t v47 = v16;
                      __int16 v48 = 2112;
                      id v49 = v17;
                      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] <participantDataSource> Installing instance %@ from playerPath: %@ on playerPath: %@", buf, 0x20u);
                    }

                    [v20 setParticipantDataSource:v15];
                    long long v23 = objc_alloc_init((Class)NSMutableDictionary);
                    MRAddPlayerPathToUserInfo();
                    long long v24 = +[MRDMediaRemoteServer server];
                    [v24 postClientNotificationNamed:v31 userInfo:v23];
LABEL_20:

                    self = v32;
                    goto LABEL_21;
                  }
                }
                else
                {
                  long long v23 = _MRLogForCategory();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    [v18 error];
                    long long v24 = (void *)MRMediaRemoteErrorCopyDescription();
                    *(_DWORD *)buf = 138412546;
                    v45 = v17;
                    __int16 v46 = 2112;
                    uint64_t v47 = v24;
                    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] <participantDataSource> Player client not found for %@, because %@", buf, 0x16u);
                    goto LABEL_20;
                  }
LABEL_21:
                }
              }
            }
            id v11 = [v33 countByEnumeratingWithState:&v36 objects:v50 count:16];
          }
          while (v11);
        }

        uint64_t v8 = v30 + 1;
      }
      while ((id)(v30 + 1) != v29);
      id v29 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
      if (!v29)
      {
LABEL_27:

        uint64_t v3 = v26;
        break;
      }
    }
  }
}

- (void)_handleVolumeCapabilitiesDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = MRGetPlayerPathFromUserInfo();

  uint64_t v7 = [v6 origin];
  uint64_t v8 = [(MRDOriginForwarder *)self sourceOrigin];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = +[MRUserSettings currentSettings];
    unsigned int v11 = [v10 verboseOriginForwarderLogging];

    if (v11)
    {
      uint64_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v4 name];
        int v18 = 138412546;
        v19 = self;
        __int16 v20 = 2112;
        id v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] %@ forwarding %@", (uint8_t *)&v18, 0x16u);
      }
    }
    id v14 = [v4 userInfo];
    id v15 = [v14 objectForKeyedSubscript:kMRAVEndpointVolumeControlCapabilitiesUserInfoKey];

    [v15 intValue];
    uint64_t v16 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v6];
    id v17 = [v16 origin];
    MRMediaRemoteSetPickedRouteVolumeControlCapabilities();
  }
}

- (void)_handleApplicationDidRegisterNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = MRGetPlayerPathFromUserInfo();

  uint64_t v7 = [v6 origin];
  uint64_t v8 = [(MRDOriginForwarder *)self sourceOrigin];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = +[MRUserSettings currentSettings];
    unsigned int v11 = [v10 verboseOriginForwarderLogging];

    if (v11)
    {
      uint64_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v4 name];
        int v23 = 138412546;
        long long v24 = self;
        __int16 v25 = 2112;
        long long v26 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] %@ forwarding %@", (uint8_t *)&v23, 0x16u);
      }
    }
    id v14 = +[MRDMediaRemoteServer server];
    id v15 = [v14 nowPlayingServer];
    uint64_t v16 = [v15 queryExistingPlayerPath:v6];

    id v17 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v6];
    int v18 = [v16 playerPath];
    v19 = [v18 client];

    if (v19)
    {
      __int16 v20 = [v16 playerPath];
      id v21 = [v20 client];
      uint64_t v22 = [v17 origin];
      MRMediaRemoteSetClientProperties();
    }
  }
}

- (void)_handleApplicationDidUnregisterNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = MRGetPlayerPathFromUserInfo();

  uint64_t v7 = [v6 origin];
  uint64_t v8 = [(MRDOriginForwarder *)self sourceOrigin];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = +[MRUserSettings currentSettings];
    unsigned int v11 = [v10 verboseOriginForwarderLogging];

    if (v11)
    {
      uint64_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v4 name];
        int v17 = 138412546;
        int v18 = self;
        __int16 v19 = 2112;
        __int16 v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] %@ forwarding %@", (uint8_t *)&v17, 0x16u);
      }
    }
    id v14 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v6];
    id v15 = [v14 client];
    uint64_t v16 = [v14 origin];
    MRMediaRemoteRemoveClientForOrigin();
  }
}

- (void)_handleApplicationClientStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = MRGetPlayerPathFromUserInfo();

  uint64_t v7 = [v6 origin];
  uint64_t v8 = [(MRDOriginForwarder *)self sourceOrigin];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = +[MRUserSettings currentSettings];
    unsigned int v11 = [v10 verboseOriginForwarderLogging];

    if (v11)
    {
      uint64_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v4 name];
        int v22 = 138412546;
        int v23 = self;
        __int16 v24 = 2112;
        __int16 v25 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] %@ forwarding %@", (uint8_t *)&v22, 0x16u);
      }
    }
    id v14 = +[MRDMediaRemoteServer server];
    id v15 = [v14 nowPlayingServer];
    uint64_t v16 = [v15 queryExistingPlayerPath:v6];

    int v17 = [v16 playerPath];
    int v18 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v17];

    __int16 v19 = [v18 client];

    if (v19)
    {
      __int16 v20 = [v18 client];
      id v21 = [v18 origin];
      MRMediaRemoteSetClientProperties();
    }
  }
}

- (void)_handleActiveApplicationDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = MRGetPlayerPathFromUserInfo();

  uint64_t v7 = [v6 origin];
  uint64_t v8 = [(MRDOriginForwarder *)self sourceOrigin];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = +[MRUserSettings currentSettings];
    unsigned int v11 = [v10 verboseOriginForwarderLogging];

    if (v11)
    {
      uint64_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v4 name];
        int v17 = 138412546;
        int v18 = self;
        __int16 v19 = 2112;
        __int16 v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] %@ forwarding %@", (uint8_t *)&v17, 0x16u);
      }
    }
    id v14 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v6];
    id v15 = [v14 client];
    uint64_t v16 = [(MRDOriginForwarder *)self destinationOrigin];
    MRMediaRemoteSetNowPlayingClientForOrigin();
  }
}

- (void)_handlePlayerDidRegisterNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = MRGetPlayerPathFromUserInfo();

  uint64_t v7 = [v6 origin];
  uint64_t v8 = [(MRDOriginForwarder *)self sourceOrigin];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = +[MRUserSettings currentSettings];
    unsigned int v11 = [v10 verboseOriginForwarderLogging];

    if (v11)
    {
      uint64_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v4 name];
        int v14 = 138412546;
        id v15 = self;
        __int16 v16 = 2112;
        int v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] %@ forwarding %@", (uint8_t *)&v14, 0x16u);
      }
    }
    [(MRDOriginForwarder *)self forwardParticipantDataSourceIfNeeded];
  }
}

- (void)_handlePlayerDidUnregisterNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = MRGetPlayerPathFromUserInfo();

  uint64_t v7 = [v6 origin];
  uint64_t v8 = [(MRDOriginForwarder *)self sourceOrigin];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = +[MRUserSettings currentSettings];
    unsigned int v11 = [v10 verboseOriginForwarderLogging];

    if (v11)
    {
      uint64_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v4 name];
        int v15 = 138412546;
        __int16 v16 = self;
        __int16 v17 = 2112;
        int v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] %@ forwarding %@", (uint8_t *)&v15, 0x16u);
      }
    }
    int v14 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v6];
    MRMediaRemoteRemovePlayer();
  }
}

- (void)_handlePlayerDidRegisterCanBeNowPlayingNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = MRGetPlayerPathFromUserInfo();

  uint64_t v7 = [v6 origin];
  uint64_t v8 = [(MRDOriginForwarder *)self sourceOrigin];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = +[MRUserSettings currentSettings];
    unsigned int v11 = [v10 verboseOriginForwarderLogging];

    if (v11)
    {
      uint64_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v4 name];
        int v15 = 138412546;
        __int16 v16 = self;
        __int16 v17 = 2112;
        int v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] %@ forwarding %@", (uint8_t *)&v15, 0x16u);
      }
    }
    int v14 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v6];
    MRMediaRemoteSetCanBeNowPlayingForPlayer();
  }
}

- (void)_handlePlayerDidUnregisterCanBeNowPlayingNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = MRGetPlayerPathFromUserInfo();

  uint64_t v7 = [v6 origin];
  uint64_t v8 = [(MRDOriginForwarder *)self sourceOrigin];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = +[MRUserSettings currentSettings];
    unsigned int v11 = [v10 verboseOriginForwarderLogging];

    if (v11)
    {
      uint64_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v4 name];
        int v15 = 138412546;
        __int16 v16 = self;
        __int16 v17 = 2112;
        int v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] %@ forwarding %@", (uint8_t *)&v15, 0x16u);
      }
    }
    int v14 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v6];
    MRMediaRemoteSetCanBeNowPlayingForPlayer();
  }
}

- (void)_handlePlayerStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = MRGetPlayerPathFromUserInfo();

  uint64_t v7 = [v6 origin];
  uint64_t v8 = [(MRDOriginForwarder *)self sourceOrigin];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = +[MRUserSettings currentSettings];
    unsigned int v11 = [v10 verboseOriginForwarderLogging];

    if (v11)
    {
      uint64_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v4 name];
        int v20 = 138412546;
        id v21 = self;
        __int16 v22 = 2112;
        int v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] %@ forwarding %@", (uint8_t *)&v20, 0x16u);
      }
    }
    int v14 = +[MRDMediaRemoteServer server];
    int v15 = [v14 nowPlayingServer];
    __int16 v16 = [v15 queryExistingPlayerPath:v6];

    __int16 v17 = [v16 playerPath];
    int v18 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v17];

    __int16 v19 = [v18 player];

    if (v19) {
      MRMediaRemoteSetPlayerProperties();
    }
  }
}

- (void)_handleActivePlayerDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = MRGetPlayerPathFromUserInfo();

  uint64_t v7 = [v6 origin];
  uint64_t v8 = [(MRDOriginForwarder *)self sourceOrigin];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = +[MRUserSettings currentSettings];
    unsigned int v11 = [v10 verboseOriginForwarderLogging];

    if (v11)
    {
      uint64_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v4 name];
        int v15 = 138412546;
        __int16 v16 = self;
        __int16 v17 = 2112;
        int v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] %@ forwarding %@", (uint8_t *)&v15, 0x16u);
      }
    }
    int v14 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v6];
    MRMediaRemoteSetNowPlayingPlayer();
  }
}

- (void)_handlePlaybackStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = MRGetPlayerPathFromUserInfo();

  uint64_t v7 = [v6 origin];
  uint64_t v8 = [(MRDOriginForwarder *)self sourceOrigin];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = +[MRUserSettings currentSettings];
    unsigned int v11 = [v10 verboseOriginForwarderLogging];

    if (v11)
    {
      uint64_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v4 name];
        int v17 = 138412546;
        int v18 = self;
        __int16 v19 = 2112;
        int v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] %@ forwarding %@", (uint8_t *)&v17, 0x16u);
      }
    }
    int v14 = [v4 userInfo];
    int v15 = [v14 objectForKeyedSubscript:kMRMediaRemotePlaybackStateUserInfoKey];
    [v15 intValue];

    __int16 v16 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v6];
    MRMediaRemoteSetPlaybackStateForPlayer();
  }
}

- (void)_handleSupportedCommandsDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = MRGetPlayerPathFromUserInfo();

  uint64_t v7 = [v6 origin];
  uint64_t v8 = [(MRDOriginForwarder *)self sourceOrigin];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = +[MRUserSettings currentSettings];
    unsigned int v11 = [v10 verboseOriginForwarderLogging];

    if (v11)
    {
      uint64_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v4 name];
        int v20 = 138412546;
        id v21 = self;
        __int16 v22 = 2112;
        int v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] %@ forwarding %@", (uint8_t *)&v20, 0x16u);
      }
    }
    int v14 = +[MRDMediaRemoteServer server];
    int v15 = [v14 nowPlayingServer];
    __int16 v16 = [v15 queryExistingPlayerPath:v6];

    int v17 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v6];
    int v18 = [v16 playerClient];
    __int16 v19 = [v18 supportedRemoteControlCommands];
    MRMediaRemoteSetSupportedCommandsForPlayer();
  }
}

- (void)_handlePlayerPlaybackQueueCapabilitiesDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = MRGetPlayerPathFromUserInfo();

  uint64_t v7 = [v6 origin];
  uint64_t v8 = [(MRDOriginForwarder *)self sourceOrigin];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = +[MRUserSettings currentSettings];
    unsigned int v11 = [v10 verboseOriginForwarderLogging];

    if (v11)
    {
      uint64_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v4 name];
        int v19 = 138412546;
        int v20 = self;
        __int16 v21 = 2112;
        __int16 v22 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] %@ forwarding %@", (uint8_t *)&v19, 0x16u);
      }
    }
    int v14 = +[MRDMediaRemoteServer server];
    int v15 = [v14 nowPlayingServer];
    __int16 v16 = [v15 queryExistingPlayerPath:v6];

    int v17 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v6];
    int v18 = [v16 playerClient];
    [v18 playbackQueueCapabilities];
    MRMediaRemoteSetPlaybackQueueCapabilities();
  }
}

- (void)_handlePlayerPlaybackQueueDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = MRGetPlayerPathFromUserInfo();

  uint64_t v7 = [v6 origin];
  uint64_t v8 = [(MRDOriginForwarder *)self sourceOrigin];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = +[MRUserSettings currentSettings];
    unsigned int v11 = [v10 verboseOriginForwarderLogging];

    if (v11)
    {
      uint64_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v4 name];
        int v20 = 138412546;
        __int16 v21 = self;
        __int16 v22 = 2112;
        int v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] %@ forwarding %@", (uint8_t *)&v20, 0x16u);
      }
    }
    int v14 = +[MRDMediaRemoteServer server];
    int v15 = [v14 nowPlayingServer];
    __int16 v16 = [v15 queryExistingPlayerPath:v6];

    int v17 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v6];
    int v18 = [v16 playerClient];
    int v19 = [v18 playbackQueue];
    MRMediaRemotePlaybackQueueDataSourceInvalidateWithPlaybackQueueForPlayer();
  }
}

- (void)_handlePlayerPlaybackQueueContentItemsDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = MRGetPlayerPathFromUserInfo();

  uint64_t v7 = [v6 origin];
  uint64_t v8 = [(MRDOriginForwarder *)self sourceOrigin];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = +[MRUserSettings currentSettings];
    unsigned int v11 = [v10 verboseOriginForwarderLogging];

    if (v11)
    {
      uint64_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v4 name];
        int v17 = 138412546;
        int v18 = self;
        __int16 v19 = 2112;
        int v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] %@ forwarding %@", (uint8_t *)&v17, 0x16u);
      }
    }
    int v14 = [v4 userInfo];
    int v15 = MRGetContentItemsFromUserInfo();

    __int16 v16 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v6];
    MRMediaRemotePlaybackQueueDataSourceContentItemsChangedForPlayer();
  }
}

- (void)_handlePlayerPlaybackQueueContentItemArtworkDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = MRGetPlayerPathFromUserInfo();

  uint64_t v7 = [v6 origin];
  uint64_t v8 = [(MRDOriginForwarder *)self sourceOrigin];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = +[MRUserSettings currentSettings];
    unsigned int v11 = [v10 verboseOriginForwarderLogging];

    if (v11)
    {
      uint64_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v4 name];
        int v18 = 138412546;
        __int16 v19 = self;
        __int16 v20 = 2112;
        __int16 v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] %@ forwarding %@", (uint8_t *)&v18, 0x16u);
      }
    }
    int v14 = [v4 userInfo];
    int v15 = MRGetContentItemsFromUserInfo();

    id v16 = objc_alloc_init((Class)MRPlaybackQueueRequest);
    [v16 setArtworkHeight:1.0];
    [v16 setArtworkWidth:1.0];
    int v17 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v6];
    MRMediaRemotePlaybackQueueDataSourceContentItemsChangedWithRequestForPlayer();
  }
}

- (void)_handleParticipantsDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = MRGetPlayerPathFromUserInfo();

  uint64_t v7 = [v6 origin];
  uint64_t v8 = [(MRDOriginForwarder *)self sourceOrigin];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = +[MRUserSettings currentSettings];
    unsigned int v11 = [v10 verboseOriginForwarderLogging];

    if (v11)
    {
      uint64_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v4 name];
        int v17 = 138412546;
        int v18 = self;
        __int16 v19 = 2112;
        __int16 v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDOriginForwarder] %@ forwarding %@", (uint8_t *)&v17, 0x16u);
      }
    }
    int v14 = [(MRDOriginForwarder *)self createLocalizedPlayerPath:v6];
    id v15 = objc_alloc_init((Class)NSMutableDictionary);
    MRAddPlayerPathToUserInfo();
    id v16 = +[MRDMediaRemoteServer server];
    [v16 postClientNotificationNamed:MRPlaybackQueueParticipantsDidChangeForPlayerNotification userInfo:v15];
  }
}

- (id)createDelocalizedPlayerPath:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)MRPlayerPath);
  v6 = [(MRDOriginForwarder *)self sourceOrigin];
  uint64_t v7 = [v4 client];
  uint64_t v8 = [v4 player];

  id v9 = [v5 initWithOrigin:v6 client:v7 player:v8];

  return v9;
}

- (id)createLocalizedPlayerPath:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)MRPlayerPath);
  v6 = [(MRDOriginForwarder *)self destinationOrigin];
  uint64_t v7 = [v4 client];
  uint64_t v8 = [v4 player];

  id v9 = [v5 initWithOrigin:v6 client:v7 player:v8];

  return v9;
}

+ (id)localizedPlayerIDFromPlayerPath:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSString);
  id v5 = [v3 client];
  v6 = [v5 bundleIdentifier];
  uint64_t v7 = [v3 player];
  uint64_t v8 = [v7 identifier];
  id v9 = [v3 client];

  id v10 = [v4 initWithFormat:@"%@-%@-%d", v6, v8, objc_msgSend(v9, "processIdentifier")];

  return v10;
}

+ (void)waitUntilForwardingOperationsHaveFinished:(id)a3
{
  id v3 = a3;
  id v4 = +[MRDMediaRemoteServer server];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100057824;
  v6[3] = &unk_100417D10;
  id v7 = v3;
  id v5 = v3;
  [v4 postClientNotificationNamed:@"placeholder" predicate:v6];
}

- (MROrigin)sourceOrigin
{
  return self->_sourceOrigin;
}

- (MROrigin)destinationOrigin
{
  return self->_destinationOrigin;
}

- (MRClient)destinationClient
{
  return self->_destinationClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationClient, 0);
  objc_storeStrong((id *)&self->_destinationOrigin, 0);

  objc_storeStrong((id *)&self->_sourceOrigin, 0);
}

@end