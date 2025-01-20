@interface SDUnlockLockManager
+ (id)sharedLockManager;
- (BOOL)canRetrySetup;
- (BOOL)checkingWristAndMotionState;
- (BOOL)checkingWristState;
- (BOOL)inPosition;
- (BOOL)lastUnlockedByPairedUnlock;
- (BOOL)localDeviceLocked;
- (BOOL)lostModeEnabled;
- (BOOL)onWristForCurrentSession;
- (BOOL)preventingExitForSetup;
- (BOOL)sentLockedState;
- (BOOL)unlockEnabled;
- (BOOL)updateLongTermKeys:(id)a3;
- (BOOL)waitingForAuthToken;
- (NSBackgroundActivityScheduler)dailyMetricReporter;
- (NSData)tempLongTermKey;
- (NSDate)lastPairedUnlockDate;
- (NSDate)sessionStartDate;
- (NSDate)wristOnDate;
- (NSString)passcode;
- (NSString)requestID;
- (NSTimer)enableTimer;
- (OS_dispatch_semaphore)positionSemaphore;
- (OS_dispatch_source)longTermKeyTimer;
- (OS_dispatch_source)wristAndMotionTimer;
- (SDUnlockLockManager)init;
- (SDUnlockLockMetricDates)metricDates;
- (SDUnlockMotionDetector)motionDetector;
- (SDUnlockWakeGestureRecord)lastWakeGestureRecord;
- (SFPairedUnlockDailyEvent)dailyMetrics;
- (id)enableHandler;
- (id)generateDebugInfo;
- (id)wristAndMotionStateHandler;
- (int64_t)deviceOffWristForSessionID;
- (int64_t)unlockSessionID;
- (void)addObservers;
- (void)allowExiting;
- (void)checkKeyBagState;
- (void)debugInfoRequested:(id)a3;
- (void)devicesDidUnpair:(id)a3;
- (void)disableUnlockPairing;
- (void)enableTimerFired:(id)a3;
- (void)enableUnlockForcingLTKTransfer:(BOOL)a3;
- (void)enableUnlockWithDevice:(id)a3 passcode:(id)a4 completionHandler:(id)a5;
- (void)getWristAndMotionStateWithCompletionHandler:(id)a3;
- (void)handleClassALongTermKeyResponse:(id)a3;
- (void)handleConfigurationState;
- (void)handleDevicesDidFailToPair;
- (void)handleEscrowSessionRequest:(id)a3;
- (void)handleLongTermKeyResponse:(id)a3;
- (void)handleRelockRequest;
- (void)handleSessionAuthToken:(id)a3;
- (void)handleSessionKeyExchangeRequest:(id)a3;
- (void)handleSetupCreateRecord:(id)a3;
- (void)handleSetupSessionCreated:(id)a3;
- (void)handleStartLTK:(id)a3;
- (void)handleStashKeyExchangeRequest:(id)a3;
- (void)handleStashToken:(id)a3;
- (void)handleUnlockStateRequest:(id)a3;
- (void)idsController:(id)a3 didReceiveProtoData:(id)a4 forType:(unsigned __int16)a5;
- (void)idsControllerSpaceDidBecomeAvailable:(id)a3;
- (void)invalidateEnableTimer;
- (void)invalidateLongTermKeyTimer;
- (void)keyBagLockStateChange:(id)a3;
- (void)notifyEnableStateWithError:(id)a3;
- (void)preventExiting;
- (void)resetLongTermKeyRequest;
- (void)resetState;
- (void)restartEnableTimerWithTimeout:(double)a3;
- (void)restartLongTermKeyTimer;
- (void)scheduleDailyMetricReporterIfNeeded;
- (void)sendClassALongTermKeyRequest:(id)a3 sessionID:(unsigned int)a4;
- (void)sendCreateEscrowSecretWithStepData:(id)a3 sessionID:(unsigned int)a4;
- (void)sendDeviceLockStateChanged:(BOOL)a3;
- (void)sendKeyExchangeResponse:(id)a3 sessionID:(unsigned int)a4;
- (void)sendLongTermKeyRequest:(id)a3 requestID:(id)a4;
- (void)sendSessionUnlockConfirmation:(BOOL)a3 sessionID:(unsigned int)a4;
- (void)sendSetupRequest:(id)a3 withSessionID:(unsigned int)a4;
- (void)sendStashConfirmation:(BOOL)a3 sessionID:(unsigned int)a4;
- (void)sendStashKeyExchangeResponse:(id)a3 sessionID:(unsigned int)a4 errorCode:(int64_t)a5;
- (void)sendStateResponseWithUnlockEnabled:(BOOL)a3 passcodeEnabled:(BOOL)a4;
- (void)setCanRetrySetup:(BOOL)a3;
- (void)setCheckingWristAndMotionState:(BOOL)a3;
- (void)setCheckingWristState:(BOOL)a3;
- (void)setDailyMetricReporter:(id)a3;
- (void)setDailyMetrics:(id)a3;
- (void)setDeviceOffWristForSessionID:(int64_t)a3;
- (void)setEnableHandler:(id)a3;
- (void)setEnableTimer:(id)a3;
- (void)setInPosition:(BOOL)a3;
- (void)setLastPairedUnlockDate:(id)a3;
- (void)setLastUnlockedByPairedUnlock:(BOOL)a3;
- (void)setLastWakeGestureRecord:(id)a3;
- (void)setLongTermKeyTimer:(id)a3;
- (void)setMetricDates:(id)a3;
- (void)setMotionDetector:(id)a3;
- (void)setOnWristForCurrentSession:(BOOL)a3;
- (void)setPasscode:(id)a3;
- (void)setPositionSemaphore:(id)a3;
- (void)setPreventingExitForSetup:(BOOL)a3;
- (void)setRequestID:(id)a3;
- (void)setSentLockedState:(BOOL)a3;
- (void)setSessionStartDate:(id)a3;
- (void)setTempLongTermKey:(id)a3;
- (void)setUnlockSessionID:(int64_t)a3;
- (void)setWaitingForAuthToken:(BOOL)a3;
- (void)setWristAndMotionStateHandler:(id)a3;
- (void)setWristAndMotionTimer:(id)a3;
- (void)setWristOnDate:(id)a3;
- (void)wristDetectionDisabled:(id)a3;
@end

@implementation SDUnlockLockManager

+ (id)sharedLockManager
{
  if (qword_100980468 != -1) {
    dispatch_once(&qword_100980468, &stru_1008D0D58);
  }
  v2 = (void *)qword_100980460;

  return v2;
}

- (SDUnlockLockManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)SDUnlockLockManager;
  v2 = [(SDUnlockSessionManager *)&v17 init];
  v3 = v2;
  if (v2)
  {
    requestID = v2->_requestID;
    v2->_requestID = 0;

    enableTimer = v3->_enableTimer;
    v3->_enableTimer = 0;

    id enableHandler = v3->_enableHandler;
    v3->_id enableHandler = 0;

    v3->_sentLockedState = 0;
    v3->_unlockSessionID = -1;
    longTermKeyTimer = v3->_longTermKeyTimer;
    v3->_longTermKeyTimer = 0;

    positionSemaphore = v3->_positionSemaphore;
    v3->_positionSemaphore = 0;

    v3->_waitingForAuthToken = 0;
    v3->_deviceOffWristForSessionID = -1;
    [(SDUnlockLockManager *)v3 addObservers];
    v9 = paired_unlock_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = [(SDUnlockSessionManager *)v3 pairingCompatibilityState];
      unsigned int v11 = [(SDUnlockSessionManager *)v3 deviceIsPaired];
      CFStringRef v12 = @"NO";
      if (v11) {
        CFStringRef v12 = @"YES";
      }
      *(_DWORD *)buf = 67109378;
      unsigned int v19 = v10;
      __int16 v20 = 2112;
      CFStringRef v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Key loading NanoRegitry, (compatibility state = %d, is paired = %@)", buf, 0x12u);
    }

    [(SDUnlockLockManager *)v3 checkKeyBagState];
    v13 = objc_alloc_init(SDUnlockLockMetricDates);
    metricDates = v3->_metricDates;
    v3->_metricDates = v13;

    v15 = +[NSDate now];
    [(SDUnlockLockMetricDates *)v3->_metricDates setBooted:v15];

    [(SDUnlockLockManager *)v3 scheduleDailyMetricReporterIfNeeded];
  }
  return v3;
}

