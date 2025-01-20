@interface MRDConnectionLifetimeController
- (BOOL)containsLocalDevice;
- (BOOL)continuousPlaybackDetected;
- (BOOL)disconnected;
- (BOOL)hasDeferredDisconnectionDueToDeviceState;
- (BOOL)hasPlayedRecently;
- (BOOL)isMemberOfActiveSystemEndpoint;
- (BOOL)isPlaying;
- (MRDConnectionLifetimeController)initWithDataSource:(id)a3 delegate:(id)a4;
- (MRDConnectionLifetimeControllerDataSource)dataSource;
- (MRDConnectionLifetimeControllerDelegate)delegate;
- (MROrigin)origin;
- (MRTimer)continuousPlaybackDetectionTimer;
- (MRTimer)disconnectTimer;
- (MRTimer)playbackTimer;
- (NSString)maintainReason;
- (NSString)previousMaintainReason;
- (OS_dispatch_queue)queue;
- (double)continuousPlaybackDetectionInterval;
- (double)disconnectInterval;
- (double)recentlyPlayingInterval;
- (double)timeSincePlaybackStarted;
- (double)timeSincePlaying;
- (id)activeSystemEndpointUID;
- (id)debugDescription;
- (unint64_t)deviceState;
- (void)_adjustContinuousPlaybackDetectionTimerIfNeeded;
- (void)_adjustPlaybackTimerIfNeeded;
- (void)_handleActiveSystemEndpointChangedNotification:(id)a3;
- (void)_handleDeviceInfoDidChangeNotification:(id)a3;
- (void)_handleIsPlayingDidChangeNotification:(id)a3;
- (void)_handleLayoutDidChangeNotification:(id)a3;
- (void)_initialize;
- (void)dealloc;
- (void)disconnectOrigin:(id)a3;
- (void)evaluateShouldDisconnectWithReason:(id)a3;
- (void)registerForChanges;
- (void)setContinuousPlaybackDetectionTimer:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceState:(unint64_t)a3;
- (void)setDisconnectTimer:(id)a3;
- (void)setDisconnected:(BOOL)a3;
- (void)setHasDeferredDisconnectionDueToDeviceState:(BOOL)a3;
- (void)setMaintainReason:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setPlaybackTimer:(id)a3;
- (void)setPreviousMaintainReason:(id)a3;
- (void)unregisterForChanges;
@end

@implementation MRDConnectionLifetimeController

- (MRDConnectionLifetimeController)initWithDataSource:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)MRDConnectionLifetimeController;
  v8 = [(MRDConnectionLifetimeController *)&v28 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    v10 = [(MRDConnectionLifetimeController *)v9 dataSource];
    uint64_t v11 = [v10 origin];
    origin = v9->_origin;
    v9->_origin = (MROrigin *)v11;

    v13 = v9->_origin;
    if (!v13)
    {
      v26 = 0;
      goto LABEL_6;
    }
    v14 = [(MROrigin *)v13 displayName];
    v15 = +[NSString stringWithFormat:@"MRDConnectionLifetimeController-%@-%ld.queue", v14, (int)[(MROrigin *)v9->_origin identifier]];

    id v16 = v15;
    v17 = (const char *)[v16 UTF8String];
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = sub_1000CC948();
    dispatch_queue_t v20 = dispatch_queue_create_with_target_V2(v17, v18, v19);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v20;

    v22 = +[MRUserSettings currentSettings];
    [v22 remoteDeviceIdleDisconnectionInterval];
    v9->_disconnectInterval = v23;

    v24 = +[MRUserSettings currentSettings];
    [v24 mediaRecentlyPlayedInterval];
    v9->_recentlyPlayingInterval = v25;

    v9->_continuousPlaybackDetectionInterval = v9->_recentlyPlayingInterval * 30.0;
    [(MRDConnectionLifetimeController *)v9 _initialize];
  }
  v26 = v9;
LABEL_6:

  return v26;
}

- (void)_initialize
{
  v3 = [(MRDConnectionLifetimeController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CCC58;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)dealloc
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDCLC] <%p> Deallocating.", buf, 0xCu);
  }

  if (![(MRDConnectionLifetimeController *)self disconnected]) {
    [(MRDConnectionLifetimeController *)self unregisterForChanges];
  }
  v4.receiver = self;
  v4.super_class = (Class)MRDConnectionLifetimeController;
  [(MRDConnectionLifetimeController *)&v4 dealloc];
}

