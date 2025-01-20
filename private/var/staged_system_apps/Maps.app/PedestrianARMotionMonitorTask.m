@interface PedestrianARMotionMonitorTask
+ (int64_t)creationPreference;
- (ARSession)session;
- (BOOL)_isDeviceAngleAboveTopBound;
- (BOOL)_isDeviceAngleBelowBottomBound;
- (BOOL)_shouldShowPedestrianAR;
- (BOOL)isARSessionReplayingFromRecording;
- (BOOL)isNavRunning;
- (BOOL)suppressLowerToExit;
- (BOOL)suppressRaiseToStart;
- (BOOL)waitingToExit;
- (BOOL)waitingToStart;
- (CMMotionManager)motionManager;
- (GCDTimer)foregroundRestartTimer;
- (MapsRingBuffer)pitchValues;
- (MapsRingBuffer)rollValues;
- (NSOperationQueue)deviceMotionUpdatesQueue;
- (NSString)currentRouteID;
- (PedestrianARCoordination)coordinator;
- (PedestrianARMotionMonitorTask)initWithPlatformController:(id)a3 stateManager:(id)a4 usageTracker:(id)a5;
- (PedestrianARSessionStateManager)stateManager;
- (PedestrianARSessionUsageTracker)usageTracker;
- (PlatformController)platformController;
- (id)_topContext;
- (id)containerViewController;
- (int64_t)interfaceOrientation;
- (void)_start;
- (void)_startIfNecessary;
- (void)_startMonitoringDeviceMotionChanges;
- (void)_stop;
- (void)applicationDidBecomeActiveNotification:(id)a3;
- (void)applicationDidEnterBackgroundNotification:(id)a3;
- (void)dealloc;
- (void)pedestrianARViewControllerDidAppearNotification:(id)a3;
- (void)pedestrianARViewControllerDidDisappearNotification:(id)a3;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)setDeviceMotionUpdatesQueue:(id)a3;
- (void)setForegroundRestartTimer:(id)a3;
- (void)setMotionManager:(id)a3;
- (void)setPitchValues:(id)a3;
- (void)setPlatformController:(id)a3;
- (void)setRollValues:(id)a3;
- (void)setSession:(id)a3;
- (void)setStateManager:(id)a3;
- (void)setSuppressLowerToExit:(BOOL)a3;
- (void)setSuppressRaiseToStart:(BOOL)a3;
- (void)setUsageTracker:(id)a3;
- (void)setWaitingToExit:(BOOL)a3;
- (void)setWaitingToStart:(BOOL)a3;
- (void)stateManager:(id)a3 didChangeState:(BOOL)a4;
- (void)updateVisibilityWithCurrentPitch:(double)a3 currentRoll:(double)a4;
@end

@implementation PedestrianARMotionMonitorTask

- (void)_startIfNecessary
{
  v3 = [(PedestrianARMotionMonitorTask *)self stateManager];
  unsigned __int8 v4 = [v3 shouldShowPedestrianAR];

  if ((v4 & 1) == 0)
  {
    v5 = sub_100077410();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
LABEL_10:

      return;
    }
    int v7 = 134349056;
    v8 = self;
    v6 = "[%{public}p] Pedestrian AR should not be shown; will not start";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v7, 0xCu);
    goto LABEL_10;
  }
  if (!+[UIApplication _maps_isAnySceneForegroundForRole:](UIApplication, "_maps_isAnySceneForegroundForRole:", UIWindowSceneSessionRoleApplication)&& !+[UIApplication _maps_isAnySceneForegroundForRole:_UIWindowSceneSessionTypeCoverSheet])
  {
    v5 = sub_100077410();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_10;
    }
    int v7 = 134349056;
    v8 = self;
    v6 = "[%{public}p] Application is not foreground; will not start";
    goto LABEL_9;
  }

  [(PedestrianARMotionMonitorTask *)self _start];
}

