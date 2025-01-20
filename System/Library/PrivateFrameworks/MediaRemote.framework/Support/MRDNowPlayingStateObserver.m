@interface MRDNowPlayingStateObserver
- (BOOL)_shouldNotifyChange:(id)a3;
- (BOOL)wantsCoalescedStateChanged;
- (MRDNowPlayingServer)npServer;
- (MRDNowPlayingStateObserver)init;
- (MRDNowPlayingStateObserverDelegate)delegate;
- (NSMutableDictionary)coalescingStates;
- (id)_onQueue_stateForPlayerPath:(id)a3;
- (id)debugDescription;
- (void)_addNowPlayingNotification:(id)a3 selector:(SEL)a4;
- (void)_handleApplicationClientStateChanged:(id)a3;
- (void)_handleContentItemArtworkChanged:(id)a3;
- (void)_handleContentItemsChanged:(id)a3;
- (void)_handleDefaultSupportedCommandsChanged:(id)a3;
- (void)_handleNowPlayingClientDidChange:(id)a3;
- (void)_handleNowPlayingPlaybackStateChanged:(id)a3;
- (void)_handleNowPlayingPlayerDidChange:(id)a3;
- (void)_handlePlaybackQueueCapabilitiesChanged:(id)a3;
- (void)_handlePlaybackQueueChanged:(id)a3;
- (void)_handlePlayerStateChanged:(id)a3;
- (void)_handleRemoveClient:(id)a3;
- (void)_handleRemovePlayer:(id)a3;
- (void)_handleSupportedCommandsDidChange:(id)a3;
- (void)_handleVolumeAvailabilityDidChangeNotification:(id)a3;
- (void)_onQueue_notifyCoalescedPlayerPath:(id)a3;
- (void)_onQueue_setReceiveNowPlayingUpdates:(BOOL)a3;
- (void)_onQueue_setReceiveVolumeControlUpdates:(BOOL)a3;
- (void)_removeNowPlayingNotifications;
- (void)_setReceiveUpdates:(BOOL)a3 forSource:(int64_t)a4;
- (void)beginReceivingUpdatesForSource:(int64_t)a3;
- (void)dealloc;
- (void)setCoalescingStates:(id)a3;
- (void)setDelegate:(id)a3;
- (void)stopReceivingUpdatesForSource:(int64_t)a3;
@end

@implementation MRDNowPlayingStateObserver

