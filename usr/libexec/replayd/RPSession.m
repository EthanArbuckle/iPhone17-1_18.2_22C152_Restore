@interface RPSession
+ (unint64_t)getFileSizeForURL:(id)a3;
- (BOOL)cameraEnabled;
- (BOOL)checkContextIDsMatch:(id)a3;
- (BOOL)checkMultiWindow;
- (BOOL)deviceLocked;
- (BOOL)dispatchLimitReached:(int64_t)a3;
- (BOOL)getAcknowledgementAlertResultsWithMicrophone:(BOOL)a3 cameraEnabled:(BOOL)a4;
- (BOOL)microphoneEnabled;
- (BOOL)shouldBypassAlertForTest;
- (BOOL)shouldSupressAlert;
- (BOOL)showAlertRecordingCaptureSessionWithError:(id)a3;
- (BOOL)showStopSystemSessionAlert;
- (BOOL)statusBarCoordinator:(id)a3 receivedTapWithContext:(id)a4 completionBlock:(id)a5;
- (CGAffineTransform)CGAffineTransformFromFigTransformFlags:(SEL)a3;
- (CGSize)windowSize;
- (NSString)bundleID;
- (NSString)contextID;
- (RPReportingAgent)reportingAgent;
- (RPSession)initWithClientProxy:(id)a3 sessionType:(int)a4 callingPID:(int)a5 bundleID:(id)a6 delegate:(id)a7;
- (id)checkApplicationForegroundRequirement;
- (id)checkCaptureRequirementsWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 windowSize:(CGSize)a5;
- (id)checkContextIDRequirement;
- (id)checkDeviceLockedRequirement;
- (id)checkMinWindowSizeRequirement:(CGSize)a3;
- (id)checkMultiWindowRequirement;
- (id)checkSufficientFreeSpace;
- (id)getCallingConnectionBundleID;
- (id)getNotificationBodyTextForSessionType:(int)a3 cameraEnabled:(BOOL)a4 microphoneEnabled:(BOOL)a5;
- (id)getNotificationTitleTextForSessionType:(int)a3 bundleID:(id)a4;
- (id)serviceNameForReporting;
- (id)showAcknowledgementAlertWithMicrophone:(BOOL)a3 camera:(BOOL)a4;
- (int)sessionState;
- (void)addObserversForSession;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)checkAndPlaySystemSessionSound:(BOOL)a3;
- (void)checkAndPlaySystemSessionSoundForRecordingOn:(BOOL)a3;
- (void)checkForAcknowledgementAlertTimeout;
- (void)clearSystemRecordingUI;
- (void)clientApplicationDidEnterBackground;
- (void)clientApplicationDidEnterForeground;
- (void)dealloc;
- (void)dispatchCompleted:(int64_t)a3;
- (void)frontmostApplicationDidChange:(id)a3;
- (void)handleDisplayBacklightUpdate:(id)a3;
- (void)handleUpdateDisplayLayout:(id)a3;
- (void)invalidate;
- (void)notifyClientSessionDidStopWithError:(int64_t)a3 movieURL:(id)a4 showAlert:(BOOL)a5;
- (void)pauseSession;
- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3 transformFlags:(unint64_t)a4 movieWriter:(id)a5;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)removeObserversForSession;
- (void)reportSessionEndReason:(id)a3;
- (void)reportSummaryEvent:(int64_t)a3 recordedFileSize:(int64_t)a4;
- (void)resumeSessionWithWindowLayerContextID:(id)a3 completionHandler:(id)a4;
- (void)sendBiomeEventIsStarting:(BOOL)a3;
- (void)sendBiomeEventWithSessionState:(int)a3;
- (void)sessionReportCameraUsage:(int64_t)a3;
- (void)setBundleID:(id)a3;
- (void)setCameraEnabled:(BOOL)a3;
- (void)setContextID:(id)a3;
- (void)setDeviceLocked:(BOOL)a3;
- (void)setMicrophoneEnabled:(BOOL)a3;
- (void)setReportingAgent:(id)a3;
- (void)setSessionState:(int)a3;
- (void)setUpDeviceLockNotifications;
- (void)setUpFrontBoardServices;
- (void)setUpStatusBarAssertionWithServiceName:(id)a3;
- (void)setWindowSize:(CGSize)a3;
- (void)setupDispatchLimits;
- (void)startAcknowledgementAlertTimer;
- (void)startWithContextID:(id)a3 windowSize:(CGSize)a4;
- (void)timerDidUpdate:(id)a3;
- (void)updateClientProxy:(id)a3 callingPID:(int)a4 bundleID:(id)a5;
- (void)updatePauseOffsetForSampleBuffer:(opaqueCMSampleBuffer *)a3 withSampleType:(int)a4 handler:(id)a5;
- (void)updatePauseOffsetFromVideoBuffer:(opaqueCMSampleBuffer *)a3;
- (void)updateProcessIDForAudioCaptureWithPID:(int)a3;
- (void)updateReportingSampleCount:(int)a3;
@end

@implementation RPSession

- (RPSession)initWithClientProxy:(id)a3 sessionType:(int)a4 callingPID:(int)a5 bundleID:(id)a6 delegate:(id)a7
{
  id v33 = a3;
  id v13 = a6;
  id v14 = a7;
  v34.receiver = self;
  v34.super_class = (Class)RPSession;
  v15 = [(RPSession *)&v34 init];
  uint64_t v16 = objc_opt_class();
  BOOL v17 = v16 != objc_opt_class() || dword_100099BB8 > 2;
  if (!v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004FF74();
    if (!v15) {
      goto LABEL_16;
    }
  }
  else if (!v15)
  {
    goto LABEL_16;
  }
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    *(_DWORD *)buf = 136446978;
    v36 = "-[RPSession initWithClientProxy:sessionType:callingPID:bundleID:delegate:]";
    __int16 v37 = 1024;
    int v38 = 148;
    __int16 v39 = 2112;
    v40 = v19;
    __int16 v41 = 2048;
    v42 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", buf, 0x26u);
  }
  objc_storeStrong((id *)v15 + 2, a3);
  v20 = (void *)*((void *)v15 + 43);
  *((void *)v15 + 43) = 0;

  *(CGSize *)(v15 + 360) = CGSizeZero;
  objc_storeStrong((id *)v15 + 42, a6);
  *((_DWORD *)v15 + 21) = a4;
  v21 = [RPReportingAgent alloc];
  v22 = [v15 serviceNameForReporting];
  v23 = [(RPReportingAgent *)v21 initWithServiceName:v22];
  v24 = (void *)*((void *)v15 + 44);
  *((void *)v15 + 44) = v23;

  objc_storeStrong((id *)v15 + 3, a7);
  v25 = (void *)*((void *)v15 + 12);
  *((void *)v15 + 12) = 0;

  v15[88] = 0;
  *((void *)v15 + 21) = 0x4020000000000000;
  *((_OWORD *)v15 + 2) = *(_OWORD *)&kCMTimeInvalid.value;
  *((void *)v15 + 6) = kCMTimeInvalid.epoch;
  *(_OWORD *)(v15 + 56) = *(_OWORD *)&kCMTimeZero.value;
  *((void *)v15 + 9) = kCMTimeZero.epoch;
  v15[80] = 0;
  *((_WORD *)v15 + 165) = 0;
  *((_WORD *)v15 + 88) = 0;
  *((_DWORD *)v15 + 83) = 3;
  *((_DWORD *)v15 + 2) = a5;
  v26 = objc_alloc_init(RPApplicationStateMonitor);
  v27 = (void *)*((void *)v15 + 16);
  *((void *)v15 + 16) = v26;

  [*((id *)v15 + 16) addObserver:v15 processIdentifier:*((unsigned int *)v15 + 2)];
  if (*((_DWORD *)v15 + 21) == 6) {
    [*((id *)v15 + 16) addSystemObserver:v15];
  }
  v28 = objc_alloc_init(RPStatusBarAssertion);
  v29 = (void *)*((void *)v15 + 20);
  *((void *)v15 + 20) = v28;

  *((void *)v15 + 13) = 0;
  if ((*((_DWORD *)v15 + 21) - 5) > 2)
  {
    v31 = (void *)*((void *)v15 + 14);
    *((void *)v15 + 14) = 0;
  }
  else
  {
    id v30 = objc_alloc_init((Class)CXCallObserver);
    v31 = (void *)*((void *)v15 + 14);
    *((void *)v15 + 14) = v30;
  }

  [v15 setUpFrontBoardServices];
  [v15 setDeviceLocked:0];
  v15[328] = 0;
  [v15 setUpDeviceLockNotifications];
  pthread_mutex_init((pthread_mutex_t *)(v15 + 200), 0);
  pthread_mutex_init((pthread_mutex_t *)(v15 + 264), 0);
LABEL_16:

  return (RPSession *)v15;
}

- (void)invalidate
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    int v5 = 136446978;
    v6 = "-[RPSession invalidate]";
    __int16 v7 = 1024;
    int v8 = 215;
    __int16 v9 = 2112;
    v10 = v4;
    __int16 v11 = 2048;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v5, 0x26u);
  }
  [(RPApplicationStateMonitor *)self->_applicationStateMonitor removeObserverWithProcessIdentifier:self->_callingPID];
  if (self->_sessionType == 6) {
    [(RPApplicationStateMonitor *)self->_applicationStateMonitor removeSystemObserver];
  }
}