- (PedestrianARMotionMonitorTask)initWithPlatformController:(id)a3 stateManager:(id)a4 usageTracker:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v28 = sub_1005762E4();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v39 = "-[PedestrianARMotionMonitorTask initWithPlatformController:stateManager:usageTracker:]";
      __int16 v40 = 2080;
      v41 = "PedestrianARMotionMonitorTask.m";
      __int16 v42 = 1024;
      int v43 = 112;
      __int16 v44 = 2080;
      v45 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v29 = sub_1005762E4();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v39 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v10)
  {
    v31 = sub_1005762E4();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v39 = "-[PedestrianARMotionMonitorTask initWithPlatformController:stateManager:usageTracker:]";
      __int16 v40 = 2080;
      v41 = "PedestrianARMotionMonitorTask.m";
      __int16 v42 = 1024;
      int v43 = 113;
      __int16 v44 = 2080;
      v45 = "stateManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v32 = sub_1005762E4();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v39 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v11)
  {
    v34 = sub_1005762E4();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v39 = "-[PedestrianARMotionMonitorTask initWithPlatformController:stateManager:usageTracker:]";
      __int16 v40 = 2080;
      v41 = "PedestrianARMotionMonitorTask.m";
      __int16 v42 = 1024;
      int v43 = 114;
      __int16 v44 = 2080;
      v45 = "usageTracker != nil";
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v35 = sub_1005762E4();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v39 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v37.receiver = self;
  v37.super_class = (Class)PedestrianARMotionMonitorTask;
  v12 = [(PedestrianARMotionMonitorTask *)&v37 init];
  if (v12)
  {
    v13 = sub_100077410();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v39 = (const char *)v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v14 = +[MapsARSessionManager sharedManager];
    uint64_t v15 = [v14 session];
    session = v12->_session;
    v12->_session = (ARSession *)v15;

    objc_storeStrong((id *)&v12->_platformController, a3);
    objc_storeStrong((id *)&v12->_stateManager, a4);
    [(PedestrianARSessionStateManager *)v12->_stateManager addObserver:v12];
    objc_storeStrong((id *)&v12->_usageTracker, a5);
    uint64_t UInteger = GEOConfigGetUInteger();
    v18 = sub_100077410();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349312;
      v39 = (const char *)v12;
      __int16 v40 = 2048;
      v41 = (const char *)UInteger;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[%{public}p] Creating ring buffers with sample size: %lu", buf, 0x16u);
    }

    v19 = [[MapsRingBuffer alloc] initWithLength:UInteger];
    pitchValues = v12->_pitchValues;
    v12->_pitchValues = v19;

    v21 = [[MapsRingBuffer alloc] initWithLength:UInteger];
    rollValues = v12->_rollValues;
    v12->_rollValues = v21;

    v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v12 selector:"applicationDidEnterBackgroundNotification:" name:UIApplicationDidEnterBackgroundNotification object:0];

    v24 = +[NSNotificationCenter defaultCenter];
    [v24 addObserver:v12 selector:"applicationDidBecomeActiveNotification:" name:UIApplicationDidBecomeActiveNotification object:0];

    v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v12 selector:"pedestrianARViewControllerDidAppearNotification:" name:@"PedestrianARViewControllerDidAppearNotification" object:0];

    v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v12 selector:"pedestrianARViewControllerDidDisappearNotification:" name:@"PedestrianARViewControllerDidDisappearNotification" object:0];

    [(PedestrianARMotionMonitorTask *)v12 _startIfNecessary];
  }

  return v12;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (PedestrianARSessionStateManager)stateManager
{
  return self->_stateManager;
}

- (void)dealloc
{
  v3 = sub_100077410();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocing", buf, 0xCu);
  }

  [(PedestrianARMotionMonitorTask *)self _stop];
  v4.receiver = self;
  v4.super_class = (Class)PedestrianARMotionMonitorTask;
  [(PedestrianARMotionMonitorTask *)&v4 dealloc];
}

- (void)_start
{
  v3 = sub_100077410();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v9 = 134349056;
    id v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Will start monitoring motion changes", (uint8_t *)&v9, 0xCu);
  }

  if ([(PedestrianARMotionMonitorTask *)self isARSessionReplayingFromRecording])
  {
    objc_super v4 = sub_100077410();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 134349056;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] ARSession is being replayed from a trace; observing ARKit for motion updates",
        (uint8_t *)&v9,
        0xCu);
    }

    v5 = [(PedestrianARMotionMonitorTask *)self session];
    [v5 _addObserver:self];
LABEL_10:

    return;
  }
  v6 = [(PedestrianARMotionMonitorTask *)self motionManager];
  unsigned int v7 = [v6 isDeviceMotionActive];

  v5 = sub_100077410();
  BOOL v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v8)
    {
      int v9 = 134349056;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] We're already monitoring device motion updates; ignoring",
        (uint8_t *)&v9,
        0xCu);
    }
    goto LABEL_10;
  }
  if (v8)
  {
    int v9 = 134349056;
    id v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] ARSession is not being replayed from a trace; observing CoreMotion for motion updates",
      (uint8_t *)&v9,
      0xCu);
  }

  [(PedestrianARMotionMonitorTask *)self _startMonitoringDeviceMotionChanges];
}

- (void)_stop
{
  v3 = [(PedestrianARMotionMonitorTask *)self session];
  [v3 _removeObserver:self];

  objc_super v4 = [(PedestrianARMotionMonitorTask *)self motionManager];
  unsigned int v5 = [v4 isDeviceMotionActive];

  if (v5)
  {
    v6 = sub_100077410();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 134349056;
      int v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Ending device motion updates", (uint8_t *)&v8, 0xCu);
    }

    unsigned int v7 = [(PedestrianARMotionMonitorTask *)self motionManager];
    [v7 stopDeviceMotionUpdates];
  }
  [(PedestrianARMotionMonitorTask *)self setForegroundRestartTimer:0];
}

- (id)_topContext
{
  v2 = [(PedestrianARMotionMonitorTask *)self platformController];
  v3 = [v2 iosBasedChromeViewController];
  objc_super v4 = [v3 topContext];

  return v4;
}

- (BOOL)isARSessionReplayingFromRecording
{
  v2 = [(PedestrianARMotionMonitorTask *)self session];
  v3 = [v2 configuration];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isNavRunning
{
  v2 = [(PedestrianARMotionMonitorTask *)self platformController];
  v3 = [v2 currentSession];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v4 = v3;
  }
  else {
    objc_super v4 = 0;
  }
  id v5 = v4;

  BOOL v6 = v5 && [v5 sessionState] == (id)1 && [v5 guidanceType] != (id)2;
  return v6;
}

