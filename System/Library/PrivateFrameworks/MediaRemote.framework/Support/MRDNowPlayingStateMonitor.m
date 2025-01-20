@interface MRDNowPlayingStateMonitor
- (MRDNowPlayingStateMonitor)initWithDelegate:(id)a3;
- (MRDNowPlayingStateMonitorDelegate)delegate;
- (MRNowPlayingController)aseNowPlayingController;
- (MRNowPlayingController)localNowPlayingController;
- (NSMutableDictionary)lastPlaybackStates;
- (NSString)nowPlayingApp;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (unsigned)onQueue_lastPlaybackStateForEndpoint:(id)a3;
- (void)_configureNowPlayingController:(id)a3;
- (void)controller:(id)a3 didFailWithError:(id)a4;
- (void)controller:(id)a3 didLoadResponse:(id)a4;
- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5;
- (void)onQueue_controller:(id)a3 didLoadResponse:(id)a4 retry:(BOOL)a5;
- (void)onQueue_setLastPlaybackState:(unsigned int)a3 bundleIdentifier:(id)a4 forEndpoint:(id)a5;
- (void)setAseNowPlayingController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setLastPlaybackStates:(id)a3;
- (void)setLocalNowPlayingController:(id)a3;
- (void)setQueue:(id)a3;
- (void)setup;
@end

@implementation MRDNowPlayingStateMonitor

- (MRDNowPlayingStateMonitor)initWithDelegate:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRDNowPlayingStateMonitor;
  v5 = [(MRDNowPlayingStateMonitor *)&v14 init];
  if (v5)
  {
    v6 = +[MRNowPlayingController userSelectedEndpointController];
    [(MRDNowPlayingStateMonitor *)v5 setAseNowPlayingController:v6];

    v7 = +[MRNowPlayingController localRouteController];
    [(MRDNowPlayingStateMonitor *)v5 setLocalNowPlayingController:v7];

    [(MRDNowPlayingStateMonitor *)v5 setDelegate:v4];
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.mediaremote.NowPlayingStateMonitor", v8);
    [(MRDNowPlayingStateMonitor *)v5 setQueue:v9];

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.mediaremote.NowPlayingStateMonitor.delegateQueue", v10);
    [(MRDNowPlayingStateMonitor *)v5 setDelegateQueue:v11];

    id v12 = objc_alloc_init((Class)NSMutableDictionary);
    [(MRDNowPlayingStateMonitor *)v5 setLastPlaybackStates:v12];

    [(MRDNowPlayingStateMonitor *)v5 setup];
  }

  return v5;
}

- (void)setup
{
  v3 = [(MRDNowPlayingStateMonitor *)self aseNowPlayingController];
  [(MRDNowPlayingStateMonitor *)self _configureNowPlayingController:v3];

  id v4 = [(MRDNowPlayingStateMonitor *)self localNowPlayingController];
  [(MRDNowPlayingStateMonitor *)self _configureNowPlayingController:v4];
}

- (void)_configureNowPlayingController:(id)a3
{
  id v9 = a3;
  id v4 = [v9 configuration];
  [v4 setRequestPlaybackState:1];

  v5 = [v9 configuration];
  [v5 setRequestClientProperties:1];

  v6 = [v9 configuration];
  [v6 setRequestPlaybackQueue:0];

  v7 = [v9 configuration];
  [v7 setRequestSupportedCommands:0];

  v8 = [v9 configuration];
  [v8 setRequestLastPlayingDate:0];

  [v9 setDelegate:self];
  [v9 beginLoadingUpdates];
}

