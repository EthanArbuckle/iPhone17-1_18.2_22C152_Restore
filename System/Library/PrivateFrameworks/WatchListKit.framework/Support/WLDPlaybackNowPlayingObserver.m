@interface WLDPlaybackNowPlayingObserver
- (BOOL)_isAnyAppPlaying;
- (BOOL)_isPlayerPathPlaying:(id)a3;
- (BOOL)_isSummary:(id)a3 signifantChangeFromSummary:(id)a4;
- (BOOL)_nowPlayingAppIsPlayingForPlayerPath:(id)a3;
- (BOOL)_shouldPlayerPathBeConsidered:(id)a3;
- (WLDPlaybackNowPlayingObserver)initWithUpdateHandler:(id)a3;
- (id)_fetchActivePlayerPaths;
- (id)_getActivePlayerPaths;
- (id)_nowPlayingInfoForPlayerPath:(id)a3;
- (id)_unsupportedMediaTypes;
- (id)nowPlayingSummaries;
- (id)updateHandler;
- (void)_activePlayerPathsDidChangeNotification:(id)a3;
- (void)_fetchNowPlayingInfo:(id)a3;
- (void)_forceFetchNowPlayingInfofromActivePlayers;
- (void)_isPlayingDidChangeNotification:(id)a3;
- (void)_nowPlayingInfoDidChangeNotification:(id)a3;
- (void)_processLastSummary:(id)a3;
- (void)_setActivePlayerPaths:(id)a3;
- (void)_updateWithInfo:(id)a3 sessionID:(id)a4;
- (void)dealloc;
- (void)setUpdateHandler:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation WLDPlaybackNowPlayingObserver

void __62__WLDPlaybackNowPlayingObserver__nowPlayingInfoForPlayerPath___block_invoke(uint64_t a1, void *a2)
{
  id v21 = a2;
  v3 = [v21 valueForKey:kMRMediaRemoteNowPlayingInfoMediaType];
  if (!v3
    || ([*(id *)(a1 + 32) _unsupportedMediaTypes],
        v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 containsObject:v3],
        v4,
        (v5 & 1) == 0))
  {
    v6 = +[ACAccountStore ams_sharedAccountStore];
    v7 = objc_msgSend(v6, "ams_activeiTunesAccount");
    v8 = objc_msgSend(v7, "ams_DSID");
    v9 = [v8 stringValue];

    v10 = [*(id *)(a1 + 32) _getActivePlayerPaths];
    id v11 = [v10 containsObject:*(void *)(a1 + 40)];

    id v12 = objc_alloc((Class)WLKPlaybackSummary);
    v13 = [*(id *)(a1 + 40) client];
    v14 = [v13 bundleIdentifier];
    id v15 = [v12 initWithMediaRemoteDictionary:v21 bundleID:v14 accountID:v9 isFromActivePlayerPath:v11];

    v16 = [*(id *)(a1 + 40) client];
    v17 = [v16 bundleIdentifier];
    v18 = [*(id *)(a1 + 40) player];
    v19 = [v18 identifier];
    v20 = +[NSString stringWithFormat:@"%@-%@", v17, v19];

    if (v15) {
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v15 forKey:v20];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)_unsupportedMediaTypes
{
  if (_unsupportedMediaTypes_onceToken != -1) {
    dispatch_once(&_unsupportedMediaTypes_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)_unsupportedMediaTypes___unsupportedTypes;

  return v2;
}

- (id)_getActivePlayerPaths
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activePlayerPaths;
  objc_sync_exit(v2);

  id v4 = [(NSArray *)v3 copy];

  return v4;
}

- (void)_nowPlayingInfoDidChangeNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:kMRNowPlayingPlayerPathUserInfoKey];

  if ([(WLDPlaybackNowPlayingObserver *)self _shouldPlayerPathBeConsidered:v5]) {
    [(WLDPlaybackNowPlayingObserver *)self _fetchNowPlayingInfo:v5];
  }
}

