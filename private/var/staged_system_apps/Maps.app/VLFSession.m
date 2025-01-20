@interface VLFSession
+ (ARGeoTrackingStatus)lastGeoTrackingStatus;
+ (CLLocation)lastLocation;
+ (void)setLastGeoTrackingStatus:(id)a3;
+ (void)setLastLocation:(id)a3;
- (ARConfiguration)configuration;
- (ARSession)session;
- (BOOL)hasNotifiedDelegate;
- (BOOL)hasNotifiedFirstFrame;
- (BOOL)isRunning;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (BOOL)shouldObserveFrames;
- (BOOL)shouldUpdateCameraFocusLensPosition;
- (BOOL)wasLastLocalizationSuccessful;
- (CMPocketStateManager)pocketStateManager;
- (GCDTimer)timeoutTimer;
- (UINotificationFeedbackGenerator)notificationGenerator;
- (VLFSession)initWithMode:(int64_t)a3;
- (VLFSessionAnalyticsCapturer)analyticsCapturer;
- (VLFSessionDelegate)delegate;
- (VLFSessionIndoorOutdoorAnalyticsRecorder)indoorOutdoorRecorder;
- (VisualLocalizationTraceRecorder)traceRecorder;
- (double)timeout;
- (int64_t)entryPoint;
- (int64_t)mode;
- (void)_processVLDebugInfo:(id)a3;
- (void)checkForSuccessWithFusionLocation:(id)a3 accuracyLocation:(id)a4;
- (void)dealloc;
- (void)endRecordingIfNecessary;
- (void)locationManager:(id)a3 didUpdateLocation:(id)a4;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4;
- (void)registerFailureWithResult:(int64_t)a3 error:(id)a4 initializationFailureDetails:(id)a5;
- (void)registerSuccessWithVLFLocation:(id)a3;
- (void)sendAnalytics:(id)a3;
- (void)session:(id)a3 didChangeGeoTrackingStatus:(id)a4;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)sessionManager:(id)a3 didGainSessionOwnership:(id)a4;
- (void)sessionManager:(id)a3 didResignSessionOwnership:(id)a4;
- (void)setAnalyticsCapturer:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEntryPoint:(int64_t)a3;
- (void)setIndoorOutdoorRecorder:(id)a3;
- (void)setNotificationGenerator:(id)a3;
- (void)setNotifiedDelegate:(BOOL)a3;
- (void)setNotifiedFirstFrame:(BOOL)a3;
- (void)setPocketStateManager:(id)a3;
- (void)setShouldObserveFrames:(BOOL)a3;
- (void)setShouldUpdateCameraFocusLensPosition:(BOOL)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setTraceRecorder:(id)a3;
- (void)setWasLastLocalizationSuccessful:(BOOL)a3;
- (void)start;
- (void)startLocationUpdates;
- (void)stop;
- (void)stopLocationUpdates;
@end

@implementation VLFSession

+ (ARGeoTrackingStatus)lastGeoTrackingStatus
{
  return (ARGeoTrackingStatus *)objc_getAssociatedObject(a1, off_1015EAAA8);
}

+ (void)setLastGeoTrackingStatus:(id)a3
{
}

+ (CLLocation)lastLocation
{
  return (CLLocation *)objc_getAssociatedObject(a1, off_1015EAAB0);
}

+ (void)setLastLocation:(id)a3
{
}

- (VLFSession)initWithMode:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)VLFSession;
  v4 = [(VLFSession *)&v14 init];
  if (v4)
  {
    v5 = sub_10075599C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
      {
        if (a3 == 1)
        {
          CFStringRef v6 = @"VLFSessionModeNonUI";
        }
        else
        {
          v7 = sub_1005762E4();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v16 = "NSString * _Nonnull NSStringFromVLFSessionMode(VLFSessionMode)";
            __int16 v17 = 2080;
            v18 = "VLFSession.h";
            __int16 v19 = 1024;
            int v20 = 58;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
          }

          if (sub_100BB36BC())
          {
            v8 = sub_1005762E4();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            {
              v9 = +[NSThread callStackSymbols];
              *(_DWORD *)buf = 138412290;
              v16 = v9;
              _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
            }
          }
          CFStringRef v6 = 0;
        }
      }
      else
      {
        CFStringRef v6 = @"VLFSessionModeUI";
      }
      *(_DWORD *)buf = 134349314;
      v16 = (const char *)v4;
      __int16 v17 = 2114;
      v18 = (const char *)v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}p] Configuring with mode: %{public}@", buf, 0x16u);
    }

    v4->_mode = a3;
    if (a3)
    {
      v10 = (UINotificationFeedbackGenerator *)objc_alloc_init((Class)UINotificationFeedbackGenerator);
      notificationGenerator = v4->_notificationGenerator;
      v4->_notificationGenerator = v10;
    }
    v12 = +[NSUserDefaults standardUserDefaults];
    [v12 addObserver:v4 forKeyPath:@"PedestrianARAutoFocusDistanceKey" options:0 context:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = sub_10075599C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    objc_super v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  [(CMPocketStateManager *)self->_pocketStateManager setDelegate:0];
  if (self->_session)
  {
    v5 = sub_1005762E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      objc_super v14 = (VLFSession *)"-[VLFSession dealloc]";
      __int16 v15 = 2080;
      v16 = "VLFSession.m";
      __int16 v17 = 1024;
      int v18 = 107;
      __int16 v19 = 2080;
      int v20 = "_session == nil";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      CFStringRef v6 = sub_1005762E4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        objc_super v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    if (self->_session)
    {
      v8 = sub_10075599C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        objc_super v14 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%{public}p] VLFSession being dealloc'd while still being the active ARSession owner", buf, 0xCu);
      }

      v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        objc_super v14 = (VLFSession *)"-[VLFSession dealloc]";
        __int16 v15 = 2080;
        v16 = "VLFSession.m";
        __int16 v17 = 1024;
        int v18 = 110;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          objc_super v14 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  v4 = +[NSUserDefaults standardUserDefaults];
  [v4 removeObserver:self forKeyPath:@"PedestrianARAutoFocusDistanceKey"];

  v12.receiver = self;
  v12.super_class = (Class)VLFSession;
  [(VLFSession *)&v12 dealloc];
}