- (void)dealloc
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    *(_DWORD *)buf = 136446978;
    __int16 v7 = "-[RPSession dealloc]";
    __int16 v8 = 1024;
    int v9 = 225;
    __int16 v10 = 2112;
    __int16 v11 = v4;
    __int16 v12 = 2048;
    id v13 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", buf, 0x26u);
  }
  pthread_mutex_destroy(&self->_videoMutex);
  pthread_mutex_destroy(&self->_audioMutex);
  if (self->_aksEvent)
  {
    AKSEventsUnregister();
    self->_aksEvent = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)RPSession;
  [(RPSession *)&v5 dealloc];
}

- (void)startWithContextID:(id)a3 windowSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  __int16 v7 = (NSString *)a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    int v16 = 136446978;
    BOOL v17 = "-[RPSession startWithContextID:windowSize:]";
    __int16 v18 = 1024;
    int v19 = 237;
    __int16 v20 = 2112;
    v21 = v9;
    __int16 v22 = 2048;
    v23 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v16, 0x26u);
  }
  contextID = self->_contextID;
  self->_contextID = v7;
  __int16 v11 = v7;

  +[RPHardwareUtility limitRecordingWindowSizeFromSize:](RPHardwareUtility, "limitRecordingWindowSizeFromSize:", width, height);
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  self->_windowSize.double width = v13;
  self->_windowSize.double height = v15;
  *(_OWORD *)&self->_lastSampleTimestamp.value = *(_OWORD *)&kCMTimeInvalid.value;
  self->_lastSampleTimestamp.epoch = kCMTimeInvalid.epoch;
  *(_OWORD *)&self->_sampleTimeOffset.value = *(_OWORD *)&kCMTimeZero.value;
  self->_sampleTimeOffset.epoch = kCMTimeZero.epoch;
  self->_sessionIsResuming = 0;
  [(RPSession *)self addObserversForSession];
  [(RPSession *)self setSessionState:0];
  [(RPSession *)self checkForAcknowledgementAlertTimeout];
}

- (void)addObserversForSession
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    int v6 = 136446978;
    __int16 v7 = "-[RPSession addObserversForSession]";
    __int16 v8 = 1024;
    int v9 = 250;
    __int16 v10 = 2112;
    __int16 v11 = v4;
    __int16 v12 = 2048;
    CGFloat v13 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v6, 0x26u);
  }
  [(CXCallObserver *)self->_callObserver setDelegate:self queue:0];
  objc_super v5 = +[MCProfileConnection sharedConnection];
  [v5 addObserver:self];
}

- (void)removeObserversForSession
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    int v6 = 136446978;
    __int16 v7 = "-[RPSession removeObserversForSession]";
    __int16 v8 = 1024;
    int v9 = 261;
    __int16 v10 = 2112;
    __int16 v11 = v4;
    __int16 v12 = 2048;
    CGFloat v13 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v6, 0x26u);
  }
  [(CXCallObserver *)self->_callObserver setDelegate:0 queue:0];
  objc_super v5 = +[MCProfileConnection sharedConnection];
  [v5 removeObserver:self];
}

- (void)setSessionState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v5 = (objc_class *)objc_opt_class();
    int v6 = NSStringFromClass(v5);
    int v7 = 136447234;
    __int16 v8 = "-[RPSession setSessionState:]";
    __int16 v9 = 1024;
    int v10 = 272;
    __int16 v11 = 2112;
    __int16 v12 = v6;
    __int16 v13 = 2048;
    double v14 = self;
    __int16 v15 = 1024;
    int v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p session state change to %d", (uint8_t *)&v7, 0x2Cu);
  }
  if (self->_sessionState != v3) {
    [(RPSession *)self sendBiomeEventWithSessionState:v3];
  }
  self->_sessionState = v3;
  if (v3 == 3) {
    [(RPSession *)self removeObserversForSession];
  }
}

- (void)reportSessionEndReason:(id)a3
{
  id v4 = a3;
  id v5 = [(RPSession *)self serviceNameForReporting];
  +[RPReportingAgent reportSessionEnded:2 endReason:v4 withServiceName:v5 clientBundleId:self->_bundleID];
}

- (void)reportSummaryEvent:(int64_t)a3 recordedFileSize:(int64_t)a4
{
  int v7 = [(RPSession *)self reportingAgent];
  [v7 setRecordedFileSize:a4];

  __int16 v8 = [(RPSession *)self reportingAgent];
  [v8 setEndReason:a3];

  id v11 = [(RPSession *)self reportingAgent];
  __int16 v9 = [(RPSession *)self reportingAgent];
  int v10 = [v9 collectSummaryEventMetrics];
  [v11 reportEventWithType:1 dictionary:v10 clientBundleId:self->_bundleID];
}

- (void)checkForAcknowledgementAlertTimeout
{
  unsigned int sessionType = self->_sessionType;
  BOOL v4 = sessionType > 7;
  int v5 = (1 << sessionType) & 0xE8;
  if (v4 || v5 == 0)
  {
    if (self->_lastExemptTime)
    {
      int v7 = +[NSDate date];
      [v7 timeIntervalSinceDate:self->_lastExemptTime];
      double v9 = v8 / 60.0;

      if (self->_privacyAcknowledgementAlertTimeoutMinutes >= v9)
      {
        if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          BOOL isExempt = self->_isExempt;
          int v12 = 136446978;
          __int16 v13 = "-[RPSession checkForAcknowledgementAlertTimeout]";
          __int16 v14 = 1024;
          int v15 = 311;
          __int16 v16 = 2048;
          double v17 = v9;
          __int16 v18 = 1024;
          BOOL v19 = isExempt;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d after %.2f minutes, user acknowledgement exempt %d", (uint8_t *)&v12, 0x22u);
        }
      }
      else
      {
        if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136446722;
          __int16 v13 = "-[RPSession checkForAcknowledgementAlertTimeout]";
          __int16 v14 = 1024;
          int v15 = 306;
          __int16 v16 = 2048;
          double v17 = v9;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d after %.2f minutes, user acknowledgement required", (uint8_t *)&v12, 0x1Cu);
        }
        self->_BOOL isExempt = 0;
        *(_WORD *)&self->_didAcceptMicrophonePermission = 0;
      }
    }
    lastExemptTime = self->_lastExemptTime;
    self->_lastExemptTime = 0;
  }
  else
  {
    self->_BOOL isExempt = 0;
    *(_WORD *)&self->_didAcceptMicrophonePermission = 0;
  }
}

- (void)startAcknowledgementAlertTimer
{
  unsigned int sessionType = self->_sessionType;
  BOOL v3 = sessionType > 7;
  int v4 = (1 << sessionType) & 0xE8;
  if (v3 || v4 == 0)
  {
    if (self->_lastExemptTime)
    {
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        BOOL isExempt = self->_isExempt;
        int v11 = 136446722;
        int v12 = "-[RPSession startAcknowledgementAlertTimer]";
        __int16 v13 = 1024;
        int v14 = 329;
        __int16 v15 = 1024;
        BOOL v16 = isExempt;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d timer already running for user acknowledgement exempt %d", (uint8_t *)&v11, 0x18u);
      }
    }
    else
    {
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v8 = self->_isExempt;
        int v11 = 136446722;
        int v12 = "-[RPSession startAcknowledgementAlertTimer]";
        __int16 v13 = 1024;
        int v14 = 326;
        __int16 v15 = 1024;
        BOOL v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d starting timer for user acknowledgement exempt %d", (uint8_t *)&v11, 0x18u);
      }
      double v9 = +[NSDate date];
      lastExemptTime = self->_lastExemptTime;
      self->_lastExemptTime = v9;
    }
  }
}

- (void)updateReportingSampleCount:(int)a3
{
  if (a3 == 2)
  {
    id v3 = [(RPSession *)self reportingAgent];
    [v3 setMicFrameCount:((char *)[v3 micFrameCount] + 1)];
  }
  else if (a3 == 1)
  {
    id v3 = [(RPSession *)self reportingAgent];
    [v3 setAppAudioFrameCount:((char *)[v3 appAudioFrameCount]) + 1];
  }
  else
  {
    if (a3) {
      return;
    }
    id v3 = [(RPSession *)self reportingAgent];
    [v3 setVideoFrameCount:[v3 videoFrameCount] + 1];
  }
}