- (id)debugDescription
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  objc_super v4 = [(MRDConnectionLifetimeController *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000CCF48;
  v8[3] = &unk_1004158D8;
  id v5 = v3;
  id v9 = v5;
  v10 = self;
  dispatch_sync(v4, v8);

  id v6 = v5;
  return v6;
}

- (void)registerForChanges
{
  MRMediaRemoteSetWantsNowPlayingNotifications();
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_handleIsPlayingDidChangeNotification:" name:kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification object:0];

  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_handleDeviceInfoDidChangeNotification:" name:kMRDeviceInfoDidChangeNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_handleActiveSystemEndpointChangedNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];

  id v7 = +[NSNotificationCenter defaultCenter];
  id v6 = +[MRDDisplayMonitor sharedMonitor];
  [v7 addObserver:self selector:"_handleLayoutDidChangeNotification:" name:@"MRDisplayMonitorLayoutDidChangeNotification" object:v6];
}

- (void)unregisterForChanges
{
  MRMediaRemoteSetWantsNowPlayingNotifications();
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)evaluateShouldDisconnectWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDConnectionLifetimeController *)self queue];
  dispatch_assert_queue_V2(v5);

  if (![(MRDConnectionLifetimeController *)self disconnected])
  {
    id v6 = self->_origin;
    if (!v6)
    {
LABEL_33:

      goto LABEL_34;
    }
    id v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_super v28 = [(MROrigin *)v6 displayName];
      *(_DWORD *)buf = 134218754;
      v38 = self;
      __int16 v39 = 2112;
      v40 = v28;
      __int16 v41 = 2048;
      uint64_t v42 = (int)[(MROrigin *)v6 identifier];
      __int16 v43 = 2112;
      double v44 = *(double *)&v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MRDCLC] <%p> Re-evaluate for origin-%@-%ld because %@.", buf, 0x2Au);
    }
    if ([(MRDConnectionLifetimeController *)self isMemberOfActiveSystemEndpoint])
    {
      CFStringRef v8 = @"Device is part of UserSelected endpoint";
LABEL_7:
      id v9 = _MRLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v29 = [(MROrigin *)v6 displayName];
        signed int v30 = [(MROrigin *)v6 identifier];
        *(_DWORD *)buf = 134218754;
        v38 = self;
        __int16 v39 = 2112;
        v40 = v29;
        __int16 v41 = 2048;
        uint64_t v42 = v30;
        __int16 v43 = 2112;
        double v44 = *(double *)&v8;
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MRDCLC] <%p> Will maintain connection for origin-%@-%ld because %@.", buf, 0x2Au);
      }
      [(MRDConnectionLifetimeController *)self setHasDeferredDisconnectionDueToDeviceState:0];
      v10 = [(MRDConnectionLifetimeController *)self disconnectTimer];
      BOOL v11 = v10 == 0;

      if (!v11)
      {
        v12 = _MRLogForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = [(MROrigin *)v6 displayName];
          signed int v14 = [(MROrigin *)v6 identifier];
          *(_DWORD *)buf = 134218498;
          v38 = self;
          __int16 v39 = 2112;
          v40 = v13;
          __int16 v41 = 2048;
          uint64_t v42 = v14;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDCLC] <%p> Cancel scheduled disconnect for origin-%@-%ld.", buf, 0x20u);
        }
        v15 = [(MRDConnectionLifetimeController *)self disconnectTimer];
        [v15 invalidateWithReason:v8];

        [(MRDConnectionLifetimeController *)self setDisconnectTimer:0];
      }