- (void)addObservers
{
  v2.receiver = self;
  v2.super_class = (Class)SDUnlockLockManager;
  [(SDUnlockSessionManager *)&v2 addObservers];
}

- (void)debugInfoRequested:(id)a3
{
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [(SDUnlockLockManager *)self generateDebugInfo];
  sub_100047144(v6, (uint64_t)v5);
}

- (id)generateDebugInfo
{
  v3 = objc_opt_new();
  v9.receiver = self;
  v9.super_class = (Class)SDUnlockLockManager;
  v4 = [(SDUnlockSessionManager *)&v9 generateDebugInfo];
  [v3 addObjectsFromArray:v4];

  unsigned int v5 = [(SDUnlockLockManager *)self waitingForAuthToken];
  CFStringRef v6 = @"NO";
  if (v5) {
    CFStringRef v6 = @"YES";
  }
  v7 = +[NSString stringWithFormat:@"Waiting For Auth Token:%@", v6];
  [v3 addObject:v7];

  return v3;
}

- (void)keyBagLockStateChange:(id)a3
{
  v4 = CUMainQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FFF4C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)handleConfigurationState
{
  v3 = [(SDUnlockSessionManager *)self securityManager];
  v4 = [v3 generateLocalLongTermKey:3];
  p_tempLongTermKey = &self->_tempLongTermKey;
  tempLongTermKey = self->_tempLongTermKey;
  self->_tempLongTermKey = v4;

  if (self->_tempLongTermKey)
  {
    v7 = +[NSUUID UUID];
    v8 = [v7 UUIDString];
    requestID = self->_requestID;
    self->_requestID = v8;

    unsigned int v10 = *p_tempLongTermKey;
    unsigned int v11 = self->_requestID;
    [(SDUnlockLockManager *)self sendLongTermKeyRequest:v10 requestID:v11];
  }
  else
  {
    CFStringRef v12 = paired_unlock_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100204DF8((uint64_t)p_tempLongTermKey, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

- (void)handleDevicesDidFailToPair
{
  [(SDUnlockLockManager *)self invalidateLongTermKeyTimer];
  [(SDUnlockLockManager *)self resetLongTermKeyRequest];
  v3.receiver = self;
  v3.super_class = (Class)SDUnlockLockManager;
  [(SDUnlockSessionManager *)&v3 handleDevicesDidFailToPair];
}

- (void)devicesDidUnpair:(id)a3
{
  objc_super v3 = paired_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Devices unpaired", v4, 2u);
  }
}

- (void)checkKeyBagState
{
  if (![(SDUnlockLockManager *)self unlockEnabled]) {
    return;
  }
  objc_super v3 = +[SDStatusMonitor sharedMonitor];
  unsigned int v4 = [v3 deviceKeyBagDisabled];

  if (v4)
  {
    unsigned int v5 = paired_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Passcode disabled while sharingd wasn't running", buf, 2u);
    }

    [(SDUnlockLockManager *)self disableUnlockPairing];
    [(SDUnlockSessionManager *)self sendDisableMessage];
    return;
  }
  CFStringRef v6 = +[SDStatusMonitor sharedMonitor];
  if ([v6 deviceKeyBagLocked])
  {

LABEL_9:
    objc_super v9 = paired_unlock_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Device locked on start up", v14, 2u);
    }

    [(SDUnlockLockManager *)self sendDeviceLockStateChanged:0];
    return;
  }
  v7 = +[SDStatusMonitor sharedMonitor];
  unsigned int v8 = [v7 deviceKeyBagLocking];

  if (v8) {
    goto LABEL_9;
  }
  unsigned int v10 = +[SDStatusMonitor sharedMonitor];
  unsigned int v11 = [v10 deviceKeyBagUnlocked];

  if (v11)
  {
    CFStringRef v12 = paired_unlock_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Device unlocked on start up. Assuming device was last unlocked with Paired Unlock", v13, 2u);
    }

    [(SDUnlockLockManager *)self setLastUnlockedByPairedUnlock:1];
  }
}

- (void)scheduleDailyMetricReporterIfNeeded
{
  objc_super v3 = [(SDUnlockLockManager *)self dailyMetricReporter];
  if (v3)
  {
  }
  else if ([(SDUnlockLockManager *)self unlockEnabled])
  {
    unsigned int v4 = paired_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Started tracking daily metrics", buf, 2u);
    }

    id v5 = [objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:@"com.apple.Sharing.PairedUnlock.DailyMetric"];
    [(SDUnlockLockManager *)self setDailyMetricReporter:v5];

    CFStringRef v6 = [(SDUnlockLockManager *)self dailyMetricReporter];
    [v6 setRepeats:1];

    v7 = [(SDUnlockLockManager *)self dailyMetricReporter];
    [v7 setInterval:86400.0];

    unsigned int v8 = [(SDUnlockLockManager *)self dailyMetricReporter];
    [v8 setTolerance:60.0];

    objc_super v9 = [(SDUnlockLockManager *)self dailyMetricReporter];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100200730;
    v11[3] = &unk_1008D0D80;
    v11[4] = self;
    [v9 scheduleWithBlock:v11];

    id v10 = objc_alloc_init((Class)SFPairedUnlockDailyEvent);
    [(SDUnlockLockManager *)self setDailyMetrics:v10];
  }
}

- (void)restartEnableTimerWithTimeout:(double)a3
{
  enableTimer = self->_enableTimer;
  if (enableTimer) {
    [(NSTimer *)enableTimer invalidate];
  }
  CFStringRef v6 = +[NSTimer scheduledTimerWithTimeInterval:self target:"enableTimerFired:" selector:0 userInfo:0 repeats:a3];
  v7 = self->_enableTimer;
  self->_enableTimer = v6;
}

- (void)enableTimerFired:(id)a3
{
  enableTimer = self->_enableTimer;
  self->_enableTimer = 0;

  uint64_t v5 = SFUnlockErrorDomian;
  NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
  CFStringRef v9 = @"Other side never responded";
  CFStringRef v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v7 = +[NSError errorWithDomain:v5 code:107 userInfo:v6];
  [(SDUnlockLockManager *)self notifyEnableStateWithError:v7];
}

- (void)invalidateEnableTimer
{
  enableTimer = self->_enableTimer;
  if (enableTimer)
  {
    [(NSTimer *)enableTimer invalidate];
    unsigned int v4 = self->_enableTimer;
    self->_enableTimer = 0;
  }
}

- (void)restartLongTermKeyTimer
{
  objc_super v3 = paired_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Restarting long-term key timer", buf, 2u);
  }

  longTermKeyTimer = self->_longTermKeyTimer;
  if (!longTermKeyTimer)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100200C68;
    v8[3] = &unk_1008CA4B8;
    v8[4] = self;
    sub_1001B1B10(0, &_dispatch_main_q, v8);
    uint64_t v5 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
    CFStringRef v6 = self->_longTermKeyTimer;
    self->_longTermKeyTimer = v5;

    dispatch_resume((dispatch_object_t)self->_longTermKeyTimer);
    longTermKeyTimer = self->_longTermKeyTimer;
  }
  dispatch_time_t v7 = sub_1001B1AF8(45.0 + 45.0);
  sub_1001B1BC4(longTermKeyTimer, v7);
}