- (BOOL)isRunning
{
  return self->_session != 0;
}

- (void)start
{
  v3 = sub_10075599C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v32 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}p] Starting", buf, 0xCu);
  }

  if (GEOConfigGetBOOL())
  {
    v4 = sub_10075599C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v32 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}p] Recording VL trace", buf, 0xCu);
    }

    v5 = objc_alloc_init(VisualLocalizationTraceRecorder);
    [(VLFSession *)self setTraceRecorder:v5];

    CFStringRef v6 = [(VLFSession *)self traceRecorder];
    [v6 start];
  }
  v7 = [(VLFSession *)self analyticsCapturer];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    v9 = objc_alloc_init(VLFSessionAnalyticsCapturer);
    [(VLFSession *)self setAnalyticsCapturer:v9];

    v10 = [(VLFSession *)self analyticsCapturer];
    [v10 sessionStartedWithEntryPoint:self->_entryPoint];
  }
  int BOOL = GEOConfigGetBOOL();
  if (GEOVisualLocalizationCrowdsourcingIsSupported()
    && GEOVisualLocalizationCrowdsourcingIsAllowed())
  {
    int v12 = GEOVisualLocalizationCrowdsourcingIsEnabled() ^ 1;
  }
  else
  {
    int v12 = 1;
  }
  int64_t v13 = [(VLFSession *)self mode];
  int v14 = BOOL ^ 1;
  if (v13) {
    int v14 = 1;
  }
  if (((v14 | v12) & 1) == 0)
  {
    __int16 v15 = objc_alloc_init(VLFSessionIndoorOutdoorAnalyticsRecorder);
    [(VLFSession *)self setIndoorOutdoorRecorder:v15];
  }
  if (GEOConfigGetBOOL()
    && +[CMPocketStateManager isPocketStateAvailable])
  {
    id v16 = objc_alloc_init((Class)CMPocketStateManager);
    [(VLFSession *)self setPocketStateManager:v16];

    __int16 v17 = [(VLFSession *)self pocketStateManager];
    [v17 setDelegate:self];

    objc_initWeak((id *)buf, self);
    int v18 = [(VLFSession *)self pocketStateManager];
    id v19 = &_dispatch_main_q;
    [(VLFSession *)self timeout];
    double v20 = 15.0;
    if (v21 < 15.0)
    {
      [(VLFSession *)self timeout];
      double v20 = v22;
    }
    [(VLFSession *)self timeout];
    double v23 = 15.0;
    if (v24 < 15.0)
    {
      [(VLFSession *)self timeout];
      double v23 = v25;
    }
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10075613C;
    v29[3] = &unk_1012EA3A8;
    objc_copyWeak(&v30, (id *)buf);
    [v18 queryStateOntoQueue:&_dispatch_main_q andMonitorFor:v29 withTimeout:v20 andHandler:v23];

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
  if ([(VLFSession *)self mode])
  {
    v26 = [(VLFSession *)self notificationGenerator];
    [v26 prepare];
  }
  [(VLFSession *)self setNotifiedDelegate:0];
  initializationFailureDetails = self->_initializationFailureDetails;
  self->_initializationFailureDetails = 0;

  v28 = +[MapsARSessionManager sharedManager];
  [v28 requestSessionWithOwner:self];
}

- (void)stop
{
  v3 = sub_10075599C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134349056;
    int v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}p] Stopping", (uint8_t *)&v11, 0xCu);
  }

  v4 = +[MapsARSessionManager sharedManager];
  [v4 resignSessionWithOwner:self];

  v5 = [(VLFSession *)self traceRecorder];

  if (v5)
  {
    CFStringRef v6 = [(VLFSession *)self traceRecorder];
    [v6 finish];

    [(VLFSession *)self setTraceRecorder:0];
    +[VLLocalizer _setDebugInfoRecorder:0];
  }
  v7 = [(VLFSession *)self pocketStateManager];
  [v7 setDelegate:0];

  [(VLFSession *)self setPocketStateManager:0];
  if (![(VLFSession *)self hasNotifiedDelegate])
  {
    BOOL v8 = sub_10075599C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134349056;
      int v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}p] Detected user cancelled", (uint8_t *)&v11, 0xCu);
    }

    self->_lastLocalizationResult = 2;
    [(VLFSession *)self setWasLastLocalizationSuccessful:0];
    [(VLFSession *)self setNotifiedDelegate:1];
    v9 = [(VLFSession *)self delegate];
    v10 = +[NSError errorWithDomain:@"com.apple.Maps.VLFSession" code:2 userInfo:0];
    [v9 VLFSessionLocalizationFailedWithError:v10];
  }
  if ((id)[(VLFSession *)self mode] == (id)1) {
    [(VLFSession *)self sendAnalytics:0];
  }
}

