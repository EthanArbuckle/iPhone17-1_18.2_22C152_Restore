@interface MRDProximityController
- (BOOL)hasTriggered;
- (BOOL)invalidated;
- (BOOL)shouldRun;
- (MRDDisplayMonitor)displayMonitor;
- (MRDLockScreenRoutingControllerDataSource)dataSource;
- (MRDProximityController)init;
- (NSDate)mediaSuggestionDate;
- (NSMutableSet)nearbyDevices;
- (NSString)mediaSuggestionDeviceID;
- (OS_dispatch_queue)queue;
- (PCLockscreenControlsObserver)observer;
- (id)_configurationForUID:(id)a3;
- (void)_configureObserver;
- (void)_handleElectedPlayerDidChangeNotification:(id)a3;
- (void)_handleLayoutDidChangeNotification:(id)a3;
- (void)_onQueue_reevaluateRemoteControlState;
- (void)setDataSource:(id)a3;
- (void)setDisplayMonitor:(id)a3;
- (void)setHasTriggered:(BOOL)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setMediaSuggestionDate:(id)a3;
- (void)setMediaSuggestionDeviceID:(id)a3;
- (void)setNearbyDevices:(id)a3;
- (void)setObserver:(id)a3;
- (void)setQueue:(id)a3;
- (void)setShouldRun:(BOOL)a3;
- (void)startObservationIfNeeded;
@end

@implementation MRDProximityController

- (MRDProximityController)init
{
  v13.receiver = self;
  v13.super_class = (Class)MRDProximityController;
  v2 = [(MRDProximityController *)&v13 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MediaRemote.ProximityController", v3);
    v5 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v4;

    *(_WORD *)(v2 + 9) = 256;
    uint64_t v6 = +[MRDDisplayMonitor sharedMonitor];
    v7 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v6;

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"_handleLayoutDidChangeNotification:" name:@"MRDisplayMonitorLayoutDidChangeNotification" object:*((void *)v2 + 6)];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"_handleElectedPlayerDidChangeNotification:" name:kMRMediaRemoteElectedPlayerDidChangeNotification object:0];

    uint64_t v10 = +[NSMutableSet set];
    v11 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v10;

    [v2 startObservationIfNeeded];
  }
  return (MRDProximityController *)v2;
}

- (void)setMediaSuggestionDeviceID:(id)a3
{
  dispatch_queue_t v4 = (NSString *)a3;
  v5 = self->_mediaSuggestionDeviceID;
  if (v5 == v4)
  {
  }
  else
  {
    uint64_t v6 = v5;
    unsigned __int8 v7 = [(NSString *)v5 isEqual:v4];

    if ((v7 & 1) == 0)
    {
      v8 = (NSString *)[(NSString *)v4 copy];
      mediaSuggestionDeviceID = self->_mediaSuggestionDeviceID;
      self->_mediaSuggestionDeviceID = v8;

      uint64_t v10 = +[NSDate now];
      mediaSuggestionDate = self->_mediaSuggestionDate;
      self->_mediaSuggestionDate = v10;

      v12 = _MRLogForCategory();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v4)
      {
        if (v13)
        {
          int v19 = 138412290;
          v20 = v4;
          v14 = "[ProximityController] Found device for media suggestions: %@";
          v15 = v12;
          uint32_t v16 = 12;
LABEL_9:
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, v16);
        }
      }
      else if (v13)
      {
        LOWORD(v19) = 0;
        v14 = "[ProximityController] Lost device for media suggestions";
        v15 = v12;
        uint32_t v16 = 2;
        goto LABEL_9;
      }

      id v17 = objc_alloc_init((Class)NSMutableDictionary);
      [v17 setObject:v4 forKeyedSubscript:kMRAVEndpointOutputDeviceIdentifierUserInfoKey];
      v18 = +[MRDMediaRemoteServer server];
      [v18 postClientNotificationNamed:_MRMediaRemoteDeviceAvailableForMediaSuggestionsNotification userInfo:v17];

      notify_post("com.apple.mediaremote.mediaSuggestionsElectedDeviceDidChange");
    }
  }
}