- (PedestrianARCoordination)coordinator
{
  unsigned int v3 = [(PedestrianARMotionMonitorTask *)self isNavRunning];
  objc_super v4 = [(PedestrianARMotionMonitorTask *)self platformController];
  id v5 = [v4 iosBasedChromeViewController];
  BOOL v6 = [v5 appCoordinator];
  unsigned int v7 = v6;
  if (v3)
  {
    int v8 = [v6 navModeController];
    [v8 navActionCoordinator];
  }
  else
  {
    int v8 = [v6 baseModeController];
    [v8 actionCoordinator];
  int v9 = };

  return (PedestrianARCoordination *)v9;
}

- (id)containerViewController
{
  unsigned int v3 = [(PedestrianARMotionMonitorTask *)self isNavRunning];
  objc_super v4 = [(PedestrianARMotionMonitorTask *)self platformController];
  id v5 = [v4 iosBasedChromeViewController];
  BOOL v6 = [v5 appCoordinator];
  unsigned int v7 = v6;
  if (v3)
  {
    int v8 = [v6 navModeController];
    [v8 navActionCoordinator];
  }
  else
  {
    int v8 = [v6 baseModeController];
    [v8 actionCoordinator];
  int v9 = };
  id v10 = [v9 containerViewController];

  return v10;
}

- (NSString)currentRouteID
{
  unsigned int v3 = [(PedestrianARMotionMonitorTask *)self platformController];
  objc_super v4 = [v3 currentSession];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  unsigned int v7 = [(PedestrianARMotionMonitorTask *)self platformController];
  int v8 = [v7 currentSession];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v9 = v8;
  }
  else {
    int v9 = 0;
  }
  id v10 = v9;

  if (v6)
  {
    id v11 = v6;
LABEL_11:
    v12 = [v11 currentRouteCollection];
    v13 = [v12 currentRoute];
    v14 = [v13 uniqueRouteID];
    uint64_t v15 = [v14 UUIDString];

    goto LABEL_12;
  }
  if (v10)
  {
    id v11 = v10;
    goto LABEL_11;
  }
  v17 = sub_1005762E4();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v20 = 136315650;
    v21 = "-[PedestrianARMotionMonitorTask currentRouteID]";
    __int16 v22 = 2080;
    v23 = "PedestrianARMotionMonitorTask.m";
    __int16 v24 = 1024;
    int v25 = 244;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v20, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    v18 = sub_1005762E4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = +[NSThread callStackSymbols];
      int v20 = 138412290;
      v21 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);
    }
  }
  uint64_t v15 = 0;
LABEL_12:

  return (NSString *)v15;
}

- (int64_t)interfaceOrientation
{
  v2 = [(PedestrianARMotionMonitorTask *)self platformController];
  unsigned int v3 = [v2 chromeViewController];
  objc_super v4 = [v3 view];
  id v5 = [v4 window];
  id v6 = [v5 windowScene];
  id v7 = [v6 interfaceOrientation];

  return (int64_t)v7;
}

- (BOOL)_isDeviceAngleAboveTopBound
{
  if ([(PedestrianARMotionMonitorTask *)self isARSessionReplayingFromRecording])
  {
    unsigned int v3 = [(PedestrianARMotionMonitorTask *)self pitchValues];
    objc_super v4 = v3;
    id v5 = &stru_101312388;
  }
  else
  {
    int64_t v6 = [(PedestrianARMotionMonitorTask *)self interfaceOrientation];
    if ((unint64_t)(v6 - 1) > 1)
    {
      int64_t v7 = v6;
      unsigned int v3 = [(PedestrianARMotionMonitorTask *)self rollValues];
      objc_super v4 = v3;
      if (v7 == 4) {
        id v5 = &stru_1013123C8;
      }
      else {
        id v5 = &stru_1013123E8;
      }
    }
    else
    {
      unsigned int v3 = [(PedestrianARMotionMonitorTask *)self pitchValues];
      objc_super v4 = v3;
      id v5 = &stru_1013123A8;
    }
  }
  char v8 = sub_1004E0580(v3, v5);

  return v8;
}

- (BOOL)_isDeviceAngleBelowBottomBound
{
  if ([(PedestrianARMotionMonitorTask *)self isARSessionReplayingFromRecording])
  {
    unsigned int v3 = [(PedestrianARMotionMonitorTask *)self pitchValues];
    objc_super v4 = v3;
    id v5 = &stru_101312408;
  }
  else
  {
    int64_t v6 = [(PedestrianARMotionMonitorTask *)self interfaceOrientation];
    if ((unint64_t)(v6 - 1) > 1)
    {
      int64_t v7 = v6;
      unsigned int v3 = [(PedestrianARMotionMonitorTask *)self rollValues];
      objc_super v4 = v3;
      if (v7 == 4) {
        id v5 = &stru_101312448;
      }
      else {
        id v5 = &stru_101312468;
      }
    }
    else
    {
      unsigned int v3 = [(PedestrianARMotionMonitorTask *)self pitchValues];
      objc_super v4 = v3;
      id v5 = &stru_101312428;
    }
  }
  char v8 = sub_1004E0580(v3, v5);

  return v8;
}