- (void)sendAnalytics:(id)a3
{
  id v6 = a3;
  v4 = [(VLFSession *)self analyticsCapturer];

  if (v4)
  {
    v5 = [(VLFSession *)self analyticsCapturer];
    [v5 sessionEndedWithResult:self->_lastLocalizationResult initializationFailureDetails:self->_initializationFailureDetails arFailureTypes:v6];

    [(VLFSession *)self setAnalyticsCapturer:0];
  }
  [(VLFSession *)self setIndoorOutdoorRecorder:0];
}

- (double)timeout
{
  GEOConfigGetDouble();
  return result;
}

- (ARConfiguration)configuration
{
  p_configuration = &self->_configuration;
  configuration = self->_configuration;
  if (!configuration)
  {
    id v5 = objc_alloc_init((Class)ARGeoTrackingConfiguration);
    [v5 setSupportEnablementOptions:4];
    if ((id)[(VLFSession *)self mode] == (id)1)
    {
      GEOConfigGetDouble();
      [v5 setVisualLocalizationCallInterval:];
      [v5 setUseLidarIfAvailable:GEOConfigGetBOOL()];
      GEOConfigGetDouble();
      double v7 = v6;
      BOOL v8 = sub_10075599C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349312;
        v40 = self;
        __int16 v41 = 2048;
        double v42 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Configuring VLF with framerate: %f", buf, 0x16u);
      }

      v9 = +[NSNumber numberWithDouble:v7];
      v45[0] = v9;
      v10 = +[NSNumber numberWithDouble:v7];
      v45[1] = v10;
      int v11 = +[NSNumber numberWithDouble:v7];
      v45[2] = v11;
      int v12 = +[NSArray arrayWithObjects:v45 count:3];
      int64_t v13 = [v5 videoFormat];
      [v13 setFrameRatesByPowerUsage:v12];
    }
    else
    {
      GEOConfigGetDouble();
      [v5 setVisualLocalizationCallInterval:];
      [v5 setEnvironmentTexturing:0];
      v9 = +[NSUserDefaults standardUserDefaults];
      [v5 setAutoFocusEnabled:[v9 BOOLForKey:@"PedestrianARAutoFocusEnabledKey"]];
    }

    int v14 = sub_10075599C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      [v5 visualLocalizationCallInterval];
      *(_DWORD *)buf = 134349312;
      v40 = self;
      __int16 v41 = 2048;
      double v42 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[%{public}p] Configuring VLF with call interval: %f", buf, 0x16u);
    }

    objc_storeStrong((id *)p_configuration, v5);
    id v16 = +[NSUserDefaults standardUserDefaults];
    unsigned int v17 = [v16 BOOLForKey:@"MapsARSessionRecordingEnabledKey"];

    if (v17)
    {
      int v18 = sub_10075599C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v40 = self;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] ARKit session recording is enabled; trying to create recording configuration",
          buf,
          0xCu);
      }

      int64_t v19 = [(VLFSession *)self mode];
      double v20 = @"pedestrianar";
      if (v19 == 1) {
        double v20 = @"vlf";
      }
      double v21 = self->_configuration;
      double v22 = v20;
      double v23 = +[NSDate now];
      [*(id *)&v23 timeIntervalSince1970];
      id v25 = +[NSString stringWithFormat:@"%@.%.0f.mov", v22, v24 * 1000.0];

      v26 = [(ARConfiguration *)v21 recordingConfigurationWithFileName:v25];
      v27 = self->_configuration;
      self->_configuration = v26;
    }
    else
    {
      if (!_GEOConfigHasValue())
      {
LABEL_24:

        configuration = *p_configuration;
        goto LABEL_25;
      }
      GEOConfigGetString();
      double v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v28 = +[NSUserDefaults standardUserDefaults];
      id v29 = [v28 integerForKey:@"MapsARSessionPlaybackModeKey"];

      id v30 = sub_10075599C();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        NSStringFromARReplayMode();
        double v31 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 134349570;
        v40 = self;
        __int16 v41 = 2112;
        double v42 = v31;
        __int16 v43 = 2112;
        double v44 = v23;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[%{public}p] Replaying ARSession recording with mode: %@, file: %@", buf, 0x20u);
      }
      id v32 = objc_alloc((Class)ARReplayConfiguration);
      v33 = *p_configuration;
      v34 = +[NSURL fileURLWithPath:*(void *)&v23];
      id v38 = 0;
      v27 = (ARConfiguration *)[v32 initWithBaseConfiguration:v33 fileURL:v34 replayMode:v29 outError:&v38];
      id v25 = v38;

      if (v27)
      {
        v35 = v27;
        v36 = *p_configuration;
        *p_configuration = v35;
      }
      else
      {
        v36 = sub_10075599C();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349570;
          v40 = self;
          __int16 v41 = 2112;
          double v42 = v23;
          __int16 v43 = 2112;
          double v44 = *(double *)&v25;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "[%{public}p] Error configuring replay configuration for file path %@: %@", buf, 0x20u);
        }
      }
    }
    goto LABEL_24;
  }
LABEL_25:

  return configuration;
}

