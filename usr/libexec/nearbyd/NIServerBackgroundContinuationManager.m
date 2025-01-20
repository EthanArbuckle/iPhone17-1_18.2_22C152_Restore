@interface NIServerBackgroundContinuationManager
- (NIServerBackgroundContinuationManager)initWithSessionIdentifier:(id)a3 appStateMonitor:(id)a4 queue:(id)a5 analyticsManager:(id)a6 backgroundAuthHandler:(id)a7;
- (id)updatesQueue;
- (void)_cancelStateTimer;
- (void)_changeSessionAuthStateTo:(unsigned __int8)a3;
- (void)_startStateTimer:(double)a3;
- (void)_stateTimerExpired;
- (void)invalidate;
- (void)measurementReceived;
- (void)monitoredApp:(int)a3 didChangeState:(int)a4;
@end

@implementation NIServerBackgroundContinuationManager

- (NIServerBackgroundContinuationManager)initWithSessionIdentifier:(id)a3 appStateMonitor:(id)a4 queue:(id)a5 analyticsManager:(id)a6 backgroundAuthHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  v15 = a5;
  id v43 = a6;
  id v16 = a7;
  v42 = v13;
  if (!v13)
  {
    v37 = +[NSAssertionHandler currentHandler];
    [v37 handleFailureInMethod:a2, self, @"NIServerBackgroundContinuationManager.mm", 114, @"Invalid parameter not satisfying: %@", @"sessionIdentifier" object file lineNumber description];
  }
  v17 = v14;
  if (v14)
  {
    if (v15) {
      goto LABEL_5;
    }
LABEL_21:
    v39 = +[NSAssertionHandler currentHandler];
    [v39 handleFailureInMethod:a2, self, @"NIServerBackgroundContinuationManager.mm", 116, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    if (v16) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
  v38 = +[NSAssertionHandler currentHandler];
  [v38 handleFailureInMethod:a2, self, @"NIServerBackgroundContinuationManager.mm", 115, @"Invalid parameter not satisfying: %@", @"appStateMonitor" object file lineNumber description];

  if (!v15) {
    goto LABEL_21;
  }
LABEL_5:
  if (v16) {
    goto LABEL_6;
  }
LABEL_22:
  v40 = +[NSAssertionHandler currentHandler];
  [v40 handleFailureInMethod:a2, self, @"NIServerBackgroundContinuationManager.mm", 117, @"Invalid parameter not satisfying: %@", @"authHandler" object file lineNumber description];

LABEL_6:
  dispatch_assert_queue_V2(v15);
  v44.receiver = self;
  v44.super_class = (Class)NIServerBackgroundContinuationManager;
  v18 = [(NIServerBackgroundContinuationManager *)&v44 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sessionIdentifier, a3);
    objc_storeStrong((id *)&v19->_appStateMonitor, a4);
    objc_storeStrong((id *)&v19->_queue, a5);
    objc_storeStrong((id *)&v19->_analyticsManager, a6);
    id v20 = objc_retainBlock(v16);
    id authHandler = v19->_authHandler;
    v19->_id authHandler = v20;

    v19->_currentSessionAuthState = 0;
    *(_OWORD *)&v19->_double backgroundDiscoveryTimeoutSeconds = xmmword_1004B86D0;
    v22 = +[NSUserDefaults standardUserDefaults];
    [v22 doubleForKey:@"BackgroundContinuationDiscoveryTimeoutSecondsOverride"];
    double v24 = v23;
    [v22 doubleForKey:@"BackgroundContinuationInteractionTimeoutSecondsOverride"];
    if (v24 > 0.0) {
      v19->_double backgroundDiscoveryTimeoutSeconds = v24;
    }
    if (v25 > 0.0) {
      v19->_double backgroundInteractionTimeoutSeconds = v25;
    }
    v26 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      double backgroundDiscoveryTimeoutSeconds = v19->_backgroundDiscoveryTimeoutSeconds;
      double backgroundInteractionTimeoutSeconds = v19->_backgroundInteractionTimeoutSeconds;
      sessionIdentifier = v19->_sessionIdentifier;
      *(_DWORD *)buf = 134218498;
      double v46 = backgroundDiscoveryTimeoutSeconds;
      __int16 v47 = 2048;
      double v48 = backgroundInteractionTimeoutSeconds;
      __int16 v49 = 2112;
      v50 = sessionIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#bg-continuation,Initialized. Discovery timeout: %.1f [s]. Interaction timeout: %.1f [s]. Session identifier: %@", buf, 0x20u);
    }
    v30 = +[NSString stringWithFormat:@"%@%@", @"com.apple.nearbyd.backgroundContinuation.stateTimer.", v19->_sessionIdentifier];
    v31 = (NSBackgroundActivityScheduler *)[objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:v30];
    stateTimeoutScheduler = v19->_stateTimeoutScheduler;
    v19->_stateTimeoutScheduler = v31;

    [(NSBackgroundActivityScheduler *)v19->_stateTimeoutScheduler invalidate];
    [(PRAppStateMonitorProtocol *)v19->_appStateMonitor addObserver:v19];
    unsigned int v33 = [(PRAppStateMonitorProtocol *)v19->_appStateMonitor currentAppState];
    if (v33 == 2)
    {
      uint64_t v34 = 2;
    }
    else
    {
      if (v33 != 3)
      {
LABEL_18:
        v35 = v19;

        goto LABEL_19;
      }
      uint64_t v34 = 1;
    }
    [(NIServerBackgroundContinuationManager *)v19 _changeSessionAuthStateTo:v34];
    goto LABEL_18;
  }