- (void)_startMonitoringDeviceMotionChanges
{
  unsigned int v3 = sub_100077410();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    int v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Will start monitoring device motion updates", buf, 0xCu);
  }

  objc_super v4 = [(PedestrianARMotionMonitorTask *)self motionManager];
  unsigned __int8 v5 = [v4 isDeviceMotionAvailable];

  if ((v5 & 1) == 0)
  {
    v12 = sub_1005762E4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      int v20 = (PedestrianARMotionMonitorTask *)"-[PedestrianARMotionMonitorTask _startMonitoringDeviceMotionChanges]";
      __int16 v21 = 2080;
      __int16 v22 = "PedestrianARMotionMonitorTask.m";
      __int16 v23 = 1024;
      int v24 = 309;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        int v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    id v11 = sub_100077410();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      int v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[%{public}p] Device motion updates are not available on this device", buf, 0xCu);
    }
    goto LABEL_13;
  }
  int64_t v6 = [(PedestrianARMotionMonitorTask *)self motionManager];
  unsigned int v7 = [v6 isDeviceMotionActive];

  if (v7)
  {
    char v8 = sub_1005762E4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      int v20 = (PedestrianARMotionMonitorTask *)"-[PedestrianARMotionMonitorTask _startMonitoringDeviceMotionChanges]";
      __int16 v21 = 2080;
      __int16 v22 = "PedestrianARMotionMonitorTask.m";
      __int16 v23 = 1024;
      int v24 = 315;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      int v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        int v20 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    id v11 = sub_100077410();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      int v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[%{public}p] Already monitoring device motion changes; cannot start again",
        buf,
        0xCu);
    }
LABEL_13:

    return;
  }
  objc_initWeak((id *)buf, self);
  uint64_t v15 = [(PedestrianARMotionMonitorTask *)self motionManager];
  v16 = [(PedestrianARMotionMonitorTask *)self deviceMotionUpdatesQueue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1009882EC;
  v17[3] = &unk_101312490;
  objc_copyWeak(&v18, (id *)buf);
  [v15 startDeviceMotionUpdatesToQueue:v16 withHandler:v17];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (CMMotionManager)motionManager
{
  motionManager = self->_motionManager;
  if (!motionManager)
  {
    objc_super v4 = sub_100077410();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      __int16 v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Creating CMMotionManager", buf, 0xCu);
    }

    unsigned __int8 v5 = (CMMotionManager *)objc_alloc_init((Class)CMMotionManager);
    int64_t v6 = self->_motionManager;
    self->_motionManager = v5;

    GEOConfigGetDouble();
    double v8 = v7;
    int v9 = sub_100077410();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349312;
      __int16 v21 = self;
      __int16 v22 = 2048;
      double v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Configuring motion manager with update interval: %f", buf, 0x16u);
    }

    [(CMMotionManager *)self->_motionManager setDeviceMotionUpdateInterval:v8];
    id v10 = +[NSBundle mainBundle];
    id v11 = [v10 bundleIdentifier];
    v12 = +[NSString stringWithFormat:@"%@.%@.deviceMotionUpdatesQueue.%p", v11, objc_opt_class(), self];

    id v13 = v12;
    v14 = (const char *)[v13 UTF8String];
    uint64_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create(v14, v15);

    v17 = (NSOperationQueue *)objc_opt_new();
    deviceMotionUpdatesQueue = self->_deviceMotionUpdatesQueue;
    self->_deviceMotionUpdatesQueue = v17;

    [(NSOperationQueue *)self->_deviceMotionUpdatesQueue setUnderlyingQueue:v16];
    motionManager = self->_motionManager;
  }

  return motionManager;
}