- (void)endRecordingIfNecessary
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = self->_configuration;
    v4 = [(ARConfiguration *)v3 fileURL];
    objc_initWeak(&location, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100756B80;
    v6[3] = &unk_1012EB690;
    objc_copyWeak(&v8, &location);
    id v5 = v4;
    id v7 = v5;
    [(ARConfiguration *)v3 finishRecordingWithHandler:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)startLocationUpdates
{
  v3 = +[VLFLocationManager sharedLocationManager];
  [v3 addObserver:self];

  id v4 = +[MKLocationManager sharedLocationManager];
  [v4 listenForLocationUpdates:self];
}

- (void)stopLocationUpdates
{
  v3 = +[VLFLocationManager sharedLocationManager];
  [v3 removeObserver:self];

  id v4 = +[MKLocationManager sharedLocationManager];
  [v4 stopListeningForLocationUpdates:self];
}

- (void)checkForSuccessWithFusionLocation:(id)a3 accuracyLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    BOOL v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      v49 = sub_1005762E4();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        int v52 = 136316418;
        v53 = (VLFSession *)"-[VLFSession checkForSuccessWithFusionLocation:accuracyLocation:]";
        __int16 v54 = 2080;
        v55 = "VLFSession.m";
        __int16 v56 = 1024;
        *(_DWORD *)v57 = 290;
        *(_WORD *)&v57[4] = 2080;
        *(void *)&v57[6] = "dispatch_get_main_queue()";
        *(_WORD *)&v57[14] = 2080;
        *(void *)&v57[16] = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v58 = 2080;
        v59 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v52,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v50 = sub_1005762E4();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          v51 = +[NSThread callStackSymbols];
          int v52 = 138412290;
          v53 = v51;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v52, 0xCu);
        }
      }
    }
  }
  if ((id)[(VLFSession *)self mode] != (id)1)
  {
    unsigned int v17 = sub_1005762E4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v52 = 136315650;
      v53 = (VLFSession *)"-[VLFSession checkForSuccessWithFusionLocation:accuracyLocation:]";
      __int16 v54 = 2080;
      v55 = "VLFSession.m";
      __int16 v56 = 1024;
      *(_DWORD *)v57 = 293;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v52, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      int v18 = sub_1005762E4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int64_t v19 = +[NSThread callStackSymbols];
        int v52 = 138412290;
        v53 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v52, 0xCu);
      }
    }
    int64_t v13 = sub_10075599C();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    int v52 = 134349314;
    v53 = self;
    __int16 v54 = 2112;
    v55 = @"VLFSessionModeNonUI";
    int v14 = "[%{public}p] Mode must be %@ to check location based success criteria";
    double v15 = v13;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    uint32_t v20 = 22;
    goto LABEL_27;
  }
  if (!v6)
  {
    int64_t v13 = sub_10075599C();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_28;
    }
    int v52 = 134349056;
    v53 = self;
    int v14 = "[%{public}p] fusionLocation was nil; ignoring";
LABEL_25:
    double v15 = v13;
    os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
    goto LABEL_26;
  }
  if (!v7)
  {
    int64_t v13 = sub_10075599C();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_28;
    }
    int v52 = 134349056;
    v53 = self;
    int v14 = "[%{public}p] accuracyLocation was nil; ignoring";
    goto LABEL_25;
  }
  [(id)objc_opt_class() setLastLocation:v6];
  int v11 = +[NSUserDefaults standardUserDefaults];
  unsigned int v12 = [v11 BOOLForKey:@"VLFSessionKeepARSessionRunningForeverKey"];

  if (v12)
  {
    int64_t v13 = sub_10075599C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v52 = 134349056;
      v53 = self;
      int v14 = "[%{public}p] Debug switch to keep the session running forever is set; ignoring location update";
      double v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_INFO;
LABEL_26:
      uint32_t v20 = 12;
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, (uint8_t *)&v52, v20);
    }
LABEL_28:

    goto LABEL_29;
  }
  uint64_t UInteger = GEOConfigGetUInteger();
  double v22 = sub_10075599C();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v52 = 134349312;
    v53 = self;
    __int16 v54 = 2048;
    v55 = (const char *)UInteger;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[%{public}p] Checking success criteria for mode: %lu", (uint8_t *)&v52, 0x16u);
  }

  unsigned int v23 = [v6 isCoordinateFused];
  double v24 = [(VLFSession *)self session];
  id v25 = [v24 configuration];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (!v23) {
      goto LABEL_42;
    }
LABEL_38:
    id v30 = sub_10075599C();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      int v52 = 134349056;
      v53 = self;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[%{public}p] Location is fused", (uint8_t *)&v52, 0xCu);
    }

    BOOL v31 = UInteger != 1;
    int v32 = 1;
    goto LABEL_46;
  }
  v27 = +[NSUserDefaults standardUserDefaults];
  unsigned int v28 = [v27 BOOLForKey:@"VLFSessionIgnoreFusedLocationForReplayKey"];

  if (v28)
  {
    id v29 = sub_10075599C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      int v52 = 134349056;
      v53 = self;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[%{public}p] Replaying from a recording; pretending as though the location is fused",
        (uint8_t *)&v52,
        0xCu);
    }

    goto LABEL_38;
  }
  v33 = [(id)objc_opt_class() lastGeoTrackingStatus];
  id v34 = [v33 state];

  if (v34 == (id)3) {
    goto LABEL_38;
  }
LABEL_42:
  v35 = sub_10075599C();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    int v52 = 134349056;
    v53 = self;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "[%{public}p] Location is not fused", (uint8_t *)&v52, 0xCu);
  }

  if (UInteger == 1) {
    goto LABEL_29;
  }
  int v32 = 0;
  BOOL v31 = 1;
LABEL_46:
  [v7 horizontalAccuracy];
  double v37 = v36;
  GEOConfigGetDouble();
  double v39 = v38;
  v40 = sub_10075599C();
  BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_INFO);
  if (v37 > v39)
  {
    if (!v41) {
      goto LABEL_52;
    }
    int v52 = 134349569;
    v53 = self;
    __int16 v54 = 2049;
    v55 = *(const char **)&v37;
    __int16 v56 = 2049;
    *(double *)v57 = v39;
    double v42 = "[%{public}p] Horizontal accuracy (%{private}f) is above the minimum threshold: (%{private}f)";
  }
  else
  {
    if (!v41) {
      goto LABEL_52;
    }
    int v52 = 134349569;
    v53 = self;
    __int16 v54 = 2049;
    v55 = *(const char **)&v37;
    __int16 v56 = 2049;
    *(double *)v57 = v39;
    double v42 = "[%{public}p] Horizontal accuracy (%{private}f) fell below minimum threshold: (%{private}f)";
  }
  _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, v42, (uint8_t *)&v52, 0x20u);
