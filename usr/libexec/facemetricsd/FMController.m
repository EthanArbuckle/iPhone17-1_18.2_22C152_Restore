@interface FMController
- (BOOL)registerForLockStatusNotifications;
- (BOOL)registerForMessagesAppForegroundedNotifications;
- (BPSSink)sink;
- (FMCameraSession)cameraSession;
- (FMController)init;
- (NSMutableDictionary)cachedBundleIdElgibility;
- (OS_dispatch_source)deviceUnlockTimer;
- (OS_dispatch_source)messageAppForegroundedTimer;
- (unsigned)cameraSessionActiveReason;
- (void)handleDeviceLockAtTimestamp:(id *)a3;
- (void)handleDeviceUnlockAtTimestamp:(id *)a3;
- (void)handleFacialMetricsPacket:(id)a3 withTimestamp:(unint64_t)a4;
- (void)handleLockStatusNotificationAtTimestamp:(id *)a3;
- (void)handleMessageAppBackgroundedWithTimestamp:(double)a3;
- (void)handleMessageAppForegroundedWithTimestamp:(double)a3;
- (void)handleMessageAppStatusNotification:(id)a3;
- (void)reportSkBundleIdEligibilityCheckLatencyWithStartTimestamp:(unint64_t)a3 andStopTimestamp:(unint64_t)a4;
- (void)requestToStopCameraSession;
- (void)sensorWriterDidStopMonitoring:(id)a3;
- (void)sensorWriterWillStartMonitoring:(id)a3;
- (void)setCachedBundleIdElgibility:(id)a3;
- (void)setCameraSession:(id)a3;
- (void)setCameraSessionActiveReason:(unsigned __int8)a3;
- (void)setDeviceUnlockTimer:(id)a3;
- (void)setMessageAppForegroundedTimer:(id)a3;
- (void)setSink:(id)a3;
- (void)setupCameraSession;
- (void)stopCameraSession;
@end

@implementation FMController

- (FMController)init
{
  v20.receiver = self;
  v20.super_class = (Class)FMController;
  v2 = [(FMController *)&v20 init];
  if (!v2) {
    goto LABEL_12;
  }
  uint64_t v3 = objc_opt_new();
  cachedBundleIdElgibility = v2->_cachedBundleIdElgibility;
  v2->_cachedBundleIdElgibility = (NSMutableDictionary *)v3;

  v5 = sub_100007078();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = +[NSBundle mainBundle];
    v7 = [v6 infoDictionary];
    v8 = [v7 objectForKeyedSubscript:kCFBundleVersionKey];
    *(_DWORD *)buf = 138543362;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "version: %{public}@", buf, 0xCu);
  }
  if (!+[FMCameraSession deviceIsSupported])
  {
    v18 = sub_100007078();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "device is not supported", buf, 2u);
    }
    goto LABEL_11;
  }
  +[STDynamicActivityAttributionPublisher setCurrentAttributionKey:0 andApp:@"com.apple.Research"];
  v2->_deviceIsUnlocked = MKBGetDeviceLockState() == 0;
  dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  deviceUnlockTimer = v2->_deviceUnlockTimer;
  v2->_deviceUnlockTimer = (OS_dispatch_source *)v9;

  dispatch_source_t v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  messageAppForegroundedTimer = v2->_messageAppForegroundedTimer;
  v2->_messageAppForegroundedTimer = (OS_dispatch_source *)v11;

  v13 = 0;
  if ([(FMController *)v2 registerForLockStatusNotifications])
  {
    if (![(FMController *)v2 registerForMessagesAppForegroundedNotifications])
    {
LABEL_12:
      v13 = 0;
      goto LABEL_13;
    }
    id v14 = objc_alloc((Class)SRSensorWriter);
    v15 = (SRSensorWriter *)[v14 initWithIdentifier:SRSensorFacialMetrics];
    sensorWriter = v2->_sensorWriter;
    v2->_sensorWriter = v15;

    v17 = v2->_sensorWriter;
    if (v17)
    {
      [(SRSensorWriter *)v17 setDelegate:v2];
      v13 = v2;
      goto LABEL_13;
    }
    v18 = sub_100007078();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_1000078A0();
    }
LABEL_11:

    goto LABEL_12;
  }
LABEL_13:

  return v13;
}

- (BOOL)registerForLockStatusNotifications
{
  objc_initWeak(&location, self);
  int out_token = -1;
  id v2 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100004540;
  handler[3] = &unk_10000C4C0;
  objc_copyWeak(&v7, &location);
  uint32_t v3 = notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);

  if (v3)
  {
    v4 = sub_100007078();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000078E0(v3, v4);
    }
  }
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v3 == 0;
}

- (void)handleLockStatusNotificationAtTimestamp:(id *)a3
{
  BOOL deviceIsUnlocked = self->_deviceIsUnlocked;
  if (deviceIsUnlocked != (MKBGetDeviceLockState() == 0))
  {
    BOOL v6 = self->_deviceIsUnlocked;
    self->_BOOL deviceIsUnlocked = !v6;
    long long v7 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    if (v6) {
      [(FMController *)self handleDeviceLockAtTimestamp:&v7];
    }
    else {
      [(FMController *)self handleDeviceUnlockAtTimestamp:&v7];
    }
  }
}