- (MRDNowPlayingStateObserver)init
{
  v16.receiver = self;
  v16.super_class = (Class)MRDNowPlayingStateObserver;
  v2 = [(MRDNowPlayingStateObserver *)&v16 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(Name, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    observedNowPlayingNotifications = v2->_observedNowPlayingNotifications;
    v2->_observedNowPlayingNotifications = v8;

    v10 = +[MRDMediaRemoteServer server];
    uint64_t v11 = [v10 nowPlayingServer];
    npServer = v2->_npServer;
    v2->_npServer = (MRDNowPlayingServer *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    coalescingStates = v2->_coalescingStates;
    v2->_coalescingStates = v13;
  }
  return v2;
}

- (void)dealloc
{
  [(MRDNowPlayingStateObserver *)self stopReceivingUpdatesForSource:1];
  [(MRDNowPlayingStateObserver *)self stopReceivingUpdatesForSource:2];
  v3.receiver = self;
  v3.super_class = (Class)MRDNowPlayingStateObserver;
  [(MRDNowPlayingStateObserver *)&v3 dealloc];
}

- (id)debugDescription
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1000C633C;
  v10 = sub_1000C634C;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C6354;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)beginReceivingUpdatesForSource:(int64_t)a3
{
}

- (void)stopReceivingUpdatesForSource:(int64_t)a3
{
}

- (BOOL)_shouldNotifyChange:(id)a3
{
  return 1;
}

- (void)_handleNowPlayingClientDidChange:(id)a3
{
  id v7 = a3;
  if (-[MRDNowPlayingStateObserver _shouldNotifyChange:](self, "_shouldNotifyChange:"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = [v7 userInfo];
    uint64_t v6 = MRGetPlayerPathFromUserInfo();
    [WeakRetained stateObserver:self didReceiveNowPlayingClientChange:v6];
  }
}

- (void)_handleNowPlayingPlayerDidChange:(id)a3
{
  id v7 = a3;
  if (-[MRDNowPlayingStateObserver _shouldNotifyChange:](self, "_shouldNotifyChange:"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = [v7 userInfo];
    uint64_t v6 = MRGetPlayerPathFromUserInfo();
    [WeakRetained stateObserver:self didReceiveNowPlayingPlayerChange:v6];
  }
}

- (void)_handleApplicationClientStateChanged:(id)a3
{
  id v4 = a3;
  if ([(MRDNowPlayingStateObserver *)self _shouldNotifyChange:v4])
  {
    v5 = [v4 userInfo];
    uint64_t v6 = MRGetPlayerPathFromUserInfo();

    id v7 = +[MRDMediaRemoteServer server];
    uint64_t v8 = [v7 nowPlayingServer];

    v9 = [v8 queryExistingPlayerPath:v6];
    v10 = [v9 nowPlayingClient];

    if (v10)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C66C4;
      block[3] = &unk_1004159B8;
      block[4] = self;
      id v13 = v6;
      id v14 = v9;
      dispatch_async((dispatch_queue_t)queue, block);
    }
  }
}

- (void)_handleRemoveClient:(id)a3
{
  id v7 = a3;
  if (-[MRDNowPlayingStateObserver _shouldNotifyChange:](self, "_shouldNotifyChange:"))
  {
    id v4 = [v7 userInfo];
    v5 = MRGetPlayerPathFromUserInfo();

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained stateObserver:self didReceiveClientDidUnregister:v5];
  }
}

- (void)_handleVolumeAvailabilityDidChangeNotification:(id)a3
{
  if ([(MRDNowPlayingStateObserver *)self _shouldNotifyChange:a3])
  {
    id v4 = objc_alloc((Class)MRPlayerPath);
    v5 = +[MROrigin localOrigin];
    id v11 = [v4 initWithOrigin:v5 client:0 player:0];

    uint64_t v6 = +[MRDMediaRemoteServer server];
    id v7 = [v6 nowPlayingServer];

    uint64_t v8 = [v7 queryExistingPlayerPath:v11];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = [v8 originClient];
    objc_msgSend(WeakRetained, "stateObserver:didReceiveVolumeControlCapabilitiesChange:playerPath:", self, objc_msgSend(v10, "volumeControlCapabilities"), v11);
  }
}

- (void)_handleDefaultSupportedCommandsChanged:(id)a3
{
  id v14 = a3;
  if (-[MRDNowPlayingStateObserver _shouldNotifyChange:](self, "_shouldNotifyChange:"))
  {
    id v4 = [v14 userInfo];
    v5 = MRGetPlayerPathFromUserInfo();

    uint64_t v6 = +[MRDMediaRemoteServer server];
    id v7 = [v6 nowPlayingServer];
    uint64_t v8 = [v5 origin];
    v9 = [v7 originClientForOrigin:v8];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v11 = [v5 client];
    v12 = [v11 bundleIdentifier];
    id v13 = [v9 defaultSupportedCommandsForClient:v12];
    [WeakRetained stateObserver:self didReceiveDefaultSupportedCommandsChange:v13 playerPath:v5];
  }
}

- (void)_handleSupportedCommandsDidChange:(id)a3
{
  id v4 = a3;
  if ([(MRDNowPlayingStateObserver *)self _shouldNotifyChange:v4])
  {
    v5 = [v4 userInfo];
    uint64_t v6 = MRGetPlayerPathFromUserInfo();

    id v7 = [(MRDNowPlayingServer *)self->_npServer queryExistingPlayerPath:v6];
    uint64_t v8 = [v7 playerClient];

    if (v8)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C6B60;
      block[3] = &unk_1004159B8;
      block[4] = self;
      id v11 = v6;
      id v12 = v7;
      dispatch_async((dispatch_queue_t)queue, block);
    }
  }
}

- (void)_handleNowPlayingPlaybackStateChanged:(id)a3
{
  id v4 = a3;
  if ([(MRDNowPlayingStateObserver *)self _shouldNotifyChange:v4])
  {
    v5 = [v4 userInfo];
    uint64_t v6 = MRGetPlayerPathFromUserInfo();

    id v7 = [(MRDNowPlayingServer *)self->_npServer queryExistingPlayerPath:v6];
    uint64_t v8 = [v7 playerClient];

    if (v8)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C6CF4;
      block[3] = &unk_1004159B8;
      block[4] = self;
      id v11 = v6;
      id v12 = v7;
      dispatch_async((dispatch_queue_t)queue, block);
    }
  }
}