LABEL_52:

  if (v37 <= v39) {
    char v43 = 1;
  }
  else {
    char v43 = v32;
  }
  if (UInteger || (v43 & 1) == 0)
  {
    int v44 = v32 ^ 1;
    if (v37 > v39) {
      int v44 = 1;
    }
    if ((v31 | v44))
    {
      int64_t v13 = sub_10075599C();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_28;
      }
      int v52 = 134349056;
      v53 = self;
      int v14 = "[%{public}p] Not localized yet";
      goto LABEL_25;
    }
  }
  v45 = sub_10075599C();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v46 = [(VLFSession *)self session];
    v47 = [v46 currentFrame];
    v48 = [v47 location];
    int v52 = 134349827;
    v53 = self;
    __int16 v54 = 2113;
    v55 = (const char *)v6;
    __int16 v56 = 2113;
    *(void *)v57 = v7;
    *(_WORD *)&v57[8] = 2113;
    *(void *)&v57[10] = v48;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "[%{public}p] Localization succeeded with CL fusion location: (%{private}@), accuracy location: (%{private}@), ARKit location: (%{private}@)", (uint8_t *)&v52, 0x2Au);
  }
  [(VLFSession *)self stopLocationUpdates];
  [(VLFSession *)self registerSuccessWithVLFLocation:v6];
LABEL_29:
}

- (void)registerSuccessWithVLFLocation:(id)a3
{
  id v4 = (char *)a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      int64_t v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136316418;
        unsigned int v17 = (VLFSession *)"-[VLFSession registerSuccessWithVLFLocation:]";
        __int16 v18 = 2080;
        int64_t v19 = "VLFSession.m";
        __int16 v20 = 1024;
        int v21 = 363;
        __int16 v22 = 2080;
        unsigned int v23 = "dispatch_get_main_queue()";
        __int16 v24 = 2080;
        id v25 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v26 = 2080;
        v27 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v16,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        int v14 = sub_1005762E4();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          double v15 = +[NSThread callStackSymbols];
          int v16 = 138412290;
          unsigned int v17 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
        }
      }
    }
  }
  if (![(VLFSession *)self hasNotifiedDelegate])
  {
    id v8 = sub_10075599C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v16 = 134349314;
      unsigned int v17 = self;
      __int16 v18 = 2112;
      int64_t v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Registering success with vlf location: %@", (uint8_t *)&v16, 0x16u);
    }

    v9 = [(VLFSession *)self session];
    BOOL v10 = [v9 technique];
    [v10 setVlfLocation:v4];

    [(VLFSession *)self setWasLastLocalizationSuccessful:1];
    self->_lastLocalizationResult = 4;
    [(VLFSession *)self setNotifiedDelegate:1];
    int v11 = [(VLFSession *)self delegate];
    [v11 VLFSessionLocalizationSucceeded];

    [(VLFSession *)self stop];
    if ([(VLFSession *)self mode])
    {
      unsigned int v12 = [(VLFSession *)self notificationGenerator];
      [v12 notificationOccurred:0];
    }
  }
}

- (void)registerFailureWithResult:(int64_t)a3 error:(id)a4 initializationFailureDetails:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  int v11 = dispatch_queue_get_label(0);
  if (label != v11)
  {
    BOOL v12 = !label || v11 == 0;
    if (v12 || strcmp(label, v11))
    {
      unsigned int v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136316418;
        int v21 = (VLFSession *)"-[VLFSession registerFailureWithResult:error:initializationFailureDetails:]";
        __int16 v22 = 2080;
        unsigned int v23 = "VLFSession.m";
        __int16 v24 = 1024;
        *(_DWORD *)id v25 = 385;
        *(_WORD *)&v25[4] = 2080;
        *(void *)&v25[6] = "dispatch_get_main_queue()";
        __int16 v26 = 2080;
        v27 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v28 = 2080;
        id v29 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v20,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        __int16 v18 = sub_1005762E4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          int64_t v19 = +[NSThread callStackSymbols];
          int v20 = 138412290;
          int v21 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);
        }
      }
    }
  }
  int64_t v13 = [(VLFSession *)self session];
  [v13 _removeObserver:self];

  if (![(VLFSession *)self hasNotifiedDelegate])
  {
    int v14 = sub_10075599C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v20 = 134349570;
      int v21 = self;
      __int16 v22 = 2048;
      unsigned int v23 = (const char *)a3;
      __int16 v24 = 2112;
      *(void *)id v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}p] Registering failure with result: %ld, error: %@", (uint8_t *)&v20, 0x20u);
    }

    [(VLFSession *)self setWasLastLocalizationSuccessful:0];
    self->_lastLocalizationResult = a3;
    objc_storeStrong((id *)&self->_initializationFailureDetails, a5);
    [(VLFSession *)self setNotifiedDelegate:1];
    double v15 = [(VLFSession *)self delegate];
    [v15 VLFSessionLocalizationFailedWithError:v8];

    [(VLFSession *)self stop];
    if ([(VLFSession *)self mode])
    {
      int v16 = [(VLFSession *)self notificationGenerator];
      [v16 notificationOccurred:2];
    }
  }
}