- (void)handleDeviceUnlockAtTimestamp:(id *)a3
{
  v5 = sub_100007078();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "device just unlocked", buf, 2u);
  }

  if ([(SRSensorWriter *)self->_sensorWriter isMonitoring])
  {
    BOOL v6 = [(FMController *)self cameraSession];

    if (v6)
    {
      long long v7 = sub_100007078();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        sub_100007958();
      }

      [(FMController *)self setCameraSessionActiveReason:0];
      [(FMController *)self requestToStopCameraSession];
    }
    [(FMController *)self setCameraSessionActiveReason:[(FMController *)self cameraSessionActiveReason] | 1];
    [(FMController *)self setupCameraSession];
    v8 = [(FMController *)self cameraSession];
    *(_OWORD *)buf = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    [v8 generateUnlockSessionIdWithSessionStartTimestamp:buf];

    dispatch_source_t v9 = [(FMController *)self cameraSession];
    [v9 startCameraSession];

    dispatch_time_t v10 = dispatch_time(0, 5000000000);
    dispatch_source_t v11 = [(FMController *)self deviceUnlockTimer];
    dispatch_source_set_timer(v11, v10, 0xFFFFFFFFFFFFFFFFLL, 0);

    v12 = [(FMController *)self deviceUnlockTimer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100004818;
    handler[3] = &unk_10000C4E8;
    void handler[4] = self;
    dispatch_source_set_event_handler(v12, handler);

    v13 = [(FMController *)self deviceUnlockTimer];
    dispatch_activate(v13);
  }
}

- (void)handleDeviceLockAtTimestamp:(id *)a3
{
  v5 = sub_100007078();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "device just locked", (uint8_t *)&v7, 2u);
  }

  [(FMController *)self setCameraSessionActiveReason:0];
  BOOL v6 = [(FMController *)self cameraSession];
  long long v7 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  [v6 updateUnlockSessionWithSessionStopTimestamp:&v7];

  [(FMController *)self requestToStopCameraSession];
}

- (BOOL)registerForMessagesAppForegroundedNotifications
{
  objc_initWeak(&location, self);
  uint32_t v3 = +[BMStreams appLaunch];
  id v4 = objc_alloc((Class)BMBiomeScheduler);
  id v5 = &_dispatch_main_q;
  id v6 = [v4 initWithIdentifier:@"com.apple.facemetricsd" targetQueue:&_dispatch_main_q waking:1];

  long long v7 = [v3 publisher];
  v8 = [v7 subscribeOn:v6];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100004B20;
  v11[3] = &unk_10000C578;
  v11[4] = self;
  objc_copyWeak(&v12, &location);
  dispatch_source_t v9 = [v8 sinkWithCompletion:&stru_10000C528 receiveInput:v11];
  [(FMController *)self setSink:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return 1;
}

- (void)handleMessageAppStatusNotification:(id)a3
{
  id v4 = a3;
  int messageAppForegrounded = self->_messageAppForegrounded;
  if (messageAppForegrounded == [v4 isStarting])
  {
    id v6 = sub_100007078();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100007A10();
    }
  }
  else
  {
    BOOL v7 = self->_messageAppForegrounded;
    self->_int messageAppForegrounded = !v7;
    v8 = sub_100007078();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        dispatch_time_t v10 = [v4 bundleID];
        int v12 = 138412290;
        v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ backgrounded", (uint8_t *)&v12, 0xCu);
      }
      [v4 absoluteTimestamp];
      -[FMController handleMessageAppBackgroundedWithTimestamp:](self, "handleMessageAppBackgroundedWithTimestamp:");
    }
    else
    {
      if (v9)
      {
        dispatch_source_t v11 = [v4 bundleID];
        int v12 = 138412290;
        v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ foregrounded", (uint8_t *)&v12, 0xCu);
      }
      [v4 absoluteTimestamp];
      -[FMController handleMessageAppForegroundedWithTimestamp:](self, "handleMessageAppForegroundedWithTimestamp:");
    }
  }
}