- (void)_handlePlaybackQueueChanged:(id)a3
{
  id v4 = a3;
  if ([(MRDNowPlayingStateObserver *)self _shouldNotifyChange:v4])
  {
    v5 = [v4 userInfo];
    uint64_t v6 = MRGetPlayerPathFromUserInfo();

    id v7 = [(MRDNowPlayingServer *)self->_npServer queryExistingPlayerPath:v6];
    uint64_t v8 = [v7 playerClient];

    if (v8)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C6EDC;
      block[3] = &unk_1004159B8;
      block[4] = self;
      id v11 = v6;
      id v12 = v7;
      dispatch_async((dispatch_queue_t)queue, block);
    }
  }
}

- (void)_handlePlaybackQueueCapabilitiesChanged:(id)a3
{
  id v4 = a3;
  if ([(MRDNowPlayingStateObserver *)self _shouldNotifyChange:v4])
  {
    v5 = [v4 userInfo];
    uint64_t v6 = MRGetPlayerPathFromUserInfo();

    id v7 = [(MRDNowPlayingServer *)self->_npServer queryExistingPlayerPath:v6];
    uint64_t v8 = [v7 playerClient];

    if (v8)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C7070;
      block[3] = &unk_1004159B8;
      block[4] = self;
      id v11 = v6;
      id v12 = v7;
      dispatch_async((dispatch_queue_t)queue, block);
    }
  }
}

- (void)_handleContentItemsChanged:(id)a3
{
  id v4 = a3;
  if ([(MRDNowPlayingStateObserver *)self _shouldNotifyChange:v4])
  {
    v5 = [v4 userInfo];
    uint64_t v6 = MRGetPlayerPathFromUserInfo();

    id v7 = [(MRDNowPlayingServer *)self->_npServer queryExistingPlayerPath:v6];
    uint64_t v8 = [v7 playerClient];

    if (v8)
    {
      v9 = [v4 userInfo];
      v10 = MRGetContentItemsFromUserInfo();

      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C7220;
      block[3] = &unk_1004159B8;
      block[4] = self;
      id v14 = v6;
      id v15 = v10;
      id v12 = v10;
      dispatch_async((dispatch_queue_t)queue, block);
    }
  }
}

- (void)_handleContentItemArtworkChanged:(id)a3
{
  id v4 = a3;
  if ([(MRDNowPlayingStateObserver *)self _shouldNotifyChange:v4])
  {
    v5 = [v4 userInfo];
    uint64_t v6 = MRGetPlayerPathFromUserInfo();

    id v7 = [(MRDNowPlayingServer *)self->_npServer queryExistingPlayerPath:v6];
    uint64_t v8 = [v7 playerClient];

    if (v8)
    {
      v9 = [v4 userInfo];
      v10 = MRGetContentItemsFromUserInfo();

      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C73B8;
      block[3] = &unk_1004159B8;
      block[4] = self;
      id v14 = v6;
      id v15 = v10;
      id v12 = v10;
      dispatch_async((dispatch_queue_t)queue, block);
    }
  }
}

- (void)_handlePlayerStateChanged:(id)a3
{
  id v4 = a3;
  if ([(MRDNowPlayingStateObserver *)self _shouldNotifyChange:v4])
  {
    v5 = [v4 userInfo];
    uint64_t v6 = MRGetPlayerPathFromUserInfo();

    id v7 = [(MRDNowPlayingServer *)self->_npServer queryExistingPlayerPath:v6];
    uint64_t v8 = [v7 playerClient];

    if (v8)
    {
      queue = self->_queue;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000C751C;
      v10[3] = &unk_1004158D8;
      v10[4] = self;
      id v11 = v6;
      dispatch_async((dispatch_queue_t)queue, v10);
    }
  }
}

- (void)_handleRemovePlayer:(id)a3
{
  id v4 = a3;
  if ([(MRDNowPlayingStateObserver *)self _shouldNotifyChange:v4])
  {
    v5 = [v4 userInfo];
    uint64_t v6 = MRGetPlayerPathFromUserInfo();

    id v7 = [(MRDNowPlayingServer *)self->_npServer queryExistingPlayerPath:v6];
    uint64_t v8 = [v7 playerClient];

    if (v8)
    {
      queue = self->_queue;
      id v12 = _NSConcreteStackBlock;
      uint64_t v13 = 3221225472;
      id v14 = sub_1000C76B0;
      id v15 = &unk_1004158D8;
      objc_super v16 = self;
      id v10 = v6;
      id v17 = v10;
      dispatch_async((dispatch_queue_t)queue, &v12);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "stateObserver:didReceivePlayerDidUnregister:", self, v10, v12, v13, v14, v15, v16);
    }
  }
}