- (void)_processVLDebugInfo:(id)a3
{
  id v5 = (VLLocalizationDebugInfo *)a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  BOOL v7 = dispatch_queue_get_label(0);
  if (label != v7)
  {
    BOOL v8 = !label || v7 == 0;
    if (v8 || strcmp(label, v7))
    {
      BOOL v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316418;
        int v16 = "-[VLFSession _processVLDebugInfo:]";
        __int16 v17 = 2080;
        __int16 v18 = "VLFSession.m";
        __int16 v19 = 1024;
        int v20 = 409;
        __int16 v21 = 2080;
        __int16 v22 = "dispatch_get_main_queue()";
        __int16 v23 = 2080;
        __int16 v24 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v25 = 2080;
        __int16 v26 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v15,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        int64_t v13 = sub_1005762E4();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          int v14 = +[NSThread callStackSymbols];
          int v15 = 138412290;
          int v16 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);
        }
      }
    }
  }
  if (v5)
  {
    lastDebugInfo = self->_lastDebugInfo;
    if (lastDebugInfo != v5
      && ([(VLLocalizationDebugInfo *)lastDebugInfo isEqual:v5] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lastDebugInfo, a3);
      BOOL v10 = [(VLFSession *)self traceRecorder];
      [v10 recordAttempt:self->_lastDebugInfo];

      int v11 = [(VLFSession *)self analyticsCapturer];
      [v11 recordAttempt:self->_lastDebugInfo];
    }
  }
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v6 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  BOOL v8 = dispatch_queue_get_label(0);
  if (label == v8 || (label ? (BOOL v9 = v8 == 0) : (BOOL v9 = 1), !v9 && !strcmp(label, v8)))
  {
    BOOL v10 = sub_1005762E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136316162;
      *(void *)&location[4] = "-[VLFSession session:didChangeState:]";
      __int16 v16 = 2080;
      __int16 v17 = "VLFSession.m";
      __int16 v18 = 1024;
      int v19 = 421;
      __int16 v20 = 2080;
      __int16 v21 = "dispatch_get_main_queue()";
      __int16 v22 = 2080;
      __int16 v23 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion not on queue failed: %s/%s", location, 0x30u);
    }
    if (sub_100BB36BC())
    {
      int v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        BOOL v12 = +[NSThread callStackSymbols];
        *(_DWORD *)id location = 138412290;
        *(void *)&location[4] = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);
      }
    }
  }
  objc_initWeak((id *)location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10075809C;
  v13[3] = &unk_1012F0708;
  objc_copyWeak(v14, (id *)location);
  v14[1] = (id)a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)location);
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  BOOL v9 = dispatch_queue_get_label(0);
  if (label == v9 || (label ? (BOOL v10 = v9 == 0) : (BOOL v10 = 1), !v10 && !strcmp(label, v9)))
  {
    __int16 v17 = sub_1005762E4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136316162;
      *(void *)&location[4] = "-[VLFSession session:didUpdateFrame:]";
      __int16 v25 = 2080;
      __int16 v26 = "VLFSession.m";
      __int16 v27 = 1024;
      int v28 = 449;
      __int16 v29 = 2080;
      id v30 = "dispatch_get_main_queue()";
      __int16 v31 = 2080;
      int v32 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion not on queue failed: %s/%s", location, 0x30u);
    }
    if (sub_100BB36BC())
    {
      __int16 v18 = sub_1005762E4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = +[NSThread callStackSymbols];
        *(_DWORD *)id location = 138412290;
        *(void *)&location[4] = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);
      }
    }
  }
  int v11 = [v7 vlDebugInfo];
  BOOL v12 = [v7 geoTrackingStatus];
  int64_t v13 = v12;
  if (v12 && [v12 state] == (id)2)
  {
    int v14 = [(VLFSession *)self indoorOutdoorRecorder];
    [v14 recordFrame:v7];
  }
  objc_initWeak((id *)location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007583FC;
  block[3] = &unk_1012E9340;
  objc_copyWeak(&v23, (id *)location);
  id v21 = v13;
  id v22 = v11;
  id v15 = v11;
  id v16 = v13;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)location);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  BOOL v9 = dispatch_queue_get_label(0);
  if (label == v9 || (label ? (BOOL v10 = v9 == 0) : (BOOL v10 = 1), !v10 && !strcmp(label, v9)))
  {
    __int16 v17 = sub_1005762E4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136316162;
      *(void *)&location[4] = "-[VLFSession session:didFailWithError:]";
      __int16 v25 = 2080;
      __int16 v26 = "VLFSession.m";
      __int16 v27 = 1024;
      int v28 = 487;
      __int16 v29 = 2080;
      id v30 = "dispatch_get_main_queue()";
      __int16 v31 = 2080;
      int v32 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion not on queue failed: %s/%s", location, 0x30u);
    }
    if (sub_100BB36BC())
    {
      __int16 v18 = sub_1005762E4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = +[NSThread callStackSymbols];
        *(_DWORD *)id location = 138412290;
        *(void *)&location[4] = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);
      }
    }
  }
  id v11 = objc_alloc_init((Class)GEOVLFInitializationFailureDetails);
  [v11 setArkitErrorCode:[v7 code]];
  BOOL v12 = [v7 underlyingErrors];
  int64_t v13 = [v12 firstObject];

  if (v13)
  {
    int v14 = [v13 domain];
    [v11 setArkitUnderlyingErrorDomain:v14];

    [v11 setArkitUnderlyingErrorCode:[v13 code]];
  }
  objc_initWeak((id *)location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007588A8;
  block[3] = &unk_1012E9340;
  objc_copyWeak(&v23, (id *)location);
  id v21 = v7;
  id v22 = v11;
  id v15 = v11;
  id v16 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)location);
}

