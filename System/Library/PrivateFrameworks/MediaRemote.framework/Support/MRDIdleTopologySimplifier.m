@interface MRDIdleTopologySimplifier
- (BOOL)isMultiplayerHost;
- (MRDIdleTopologySimplifier)init;
- (NSMutableDictionary)playbackTimers;
- (double)recentlyPlayingInterval;
- (double)timeSincePlayingForPlayerPath:(id)a3;
- (id)lastPlayingDateForPlayerPath:(id)a3;
- (id)localDeviceUID;
- (unsigned)playbackStateForPlayerPath:(id)a3;
- (void)_handleIsPlayingDidChangeNotification:(id)a3;
- (void)_initialize;
- (void)_onQueue_adjustPlaybackTimerIfNeededForPlayerPath:(id)a3;
- (void)_onQueue_simplifyToplogyOfPlayerPathIfNeeded:(id)a3;
- (void)dealloc;
- (void)registerForChanges;
- (void)setPlaybackTimers:(id)a3;
- (void)unregisterForChanges;
@end

@implementation MRDIdleTopologySimplifier

- (MRDIdleTopologySimplifier)init
{
  v13.receiver = self;
  v13.super_class = (Class)MRDIdleTopologySimplifier;
  v2 = [(MRDIdleTopologySimplifier *)&v13 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(Name, v5);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = +[NSMutableDictionary dictionary];
    playbackTimers = v2->_playbackTimers;
    v2->_playbackTimers = (NSMutableDictionary *)v8;

    v10 = +[MRUserSettings currentSettings];
    [v10 mediaRecentlyPlayedInterval];
    v2->_recentlyPlayingInterval = v11;

    [(MRDIdleTopologySimplifier *)v2 _initialize];
  }
  return v2;
}

- (void)_initialize
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDITS] <%p> Initializing", (uint8_t *)&v4, 0xCu);
  }

  [(MRDIdleTopologySimplifier *)self registerForChanges];
}

- (void)dealloc
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    dispatch_queue_t v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDITS] <%p> Deallocating.", buf, 0xCu);
  }

  [(MRDIdleTopologySimplifier *)self unregisterForChanges];
  v4.receiver = self;
  v4.super_class = (Class)MRDIdleTopologySimplifier;
  [(MRDIdleTopologySimplifier *)&v4 dealloc];
}

- (unsigned)playbackStateForPlayerPath:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[MRDMediaRemoteServer server];
  v5 = [v4 nowPlayingServer];
  dispatch_queue_t v6 = [v5 queryExistingPlayerPath:v3];

  v7 = [v6 playerClient];
  unsigned int v8 = [v7 playbackState];

  return v8;
}

- (id)lastPlayingDateForPlayerPath:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[MRDMediaRemoteServer server];
  v5 = [v4 nowPlayingServer];
  dispatch_queue_t v6 = [v5 queryExistingPlayerPath:v3];

  v7 = [v6 playerClient];
  unsigned int v8 = [v7 lastPlayingDate];

  return v8;
}

- (double)timeSincePlayingForPlayerPath:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[MRDMediaRemoteServer server];
  v5 = [v4 nowPlayingServer];
  dispatch_queue_t v6 = [v5 queryExistingPlayerPath:v3];

  v7 = [v6 playerClient];
  [v7 timeSincePlaying];
  double v9 = v8;

  return v9;
}

- (id)localDeviceUID
{
  v2 = (void *)MRMediaRemoteCopyDeviceUID();

  return v2;
}

- (BOOL)isMultiplayerHost
{
  v2 = +[MRUserSettings currentSettings];
  unsigned __int8 v3 = [v2 supportMultiplayerHost];

  return v3;
}

- (void)registerForChanges
{
  MRMediaRemoteSetWantsNowPlayingNotifications();
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_handleIsPlayingDidChangeNotification:" name:kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification object:0];
}

- (void)unregisterForChanges
{
  MRMediaRemoteSetWantsNowPlayingNotifications();
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)_handleIsPlayingDidChangeNotification:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10011E388;
  v7[3] = &unk_1004158D8;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)serialQueue, v7);
}