- (void)updateClientProxy:(id)a3 callingPID:(int)a4 bundleID:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  int v10 = (NSString *)a5;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = (objc_class *)objc_opt_class();
    int v12 = NSStringFromClass(v11);
    int v17 = 136446978;
    __int16 v18 = "-[RPSession updateClientProxy:callingPID:bundleID:]";
    __int16 v19 = 1024;
    int v20 = 363;
    __int16 v21 = 2112;
    __int16 v22 = v12;
    __int16 v23 = 2048;
    v24 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v17, 0x26u);
  }
  objc_storeStrong((id *)&self->_clientProxy, a3);
  uint64_t callingPID = self->_callingPID;
  if (callingPID != v6)
  {
    if (dword_100099BB8 <= 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = (objc_class *)objc_opt_class();
        __int16 v15 = NSStringFromClass(v14);
        int v17 = 136446978;
        __int16 v18 = "-[RPSession updateClientProxy:callingPID:bundleID:]";
        __int16 v19 = 1024;
        int v20 = 366;
        __int16 v21 = 2112;
        __int16 v22 = v15;
        __int16 v23 = 2048;
        v24 = self;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p pid changed", (uint8_t *)&v17, 0x26u);
      }
      uint64_t callingPID = self->_callingPID;
    }
    [(RPApplicationStateMonitor *)self->_applicationStateMonitor removeObserverWithProcessIdentifier:callingPID];
    [(RPApplicationStateMonitor *)self->_applicationStateMonitor addObserver:self processIdentifier:v6];
    self->_uint64_t callingPID = v6;
  }
  bundleID = self->_bundleID;
  self->_bundleID = v10;
}

- (void)setUpStatusBarAssertionWithServiceName:(id)a3
{
  id v4 = a3;
  [@"com.apple.replayd" UTF8String];
  if (!os_variant_allows_internal_security_policies()) {
    goto LABEL_7;
  }
  CFPropertyListRef v5 = CFPreferencesCopyAppValue(@"RPHideStatusBar", @"com.apple.replayd");
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    BOOL v8 = "-[RPSession setUpStatusBarAssertionWithServiceName:]";
    __int16 v9 = 1024;
    int v10 = 386;
    __int16 v11 = 1024;
    BOOL v12 = v5 != 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d hideStatusBar=%d", buf, 0x18u);
  }
  if (v5)
  {
    CFRelease(v5);
  }
  else
  {
LABEL_7:
    [(RPStatusBarAssertion *)self->_statusBarAssertion setDelegate:self];
    [(RPStatusBarAssertion *)self->_statusBarAssertion setAssertionDelegate:self];
    [(RPStatusBarAssertion *)self->_statusBarAssertion setBroadcasting:self->_sessionType == 6];
    [(RPStatusBarAssertion *)self->_statusBarAssertion setBroadcastServiceName:v4];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000CFA4;
    block[3] = &unk_100084E28;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)clearSystemRecordingUI
{
  if ((self->_sessionType - 5) <= 2)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = (objc_class *)objc_opt_class();
      id v4 = NSStringFromClass(v3);
      int v6 = 136446978;
      int v7 = "-[RPSession clearSystemRecordingUI]";
      __int16 v8 = 1024;
      int v9 = 410;
      __int16 v10 = 2112;
      __int16 v11 = v4;
      __int16 v12 = 2048;
      __int16 v13 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p stop monitoring foreground apps", (uint8_t *)&v6, 0x26u);
    }
    userNotificationStopRecording = self->_userNotificationStopRecording;
    if (userNotificationStopRecording) {
      CFUserNotificationCancel(userNotificationStopRecording);
    }
    [(RPStatusBarAssertion *)self->_statusBarAssertion invalidateStatusBar];
  }
}

- (void)notifyClientSessionDidStopWithError:(int64_t)a3 movieURL:(id)a4 showAlert:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = +[NSError _rpUserErrorForCode:a3 userInfo:0];
  [(RPSessionDelegate *)self->_delegate sessionDidStop];
  [(RPClientProtocol *)self->_clientProxy recordingDidStopWithError:v9 movieURL:v8];

  if (v5) {
    [(RPSession *)self showAlertRecordingCaptureSessionWithError:v9];
  }
}

- (void)updateProcessIDForAudioCaptureWithPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    int v7 = "-[RPSession updateProcessIDForAudioCaptureWithPID:]";
    __int16 v8 = 1024;
    int v9 = 441;
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d pid: %d", (uint8_t *)&v6, 0x18u);
  }
  if ([(RPSession *)self sessionState] == 1)
  {
    if ((int)v3 < 1)
    {
      if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100050018();
      }
    }
    else
    {
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136446722;
        int v7 = "-[RPSession updateProcessIDForAudioCaptureWithPID:]";
        __int16 v8 = 1024;
        int v9 = 445;
        __int16 v10 = 1024;
        int v11 = v3;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d resuming audio capture for pid: %d", (uint8_t *)&v6, 0x18u);
      }
      BOOL v5 = +[RPCaptureManager sharedInstance];
      [v5 restartAppAudioCaptureForProcessID:v3];
    }
  }
}

- (void)pauseSession
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    int v5 = 136446978;
    int v6 = "-[RPSession pauseSession]";
    __int16 v7 = 1024;
    int v8 = 458;
    __int16 v9 = 2112;
    __int16 v10 = v4;
    __int16 v11 = 2048;
    __int16 v12 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v5, 0x26u);
  }
  [(RPSession *)self setSessionState:4];
  [(RPStatusBarAssertion *)self->_statusBarAssertion pauseSession];
}

- (void)resumeSessionWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  __int16 v7 = (void (**)(id, void *))a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = (objc_class *)objc_opt_class();
    __int16 v9 = NSStringFromClass(v8);
    int v16 = 136446978;
    int v17 = "-[RPSession resumeSessionWithWindowLayerContextID:completionHandler:]";
    __int16 v18 = 1024;
    int v19 = 466;
    __int16 v20 = 2112;
    __int16 v21 = v9;
    __int16 v22 = 2048;
    __int16 v23 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v16, 0x26u);
  }
  if (self->_sessionState == 4)
  {
    [(RPSession *)self checkForAcknowledgementAlertTimeout];
    [(RPSession *)self setContextID:v6];
    BOOL microphoneEnabled = self->_microphoneEnabled;
    if ([(RPSession *)self getAcknowledgementAlertResultsWithMicrophone:self->_microphoneEnabled cameraEnabled:self->_cameraEnabled])
    {
      if (microphoneEnabled && self->_sessionType == 2 && !self->_microphoneEnabled)
      {
        if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = (objc_class *)objc_opt_class();
          __int16 v15 = NSStringFromClass(v14);
          int v16 = 136446978;
          int v17 = "-[RPSession resumeSessionWithWindowLayerContextID:completionHandler:]";
          __int16 v18 = 1024;
          int v19 = 487;
          __int16 v20 = 2112;
          __int16 v21 = v15;
          __int16 v22 = 2048;
          __int16 v23 = self;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p resume capture with mic, but session will silence mic", (uint8_t *)&v16, 0x26u);
        }
        self->_BOOL microphoneEnabled = 1;
        [(RPSession *)self handleResumeCaptureWithCompletionHandler:v7];
        self->_BOOL microphoneEnabled = 0;
      }
      else
      {
        [(RPSession *)self handleResumeCaptureWithCompletionHandler:v7];
      }
      [(RPStatusBarAssertion *)self->_statusBarAssertion resumeSession];
      goto LABEL_19;
    }
    [(RPSession *)self setSessionState:3];
    if (!v7) {
      goto LABEL_19;
    }
    uint64_t v12 = -5801;
LABEL_18:
    __int16 v13 = +[NSError _rpUserErrorForCode:v12 userInfo:0];
    v7[2](v7, v13);

    goto LABEL_19;
  }
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int sessionState = self->_sessionState;
    int v16 = 136446722;
    int v17 = "-[RPSession resumeSessionWithWindowLayerContextID:completionHandler:]";
    __int16 v18 = 1024;
    int v19 = 500;
    __int16 v20 = 1024;
    LODWORD(v21) = sessionState;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Cannot resume session as it was not in paused state. Session state:%d", (uint8_t *)&v16, 0x18u);
  }
  if (v7)
  {
    uint64_t v12 = -5832;
    goto LABEL_18;
  }
LABEL_19:
}

- (void)updatePauseOffsetFromVideoBuffer:(opaqueCMSampleBuffer *)a3
{
  memset(&v9, 0, sizeof(v9));
  CMSampleBufferGetPresentationTimeStamp(&v9, a3);
  if (self->_sessionIsResuming)
  {
    memset(&v8, 0, sizeof(v8));
    CMTimeMake(&v8, v9.value - self->_lastSampleTimestamp.value, v9.timescale);
    p_$95D729B680665BEAEFA1D6FCA8238556 sampleTimeOffset = &self->_sampleTimeOffset;
    CMTime time1 = kCMTimeZero;
    $95D729B680665BEAEFA1D6FCA8238556 sampleTimeOffset = self->_sampleTimeOffset;
    if (CMTimeCompare(&time1, (CMTime *)&sampleTimeOffset))
    {
      CMTimeMake(&time1, p_sampleTimeOffset->value + v8.value, v8.timescale);
      *(_OWORD *)&p_sampleTimeOffset->value = *(_OWORD *)&time1.value;
      CMTimeEpoch epoch = time1.epoch;
    }
    else
    {
      *(_OWORD *)&p_sampleTimeOffset->value = *(_OWORD *)&v8.value;
      CMTimeEpoch epoch = v8.epoch;
    }
    self->_sampleTimeOffset.CMTimeEpoch epoch = epoch;
    self->_sessionIsResuming = 0;
  }
  else
  {
    self->_lastSampleTimestamp = ($95D729B680665BEAEFA1D6FCA8238556)v9;
  }
}