- (void)session:(id)a3 didChangeGeoTrackingStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  BOOL v9 = dispatch_queue_get_label(0);
  if (label == v9 || (label ? (BOOL v10 = v9 == 0) : (BOOL v10 = 1), !v10 && !strcmp(label, v9)))
  {
    id v15 = sub_1005762E4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136316162;
      *(void *)&location[4] = "-[VLFSession session:didChangeGeoTrackingStatus:]";
      __int16 v23 = 2080;
      __int16 v24 = "VLFSession.m";
      __int16 v25 = 1024;
      int v26 = 506;
      __int16 v27 = 2080;
      int v28 = "dispatch_get_main_queue()";
      __int16 v29 = 2080;
      id v30 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion not on queue failed: %s/%s", location, 0x30u);
    }
    if (sub_100BB36BC())
    {
      id v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __int16 v17 = +[NSThread callStackSymbols];
        *(_DWORD *)id location = 138412290;
        *(void *)&location[4] = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);
      }
    }
  }
  [(id)objc_opt_class() setLastGeoTrackingStatus:v7];
  id v11 = [v6 currentFrame];
  BOOL v12 = [v11 vlDebugInfo];

  objc_initWeak((id *)location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100758BB4;
  block[3] = &unk_1012E9340;
  objc_copyWeak(&v21, (id *)location);
  id v19 = v7;
  id v20 = v12;
  id v13 = v12;
  id v14 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)location);
}

- (void)sessionManager:(id)a3 didGainSessionOwnership:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = sub_10075599C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349314;
    __int16 v25 = self;
    __int16 v26 = 2080;
    __int16 v27 = "-[VLFSession sessionManager:didGainSessionOwnership:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] %s", buf, 0x16u);
  }

  objc_storeStrong((id *)&self->_session, a4);
  [(VLFSession *)self setShouldObserveFrames:0];
  [(VLFSession *)self setNotifiedFirstFrame:0];
  [(ARSession *)self->_session _addObserver:self];
  BOOL v9 = [(VLFSession *)self configuration];
  -[VLFSession setShouldUpdateCameraFocusLensPosition:](self, "setShouldUpdateCameraFocusLensPosition:", [v9 isAutoFocusEnabled] ^ 1);
  [(ARSession *)self->_session runWithConfiguration:v9 options:3];
  if ([(ARSession *)self->_session state] == (id)1 && (id)[(VLFSession *)self mode] == (id)1) {
    [(VLFSession *)self startLocationUpdates];
  }
  [(VLFSession *)self timeout];
  double v11 = v10;
  if (v10 <= 0.0
    || (+[NSUserDefaults standardUserDefaults],
        BOOL v12 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v13 = [v12 BOOLForKey:@"VLFSessionKeepARSessionRunningForeverKey"],
        v12,
        (v13 & 1) != 0))
  {
    id v14 = +[NSUserDefaults standardUserDefaults];
    unsigned int v15 = [v14 BOOLForKey:@"VLFSessionKeepARSessionRunningForeverKey"];

    id v16 = sub_10075599C();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        *(_DWORD *)buf = 134349056;
        __int16 v25 = self;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%{public}p] Debug option to keep VLF running forever is enabled; not starting the timeout timer",
          buf,
          0xCu);
      }
    }
    else if (v17)
    {
      *(_DWORD *)buf = 134349312;
      __int16 v25 = self;
      __int16 v26 = 2048;
      __int16 v27 = *(const char **)&v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%{public}p] Timeout was <= 0 (%f); not starting the timeout timer",
        buf,
        0x16u);
    }
  }
  else
  {
    __int16 v18 = sub_10075599C();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349312;
      __int16 v25 = self;
      __int16 v26 = 2048;
      __int16 v27 = *(const char **)&v11;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%{public}p] Starting timeout timer for %f seconds", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    id v19 = &_dispatch_main_q;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1007590DC;
    v22[3] = &unk_1012E7638;
    objc_copyWeak(&v23, (id *)buf);
    id v20 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v22 block:v11];
    [(VLFSession *)self setTimeoutTimer:v20];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  id v21 = +[NSNotificationCenter defaultCenter];
  [v21 postNotificationName:@"VLFSessionDidStartNotification" object:self];
}

- (void)sessionManager:(id)a3 didResignSessionOwnership:(id)a4
{
  id v5 = sub_10075599C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134349314;
    BOOL v12 = self;
    __int16 v13 = 2080;
    id v14 = "-[VLFSession sessionManager:didResignSessionOwnership:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] %s", (uint8_t *)&v11, 0x16u);
  }

  id v6 = [(VLFSession *)self session];
  [v6 _removeObserver:self];

  [(VLFSession *)self setTimeoutTimer:0];
  if ((id)[(VLFSession *)self mode] == (id)1)
  {
    [(VLFSession *)self endRecordingIfNecessary];
  }
  else
  {
    id v7 = sub_10075599C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 134349314;
      BOOL v12 = self;
      __int16 v13 = 2112;
      id v14 = @"VLFSessionModeNonUI";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Will not end recording because we were not started for mode: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  session = self->_session;
  self->_session = 0;

  configuration = self->_configuration;
  self->_configuration = 0;

  [(VLFSession *)self stopLocationUpdates];
  double v10 = +[NSNotificationCenter defaultCenter];
  [v10 postNotificationName:@"VLFSessionDidStopNotification" object:self];
}