LABEL_30:
      v26 = [(MRDConnectionLifetimeController *)self maintainReason];

      if (v26)
      {
        v27 = [(MRDConnectionLifetimeController *)self maintainReason];
        [(MRDConnectionLifetimeController *)self setPreviousMaintainReason:v27];
      }
      [(MRDConnectionLifetimeController *)self setMaintainReason:v8];
      goto LABEL_33;
    }
    if ([(MRDConnectionLifetimeController *)self isPlaying])
    {
      if (![(MRDConnectionLifetimeController *)self continuousPlaybackDetected])
      {
        CFStringRef v8 = @"Device is playing";
        goto LABEL_7;
      }
    }
    else
    {
      if ([(MRDConnectionLifetimeController *)self hasPlayedRecently])
      {
        CFStringRef v8 = @"Device played recently";
        goto LABEL_7;
      }
      if ([(MRDConnectionLifetimeController *)self containsLocalDevice])
      {
        CFStringRef v8 = @"Remote device is playing to local device";
        goto LABEL_7;
      }
    }
    if ([(MRDConnectionLifetimeController *)self hasDeferredDisconnectionDueToDeviceState])
    {
      if (![(MRDConnectionLifetimeController *)self deviceState]) {
        [(MRDConnectionLifetimeController *)self disconnectOrigin:v6];
      }
    }
    else
    {
      id v16 = [(MRDConnectionLifetimeController *)self disconnectTimer];
      BOOL v17 = v16 == 0;

      if (v17)
      {
        [(MRDConnectionLifetimeController *)self disconnectInterval];
        double v19 = v18;
        if ([(MRDConnectionLifetimeController *)self isPlaying]) {
          double v19 = v19 + v19;
        }
        dispatch_queue_t v20 = _MRLogForCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = [(MROrigin *)v6 displayName];
          signed int v22 = [(MROrigin *)v6 identifier];
          *(_DWORD *)buf = 134218754;
          v38 = self;
          __int16 v39 = 2112;
          v40 = v21;
          __int16 v41 = 2048;
          uint64_t v42 = v22;
          __int16 v43 = 2048;
          double v44 = v19;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[MRDCLC] <%p> Schedule disconnect for origin-%@-%ld in %.2lf seconds.", buf, 0x2Au);
        }
        objc_initWeak((id *)buf, self);
        id v23 = objc_alloc((Class)MRTimer);
        v24 = [(MRDConnectionLifetimeController *)self queue];
        v31 = _NSConcreteStackBlock;
        uint64_t v32 = 3221225472;
        v33 = sub_1000CD878;
        v34 = &unk_1004182A8;
        objc_copyWeak(&v36, (id *)buf);
        v35 = v6;
        id v25 = [v23 initWithInterval:@"CLC-disconnectTimer" name:v24 queue:&v31 block:v19];
        -[MRDConnectionLifetimeController setDisconnectTimer:](self, "setDisconnectTimer:", v25, v31, v32, v33, v34);

        objc_destroyWeak(&v36);
        objc_destroyWeak((id *)buf);
      }
    }
    CFStringRef v8 = 0;
    goto LABEL_30;
  }
LABEL_34:
}

- (void)disconnectOrigin:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDConnectionLifetimeController *)self queue];
  dispatch_assert_queue_V2(v5);

  [(MRDConnectionLifetimeController *)self setDisconnected:1];
  [(MRDConnectionLifetimeController *)self unregisterForChanges];
  id v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 displayName];
    int v9 = 134218498;
    v10 = self;
    __int16 v11 = 2112;
    v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = (int)[v4 identifier];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRDCLC] <%p> Disconnecting origin-%@-%ld.", (uint8_t *)&v9, 0x20u);
  }
  CFStringRef v8 = [(MRDConnectionLifetimeController *)self delegate];
  [v8 disconnectOrigin:v4];
}

