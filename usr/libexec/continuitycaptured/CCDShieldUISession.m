@interface CCDShieldUISession
- (BOOL)willTerminate;
- (CCDPauseStateSolver)pauseStateSolver;
- (CCDShieldUISession)initWithDeviceIdentifier:(id)a3 name:(id)a4 model:(int64_t)a5 placementStepSkipped:(id)a6 isDedicated:(BOOL)a7 sessionInterruptionBlock:(id)a8;
- (CMContinuityCaptureUIConfiguration)configuration;
- (NSString)deviceIdentifier;
- (NSString)sessionID;
- (id)description;
- (void)_setupShieldLifecycleMonitorForCurrentSession;
- (void)invalidate;
- (void)setWillTerminate:(BOOL)a3;
- (void)setupShieldLifecycleMonitorForCurrentSession;
@end

@implementation CCDShieldUISession

- (CCDShieldUISession)initWithDeviceIdentifier:(id)a3 name:(id)a4 model:(int64_t)a5 placementStepSkipped:(id)a6 isDedicated:(BOOL)a7 sessionInterruptionBlock:(id)a8
{
  BOOL v9 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  v34.receiver = self;
  v34.super_class = (Class)CCDShieldUISession;
  v19 = [(CCDShieldUISession *)&v34 init];
  if (v19)
  {
    v20 = (CMContinuityCaptureUIConfiguration *)objc_alloc_init((Class)CMContinuityCaptureUIConfiguration);
    configuration = v19->_configuration;
    v19->_configuration = v20;

    [(CMContinuityCaptureUIConfiguration *)v19->_configuration setClientDeviceModel:a5];
    [(CMContinuityCaptureUIConfiguration *)v19->_configuration setClientName:v16];
    [(CMContinuityCaptureUIConfiguration *)v19->_configuration setIsDedicated:v9];
    objc_storeStrong((id *)&v19->_deviceIdentifier, a3);
    v22 = objc_opt_new();
    uint64_t v23 = [v22 UUIDString];
    sessionID = v19->_sessionID;
    v19->_sessionID = (NSString *)v23;

    v25 = objc_alloc_init(CCDPauseStateSolver);
    pauseStateSolver = v19->_pauseStateSolver;
    v19->_pauseStateSolver = v25;

    [(CMContinuityCaptureUIConfiguration *)v19->_configuration setPlacementStepSkipped:v17];
    id v27 = objc_retainBlock(v18);
    id sessionInterruptionBlock = v19->_sessionInterruptionBlock;
    v19->_id sessionInterruptionBlock = v27;

    uint64_t v29 = dispatch_get_global_queue(0, 0);
    shieldUILaunchMonitorQueue = v19->_shieldUILaunchMonitorQueue;
    v19->_shieldUILaunchMonitorQueue = (OS_dispatch_queue *)v29;

    if (a5 == 2)
    {
      v31 = +[CMContinuityCapturePongSoundManager sharedInstance];
      v32 = v31;
      if (v9) {
        [v31 clearPongHistory];
      }
      else {
        [v31 pongIfNeededWithShouldConsiderPongHistory:0 forIdentifier:v19->_deviceIdentifier];
      }
    }
  }

  return v19;
}

- (void)setWillTerminate:(BOOL)a3
{
}

- (BOOL)willTerminate
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_willTerminate);
  return v2 & 1;
}