- (void)_onQueue_adjustPlaybackTimerIfNeededForPlayerPath:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  unsigned int v5 = [(MRDIdleTopologySimplifier *)self playbackStateForPlayerPath:v4];
  [(MRDIdleTopologySimplifier *)self timeSincePlayingForPlayerPath:v4];
  double v7 = v6;
  BOOL v8 = v5 == 1;
  double v9 = [(MRDIdleTopologySimplifier *)self playbackTimers];
  v10 = [v9 objectForKeyedSubscript:v4];

  if (v8)
  {
    if (v10)
    {
      double v11 = _MRLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_10032F968();
      }

      [v10 invalidate];
      v12 = [(MRDIdleTopologySimplifier *)self playbackTimers];
      [v12 setObject:0 forKeyedSubscript:v4];
LABEL_17:
    }
  }
  else if (!v10)
  {
    [(MRDIdleTopologySimplifier *)self recentlyPlayingInterval];
    double v14 = v13;
    v12 = [(MRDIdleTopologySimplifier *)self lastPlayingDateForPlayerPath:v4];
    v15 = +[NSDate distantPast];
    unsigned int v16 = [v12 isEqualToDate:v15];

    if (v16)
    {
      v17 = _MRLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_10032F9D0();
      }

      [(MRDIdleTopologySimplifier *)self recentlyPlayingInterval];
      double v19 = v18;
    }
    else
    {
      double v19 = v14 - v7;
    }
    if (v19 <= 0.0)
    {
      [(MRDIdleTopologySimplifier *)self _onQueue_simplifyToplogyOfPlayerPathIfNeeded:v4];
    }
    else
    {
      v20 = _MRLogForCategory();
      double v21 = v19 + 2.0;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)location = 134218498;
        *(void *)&location[4] = self;
        __int16 v33 = 2048;
        double v34 = v21;
        __int16 v35 = 2112;
        id v36 = v4;
        _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[MRDITS] <%p> Scheduling idle playback timer for %.2lf seconds - %@", location, 0x20u);
      }

      objc_initWeak((id *)location, self);
      serialQueue = self->_serialQueue;
      v26 = _NSConcreteStackBlock;
      uint64_t v27 = 3221225472;
      v28 = sub_10011E780;
      v29 = &unk_1004182A8;
      objc_copyWeak(&v31, (id *)location);
      id v23 = v4;
      id v30 = v23;
      v24 = +[MSVTimer timerWithInterval:0 repeats:serialQueue queue:&v26 block:v21];
      v25 = [(MRDIdleTopologySimplifier *)self playbackTimers];
      [v25 setObject:v24 forKeyedSubscript:v23];

      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)location);
    }
    goto LABEL_17;
  }
}

- (void)_onQueue_simplifyToplogyOfPlayerPathIfNeeded:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([(MRDIdleTopologySimplifier *)self isMultiplayerHost])
  {
    unsigned int v5 = [v4 origin];
    unsigned int v6 = [v5 isLocallyHosted];

    if (v6)
    {
      if ([(MRDIdleTopologySimplifier *)self playbackStateForPlayerPath:v4] == 1)
      {
        double v7 = _MRLogForCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          sub_10032FA38();
        }
      }
      else
      {
        double v7 = objc_alloc_init((Class)MRAVLightweightReconnaissanceSession);
        BOOL v8 = self->_serialQueue;
        double v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10011E9B8;
        v18[3] = &qword_1004199E0;
        id v19 = v4;
        serialQueue = self->_serialQueue;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10011EA1C;
        v14[3] = &unk_10041D750;
        v14[4] = self;
        id v15 = v19;
        id v16 = v10;
        v17 = v8;
        v12 = v8;
        id v13 = v10;
        [v7 searchEndpointsWithPredicate:v18 timeout:v13 reason:serialQueue queue:v14 completion:7.0];
      }
    }
  }
}

- (NSMutableDictionary)playbackTimers
{
  return self->_playbackTimers;
}

- (void)setPlaybackTimers:(id)a3
{
}

- (double)recentlyPlayingInterval
{
  return self->_recentlyPlayingInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackTimers, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end