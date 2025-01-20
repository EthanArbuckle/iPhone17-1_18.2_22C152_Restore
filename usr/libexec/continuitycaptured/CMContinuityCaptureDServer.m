@interface CMContinuityCaptureDServer
+ (id)sessionIdentifier:(id)a3;
- (BOOL)activeCallSession;
- (BOOL)setupSidebandRPClient;
- (CMContinuityCaptureDServer)initWithQueue:(id)a3;
- (void)_exitSessionIfApplicableForDeviceIdentifier:(id)a3 exitReason:(id)a4;
- (void)_launchShieldUIForDeviceIdentifier:(id)a3 name:(id)a4 model:(int64_t)a5 skipPlacementStep:(BOOL)a6 isDedicated:(BOOL)a7;
- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)_relayMessage:(id)a3 toDeviceWithIdentifier:(id)a4 andModel:(int64_t)a5;
- (void)_resolveUserPauseState;
- (void)_skipPlacementStepIfApplicable;
- (void)_teardownShieldUI;
- (void)activate;
- (void)callActive:(BOOL)a3;
- (void)cancel;
- (void)createSession:(id)a3;
- (void)dealloc;
- (void)disconnectSession;
- (void)disconnectSession:(BOOL)a3 reason:(id)a4;
- (void)incomingCall:(BOOL)a3 data:(id)a4 shouldDisplayNotification:(BOOL)a5;
- (void)invalidateCurrentSession;
- (void)launchShieldUIForDeviceIdentifier:(id)a3 name:(id)a4 model:(int64_t)a5 skipPlacementStep:(BOOL)a6 isDedicated:(BOOL)a7;
- (void)lockScreenLayoutMonitor:(id)a3 didUpdateLayoutWithShieldFrontMost:(BOOL)a4 lockscreenInLayout:(BOOL)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseSessionForEvent:(int64_t)a3;
- (void)postCameraCapabilitiesToDeviceWithIdentifier:(id)a3 andModel:(int64_t)a4;
- (void)postEvent:(id)a3 toDeviceWithIdentifier:(id)a4;
- (void)postEvent:(id)a3 toSession:(id)a4;
- (void)prepareForPullConversation:(id)a3;
- (void)relayMessage:(id)a3 toDeviceWithIdentifier:(id)a4 andModel:(int64_t)a5;
- (void)requestContinuityCaptureUIConfiguration:(id)a3;
- (void)resetCurrentSession:(id)a3 added:(BOOL)a4 completion:(id)a5;
- (void)resumeStreamingForEvent:(int64_t)a3;
- (void)setupDisplayServer;
- (void)setupRPRemoteDisplayDiscovery;
- (void)shieldDidConnect;
- (void)shieldDidDisconnect;
- (void)skipPlacementStep;
- (void)teardownSession;
- (void)teardownShieldUI;
- (void)updateSystemStateForDeviceIdentifier:(id)a3 andModel:(int64_t)a4;
@end

@implementation CMContinuityCaptureDServer

- (CMContinuityCaptureDServer)initWithQueue:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CMContinuityCaptureDServer;
  v6 = [(CMContinuityCaptureDServer *)&v26 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_checkLastUserPressedPauseState = 1;
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.continuitycapture.shieldlaunch", v8);
    shieldLaunchCheckQueue = v7->_shieldLaunchCheckQueue;
    v7->_shieldLaunchCheckQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.continuitycapture.sidebandMessageQueue", v11);
    sidebandMessageQueue = v7->_sidebandMessageQueue;
    v7->_sidebandMessageQueue = (OS_dispatch_queue *)v12;

    v14 = +[CCDShieldUILifeCycleManager sharedInstance];
    [v14 addObserver:v7 forKeyPath:@"activeSession" options:3 context:0];

    v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    sessionsPendingActivation = v7->_sessionsPendingActivation;
    v7->_sessionsPendingActivation = v15;

    objc_initWeak(&location, v7);
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_1000062BC;
    v23 = &unk_100018670;
    objc_copyWeak(&v24, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v20);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    atomic_store(1u, (unsigned __int8 *)&v7->_observingActiveKVOs);
    v17 = (CMContinuityCaptureLockScreenLayoutMonitor *)objc_alloc_init((Class)CMContinuityCaptureLockScreenLayoutMonitor);
    lockScreenLayoutMonitor = v7->_lockScreenLayoutMonitor;
    v7->_lockScreenLayoutMonitor = v17;

    -[CMContinuityCaptureLockScreenLayoutMonitor setDelegate:](v7->_lockScreenLayoutMonitor, "setDelegate:", v7, v20, v21, v22, v23);
    [(CMContinuityCaptureDServer *)v7 setupRPRemoteDisplayDiscovery];
    [(CMContinuityCaptureDServer *)v7 setupDisplayServer];
    [(CMContinuityCaptureDServer *)v7 setupSidebandRPClient];
  }

  return v7;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_observingActiveKVOs);
  if (v3)
  {
    v4 = +[CCDShieldUILifeCycleManager sharedInstance];
    [v4 removeObserver:self forKeyPath:@"activeSession" context:0];

    id v5 = +[ContinuityCaptureRemoteUISystemStatus sharedInstance];
    [v5 removeObserver:self forKeyPath:CMContinuityCaptureCallStateKVOKey context:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)CMContinuityCaptureDServer;
  [(CMContinuityCaptureDServer *)&v6 dealloc];
}

- (void)requestContinuityCaptureUIConfiguration:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id v5 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    v10 = self;
    __int16 v11 = 2080;
    dispatch_queue_t v12 = "-[CMContinuityCaptureDServer requestContinuityCaptureUIConfiguration:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s ", (uint8_t *)&v9, 0x16u);
  }

  objc_super v6 = +[CCDShieldUILifeCycleManager sharedInstance];
  v7 = [v6 activeSession];
  v8 = [v7 configuration];
  v4[2](v4, v8);
}

- (void)resumeStreamingForEvent:(int64_t)a3
{
  objc_initWeak(&location, self);
  id v5 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v11 = self;
    __int16 v12 = 2080;
    v13 = "-[CMContinuityCaptureDServer resumeStreamingForEvent:]";
    __int16 v14 = 1024;
    int v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s event %d", buf, 0x1Cu);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000667C;
  block[3] = &unk_1000188B0;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (void)pauseSessionForEvent:(int64_t)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000067D4;
  v6[3] = &unk_1000188D8;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  v6[4] = self;
  dispatch_async(queue, v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)disconnectSession
{
}

- (void)disconnectSession:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  v7 = +[CCDShieldUILifeCycleManager sharedInstance];
  v8 = [v7 activeSession];

  int v9 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    uint64_t v21 = self;
    __int16 v22 = 2080;
    v23 = "-[CMContinuityCaptureDServer disconnectSession:reason:]";
    __int16 v24 = 2114;
    id v25 = v6;
    __int16 v26 = 1024;
    BOOL v27 = v4;
    __int16 v28 = 2114;
    v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %s reason %{public}@ relayMessage %d activeSession %{public}@", buf, 0x30u);
  }

  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006BEC;
  v13[3] = &unk_100018900;
  objc_copyWeak(&v17, &location);
  id v14 = v8;
  int v15 = self;
  id v16 = v6;
  BOOL v18 = v4;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(queue, v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)skipPlacementStep
{
  objc_initWeak(&location, self);
  unsigned __int8 v3 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    int v9 = self;
    __int16 v10 = 2080;
    id v11 = "-[CMContinuityCaptureDServer skipPlacementStep]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007114;
  v5[3] = &unk_100018670;
  objc_copyWeak(&v6, &location);
  dispatch_async(queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)prepareForPullConversation:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    __int16 v14 = 2080;
    int v15 = "-[CMContinuityCaptureDServer prepareForPullConversation:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000072D8;
  block[3] = &unk_100018928;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)postCameraCapabilitiesToDeviceWithIdentifier:(id)a3 andModel:(int64_t)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = sub_100007588;
  id v16 = sub_100007598;
  id v17 = 0;
  id v7 = &_dispatch_main_q;
  dispatch_assert_queue_not_V2((dispatch_queue_t)&_dispatch_main_q);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000075A0;
  block[3] = &unk_100018950;
  void block[4] = &v12;
  dispatch_async_and_wait((dispatch_queue_t)&_dispatch_main_q, block);

  v8 = [(id)v13[5] dictionaryRepresentation];
  if (v8)
  {
    id v9 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = self;
      __int16 v22 = 2114;
      id v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ capabilities dispatched to %{public}@", buf, 0x16u);
    }

    v18[0] = ContinuityCaptureRapportClientMessageTypeKey;
    v18[1] = ContinuityCaptureRapportClientEventCapabilitiesPayloadKey;
    v19[0] = &off_100018FD0;
    v19[1] = v8;
    id v10 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    [(CMContinuityCaptureDServer *)self relayMessage:v10 toDeviceWithIdentifier:v6 andModel:a4];
  }
  _Block_object_dispose(&v12, 8);
}