- (BOOL)_shouldShowPedestrianAR
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  objc_super v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v45 = sub_1005762E4();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v48 = 136316418;
        *(void *)&v48[4] = "-[PedestrianARMotionMonitorTask _shouldShowPedestrianAR]";
        *(_WORD *)&v48[12] = 2080;
        *(void *)&v48[14] = "PedestrianARMotionMonitorTask.m";
        *(_WORD *)&v48[22] = 1024;
        *(_DWORD *)v49 = 358;
        *(_WORD *)&v49[4] = 2080;
        *(void *)&v49[6] = "dispatch_get_main_queue()";
        *(_WORD *)&v49[14] = 2080;
        *(void *)&v49[16] = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v50 = 2080;
        v51 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          v48,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v46 = sub_1005762E4();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = +[NSThread callStackSymbols];
          *(_DWORD *)v48 = 138412290;
          *(void *)&v48[4] = v47;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%@", v48, 0xCu);
        }
      }
    }
  }
  unsigned int v6 = [(PedestrianARMotionMonitorTask *)self _isDeviceAngleAboveTopBound];
  unsigned int v7 = [(PedestrianARMotionMonitorTask *)self _isDeviceAngleBelowBottomBound];
  double v8 = sub_100077410();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unint64_t v9 = [(PedestrianARMotionMonitorTask *)self interfaceOrientation];
    if (v9 >= 5)
    {
      id v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v48 = 136315650;
        *(void *)&v48[4] = "NSString * _Nonnull NSStringFromUIInterfaceOrientation(UIInterfaceOrientation)";
        *(_WORD *)&v48[12] = 2080;
        *(void *)&v48[14] = "PedestrianARMotionMonitorTask.m";
        *(_WORD *)&v48[22] = 1024;
        *(_DWORD *)v49 = 61;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", v48, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        v12 = sub_1005762E4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          id v13 = +[NSThread callStackSymbols];
          *(_DWORD *)v48 = 138412290;
          *(void *)&v48[4] = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", v48, 0xCu);
        }
      }
      CFStringRef v10 = @"?";
    }
    else
    {
      CFStringRef v10 = *(&off_1013124D0 + v9);
    }
    *(_DWORD *)v48 = 134349826;
    *(void *)&v48[4] = self;
    if (v6) {
      v14 = @"YES";
    }
    else {
      v14 = @"NO";
    }
    *(void *)&v48[14] = v10;
    *(_WORD *)&v48[12] = 2112;
    if (v7) {
      uint64_t v15 = @"YES";
    }
    else {
      uint64_t v15 = @"NO";
    }
    *(_WORD *)&v48[22] = 2112;
    *(void *)v49 = v14;
    *(_WORD *)&v49[8] = 2112;
    *(void *)&v49[10] = v15;
    dispatch_queue_t v16 = v14;
    v17 = v15;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] interface orientation: %@, isAboveTopBound: %@, isBelowBottomBound: %@", v48, 0x2Au);
  }
  if (v6)
  {
    [(PedestrianARMotionMonitorTask *)self setSuppressLowerToExit:0];
    id v18 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v19 = [v18 BOOLForKey:@"MapsEnablePedestrianARRaiseToStart"];

    if ((v19 & 1) == 0)
    {
      int v20 = sub_100077410();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v48 = 134349056;
        *(void *)&v48[4] = self;
        __int16 v21 = "[%{public}p] User has not enabled raise to start; will not raise to start";
        goto LABEL_41;
      }
LABEL_42:

      goto LABEL_43;
    }
    if (+[PedestrianARFeatureIntroTeachableMomentContaineeViewController shouldShowTeachableMoment])
    {
      int v20 = sub_100077410();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v48 = 134349056;
        *(void *)&v48[4] = self;
        __int16 v21 = "[%{public}p] The feature intro teachable moment card is eligible to be shown; will not raise to start";
LABEL_41:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v21, v48, 0xCu);
        goto LABEL_42;
      }
      goto LABEL_42;
    }
    int v24 = [(PedestrianARMotionMonitorTask *)self coordinator];
    unsigned int v25 = [v24 isTeachableMomentCardActive];

    if (v25)
    {
      int v20 = sub_100077410();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v48 = 134349056;
        *(void *)&v48[4] = self;
        v26 = "[%{public}p] Teachable moment card is currently active; will not raise to start";
LABEL_53:
        v34 = v20;
        os_log_type_t v35 = OS_LOG_TYPE_INFO;
LABEL_54:
        _os_log_impl((void *)&_mh_execute_header, v34, v35, v26, v48, 0xCu);
      }
    }
    else
    {
      v32 = [(PedestrianARMotionMonitorTask *)self coordinator];
      unsigned int v33 = [v32 isWeatherPopoverActive];

      if (v33)
      {
        int v20 = sub_1005768D4();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v48 = 134349056;
          *(void *)&v48[4] = self;
          v26 = "[%{public}p] User is currently viewing the weather; will not raise to start";
          goto LABEL_53;
        }
      }
      else
      {
        v36 = [(PedestrianARMotionMonitorTask *)self containerViewController];
        unsigned int v37 = [v36 isVLFCrowdsourcingPermissionCardActive];

        if (!v37)
        {
          v38 = +[PedestrianARSessionUsageTracker sharedInstance];
          int v39 = [v38 hasAREverLocalized];

          if (v39)
          {
            __int16 v40 = [(PedestrianARMotionMonitorTask *)self usageTracker];
            v41 = [(PedestrianARMotionMonitorTask *)self currentRouteID];
            unsigned __int8 v42 = [v40 hasAREverLocalizedForRoute:v41];

            if (v42)
            {
              if ([(PedestrianARMotionMonitorTask *)self suppressRaiseToStart])
              {
                int v20 = sub_100077410();
                if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
                  goto LABEL_42;
                }
                *(_DWORD *)v48 = 134349056;
                *(void *)&v48[4] = self;
                __int16 v21 = "[%{public}p] Device is above top bound but we need to suppress the raise; will not raise to start";
              }
              else
              {
                int v43 = (char *)[(PedestrianARMotionMonitorTask *)self interfaceOrientation] - 1;
                int v20 = sub_100077410();
                BOOL v44 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
                if ((unint64_t)v43 < 2)
                {
                  if (v44)
                  {
                    *(_DWORD *)v48 = 134349056;
                    *(void *)&v48[4] = self;
                    unsigned __int8 v27 = 1;
                    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}p] Allowing raise to start", v48, 0xCu);
                  }
                  else
                  {
                    unsigned __int8 v27 = 1;
                  }
                  goto LABEL_44;
                }
                if (!v44) {
                  goto LABEL_42;
                }
                *(_DWORD *)v48 = 134349056;
                *(void *)&v48[4] = self;
                __int16 v21 = "[%{public}p] Device is above top bound but not in portrait orientation; will not raise to start";
              }
            }
            else
            {
              int v20 = sub_100077410();
              if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
                goto LABEL_42;
              }
              *(_DWORD *)v48 = 134349056;
              *(void *)&v48[4] = self;
              __int16 v21 = "[%{public}p] Device is above top bound but user has not localized for the current route; will not raise to start";
            }
          }
          else
          {
            int v20 = sub_100077410();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
              goto LABEL_42;
            }
            *(_DWORD *)v48 = 134349056;
            *(void *)&v48[4] = self;
            __int16 v21 = "[%{public}p] User has never successfully localized; will not raise to start";
          }
          goto LABEL_41;
        }
        int v20 = sub_100077410();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v48 = 134349056;
          *(void *)&v48[4] = self;
          v26 = "[%{public}p] VLF crowdsourcing permission card is currently active; will not raise to start";
          v34 = v20;
          os_log_type_t v35 = OS_LOG_TYPE_DEBUG;
          goto LABEL_54;
        }
      }
    }
    unsigned __int8 v27 = 0;
    goto LABEL_44;
  }
  if (v7)
  {
    [(PedestrianARMotionMonitorTask *)self setSuppressRaiseToStart:0];
    __int16 v22 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v23 = [v22 BOOLForKey:@"PedestrianAREnableLowerToExitKey"];

    if (v23)
    {
      if (![(PedestrianARMotionMonitorTask *)self suppressLowerToExit])
      {
        v29 = [(PedestrianARMotionMonitorTask *)self coordinator];
        unsigned int v30 = [v29 isPedestrianARShowingFailureView];

        if (!v30) {
          return 0;
        }
        v31 = sub_100077410();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v48 = 134349056;
          *(void *)&v48[4] = self;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "[%{public}p] Device is below bottom bound but user is on the failure view; will not lower to exit, and suppr"
            "essing lower to exit",
            v48,
            0xCu);
        }

        [(PedestrianARMotionMonitorTask *)self setSuppressLowerToExit:1];
        goto LABEL_43;
      }
      int v20 = sub_100077410();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
        goto LABEL_42;
      }
      *(_DWORD *)v48 = 134349056;
      *(void *)&v48[4] = self;
      __int16 v21 = "[%{public}p] Device is below bottom bound but we need to suppress the lower; will not lower to exit";
      goto LABEL_41;
    }
    int v20 = sub_100077410();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v48 = 134349056;
      *(void *)&v48[4] = self;
      __int16 v21 = "[%{public}p] User has not enabled lower to exit; will not lower to exit";
      goto LABEL_41;
    }
    goto LABEL_42;
  }