- (void)invalidateLongTermKeyTimer
{
  objc_super v3 = paired_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating long-term key timer", v6, 2u);
  }

  longTermKeyTimer = self->_longTermKeyTimer;
  if (longTermKeyTimer)
  {
    dispatch_source_cancel(longTermKeyTimer);
    uint64_t v5 = self->_longTermKeyTimer;
    self->_longTermKeyTimer = 0;
  }
}

- (void)enableUnlockWithDevice:(id)a3 passcode:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100200E50;
  v12[3] = &unk_1008CACD0;
  id v13 = a4;
  id v14 = v8;
  uint64_t v15 = self;
  id v16 = a5;
  id v9 = v8;
  id v10 = v16;
  id v11 = v13;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
}

- (void)enableUnlockForcingLTKTransfer:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SDUnlockSessionManager *)self securityManager];
  unsigned int v6 = [v5 ltksExist];

  dispatch_time_t v7 = [(SDUnlockSessionManager *)self securityManager];
  unsigned int v8 = [v7 ltkFileExists];

  if (self->_tempLongTermKey || (v6 & v8) == 1 && !v3) {
    goto LABEL_13;
  }
  [(SDUnlockSessionManager *)self updateSecurityManagerIfNeeded];
  id v9 = [(SDUnlockSessionManager *)self securityManager];
  [v9 deleteLongTermKeys];

  id v10 = [(SDUnlockSessionManager *)self securityManager];
  id v11 = [v10 generateLocalLongTermKey:3];
  tempLongTermKey = self->_tempLongTermKey;
  self->_tempLongTermKey = v11;

  id v13 = self->_tempLongTermKey;
  if (!v13)
  {
LABEL_13:
    __int16 v20 = paired_unlock_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Using existing LTK", (uint8_t *)&v21, 2u);
    }

    [(SDUnlockLockManager *)self sendSetupRequest:0 withSessionID:[(SDUnlockSessionManager *)self generateSessionID]];
  }
  else
  {
    id v14 = v13;
    uint64_t v15 = paired_unlock_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v16 = @"NO";
      if (v3) {
        CFStringRef v16 = @"YES";
      }
      int v21 = 138412290;
      CFStringRef v22 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Using updated LTK (forcing: %@)", (uint8_t *)&v21, 0xCu);
    }

    unsigned int v17 = [(SDUnlockSessionManager *)self inConfigureState];
    uint64_t v18 = paired_unlock_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Exchanging LTKs during setup", (uint8_t *)&v21, 2u);
      }

      [(SDUnlockLockManager *)self sendSetupRequest:v14 withSessionID:[(SDUnlockSessionManager *)self generateSessionID]];
    }
    else
    {
      if (v19)
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Exchanging LTKs using new service", (uint8_t *)&v21, 2u);
      }

      [(SDUnlockLockManager *)self sendClassALongTermKeyRequest:v14 sessionID:[(SDUnlockSessionManager *)self generateSessionID]];
    }
  }
}

- (void)notifyEnableStateWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = paired_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notifying client with error = %@", (uint8_t *)&v12, 0xCu);
  }

  id enableHandler = (void (**)(id, BOOL, id))self->_enableHandler;
  if (enableHandler)
  {
    enableHandler[2](enableHandler, v4 == 0, v4);
    id v7 = self->_enableHandler;
    self->_id enableHandler = 0;
  }
  if (v4) {
    [(SDUnlockLockManager *)self disableUnlockPairing];
  }
  tempLongTermKey = self->_tempLongTermKey;
  self->_tempLongTermKey = 0;

  passcode = self->_passcode;
  self->_passcode = 0;

  self->_canRetrySetup = 1;
  [(SDUnlockSessionManager *)self resetSetupState];
  [(SDUnlockLockManager *)self invalidateEnableTimer];
  if (self->_preventingExitForSetup)
  {
    self->_preventingExitForSetup = 0;
    dispatch_time_t v10 = dispatch_time(0, 2000000000);
    id v11 = SFMainQueue();
    dispatch_after(v10, v11, &stru_1008D0DA0);
  }
}

- (BOOL)unlockEnabled
{
  v8.receiver = self;
  v8.super_class = (Class)SDUnlockLockManager;
  BOOL v3 = [(SDUnlockSessionManager *)&v8 unlockEnabled];
  id v4 = [(SDUnlockSessionManager *)self securityManager];
  id v5 = [v4 unlockSessionAsOriginator:0 usingEscrow:1 escrowSecret:0];

  unsigned int v6 = [(SDUnlockSessionManager *)self securityManager];
  [v6 clearStateForSession:v5];

  return (uint64_t)v5 >= 0 && v3;
}

- (void)wristDetectionDisabled:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1, 0);
  }
}

- (void)disableUnlockPairing
{
  [(SDUnlockLockManager *)self setSentLockedState:0];
  BOOL v3 = [(SDUnlockSessionManager *)self securityManager];
  [v3 resetEscrowRecord];

  id v4 = [(SDUnlockLockManager *)self dailyMetricReporter];
  [v4 invalidate];

  [(SDUnlockLockManager *)self setDailyMetricReporter:0];
  [(SDUnlockLockManager *)self setDailyMetrics:0];
  id v5 = paired_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopped tracking daily metrics", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SDUnlockLockManager;
  [(SDUnlockSessionManager *)&v6 disableUnlockPairing];
}

- (void)resetState
{
  self->_unlockSessionID = -1;
  self->_deviceOffWristForSessionID = -1;
  self->_onWristForCurrentSession = 0;
  sessionStartDate = self->_sessionStartDate;
  self->_sessionStartDate = 0;

  [(SDUnlockLockManager *)self setWaitingForAuthToken:0];
  v4.receiver = self;
  v4.super_class = (Class)SDUnlockLockManager;
  [(SDUnlockSessionManager *)&v4 resetState];
}

- (void)resetLongTermKeyRequest
{
  tempLongTermKey = self->_tempLongTermKey;
  self->_tempLongTermKey = 0;

  requestID = self->_requestID;
  self->_requestID = 0;

  [(SDUnlockLockManager *)self allowExiting];
}

- (BOOL)localDeviceLocked
{
  objc_super v2 = +[SDStatusMonitor sharedMonitor];
  if ([v2 deviceKeyBagLocked])
  {
    unsigned __int8 v3 = 1;
  }
  else
  {
    objc_super v4 = +[SDStatusMonitor sharedMonitor];
    unsigned __int8 v3 = [v4 deviceKeyBagLocking];
  }
  return v3;
}