- (void)postEvent:(id)a3 toDeviceWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v13 = self;
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ event %{public}@ dispatch event to %{public}@", buf, 0x20u);
  }

  v10[0] = ContinuityCaptureRapportClientMessageTypeKey;
  v10[1] = ContinuityCaptureRapportClientEventNameKey;
  v11[0] = &off_100018FB8;
  v11[1] = v6;
  id v9 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  [(CMContinuityCaptureDServer *)self relayMessage:v9 toDeviceWithIdentifier:v7 andModel:0];
}

- (void)relayMessage:(id)a3 toDeviceWithIdentifier:(id)a4 andModel:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  sidebandMessageQueue = self->_sidebandMessageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007830;
  block[3] = &unk_100018978;
  objc_copyWeak(v16, &location);
  id v14 = v8;
  id v15 = v9;
  v16[1] = (id)a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(sidebandMessageQueue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (void)_relayMessage:(id)a3 toDeviceWithIdentifier:(id)a4 andModel:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sidebandMessageQueue);
  id v10 = dispatch_get_global_queue(2, 0);
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  id v12 = objc_alloc_init((Class)RPCompanionLinkDevice);
  [v12 setIdentifier:v9];
  id v13 = objc_alloc_init((Class)RPCompanionLinkClient);
  [v13 setDispatchQueue:v10];
  unint64_t v14 = (unint64_t)[v13 controlFlags];
  if (a5 == 1) {
    uint64_t v15 = 65542;
  }
  else {
    uint64_t v15 = 0x180000010006;
  }
  [v13 setControlFlags:v14 | v15];
  [v13 setDestinationDevice:v12];
  __int16 v16 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = objc_loadWeakRetained(&location);
    *(_DWORD *)buf = 138544130;
    id v32 = v17;
    __int16 v33 = 2114;
    id v34 = v12;
    __int16 v35 = 2114;
    id v36 = v13;
    __int16 v37 = 1024;
    int v38 = a5;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Device to Connect %{public}@ overClient %{public}@ model %d", buf, 0x26u);
  }
  if (v12)
  {
    uint64_t v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    id v23 = sub_100007B84;
    __int16 v24 = &unk_1000189C8;
    objc_copyWeak(&v29, &location);
    BOOL v18 = v11;
    id v25 = v18;
    id v26 = v8;
    id v19 = v13;
    id v27 = v19;
    id v28 = v12;
    [v19 activateWithCompletion:&v21];
    dispatch_time_t v20 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v18, v20);
    [v19 invalidate:v21, v22, v23, v24];

    objc_destroyWeak(&v29);
  }

  objc_destroyWeak(&location);
}

- (void)shieldDidDisconnect
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008060;
  v4[3] = &unk_100018670;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)shieldDidConnect
{
  id v2 = +[CCDShieldUILifeCycleManager sharedInstance];
  [v2 shieldDidConnect];
}

- (void)incomingCall:(BOOL)a3 data:(id)a4 shouldDisplayNotification:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  id v9 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    id v19 = self;
    __int16 v20 = 2080;
    uint64_t v21 = "-[CMContinuityCaptureDServer incomingCall:data:shouldDisplayNotification:]";
    __int16 v22 = 1024;
    BOOL v23 = v6;
    __int16 v24 = 1024;
    BOOL v25 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %s status %d shouldDisplayNotification: %d", buf, 0x22u);
  }

  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008414;
  v12[3] = &unk_1000189F0;
  objc_copyWeak(&v14, &location);
  BOOL v15 = v6;
  id v13 = v8;
  BOOL v16 = v5;
  id v11 = v8;
  dispatch_async(queue, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)callActive:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = +[CCDShieldUILifeCycleManager sharedInstance];
  BOOL v6 = [v5 activeSession];
  if (v6)
  {
    id v7 = +[CCDShieldUILifeCycleManager sharedInstance];
    id v8 = [v7 activeSession];
    id v9 = [v8 configuration];
    id v10 = [v9 clientDeviceModel];

    if (v10 == (id)2)
    {
      id v11 = CMContinuityCaptureLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v19 = self;
        __int16 v20 = 2080;
        uint64_t v21 = "-[CMContinuityCaptureDServer callActive:]";
        __int16 v22 = 1024;
        BOOL v23 = v3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ %s status %d, ignore event for atv session", buf, 0x1Cu);
      }

      return;
    }
  }
  else
  {
  }
  objc_initWeak(&location, self);
  id v12 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v19 = self;
    __int16 v20 = 2080;
    uint64_t v21 = "-[CMContinuityCaptureDServer callActive:]";
    __int16 v22 = 1024;
    BOOL v23 = v3;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ %s status %d", buf, 0x1Cu);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000087F4;
  block[3] = &unk_100018A18;
  objc_copyWeak(&v15, &location);
  BOOL v16 = v3;
  dispatch_async(queue, block);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)activate
{
  BOOL v3 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = self;
    __int16 v14 = 2080;
    id v15 = "-[CMContinuityCaptureDServer activate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s ", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_100008A64;
  v10[3] = &unk_100018838;
  objc_copyWeak(&v11, (id *)buf);
  id v4 = objc_retainBlock(v10);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008B50;
  block[3] = &unk_100018928;
  objc_copyWeak(&v9, (id *)buf);
  id v8 = v4;
  BOOL v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)cancel
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008C60;
  v4[3] = &unk_100018670;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)launchShieldUIForDeviceIdentifier:(id)a3 name:(id)a4 model:(int64_t)a5 skipPlacementStep:(BOOL)a6 isDedicated:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100008DCC;
  v17[3] = &unk_100018A40;
  objc_copyWeak(v20, &location);
  id v18 = v12;
  id v19 = v13;
  v20[1] = (id)a5;
  BOOL v21 = a6;
  BOOL v22 = a7;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(queue, v17);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

- (void)_launchShieldUIForDeviceIdentifier:(id)a3 name:(id)a4 model:(int64_t)a5 skipPlacementStep:(BOOL)a6 isDedicated:(BOOL)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __int16 v14 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v26 = self;
    __int16 v27 = 2080;
    id v28 = "-[CMContinuityCaptureDServer _launchShieldUIForDeviceIdentifier:name:model:skipPlacementStep:isDedicated:]";
    __int16 v29 = 2114;
    id v30 = v12;
    __int16 v31 = 1024;
    BOOL v32 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ %s identifier %{public}@ skipPlacementStep %d", buf, 0x26u);
  }

  shieldLaunchCheckQueue = self->_shieldLaunchCheckQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  void v18[2] = sub_10000901C;
  v18[3] = &unk_100018A40;
  objc_copyWeak(v21, &location);
  v21[1] = (id)a5;
  BOOL v22 = v8;
  id v19 = v12;
  id v20 = v13;
  BOOL v23 = a7;
  id v16 = v13;
  id v17 = v12;
  dispatch_async(shieldLaunchCheckQueue, v18);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