- (void)locationManager:(id)a3 didUpdateLocation:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  BOOL v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    BOOL v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      id v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136316418;
        __int16 v18 = (VLFSession *)"-[VLFSession locationManager:didUpdateLocation:]";
        __int16 v19 = 2080;
        id v20 = "VLFSession.m";
        __int16 v21 = 1024;
        int v22 = 607;
        __int16 v23 = 2080;
        __int16 v24 = "dispatch_get_main_queue()";
        __int16 v25 = 2080;
        __int16 v26 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v27 = 2080;
        int v28 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v17,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        unsigned int v15 = sub_1005762E4();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v16 = +[NSThread callStackSymbols];
          int v17 = 138412290;
          __int16 v18 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);
        }
      }
    }
  }
  int v11 = sub_10075599C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 134349315;
    __int16 v18 = self;
    __int16 v19 = 2113;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%{public}p] Got VLF location update: (%{private}@)", (uint8_t *)&v17, 0x16u);
  }

  BOOL v12 = +[MKLocationManager sharedLocationManager];
  __int16 v13 = [v12 lastLocation];
  [(VLFSession *)self checkForSuccessWithFusionLocation:v7 accuracyLocation:v13];
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      __int16 v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136316418;
        int v17 = (VLFSession *)"-[VLFSession locationManagerUpdatedLocation:]";
        __int16 v18 = 2080;
        __int16 v19 = "VLFSession.m";
        __int16 v20 = 1024;
        int v21 = 618;
        __int16 v22 = 2080;
        __int16 v23 = "dispatch_get_main_queue()";
        __int16 v24 = 2080;
        __int16 v25 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v26 = 2080;
        __int16 v27 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v16,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        id v14 = sub_1005762E4();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          unsigned int v15 = +[NSThread callStackSymbols];
          int v16 = 138412290;
          int v17 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
        }
      }
    }
  }
  BOOL v8 = sub_10075599C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    BOOL v9 = [v4 lastLocation];
    int v16 = 134349315;
    int v17 = self;
    __int16 v18 = 2113;
    __int16 v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Got MK location update: (%{private}@)", (uint8_t *)&v16, 0x16u);
  }
  BOOL v10 = +[VLFLocationManager sharedLocationManager];
  int v11 = [v10 lastLocation];
  BOOL v12 = [v4 lastLocation];
  [(VLFSession *)self checkForSuccessWithFusionLocation:v11 accuracyLocation:v12];
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"PedestrianARAutoFocusDistanceKey"]
    && (+[NSUserDefaults standardUserDefaults],
        id v13 = (id)objc_claimAutoreleasedReturnValue(),
        v13,
        v13 == v11))
  {
    if (self->_session && (configuration = self->_configuration) != 0) {
      uint64_t v15 = [(ARConfiguration *)configuration isAutoFocusEnabled] ^ 1;
    }
    else {
      uint64_t v15 = 0;
    }
    [(VLFSession *)self setShouldUpdateCameraFocusLensPosition:v15];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)VLFSession;
    [(VLFSession *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4
{
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100759A6C;
  v6[3] = &unk_1012EB590;
  void v6[4] = self;
  v7[1] = (id)a4;
  objc_copyWeak(v7, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (VLFSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VLFSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(int64_t)a3
{
  self->_entryPoint = a3;
}

- (ARSession)session
{
  return self->_session;
}

- (BOOL)wasLastLocalizationSuccessful
{
  return self->_wasLastLocalizationSuccessful;
}

- (void)setWasLastLocalizationSuccessful:(BOOL)a3
{
  self->_wasLastLocalizationSuccessful = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setConfiguration:(id)a3
{
}

- (GCDTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (BOOL)hasNotifiedDelegate
{
  return self->_notifiedDelegate;
}

- (void)setNotifiedDelegate:(BOOL)a3
{
  self->_notifiedDelegate = a3;
}

- (BOOL)hasNotifiedFirstFrame
{
  return self->_notifiedFirstFrame;
}

- (void)setNotifiedFirstFrame:(BOOL)a3
{
  self->_notifiedFirstFrame = a3;
}

- (BOOL)shouldObserveFrames
{
  return self->_shouldObserveFrames;
}

- (void)setShouldObserveFrames:(BOOL)a3
{
  self->_shouldObserveFrames = a3;
}

- (BOOL)shouldUpdateCameraFocusLensPosition
{
  return self->_shouldUpdateCameraFocusLensPosition;
}

- (void)setShouldUpdateCameraFocusLensPosition:(BOOL)a3
{
  self->_shouldUpdateCameraFocusLensPosition = a3;
}

- (UINotificationFeedbackGenerator)notificationGenerator
{
  return self->_notificationGenerator;
}

- (void)setNotificationGenerator:(id)a3
{
}

- (VisualLocalizationTraceRecorder)traceRecorder
{
  return self->_traceRecorder;
}

- (void)setTraceRecorder:(id)a3
{
}

- (VLFSessionAnalyticsCapturer)analyticsCapturer
{
  return self->_analyticsCapturer;
}

- (void)setAnalyticsCapturer:(id)a3
{
}

- (VLFSessionIndoorOutdoorAnalyticsRecorder)indoorOutdoorRecorder
{
  return self->_indoorOutdoorRecorder;
}

- (void)setIndoorOutdoorRecorder:(id)a3
{
}

- (CMPocketStateManager)pocketStateManager
{
  return self->_pocketStateManager;
}

- (void)setPocketStateManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pocketStateManager, 0);
  objc_storeStrong((id *)&self->_indoorOutdoorRecorder, 0);
  objc_storeStrong((id *)&self->_analyticsCapturer, 0);
  objc_storeStrong((id *)&self->_traceRecorder, 0);
  objc_storeStrong((id *)&self->_notificationGenerator, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_initializationFailureDetails, 0);

  objc_storeStrong((id *)&self->_lastDebugInfo, 0);
}

@end