- (void)_fetchNowPlayingInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(WLDPlaybackNowPlayingObserver *)self _nowPlayingInfoForPlayerPath:v4];
  v6 = [v4 client];
  v7 = [v6 bundleIdentifier];
  v8 = [v4 player];
  v9 = [v8 identifier];
  v10 = +[NSString stringWithFormat:@"%@-%@", v7, v9];

  id v11 = [v5 objectForKey:v10];
  id v12 = self;
  objc_sync_enter(v12);
  v13 = [(NSMutableDictionary *)v12->_lastSummaryDict objectForKey:v10];
  objc_sync_exit(v12);

  if ([v11 isEquivalentToSummaryExcludingTimestamp:v13])
  {
    v14 = WLKPlaybackTrackingLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "WLDPlaybackNowPlayingObserver - -SigEval- ignoring duplicate NPI", buf, 2u);
    }
    goto LABEL_8;
  }
  if (v11)
  {
    if ([(WLDPlaybackNowPlayingObserver *)v12 _isSummary:v11 signifantChangeFromSummary:v13])
    {
      [(WLDPlaybackNowPlayingObserver *)v12 _updateWithInfo:v11 sessionID:v10];
    }
LABEL_7:
    v14 = v12;
    objc_sync_enter(v14);
    [(NSMutableDictionary *)v12->_lastSummaryDict setObject:v11 forKey:v10];
    objc_sync_exit(v14);
LABEL_8:

    goto LABEL_9;
  }
  if (v13 && [v13 playbackState] == (id)1)
  {
    id v15 = WLKPlaybackTrackingLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "WLDPlaybackNowPlayingObserver - Generating stopped playback event", v17, 2u);
    }

    id v11 = [v13 elapsedTimeSummaryWithPlaybackState:0 timerDerived:0];
    [(WLDPlaybackNowPlayingObserver *)v12 _updateWithInfo:v11 sessionID:v10];
    if (v11) {
      goto LABEL_7;
    }
  }
LABEL_9:
}

- (BOOL)_shouldPlayerPathBeConsidered:(id)a3
{
  id v3 = a3;
  id v4 = [v3 origin];
  unsigned int v5 = [v4 isLocal];

  if (v5)
  {
    v6 = [v3 client];
    v7 = [v6 bundleIdentifier];

    v8 = +[WLKAppLibrary defaultAppLibrary];
    v9 = [v8 allAppBundleIdentifiers];

    BOOL v10 = (+[WLKChannelUtilities isItunesBundleID:](WLKChannelUtilities, "isItunesBundleID:", v7) & 1) != 0|| [v9 containsObject:v7];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)_nowPlayingInfoForPlayerPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__4;
    id v15 = __Block_byref_object_dispose__4;
    id v16 = (id)objc_opt_new();
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    id v9 = v4;
    BOOL v10 = v5;
    MRMediaRemoteGetNowPlayingInfoForPlayer();
    dispatch_time_t v6 = dispatch_time(0, 2000000000);
    dispatch_semaphore_wait(v10, v6);
    id v7 = objc_msgSend((id)v12[5], "copy", _NSConcreteStackBlock, 3221225472, __62__WLDPlaybackNowPlayingObserver__nowPlayingInfoForPlayerPath___block_invoke, &unk_100045C18, self);

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (WLDPlaybackNowPlayingObserver)initWithUpdateHandler:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WLDPlaybackNowPlayingObserver;
  dispatch_semaphore_t v5 = [(WLDPlaybackNowPlayingObserver *)&v17 init];
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id updateHandler = v5->_updateHandler;
    v5->_id updateHandler = v6;

    v5->_isObserving = 0;
    dispatch_queue_t v8 = dispatch_queue_create("WLDPlaybackNowPlayingObserverQueueNotif", 0);
    notificationQueue = v5->_notificationQueue;
    v5->_notificationQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("WLDPlaybackNowPlayingObserverQueueLookup", 0);
    lookupQueue = v5->_lookupQueue;
    v5->_lookupQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = objc_opt_new();
    lastSummaryDict = v5->_lastSummaryDict;
    v5->_lastSummaryDict = (NSMutableDictionary *)v12;

    uint64_t v14 = [(WLDPlaybackNowPlayingObserver *)v5 _fetchActivePlayerPaths];
    activePlayerPaths = v5->_activePlayerPaths;
    v5->_activePlayerPaths = (NSArray *)v14;

    [(WLDPlaybackNowPlayingObserver *)v5 startObserving];
  }

  return v5;
}

- (void)dealloc
{
  [(WLDPlaybackNowPlayingObserver *)self stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)WLDPlaybackNowPlayingObserver;
  [(WLDPlaybackNowPlayingObserver *)&v3 dealloc];
}