- (BOOL)lostModeEnabled
{
  int v2 = SFLostMode();
  unsigned __int8 v3 = paired_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = @"NO";
    if (v2) {
      CFStringRef v4 = @"YES";
    }
    int v6 = 138412290;
    CFStringRef v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "lostModeEnabled = %@", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

- (BOOL)inPosition
{
  return 0;
}

- (void)getWristAndMotionStateWithCompletionHandler:(id)a3
{
  if (a3)
  {
    id v6 = a3;
    CFStringRef v4 = +[NSDate now];
    id v5 = [(SDUnlockLockManager *)self metricDates];
    [v5 setMotionCheckStarted:v4];

    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)preventExiting
{
  id v2 = +[SDStatusMonitor sharedMonitor];
  [v2 addPreventExitForLocaleReason:@"SDUnlockLTKTransferPreventExitReason"];
}

- (void)allowExiting
{
  id v2 = +[SDStatusMonitor sharedMonitor];
  [v2 removePreventExitForLocaleReason:@"SDUnlockLTKTransferPreventExitReason"];
}

- (void)idsController:(id)a3 didReceiveProtoData:(id)a4 forType:(unsigned __int16)a5
{
  int v5 = a5;
  id v11 = a3;
  id v8 = a4;
  if (v5 <= 100)
  {
    switch(v5)
    {
      case 1:
        id v9 = [[SDUnlockReset alloc] initWithData:v8];
        [(SDUnlockSessionManager *)self logProtoBufReceived:v9];

        [(SDUnlockSessionManager *)self resetAndClearState];
        break;
      case 2:
        dispatch_time_t v10 = [[SDUnlockDisable alloc] initWithData:v8];
        [(SDUnlockSessionManager *)self logProtoBufReceived:v10];

        [(SDUnlockLockManager *)self disableUnlockPairing];
        break;
      case 3:
        [(SDUnlockLockManager *)self handleUnlockStateRequest:v8];
        break;
    }
  }
  else
  {
    switch(v5)
    {
      case 'e':
        [(SDUnlockLockManager *)self invalidateEnableTimer];
        [(SDUnlockLockManager *)self handleSetupSessionCreated:v8];
        break;
      case 'f':
        [(SDUnlockLockManager *)self invalidateEnableTimer];
        [(SDUnlockLockManager *)self handleSetupCreateRecord:v8];
        break;
      case 'g':
        [(SDUnlockLockManager *)self handleSessionKeyExchangeRequest:v8];
        break;
      case 'h':
        [(SDUnlockSessionManager *)self invalidateUnlockTimer];
        [(SDUnlockLockManager *)self handleSessionAuthToken:v8];
        break;
      case 'i':
        [(SDUnlockLockManager *)self handleStashKeyExchangeRequest:v8];
        break;
      case 'j':
        [(SDUnlockLockManager *)self handleStashToken:v8];
        break;
      case 'k':
        [(SDUnlockLockManager *)self handleLongTermKeyResponse:v8];
        break;
      case 'l':
        [(SDUnlockLockManager *)self handleStartLTK:v8];
        break;
      case 'm':
        [(SDUnlockLockManager *)self invalidateEnableTimer];
        [(SDUnlockLockManager *)self handleClassALongTermKeyResponse:v8];
        break;
      case 'o':
        [(SDUnlockLockManager *)self handleRelockRequest];
        break;
      default:
        break;
    }
  }
}

- (void)idsControllerSpaceDidBecomeAvailable:(id)a3
{
  if ([(SDUnlockLockManager *)self unlockEnabled])
  {
    id v4 = +[SDStatusMonitor sharedMonitor];
    -[SDUnlockLockManager sendDeviceLockStateChanged:](self, "sendDeviceLockStateChanged:", [v4 deviceKeyBagUnlocked]);
  }
}

- (void)handleStartLTK:(id)a3
{
  id v4 = paired_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received SDUnlockStartLTKTransfer", v6, 2u);
  }

  [(SDUnlockLockManager *)self preventExiting];
  if (self->_tempLongTermKey)
  {
    int v5 = paired_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100204FD8();
    }
  }
  else
  {
    [(SDUnlockSessionManager *)self updateSecurityManager];
    [(SDUnlockLockManager *)self handleConfigurationState];
  }
}

- (void)handleLongTermKeyResponse:(id)a3
{
  id v4 = a3;
  int v5 = [[SDUnlockLongTermKeyResponse alloc] initWithData:v4];

  [(SDUnlockSessionManager *)self logProtoBufReceived:v5];
  if ([(SDUnlockLongTermKeyResponse *)v5 hasRequestID])
  {
    id v6 = [(SDUnlockLongTermKeyResponse *)v5 requestID];
    unsigned int v7 = [v6 isEqualToString:self->_requestID];

    if (v7)
    {
      if ([(SDUnlockLongTermKeyResponse *)v5 hasKeyFailed])
      {
        id v8 = paired_unlock_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_10020500C();
        }
      }
      else if ([(SDUnlockLongTermKeyResponse *)v5 hasLongTermKey])
      {
        dispatch_time_t v10 = [(SDUnlockLongTermKeyResponse *)v5 longTermKey];
        unsigned __int8 v11 = [(SDUnlockLockManager *)self updateLongTermKeys:v10];

        if (v11)
        {
LABEL_16:
          [(SDUnlockLockManager *)self invalidateLongTermKeyTimer];
          [(SDUnlockLockManager *)self resetLongTermKeyRequest];
          goto LABEL_17;
        }
        id v8 = paired_unlock_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_100205040();
        }
      }
      else
      {
        id v8 = paired_unlock_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_100205074(v5);
        }
      }

      goto LABEL_16;
    }
  }
  id v9 = paired_unlock_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_100205124(v5);
  }

LABEL_17:
}

- (void)handleClassALongTermKeyResponse:(id)a3
{
  id v4 = a3;
  int v5 = [[SDUnlockClassALongTermKeyResponse alloc] initWithData:v4];

  [(SDUnlockSessionManager *)self logProtoBufReceived:v5];
  if ([(SDUnlockClassALongTermKeyResponse *)v5 hasErrorCode])
  {
    if ([(SDUnlockClassALongTermKeyResponse *)v5 hasErrorCode]) {
      unsigned int v6 = [(SDUnlockClassALongTermKeyResponse *)v5 errorCode];
    }
    else {
      unsigned int v6 = 103;
    }
    id v9 = paired_unlock_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1002051FC(v6, v9);
    }

    uint64_t v10 = SFUnlockErrorDomian;
    uint64_t v11 = v6;
LABEL_17:
    id v14 = +[NSError errorWithDomain:v10 code:v11 userInfo:0];
    [(SDUnlockLockManager *)self notifyEnableStateWithError:v14];

    goto LABEL_18;
  }
  if (![(SDUnlockClassALongTermKeyResponse *)v5 hasLongTermKey])
  {
    int v12 = paired_unlock_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1002052A8(v5);
    }

    uint64_t v10 = SFUnlockErrorDomian;
    uint64_t v11 = 103;
    goto LABEL_17;
  }
  unsigned int v7 = [(SDUnlockClassALongTermKeyResponse *)v5 longTermKey];
  unsigned int v8 = [(SDUnlockLockManager *)self updateLongTermKeys:v7];

  if (!v8)
  {
    id v13 = paired_unlock_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100205274();
    }

    uint64_t v10 = SFUnlockErrorDomian;
    uint64_t v11 = 101;
    goto LABEL_17;
  }
  [(SDUnlockLockManager *)self sendSetupRequest:0 withSessionID:[(SDUnlockClassALongTermKeyResponse *)v5 sessionID]];
LABEL_18:
}

- (BOOL)updateLongTermKeys:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  int v5 = [(SDUnlockSessionManager *)self securityManager];
  unsigned int v6 = [v5 signRemoteKey:v4 withLocalKey:self->_tempLongTermKey localKeyClass:3 remoteKeyClass:1];

  BOOL v7 = v6 != 0;
  if (v6)
  {
    unsigned int v8 = [(SDUnlockSessionManager *)self securityManager];
    [v8 updateLocalLongTermKey:self->_tempLongTermKey remoteLongTermKey:v6];
  }
  return v7;
}

- (void)handleSetupSessionCreated:(id)a3
{
  id v4 = a3;
  int v5 = [[SDUnlockSetupSessionCreated alloc] initWithData:v4];

  [(SDUnlockSessionManager *)self logProtoBufReceived:v5];
  if (v5 && ![(SDUnlockSetupSessionCreated *)v5 hasErrorCode])
  {
    if ([(SDUnlockSetupSessionCreated *)v5 hasLongTermKey]
      && ([(SDUnlockSetupSessionCreated *)v5 longTermKey],
          unsigned int v8 = objc_claimAutoreleasedReturnValue(),
          unsigned int v9 = [(SDUnlockLockManager *)self updateLongTermKeys:v8],
          v8,
          !v9))
    {
      int v12 = paired_unlock_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100205404();
      }

      uint64_t v13 = SFUnlockErrorDomian;
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      CFStringRef v17 = @"Could not sign remote key";
      id v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      uint64_t v15 = +[NSError errorWithDomain:v13 code:101 userInfo:v14];
      [(SDUnlockLockManager *)self notifyEnableStateWithError:v15];

      [(SDUnlockSessionManager *)self sendDisableMessage];
    }
    else
    {
      [(SDUnlockLockManager *)self handleEscrowSessionRequest:v5];
    }
  }
  else if (self->_canRetrySetup {
         && [(SDUnlockSetupSessionCreated *)v5 hasErrorCode]
  }
         && ([(SDUnlockSetupSessionCreated *)v5 errorCode] == 188
          || [(SDUnlockSetupSessionCreated *)v5 errorCode] == 187))
  {
    self->_canRetrySetup = 0;
    unsigned int v6 = paired_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1002053D0();
    }

    [(SDUnlockLockManager *)self enableUnlockForcingLTKTransfer:1];
  }
  else
  {
    if ([(SDUnlockSetupSessionCreated *)v5 hasErrorCode]) {
      unsigned int v7 = [(SDUnlockSetupSessionCreated *)v5 errorCode];
    }
    else {
      unsigned int v7 = 103;
    }
    uint64_t v10 = paired_unlock_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100205358(v7, v10);
    }

    uint64_t v11 = +[NSError errorWithDomain:SFUnlockErrorDomian code:v7 userInfo:0];
    [(SDUnlockLockManager *)self notifyEnableStateWithError:v11];
  }
}