LABEL_43:
  int v20 = [(PedestrianARMotionMonitorTask *)self coordinator];
  unsigned __int8 v27 = [v20 isPedestrianARActive];
LABEL_44:

  return v27;
}

- (void)updateVisibilityWithCurrentPitch:(double)a3 currentRoll:(double)a4
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  double v8 = dispatch_queue_get_label(0);
  if (label != v8)
  {
    BOOL v9 = !label || v8 == 0;
    if (v9 || strcmp(label, v8))
    {
      unsigned int v37 = sub_1005762E4();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        int v40 = 136316418;
        v41 = (PedestrianARMotionMonitorTask *)"-[PedestrianARMotionMonitorTask updateVisibilityWithCurrentPitch:currentRoll:]";
        __int16 v42 = 2080;
        double v43 = COERCE_DOUBLE("PedestrianARMotionMonitorTask.m");
        __int16 v44 = 1024;
        *(_DWORD *)v45 = 426;
        *(_WORD *)&v45[4] = 2080;
        *(void *)&v45[6] = "dispatch_get_main_queue()";
        *(_WORD *)&v45[14] = 2080;
        *(void *)&v45[16] = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        *(_WORD *)&v45[24] = 2080;
        *(void *)&v45[26] = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v40,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v38 = sub_1005762E4();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          int v39 = +[NSThread callStackSymbols];
          int v40 = 138412290;
          v41 = v39;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v40, 0xCu);
        }
      }
    }
  }
  CFStringRef v10 = sub_100077410();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    if ([(PedestrianARMotionMonitorTask *)self isARSessionReplayingFromRecording]) {
      id v11 = @"NO";
    }
    else {
      id v11 = @"YES";
    }
    v12 = v11;
    id v13 = [(PedestrianARMotionMonitorTask *)self pitchValues];
    v14 = [v13 lastObject];
    [v14 doubleValue];
    uint64_t v16 = v15;
    v17 = [(PedestrianARMotionMonitorTask *)self rollValues];
    id v18 = [v17 lastObject];
    [v18 doubleValue];
    int v40 = 134350338;
    v41 = self;
    __int16 v42 = 2048;
    double v43 = a3;
    __int16 v44 = 2048;
    *(double *)v45 = a4;
    *(_WORD *)&v45[8] = 2112;
    *(void *)&v45[10] = v11;
    *(_WORD *)&v45[18] = 2048;
    *(void *)&v45[20] = v16;
    *(_WORD *)&v45[28] = 2048;
    *(void *)&v45[30] = v19;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating visibility with pitch: %f, roll: %f, fromCoreMotion: %@, previous device pitch: %f, previous device roll: %f", (uint8_t *)&v40, 0x3Eu);
  }
  int v20 = [(PedestrianARMotionMonitorTask *)self pitchValues];
  __int16 v21 = +[NSNumber numberWithDouble:a3];
  [v20 push:v21];

  __int16 v22 = [(PedestrianARMotionMonitorTask *)self rollValues];
  unsigned __int8 v23 = +[NSNumber numberWithDouble:a4];
  [v22 push:v23];

  unsigned int v24 = [(PedestrianARMotionMonitorTask *)self _shouldShowPedestrianAR];
  unsigned int v25 = [(PedestrianARMotionMonitorTask *)self coordinator];
  unsigned __int8 v26 = [v25 isPedestrianARActive];

  if (!v24 || (v26 & 1) != 0)
  {
    char v32 = v24 | v26 ^ 1;
    unsigned int v33 = sub_100077410();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_INFO);
    if (v32)
    {
      if (v34)
      {
        os_log_type_t v35 = [(PedestrianARMotionMonitorTask *)self _topContext];
        int v40 = 134349314;
        v41 = self;
        __int16 v42 = 2112;
        double v43 = *(double *)&v35;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "[%{public}p] Not raising nor lowering. Current top context: %@", (uint8_t *)&v40, 0x16u);
      }
    }
    else
    {
      if (v34)
      {
        int v40 = 134349056;
        v41 = self;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "[%{public}p] Lowering to exit pedestrian AR", (uint8_t *)&v40, 0xCu);
      }

      [(PedestrianARMotionMonitorTask *)self setWaitingToExit:1];
      v36 = [(PedestrianARMotionMonitorTask *)self coordinator];
      [v36 exitPedestrianAR];
    }
  }
  else
  {
    unsigned __int8 v27 = sub_100077410();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int v40 = 134349056;
      v41 = self;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "[%{public}p] Raising to enter pedestrian AR", (uint8_t *)&v40, 0xCu);
    }

    [(PedestrianARMotionMonitorTask *)self setWaitingToStart:1];
    v28 = [(PedestrianARMotionMonitorTask *)self coordinator];
    [v28 enterPedestrianAR];

    v29 = [(PedestrianARMotionMonitorTask *)self platformController];
    unsigned int v30 = [v29 currentSession];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v31 = 302;
    }
    else {
      uint64_t v31 = 402;
    }

    +[GEOAPPortal captureUserAction:124 target:v31 value:0];
  }
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100989668;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)stateManager:(id)a3 didChangeState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    unsigned int v7 = sub_100077410();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v17 = 134349056;
      id v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Pedestrian AR became available; starting motion updates",
        (uint8_t *)&v17,
        0xCu);
    }

    [(PedestrianARMotionMonitorTask *)self _startIfNecessary];
    goto LABEL_20;
  }
  id v8 = [(PedestrianARMotionMonitorTask *)self coordinator];
  if ([v8 isPedestrianARActive])
  {

LABEL_8:
    CFStringRef v10 = sub_100077410();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [(PedestrianARMotionMonitorTask *)self coordinator];
      if ([v11 isPedestrianARActive]) {
        v12 = @"YES";
      }
      else {
        v12 = @"NO";
      }
      id v13 = v12;
      if ([(PedestrianARMotionMonitorTask *)self waitingToStart]) {
        v14 = @"YES";
      }
      else {
        v14 = @"NO";
      }
      uint64_t v15 = v14;
      int v17 = 134349570;
      id v18 = self;
      __int16 v19 = 2112;
      int v20 = v13;
      __int16 v21 = 2112;
      __int16 v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Pedestrian AR became unavailable but either AR is currently active (%@) or we're waiting for it to be active (%@); will not stop motion updates yet",
        (uint8_t *)&v17,
        0x20u);
    }
    goto LABEL_20;
  }
  unsigned __int8 v9 = [(PedestrianARMotionMonitorTask *)self waitingToStart];

  if (v9) {
    goto LABEL_8;
  }
  uint64_t v16 = sub_100077410();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = 134349056;
    id v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Pedestrian AR became unavailable and is not currently active nor becoming active; stopping motion updates",
      (uint8_t *)&v17,
      0xCu);
  }

  [(PedestrianARMotionMonitorTask *)self _stop];