- (void)startObservationIfNeeded
{
  v3 = [(MRDProximityController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007DED4;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_configureObserver
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(off_1004762F0());
  [(MRDProximityController *)self setObserver:v3];

  dispatch_queue_t v4 = [(MRDProximityController *)self queue];
  v5 = [(MRDProximityController *)self observer];
  [v5 setDispatchQueue:v4];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10007E1E4;
  v16[3] = &unk_100416C60;
  objc_copyWeak(&v17, &location);
  uint64_t v6 = [(MRDProximityController *)self observer];
  [v6 setDeviceLost:v16];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007E348;
  v14[3] = &unk_100416C60;
  objc_copyWeak(&v15, &location);
  unsigned __int8 v7 = [(MRDProximityController *)self observer];
  [v7 setDeviceUpdated:v14];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007E4AC;
  v12[3] = &unk_100416C88;
  objc_copyWeak(&v13, &location);
  v8 = [(MRDProximityController *)self observer];
  [v8 setInvalidationHandler:v12];

  v9 = [(MRDProximityController *)self observer];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007E530;
  v10[3] = &unk_100416C88;
  objc_copyWeak(&v11, &location);
  [v9 activateWithCompletion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_onQueue_reevaluateRemoteControlState
{
  id v3 = [(MRDProximityController *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(MRDProximityController *)self shouldRun])
  {
    if (![(MRDProximityController *)self hasTriggered])
    {
      dispatch_queue_t v4 = [(MRDProximityController *)self observer];
      v5 = [v4 knownDevices];
      id v6 = [v5 count];

      if (v6)
      {
        unsigned __int8 v7 = [(MRDProximityController *)self observer];
        v8 = [v7 knownDevices];
        v9 = [v8 sortedArrayUsingComparator:&stru_100418F18];

        uint64_t v10 = objc_msgSend(v9, "mr_compactMap:", &stru_100418F38);
        id v11 = [(MRDProximityController *)self dataSource];
        unsigned int v12 = [v11 hasElectedPlayer];

        if (v12)
        {
          id v13 = _MRLogForCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[ProximityController] Maintaining proactive device because lock screen platter is active.", buf, 2u);
          }
        }
        else
        {
          v14 = self;
          id v15 = +[NSMutableSet set];
          id v13 = dispatch_group_create();
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          v26 = v10;
          id obj = v10;
          id v16 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v36;
            do
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v36 != v18) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v20 = *(void *)(*((void *)&v35 + 1) + 8 * i);
                dispatch_group_enter(v13);
                id v21 = objc_alloc((Class)MRNowPlayingController);
                v22 = [(MRDProximityController *)v14 _configurationForUID:v20];
                id v23 = [v21 initWithConfiguration:v22];

                v32[0] = _NSConcreteStackBlock;
                v32[1] = 3221225472;
                v32[2] = sub_10007EA3C;
                v32[3] = &unk_100418F60;
                v32[4] = v20;
                id v33 = v15;
                v34 = v13;
                [v23 performRequestWithCompletion:v32];
              }
              id v17 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
            }
            while (v17);
          }

          v24 = [(MRDProximityController *)v14 queue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10007EB04;
          block[3] = &unk_1004162F8;
          block[4] = v14;
          id v29 = obj;
          id v30 = v15;
          id v31 = v9;
          id v25 = v15;
          dispatch_group_notify(v13, v24, block);

          uint64_t v10 = v26;
        }
      }
    }
  }
}

- (id)_configurationForUID:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)MRDestination) initWithOutputDeviceUID:v3];
  id v5 = [objc_alloc((Class)MRNowPlayingControllerConfiguration) initWithDestination:v4];
  [v5 setRequestPlaybackState:1];
  [v5 setRequestPlaybackQueue:0];
  [v5 setRequestClientProperties:0];
  [v5 setRequestSupportedCommands:0];
  [v5 setRequestLastPlayingDate:0];
  id v6 = +[NSString stringWithFormat:@"ProximityController(%@)", v3];

  [v5 setLabel:v6];

  return v5;
}

- (void)_handleLayoutDidChangeNotification:(id)a3
{
  id v4 = [(MRDProximityController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007F24C;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_handleElectedPlayerDidChangeNotification:(id)a3
{
  id v4 = [(MRDProximityController *)self dataSource];
  unsigned int v5 = [v4 hasElectedPlayer];

  if (v5)
  {
    [(MRDProximityController *)self setMediaSuggestionDeviceID:0];
  }
}

- (MRDLockScreenRoutingControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (MRDLockScreenRoutingControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (PCLockscreenControlsObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableSet)nearbyDevices
{
  return self->_nearbyDevices;
}

- (void)setNearbyDevices:(id)a3
{
}

- (BOOL)hasTriggered
{
  return self->_hasTriggered;
}

- (void)setHasTriggered:(BOOL)a3
{
  self->_hasTriggered = a3;
}

- (BOOL)shouldRun
{
  return self->_shouldRun;
}

- (void)setShouldRun:(BOOL)a3
{
  self->_shouldRun = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (MRDDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
}

- (NSString)mediaSuggestionDeviceID
{
  return self->_mediaSuggestionDeviceID;
}

- (NSDate)mediaSuggestionDate
{
  return self->_mediaSuggestionDate;
}

- (void)setMediaSuggestionDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSuggestionDate, 0);
  objc_storeStrong((id *)&self->_mediaSuggestionDeviceID, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_nearbyDevices, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observer, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end