- (void)handleEscrowSessionRequest:(id)a3
{
  id v4 = a3;
  if (![v4 hasToken]) {
    goto LABEL_8;
  }
  int v5 = [(SDUnlockSessionManager *)self securityManager];
  uint64_t v6 = [v5 localLongTermKey];
  if (!v6)
  {

    goto LABEL_8;
  }
  unsigned int v7 = (void *)v6;
  unsigned int v8 = [(SDUnlockSessionManager *)self securityManager];
  unsigned int v9 = [v8 remoteLongTermKey];

  if (!v9)
  {
LABEL_8:
    uint64_t v15 = paired_unlock_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100205438(v4, self, v15);
    }

    uint64_t v16 = SFUnlockErrorDomian;
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    CFStringRef v28 = @"Missing information to created session";
    CFStringRef v17 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    uint64_t v18 = v16;
    uint64_t v19 = 103;
    goto LABEL_11;
  }
  uint64_t v10 = [(SDUnlockSessionManager *)self securityManager];
  -[SDUnlockSessionManager setSetupAuthSession:](self, "setSetupAuthSession:", [v10 escrowCreationSessionAsOriginator:0 errorCode:0]);

  if ([(SDUnlockSessionManager *)self setupAuthSession] < 0)
  {
    int v21 = paired_unlock_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1002055C0();
    }

    uint64_t v22 = SFUnlockErrorDomian;
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    CFStringRef v30 = @"Could not create escrow session";
    CFStringRef v17 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    uint64_t v18 = v22;
    uint64_t v19 = 101;
LABEL_11:
    __int16 v20 = +[NSError errorWithDomain:v18 code:v19 userInfo:v17];
    [(SDUnlockLockManager *)self notifyEnableStateWithError:v20];

    [(SDUnlockSessionManager *)self sendDisableMessage];
    goto LABEL_12;
  }
  uint64_t v11 = [(SDUnlockSessionManager *)self securityManager];
  int64_t v12 = [(SDUnlockSessionManager *)self setupAuthSession];
  uint64_t v13 = [v4 token];
  id v14 = [v11 stepWithAuthSession:v12 data:v13];

  if (v14)
  {
    -[SDUnlockLockManager sendCreateEscrowSecretWithStepData:sessionID:](self, "sendCreateEscrowSecretWithStepData:sessionID:", v14, [v4 sessionID]);
  }
  else
  {
    v23 = paired_unlock_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10020558C();
    }

    uint64_t v24 = SFUnlockErrorDomian;
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    CFStringRef v32 = @"Could not step escrow session";
    v25 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v26 = +[NSError errorWithDomain:v24 code:101 userInfo:v25];
    [(SDUnlockLockManager *)self notifyEnableStateWithError:v26];

    [(SDUnlockSessionManager *)self sendDisableMessage];
  }

LABEL_12:
}

- (void)handleSetupCreateRecord:(id)a3
{
  id v4 = a3;
  int v5 = [[SDUnlockSetupCreateRecord alloc] initWithData:v4];

  [(SDUnlockSessionManager *)self logProtoBufReceived:v5];
  if (v5
    && [(SDUnlockSetupCreateRecord *)v5 hasToken]
    && ![(SDUnlockSetupCreateRecord *)v5 hasErrorCode])
  {
    int64_t v12 = [(SDUnlockSessionManager *)self securityManager];
    int64_t v13 = [(SDUnlockSessionManager *)self setupAuthSession];
    id v14 = [(SDUnlockSetupCreateRecord *)v5 token];
    uint64_t v15 = [v12 stepWithAuthSession:v13 data:v14 authStep:1];

    if (v15)
    {
      uint64_t v16 = [(SDUnlockSessionManager *)self securityManager];
      unsigned int v17 = [v16 setupWithAuthSession:-[SDUnlockSessionManager setupAuthSession](self, "setupAuthSession") passcode:self->_passcode];

      if (v17)
      {
        [(SDUnlockLockManager *)self notifyEnableStateWithError:0];
        [(SDUnlockSessionManager *)self enableUnlockPairing];
        [(SDUnlockLockManager *)self scheduleDailyMetricReporterIfNeeded];
LABEL_26:

        goto LABEL_17;
      }
      uint64_t v19 = SFUnlockErrorDomian;
      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      CFStringRef v29 = @"Could not step escrow record";
      __int16 v20 = &v29;
      int v21 = &v28;
    }
    else
    {
      uint64_t v18 = paired_unlock_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100205690();
      }

      uint64_t v19 = SFUnlockErrorDomian;
      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      CFStringRef v27 = @"Could not complete final step";
      __int16 v20 = &v27;
      int v21 = &v26;
    }
    uint64_t v22 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v21 count:1];
    v23 = +[NSError errorWithDomain:v19 code:101 userInfo:v22];
    [(SDUnlockLockManager *)self notifyEnableStateWithError:v23];

    [(SDUnlockSessionManager *)self sendDisableMessage];
    goto LABEL_26;
  }
  if (self->_canRetrySetup
    && [(SDUnlockSetupCreateRecord *)v5 hasErrorCode]
    && ([(SDUnlockSetupCreateRecord *)v5 errorCode] == 188
     || [(SDUnlockSetupCreateRecord *)v5 errorCode] == 187))
  {
    self->_canRetrySetup = 0;
    uint64_t v6 = paired_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10020565C();
    }

    [(SDUnlockLockManager *)self enableUnlockForcingLTKTransfer:1];
  }
  else
  {
    if ([(SDUnlockSetupCreateRecord *)v5 hasErrorCode]) {
      uint64_t v7 = [(SDUnlockSetupCreateRecord *)v5 errorCode];
    }
    else {
      uint64_t v7 = 103;
    }
    unsigned int v8 = paired_unlock_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1002055F4();
    }

    uint64_t v9 = SFUnlockErrorDomian;
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    CFStringRef v25 = @"Error occured on the lock side";
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v11 = +[NSError errorWithDomain:v9 code:v7 userInfo:v10];
    [(SDUnlockLockManager *)self notifyEnableStateWithError:v11];

    [(SDUnlockSessionManager *)self sendDisableMessage];
  }
LABEL_17:
}