- (void)updatePauseOffsetForSampleBuffer:(opaqueCMSampleBuffer *)a3 withSampleType:(int)a4 handler:(id)a5
{
  CMTime v8 = a5;
  CMTime v9 = v8;
  if (!a4)
  {
    [(RPSession *)self updatePauseOffsetFromVideoBuffer:a3];
LABEL_5:
    memset(&v16, 0, sizeof(v16));
    CMSampleBufferGetPresentationTimeStamp(&v16, a3);
    CMTime time1 = (CMTime)self->_sampleTimeOffset;
    CMTime time2 = kCMTimeZero;
    if (CMTimeCompare(&time1, &time2))
    {
      memset(&time1, 0, sizeof(time1));
      CMTime time2 = v16;
      CMTime sampleTimeOffset = (CMTime)self->_sampleTimeOffset;
      CMTimeSubtract(&time1, &time2, &sampleTimeOffset);
      memset(&time2, 0, sizeof(time2));
      CMTime sampleTimeOffset = time1;
      CMTimeConvertScale(&time2, &sampleTimeOffset, v16.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      CMTime sampleTimeOffset = time2;
      CMSampleBufferRef v10 = sub_100048F00(a3, (uint64_t)&sampleTimeOffset);
      __int16 v11 = (void (*)(void *, CMSampleBufferRef))v9[2];
      if (v10)
      {
        CMSampleBufferRef v12 = v10;
        v11(v9, v10);
        CFRelease(v12);
        goto LABEL_10;
      }
    }
    else
    {
      __int16 v11 = (void (*)(void *, CMSampleBufferRef))v9[2];
    }
    v11(v9, a3);
    goto LABEL_10;
  }
  if (!self->_sessionIsResuming) {
    goto LABEL_5;
  }
  ((void (*)(void *, void))v8[2])(v8, 0);
LABEL_10:
}

- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3 transformFlags:(unint64_t)a4 movieWriter:(id)a5
{
  id v8 = a5;
  if (self->_sessionState == 4)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[RPSession processSampleBuffer:transformFlags:movieWriter:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 567;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session is paused discard sample", buf, 0x12u);
    }
  }
  else
  {
    long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)buf = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&buf[16] = v9;
    long long v12 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    if ((self->_sessionType - 5) <= 2) {
      [(RPSession *)self CGAffineTransformFromFigTransformFlags:a4];
    }
    v10[0] = *(_OWORD *)buf;
    v10[1] = *(_OWORD *)&buf[16];
    v10[2] = v12;
    [v8 appendVideoSampleBuffer:a3 withWindowTransform:v10];
  }
}

- (CGAffineTransform)CGAffineTransformFromFigTransformFlags:(SEL)a3
{
  char v4 = a4;
  long long v6 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v7;
  long long v8 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tx = v8;
  if ((a4 & 4) != 0)
  {
    long long v13 = v8;
    long long v14 = v7;
    long long v15 = v6;
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.a) = 136446466;
      *(void *)((char *)&buf.a + 4) = "-[RPSession CGAffineTransformFromFigTransformFlags:]";
      WORD2(buf.b) = 1024;
      *(_DWORD *)((char *)&buf.b + 6) = 587;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d rotate clockwise", (uint8_t *)&buf, 0x12u);
    }
    CGAffineTransformMakeRotation(&t2, 1.57079633);
    *(_OWORD *)&buf.a = v15;
    *(_OWORD *)&buf.c = v14;
    *(_OWORD *)&buf.tx = v13;
    self = CGAffineTransformConcat(retstr, &buf, &t2);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        return self;
      }
      goto LABEL_13;
    }
  }
  else if ((a4 & 2) == 0)
  {
    goto LABEL_3;
  }
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.a) = 136446466;
    *(void *)((char *)&buf.a + 4) = "-[RPSession CGAffineTransformFromFigTransformFlags:]";
    WORD2(buf.b) = 1024;
    *(_DWORD *)((char *)&buf.b + 6) = 591;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d flip x", (uint8_t *)&buf, 0x12u);
  }
  long long v9 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v16.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v16.c = v9;
  *(_OWORD *)&v16.tx = *(_OWORD *)&retstr->tx;
  self = CGAffineTransformScale(&buf, &v16, -1.0, 1.0);
  long long v10 = *(_OWORD *)&buf.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&buf.a;
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&buf.tx;
  if (v4)
  {
LABEL_13:
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.a) = 136446466;
      *(void *)((char *)&buf.a + 4) = "-[RPSession CGAffineTransformFromFigTransformFlags:]";
      WORD2(buf.b) = 1024;
      *(_DWORD *)((char *)&buf.b + 6) = 595;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d flip y", (uint8_t *)&buf, 0x12u);
    }
    long long v11 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v16.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v16.c = v11;
    *(_OWORD *)&v16.tx = *(_OWORD *)&retstr->tx;
    self = CGAffineTransformScale(&buf, &v16, 1.0, -1.0);
    long long v12 = *(_OWORD *)&buf.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&buf.a;
    *(_OWORD *)&retstr->c = v12;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&buf.tx;
  }
  return self;
}

- (void)checkAndPlaySystemSessionSound:(BOOL)a3
{
  BOOL v3 = a3;
  if ((+[RPHardwareUtility supportsShutterSound]
     || +[RPHardwareUtility isVoiceOverRunning])
    && (self->_sessionType - 5) <= 2)
  {
    if (v3) {
      SystemSoundID v5 = 1117;
    }
    else {
      SystemSoundID v5 = 1118;
    }
    AudioServicesPlaySystemSound(v5);
  }
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5 = +[MCProfileConnection sharedConnection];
  if ([v5 effectiveBoolValueForSetting:MCFeatureScreenRecordingAllowed] == 2) {
    [(RPSession *)self handleDeviceRestrictionWarning];
  }
}

- (void)setUpDeviceLockNotifications
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = (objc_class *)objc_opt_class();
    char v4 = NSStringFromClass(v3);
    *(_DWORD *)CGAffineTransform buf = 136446978;
    long long v11 = "-[RPSession setUpDeviceLockNotifications]";
    __int16 v12 = 1024;
    int v13 = 642;
    __int16 v14 = 2112;
    long long v15 = v4;
    __int16 v16 = 2048;
    int v17 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", buf, 0x26u);
  }
  [@"com.apple.replayd" UTF8String];
  if (os_variant_allows_internal_security_policies())
  {
    CFPropertyListRef v5 = CFPreferencesCopyAppValue(@"RPEnableLockedRecording", @"com.apple.replayd");
    self->_BOOL enableLockedRecording = v5 != 0;
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      BOOL enableLockedRecording = self->_enableLockedRecording;
      *(_DWORD *)CGAffineTransform buf = 136446722;
      long long v11 = "-[RPSession setUpDeviceLockNotifications]";
      __int16 v12 = 1024;
      int v13 = 649;
      __int16 v14 = 1024;
      LODWORD(v15) = enableLockedRecording;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d enableLockedRecording=%d", buf, 0x18u);
    }
  }
  else
  {
    CFPropertyListRef v5 = 0;
  }
  if (!self->_enableLockedRecording)
  {
    if (self->_aksEvent) {
      AKSEventsUnregister();
    }
    long long v7 = dispatch_get_global_queue(2, 0);
    v9[5] = _NSConcreteStackBlock;
    v9[6] = 3221225472;
    v9[7] = sub_10000E198;
    v9[8] = &unk_100085220;
    v9[9] = self;
    self->_aksEvent = (_AKSEvent *)AKSEventsRegister();

    if (!self->_aksEvent
      && dword_100099BB8 <= 2
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100050098();
    }
    long long v8 = dispatch_get_global_queue(0, 0);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000E2D0;
    v9[3] = &unk_100084D60;
    v9[4] = self;
    notify_register_dispatch("com.apple.springboard.hasBlankedScreen", &self->_lockToResetToken, v8, v9);
  }
  if (v5) {
    CFRelease(v5);
  }
}

- (BOOL)checkMultiWindow
{
  return +[RPHardwareUtility isIPad];
}

- (void)setUpFrontBoardServices
{
  self->_levelOneElementCount = 0;
  BOOL v3 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
  [v3 setNeedsUserInteractivePriority:1];
  long long v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  long long v9 = sub_10000E4D4;
  long long v10 = &unk_100085248;
  long long v11 = self;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  char v4 = v12;
  [v3 setTransitionHandler:&v7];
  +[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v3, v7, v8, v9, v10, v11);
  CFPropertyListRef v5 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = v5;

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)handleUpdateDisplayLayout:(id)a3
{
  id v4 = a3;
  CFPropertyListRef v5 = +[RPFeatureFlagUtility sharedInstance];
  unsigned int v6 = [v5 systemBannerEnabled];

  if (v6) {
    [(RPSession *)self handleDisplayBacklightUpdate:v4];
  }
  if ([(RPSession *)self checkMultiWindow])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v7 = [v4 elements];
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      int v10 = 0;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v7);
          }
          int v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) bundleIdentifier];

          if (v13) {
            ++v10;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v25 count:16];
      }
      while (v9);

      self->_int64_t levelOneElementCount = v10;
      if (v10 >= 2)
      {
        if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int64_t levelOneElementCount = self->_levelOneElementCount;
          *(_DWORD *)CGAffineTransform buf = 136446722;
          __int16 v20 = "-[RPSession handleUpdateDisplayLayout:]";
          __int16 v21 = 1024;
          int v22 = 797;
          __int16 v23 = 2048;
          int64_t v24 = levelOneElementCount;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stop recording from split mode with %ld elements", buf, 0x1Cu);
        }
        [(RPSession *)self handleDisplayWarning];
      }
    }
    else
    {

      self->_int64_t levelOneElementCount = 0;
    }
  }
}