- (void)startObserving
{
  if (!self->_isObserving)
  {
    objc_super v3 = WLKPlaybackTrackingLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "WLDPlaybackNowPlayingObserver - Start Playback observation", buf, 2u);
    }

    self->_isObserving = 1;
    MRMediaRemoteRegisterForNowPlayingNotifications();
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"_nowPlayingInfoDidChangeNotification:" name:kMRMediaRemotePlayerNowPlayingInfoDidChangeNotification object:0];

    dispatch_semaphore_t v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"_isPlayingDidChangeNotification:" name:kMRMediaRemotePlayerIsPlayingDidChangeNotification object:0];

    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"_activePlayerPathsDidChangeNotification:" name:kMRMediaRemoteActivePlayerPathsDidChange object:0];

    notificationQueue = self->_notificationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __47__WLDPlaybackNowPlayingObserver_startObserving__block_invoke;
    block[3] = &unk_100045508;
    block[4] = self;
    dispatch_async(notificationQueue, block);
  }
}

id __47__WLDPlaybackNowPlayingObserver_startObserving__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _forceFetchNowPlayingInfofromActivePlayers];
}

- (void)stopObserving
{
  if (self->_isObserving)
  {
    objc_super v3 = WLKPlaybackTrackingLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_semaphore_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "WLDPlaybackNowPlayingObserver - Stop Playback observation", v5, 2u);
    }

    self->_isObserving = 0;
    MRMediaRemoteUnregisterForNowPlayingNotifications();
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self];
  }
}

- (id)nowPlayingSummaries
{
  objc_super v3 = +[ACAccountStore ams_sharedAccountStore];
  id v4 = objc_msgSend(v3, "ams_activeiTunesAccount");
  dispatch_semaphore_t v5 = objc_msgSend(v4, "ams_DSID");
  uint64_t v14 = [v5 stringValue];

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__4;
  v25 = __Block_byref_object_dispose__4;
  id v26 = (id)objc_opt_new();
  [(WLDPlaybackNowPlayingObserver *)self _getActivePlayerPaths];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v7 = (char *)[obj countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        id v15 = v14;
        id v16 = v6;
        MRMediaRemoteGetNowPlayingInfoForPlayer();
        dispatch_time_t v10 = dispatch_time(0, 2000000000);
        dispatch_semaphore_wait(v16, v10);
      }
      id v7 = (char *)[obj countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v7);
  }

  id v11 = [(id)v22[5] copy];
  _Block_object_dispose(&v21, 8);

  return v11;
}

intptr_t __52__WLDPlaybackNowPlayingObserver_nowPlayingSummaries__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v4 = [*(id *)(a1 + 32) client];
    dispatch_semaphore_t v5 = [v4 bundleIdentifier];

    if (v5)
    {
      id v6 = a2;
      id v7 = objc_alloc((Class)WLKPlaybackSummary);
      uint64_t v8 = [*(id *)(a1 + 32) client];
      id v9 = [v8 bundleIdentifier];
      id v10 = [v7 initWithMediaRemoteDictionary:v6 bundleID:v9 accountID:*(void *)(a1 + 40) isFromActivePlayerPath:1];

      if (v10) {
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v10];
      }
    }
  }
  id v11 = *(NSObject **)(a1 + 48);

  return dispatch_semaphore_signal(v11);
}