LABEL_19:

  return v19;
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NIServerBackgroundContinuationManager *)self _cancelStateTimer];
  appStateMonitor = self->_appStateMonitor;

  [(PRAppStateMonitorProtocol *)appStateMonitor removeObserver:self];
}

- (void)measurementReceived
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041A1C0((uint64_t)self, v3);
  }
  if (self->_currentSessionAuthState == 3) {
    [(NIServerBackgroundContinuationManager *)self _changeSessionAuthStateTo:4];
  }
}

- (void)_changeSessionAuthStateTo:(unsigned __int8)a3
{
  int v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    if ((self->_currentSessionAuthState - 1) > 3u) {
      CFStringRef v6 = @"Initializing";
    }
    else {
      CFStringRef v6 = off_100857970[(char)(self->_currentSessionAuthState - 1)];
    }
    if ((v3 - 1) > 3u) {
      CFStringRef v7 = @"Initializing";
    }
    else {
      CFStringRef v7 = off_100857970[(char)(v3 - 1)];
    }
    sessionIdentifier = self->_sessionIdentifier;
    int v15 = 138412802;
    CFStringRef v16 = v6;
    __int16 v17 = 2112;
    CFStringRef v18 = v7;
    __int16 v19 = 2112;
    id v20 = sessionIdentifier;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#bg-continuation,Change session auth state. Current: %@. New: %@. Session identifier: %@", (uint8_t *)&v15, 0x20u);
  }
  int currentSessionAuthState = self->_currentSessionAuthState;
  if (currentSessionAuthState == 1)
  {
    v11 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041A23C(v11);
    }
  }
  else if (currentSessionAuthState != v3)
  {
    [(NIServerBackgroundContinuationManager *)self _cancelStateTimer];
    int v14 = self->_currentSessionAuthState;
    self->_int currentSessionAuthState = v3;
    switch(v3)
    {
      case 0:
        sub_10041A280();
      case 1:
        (*((void (**)(id, void, uint64_t, uint64_t))self->_authHandler + 2))(self->_authHandler, 0, v12, v13);
        break;
      case 2:
        if (!v14) {
          (*((void (**)(id, uint64_t, uint64_t, uint64_t))self->_authHandler + 2))(self->_authHandler, 1, v12, v13);
        }
        break;
      case 3:
        [(NIServerBackgroundContinuationManager *)self _startStateTimer:self->_backgroundDiscoveryTimeoutSeconds];
        break;
      case 4:
        [(NIServerBackgroundContinuationManager *)self _startStateTimer:self->_backgroundInteractionTimeoutSeconds];
        break;
      default:
        return;
    }
  }
}