- (void)_handleDeviceInfoDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDConnectionLifetimeController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000CDBA4;
  v7[3] = &unk_1004158D8;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_handleIsPlayingDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDConnectionLifetimeController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000CDD10;
  v7[3] = &unk_1004158D8;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_adjustPlaybackTimerIfNeeded
{
  unsigned __int8 v3 = [(MRDConnectionLifetimeController *)self isPlaying];
  id v4 = [(MRDConnectionLifetimeController *)self playbackTimer];

  if (v3)
  {
    if (v4)
    {
      id v5 = _MRLogForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_10032E0C0((uint64_t)self, v5);
      }

      id v6 = [(MRDConnectionLifetimeController *)self playbackTimer];
      [v6 invalidate];

      [(MRDConnectionLifetimeController *)self setPlaybackTimer:0];
    }
  }
  else if (!v4)
  {
    [(MRDConnectionLifetimeController *)self recentlyPlayingInterval];
    double v8 = v7;
    [(MRDConnectionLifetimeController *)self timeSincePlaying];
    double v10 = v8 - v9;
    if (v10 <= 0.0)
    {
      [(MRDConnectionLifetimeController *)self evaluateShouldDisconnectWithReason:@"Has not played recently"];
    }
    else
    {
      double v11 = v10 + 2.0;
      v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_10032E138();
      }

      objc_initWeak(&location, self);
      id v13 = objc_alloc((Class)MRTimer);
      uint64_t v14 = [(MRDConnectionLifetimeController *)self queue];
      id v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      double v18 = sub_1000CE020;
      double v19 = &unk_1004171D0;
      objc_copyWeak(&v20, &location);
      id v15 = [v13 initWithInterval:@"CLC-playbackTimer" name:v14 queue:&v16 block:v11];
      -[MRDConnectionLifetimeController setPlaybackTimer:](self, "setPlaybackTimer:", v15, v16, v17, v18, v19);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_adjustContinuousPlaybackDetectionTimerIfNeeded
{
  unsigned int v3 = [(MRDConnectionLifetimeController *)self isPlaying];
  id v4 = [(MRDConnectionLifetimeController *)self continuousPlaybackDetectionTimer];
  id v5 = v4;
  if (v3)
  {
    [v4 invalidateWithReason:@"Playback Started"];

    [(MRDConnectionLifetimeController *)self setContinuousPlaybackDetectionTimer:0];
    [(MRDConnectionLifetimeController *)self continuousPlaybackDetectionInterval];
    double v7 = v6;
    [(MRDConnectionLifetimeController *)self timeSincePlaybackStarted];
    double v9 = v7 - v8;
    if (v9 <= 0.0)
    {
      [(MRDConnectionLifetimeController *)self evaluateShouldDisconnectWithReason:@"Continuous Playback Detected"];
    }
    else
    {
      double v10 = v9 + 10.0;
      double v11 = _MRLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_10032E1AC();
      }

      objc_initWeak(&location, self);
      id v12 = objc_alloc((Class)MRTimer);
      id v13 = [(MRDConnectionLifetimeController *)self queue];
      id v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      uint64_t v17 = sub_1000CE298;
      double v18 = &unk_1004171D0;
      objc_copyWeak(&v19, &location);
      id v14 = [v12 initWithInterval:@"CLC-continuousPlaybackDetectionTimer" name:v13 queue:&v15 block:v10];
      -[MRDConnectionLifetimeController setContinuousPlaybackDetectionTimer:](self, "setContinuousPlaybackDetectionTimer:", v14, v15, v16, v17, v18);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [v4 invalidateWithReason:@"Playback stopped, continuousPlaybackDetection is no longer relevant"];

    [(MRDConnectionLifetimeController *)self setContinuousPlaybackDetectionTimer:0];
  }
}

- (void)_handleLayoutDidChangeNotification:(id)a3
{
  id v4 = [(MRDConnectionLifetimeController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CE368;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_handleActiveSystemEndpointChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDConnectionLifetimeController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000CE574;
  v7[3] = &unk_1004158D8;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)activeSystemEndpointUID
{
  v2 = +[MRDMediaRemoteServer server];
  unsigned int v3 = [v2 routingServer];
  id v4 = [v3 systemEndpointController];
  id v5 = [v4 activeOutputDeviceUID:0];

  return v5;
}

- (BOOL)isMemberOfActiveSystemEndpoint
{
  unsigned int v3 = [(MRDConnectionLifetimeController *)self activeSystemEndpointUID];
  id v4 = +[MRDMediaRemoteServer server];
  id v5 = [v4 nowPlayingServer];
  id v6 = [v5 originClientForOrigin:self->_origin];
  double v7 = [v6 deviceInfo];

  id v8 = +[MRDMediaRemoteServer server];
  double v9 = [v8 nowPlayingServer];
  double v10 = [v9 originClientForGroupLeaderOfDeviceUID:v3];
  double v11 = [v10 deviceInfo];

  id v12 = [v7 deviceUID];
  id v13 = [v11 deviceUID];
  if (v12 == v13)
  {

LABEL_24:
    goto LABEL_25;
  }
  id v14 = v13;
  unsigned __int8 v15 = [v12 isEqual:v13];

  if (v15)
  {
LABEL_25:
    BOOL v37 = 1;
    goto LABEL_26;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v12 = [v11 groupedDevices];
  id v16 = [v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v44;
LABEL_5:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v44 != v18) {
        objc_enumerationMutation(v12);
      }
      id v20 = *(void **)(*((void *)&v43 + 1) + 8 * v19);
      v21 = [v7 deviceUID];
      signed int v22 = [v20 deviceUID];
      id v23 = v21;
      id v24 = v22;
      if (v23 == v24) {
        goto LABEL_23;
      }
      id v25 = v24;
      unsigned __int8 v26 = [v23 isEqual:v24];

      if (v26) {
        goto LABEL_24;
      }
      if (v17 == (id)++v19)
      {
        id v17 = [v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v17) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  objc_msgSend(v11, "clusteredDevices", 0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v27 = [v12 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v40;
LABEL_14:
    uint64_t v30 = 0;
    while (1)
    {
      if (*(void *)v40 != v29) {
        objc_enumerationMutation(v12);
      }
      v31 = *(void **)(*((void *)&v39 + 1) + 8 * v30);
      uint64_t v32 = [v7 deviceUID];
      v33 = [v31 deviceUID];
      id v23 = v32;
      id v34 = v33;
      if (v23 == v34) {
        break;
      }
      v35 = v34;
      unsigned __int8 v36 = [v23 isEqual:v34];

      if (v36) {
        goto LABEL_24;
      }
      if (v28 == (id)++v30)
      {
        id v28 = [v12 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v28) {
          goto LABEL_14;
        }
        goto LABEL_21;
      }
    }
LABEL_23:

    goto LABEL_24;
  }
LABEL_21:

  BOOL v37 = 0;
LABEL_26:

  return v37;
}

- (BOOL)isPlaying
{
  unsigned int v3 = +[MRDMediaRemoteServer server];
  id v4 = [v3 nowPlayingServer];
  id v5 = [v4 originClientForOrigin:self->_origin];
  unsigned __int8 v6 = [v5 isPlaying];

  return v6;
}

- (double)timeSincePlaying
{
  unsigned int v3 = +[MRDMediaRemoteServer server];
  id v4 = [v3 nowPlayingServer];
  id v5 = [v4 originClientForOrigin:self->_origin];
  [v5 timeSincePlaying];
  double v7 = v6;

  return v7;
}

- (BOOL)hasPlayedRecently
{
  [(MRDConnectionLifetimeController *)self timeSincePlaying];
  double v4 = v3;
  [(MRDConnectionLifetimeController *)self recentlyPlayingInterval];
  return v4 < v5;
}

- (BOOL)containsLocalDevice
{
  double v3 = +[MRDMediaRemoteServer server];
  double v4 = [v3 nowPlayingServer];
  double v5 = [v4 originClientForOrigin:self->_origin];
  double v6 = [v5 deviceInfo];

  LOBYTE(v5) = [v6 containsLocalDevice];
  return (char)v5;
}

- (double)timeSincePlaybackStarted
{
  double v3 = +[MRDMediaRemoteServer server];
  double v4 = [v3 nowPlayingServer];
  double v5 = [v4 originClientForOrigin:self->_origin];
  [v5 timeSincePlaybackStarted];
  double v7 = v6;

  return v7;
}

- (BOOL)continuousPlaybackDetected
{
  [(MRDConnectionLifetimeController *)self timeSincePlaybackStarted];
  double v4 = v3;
  [(MRDConnectionLifetimeController *)self continuousPlaybackDetectionInterval];
  return v4 >= v5;
}

- (MRDConnectionLifetimeControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (MRDConnectionLifetimeControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (MRDConnectionLifetimeControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDConnectionLifetimeControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MRTimer)playbackTimer
{
  return self->_playbackTimer;
}

- (void)setPlaybackTimer:(id)a3
{
}

- (MRTimer)continuousPlaybackDetectionTimer
{
  return self->_continuousPlaybackDetectionTimer;
}

- (void)setContinuousPlaybackDetectionTimer:(id)a3
{
}

- (MRTimer)disconnectTimer
{
  return self->_disconnectTimer;
}

- (void)setDisconnectTimer:(id)a3
{
}

- (unint64_t)deviceState
{
  return self->_deviceState;
}

- (void)setDeviceState:(unint64_t)a3
{
  self->_deviceState = a3;
}

- (double)disconnectInterval
{
  return self->_disconnectInterval;
}

- (double)recentlyPlayingInterval
{
  return self->_recentlyPlayingInterval;
}

- (double)continuousPlaybackDetectionInterval
{
  return self->_continuousPlaybackDetectionInterval;
}

- (BOOL)hasDeferredDisconnectionDueToDeviceState
{
  return self->_hasDeferredDisconnectionDueToDeviceState;
}

- (void)setHasDeferredDisconnectionDueToDeviceState:(BOOL)a3
{
  self->_hasDeferredDisconnectionDueToDeviceState = a3;
}

- (BOOL)disconnected
{
  return self->_disconnected;
}

- (void)setDisconnected:(BOOL)a3
{
  self->_disconnected = a3;
}

- (NSString)maintainReason
{
  return self->_maintainReason;
}

- (void)setMaintainReason:(id)a3
{
}

- (NSString)previousMaintainReason
{
  return self->_previousMaintainReason;
}

- (void)setPreviousMaintainReason:(id)a3
{
}

- (MROrigin)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_previousMaintainReason, 0);
  objc_storeStrong((id *)&self->_maintainReason, 0);
  objc_storeStrong((id *)&self->_disconnectTimer, 0);
  objc_storeStrong((id *)&self->_continuousPlaybackDetectionTimer, 0);
  objc_storeStrong((id *)&self->_playbackTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end