- (void)teardownShieldUI
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100009AC0;
  v4[3] = &unk_100018670;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_teardownShieldUI
{
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v3 = +[CCDShieldUILifeCycleManager sharedInstance];
  id v4 = [v3 activeSession];
  BOOL v5 = v4 == 0;

  if (!v5)
  {
    BOOL v6 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = self;
      __int16 v16 = 2080;
      id v17 = "-[CMContinuityCaptureDServer _teardownShieldUI]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
    }

    id v7 = +[CCDShieldUILifeCycleManager sharedInstance];
    BOOL v8 = [v7 activeSession];
    id v9 = [v8 pauseStateSolver];
    [v9 saveUserPauseState:0];

    id v10 = +[CCDShieldUILifeCycleManager sharedInstance];
    [v10 tearDownShield];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    void v11[2] = sub_100009CF4;
    v11[3] = &unk_100018670;
    objc_copyWeak(&v12, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
    objc_destroyWeak(&v12);
  }
  objc_destroyWeak(&location);
}

- (void)teardownSession
{
  BOOL v3 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    rpServer = self->_rpServer;
    *(_DWORD *)buf = 138543874;
    v43 = self;
    __int16 v44 = 2080;
    v45 = "-[CMContinuityCaptureDServer teardownSession]";
    __int16 v46 = 2112;
    v47 = rpServer;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@", buf, 0x20u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v5 = self->_rpServer;
  if (v5)
  {
    BOOL v6 = [(CMContinuityCaptureRapportServer *)v5 compositeDevice];

    if (v6)
    {
      id v7 = [(CMContinuityCaptureRapportServer *)self->_rpServer localDevice];
      BOOL v8 = [v7 deviceIdentifier];
      id v9 = [v8 UUIDString];

      id v10 = (CMContinuityCaptureRapportServer *)[(CMContinuityCaptureRapportServer *)self->_rpServer currentSessionID];
      id v11 = +[CCDShieldUILifeCycleManager sharedInstance];
      id v12 = [v11 activeSession];
      id v13 = [v12 configuration];
      id v14 = [v13 clientDeviceModel];

      id v15 = [(CMContinuityCaptureRapportServer *)self->_rpServer compositeDevice];
      __int16 v16 = [v15 queue];
      dispatch_assert_queue_not_V2(v16);

      id v17 = [(CMContinuityCaptureRapportServer *)self->_rpServer compositeDevice];
      id v18 = [v17 queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000A248;
      block[3] = &unk_100018798;
      void block[4] = self;
      dispatch_async_and_wait(v18, block);

      [(CMContinuityCaptureRapportServer *)self->_rpServer removeObserver:self forKeyPath:CMContinuityCaptureRemoteStreamPreStartConfigKVOKey context:0];
      +[CMContinuityCaptureRemoteCompositeDevice setWombatMode:0];
      id sessionClearOutBlock = self->_sessionClearOutBlock;
      if (sessionClearOutBlock)
      {
        dispatch_block_cancel(sessionClearOutBlock);
        id v20 = self->_sessionClearOutBlock;
        self->_id sessionClearOutBlock = 0;
      }
      BOOL v21 = [(CMContinuityCaptureRapportServer *)self->_rpServer compositeDevice];
      [v21 invalidate];

      [(CMContinuityCaptureRapportServer *)self->_rpServer cancel];
      BOOL v22 = self->_rpServer;
      self->_rpServer = 0;

      connectedRPDisplaySession = self->_connectedRPDisplaySession;
      self->_connectedRPDisplaySession = 0;

      __int16 v24 = +[CCDShieldUILifeCycleManager sharedInstance];
      BOOL v25 = [v24 activeSession];
      id v26 = [v25 pauseStateSolver];
      [v26 saveUserPauseState:0];

      __int16 v27 = +[CCDShieldUILifeCycleManager sharedInstance];
      id v28 = [v27 activeSession];

      if (v28)
      {
        __int16 v29 = +[CCDShieldUILifeCycleManager sharedInstance];
        id v30 = [v29 activeSession];
        __int16 v31 = [v30 configuration];
        [v31 setCompositeState:0];

        BOOL v32 = +[CMContinuityCaptureXPCServerCCD sharedInstance];
        __int16 v33 = +[CCDShieldUILifeCycleManager sharedInstance];
        id v34 = [v33 activeSession];
        __int16 v35 = [v34 configuration];
        [v32 updateClientsWithConfiguration:v35];
      }
      id v36 = CMContinuityCaptureLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v43 = self;
        __int16 v44 = 2114;
        v45 = v9;
        __int16 v46 = 2048;
        v47 = v10;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ teardown session event for %{public}@ currentSessionID %llx", buf, 0x20u);
      }

      v40[0] = ContinuityCaptureRapportClientMessageTypeKey;
      v40[1] = ContinuityCaptureRapportClientTransportSessionIDKey;
      v41[0] = &off_100018FE8;
      __int16 v37 = +[NSNumber numberWithUnsignedLongLong:v10];
      v41[1] = v37;
      int v38 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
      [(CMContinuityCaptureDServer *)self relayMessage:v38 toDeviceWithIdentifier:v9 andModel:v14];
    }
  }
}

- (BOOL)activeCallSession
{
  id v2 = +[ContinuityCaptureRemoteUISystemStatus sharedInstance];
  if ([v2 callState])
  {
    BOOL v3 = +[ContinuityCaptureRemoteUISystemStatus sharedInstance];
    BOOL v4 = [v3 activeCallCountOnMainQueue] != 0;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)createSession:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_rpServer)
  {
    BOOL v5 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ skip create session", buf, 0xCu);
    }
  }
  else
  {
    +[CMContinuityCaptureRemoteCompositeDevice setWombatMode:1];
    BOOL v5 = +[CMContinuityCaptureDServer sessionIdentifier:v4];
    BOOL v6 = [(RPRemoteDisplayDiscovery *)self->_rpRemoteDisplayDiscovery dedicatedDevice];
    id v7 = [v6 idsDeviceIdentifier];
    unsigned int v8 = [v7 isEqual:v5];

    id v9 = (void *)voucher_copy();
    id v10 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      id v19 = self;
      __int16 v20 = 2114;
      id v21 = v4;
      __int16 v22 = 2112;
      BOOL v23 = v9;
      __int16 v24 = 1024;
      unsigned int v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ create session for %{public}@ voucher %@ isDedicated: %d", buf, 0x26u);
    }

    id v11 = objc_alloc((Class)CMContinuityCaptureRapportServer);
    queue = self->_queue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000A5B8;
    v17[3] = &unk_100018A90;
    void v17[4] = self;
    id v13 = (CMContinuityCaptureRapportServer *)[v11 initWithRapportDisplaySession:v4 queue:queue voucher:v9 incomingStreamRequestHandler:v17];
    rpServer = self->_rpServer;
    self->_rpServer = v13;

    id v15 = [(CMContinuityCaptureRapportServer *)self->_rpServer compositeDevice];

    if (v15)
    {
      __int16 v16 = [(CMContinuityCaptureRapportServer *)self->_rpServer compositeDevice];
      [v16 addObserver:self forKeyPath:CMContinuityCaptureRemoteCompositeStateKVOKey options:3 context:0];

      [(CMContinuityCaptureRapportServer *)self->_rpServer addObserver:self forKeyPath:CMContinuityCaptureRemoteStreamPreStartConfigKVOKey options:3 context:0];
    }
    [(CMContinuityCaptureDServer *)self _resolveUserPauseState];
  }
}

- (void)invalidateCurrentSession
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  rpServer = self->_rpServer;
  if (rpServer)
  {
    [(CMContinuityCaptureRapportServer *)rpServer invalidateCurrentSession:0];
  }
}