- (void)_isPlayingDidChangeNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v8 = [v4 objectForKey:kMRNowPlayingPlayerPathUserInfoKey];

  if ([(WLDPlaybackNowPlayingObserver *)self _shouldPlayerPathBeConsidered:v8])
  {
    unsigned __int8 v5 = [(WLDPlaybackNowPlayingObserver *)self _isAnyAppPlaying];
    transaction = self->_transaction;
    if (v5)
    {
      if (transaction) {
        goto LABEL_9;
      }
    }
    else if (transaction)
    {
      id v7 = 0;
LABEL_8:
      self->_transaction = v7;

      goto LABEL_9;
    }
    id v7 = (WLKTransactionScope *)[objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDPlaybackNowPlayingObserver._updateTransactionState"];
    transaction = self->_transaction;
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_activePlayerPathsDidChangeNotification:(id)a3
{
  id v4 = [(WLDPlaybackNowPlayingObserver *)self _fetchActivePlayerPaths];
  unsigned __int8 v5 = [(WLDPlaybackNowPlayingObserver *)self _getActivePlayerPaths];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        if (([v5 containsObject:v11] & 1) == 0) {
          [(WLDPlaybackNowPlayingObserver *)self _fetchNowPlayingInfo:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v5;
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8 * (void)j);
        if ((objc_msgSend(v6, "containsObject:", v17, (void)v18) & 1) == 0) {
          [(WLDPlaybackNowPlayingObserver *)self _processLastSummary:v17];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }

  [(WLDPlaybackNowPlayingObserver *)self _setActivePlayerPaths:v6];
}

- (BOOL)_isPlayerPathPlaying:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v7 = dispatch_semaphore_create(0);
  MRMediaRemoteGetPlaybackStateForPlayer();
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v7, v4);
  char v5 = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return v5;
}

intptr_t __54__WLDPlaybackNowPlayingObserver__isPlayerPathPlaying___block_invoke(uint64_t a1, int a2)
{
  if (a2 == 1) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_setActivePlayerPaths:(id)a3
{
  dispatch_time_t v4 = (NSArray *)a3;
  id obj = self;
  objc_sync_enter(obj);
  activePlayerPaths = obj->_activePlayerPaths;
  obj->_activePlayerPaths = v4;

  objc_sync_exit(obj);
}

- (id)_fetchActivePlayerPaths
{
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  long long v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  long long v20 = __56__WLDPlaybackNowPlayingObserver__fetchActivePlayerPaths__block_invoke;
  long long v21 = &unk_100045C68;
  long long v23 = &v24;
  v2 = dispatch_semaphore_create(0);
  long long v22 = v2;
  MRMediaRemoteGetActivePlayerPathsForOrigin();
  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v2, v3);
  dispatch_time_t v4 = +[WLKAppLibrary defaultAppLibrary];
  char v5 = [v4 allAppBundleIdentifiers];

  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = (void *)v25[5];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = __56__WLDPlaybackNowPlayingObserver__fetchActivePlayerPaths__block_invoke_2;
  uint64_t v15 = &unk_100045C90;
  id v8 = v5;
  id v16 = v8;
  id v9 = v6;
  id v17 = v9;
  [v7 enumerateObjectsUsingBlock:&v12];
  id v10 = objc_msgSend(v9, "copy", v12, v13, v14, v15);

  _Block_object_dispose(&v24, 8);

  return v10;
}

intptr_t __56__WLDPlaybackNowPlayingObserver__fetchActivePlayerPaths__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

void __56__WLDPlaybackNowPlayingObserver__fetchActivePlayerPaths__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 client];
  uint64_t v4 = [v3 bundleIdentifier];

  if ((+[WLKChannelUtilities isItunesBundleID:](WLKChannelUtilities, "isItunesBundleID:", v4) & 1) != 0|| [*(id *)(a1 + 32) containsObject:v4])
  {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (BOOL)_isAnyAppPlaying
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(WLDPlaybackNowPlayingObserver *)self _getActivePlayerPaths];
  id v5 = (char *)[v4 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        char v11 = v3;
        MRMediaRemoteGetPlaybackStateForPlayer();
        dispatch_time_t v8 = dispatch_time(0, 2000000000);
        dispatch_semaphore_wait(v11, v8);
      }
      id v5 = (char *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v20, 16, _NSConcreteStackBlock, 3221225472, __49__WLDPlaybackNowPlayingObserver__isAnyAppPlaying__block_invoke, &unk_100045C40);
    }
    while (v5);
  }

  BOOL v9 = *((unsigned char *)v17 + 24) != 0;
  _Block_object_dispose(&v16, 8);

  return v9;
}

intptr_t __49__WLDPlaybackNowPlayingObserver__isAnyAppPlaying__block_invoke(uint64_t a1, int a2)
{
  if (a2 == 1) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_nowPlayingAppIsPlayingForPlayerPath:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v7 = dispatch_semaphore_create(0);
  MRMediaRemoteGetPlaybackStateForPlayer();
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v7, v4);
  char v5 = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return v5;
}

intptr_t __70__WLDPlaybackNowPlayingObserver__nowPlayingAppIsPlayingForPlayerPath___block_invoke(uint64_t a1, int a2)
{
  if (a2 == 1) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_processLastSummary:(id)a3
{
  id v4 = a3;
  char v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [v4 client];
  id v7 = [v6 bundleIdentifier];
  uint64_t v8 = [v4 player];
  BOOL v9 = [v8 identifier];
  uint64_t v10 = +[NSString stringWithFormat:@"%@-%@", v7, v9];

  char v11 = [(NSMutableDictionary *)v5->_lastSummaryDict objectForKey:v10];
  long long v12 = v11;
  if (v11 && [v11 playbackState] == (id)1)
  {
    long long v13 = WLKPlaybackTrackingLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "WLDPlaybackNowPlayingObserver - _processLastSummary Generating stopped playback event", buf, 2u);
    }

    long long v14 = [v12 elapsedTimeSummaryWithPlaybackState:0 timerDerived:0];
    [(WLDPlaybackNowPlayingObserver *)v5 _updateWithInfo:v14 sessionID:v10];
  }
  lastSummaryDict = v5->_lastSummaryDict;
  uint64_t v18 = v10;
  uint64_t v16 = +[NSArray arrayWithObjects:&v18 count:1];
  [(NSMutableDictionary *)lastSummaryDict removeObjectsForKeys:v16];

  objc_sync_exit(v5);
}