- (void)handleDisplayBacklightUpdate:(id)a3
{
  id v4 = a3;
  if ([v4 displayBacklightLevel])
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136446722;
      unsigned int v6 = "-[RPSession handleDisplayBacklightUpdate:]";
      __int16 v7 = 1024;
      int v8 = 812;
      __int16 v9 = 1024;
      unsigned int v10 = [v4 displayBacklightLevel];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Display layout updated displayBacklightLevel=%d", (uint8_t *)&v5, 0x18u);
    }
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136446466;
      unsigned int v6 = "-[RPSession handleDisplayBacklightUpdate:]";
      __int16 v7 = 1024;
      int v8 = 807;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Display layout updated to minimum backlight", (uint8_t *)&v5, 0x12u);
    }
    if (!self->_enableLockedRecording) {
      [(RPSession *)self handleDeviceLockedWarning];
    }
  }
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  id v5 = a4;
  if (([v5 isOutgoing] & 1) == 0 && (objc_msgSend(v5, "hasEnded") & 1) == 0) {
    [(RPSession *)self handleIncomingCallWarning];
  }
}

- (id)checkCaptureRequirementsWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 windowSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = (objc_class *)objc_opt_class();
    __int16 v9 = NSStringFromClass(v8);
    int v16 = 136446978;
    long long v17 = "-[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:]";
    __int16 v18 = 1024;
    int v19 = 835;
    __int16 v20 = 2112;
    __int16 v21 = v9;
    __int16 v22 = 2048;
    __int16 v23 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v16, 0x26u);
  }
  uint64_t v10 = [(RPSession *)self checkSufficientFreeSpace];
  uint64_t v11 = (void *)v10;
  if ((self->_sessionType - 8) <= 0xFFFFFFFC && v10 == 0)
  {
    uint64_t v11 = [(RPSession *)self checkContextIDRequirement];
    if (!v11)
    {
      uint64_t v11 = [(RPSession *)self checkApplicationForegroundRequirement];
      if (!v11)
      {
        uint64_t v11 = [(RPSession *)self checkMultiWindowRequirement];
      }
    }
  }
  int sessionType = self->_sessionType;
  if ((sessionType - 5) < 2)
  {
    if (v11) {
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  if (sessionType == 7 && !v11)
  {
LABEL_17:
    uint64_t v14 = [(RPSession *)self checkDeviceLockedRequirement];

    uint64_t v11 = (void *)v14;
  }
  if (!v11)
  {
    uint64_t v11 = -[RPSession checkMinWindowSizeRequirement:](self, "checkMinWindowSizeRequirement:", width, height);
  }
LABEL_20:
  if (v11 && dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136446722;
    long long v17 = "-[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:]";
    __int16 v18 = 1024;
    int v19 = 877;
    __int16 v20 = 2112;
    __int16 v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Check requirements error %@", (uint8_t *)&v16, 0x1Cu);
  }

  return v11;
}

- (id)checkDeviceLockedRequirement
{
  if (self->_deviceLocked)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136446466;
      id v5 = "-[RPSession checkDeviceLockedRequirement]";
      __int16 v6 = 1024;
      int v7 = 886;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d failed to start system recording because device was in locked state", (uint8_t *)&v4, 0x12u);
    }
    v2 = +[NSError _rpUserErrorForCode:-5809 userInfo:0];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)checkContextIDRequirement
{
  v2 = self;
  contextID = self->_contextID;
  BOOL v3 = +[NSArray arrayWithObjects:&contextID count:1];
  LOBYTE(v2) = [(RPSession *)v2 checkContextIDsMatch:v3];

  if (v2)
  {
    int v4 = 0;
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446466;
      int v7 = "-[RPSession checkContextIDRequirement]";
      __int16 v8 = 1024;
      int v9 = 901;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d contextIDs do not match", (uint8_t *)&v6, 0x12u);
    }
    int v4 = +[NSError _rpUserErrorForCode:-5803 userInfo:0];
  }

  return v4;
}

- (BOOL)checkContextIDsMatch:(id)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v4);
      }
      int v9 = +[RPStringUtility numberFromString:](RPStringUtility, "numberFromString:", *(void *)(*((void *)&v14 + 1) + 8 * v8), (void)v14);
      [v9 unsignedIntValue];

      unsigned int ClientPort = CARenderServerGetClientPort();
      if (!ClientPort) {
        break;
      }
      uint64_t v11 = +[RPConnectionManager uniqueClientIdentifierWithPID:CARenderServerGetClientProcessId()];
      dispatch_semaphore_t v12 = [(RPSession *)self getCallingConnectionBundleID];
      mach_port_deallocate(mach_task_self_, ClientPort);
      unsigned int ClientPort = [v11 isEqualToString:v12];

      if (!ClientPort) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        LOBYTE(ClientPort) = 1;
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(ClientPort) = 1;
  }

  return ClientPort;
}

- (id)getCallingConnectionBundleID
{
  v2 = +[RPConnectionManager sharedInstance];
  BOOL v3 = [v2 currentConnection];

  id v4 = +[RPConnectionManager uniqueClientIdentifierWithPID:](RPConnectionManager, "uniqueClientIdentifierWithPID:", [v3 processIdentifier]);

  return v4;
}

- (id)checkSufficientFreeSpace
{
  v2 = +[NSFileManager defaultManager];
  unsigned __int8 v3 = [v2 _srDeviceHasSufficientFreeSpaceForRecording];

  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446466;
      uint64_t v7 = "-[RPSession checkSufficientFreeSpace]";
      __int16 v8 = 1024;
      int v9 = 960;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d insufficient disk space for recording", (uint8_t *)&v6, 0x12u);
    }
    id v4 = +[NSError _rpUserErrorForCode:-5805 userInfo:0];
  }

  return v4;
}

- (id)checkApplicationForegroundRequirement
{
  if ([(RPApplicationStateMonitor *)self->_applicationStateMonitor isApplicationInForegroundWithBundleIdentifier:self->_bundleID])
  {
    v2 = 0;
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136446466;
      id v5 = "-[RPSession checkApplicationForegroundRequirement]";
      __int16 v6 = 1024;
      int v7 = 972;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d attempted to start recording with application not in the foreground", (uint8_t *)&v4, 0x12u);
    }
    v2 = +[NSError _rpUserErrorForCode:-5803 userInfo:0];
  }

  return v2;
}

- (id)checkMultiWindowRequirement
{
  if (self->_levelOneElementCount < 2)
  {
    v2 = 0;
  }
  else
  {
    v2 = +[NSError _rpUserErrorForCode:-5807 userInfo:0];
    if (v2) {
      BOOL v3 = dword_100099BB8 > 1;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136446466;
      __int16 v6 = "-[RPSession checkMultiWindowRequirement]";
      __int16 v7 = 1024;
      int v8 = 984;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d attempted to start recording in split mode, bailing out", (uint8_t *)&v5, 0x12u);
    }
  }

  return v2;
}

- (id)checkMinWindowSizeRequirement:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (a3.height <= 0.0 || a3.width <= 0.0)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100050118(width, height);
    }
    int v5 = +[NSError _rpUserErrorForCode:-5834 userInfo:0];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (BOOL)getAcknowledgementAlertResultsWithMicrophone:(BOOL)a3 cameraEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ((self->_sessionType - 5) < 3
    || +[RPConnectionManager hasUnitTestEntitlement])
  {
    [(RPSession *)self setMicrophoneEnabled:v5];
    [(RPSession *)self setCameraEnabled:v4];
    return 1;
  }
  if ([(RPSession *)self shouldSupressAlert])
  {
    [(RPSession *)self setMicrophoneEnabled:v5];
    [(RPSession *)self setCameraEnabled:v4];
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136446722;
      __int16 v18 = "-[RPSession getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:]";
      __int16 v19 = 1024;
      int v20 = 1016;
      __int16 v21 = 2080;
      __int16 v22 = "-[RPSession getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:]";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %s internal settings suppressAlert", (uint8_t *)&v17, 0x1Cu);
    }
    return 1;
  }
  int v9 = [(RPSession *)self showAcknowledgementAlertWithMicrophone:v5 camera:v4];
  uint64_t v10 = [v9 objectForKey:@"microphoneEnabled"];
  self->_didAcceptMicrophonePermission |= [v10 BOOLValue];

  uint64_t v11 = [v9 objectForKey:@"cameraEnabled"];
  self->_didAcceptCameraPermission |= [v11 BOOLValue];

  BOOL v12 = self->_didAcceptMicrophonePermission && v5;
  [(RPSession *)self setMicrophoneEnabled:v12];
  BOOL v13 = self->_didAcceptCameraPermission && v4;
  [(RPSession *)self setCameraEnabled:v13];
  long long v14 = [v9 objectForKey:@"alertResponse"];
  unsigned __int8 v7 = [v14 BOOLValue];

  if ((v7 & 1) == 0 && dword_100099BB8 <= 1)
  {
    unsigned __int8 v7 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      long long v16 = (char *)objc_claimAutoreleasedReturnValue();
      int v17 = 136446978;
      __int16 v18 = "-[RPSession getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:]";
      __int16 v19 = 1024;
      int v20 = 1031;
      __int16 v21 = 2112;
      __int16 v22 = v16;
      __int16 v23 = 2048;
      int64_t v24 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p user declined session", (uint8_t *)&v17, 0x26u);

      return 0;
    }
  }
  return v7;
}