+ (id)sessionIdentifier:(id)a3
{
  id v5 = a3;
  BOOL v6 = [v5 destinationDevice];
  id v7 = [v6 idsDeviceIdentifier];
  if (v7
    && ([v5 destinationDevice],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [v3 idsDeviceIdentifier],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 length]))
  {
    unsigned int v8 = [v5 destinationDevice];
    id v9 = [v8 idsDeviceIdentifier];
  }
  else
  {
    id v10 = [v5 destinationDevice];
    id v9 = [v10 identifier];

    if (!v7) {
      goto LABEL_6;
    }
  }

LABEL_6:
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = &stru_100018E78;
  }

  return v11;
}

- (void)postEvent:(id)a3 toSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v16[0] = ContinuityCaptureRapportClientMessageTypeKey;
  v16[1] = ContinuityCaptureRapportClientEventNameKey;
  v17[0] = &off_100018FD0;
  v17[1] = v6;
  unsigned int v8 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_10000AA60;
  v10[3] = &unk_100018AB8;
  objc_copyWeak(&v12, &location);
  id v9 = v6;
  id v11 = v9;
  objc_copyWeak(&v13, &from);
  [v7 sendEventID:ContinuityCaptureSessionEventID event:v8 destinationID:RPDestinationIdentifierDirectPeer options:0 completion:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)resetCurrentSession:(id)a3 added:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v9 = a3;
  id v10 = (void (**)(void))a5;
  id v11 = +[CMContinuityCaptureDServer sessionIdentifier:v9];
  id v12 = [v9 destinationDevice];
  id v13 = [v12 model];
  uint64_t v14 = CMContinuityCaptureDeviceModelFromModelString();

  id v15 = [(RPRemoteDisplayDiscovery *)self->_rpRemoteDisplayDiscovery dedicatedDevice];
  __int16 v16 = [v15 idsDeviceIdentifier];
  unsigned int v90 = [v16 isEqual:v11];

  id v17 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    rpServer = self->_rpServer;
    connectedRPDisplaySession = self->_connectedRPDisplaySession;
    *(_DWORD *)buf = 138544898;
    v92 = self;
    __int16 v93 = 2080;
    v94 = "-[CMContinuityCaptureDServer resetCurrentSession:added:completion:]";
    __int16 v95 = 2114;
    v96 = rpServer;
    __int16 v97 = 2114;
    v98 = connectedRPDisplaySession;
    __int16 v99 = 2114;
    id v100 = v9;
    __int16 v101 = 1024;
    BOOL v102 = v6;
    __int16 v103 = 2114;
    v104 = v11;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ %s rpServer %{public}@ _connectedRPDisplaySession %{public}@ resetSession %{public}@ added %d destinationDeviceIdentifier %{public}@", buf, 0x44u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!FigContinuityCaptureGetUserPreferenceDisabled() || !v6)
  {
    uint64_t v89 = v14;
    p_connectedRPDisplaySession = &self->_connectedRPDisplaySession;
    if (self->_connectedRPDisplaySession)
    {
      __int16 v22 = self->_rpServer;
      if (!v22) {
        goto LABEL_21;
      }
      BOOL v23 = [(CMContinuityCaptureRapportServer *)v22 displaySession];
      unsigned int v24 = [v23 isEqual:v9];

      if (v24)
      {
        unsigned int v25 = CMContinuityCaptureLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v92 = self;
          __int16 v93 = 2114;
          v94 = (const char *)v9;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalidate current session %{public}@", buf, 0x16u);
        }

        id v26 = self->_connectedRPDisplaySession;
        self->_connectedRPDisplaySession = 0;

        [(CMContinuityCaptureDServer *)self invalidateCurrentSession];
        if ([(NSMutableArray *)self->_sessionsPendingActivation count]
          && ([(NSMutableArray *)self->_sessionsPendingActivation firstObject],
              __int16 v27 = objc_claimAutoreleasedReturnValue(),
              +[CMContinuityCaptureDServer sessionIdentifier:](CMContinuityCaptureDServer, "sessionIdentifier:", v27), id v28 = objc_claimAutoreleasedReturnValue(), v29 = [v28 isEqualToString:v11], v28, v27, v29))
        {
          id v30 = CMContinuityCaptureLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v31 = [(NSMutableArray *)self->_sessionsPendingActivation firstObject];
            *(_DWORD *)buf = 138544130;
            v92 = self;
            __int16 v93 = 2114;
            v94 = v11;
            __int16 v95 = 2114;
            v96 = (CMContinuityCaptureRapportServer *)v9;
            __int16 v97 = 2114;
            v98 = v31;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection Reset (from pending activation) for %{public}@ (%{public}@ -> %{public}@)", buf, 0x2Au);
          }
          BOOL v32 = self->_rpServer;
          __int16 v33 = [(NSMutableArray *)self->_sessionsPendingActivation firstObject];
          [(CMContinuityCaptureRapportServer *)v32 resetDisplaySession:v33];

          id v34 = [(NSMutableArray *)self->_sessionsPendingActivation firstObject];
          __int16 v35 = self->_connectedRPDisplaySession;
          self->_connectedRPDisplaySession = v34;
        }
        else
        {
          if (![(NSMutableArray *)self->_sessionsPendingActivation count]) {
            goto LABEL_79;
          }
          if (self->_sessionClearOutBlock)
          {
            v68 = self->_rpServer;
            if (!v68) {
              goto LABEL_79;
            }
            uint64_t v69 = [(CMContinuityCaptureRapportServer *)v68 displaySession];
            if (!v69) {
              goto LABEL_79;
            }
            v70 = (void *)v69;
            v71 = [(CMContinuityCaptureRapportServer *)self->_rpServer displaySession];
            unsigned __int8 v72 = [v71 isEqual:v9];

            if (v72) {
              goto LABEL_79;
            }
          }
          v73 = CMContinuityCaptureLog();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            v74 = [(NSMutableArray *)self->_sessionsPendingActivation firstObject];
            *(_DWORD *)buf = 138543618;
            v92 = self;
            __int16 v93 = 2114;
            v94 = v74;
            _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "%{public}@ New Connection (from pending activation) %{public}@", buf, 0x16u);
          }
          [(CMContinuityCaptureDServer *)self teardownSession];
          [(CMContinuityCaptureDServer *)self teardownShieldUI];
          uint64_t v75 = kCMContinuityCaptureEventCaptureSessionEnded;
          v76 = [(NSMutableArray *)self->_sessionsPendingActivation firstObject];
          [(CMContinuityCaptureDServer *)self postEvent:v75 toSession:v76];
        }
        [(NSMutableArray *)self->_sessionsPendingActivation removeObjectAtIndex:0];