- (unsigned)onQueue_lastPlaybackStateForEndpoint:(id)a3
{
  id v4 = a3;
  v5 = [(MRDNowPlayingStateMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [v4 uniqueIdentifier];
  if (v6)
  {
    v7 = [(MRDNowPlayingStateMonitor *)self lastPlaybackStates];
    v8 = [v4 uniqueIdentifier];
    id v9 = [v7 objectForKeyedSubscript:v8];
  }
  else
  {
    id v9 = 0;
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v10 = [v9 unsignedIntValue];
  }
  else {
    unsigned int v10 = 0;
  }

  return v10;
}

- (void)onQueue_setLastPlaybackState:(unsigned int)a3 bundleIdentifier:(id)a4 forEndpoint:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  v8 = a4;
  id v9 = (MRDNowPlayingStateMonitor *)a5;
  unsigned int v10 = [(MRDNowPlayingStateMonitor *)v9 uniqueIdentifier];

  if (v10)
  {
    dispatch_queue_t v11 = [(MRDNowPlayingStateMonitor *)self queue];
    dispatch_assert_queue_V2(v11);

    unsigned int v12 = [(MRDNowPlayingStateMonitor *)self onQueue_lastPlaybackStateForEndpoint:v9];
    v13 = +[NSNumber numberWithUnsignedInt:v6];
    objc_super v14 = [(MRDNowPlayingStateMonitor *)self lastPlaybackStates];
    v15 = [(MRDNowPlayingStateMonitor *)v9 uniqueIdentifier];
    [v14 setObject:v13 forKeyedSubscript:v15];

    if (v12 != v6)
    {
      v16 = _MRLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (MRDNowPlayingStateMonitor *)MRMediaRemoteCopyPlaybackStateDescription();
        v18 = (void *)MRMediaRemoteCopyPlaybackStateDescription();
        *(_DWORD *)buf = 138412802;
        v39 = v9;
        __int16 v40 = 2112;
        v41 = v17;
        __int16 v42 = 2112;
        v43 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[MRDRRC].NPM updated stored playback state for %@ from %@ to %@", buf, 0x20u);
      }
    }
    if ((v6 - 2) >= 2)
    {
      if (v6 == 1)
      {
        BOOL v19 = 1;
        uint64_t v20 = 1;
      }
      else
      {
        BOOL v19 = 0;
        uint64_t v20 = 0;
      }
    }
    else
    {
      BOOL v19 = v12 == 1;
      uint64_t v20 = 2 * (v12 == 1);
    }
    v21 = +[MRSystemMediaBundles systemMediaBundleIDForBundleID:v8 type:1];
    v23 = +[MRIRRoute routeWithEndpoint:v9];
    v24 = _MRLogForCategory();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v12 == v6 || !v19)
    {
      if (v25)
      {
        v31 = (MRDNowPlayingStateMonitor *)MRMediaRemoteCopyPlaybackStateDescription();
        v32 = (void *)MRMediaRemoteCopyPlaybackStateDescription();
        *(_DWORD *)buf = 138413058;
        v39 = v9;
        __int16 v40 = 2112;
        v41 = v31;
        __int16 v42 = 2112;
        v43 = v32;
        __int16 v44 = 2112;
        v45 = v8;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[MRDRRC].NPM Not publishing event, endpoint: %@, storedPreviousState: %@, currentState: %@, bundleIdentifier: %@", buf, 0x2Au);
      }
    }
    else
    {
      if (v25)
      {
        v26 = (MRDNowPlayingStateMonitor *)MRMediaRemoteCopyPlaybackStateDescription();
        v27 = (void *)MRMediaRemoteCopyPlaybackStateDescription();
        *(_DWORD *)buf = 138413570;
        v39 = v9;
        __int16 v40 = 2112;
        v41 = v26;
        __int16 v42 = 2112;
        v43 = v27;
        __int16 v44 = 2112;
        v45 = v21;
        __int16 v46 = 2112;
        v47 = v8;
        __int16 v48 = 2048;
        uint64_t v49 = v20;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[MRDRRC].NPM Publishing event, endpoint: %@, storedPreviousState: %@, currentState: %@, bundleIdentifier: %@ (was %@), event: %ld", buf, 0x3Eu);
      }
      v28 = [(MRDNowPlayingStateMonitor *)self delegate];
      char v29 = objc_opt_respondsToSelector();

      if (v29)
      {
        v30 = [(MRDNowPlayingStateMonitor *)self delegateQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100166A94;
        block[3] = &unk_10041E658;
        block[4] = self;
        id v34 = v23;
        v35 = v9;
        v36 = v21;
        uint64_t v37 = v20;
        dispatch_async(v30, block);
      }
    }
  }
  else
  {
    v21 = _MRLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [(MRDNowPlayingStateMonitor *)v9 uniqueIdentifier];
      *(_DWORD *)buf = 138412802;
      v39 = self;
      __int16 v40 = 2112;
      v41 = v9;
      __int16 v42 = 2112;
      v43 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[MRDRRC].NPM %@ - endpoint ID is nil, ignoring - %@ (%@)", buf, 0x20u);
    }
  }
}