- (BOOL)shouldSupressAlert
{
  [@"com.apple.replayd" UTF8String];
  if (!os_variant_allows_internal_security_policies()) {
    return 0;
  }
  CFPropertyListRef v3 = CFPreferencesCopyAppValue(@"RPSuppressAlert", @"com.apple.replayd");
  BOOL v4 = v3 != 0;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446722;
    int v9 = "-[RPSession shouldSupressAlert]";
    __int16 v10 = 1024;
    int v11 = 1045;
    __int16 v12 = 1024;
    BOOL v13 = v3 != 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d suppressAlert=%d", (uint8_t *)&v8, 0x18u);
  }
  CFPropertyListRef v5 = CFPreferencesCopyAppValue(@"RPEnableShortPrivacyTrigger", @"com.apple.replayd");
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446722;
    int v9 = "-[RPSession shouldSupressAlert]";
    __int16 v10 = 1024;
    int v11 = 1047;
    __int16 v12 = 1024;
    BOOL v13 = v5 != 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d shortPrivacyPrompt=%d", (uint8_t *)&v8, 0x18u);
  }
  double v6 = 0.333333333;
  if (!v5) {
    double v6 = 8.0;
  }
  self->_privacyAcknowledgementAlertTimeoutMinutes = v6;
  if (v3)
  {
    CFRelease(v3);
    return 1;
  }
  return v4;
}

- (id)showAcknowledgementAlertWithMicrophone:(BOOL)a3 camera:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    *(_DWORD *)CGAffineTransform buf = 136447490;
    v50 = "-[RPSession showAcknowledgementAlertWithMicrophone:camera:]";
    __int16 v51 = 1024;
    int v52 = 1069;
    __int16 v53 = 2112;
    *(void *)v54 = v8;
    *(_WORD *)&v54[8] = 2048;
    v55 = self;
    __int16 v56 = 1024;
    BOOL v57 = v5;
    __int16 v58 = 1024;
    BOOL v59 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p microphoneEnabled: %d cameraEnabled: %d", buf, 0x32u);
  }
  if (!self->_didAcceptCameraPermission && v4 || (!self->_didAcceptMicrophonePermission ? (BOOL v9 = !v5) : (BOOL v9 = 1), !v9))
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CGAffineTransform buf = 136446978;
      v50 = "-[RPSession showAcknowledgementAlertWithMicrophone:camera:]";
      __int16 v51 = 1024;
      int v52 = 1073;
      __int16 v53 = 1024;
      *(_DWORD *)v54 = v4;
      *(_WORD *)&v54[4] = 1024;
      *(_DWORD *)&v54[6] = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d user acknowledgement required requesting camera %d and microphone %d", buf, 0x1Eu);
    }
    self->_BOOL isExempt = 0;
  }
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  if (!self->_isExempt)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    BOOL v13 = [(RPSession *)self getNotificationTitleTextForSessionType:self->_sessionType bundleID:self->_bundleID];
    long long v15 = [(RPSession *)self getNotificationBodyTextForSessionType:self->_sessionType cameraEnabled:v4 microphoneEnabled:v5];
    CFDictionaryAddValue(Mutable, kCFUserNotificationAlertHeaderKey, v13);
    v44 = v15;
    CFDictionaryAddValue(Mutable, kCFUserNotificationAlertMessageKey, v15);
    long long v16 = +[NSBundle _rpFrameworkBundle];
    v47 = [v16 bundleURL];

    value = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"ACKNOWLEDGEMENT_ALERT_DECLINE_BUTTON"];
    HIDWORD(v41) = !v4;
    BOOL v17 = !v5;
    LODWORD(v41) = !v5 || !v4;
    if (v41)
    {
      if (v17 || v4)
      {
        int sessionType = self->_sessionType;
        if (HIDWORD(v41) | v5)
        {
          __int16 v19 = v47;
          if (sessionType == 3) {
            CFStringRef v20 = @"ACKNOWLEDGEMENT_BROADCAST_ALERT_ACCEPT_BUTTON_1_MICROPHONE_DISABLED";
          }
          else {
            CFStringRef v20 = @"ACKNOWLEDGEMENT_ALERT_ACCEPT_BUTTON_1_MICROPHONE_DISABLED";
          }
          int64_t v24 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", v20, v41);
          v26 = 0;
          goto LABEL_34;
        }
        CFStringRef v21 = @"ACKNOWLEDGEMENT_ALERT_ACCEPT_BUTTON_1_CAMERA";
        CFStringRef v22 = @"ACKNOWLEDGEMENT_BROADCAST_ALERT_ACCEPT_BUTTON_1_CAMERA";
      }
      else
      {
        int sessionType = self->_sessionType;
        CFStringRef v21 = @"ACKNOWLEDGEMENT_ALERT_ACCEPT_BUTTON_1";
        CFStringRef v22 = @"ACKNOWLEDGEMENT_BROADCAST_ALERT_ACCEPT_BUTTON_1";
      }
    }
    else
    {
      int sessionType = self->_sessionType;
      CFStringRef v21 = @"ACKNOWLEDGEMENT_ALERT_ACCEPT_BUTTON_1_MICROPHONE_CAMERA_ENABLED";
      CFStringRef v22 = @"ACKNOWLEDGEMENT_BROADCAST_ALERT_ACCEPT_BUTTON_1_MICROPHONE_CAMERA_ENABLED";
    }
    if (sessionType == 3) {
      CFStringRef v23 = v22;
    }
    else {
      CFStringRef v23 = v21;
    }
    int64_t v24 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", v23, v41);
    if (self->_sessionType == 3) {
      CFStringRef v25 = @"ACKNOWLEDGEMENT_BROADCAST_ALERT_ACCEPT_BUTTON_2";
    }
    else {
      CFStringRef v25 = @"ACKNOWLEDGEMENT_ALERT_ACCEPT_BUTTON_2";
    }
    v26 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v25];
    __int16 v19 = v47;
LABEL_34:
    v45 = v26;
    if (v24)
    {
      CFDictionaryAddValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v24);
      v26 = v45;
    }
    if (v26) {
      CFDictionaryAddValue(Mutable, kCFUserNotificationOtherButtonTitleKey, v26);
    }
    CFDictionaryAddValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, value);
    if (v19) {
      CFDictionaryAddValue(Mutable, kCFUserNotificationLocalizationURLKey, v19);
    }
    v27 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, Mutable);
    if (!v27)
    {
      if (Mutable) {
        CFRelease(Mutable);
      }
      if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000501D4();
      }
      v31 = +[NSNumber numberWithBool:0];
      [v10 setObject:v31 forKey:@"cameraEnabled"];

      v32 = +[NSNumber numberWithBool:0];
      [v10 setObject:v32 forKey:@"microphoneEnabled"];

      id v33 = +[NSNumber numberWithBool:0];
      [v10 setObject:v33 forKey:@"alertResponse"];

      self->_BOOL isExempt = 0;
      objc_super v34 = v44;
      goto LABEL_73;
    }
    v28 = v27;
    CFOptionFlags responseFlags = 0;
    CFUserNotificationReceiveResponse(v27, 0.0, &responseFlags);
    if (responseFlags != 2)
    {
      if (responseFlags != 1)
      {
        if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CGAffineTransform buf = 136446466;
          v50 = "-[RPSession showAcknowledgementAlertWithMicrophone:camera:]";
          __int16 v51 = 1024;
          int v52 = 1189;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d user acknowledgement refused", buf, 0x12u);
        }
        BOOL v30 = 0;
        uint64_t v35 = 0;
        uint64_t v36 = 0;
        goto LABEL_71;
      }
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CGAffineTransform buf = 136446978;
        v50 = "-[RPSession showAcknowledgementAlertWithMicrophone:camera:]";
        __int16 v51 = 1024;
        int v52 = 1156;
        __int16 v53 = 1024;
        *(_DWORD *)v54 = v4;
        *(_WORD *)&v54[4] = 1024;
        *(_DWORD *)&v54[6] = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d user acknowledgement accepted for camera %d and microphone %d", buf, 0x1Eu);
      }
      if (v42)
      {
        if (v17 || v4)
        {
          BOOL v29 = v43 | v5;
          BOOL v30 = 1;
          if (v29) {
            goto LABEL_72;
          }
          goto LABEL_60;
        }
        BOOL v30 = 0;
      }
      else
      {
        BOOL v30 = 1;
      }
      uint64_t v35 = 1;
      goto LABEL_70;
    }
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CGAffineTransform buf = 136446466;
      v50 = "-[RPSession showAcknowledgementAlertWithMicrophone:camera:]";
      __int16 v51 = 1024;
      int v52 = 1180;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d user acknowledgement accepted, but no consent for microphone or camera", buf, 0x12u);
    }
    BOOL v30 = 0;