- (void)handleSessionKeyExchangeRequest:(id)a3
{
  id v4 = a3;
  if ([(SDUnlockLockManager *)self unlockEnabled])
  {
    if ([(SDUnlockLockManager *)self localDeviceLocked])
    {
      int v5 = [(SDUnlockLockManager *)self dailyMetrics];
      [v5 setTotalAttempts:[v5 totalAttempts] + 1];

      uint64_t v6 = [[SDUnlockSessionKeyExchangeRequest alloc] initWithData:v4];
      [(SDUnlockSessionManager *)self logProtoBufReceived:v6];
      if ([(SDUnlockSessionKeyExchangeRequest *)v6 hasSessionID]
        && self->_unlockSessionID != [(SDUnlockSessionKeyExchangeRequest *)v6 sessionID])
      {
        if (![(SDUnlockLockManager *)self lostModeEnabled])
        {
          self->_unlockSessionID = [(SDUnlockSessionKeyExchangeRequest *)v6 sessionID];
          v23 = objc_opt_new();
          [(SDUnlockLockManager *)self setSessionStartDate:v23];

          [(SDUnlockLockManager *)self setOnWristForCurrentSession:[(SDUnlockLockManager *)self inPosition]];
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_100202EA8;
          v25[3] = &unk_1008D0DC8;
          v25[4] = self;
          NSErrorUserInfoKey v26 = v6;
          [(SDUnlockLockManager *)self getWristAndMotionStateWithCompletionHandler:v25];

          goto LABEL_24;
        }
        uint64_t v15 = paired_unlock_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_1002056F8(v15, v16, v17, v18, v19, v20, v21, v22);
        }

        id v13 = (id)[(SDUnlockSessionKeyExchangeRequest *)v6 sessionID];
        int64_t v12 = self;
        uint64_t v14 = 4;
      }
      else
      {
        unsigned int v7 = [(SDUnlockSessionKeyExchangeRequest *)v6 hasSessionID];
        unsigned int v8 = paired_unlock_log();
        uint64_t v9 = v8;
        if (v7)
        {
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)NSErrorUserInfoKey v24 = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received request for session in progress", v24, 2u);
          }

          goto LABEL_24;
        }
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1002056C4();
        }

        int64_t v12 = self;
        id v13 = 0;
        uint64_t v14 = 8;
      }
      [(SDUnlockSessionManager *)v12 sendResetMessage:v13 reason:v14];
LABEL_24:

      goto LABEL_25;
    }
    uint64_t v11 = paired_unlock_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)NSErrorUserInfoKey v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Device already unlocked", v24, 2u);
    }

    [(SDUnlockLockManager *)self sendDeviceLockStateChanged:1];
  }
  else
  {
    uint64_t v10 = paired_unlock_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100205770();
    }

    [(SDUnlockSessionManager *)self sendDisableMessage];
  }
LABEL_25:
}

- (void)handleSessionAuthToken:(id)a3
{
  id v4 = a3;
  if ([(SDUnlockLockManager *)self localDeviceLocked])
  {
    int v5 = [[SDUnlockSessionAuthToken alloc] initWithData:v4];
    [(SDUnlockSessionManager *)self logProtoBufReceived:v5];
    uint64_t v6 = [(SDUnlockLockManager *)self deviceOffWristForSessionID];
    if (v6 == (void *)[(SDUnlockLockManager *)self unlockSessionID])
    {
      unsigned int v7 = paired_unlock_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10020580C();
      }

      id v8 = (id)[(SDUnlockSessionAuthToken *)v5 sessionID];
      uint64_t v9 = self;
      uint64_t v10 = 13;
    }
    else
    {
      if ([(SDUnlockLockManager *)self inPosition]
        && [(SDUnlockLockManager *)self waitingForAuthToken]
        && [(SDUnlockSessionAuthToken *)v5 hasAuthToken])
      {
        [(SDUnlockLockManager *)self setLastUnlockedByPairedUnlock:1];
        int64_t v12 = [(SDUnlockSessionManager *)self securityManager];
        int64_t v13 = [(SDUnlockSessionManager *)self unlockAuthSession];
        uint64_t v14 = [(SDUnlockSessionAuthToken *)v5 authToken];
        uint64_t v15 = [v12 stepWithAuthSession:v13 data:v14 authStep:1];

        id v16 = (id)[(SDUnlockSessionAuthToken *)v5 sessionID];
        if (v15)
        {
          [(SDUnlockLockManager *)self sendSessionUnlockConfirmation:1 sessionID:v16];
          uint64_t v17 = paired_unlock_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "UNLOCK SUCCEEDED", buf, 2u);
          }

          uint64_t v18 = +[NSDate date];
          [(SDUnlockLockManager *)self setLastPairedUnlockDate:v18];
        }
        else
        {
          [(SDUnlockLockManager *)self sendSessionUnlockConfirmation:0 sessionID:v16];
          [(SDUnlockLockManager *)self setLastUnlockedByPairedUnlock:0];
        }
        [(SDUnlockLockManager *)self resetState];

        goto LABEL_27;
      }
      uint64_t v19 = paired_unlock_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100205840(self);
      }

      if ([(SDUnlockLockManager *)self inPosition])
      {
        if ([(SDUnlockLockManager *)self waitingForAuthToken])
        {
          if ([(SDUnlockSessionAuthToken *)v5 hasAuthToken]) {
            uint64_t v20 = 0;
          }
          else {
            uint64_t v20 = 11;
          }
        }
        else
        {
          uint64_t v20 = 10;
        }
      }
      else
      {
        uint64_t v20 = 12;
      }
      id v8 = (id)[(SDUnlockSessionAuthToken *)v5 sessionID];
      uint64_t v9 = self;
      uint64_t v10 = v20;
    }
    [(SDUnlockSessionManager *)v9 sendResetMessage:v8 reason:v10];
LABEL_27:

    goto LABEL_28;
  }
  uint64_t v11 = paired_unlock_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Ignoring auth token, device unlocked", v21, 2u);
  }

  [(SDUnlockLockManager *)self sendDeviceLockStateChanged:1];
LABEL_28:
}

- (void)handleStashKeyExchangeRequest:(id)a3
{
  id v4 = a3;
  int v5 = [[SDUnlockStashKeyExchangeRequest alloc] initWithData:v4];

  [(SDUnlockSessionManager *)self logProtoBufReceived:v5];
  if (![(SDUnlockStashKeyExchangeRequest *)v5 hasKey])
  {
    uint64_t v11 = paired_unlock_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100205910();
    }

    goto LABEL_8;
  }
  uint64_t v6 = [(SDUnlockSessionManager *)self securityManager];
  -[SDUnlockSessionManager setStashBagSession:](self, "setStashBagSession:", [v6 stashBagSessionAsOriginator:0 escrowSecret:0 manifest:0]);

  if ([(SDUnlockSessionManager *)self stashBagSession] < 0) {
    goto LABEL_8;
  }
  unsigned int v7 = [(SDUnlockSessionManager *)self securityManager];
  int64_t v8 = [(SDUnlockSessionManager *)self stashBagSession];
  uint64_t v9 = [(SDUnlockStashKeyExchangeRequest *)v5 key];
  uint64_t v10 = [v7 stepWithAuthSession:v8 data:v9];

  if (!v10)
  {
LABEL_8:
    [(SDUnlockLockManager *)self sendStashKeyExchangeResponse:0 sessionID:[(SDUnlockStashKeyExchangeRequest *)v5 sessionID] errorCode:101];
    goto LABEL_9;
  }
  [(SDUnlockLockManager *)self sendStashKeyExchangeResponse:v10 sessionID:[(SDUnlockStashKeyExchangeRequest *)v5 sessionID] errorCode:0];

LABEL_9:
}

- (void)handleStashToken:(id)a3
{
  id v4 = a3;
  uint64_t v10 = [[SDUnlockStashToken alloc] initWithData:v4];

  [(SDUnlockSessionManager *)self logProtoBufReceived:v10];
  if ([(SDUnlockStashToken *)v10 hasStashToken])
  {
    int v5 = [(SDUnlockSessionManager *)self securityManager];
    int64_t v6 = [(SDUnlockSessionManager *)self stashBagSession];
    unsigned int v7 = [(SDUnlockStashToken *)v10 stashToken];
    int64_t v8 = [v5 stepWithAuthSession:v6 data:v7 authStep:1];

    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  [(SDUnlockLockManager *)self sendStashConfirmation:v9 sessionID:[(SDUnlockStashToken *)v10 sessionID]];
  [(SDUnlockSessionManager *)self resetStashState];
}

- (void)handleRelockRequest
{
  if (self->_unlockSessionID) {
    [(SDUnlockSessionManager *)self resetAndClearState];
  }
  id v2 = paired_unlock_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Locking device", v3, 2u);
  }

  sub_1001AC364();
}