LABEL_20:
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      unsigned __int8 v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316418;
        id v13 = (PedestrianARMotionMonitorTask *)"-[PedestrianARMotionMonitorTask applicationDidEnterBackgroundNotification:]";
        __int16 v14 = 2080;
        uint64_t v15 = "PedestrianARMotionMonitorTask.m";
        __int16 v16 = 1024;
        int v17 = 482;
        __int16 v18 = 2080;
        __int16 v19 = "dispatch_get_main_queue()";
        __int16 v20 = 2080;
        __int16 v21 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v22 = 2080;
        unsigned __int8 v23 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v12,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        CFStringRef v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          id v11 = +[NSThread callStackSymbols];
          int v12 = 138412290;
          id v13 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
  }
  id v8 = sub_100077410();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 134349056;
    id v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] App backgrounded", (uint8_t *)&v12, 0xCu);
  }

  [(PedestrianARMotionMonitorTask *)self _stop];
}

- (void)applicationDidBecomeActiveNotification:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      CFStringRef v10 = sub_1005762E4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        __int16 v16 = (PedestrianARMotionMonitorTask *)"-[PedestrianARMotionMonitorTask applicationDidBecomeActiveNotification:]";
        __int16 v17 = 2080;
        __int16 v18 = "PedestrianARMotionMonitorTask.m";
        __int16 v19 = 1024;
        int v20 = 491;
        __int16 v21 = 2080;
        __int16 v22 = "dispatch_get_main_queue()";
        __int16 v23 = 2080;
        unsigned int v24 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v25 = 2080;
        unsigned __int8 v26 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        id v11 = sub_1005762E4();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v12 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          __int16 v16 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  id v8 = sub_100077410();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    __int16 v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] App foregrounded; will re-start motion updates soon",
      buf,
      0xCu);
  }

  objc_initWeak((id *)buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100989E70;
  v13[3] = &unk_1012E7638;
  objc_copyWeak(&v14, (id *)buf);
  unsigned __int8 v9 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v13 block:1.0];
  [(PedestrianARMotionMonitorTask *)self setForegroundRestartTimer:v9];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)pedestrianARViewControllerDidAppearNotification:(id)a3
{
  if (![(PedestrianARMotionMonitorTask *)self waitingToStart])
  {
    id v4 = sub_100077410();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 134349056;
      id v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Detected Pedestrian AR appeared via button press; suppressing lower to exit",
        (uint8_t *)&v5,
        0xCu);
    }

    [(PedestrianARMotionMonitorTask *)self setSuppressRaiseToStart:0];
    [(PedestrianARMotionMonitorTask *)self setSuppressLowerToExit:1];
  }
  [(PedestrianARMotionMonitorTask *)self setWaitingToStart:0];
}