LABEL_60:
    uint64_t v35 = 0;
LABEL_70:
    uint64_t v36 = 1;
LABEL_71:
    __int16 v37 = +[NSNumber numberWithBool:v30];
    [v10 setObject:v37 forKey:@"cameraEnabled"];

    int v38 = +[NSNumber numberWithBool:v35];
    [v10 setObject:v38 forKey:@"microphoneEnabled"];

    BOOL v30 = v36;
LABEL_72:
    objc_super v34 = v44;
    __int16 v39 = +[NSNumber numberWithBool:v30];
    [v10 setObject:v39 forKey:@"alertResponse"];

    self->_BOOL isExempt = v30;
    CFRelease(v28);
    CFRelease(Mutable);
LABEL_73:

    goto LABEL_74;
  }
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CGAffineTransform buf = 136446466;
    v50 = "-[RPSession showAcknowledgementAlertWithMicrophone:camera:]";
    __int16 v51 = 1024;
    int v52 = 1214;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session is still exempt from showing the alert", buf, 0x12u);
  }
  int v11 = +[NSNumber numberWithBool:[(RPSession *)self cameraEnabled]];
  [v10 setObject:v11 forKey:@"cameraEnabled"];

  __int16 v12 = +[NSNumber numberWithBool:[(RPSession *)self microphoneEnabled]];
  [v10 setObject:v12 forKey:@"microphoneEnabled"];

  BOOL v13 = +[NSNumber numberWithBool:1];
  [v10 setObject:v13 forKey:@"alertResponse"];
LABEL_74:

  return v10;
}

- (id)getNotificationTitleTextForSessionType:(int)a3 bundleID:(id)a4
{
  BOOL v5 = +[NSBundle _rpLocalizedAppNameFromBundleID:](NSBundle, "_rpLocalizedAppNameFromBundleID:", self->_bundleID, a4);
  switch(self->_sessionType)
  {
    case 1:
      CFStringRef v6 = @"ACKNOWLEDGEMENT_CAPTURE_ALERT_TITLE";
      goto LABEL_7;
    case 2:
      CFStringRef v6 = @"ACKNOWLEDGEMENT_ALERT_TITLE";
      goto LABEL_7;
    case 3:
      CFStringRef v6 = @"ACKNOWLEDGEMENT_BROADCAST_ALERT_TITLE";
      goto LABEL_7;
    case 4:
      CFStringRef v6 = @"ACKNOWLEDGEMENT_CLIPS_ALERT_TITLE";
LABEL_7:
      int v8 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v6];
      unsigned __int8 v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v5);

      break;
    default:
      unsigned __int8 v7 = 0;
      break;
  }

  return v7;
}

- (id)getNotificationBodyTextForSessionType:(int)a3 cameraEnabled:(BOOL)a4 microphoneEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  unsigned int v8 = self->_sessionType - 1;
  if (v8 <= 3)
  {
    BOOL v9 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:off_100085268[v8]];
    if (!v6) {
      goto LABEL_3;
    }
LABEL_7:
    int sessionType = self->_sessionType;
    int v11 = [v9 stringByAppendingString:@" "];
    if (sessionType == 3)
    {
      CFStringRef v12 = @"ACKNOWLEDGEMENT_BROADCAST_ALERT_BODY_CAMERA";
      goto LABEL_10;
    }
LABEL_9:
    CFStringRef v12 = @"ACKNOWLEDGEMENT_ALERT_BODY_CAMERA";
    goto LABEL_10;
  }
  BOOL v9 = 0;
  if (a4) {
    goto LABEL_7;
  }
LABEL_3:
  if (!v5) {
    goto LABEL_11;
  }
  int v10 = self->_sessionType;
  int v11 = [v9 stringByAppendingString:@" "];
  if (v10 != 3) {
    goto LABEL_9;
  }
  CFStringRef v12 = @"ACKNOWLEDGEMENT_BROADCAST_ALERT_BODY_MIC";
LABEL_10:
  long long v14 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v12];
  uint64_t v15 = [v11 stringByAppendingString:v14];

  BOOL v9 = (void *)v15;
LABEL_11:

  return v9;
}

- (BOOL)shouldBypassAlertForTest
{
  v2 = [(RPSession *)self bundleID];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.replayKit.ReplayKitTestRunneriOS"];

  return v3;
}

- (BOOL)showStopSystemSessionAlert
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v3 = (objc_class *)objc_opt_class();
    BOOL v4 = NSStringFromClass(v3);
    *(_DWORD *)CGAffineTransform buf = 136446978;
    CFStringRef v23 = "-[RPSession showStopSystemSessionAlert]";
    __int16 v24 = 1024;
    int v25 = 1312;
    __int16 v26 = 2112;
    v27 = v4;
    __int16 v28 = 2048;
    BOOL v29 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", buf, 0x26u);
  }
  if (self->_sessionState == 1)
  {
    [(RPSession *)self pauseSession];
    if (self->_sessionType == 6)
    {
      BOOL v5 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_STATUSBAR_TAPPED_ALERT_TITLE"];
      BOOL v6 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_STATUSBAR_TAPPED_ALERT_BODY"];
      unsigned __int8 v7 = [(RPStatusBarAssertion *)self->_statusBarAssertion broadcastServiceName];
      unsigned int v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7);

      BOOL v9 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_STATUSBAR_TAPPED_ALERT_DECLINE_BUTTON"];
      int v10 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_STATUSBAR_TAPPED_ALERT_ACCEPT_BUTTON"];
    }
    else
    {
      BOOL v5 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"RECORDING_STATUSBAR_TAPPED_ALERT_TITLE"];
      unsigned int v8 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"RECORDING_STATUSBAR_TAPPED_ALERT_BODY"];
      BOOL v9 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"RECORDING_STATUSBAR_TAPPED_ALERT_DECLINE_BUTTON"];
      int v10 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"RECORDING_STATUSBAR_TAPPED_ALERT_ACCEPT_BUTTON"];
    }
    v20[0] = kCFUserNotificationAlertHeaderKey;
    v20[1] = kCFUserNotificationAlertMessageKey;
    v21[0] = v5;
    v21[1] = v8;
    v20[2] = kCFUserNotificationOtherButtonTitleKey;
    v20[3] = kCFUserNotificationDefaultButtonTitleKey;
    v21[2] = v10;
    v21[3] = v9;
    long long v14 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4]);
    self->_userNotificationStopRecording = v14;
    if (v14)
    {
      CFOptionFlags responseFlags = 0;
      CFUserNotificationReceiveResponse(v14, 0.0, &responseFlags);
      if (responseFlags != 2)
      {
        if (!responseFlags)
        {
          if (dword_100099BB8 <= 1
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)CGAffineTransform buf = 136446466;
            CFStringRef v23 = "-[RPSession showStopSystemSessionAlert]";
            __int16 v24 = 1024;
            int v25 = 1346;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d user stop recording or broadcast", buf, 0x12u);
          }
          [(RPSession *)self handleSystemAlertStop];
        }
        goto LABEL_30;
      }
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CGAffineTransform buf = 136446466;
        CFStringRef v23 = "-[RPSession showStopSystemSessionAlert]";
        __int16 v24 = 1024;
        int v25 = 1350;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d user canceled stop of recording or broadcast", buf, 0x12u);
      }
      int sessionType = self->_sessionType;
      if (sessionType == 6)
      {
        clientProxy = self->_clientProxy;
        CFStringRef v17 = @"RPSystemBroadcast";
      }
      else
      {
        if (sessionType != 5)
        {
LABEL_30:
          CFRelease(self->_userNotificationStopRecording);
          self->_userNotificationStopRecording = 0;
          goto LABEL_31;
        }
        clientProxy = self->_clientProxy;
        CFStringRef v17 = @"RPSystemRecording";
      }
      [(RPClientProtocol *)clientProxy shouldResumeSessionType:v17];
      goto LABEL_30;
    }
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100050254();
    }
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = (objc_class *)objc_opt_class();
      CFStringRef v12 = NSStringFromClass(v11);
      int sessionState = self->_sessionState;
      *(_DWORD *)CGAffineTransform buf = 136447234;
      CFStringRef v23 = "-[RPSession showStopSystemSessionAlert]";
      __int16 v24 = 1024;
      int v25 = 1316;
      __int16 v26 = 2112;
      v27 = v12;
      __int16 v28 = 2048;
      BOOL v29 = self;
      __int16 v30 = 1024;
      int v31 = sessionState;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p ignore stop session in state %d", buf, 0x2Cu);
    }
    int v10 = 0;
    BOOL v9 = 0;
    unsigned int v8 = 0;
    BOOL v5 = 0;
  }
LABEL_31:

  return 0;
}