- (void)_setReceiveUpdates:(BOOL)a3 forSource:(int64_t)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C7738;
  block[3] = &unk_10041B540;
  block[4] = self;
  void block[5] = a4;
  BOOL v6 = a3;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)_onQueue_setReceiveNowPlayingUpdates:(BOOL)a3
{
  unsigned int registeredForNowPlayingCount = self->_registeredForNowPlayingCount;
  if (a3)
  {
    self->_unsigned int registeredForNowPlayingCount = registeredForNowPlayingCount + 1;
    if (!registeredForNowPlayingCount)
    {
      v5 = _MRLogForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingStateObserver] Registering for Now Playing Updates", buf, 2u);
      }

      [(MRDNowPlayingStateObserver *)self _addNowPlayingNotification:kMRMediaRemoteOriginNowPlayingApplicationDidChangeNotification selector:"_handleNowPlayingClientDidChange:"];
      [(MRDNowPlayingStateObserver *)self _addNowPlayingNotification:kMRMediaRemoteActivePlayerDidChange selector:"_handleNowPlayingPlayerDidChange:"];
      [(MRDNowPlayingStateObserver *)self _addNowPlayingNotification:kMRMediaRemotePlayerSupportedCommandsDidChangeNotification selector:"_handleSupportedCommandsDidChange:"];
      [(MRDNowPlayingStateObserver *)self _addNowPlayingNotification:kMRMediaRemotePlayerPlaybackStateDidChangeNotification selector:"_handleNowPlayingPlaybackStateChanged:"];
      [(MRDNowPlayingStateObserver *)self _addNowPlayingNotification:kMRPlayerPlaybackQueueChangedNotification selector:"_handlePlaybackQueueChanged:"];
      [(MRDNowPlayingStateObserver *)self _addNowPlayingNotification:kMRPlaybackQueueCapabilitiesChangedNotification selector:"_handlePlaybackQueueCapabilitiesChanged:"];
      [(MRDNowPlayingStateObserver *)self _addNowPlayingNotification:kMRPlayerPlaybackQueueContentItemsChangedNotification selector:"_handleContentItemsChanged:"];
      [(MRDNowPlayingStateObserver *)self _addNowPlayingNotification:kMRPlayerPlaybackQueueContentItemArtworkChangedNotification selector:"_handleContentItemArtworkChanged:"];
      [(MRDNowPlayingStateObserver *)self _addNowPlayingNotification:kMRMediaRemoteApplicationClientStateDidChange selector:"_handleApplicationClientStateChanged:"];
      [(MRDNowPlayingStateObserver *)self _addNowPlayingNotification:kMRMediaRemotePlayerStateDidChange selector:"_handlePlayerStateChanged:"];
      [(MRDNowPlayingStateObserver *)self _addNowPlayingNotification:kMRMediaRemoteNowPlayingApplicationDidUnregister selector:"_handleRemoveClient:"];
      [(MRDNowPlayingStateObserver *)self _addNowPlayingNotification:kMRMediaRemoteNowPlayingPlayerDidUnregister selector:"_handleRemovePlayer:"];
      [(MRDNowPlayingStateObserver *)self _addNowPlayingNotification:_MRMediaRemoteDefaultSupportedCommandsDidChangeNotification selector:"_handleDefaultSupportedCommandsChanged:"];
    }
  }
  else
  {
    BOOL v6 = registeredForNowPlayingCount != 0;
    unsigned int v8 = registeredForNowPlayingCount - 1;
    BOOL v7 = v8 != 0 && v6;
    if (!v6) {
      unsigned int v8 = 0;
    }
    self->_unsigned int registeredForNowPlayingCount = v8;
    if (!v7)
    {
      [(MRDNowPlayingStateObserver *)self _removeNowPlayingNotifications];
      v9 = _MRLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingStateObserver] Unregistering for Now Playing Updates", v10, 2u);
      }
    }
  }
}