LABEL_79:
        v10[2](v10);
        [(CMContinuityCaptureDServer *)self _resolveUserPauseState];
        goto LABEL_80;
      }
      if (*p_connectedRPDisplaySession) {
        goto LABEL_21;
      }
    }
    id v36 = self->_rpServer;
    if (!v36
      || ([(CMContinuityCaptureRapportServer *)v36 displaySession],
          __int16 v37 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v38 = [v37 isEqual:v9],
          v37,
          (v38 & 1) != 0))
    {
LABEL_21:
      v39 = self->_rpServer;
      if (v39)
      {
LABEL_22:
        if (!*p_connectedRPDisplaySession) {
          goto LABEL_24;
        }
        v40 = [(CMContinuityCaptureRapportServer *)v39 displaySession];
        unsigned __int8 v41 = [v40 isEqual:v9];

        if (v41) {
          goto LABEL_24;
        }
        if (v6)
        {
          id v53 = v7;
          v54 = [(CMContinuityCaptureRapportServer *)self->_rpServer displaySession];
          v55 = +[CMContinuityCaptureDServer sessionIdentifier:v54];
          unsigned int v56 = [v55 isEqualToString:v11];

          v57 = CMContinuityCaptureLog();
          BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
          if (v56)
          {
            if (v58)
            {
              v59 = [(CMContinuityCaptureRapportServer *)self->_rpServer displaySession];
              *(_DWORD *)buf = 138544130;
              v92 = self;
              __int16 v93 = 2114;
              v94 = v11;
              __int16 v95 = 2114;
              v96 = v59;
              __int16 v97 = 2114;
              v98 = (RPRemoteDisplaySession *)v9;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection Reset ((ongoing session) for %{public}@ (%{public}@ -> %{public}@)", buf, 0x2Au);
            }
            [(CMContinuityCaptureDServer *)self invalidateCurrentSession];
            [(CMContinuityCaptureRapportServer *)self->_rpServer resetDisplaySession:v9];
            v60 = &self->_connectedRPDisplaySession;
            v61 = v53;
LABEL_58:
            objc_storeStrong((id *)v60, v61);
            goto LABEL_79;
          }
          if (v58)
          {
            v84 = self->_connectedRPDisplaySession;
            *(_DWORD *)buf = 138543874;
            v92 = self;
            __int16 v93 = 2114;
            v94 = (const char *)v9;
            __int16 v95 = 2114;
            v96 = v84;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%{public}@ New Connection %{public}@ (ongoing session: %{public}@)", buf, 0x20u);
          }
          goto LABEL_77;
        }
        if (![(NSMutableArray *)self->_sessionsPendingActivation containsObject:v9]) {
          goto LABEL_79;
        }
        v80 = CMContinuityCaptureLog();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          v81 = self->_connectedRPDisplaySession;
          *(_DWORD *)buf = 138543874;
          v92 = self;
          __int16 v93 = 2114;
          v94 = (const char *)v9;
          __int16 v95 = 2114;
          v96 = v81;
          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection removed %{public}@ (ongoing session: %{public}@)", buf, 0x20u);
        }

LABEL_72:
        [(CMContinuityCaptureDServer *)self postEvent:kCMContinuityCaptureEventCaptureSessionEnded toSession:v9];
        [(NSMutableArray *)self->_sessionsPendingActivation removeObject:v9];
        goto LABEL_79;
      }
      id obj = v7;
      v43 = +[CCDShieldUILifeCycleManager sharedInstance];
      uint64_t v44 = [v43 activeSession];
      if (v44)
      {
        v45 = (void *)v44;
        __int16 v46 = +[CCDShieldUILifeCycleManager sharedInstance];
        [v46 activeSession];
        v47 = v87 = v10;
        v48 = [v47 deviceIdentifier];
        unsigned __int8 v86 = [v48 isEqualToString:v11];

        id v10 = v87;
        if ((v86 & 1) == 0)
        {
          v49 = CMContinuityCaptureLog();
          BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
          if (v6)
          {
            if (v50)
            {
              v51 = +[CCDShieldUILifeCycleManager sharedInstance];
              v52 = [v51 activeSession];
              *(_DWORD *)buf = 138543874;
              v92 = self;
              __int16 v93 = 2114;
              v94 = v52;
              __int16 v95 = 2114;
              v96 = (CMContinuityCaptureRapportServer *)v9;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ Shield active for %{public}@, set new connection %{public}@ as pending", buf, 0x20u);
            }
            goto LABEL_78;
          }
          if (!v50) {
            goto LABEL_71;
          }
          v82 = +[CCDShieldUILifeCycleManager sharedInstance];
          v83 = [v82 activeSession];
          *(_DWORD *)buf = 138543874;
          v92 = self;
          __int16 v93 = 2114;
          v94 = v83;
          __int16 v95 = 2114;
          v96 = (CMContinuityCaptureRapportServer *)v9;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ Shield active for %{public}@, remove new connection %{public}@ from pending state", buf, 0x20u);

LABEL_70:
LABEL_71:

          goto LABEL_72;
        }
      }
      else
      {
      }
      v39 = self->_rpServer;
      if (!v39 && v6)
      {
        v77 = CMContinuityCaptureLog();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v92 = self;
          __int16 v93 = 2114;
          v94 = (const char *)v9;
          _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ New Connection %{public}@", buf, 0x16u);
        }

        v78 = [v9 destinationDevice];
        v79 = [v78 name];
        [(CMContinuityCaptureDServer *)self launchShieldUIForDeviceIdentifier:v11 name:v79 model:v89 skipPlacementStep:v89 != 2 isDedicated:v90];

        [(CMContinuityCaptureDServer *)self createSession:v9];
        v60 = &self->_connectedRPDisplaySession;
        v61 = obj;
        goto LABEL_58;
      }
      id v7 = obj;
      if (!v39)
      {
LABEL_24:
        v42 = CMContinuityCaptureLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v92 = self;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ Unknown case", buf, 0xCu);
        }

        goto LABEL_79;
      }
      goto LABEL_22;
    }
    if (v6)
    {
      v62 = v10;
      v63 = [(CMContinuityCaptureRapportServer *)self->_rpServer displaySession];
      v64 = +[CMContinuityCaptureDServer sessionIdentifier:v63];
      unsigned int v65 = [v64 isEqualToString:v11];

      v57 = CMContinuityCaptureLog();
      BOOL v66 = os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
      if (v65)
      {
        id v10 = v62;
        if (v66)
        {
          v67 = [(CMContinuityCaptureRapportServer *)self->_rpServer displaySession];
          *(_DWORD *)buf = 138544130;
          v92 = self;
          __int16 v93 = 2114;
          v94 = v11;
          __int16 v95 = 2114;
          v96 = v67;
          __int16 v97 = 2114;
          v98 = (RPRemoteDisplaySession *)v9;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection Reset (with pending termination) for %{public}@ (%{public}@ -> %{public}@)", buf, 0x2Au);
        }
        [(CMContinuityCaptureRapportServer *)self->_rpServer resetDisplaySession:v9];
        v60 = &self->_connectedRPDisplaySession;
        v61 = v7;
        goto LABEL_58;
      }
      id v10 = v62;
      if (v66)
      {
        v85 = [(CMContinuityCaptureRapportServer *)self->_rpServer displaySession];
        *(_DWORD *)buf = 138543874;
        v92 = self;
        __int16 v93 = 2114;
        v94 = (const char *)v9;
        __int16 v95 = 2114;
        v96 = v85;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%{public}@ New Connection %{public}@ (with pending termination %{public}@)", buf, 0x20u);
      }
LABEL_77:

LABEL_78:
      [(CMContinuityCaptureDServer *)self postEvent:kCMContinuityCaptureEventCaptureSessionStarted toSession:v9];
      [(NSMutableArray *)self->_sessionsPendingActivation addObject:v9];
      goto LABEL_79;
    }
    if (![(NSMutableArray *)self->_sessionsPendingActivation containsObject:v9]) {
      goto LABEL_79;
    }
    v49 = CMContinuityCaptureLog();
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_71;
    }
    v82 = [(CMContinuityCaptureRapportServer *)self->_rpServer displaySession];
    *(_DWORD *)buf = 138543874;
    v92 = self;
    __int16 v93 = 2114;
    v94 = (const char *)v9;
    __int16 v95 = 2114;
    v96 = (CMContinuityCaptureRapportServer *)v82;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection removed %{public}@ (with pending termination %{public}@)", buf, 0x20u);
    goto LABEL_70;
  }
  __int16 v20 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v92 = self;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ can't allow connection in user disabled mode", buf, 0xCu);
  }

  [(CMContinuityCaptureDServer *)self _exitSessionIfApplicableForDeviceIdentifier:v11 exitReason:kCMContinuityCaptureSessionExitReasonUserDisabled];