- (id)serviceNameForReporting
{
  unsigned int v2 = self->_sessionType - 1;
  if (v2 > 5) {
    return 0;
  }
  else {
    return off_100085288[v2];
  }
}

- (void)sessionReportCameraUsage:(int64_t)a3
{
  if (a3 == 1)
  {
    BOOL v4 = [(RPSession *)self reportingAgent];
    unsigned __int8 v5 = [v4 backCameraUsed];
  }
  else
  {
    if (a3 != 2) {
      return;
    }
    BOOL v4 = [(RPSession *)self reportingAgent];
    unsigned __int8 v5 = [v4 frontCameraUsed];
  }
  unsigned __int8 v6 = v5;

  if ((v6 & 1) == 0)
  {
    id v7 = [(RPSession *)self reportingAgent];
    [v7 setFrontCameraUsed:1];
  }
}

- (BOOL)showAlertRecordingCaptureSessionWithError:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RPSession *)self shouldBypassAlertForTest];
  if (!v5)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      *(_DWORD *)CGAffineTransform buf = 136446978;
      CFStringRef v21 = "-[RPSession showAlertRecordingCaptureSessionWithError:]";
      __int16 v22 = 1024;
      int v23 = 1419;
      __int16 v24 = 2112;
      int v25 = v7;
      __int16 v26 = 2048;
      v27 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", buf, 0x26u);
    }
    unsigned int v8 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"RECORDING_FAILED_ALERT_MESSAGE_FORMAT"];
    BOOL v9 = [v4 localizedDescription];
    int v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9);

    int v11 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"RECORDING_STATUSBAR_TAPPED_ALERT_TITLE"];
    id v12 = v10;
    BOOL v13 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_FAILED_ALERT_OK_BUTTON"];
    v18[0] = kCFUserNotificationAlertHeaderKey;
    v18[1] = kCFUserNotificationAlertMessageKey;
    v19[0] = v11;
    v19[1] = v12;
    v18[2] = kCFUserNotificationDefaultButtonTitleKey;
    v19[2] = v13;
    long long v14 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3]);
    if (v14)
    {
      uint64_t v15 = v14;
      CFOptionFlags responseFlags = 0;
      CFUserNotificationReceiveResponse(v14, 0.0, &responseFlags);
      if (!responseFlags
        && dword_100099BB8 <= 1
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CGAffineTransform buf = 136446466;
        CFStringRef v21 = "-[RPSession showAlertRecordingCaptureSessionWithError:]";
        __int16 v22 = 1024;
        int v23 = 1448;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d user has hit okay, alert will be dismissed", buf, 0x12u);
      }
      CFRelease(v15);
    }
    else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000502D4();
    }
  }
  return v5;
}

- (void)checkAndPlaySystemSessionSoundForRecordingOn:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[RPHardwareUtility supportsShutterSound]
    || +[RPHardwareUtility isVoiceOverRunning])
  {
    if (v3) {
      SystemSoundID v4 = 1117;
    }
    else {
      SystemSoundID v4 = 1118;
    }
    AudioServicesPlaySystemSound(v4);
  }
}

+ (unint64_t)getFileSizeForURL:(id)a3
{
  id v3 = a3;
  id v9 = 0;
  id v8 = 0;
  [v3 getResourceValue:&v9 forKey:NSURLFileSizeKey error:&v8];
  id v4 = v9;
  id v5 = v8;
  if (v4)
  {
    id v6 = [v4 unsignedIntegerValue];
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CGAffineTransform buf = 136446978;
      int v11 = "+[RPSession getFileSizeForURL:]";
      __int16 v12 = 1024;
      int v13 = 1488;
      __int16 v14 = 2048;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d recordedFileSize for URL %lu bytes URL: %@", buf, 0x26u);
    }
  }
  else
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100050354(v5);
    }
    id v6 = 0;
  }

  return (unint64_t)v6;
}

- (void)timerDidUpdate:(id)a3
{
}

- (BOOL)statusBarCoordinator:(id)a3 receivedTapWithContext:(id)a4 completionBlock:(id)a5
{
  id v6 = (void (**)(void))a5;
  [(RPSession *)self showStopSystemSessionAlert];
  v6[2](v6);

  return 1;
}

- (void)frontmostApplicationDidChange:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    int v7 = 136446978;
    id v8 = "-[RPSession frontmostApplicationDidChange:]";
    __int16 v9 = 1024;
    int v10 = 1532;
    __int16 v11 = 2112;
    __int16 v12 = v6;
    __int16 v13 = 2048;
    __int16 v14 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v7, 0x26u);
  }
  [(RPSession *)self handleFrontmostApplicationDidChange:v4];
}

- (void)clientApplicationDidEnterBackground
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    int v5 = 136446978;
    id v6 = "-[RPSession clientApplicationDidEnterBackground]";
    __int16 v7 = 1024;
    int v8 = 1538;
    __int16 v9 = 2112;
    int v10 = v4;
    __int16 v11 = 2048;
    __int16 v12 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v5, 0x26u);
  }
  [(RPSession *)self handleClientApplicationDidEnterBackground];
  [(RPSession *)self startAcknowledgementAlertTimer];
}

- (void)clientApplicationDidEnterForeground
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    int v5 = 136446978;
    id v6 = "-[RPSession clientApplicationDidEnterForeground]";
    __int16 v7 = 1024;
    int v8 = 1545;
    __int16 v9 = 2112;
    int v10 = v4;
    __int16 v11 = 2048;
    __int16 v12 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v5, 0x26u);
  }
  [(RPSession *)self handleClientApplicationDidEnterForeground];
}

- (void)setupDispatchLimits
{
  self->_dispatchVideoCount = 0;
  self->_dispatchAudioCount = 0;
}

- (BOOL)dispatchLimitReached:(int64_t)a3
{
  int v3 = a3;
  uint64_t v5 = 264;
  if (a3 == 1) {
    uint64_t v5 = 200;
  }
  id v6 = (pthread_mutex_t *)((char *)self + v5);
  if (a3 == 1) {
    uint64_t v7 = 184;
  }
  else {
    uint64_t v7 = 192;
  }
  pthread_mutex_lock(v6);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + v7);
  if (v8 <= 4) {
    *(Class *)((char *)&self->super.isa + v7) = (Class)(v8 + 1);
  }
  pthread_mutex_unlock(v6);
  BOOL v9 = v8 < 5 || dword_100099BB8 > 2;
  if (!v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000503FC(v3);
  }
  return v8 > 4;
}

- (void)dispatchCompleted:(int64_t)a3
{
  uint64_t v4 = 264;
  if (a3 == 1)
  {
    uint64_t v4 = 200;
    uint64_t v5 = 184;
  }
  else
  {
    uint64_t v5 = 192;
  }
  id v6 = (pthread_mutex_t *)((char *)self + v4);
  pthread_mutex_lock((pthread_mutex_t *)((char *)self + v4));
  --*(Class *)((char *)&self->super.isa + v5);

  pthread_mutex_unlock(v6);
}

- (void)sendBiomeEventWithSessionState:(int)a3
{
  if (a3 <= 4 && ((1 << a3) & 0x1A) != 0) {
    [(RPSession *)self sendBiomeEventIsStarting:a3 == 1];
  }
}

- (void)sendBiomeEventIsStarting:(BOOL)a3
{
  BOOL v3 = a3;
  int sessionType = self->_sessionType;
  if (sessionType == 6 || sessionType == 3)
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = (objc_class *)BMScreenSharingEvent;
  }
  else
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = (objc_class *)BMScreenRecordingEvent;
  }
  id v9 = [[v8 alloc] initWithIsStart:v3];
  int v10 = [v7 source];
  [v10 sendEvent:v9];

  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = self->_sessionType;
    CFStringRef v12 = @"stop";
    __int16 v14 = "-[RPSession sendBiomeEventIsStarting:]";
    int v13 = 136446978;
    __int16 v15 = 1024;
    if (v3) {
      CFStringRef v12 = @"start";
    }
    int v16 = 1668;
    __int16 v17 = 1024;
    int v18 = v11;
    __int16 v19 = 2112;
    CFStringRef v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Sending Biome event for sessionType:%d %@", (uint8_t *)&v13, 0x22u);
  }
}

- (BOOL)deviceLocked
{
  return self->_deviceLocked;
}

- (void)setDeviceLocked:(BOOL)a3
{
  self->_deviceLocked = a3;
}

- (BOOL)microphoneEnabled
{
  return self->_microphoneEnabled;
}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  self->_BOOL microphoneEnabled = a3;
}

- (BOOL)cameraEnabled
{
  return self->_cameraEnabled;
}

- (void)setCameraEnabled:(BOOL)a3
{
  self->_cameraEnabled = a3;
}

- (int)sessionState
{
  return self->_sessionState;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)contextID
{
  return self->_contextID;
}

- (void)setContextID:(id)a3
{
}

- (CGSize)windowSize
{
  double width = self->_windowSize.width;
  double height = self->_windowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setWindowSize:(CGSize)a3
{
  self->_windowSize = a3;
}

- (RPReportingAgent)reportingAgent
{
  return self->_reportingAgent;
}

- (void)setReportingAgent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingAgent, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_lastExemptTime, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_clientProxy, 0);
}

@end