- (void)_startStateTimer:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NIServerBackgroundContinuationManager *)self _cancelStateTimer];
  [(NSBackgroundActivityScheduler *)self->_stateTimeoutScheduler invalidate];
  [(NSBackgroundActivityScheduler *)self->_stateTimeoutScheduler setQualityOfService:17];
  [(NSBackgroundActivityScheduler *)self->_stateTimeoutScheduler setDelay:a3];
  [(NSBackgroundActivityScheduler *)self->_stateTimeoutScheduler setTolerance:60.0];
  [(NSBackgroundActivityScheduler *)self->_stateTimeoutScheduler setRepeats:0];
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, XPC_ACTIVITY_DELAY, (uint64_t)a3);
  [(NSBackgroundActivityScheduler *)self->_stateTimeoutScheduler _setAdditionalXPCActivityProperties:v5];
  objc_initWeak(&location, self);
  stateTimeoutScheduler = self->_stateTimeoutScheduler;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001C3C98;
  v7[3] = &unk_100857950;
  objc_copyWeak(&v8, &location);
  [(NSBackgroundActivityScheduler *)stateTimeoutScheduler scheduleWithBlock:v7];
  self->_stateTimerStartedMachContTimeSeconds = sub_100006C38();
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_cancelStateTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  stateTimeoutScheduler = self->_stateTimeoutScheduler;

  [(NSBackgroundActivityScheduler *)stateTimeoutScheduler invalidate];
}

- (void)_stateTimerExpired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  double v3 = sub_100006C38();
  v4 = (void *)qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = v3 - self->_stateTimerStartedMachContTimeSeconds;
    if ((self->_currentSessionAuthState - 1) > 3u) {
      CFStringRef v6 = @"Initializing";
    }
    else {
      CFStringRef v6 = off_100857970[(char)(self->_currentSessionAuthState - 1)];
    }
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)v10 = 138412802;
    *(void *)&v10[4] = v6;
    *(_WORD *)&v10[12] = 2048;
    *(double *)&v10[14] = v5;
    *(_WORD *)&v10[22] = 2112;
    v11 = sessionIdentifier;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#bg-continuation,State timeout (state: %@, time elapsed: %.1f [s]). Session identifier: %@", v10, 0x20u);
  }
  [(NIServerBackgroundContinuationManager *)self _cancelStateTimer];
  int currentSessionAuthState = self->_currentSessionAuthState;
  if (currentSessionAuthState == 4)
  {
    [(NIServerBackgroundContinuationManager *)self _changeSessionAuthStateTo:1];
    [(NIServerAnalyticsManager *)self->_analyticsManager backgroundContinuationInteractionTimeout];
  }
  else if (currentSessionAuthState == 3)
  {
    [(NIServerBackgroundContinuationManager *)self _changeSessionAuthStateTo:1];
    [(NIServerAnalyticsManager *)self->_analyticsManager backgroundContinuationDiscoveryTimeout];
  }
}

- (void)monitoredApp:(int)a3 didChangeState:(int)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CFStringRef v7 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = sub_1001DD31C(a4);
    sessionIdentifier = self->_sessionIdentifier;
    v11[0] = 67109634;
    v11[1] = a3;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    int v15 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#bg-continuation,PID %d changed state: %@. Session identifier: %@", (uint8_t *)v11, 0x1Cu);
  }
  switch(a4)
  {
    case 2:
      uint64_t v10 = 2;
LABEL_11:
      [(NIServerBackgroundContinuationManager *)self _changeSessionAuthStateTo:v10];
      return;
    case 3:
      if (self->_currentSessionAuthState == 2) {
        uint64_t v10 = 3;
      }
      else {
        uint64_t v10 = 1;
      }
      goto LABEL_11;
    case 0:
      sub_10041A2AC();
  }
}

- (id)updatesQueue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateTimeoutScheduler, 0);
  objc_storeStrong(&self->_authHandler, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);

  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end