LABEL_80:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  void v17[2] = sub_10000B8C4;
  v17[3] = &unk_100018AE0;
  objc_copyWeak(v21, &location);
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  v21[1] = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v71 = a4;
  id v73 = a5;
  objc_initWeak(&location, self);
  id v10 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v80 = self;
    __int16 v81 = 2112;
    id v82 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@ keypath %@", buf, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v9 isEqualToString:CMContinuityCaptureRemoteCompositeStateKVOKey])
  {
    id v11 = [v73 objectForKeyedSubscript:NSKeyValueChangeNewKey, v71];
    unint64_t v12 = (unint64_t)[v11 integerValue];

    id v13 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v80 = self;
      __int16 v81 = 2112;
      id v82 = v9;
      __int16 v83 = 1024;
      int v84 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Observe key %@ state %d", buf, 0x1Cu);
    }

    if ((v12 & 0x10) == 0) {
      goto LABEL_34;
    }
    id sessionClearOutBlock = self->_sessionClearOutBlock;
    if (sessionClearOutBlock) {
      dispatch_block_cancel(sessionClearOutBlock);
    }
    id v15 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(CMContinuityCaptureRapportServer *)self->_rpServer displaySession];
      *(_DWORD *)buf = 138543618;
      v80 = self;
      __int16 v81 = 2112;
      id v82 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ session %@ terminated", buf, 0x16u);
    }
    id v17 = [(CMContinuityCaptureRapportServer *)self->_rpServer displaySession];
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_10000C444;
    v74[3] = &unk_100018670;
    objc_copyWeak(&v75, &location);
    [(CMContinuityCaptureDServer *)self resetCurrentSession:v17 added:0 completion:v74];

    id v18 = +[CCDShieldUILifeCycleManager sharedInstance];
    id v19 = [v18 activeSession];
    if (v19)
    {
      id v20 = +[CCDShieldUILifeCycleManager sharedInstance];
      id v21 = [v20 activeSession];
      __int16 v22 = [v21 configuration];
      BOOL v23 = [v22 clientDeviceModel] == (id)2;

      if (!v23)
      {
        [(CMContinuityCaptureDServer *)self teardownShieldUI];
LABEL_33:
        objc_destroyWeak(&v75);
LABEL_34:
        v43 = +[CCDShieldUILifeCycleManager sharedInstance];
        uint64_t v44 = [v43 activeSession];
        v45 = [v44 configuration];
        [v45 setCompositeState:v12];

        unsigned int v24 = +[CMContinuityCaptureXPCServerCCD sharedInstance];
        __int16 v46 = +[CCDShieldUILifeCycleManager sharedInstance];
        v47 = [v46 activeSession];
        v48 = [v47 configuration];
        [v24 updateClientsWithConfiguration:v48];

LABEL_35:
        goto LABEL_36;
      }
    }
    else
    {
    }
    v12 |= 0x20uLL;
    goto LABEL_33;
  }
  if (objc_msgSend(v9, "isEqualToString:", CMContinuityCaptureSystemStatusPowerButtonPressedKVOKey, v71))
  {
    unsigned int v24 = [v73 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    if ([v24 BOOLValue])
    {
      unsigned int v25 = CMContinuityCaptureLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v80 = self;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, " %@ power button pressed", buf, 0xCu);
      }

      id v26 = +[CCDShieldUILifeCycleManager sharedInstance];
      __int16 v27 = [v26 activeSession];
      id v28 = [v27 pauseStateSolver];
      [v28 sideButtonPressed];

      [(CMContinuityCaptureDServer *)self _resolveUserPauseState];
      unsigned int v29 = +[CCDShieldUILifeCycleManager sharedInstance];
      id v30 = [v29 activeSession];
      __int16 v31 = [v30 pauseStateSolver];
      [v31 sideButtonReleased];
    }
    goto LABEL_35;
  }
  if ([v9 isEqualToString:CMContinuityCaptureCallStateKVOKey])
  {
    unsigned int v24 = [v73 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    if ([v24 integerValue] == (id)2)
    {
      BOOL v32 = +[CCDShieldUILifeCycleManager sharedInstance];
      __int16 v33 = [v32 activeSession];
      id v34 = [v33 pauseStateSolver];
      [v34 incomingCallDeclinedStatusUpdated:1];

      [(CMContinuityCaptureDServer *)self _resolveUserPauseState];
      __int16 v35 = +[CCDShieldUILifeCycleManager sharedInstance];
      id v36 = [v35 activeSession];
      __int16 v37 = [v36 pauseStateSolver];
      [v37 incomingCallDeclinedStatusUpdated:0];
    }
    if (([v24 integerValue] == (id)2
       || [v24 integerValue] == (id)1)
      && [(NSMutableArray *)self->_sessionsPendingActivation count])
    {
      unsigned __int8 v38 = CMContinuityCaptureLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = [(NSMutableArray *)self->_sessionsPendingActivation firstObject];
        *(_DWORD *)buf = 138412546;
        v80 = self;
        __int16 v81 = 2114;
        id v82 = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, " %@ call ended, resume session %{public}@", buf, 0x16u);
      }
      v40 = [(NSMutableArray *)self->_sessionsPendingActivation firstObject];
      [(CMContinuityCaptureDServer *)self postEvent:kCMContinuityCaptureEventStreamDisableForDeviceInUseExit toSession:v40];

      [(NSMutableArray *)self->_sessionsPendingActivation removeObjectAtIndex:0];
    }
    goto LABEL_35;
  }
  if (![v9 isEqualToString:CMContinuityCaptureRemoteStreamPreStartConfigKVOKey]) {
    goto LABEL_41;
  }
  unsigned __int8 v41 = [v73 objectForKeyedSubscript:NSKeyValueChangeNewKey];
  v42 = +[NSNull null];
  if ([v41 isEqual:v42])
  {

    goto LABEL_41;
  }
  v49 = [v73 objectForKeyedSubscript:NSKeyValueChangeOldKey];
  BOOL v50 = +[NSNull null];
  unsigned int v51 = [v49 isEqual:v50];

  if (!v51)
  {
LABEL_41:
    if (![v9 isEqualToString:@"activeSession"]) {
      goto LABEL_36;
    }
    id v53 = [v73 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    v54 = +[NSNull null];
    if ([v53 isEqual:v54])
    {
      v55 = [v73 objectForKeyedSubscript:NSKeyValueChangeOldKey];
      unsigned int v56 = +[NSNull null];
      unsigned __int8 v57 = [v55 isEqual:v56];

      if ((v57 & 1) == 0)
      {
        unsigned int v24 = CMContinuityCaptureLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v58 = [v73 objectForKeyedSubscript:NSKeyValueChangeOldKey];
          *(_DWORD *)buf = 138412546;
          v80 = self;
          __int16 v81 = 2114;
          id v82 = v58;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, " %@ session terminated %{public}@", buf, 0x16u);
        }
        goto LABEL_35;
      }
    }
    else
    {
    }
    unsigned int v24 = [v73 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    v59 = +[NSNull null];
    if ([v24 isEqual:v59])
    {
    }
    else
    {
      v60 = [v73 objectForKeyedSubscript:NSKeyValueChangeOldKey];
      v61 = +[NSNull null];
      unsigned int v62 = [v60 isEqual:v61];

      if (!v62) {
        goto LABEL_36;
      }
      v63 = CMContinuityCaptureLog();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        v64 = [v73 objectForKeyedSubscript:NSKeyValueChangeNewKey];
        *(_DWORD *)buf = 138412546;
        v80 = self;
        __int16 v81 = 2114;
        id v82 = v64;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, " %@ session started %{public}@", buf, 0x16u);
      }
      uint64_t v77 = ContinuityCaptureRapportClientMessageTypeKey;
      v78 = &off_100019000;
      unsigned int v24 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
      unsigned int v65 = +[CCDShieldUILifeCycleManager sharedInstance];
      BOOL v66 = [v65 activeSession];
      v67 = [v66 deviceIdentifier];
      v68 = +[CCDShieldUILifeCycleManager sharedInstance];
      uint64_t v69 = [v68 activeSession];
      v70 = [v69 configuration];
      -[CMContinuityCaptureDServer relayMessage:toDeviceWithIdentifier:andModel:](self, "relayMessage:toDeviceWithIdentifier:andModel:", v24, v67, [v70 clientDeviceModel]);
    }
    goto LABEL_35;
  }
  v52 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v80 = self;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, " %@ session prestarted, evaluate shield state", buf, 0xCu);
  }

  [(CMContinuityCaptureDServer *)self _resolveUserPauseState];