- (void)handleUnlockStateRequest:(id)a3
{
  id v4 = a3;
  int64_t v8 = [[SDUnlockStateRequest alloc] initWithData:v4];

  [(SDUnlockSessionManager *)self logProtoBufReceived:v8];
  BOOL v5 = [(SDUnlockLockManager *)self unlockEnabled];
  int64_t v6 = +[SDStatusMonitor sharedMonitor];
  uint64_t v7 = [v6 deviceKeyBagDisabled] ^ 1;

  [(SDUnlockLockManager *)self sendStateResponseWithUnlockEnabled:v5 passcodeEnabled:v7];
}

- (void)sendDeviceLockStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = objc_alloc_init(SDUnlockLockStateUpdated);
  [(SDUnlockLockStateUpdated *)v7 setVersion:1];
  [(SDUnlockLockStateUpdated *)v7 setUnlocked:v3];
  [(SDUnlockSessionManager *)self logProtoBufSend:v7];
  BOOL v5 = [(SDUnlockSessionManager *)self idsController];
  int64_t v6 = [(SDUnlockLockStateUpdated *)v7 data];
  [v5 sendProtocolBufferData:v6 withType:1001 timeout:0 option:1 queueOneID:@"com.apple.sharingd.lock-state" errorHandler:&stru_1008D0DE8];
}

- (void)sendLongTermKeyRequest:(id)a3 requestID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = objc_alloc_init(SDUnlockLongTermKeyRequest);
  [(SDUnlockLongTermKeyRequest *)v8 setVersion:1];
  [(SDUnlockLongTermKeyRequest *)v8 setLongTermKey:v7];

  [(SDUnlockLongTermKeyRequest *)v8 setRequestID:v6];
  [(SDUnlockSessionManager *)self logProtoBufSend:v8];
  BOOL v9 = [(SDUnlockSessionManager *)self idsController];
  uint64_t v10 = [(SDUnlockLongTermKeyRequest *)v8 data];
  uint64_t v11 = +[NSNumber numberWithDouble:45.0];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100203AB0;
  v12[3] = &unk_1008CA5A8;
  void v12[4] = self;
  [v9 sendProtocolBufferData:v10 withType:1008 timeout:v11 option:0 errorHandler:v12];

  [(SDUnlockLockManager *)self restartLongTermKeyTimer];
}

- (void)sendClassALongTermKeyRequest:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = objc_alloc_init(SDUnlockClassALongTermKeyRequest);
  [(SDUnlockClassALongTermKeyRequest *)v7 setVersion:1];
  [(SDUnlockClassALongTermKeyRequest *)v7 setLongTermKey:v6];

  [(SDUnlockClassALongTermKeyRequest *)v7 setSessionID:v4];
  [(SDUnlockSessionManager *)self logProtoBufSend:v7];
  int64_t v8 = [(SDUnlockSessionManager *)self idsController];
  BOOL v9 = [(SDUnlockClassALongTermKeyRequest *)v7 data];
  uint64_t v10 = +[NSNumber numberWithDouble:45.0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100203C6C;
  v11[3] = &unk_1008CA5A8;
  v11[4] = self;
  [v8 sendProtocolBufferData:v9 withType:1009 timeout:v10 option:0 dataClass:2 queueOneID:0 errorHandler:v11];

  [(SDUnlockLockManager *)self restartEnableTimerWithTimeout:45.0 * 2.0 + 5.0];
}

- (void)sendSetupRequest:(id)a3 withSessionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = objc_alloc_init(SDUnlockSetupRequest);
  [(SDUnlockSetupRequest *)v7 setVersion:1];
  [(SDUnlockSetupRequest *)v7 setSessionID:v4];
  if (v6) {
    [(SDUnlockSetupRequest *)v7 setLongTermKey:v6];
  }
  [(SDUnlockSessionManager *)self logProtoBufSend:v7];
  int64_t v8 = [(SDUnlockSessionManager *)self idsController];
  BOOL v9 = [(SDUnlockSetupRequest *)v7 data];
  uint64_t v10 = +[NSNumber numberWithDouble:45.0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100203EDC;
  v11[3] = &unk_1008CA5A8;
  v11[4] = self;
  [v8 sendProtocolBufferData:v9 withType:1002 timeout:v10 option:0 errorHandler:v11];

  [(SDUnlockLockManager *)self restartEnableTimerWithTimeout:45.0];
}

- (void)sendCreateEscrowSecretWithStepData:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = objc_alloc_init(SDUnlockSetupCreateSecret);
  [(SDUnlockSetupCreateSecret *)v7 setVersion:1];
  [(SDUnlockSetupCreateSecret *)v7 setSessionID:v4];
  [(SDUnlockSetupCreateSecret *)v7 setToken:v6];

  [(SDUnlockSessionManager *)self logProtoBufSend:v7];
  int64_t v8 = [(SDUnlockSessionManager *)self idsController];
  BOOL v9 = [(SDUnlockSetupCreateSecret *)v7 data];
  uint64_t v10 = +[NSNumber numberWithDouble:45.0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10020414C;
  v11[3] = &unk_1008CA5A8;
  v11[4] = self;
  [v8 sendProtocolBufferData:v9 withType:1003 timeout:v10 option:0 errorHandler:v11];

  [(SDUnlockLockManager *)self restartEnableTimerWithTimeout:45.0];
}

- (void)sendKeyExchangeResponse:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = objc_alloc_init(SDUnlockSessionKeyExchangeResponse);
  [(SDUnlockSessionKeyExchangeResponse *)v7 setVersion:1];
  [(SDUnlockSessionKeyExchangeResponse *)v7 setSessionID:v4];
  if (v6) {
    [(SDUnlockSessionKeyExchangeResponse *)v7 setKey:v6];
  }
  else {
    [(SDUnlockSessionKeyExchangeResponse *)v7 setKeyFailed:1];
  }
  [(SDUnlockSessionManager *)self logProtoBufSend:v7];
  int64_t v8 = [(SDUnlockSessionManager *)self idsController];
  BOOL v9 = [(SDUnlockSessionKeyExchangeResponse *)v7 data];
  uint64_t v10 = +[NSNumber numberWithDouble:45.0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002043E0;
  v11[3] = &unk_1008CA5A8;
  v11[4] = self;
  [v8 sendProtocolBufferData:v9 withType:1004 timeout:v10 option:1 errorHandler:v11];

  [(SDUnlockSessionManager *)self restartUnlockTimer:sub_1001B1AF8((double)65)];
}

- (void)sendSessionUnlockConfirmation:(BOOL)a3 sessionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  id v7 = objc_alloc_init(SDUnlockSessionConfirmation);
  [(SDUnlockSessionConfirmation *)v7 setVersion:1];
  [(SDUnlockSessionConfirmation *)v7 setSessionID:v4];
  [(SDUnlockSessionConfirmation *)v7 setSuccess:v5];
  [(SDUnlockSessionManager *)self logProtoBufSend:v7];
  int64_t v8 = [(SDUnlockSessionManager *)self idsController];
  BOOL v9 = [(SDUnlockSessionConfirmation *)v7 data];
  uint64_t v10 = +[NSNumber numberWithDouble:45.0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100204518;
  v11[3] = &unk_1008CA5A8;
  v11[4] = self;
  [v8 sendProtocolBufferData:v9 withType:1005 timeout:v10 option:1 errorHandler:v11];
}