- (void)handleMessageAppForegroundedWithTimestamp:(double)a3
{
  if ([(SRSensorWriter *)self->_sensorWriter isMonitoring])
  {
    [(FMController *)self setCameraSessionActiveReason:[(FMController *)self cameraSessionActiveReason] | 2];
    id v5 = [(FMController *)self cameraSession];

    if (v5)
    {
      id v6 = [(FMController *)self cameraSession];
      [v6 generateMessageSessionIdWithSessionStartTimestamp:a3];
    }
    else
    {
      [(FMController *)self setupCameraSession];
      BOOL v7 = [(FMController *)self cameraSession];
      [v7 generateMessageSessionIdWithSessionStartTimestamp:a3];

      id v6 = [(FMController *)self cameraSession];
      [v6 startCameraSession];
    }

    v8 = [(FMController *)self cameraSession];
    [v8 generateMessageSessionIdWithSessionStartTimestamp:a3];

    dispatch_time_t v9 = dispatch_time(0, 30000000000);
    dispatch_time_t v10 = [(FMController *)self messageAppForegroundedTimer];
    dispatch_source_set_timer(v10, v9, 0xFFFFFFFFFFFFFFFFLL, 0);

    dispatch_source_t v11 = [(FMController *)self messageAppForegroundedTimer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000052A0;
    handler[3] = &unk_10000C4E8;
    void handler[4] = self;
    dispatch_source_set_event_handler(v11, handler);

    int v12 = [(FMController *)self messageAppForegroundedTimer];
    dispatch_activate(v12);
  }
}

- (void)handleMessageAppBackgroundedWithTimestamp:(double)a3
{
  [(FMController *)self setCameraSessionActiveReason:[(FMController *)self cameraSessionActiveReason] & 0xFFFFFFFD];
  id v5 = [(FMController *)self cameraSession];
  [v5 updateMessageSessionWithSessionStopTimestamp:a3];

  [(FMController *)self requestToStopCameraSession];
}

- (void)setupCameraSession
{
  uint32_t v3 = sub_100007078();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "setting up the camera", buf, 2u);
  }

  id v4 = objc_opt_new();
  [(FMController *)self setCameraSession:v4];

  id v5 = [(FMController *)self cameraSession];

  if (v5)
  {
    id v6 = [(FMController *)self cameraSession];
    [v6 resetUnlockSessionId];

    BOOL v7 = [(FMController *)self cameraSession];
    [v7 resetMessageSessionId];

    v8 = sub_100007078();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_time_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "started camera session", v10, 2u);
    }

    dispatch_time_t v9 = [(FMController *)self cameraSession];
    [v9 setDelegate:self];
  }
  else
  {
    dispatch_time_t v9 = sub_100007078();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100007A50();
    }
  }
}

- (void)requestToStopCameraSession
{
  uint32_t v3 = [(FMController *)self cameraSession];

  if (v3)
  {
    if ([(FMController *)self cameraSessionActiveReason])
    {
      id v4 = sub_100007078();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ignore reqeust to stop camera session due to a timer being active", v5, 2u);
      }
    }
    else
    {
      [(FMController *)self stopCameraSession];
    }
  }
}

- (void)stopCameraSession
{
  uint32_t v3 = sub_100007078();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "stopping camera session", v5, 2u);
  }

  id v4 = [(FMController *)self cameraSession];
  [v4 stop];

  [(FMController *)self setCameraSession:0];
}

- (void)handleFacialMetricsPacket:(id)a3 withTimestamp:(unint64_t)a4
{
  id v6 = a3;
  if ([(SRSensorWriter *)self->_sensorWriter isMonitoring])
  {
    BOOL v7 = sub_100007078();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100007B08(v6, a4, v7);
    }

    sensorWriter = self->_sensorWriter;
    id v12 = 0;
    unsigned __int8 v9 = [(SRSensorWriter *)sensorWriter provideSampleData:v6 continuousTimestamp:a4 error:&v12];
    id v10 = v12;
    if ((v9 & 1) == 0)
    {
      dispatch_source_t v11 = sub_100007078();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100007A90((uint64_t)v10, v11);
      }
    }
  }
}

- (void)reportSkBundleIdEligibilityCheckLatencyWithStartTimestamp:(unint64_t)a3 andStopTimestamp:(unint64_t)a4
{
  CFStringRef v6 = @"skLatencyMilliSeconds";
  id v4 = +[NSNumber numberWithDouble:(double)(a4 - a3) / 1000000.0];
  BOOL v7 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  AnalyticsSendEvent();
}

- (void)sensorWriterWillStartMonitoring:(id)a3
{
  uint32_t v3 = sub_100007078();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "sensor writer is now monitoring", v4, 2u);
  }

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_10000C5B8);
}

- (void)sensorWriterDidStopMonitoring:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005930;
  block[3] = &unk_10000C4E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (FMCameraSession)cameraSession
{
  return self->_cameraSession;
}

- (void)setCameraSession:(id)a3
{
}

- (BPSSink)sink
{
  return self->_sink;
}

- (void)setSink:(id)a3
{
}

- (unsigned)cameraSessionActiveReason
{
  return self->_cameraSessionActiveReason;
}

- (void)setCameraSessionActiveReason:(unsigned __int8)a3
{
  self->_cameraSessionActiveReason = a3;
}

- (OS_dispatch_source)deviceUnlockTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDeviceUnlockTimer:(id)a3
{
}

- (OS_dispatch_source)messageAppForegroundedTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMessageAppForegroundedTimer:(id)a3
{
}

- (NSMutableDictionary)cachedBundleIdElgibility
{
  return self->_cachedBundleIdElgibility;
}

- (void)setCachedBundleIdElgibility:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedBundleIdElgibility, 0);
  objc_storeStrong((id *)&self->_messageAppForegroundedTimer, 0);
  objc_storeStrong((id *)&self->_deviceUnlockTimer, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_cameraSession, 0);

  objc_storeStrong((id *)&self->_sensorWriter, 0);
}

@end