LABEL_36:
  objc_destroyWeak(&location);
}

- (void)_resolveUserPauseState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v3 = +[CCDShieldUILifeCycleManager sharedInstance];
  id v4 = [v3 activeSession];
  id v5 = [v4 pauseStateSolver];
  unsigned int v6 = [v5 resolvePauseState];

  id v7 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    id v13 = "-[CMContinuityCaptureDServer _resolveUserPauseState]";
    __int16 v14 = 1024;
    unsigned int v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s paused: %d", (uint8_t *)&v12, 0x12u);
  }

  unsigned int v8 = [(CMContinuityCaptureRapportServer *)self->_rpServer compositeDevice];

  if (v8)
  {
    id v9 = [(CMContinuityCaptureRapportServer *)self->_rpServer compositeDevice];
    id v10 = v9;
    id v11 = &kCMContinuityCaptureEventUserPause;
    if (!v6) {
      id v11 = &kCMContinuityCaptureEventUserResume;
    }
    [v9 postEvent:*v11 entity:0 data:0];

    +[CMContinuityCaptureRemoteCompositeDevice setWombatMode:v6 ^ 1];
  }
}

- (void)_skipPlacementStepIfApplicable
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v3 = +[CCDShieldUILifeCycleManager sharedInstance];
  id v4 = [v3 activeSession];
  id v5 = [v4 configuration];
  unsigned int v6 = [v5 placementStepSkipped];

  if ([v6 isEqualToNumber:&__kCFBooleanFalse])
  {
    id v7 = +[CCDShieldUILifeCycleManager sharedInstance];
    unsigned int v8 = [v7 activeSession];
    id v9 = [v8 deviceIdentifier];

    uint64_t v21 = ContinuityCaptureRapportClientMessageTypeKey;
    __int16 v22 = &off_100019018;
    id v10 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v11 = +[CCDShieldUILifeCycleManager sharedInstance];
    int v12 = [v11 activeSession];
    id v13 = [v12 configuration];
    -[CMContinuityCaptureDServer relayMessage:toDeviceWithIdentifier:andModel:](self, "relayMessage:toDeviceWithIdentifier:andModel:", v10, v9, [v13 clientDeviceModel]);

    __int16 v14 = +[CCDShieldUILifeCycleManager sharedInstance];
    unsigned int v15 = [v14 activeSession];
    id v16 = [v15 configuration];
    [v16 setPlacementStepSkipped:&__kCFBooleanTrue];

    id v17 = +[CMContinuityCaptureXPCServerCCD sharedInstance];
    id v18 = +[CCDShieldUILifeCycleManager sharedInstance];
    id v19 = [v18 activeSession];
    id v20 = [v19 configuration];
    [v17 updateClientsWithConfiguration:v20];
  }
  else
  {
    id v9 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      unsigned int v24 = self;
      __int16 v25 = 2080;
      id v26 = "-[CMContinuityCaptureDServer _skipPlacementStepIfApplicable]";
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %s current active session has placementStepSkipped %@. Ignore processing skip placement step", buf, 0x20u);
    }
  }
}

- (void)_exitSessionIfApplicableForDeviceIdentifier:(id)a3 exitReason:(id)a4
{
  unsigned int v6 = (char *)a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v6)
  {
    id v10 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000101B0((uint64_t)self, (uint64_t)v7, v10);
    }
    goto LABEL_14;
  }
  if ([(RPRemoteDisplayDiscovery *)self->_rpRemoteDisplayDiscovery currentState] != 1)
  {
    id v10 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = [(RPRemoteDisplayDiscovery *)self->_rpRemoteDisplayDiscovery currentState];
      int v15 = 138544386;
      id v16 = self;
      __int16 v17 = 2080;
      id v18 = "-[CMContinuityCaptureDServer _exitSessionIfApplicableForDeviceIdentifier:exitReason:]";
      __int16 v19 = 2112;
      id v20 = (RPRemoteDisplayDiscovery *)v6;
      __int16 v21 = 2112;
      id v22 = v7;
      __int16 v23 = 1024;
      LODWORD(v24) = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s igoring request to exit session for device %@ with reason %@. rapport session state %d", (uint8_t *)&v15, 0x30u);
    }
    goto LABEL_14;
  }
  unsigned int v8 = [(RPRemoteDisplayDiscovery *)self->_rpRemoteDisplayDiscovery peerDeviceIdentifier];
  unsigned __int8 v9 = [v8 isEqualToString:v6];

  id v10 = CMContinuityCaptureLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) == 0)
  {
    if (v11)
    {
      __int16 v14 = [(RPRemoteDisplayDiscovery *)self->_rpRemoteDisplayDiscovery peerDeviceIdentifier];
      int v15 = 138544386;
      id v16 = self;
      __int16 v17 = 2080;
      id v18 = "-[CMContinuityCaptureDServer _exitSessionIfApplicableForDeviceIdentifier:exitReason:]";
      __int16 v19 = 2112;
      id v20 = (RPRemoteDisplayDiscovery *)v6;
      __int16 v21 = 2112;
      id v22 = v7;
      __int16 v23 = 2112;
      unsigned int v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s igoring request to exit session for device %@ with reason %@. rapport session device %@", (uint8_t *)&v15, 0x34u);
    }
LABEL_14:

    goto LABEL_7;
  }
  if (v11)
  {
    rpRemoteDisplayDiscovery = self->_rpRemoteDisplayDiscovery;
    int v15 = 138544130;
    id v16 = self;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = rpRemoteDisplayDiscovery;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ currently in session with device %@. Calling %@ to exit session for reason %@, ", (uint8_t *)&v15, 0x2Au);
  }

  [(RPRemoteDisplayDiscovery *)self->_rpRemoteDisplayDiscovery exitDiscoverySessionWithReason:v7];
LABEL_7:
}

- (void)updateSystemStateForDeviceIdentifier:(id)a3 andModel:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = objc_alloc((Class)CMContinuityCaptureControl);
  uint64_t v8 = kCMContinuityCaptureControlBatteryLevel;
  unsigned __int8 v9 = +[CMContinuityCaptureBatteryStateMonitor sharedInstance];
  id v10 = [v9 batteryLevel];
  *(_OWORD *)buf = xmmword_100012478;
  *(void *)&buf[16] = 0;
  id v11 = [v7 initWithName:v8 attributes:0 entity:4 minimumSupportedVersion:buf value:v10];

  id v26 = 0;
  int v12 = +[NSKeyedArchiver archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v26];
  id v13 = v26;
  if (v12)
  {
    __int16 v14 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2114;
      id v30 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ dispatch update for %{public}@ to %{public}@", buf, 0x20u);
    }

    [v6 addObject:v12];
  }
  id v15 = objc_alloc((Class)CMContinuityCaptureControl);
  uint64_t v16 = kCMContinuityCaptureControlBatteryState;
  __int16 v17 = +[CMContinuityCaptureBatteryStateMonitor sharedInstance];
  id v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v17 batteryState]);
  *(_OWORD *)buf = xmmword_100012478;
  *(void *)&buf[16] = 0;
  id v19 = [v15 initWithName:v16 attributes:0 entity:4 minimumSupportedVersion:buf value:v18];

  id v25 = v13;
  id v20 = +[NSKeyedArchiver archivedDataWithRootObject:v19 requiringSecureCoding:1 error:&v25];
  id v21 = v25;

  if (v20)
  {
    id v22 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2114;
      id v30 = v5;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ dispatch update for %{public}@ to %{public}@", buf, 0x20u);
    }

    [v6 addObject:v20];
  }
  v27[0] = ContinuityCaptureRapportClientMessageTypeKey;
  v27[1] = ContinuityCaptureRapportClientSystemControlsKey;
  v28[0] = &off_100019030;
  v28[1] = v6;
  __int16 v23 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  [(CMContinuityCaptureDServer *)self relayMessage:v23 toDeviceWithIdentifier:v5 andModel:a4];
}