- (void)controller:(id)a3 didFailWithError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = _MRLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[MRDRRC].NPM controller: %@ didFailWithError: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)controller:(id)a3 didLoadResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[MRDRRC].NPM controller: %@ didLoadResponse: %@", buf, 0x16u);
  }

  id v9 = [(MRDNowPlayingStateMonitor *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100166D24;
  block[3] = &unk_1004159B8;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)onQueue_controller:(id)a3 didLoadResponse:(id)a4 retry:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(MRDNowPlayingStateMonitor *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = [v9 destination];
  uint64_t v12 = [v11 endpoint];
  if (v12)
  {
    id v13 = v12;

LABEL_4:
    unsigned int v15 = [(MRDNowPlayingStateMonitor *)self onQueue_lastPlaybackStateForEndpoint:v13];
    id v16 = [v9 playbackState];
    __int16 v17 = [v8 destination];
    id v18 = [v17 client];
    BOOL v19 = [v18 representedBundleID];

    if (v15 != v16)
    {
      uint64_t v20 = _MRLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (void *)MRMediaRemoteCopyPlaybackStateDescription();
        v22 = (void *)MRMediaRemoteCopyPlaybackStateDescription();
        *(_DWORD *)buf = 138412802;
        v32 = (MRDNowPlayingStateMonitor *)v13;
        __int16 v33 = 2112;
        id v34 = v21;
        __int16 v35 = 2112;
        v36 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[MRDRRC].NPM updating stored playback state for %@ from %@ to %@", buf, 0x20u);
      }
      [(MRDNowPlayingStateMonitor *)self onQueue_setLastPlaybackState:v16 bundleIdentifier:v19 forEndpoint:v13];
    }

LABEL_9:
    goto LABEL_10;
  }
  id v14 = [v8 destination];
  id v13 = [v14 endpoint];

  if (v13) {
    goto LABEL_4;
  }
  id v13 = _MRLogForCategory();
  BOOL v23 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v23)
    {
      v27 = [v8 destination];
      *(_DWORD *)buf = 138413058;
      v32 = self;
      __int16 v33 = 2112;
      id v34 = v8;
      __int16 v35 = 2112;
      v36 = v27;
      __int16 v37 = 2112;
      id v38 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[MRDRRC].NPM %@ - endpoint is nil, ignoring - %@ (%@), response: %@", buf, 0x2Au);
    }
    goto LABEL_9;
  }
  if (v23)
  {
    v24 = [v8 destination];
    *(_DWORD *)buf = 138413058;
    v32 = self;
    __int16 v33 = 2112;
    id v34 = v8;
    __int16 v35 = 2112;
    v36 = v24;
    __int16 v37 = 2112;
    id v38 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[MRDRRC].NPM %@ - endpoint is nil, will retry in 3 seconds - %@ (%@), response: %@", buf, 0x2Au);
  }
  dispatch_time_t v25 = dispatch_time(0, 3000000000);
  v26 = [(MRDNowPlayingStateMonitor *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001670C4;
  block[3] = &unk_1004159B8;
  block[4] = self;
  id v29 = v8;
  id v30 = v9;
  dispatch_after(v25, v26, block);

LABEL_10:
}

- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5
{
  id v8 = a3;
  id v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 1024;
    unsigned int v21 = a4;
    __int16 v22 = 1024;
    unsigned int v23 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[MRDRRC].NPM controller: %p %@ playbackStateDidChangeFrom: %d to: %d", buf, 0x22u);
  }

  id v10 = [(MRDNowPlayingStateMonitor *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016732C;
  block[3] = &unk_1004176F8;
  id v13 = v8;
  id v14 = self;
  unsigned int v15 = a5;
  id v11 = v8;
  dispatch_async(v10, block);
}

- (NSString)nowPlayingApp
{
  v2 = [(MRDNowPlayingStateMonitor *)self aseNowPlayingController];
  v3 = [v2 response];
  id v4 = [v3 playerPath];
  BOOL v5 = [v4 client];
  id v6 = [v5 representedBundleID];

  return (NSString *)v6;
}

- (MRNowPlayingController)aseNowPlayingController
{
  return self->_aseNowPlayingController;
}

- (void)setAseNowPlayingController:(id)a3
{
}

- (MRNowPlayingController)localNowPlayingController
{
  return self->_localNowPlayingController;
}

- (void)setLocalNowPlayingController:(id)a3
{
}

- (MRDNowPlayingStateMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDNowPlayingStateMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (NSMutableDictionary)lastPlaybackStates
{
  return self->_lastPlaybackStates;
}

- (void)setLastPlaybackStates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPlaybackStates, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_localNowPlayingController, 0);

  objc_storeStrong((id *)&self->_aseNowPlayingController, 0);
}

@end