- (void)_onQueue_setReceiveVolumeControlUpdates:(BOOL)a3
{
  unsigned int registeredForVolumeAvailabilityCount = self->_registeredForVolumeAvailabilityCount;
  if (a3)
  {
    self->_unsigned int registeredForVolumeAvailabilityCount = registeredForVolumeAvailabilityCount + 1;
    if (!registeredForVolumeAvailabilityCount)
    {
      v5 = _MRLogForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingStateObserver] Registering for volume control updates", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      BOOL v6 = +[NSNotificationCenter defaultCenter];
      uint64_t v7 = kMRMediaRemotePickedRouteVolumeControlAvailabilityDidChangeNotification;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000C7BB4;
      v15[3] = &unk_100418620;
      objc_copyWeak(&v16, buf);
      unsigned int v8 = [v6 addObserverForName:v7 object:0 queue:0 usingBlock:v15];
      id observedVolumeControlNotificationToken = self->_observedVolumeControlNotificationToken;
      self->_id observedVolumeControlNotificationToken = v8;

      objc_destroyWeak(&v16);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    BOOL v10 = registeredForVolumeAvailabilityCount != 0;
    unsigned int v12 = registeredForVolumeAvailabilityCount - 1;
    BOOL v11 = v12 != 0 && v10;
    if (!v10) {
      unsigned int v12 = 0;
    }
    self->_unsigned int registeredForVolumeAvailabilityCount = v12;
    if (!v11 && self->_observedVolumeControlNotificationToken)
    {
      uint64_t v13 = +[NSNotificationCenter defaultCenter];
      [v13 removeObserver:self->_observedVolumeControlNotificationToken];

      id v14 = _MRLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingStateObserver] Unregistering for volume control updates", (uint8_t *)buf, 2u);
      }
    }
  }
}

- (void)_addNowPlayingNotification:(id)a3 selector:(SEL)a4
{
  id v7 = a3;
  BOOL v6 = +[NSNotificationCenter defaultCenter];
  if (([(NSMutableArray *)self->_observedNowPlayingNotifications containsObject:v7] & 1) == 0)
  {
    [v6 addObserver:self selector:a4 name:v7 object:0];
    [(NSMutableArray *)self->_observedNowPlayingNotifications addObject:v7];
  }
}

- (void)_removeNowPlayingNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_observedNowPlayingNotifications;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      unsigned int v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "removeObserver:name:object:", self, *(void *)(*((void *)&v9 + 1) + 8 * (void)v8), 0, (void)v9);
        unsigned int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_observedNowPlayingNotifications removeAllObjects];
}

- (id)_onQueue_stateForPlayerPath:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(NSMutableDictionary *)self->_coalescingStates objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = +[MRUserSettings currentSettings];
    [v6 nowPlayingObserverCoalesceInterval];
    double v8 = v7;

    long long v9 = +[MRUserSettings currentSettings];
    unsigned int v10 = [v9 verboseNowPlayingStateObserver];

    if (v10)
    {
      long long v11 = _MRLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v23 = v4;
        __int16 v24 = 2048;
        double v25 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingStateObserver] Begin Coalescing for %@ for %lf seconds", buf, 0x16u);
      }
    }
    id v5 = [[MRDNowPlayingObserverState alloc] initWithPlayerPath:v4];
    dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    queue = self->_queue;
    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_1000C7FD8;
    v19 = &unk_1004158D8;
    v20 = self;
    id v14 = v4;
    id v21 = v14;
    dispatch_after(v12, (dispatch_queue_t)queue, &v16);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_coalescingStates, "setObject:forKeyedSubscript:", v5, v14, v16, v17, v18, v19, v20);
  }

  return v5;
}

- (void)_onQueue_notifyCoalescedPlayerPath:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_coalescingStates objectForKeyedSubscript:v4];
  if (v5)
  {
    id v6 = +[MRUserSettings currentSettings];
    unsigned int v7 = [v6 verboseNowPlayingStateObserver];

    if (v7)
    {
      double v8 = _MRLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = v5;
        __int16 v15 = 2112;
        id v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingStateObserver] End Coalescing %@ for %@", buf, 0x16u);
      }
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C8180;
    block[3] = &unk_1004159B8;
    block[4] = self;
    id v11 = v5;
    id v9 = v4;
    id v12 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    [(NSMutableDictionary *)self->_coalescingStates setObject:0 forKeyedSubscript:v9];
  }
}

- (MRDNowPlayingStateObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDNowPlayingStateObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)wantsCoalescedStateChanged
{
  return self->_wantsCoalescedStateChanged;
}

- (NSMutableDictionary)coalescingStates
{
  return self->_coalescingStates;
}

- (void)setCoalescingStates:(id)a3
{
}

- (MRDNowPlayingServer)npServer
{
  return self->_npServer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_npServer, 0);
  objc_storeStrong((id *)&self->_coalescingStates, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_observedVolumeControlNotificationToken, 0);
  objc_storeStrong((id *)&self->_observedNowPlayingNotifications, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end