- (void)sendStashKeyExchangeResponse:(id)a3 sessionID:(unsigned int)a4 errorCode:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  BOOL v9 = objc_alloc_init(SDUnlockStashKeyExchangeResponse);
  [(SDUnlockStashKeyExchangeResponse *)v9 setVersion:1];
  [(SDUnlockStashKeyExchangeResponse *)v9 setSessionID:v6];
  if (v8) {
    [(SDUnlockStashKeyExchangeResponse *)v9 setKey:v8];
  }
  else {
    [(SDUnlockStashKeyExchangeResponse *)v9 setErrorCode:a5];
  }
  [(SDUnlockSessionManager *)self logProtoBufSend:v9];
  uint64_t v10 = [(SDUnlockSessionManager *)self idsController];
  uint64_t v11 = [(SDUnlockStashKeyExchangeResponse *)v9 data];
  int64_t v12 = +[NSNumber numberWithDouble:45.0];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10020466C;
  v13[3] = &unk_1008CA5A8;
  v13[4] = self;
  [v10 sendProtocolBufferData:v11 withType:1006 timeout:v12 option:1 errorHandler:v13];
}

- (void)sendStashConfirmation:(BOOL)a3 sessionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  id v7 = objc_alloc_init(SDUnlockStashConfirmation);
  [(SDUnlockStashConfirmation *)v7 setVersion:1];
  [(SDUnlockStashConfirmation *)v7 setSessionID:v4];
  [(SDUnlockStashConfirmation *)v7 setSuccess:v5];
  [(SDUnlockSessionManager *)self logProtoBufSend:v7];
  id v8 = [(SDUnlockSessionManager *)self idsController];
  BOOL v9 = [(SDUnlockStashConfirmation *)v7 data];
  uint64_t v10 = +[NSNumber numberWithDouble:45.0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002047A4;
  v11[3] = &unk_1008CA5A8;
  v11[4] = self;
  [v8 sendProtocolBufferData:v9 withType:1007 timeout:v10 option:1 errorHandler:v11];
}

- (void)sendStateResponseWithUnlockEnabled:(BOOL)a3 passcodeEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v10 = objc_alloc_init(SDUnlockStateResponse);
  [(SDUnlockStateResponse *)v10 setVersion:1];
  [(SDUnlockStateResponse *)v10 setUnlockEnabled:v5];
  [(SDUnlockStateResponse *)v10 setPasscodeEnabled:v4];
  [(SDUnlockSessionManager *)self logProtoBufSend:v10];
  id v7 = [(SDUnlockSessionManager *)self idsController];
  id v8 = [(SDUnlockStateResponse *)v10 data];
  BOOL v9 = +[NSNumber numberWithDouble:10.0];
  [v7 sendProtocolBufferData:v8 withType:4 timeout:v9 option:1 errorHandler:&stru_1008D0E08];
}

- (NSDate)wristOnDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWristOnDate:(id)a3
{
}

- (BOOL)lastUnlockedByPairedUnlock
{
  return self->_lastUnlockedByPairedUnlock;
}

- (void)setLastUnlockedByPairedUnlock:(BOOL)a3
{
  self->_lastUnlockedByPairedUnlock = a3;
}

- (void)setInPosition:(BOOL)a3
{
  self->_inPosition = a3;
}

- (BOOL)canRetrySetup
{
  return self->_canRetrySetup;
}

- (void)setCanRetrySetup:(BOOL)a3
{
  self->_canRetrySetup = a3;
}

- (NSString)requestID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRequestID:(id)a3
{
}

- (BOOL)sentLockedState
{
  return self->_sentLockedState;
}

- (void)setSentLockedState:(BOOL)a3
{
  self->_sentLockedState = a3;
}

- (NSTimer)enableTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 96, 1);
}

- (void)setEnableTimer:(id)a3
{
}

- (NSData)tempLongTermKey
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTempLongTermKey:(id)a3
{
}

- (BOOL)checkingWristState
{
  return self->_checkingWristState;
}

- (void)setCheckingWristState:(BOOL)a3
{
  self->_checkingWristState = a3;
}

- (BOOL)waitingForAuthToken
{
  return self->_waitingForAuthToken;
}

- (void)setWaitingForAuthToken:(BOOL)a3
{
  self->_waitingForAuthToken = a3;
}

- (NSDate)sessionStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSessionStartDate:(id)a3
{
}

- (NSString)passcode
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPasscode:(id)a3
{
}

- (int64_t)unlockSessionID
{
  return self->_unlockSessionID;
}

- (void)setUnlockSessionID:(int64_t)a3
{
  self->_unlockSessionID = a3;
}

- (BOOL)preventingExitForSetup
{
  return self->_preventingExitForSetup;
}

- (void)setPreventingExitForSetup:(BOOL)a3
{
  self->_preventingExitForSetup = a3;
}

- (BOOL)onWristForCurrentSession
{
  return self->_onWristForCurrentSession;
}

- (void)setOnWristForCurrentSession:(BOOL)a3
{
  self->_onWristForCurrentSession = a3;
}

- (BOOL)checkingWristAndMotionState
{
  return self->_checkingWristAndMotionState;
}

- (void)setCheckingWristAndMotionState:(BOOL)a3
{
  self->_checkingWristAndMotionState = a3;
}

- (OS_dispatch_source)longTermKeyTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLongTermKeyTimer:(id)a3
{
}

- (NSDate)lastPairedUnlockDate
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLastPairedUnlockDate:(id)a3
{
}

- (int64_t)deviceOffWristForSessionID
{
  return self->_deviceOffWristForSessionID;
}

- (void)setDeviceOffWristForSessionID:(int64_t)a3
{
  self->_deviceOffWristForSessionID = a3;
}

- (OS_dispatch_source)wristAndMotionTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 160, 1);
}

- (void)setWristAndMotionTimer:(id)a3
{
}

- (OS_dispatch_semaphore)positionSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 168, 1);
}

- (void)setPositionSemaphore:(id)a3
{
}

- (SDUnlockMotionDetector)motionDetector
{
  return (SDUnlockMotionDetector *)objc_getProperty(self, a2, 176, 1);
}

- (void)setMotionDetector:(id)a3
{
}

- (SDUnlockWakeGestureRecord)lastWakeGestureRecord
{
  return (SDUnlockWakeGestureRecord *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLastWakeGestureRecord:(id)a3
{
}

- (SFPairedUnlockDailyEvent)dailyMetrics
{
  return (SFPairedUnlockDailyEvent *)objc_getProperty(self, a2, 192, 1);
}

- (void)setDailyMetrics:(id)a3
{
}

- (SDUnlockLockMetricDates)metricDates
{
  return (SDUnlockLockMetricDates *)objc_getProperty(self, a2, 200, 1);
}

- (void)setMetricDates:(id)a3
{
}

- (NSBackgroundActivityScheduler)dailyMetricReporter
{
  return (NSBackgroundActivityScheduler *)objc_getProperty(self, a2, 208, 1);
}

- (void)setDailyMetricReporter:(id)a3
{
}

- (id)enableHandler
{
  return objc_getProperty(self, a2, 216, 1);
}

- (void)setEnableHandler:(id)a3
{
}

- (id)wristAndMotionStateHandler
{
  return objc_getProperty(self, a2, 224, 1);
}

- (void)setWristAndMotionStateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_wristAndMotionStateHandler, 0);
  objc_storeStrong(&self->_enableHandler, 0);
  objc_storeStrong((id *)&self->_dailyMetricReporter, 0);
  objc_storeStrong((id *)&self->_metricDates, 0);
  objc_storeStrong((id *)&self->_dailyMetrics, 0);
  objc_storeStrong((id *)&self->_lastWakeGestureRecord, 0);
  objc_storeStrong((id *)&self->_motionDetector, 0);
  objc_storeStrong((id *)&self->_positionSemaphore, 0);
  objc_storeStrong((id *)&self->_wristAndMotionTimer, 0);
  objc_storeStrong((id *)&self->_lastPairedUnlockDate, 0);
  objc_storeStrong((id *)&self->_longTermKeyTimer, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_tempLongTermKey, 0);
  objc_storeStrong((id *)&self->_enableTimer, 0);
  objc_storeStrong((id *)&self->_requestID, 0);

  objc_storeStrong((id *)&self->_wristOnDate, 0);
}

@end