- (void)setupRPRemoteDisplayDiscovery
{
  objc_initWeak(&location, self);
  BOOL v3 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = self;
    __int16 v17 = 2080;
    id v18 = "-[CMContinuityCaptureDServer setupRPRemoteDisplayDiscovery]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s ", buf, 0x16u);
  }

  id v4 = objc_alloc_init((Class)RPRemoteDisplayDiscovery);
  objc_storeStrong((id *)&self->_rpRemoteDisplayDiscovery, v4);
  [(RPRemoteDisplayDiscovery *)self->_rpRemoteDisplayDiscovery setDispatchQueue:self->_queue];
  rpRemoteDisplayDiscovery = self->_rpRemoteDisplayDiscovery;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000D1CC;
  v12[3] = &unk_100018B08;
  objc_copyWeak(&v13, &location);
  [(RPRemoteDisplayDiscovery *)rpRemoteDisplayDiscovery setDiscoverySessionStateChangedHandler:v12];
  id v6 = self->_rpRemoteDisplayDiscovery;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_10000D374;
  v10[3] = &unk_100018B30;
  objc_copyWeak(&v11, &location);
  [(RPRemoteDisplayDiscovery *)v6 setDedicatedDeviceChangedHandler:v10];
  id v7 = self->_rpRemoteDisplayDiscovery;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  id v8[2] = sub_10000D560;
  v8[3] = &unk_100018838;
  objc_copyWeak(&v9, &location);
  [(RPRemoteDisplayDiscovery *)v7 activateWithCompletion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
}

- (BOOL)setupSidebandRPClient
{
  BOOL v3 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v28 = self;
    __int16 v29 = 2080;
    id v30 = "-[CMContinuityCaptureDServer setupSidebandRPClient]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s ", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  id v4 = objc_alloc_init((Class)RPCompanionLinkClient);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000DA84;
  v25[3] = &unk_100018670;
  objc_copyWeak(&v26, (id *)buf);
  id v5 = objc_retainBlock(v25);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000DB3C;
  v23[3] = &unk_100018670;
  objc_copyWeak(&v24, (id *)buf);
  id v6 = objc_retainBlock(v23);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  id v20[2] = sub_10000DBF4;
  v20[3] = &unk_100018B58;
  objc_copyWeak(&v22, (id *)buf);
  id v7 = v4;
  id v21 = v7;
  uint64_t v8 = objc_retainBlock(v20);
  if (v7)
  {
    p_rpSidebandCompanionLinkClient = &self->_rpSidebandCompanionLinkClient;
    objc_storeStrong((id *)p_rpSidebandCompanionLinkClient, v4);
    id v10 = *p_rpSidebandCompanionLinkClient;
    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.continuitycapture.rapportsideband", v11);
    [(RPCompanionLinkClient *)v10 setDispatchQueue:v12];

    [(RPCompanionLinkClient *)*p_rpSidebandCompanionLinkClient setInvalidationHandler:v5];
    [(RPCompanionLinkClient *)*p_rpSidebandCompanionLinkClient setInterruptionHandler:v6];
    [(RPCompanionLinkClient *)*p_rpSidebandCompanionLinkClient setErrorFlagsChangedHandler:v8];
    [(RPCompanionLinkClient *)*p_rpSidebandCompanionLinkClient setServiceType:ContinuityCaptureRapportSidebandServiceType];
    [(RPCompanionLinkClient *)*p_rpSidebandCompanionLinkClient setControlFlags:(unint64_t)[(RPCompanionLinkClient *)*p_rpSidebandCompanionLinkClient controlFlags] | 0x180000010006];
    id v13 = *p_rpSidebandCompanionLinkClient;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    void v18[2] = sub_10000DCC8;
    v18[3] = &unk_100018BA8;
    objc_copyWeak(&v19, (id *)buf);
    [(RPCompanionLinkClient *)v13 registerEventID:ContinuityCaptureSidebandSessionEventID options:0 handler:v18];
    __int16 v14 = *p_rpSidebandCompanionLinkClient;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    void v16[2] = sub_10000EA00;
    v16[3] = &unk_100018838;
    objc_copyWeak(&v17, (id *)buf);
    [(RPCompanionLinkClient *)v14 activateWithCompletion:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
  return v7 != 0;
}

- (void)setupDisplayServer
{
  BOOL v3 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = self;
    __int16 v23 = 2080;
    id v24 = "-[CMContinuityCaptureDServer setupDisplayServer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s ", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  void v19[2] = sub_10000EE0C;
  v19[3] = &unk_100018670;
  objc_copyWeak(&v20, (id *)buf);
  id v4 = objc_retainBlock(v19);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  void v17[2] = sub_10000EF1C;
  v17[3] = &unk_100018670;
  objc_copyWeak(&v18, (id *)buf);
  id v5 = objc_retainBlock(v17);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000EFD4;
  v15[3] = &unk_100018C10;
  objc_copyWeak(&v16, (id *)buf);
  id v6 = objc_retainBlock(v15);
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  dispatch_queue_t v12 = sub_10000F188;
  id v13 = &unk_100018C58;
  objc_copyWeak(&v14, (id *)buf);
  id v7 = objc_retainBlock(&v10);
  uint64_t v8 = (RPRemoteDisplayServer *)objc_alloc_init((Class)RPRemoteDisplayServer);
  rpDisplayServer = self->_rpDisplayServer;
  self->_rpDisplayServer = v8;

  -[RPRemoteDisplayServer setServiceType:](self->_rpDisplayServer, "setServiceType:", ContinuityCaptureRapportServiceType, v10, v11, v12, v13);
  [(RPRemoteDisplayServer *)self->_rpDisplayServer setInterruptionHandler:v4];
  [(RPRemoteDisplayServer *)self->_rpDisplayServer setInvalidationHandler:v5];
  [(RPRemoteDisplayServer *)self->_rpDisplayServer setDispatchQueue:self->_queue];
  [(RPRemoteDisplayServer *)self->_rpDisplayServer setSessionStartHandler:v6];
  [(RPRemoteDisplayServer *)self->_rpDisplayServer setSessionEndedHandler:v7];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

- (void)lockScreenLayoutMonitor:(id)a3 didUpdateLayoutWithShieldFrontMost:(BOOL)a4 lockscreenInLayout:(BOOL)a5
{
  BOOL v5 = a5;
  objc_initWeak(&location, self);
  if (v5)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F6DC;
    block[3] = &unk_100018A18;
    objc_copyWeak(&v10, &location);
    BOOL v11 = a4;
    dispatch_async(queue, block);
    objc_destroyWeak(&v10);
  }
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidebandMessageQueue, 0);
  objc_storeStrong((id *)&self->_lockScreenLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_rpRemoteDisplayDiscovery, 0);
  objc_storeStrong((id *)&self->_shieldLaunchCheckQueue, 0);
  objc_storeStrong((id *)&self->_rpSidebandCompanionLinkClient, 0);
  objc_storeStrong((id *)&self->_sessionsPendingActivation, 0);
  objc_storeStrong((id *)&self->_connectedRPDisplaySession, 0);
  objc_storeStrong(&self->_sessionClearOutBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_rpSidebandDisplayServer, 0);
  objc_storeStrong((id *)&self->_rpDisplayServer, 0);

  objc_storeStrong((id *)&self->_rpServer, 0);
}

@end