- (void)_forceFetchNowPlayingInfofromActivePlayers
{
  id v3 = [(WLDPlaybackNowPlayingObserver *)self _getActivePlayerPaths];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(WLDPlaybackNowPlayingObserver *)self _fetchNowPlayingInfo:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __55__WLDPlaybackNowPlayingObserver__unsupportedMediaTypes__block_invoke(id a1)
{
  v3[0] = kMRMediaRemoteMediaTypeMusic;
  v3[1] = kMRMediaRemoteMediaTypeAudioBook;
  v3[2] = kMRMediaRemoteMediaTypePodcast;
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:3];
  v2 = (void *)_unsupportedMediaTypes___unsupportedTypes;
  _unsupportedMediaTypes___unsupportedTypes = v1;
}

- (void)_updateWithInfo:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_updateHandler)
  {
    notificationQueue = self->_notificationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __59__WLDPlaybackNowPlayingObserver__updateWithInfo_sessionID___block_invoke;
    block[3] = &unk_1000458A8;
    id v10 = v6;
    long long v11 = self;
    id v12 = v7;
    dispatch_async(notificationQueue, block);
  }
}

uint64_t __59__WLDPlaybackNowPlayingObserver__updateWithInfo_sessionID___block_invoke(uint64_t a1)
{
  v2 = WLKPlaybackTrackingLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "WLDPlaybackNowPlayingObserver - Calling update handler with summary: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 40) + 56) + 16))();
}

- (BOOL)_isSummary:(id)a3 signifantChangeFromSummary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v5 isSameContent:v6])
  {
    LOBYTE(v25) = 1;
    uint64_t v24 = @"content changed";
    goto LABEL_19;
  }
  id v7 = [v6 playbackState];
  if (v7 != [v5 playbackState]
    || (id v8 = [v6 completionState], v8 != objc_msgSend(v5, "completionState"))
    || [v6 playbackState] != (id)1)
  {
    uint64_t v24 = @"significant change";
    goto LABEL_11;
  }
  long long v9 = [v5 elapsedTime];
  [v9 doubleValue];
  double v11 = v10;

  id v12 = +[NSDate date];
  uint64_t v13 = [v6 timestamp];
  [v12 timeIntervalSinceDate:v13];
  double v15 = v14;

  uint64_t v16 = [v6 playbackRate];
  objc_opt_class();
  LOBYTE(v13) = objc_opt_isKindOfClass();

  double v17 = 1.0;
  if (v13)
  {
    uint64_t v18 = [v6 playbackRate];
    [v18 doubleValue];
    double v17 = v19;
  }
  long long v20 = [v6 elapsedTime];
  [v20 doubleValue];
  double v22 = v21 + v15 * v17;

  double v23 = vabdd_f64(v11, v22);
  if (v23 > 1.0)
  {
    uint64_t v24 = +[NSString stringWithFormat:@"elapsed time drift exceeds maximum: %.5f", *(void *)&v23];
LABEL_11:
    uint64_t v26 = WLKPlaybackTrackingLogObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31[0] = v6;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "WLDPlaybackNowPlayingObserver - -SigEval- update %@ ->", buf, 0xCu);
    }

    v27 = WLKPlaybackTrackingLogObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31[0] = v5;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "WLDPlaybackNowPlayingObserver - -SigEval- %@", buf, 0xCu);
    }

    BOOL v25 = 1;
    goto LABEL_16;
  }
  BOOL v25 = 0;
  uint64_t v24 = @"nominal elapsed time update";
LABEL_16:
  v28 = WLKPlaybackTrackingLogObject();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v31[0]) = v25;
    WORD2(v31[0]) = 2112;
    *(void *)((char *)v31 + 6) = v24;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "WLDPlaybackNowPlayingObserver - -SigEval- [%d] reason: %@", buf, 0x12u);
  }

LABEL_19:
  return v25;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_activePlayerPaths, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_lastSummaryDict, 0);
  objc_storeStrong((id *)&self->_lookupQueue, 0);

  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

@end