- (void)pedestrianARViewControllerDidDisappearNotification:(id)a3
{
  if (![(PedestrianARMotionMonitorTask *)self waitingToExit])
  {
    id v4 = sub_100077410();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v8 = 134349056;
      unsigned __int8 v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Detected Pedestrian AR disappeared via button press; suppressing raise to start",
        (uint8_t *)&v8,
        0xCu);
    }

    [(PedestrianARMotionMonitorTask *)self setSuppressRaiseToStart:1];
    [(PedestrianARMotionMonitorTask *)self setSuppressLowerToExit:0];
  }
  [(PedestrianARMotionMonitorTask *)self setWaitingToExit:0];
  int v5 = [(PedestrianARMotionMonitorTask *)self stateManager];
  unsigned __int8 v6 = [v5 shouldShowPedestrianAR];

  if ((v6 & 1) == 0)
  {
    BOOL v7 = sub_100077410();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 134349056;
      unsigned __int8 v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Pedestrian AR disappeared and the feature is no longer available; stopping motion updates",
        (uint8_t *)&v8,
        0xCu);
    }

    [(PedestrianARMotionMonitorTask *)self _stop];
  }
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
}

- (void)setStateManager:(id)a3
{
}

- (PedestrianARSessionUsageTracker)usageTracker
{
  return self->_usageTracker;
}

- (void)setUsageTracker:(id)a3
{
}

- (void)setMotionManager:(id)a3
{
}

- (NSOperationQueue)deviceMotionUpdatesQueue
{
  return self->_deviceMotionUpdatesQueue;
}

- (void)setDeviceMotionUpdatesQueue:(id)a3
{
}

- (MapsRingBuffer)pitchValues
{
  return self->_pitchValues;
}

- (void)setPitchValues:(id)a3
{
}

- (MapsRingBuffer)rollValues
{
  return self->_rollValues;
}

- (void)setRollValues:(id)a3
{
}

- (BOOL)suppressRaiseToStart
{
  return self->_suppressRaiseToStart;
}

- (void)setSuppressRaiseToStart:(BOOL)a3
{
  self->_suppressRaiseToStart = a3;
}

- (BOOL)suppressLowerToExit
{
  return self->_suppressLowerToExit;
}

- (void)setSuppressLowerToExit:(BOOL)a3
{
  self->_suppressLowerToExit = a3;
}

- (BOOL)waitingToStart
{
  return self->_waitingToStart;
}

- (void)setWaitingToStart:(BOOL)a3
{
  self->_waitingToStart = a3;
}

- (BOOL)waitingToExit
{
  return self->_waitingToExit;
}

- (void)setWaitingToExit:(BOOL)a3
{
  self->_waitingToExit = a3;
}

- (ARSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (GCDTimer)foregroundRestartTimer
{
  return self->_foregroundRestartTimer;
}

- (void)setForegroundRestartTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundRestartTimer, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_rollValues, 0);
  objc_storeStrong((id *)&self->_pitchValues, 0);
  objc_storeStrong((id *)&self->_deviceMotionUpdatesQueue, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_usageTracker, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);

  objc_storeStrong((id *)&self->_platformController, 0);
}

@end