- (void)setupShieldLifecycleMonitorForCurrentSession
{
  objc_initWeak(&location, self);
  shieldUILaunchMonitorQueue = self->_shieldUILaunchMonitorQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100002CE4;
  v4[3] = &unk_100018670;
  objc_copyWeak(&v5, &location);
  dispatch_async(shieldUILaunchMonitorQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_setupShieldLifecycleMonitorForCurrentSession
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_shieldUILaunchMonitorQueue);
  if (!self->_shieldUIProcessHandle)
  {
    objc_initWeak(&location, self);
    v3 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:@"com.apple.ContinuityCaptureShieldUI"];
    id v24 = 0;
    v4 = +[RBSProcessHandle handleForPredicate:v3 error:&v24];
    id v5 = v24;
    shieldUIProcessHandle = self->_shieldUIProcessHandle;
    self->_shieldUIProcessHandle = v4;

    if (self->_shieldUIProcessHandle)
    {
      v7 = CMContinuityCaptureLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = self->_shieldUIProcessHandle;
        *(_DWORD *)buf = 138543618;
        id v27 = self;
        __int16 v28 = 2114;
        uint64_t v29 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ setup monitor for %{public}@", buf, 0x16u);
      }

      BOOL v9 = self->_shieldUIProcessHandle;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100003114;
      v22[3] = &unk_100018698;
      objc_copyWeak(&v23, &location);
      [(RBSProcessHandle *)v9 monitorForDeath:v22];
      v10 = self;
      objc_sync_enter(v10);
      waitShieldLaunchTimer = v10->_waitShieldLaunchTimer;
      if (waitShieldLaunchTimer)
      {
        dispatch_source_cancel(waitShieldLaunchTimer);
        v12 = v10->_waitShieldLaunchTimer;
        v10->_waitShieldLaunchTimer = 0;
      }
      objc_sync_exit(v10);

      objc_destroyWeak(&v23);
    }
    else
    {
      v13 = CMContinuityCaptureLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v27 = self;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to find shieldUI process", buf, 0xCu);
      }

      p_waitShieldLaunchTimer = &self->_waitShieldLaunchTimer;
      if (self->_waitShieldLaunchTimer)
      {
        unsigned int v15 = atomic_load(&self->_failedShieldProcessActiveCount);
        if (v15 < 9)
        {
          atomic_fetch_add((atomic_uchar *volatile)&self->_failedShieldProcessActiveCount, 1u);
        }
        else
        {
          id sessionInterruptionBlock = (void (**)(void))self->_sessionInterruptionBlock;
          if (sessionInterruptionBlock) {
            sessionInterruptionBlock[2]();
          }
        }
      }
      else
      {
        id v17 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_shieldUILaunchMonitorQueue);
        dispatch_source_set_timer(v17, 0, 0x3B9ACA00uLL, 0);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100003268;
        v20[3] = &unk_100018670;
        objc_copyWeak(&v21, &location);
        dispatch_source_set_event_handler(v17, v20);
        dispatch_resume(v17);
        id v18 = self;
        objc_sync_enter(v18);
        objc_storeStrong((id *)p_waitShieldLaunchTimer, v17);
        objc_sync_exit(v18);

        v19 = CMContinuityCaptureLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v27 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ wait for setting shield ui monitor", buf, 0xCu);
        }

        objc_destroyWeak(&v21);
      }
    }

    objc_destroyWeak(&location);
  }
}

- (void)invalidate
{
  v3 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    v10 = self;
    __int16 v11 = 2080;
    v12 = "-[CCDShieldUISession invalidate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v9, 0x16u);
  }

  v4 = self;
  objc_sync_enter(v4);
  waitShieldLaunchTimer = v4->_waitShieldLaunchTimer;
  if (waitShieldLaunchTimer)
  {
    dispatch_source_cancel(waitShieldLaunchTimer);
    v6 = v4->_waitShieldLaunchTimer;
    v4->_waitShieldLaunchTimer = 0;
  }
  shieldUIProcessHandle = v4->_shieldUIProcessHandle;
  v4->_shieldUIProcessHandle = 0;

  id sessionInterruptionBlock = v4->_sessionInterruptionBlock;
  v4->_id sessionInterruptionBlock = 0;

  objc_sync_exit(v4);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (CMContinuityCaptureUIConfiguration)configuration
{
  return self->_configuration;
}

- (CCDPauseStateSolver)pauseStateSolver
{
  return self->_pauseStateSolver;
}

- (id)description
{
  deviceIdentifier = self->_deviceIdentifier;
  v4 = [(CCDShieldUISession *)self sessionID];
  id v5 = [(CCDShieldUISession *)self configuration];
  v6 = +[NSString stringWithFormat:@"DID:%@ SID:%@ Configuration:%@", deviceIdentifier, v4, v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sessionInterruptionBlock, 0);
  objc_storeStrong((id *)&self->_shieldUILaunchMonitorQueue, 0);
  objc_storeStrong((id *)&self->_waitShieldLaunchTimer, 0);
  objc_storeStrong((id *)&self->_shieldUIProcessHandle, 0);
  objc_storeStrong((id *)&self->_pauseStateSolver, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end