@interface VIOSessionTask
+ (BOOL)isVIOModeEnabled;
+ (BOOL)isVIOModeEnabledInRoutePlanning;
+ (BOOL)isVIOModeSupported;
+ (BOOL)isVIOModeSupportedInRoutePlanning;
+ (BOOL)isVLFModeEnabled;
+ (int64_t)creationPreference;
- (ARSession)session;
- (BOOL)areMonitorsDisablingVIO;
- (BOOL)isEligibleToStartVIO;
- (BOOL)isEligibleToStartVLF;
- (BOOL)isVIOSessionRunning;
- (BOOL)isVLFSessionRunning;
- (BOOL)shouldStartVIOSession;
- (BOOL)shouldStartVLFSession;
- (NSMutableSet)monitors;
- (NavigationSession)currentNavigationSession;
- (PlatformController)platformController;
- (RoutePlanningSession)currentRoutePlanningSession;
- (VIOSessionAnalyticsCapturer)analyticsCapturer;
- (VIOSessionTask)initWithPlatformController:(id)a3;
- (id)activeMonitors;
- (id)configuration;
- (void)createMonitorsForConfiguration:(id)a3;
- (void)dealloc;
- (void)handleTransportTypeChanged:(int64_t)a3;
- (void)navigationSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseVIOSession;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5;
- (void)sceneDidActivateNotification:(id)a3;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)sessionInterruptionEnded:(id)a3;
- (void)sessionManager:(id)a3 didGainSessionOwnership:(id)a4;
- (void)sessionManager:(id)a3 didResignSessionOwnership:(id)a4;
- (void)sessionWasInterrupted:(id)a3;
- (void)setAnalyticsCapturer:(id)a3;
- (void)setCurrentNavigationSession:(id)a3;
- (void)setCurrentRoutePlanningSession:(id)a3;
- (void)setMonitors:(id)a3;
- (void)setPlatformController:(id)a3;
- (void)startVIOSession;
@end

@implementation VIOSessionTask

- (void)pauseVIOSession
{
  v3 = sub_1000AEBF0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Pausing VIO session", v6, 2u);
  }

  v4 = [(VIOSessionTask *)self session];
  [v4 pause];

  v5 = [(VIOSessionTask *)self monitors];
  [v5 removeAllObjects];
}

- (void)sessionManager:(id)a3 didGainSessionOwnership:(id)a4
{
  id v6 = a4;
  v7 = [(VIOSessionTask *)self session];

  if (v7)
  {
    v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315906;
      v17 = "-[VIOSessionTask sessionManager:didGainSessionOwnership:]";
      __int16 v18 = 2080;
      v19 = "VIOSessionTask.m";
      __int16 v20 = 1024;
      int v21 = 626;
      __int16 v22 = 2080;
      v23 = "self.session == nil";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v16, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = +[NSThread callStackSymbols];
        int v16 = 138412290;
        v17 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  v8 = [(VIOSessionTask *)self session];

  if (!v8)
  {
    objc_storeStrong((id *)&self->_session, a4);
    v9 = [(VIOSessionTask *)self analyticsCapturer];
    [v9 resumeRecording];

    uint64_t v10 = [(VIOSessionTask *)self session];
    [(id)v10 _addObserver:self];

    LOBYTE(v10) = [(VIOSessionTask *)self shouldStartVIOSession];
    unsigned int v11 = [(VIOSessionTask *)self shouldStartVLFSession];
    if ((v10 & 1) != 0 || v11)
    {
      v12 = [(VIOSessionTask *)self analyticsCapturer];
      [v12 startRecording];

      [(VIOSessionTask *)self startVIOSession];
    }
    else
    {
      [(VIOSessionTask *)self pauseVIOSession];
    }
  }
}

- (BOOL)shouldStartVIOSession
{
  v3 = [(VIOSessionTask *)self session];

  if (v3)
  {
    if (![(VIOSessionTask *)self shouldStartVLFSession])
    {
      uint64_t v10 = [(VIOSessionTask *)self platformController];
      unsigned int v11 = [v10 chromeViewController];
      v12 = [v11 _maps_uiScene];
      v13 = (__CFString *)[v12 activationState];

      if ((unint64_t)v13 >= 2)
      {
        v4 = sub_1000AEBF0();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_9;
        }
        int v35 = 134217984;
        v36 = v13;
        v5 = "Our scene's activation state is not foreground (%ld); VIO should not start";
        id v6 = v4;
        uint32_t v7 = 12;
        goto LABEL_8;
      }
      v14 = [(VIOSessionTask *)self currentRoutePlanningSession];

      if (v14)
      {
        v15 = sub_1000AEBF0();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          if ([(id)objc_opt_class() isVIOModeEnabledInRoutePlanning]) {
            int v16 = @"YES";
          }
          else {
            int v16 = @"NO";
          }
          v17 = v16;
          __int16 v18 = [(VIOSessionTask *)self currentRoutePlanningSession];
          if ([v18 currentTransportType] == (id)2) {
            v19 = @"YES";
          }
          else {
            v19 = @"NO";
          }
          __int16 v20 = v19;
          int v35 = 138412546;
          v36 = v17;
          __int16 v37 = 2112;
          v38 = v20;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "shouldStartVIOSession route planning: (isVIOModeEnabledInRoutePlanning:%@) && (transportType==Walk:%@)", (uint8_t *)&v35, 0x16u);
        }
        if ([(id)objc_opt_class() isVIOModeEnabledInRoutePlanning])
        {
          v4 = [(VIOSessionTask *)self currentRoutePlanningSession];
          BOOL v8 = [v4 currentTransportType] == (id)2;
          goto LABEL_10;
        }
      }
      else
      {
        uint64_t v21 = [(VIOSessionTask *)self currentNavigationSession];
        if (!v21
          || (__int16 v22 = (void *)v21,
              [(VIOSessionTask *)self currentNavigationSession],
              v23 = objc_claimAutoreleasedReturnValue(),
              id v24 = [v23 guidanceType],
              v23,
              v22,
              v24 == (id)2))
        {
          v4 = sub_1000AEBF0();
          if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_9;
          }
          LOWORD(v35) = 0;
          v5 = "shouldStartVIOSession not in nav nor route planning: NO";
          goto LABEL_7;
        }
        v25 = sub_1000AEBF0();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          if ([(id)objc_opt_class() isVIOModeEnabled]) {
            v26 = @"YES";
          }
          else {
            v26 = @"NO";
          }
          v27 = v26;
          v28 = [(VIOSessionTask *)self currentNavigationSession];
          if ([v28 currentTransportType] == (id)2) {
            v29 = @"YES";
          }
          else {
            v29 = @"NO";
          }
          v30 = v29;
          v31 = [(VIOSessionTask *)self currentNavigationSession];
          if ([v31 navigationType] == (id)3) {
            v32 = @"YES";
          }
          else {
            v32 = @"NO";
          }
          v33 = v32;
          int v35 = 138412802;
          v36 = v27;
          __int16 v37 = 2112;
          v38 = v30;
          __int16 v39 = 2112;
          v40 = v33;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "shouldStartVIOSession nav: (isVIOModeEnabled:%@) && (transportType==Walk:%@) && (navigationType==TBT:%@)", (uint8_t *)&v35, 0x20u);
        }
        if ([(id)objc_opt_class() isVIOModeEnabled])
        {
          v4 = [(VIOSessionTask *)self currentNavigationSession];
          if ([v4 currentTransportType] == (id)2)
          {
            v34 = [(VIOSessionTask *)self currentNavigationSession];
            BOOL v8 = [v34 navigationType] == (id)3;

            goto LABEL_10;
          }
          goto LABEL_9;
        }
      }
      return 0;
    }
    v4 = sub_1000AEBF0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v35) = 0;
      v5 = "Post-VLF VIO should start instead; VIO should not start";
LABEL_7:
      id v6 = v4;
      uint32_t v7 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, v5, (uint8_t *)&v35, v7);
    }
  }
  else
  {
    v4 = sub_1000AEBF0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v35) = 0;
      v5 = "We don't own the session; VIO should not start";
      goto LABEL_7;
    }
  }
LABEL_9:
  BOOL v8 = 0;
LABEL_10:

  return v8;
}

- (VIOSessionTask)initWithPlatformController:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v19 = sub_1005762E4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v24 = "-[VIOSessionTask initWithPlatformController:]";
      __int16 v25 = 2080;
      v26 = "VIOSessionTask.m";
      __int16 v27 = 1024;
      int v28 = 74;
      __int16 v29 = 2080;
      v30 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      __int16 v20 = sub_1005762E4();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        id v24 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)VIOSessionTask;
  v5 = [(VIOSessionTask *)&v22 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_platformController, v4);
    uint64_t v7 = +[NSMutableSet set];
    monitors = v6->_monitors;
    v6->_monitors = (NSMutableSet *)v7;

    v9 = objc_alloc_init(VIOSessionAnalyticsCapturer);
    analyticsCapturer = v6->_analyticsCapturer;
    v6->_analyticsCapturer = v9;

    unsigned int v11 = +[MKLocationManager sharedLocationManager];
    [v11 setFusionInfoEnabled:1];

    v12 = +[NSUserDefaults standardUserDefaults];
    [v12 addObserver:v6 forKeyPath:@"MapsWalkingEnableImageBasedHeading" options:1 context:0];

    v13 = +[NSNotificationCenter defaultCenter];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_platformController);
    v15 = [WeakRetained chromeViewController];
    int v16 = [v15 _maps_uiScene];
    [v13 addObserver:v6 selector:"sceneDidActivateNotification:" name:UISceneDidActivateNotification object:v16];

    v17 = +[MapsARSessionManager sharedManager];
    [v17 requestSessionWithOwner:v6];
  }
  return v6;
}

- (BOOL)shouldStartVLFSession
{
  v3 = sub_1000AEBF0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    if ([(id)objc_opt_class() isVLFModeEnabled]) {
      id v4 = @"YES";
    }
    else {
      id v4 = @"NO";
    }
    v5 = v4;
    uint64_t v21 = [(VIOSessionTask *)self session];
    if (v21) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    uint64_t v7 = v6;
    BOOL v8 = [(VIOSessionTask *)self session];
    if ([v8 state] == (id)1) {
      v9 = @"YES";
    }
    else {
      v9 = @"NO";
    }
    uint64_t v10 = v9;
    unsigned int v11 = [(VIOSessionTask *)self session];
    v12 = [v11 technique];
    if ([v12 vlfLocalized]) {
      v13 = @"YES";
    }
    else {
      v13 = @"NO";
    }
    v14 = v13;
    *(_DWORD *)buf = 138413058;
    v23 = v5;
    __int16 v24 = 2112;
    __int16 v25 = v7;
    __int16 v26 = 2112;
    __int16 v27 = v10;
    __int16 v28 = 2112;
    __int16 v29 = v14;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "shouldStartVLFSession: (isVLFModeEnabled:%@) && (session!=nil:%@) && (state==running:%@) && (vlfLocalized:%@)", buf, 0x2Au);
  }
  if (![(id)objc_opt_class() isVLFModeEnabled]) {
    return 0;
  }
  v15 = [(VIOSessionTask *)self session];
  if (v15)
  {
    int v16 = [(VIOSessionTask *)self session];
    if ([v16 state] == (id)1)
    {
      v17 = [(VIOSessionTask *)self session];
      __int16 v18 = [v17 technique];
      unsigned __int8 v19 = [v18 vlfLocalized];
    }
    else
    {
      unsigned __int8 v19 = 0;
    }
  }
  else
  {
    unsigned __int8 v19 = 0;
  }

  return v19;
}

- (ARSession)session
{
  return self->_session;
}

+ (BOOL)isVLFModeEnabled
{
  if (!+[VLFSessionTask isVLFModeSupported]
    || !GEOConfigGetBOOL())
  {
    return 0;
  }
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"MapsWalkingEnableImageBasedHeading"];

  return v3;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (NSMutableSet)monitors
{
  return self->_monitors;
}

- (RoutePlanningSession)currentRoutePlanningSession
{
  return self->_currentRoutePlanningSession;
}

- (NavigationSession)currentNavigationSession
{
  return self->_currentNavigationSession;
}

- (VIOSessionAnalyticsCapturer)analyticsCapturer
{
  return self->_analyticsCapturer;
}

- (void)dealloc
{
  unsigned __int8 v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"MapsWalkingEnableImageBasedHeading"];

  id v4 = +[MapsARSessionManager sharedManager];
  [v4 resignSessionWithOwner:self];

  v5.receiver = self;
  v5.super_class = (Class)VIOSessionTask;
  [(VIOSessionTask *)&v5 dealloc];
}

+ (BOOL)isVIOModeSupported
{
  if (qword_1016123E8 != -1) {
    dispatch_once(&qword_1016123E8, &stru_1012F7EA8);
  }
  if (byte_1016123E0) {
    return 0;
  }

  return GEOConfigGetBOOL();
}

+ (BOOL)isVIOModeSupportedInRoutePlanning
{
  unsigned int v2 = [a1 isVIOModeSupported];
  if (v2)
  {
    LOBYTE(v2) = GEOConfigGetBOOL();
  }
  return v2;
}

+ (BOOL)isVIOModeEnabled
{
  unsigned int v2 = [a1 isVIOModeSupported];
  if (v2)
  {
    unsigned __int8 v3 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v4 = [v3 BOOLForKey:@"MapsWalkingEnableImageBasedHeading"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)isVIOModeEnabledInRoutePlanning
{
  unsigned int v2 = [a1 isVIOModeEnabled];
  if (v2)
  {
    LOBYTE(v2) = GEOConfigGetBOOL();
  }
  return v2;
}

- (id)activeMonitors
{
  unsigned int v2 = [(VIOSessionTask *)self monitors];
  id v3 = [v2 copy];

  return v3;
}

- (id)configuration
{
  if ([(VIOSessionTask *)self shouldStartVLFSession])
  {
    id v3 = objc_opt_new();
    [v3 setVisualLocalizationUpdatesRequested:0];
    [v3 setSupportEnablementOptions:4];
    GEOConfigGetDouble();
    double v5 = v4;
    id v6 = sub_1000AEBF0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 134217984;
      v17 = *(const char **)&v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Configuring post-VLF VIO with framerate: %f", (uint8_t *)&v16, 0xCu);
    }

    uint64_t v7 = +[NSNumber numberWithDouble:v5];
    v22[0] = v7;
    BOOL v8 = +[NSNumber numberWithDouble:v5];
    v22[1] = v8;
    v9 = +[NSNumber numberWithDouble:v5];
    v22[2] = v9;
    uint64_t v10 = +[NSArray arrayWithObjects:v22 count:3];
    unsigned int v11 = [v3 videoFormat];
    [v11 setFrameRatesByPowerUsage:v10];
  }
  else if ([(VIOSessionTask *)self shouldStartVIOSession])
  {
    id v3 = objc_opt_new();
    [v3 setVioFusionEnabled:GEOConfigGetBOOL()];
  }
  else
  {
    v12 = sub_1005762E4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315650;
      v17 = "-[VIOSessionTask configuration]";
      __int16 v18 = 2080;
      unsigned __int8 v19 = "VIOSessionTask.m";
      __int16 v20 = 1024;
      int v21 = 202;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v16, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = +[NSThread callStackSymbols];
        int v16 = 138412290;
        v17 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
      }
    }
    id v3 = 0;
  }

  return v3;
}

- (void)startVIOSession
{
  if ([(VIOSessionTask *)self shouldStartVIOSession]
    && ![(VIOSessionTask *)self isEligibleToStartVIO])
  {
    id v3 = sub_1000AEBF0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = 0;
      int v16 = "VIO should not start or is not eligible to start; not starting";
      v17 = (uint8_t *)&v23;
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v16, v17, 2u);
    }
  }
  else
  {
    if (![(VIOSessionTask *)self shouldStartVLFSession]
      || [(VIOSessionTask *)self isEligibleToStartVLF])
    {
      id v3 = [(VIOSessionTask *)self configuration];
      double v4 = +[NSUserDefaults standardUserDefaults];
      unsigned int v5 = [v4 BOOLForKey:@"MapsARSessionRecordingEnabledKey"];

      if (v5)
      {
        id v6 = sub_1000AEBF0();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "ARKit session recording is enabled; trying to create recording configuration",
            buf,
            2u);
        }

        uint64_t v7 = +[NSDate now];
        [v7 timeIntervalSince1970];
        v9 = +[NSString stringWithFormat:@"vio.%.0f.mov", v8 * 1000.0];
        uint64_t v10 = [v3 recordingConfigurationWithFileName:v9];

        id v3 = v10;
      }
      [(VIOSessionTask *)self createMonitorsForConfiguration:v3];
      if ([(VIOSessionTask *)self areMonitorsDisablingVIO])
      {
        unsigned int v11 = sub_1000AEBF0();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)__int16 v18 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "VIO session will not start because a monitor wants to disable the session", v18, 2u);
        }

        v12 = [(VIOSessionTask *)self session];
        [v12 pause];
        goto LABEL_27;
      }
      if ([v3 isVIO])
      {
        v13 = sub_1000AEBF0();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          __int16 v20 = 0;
          v14 = "VIO session is starting";
          v15 = (uint8_t *)&v20;
LABEL_24:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v14, v15, 2u);
        }
      }
      else
      {
        if (![v3 isVLF])
        {
LABEL_26:
          v12 = [(VIOSessionTask *)self session];
          [v12 runWithConfiguration:v3];
LABEL_27:

          goto LABEL_28;
        }
        v13 = sub_1000AEBF0();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)unsigned __int8 v19 = 0;
          v14 = "Post-VLF VIO session is starting";
          v15 = v19;
          goto LABEL_24;
        }
      }

      goto LABEL_26;
    }
    id v3 = sub_1000AEBF0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)objc_super v22 = 0;
      int v16 = "Post-VLF VIO should not start or is not eligible to start; not starting";
      v17 = v22;
      goto LABEL_20;
    }
  }
LABEL_28:
}

- (void)createMonitorsForConfiguration:(id)a3
{
  id v4 = a3;
  if ([v4 isVIO])
  {
    unsigned int v5 = [(VIOSessionTask *)self session];
    id v6 = [v5 configuration];
    unsigned int v7 = [v6 isVIO];
  }
  else
  {
    unsigned int v7 = 0;
  }
  if ([v4 isVLF])
  {
    double v8 = [(VIOSessionTask *)self session];
    v9 = [v8 configuration];
    v7 |= [v9 isVLF];
  }
  uint64_t v10 = [(VIOSessionTask *)self monitors];
  id v11 = [v10 count];

  if (v11 && v7)
  {
    v12 = sub_1000AEBF0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Monitors already exist and VIO is not changing; not creating them again",
        buf,
        2u);
    }
  }
  else
  {
    v13 = [(VIOSessionTask *)self monitors];
    [v13 removeAllObjects];

    v14 = [VIOSessionStateManager alloc];
    v15 = [(VIOSessionTask *)self session];
    id v34 = v4;
    v12 = [(VIOSessionStateManager *)v14 initWithSession:v15 configuration:v4];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v41[0] = objc_opt_class();
    v41[1] = objc_opt_class();
    v41[2] = objc_opt_class();
    v41[3] = objc_opt_class();
    v41[4] = objc_opt_class();
    v41[5] = objc_opt_class();
    v41[6] = objc_opt_class();
    v41[7] = objc_opt_class();
    v41[8] = objc_opt_class();
    v41[9] = objc_opt_class();
    v41[10] = objc_opt_class();
    v41[11] = objc_opt_class();
    int v16 = +[NSArray arrayWithObjects:v41 count:12];
    id v17 = [v16 countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v36;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(v16);
          }
          int v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          unsigned int v22 = [v21 isAvailable];
          __int16 v23 = sub_1000AEBF0();
          BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
          if (v22)
          {
            if (v24)
            {
              __int16 v25 = NSStringFromClass((Class)v21);
              *(_DWORD *)buf = 138412290;
              v40 = v25;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%@ is available; creating it",
                buf,
                0xCu);
            }
            __int16 v23 = [(VIOSessionTask *)self monitors];
            id v26 = objc_alloc((Class)v21);
            __int16 v27 = [(VIOSessionTask *)self platformController];
            id v28 = [v26 initWithStateManager:v12 platformController:v27];
            [v23 addObject:v28];
          }
          else if (v24)
          {
            __int16 v29 = NSStringFromClass((Class)v21);
            *(_DWORD *)buf = 138412290;
            v40 = v29;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%@ is unavailable; NOT creating it",
              buf,
              0xCu);
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v35 objects:v42 count:16];
      }
      while (v18);
    }

    v30 = [(VIOSessionTask *)self analyticsCapturer];
    [v30 setStateManager:v12];

    v31 = [(VIOSessionTask *)self session];
    v32 = [(VIOSessionTask *)self analyticsCapturer];
    [v32 setSession:v31];

    v33 = sub_1000AEBF0();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "New monitors have been created", buf, 2u);
    }

    id v4 = v34;
  }
}

- (BOOL)areMonitorsDisablingVIO
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned int v2 = [(VIOSessionTask *)self monitors];
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v3)
  {
    uint64_t v5 = *(void *)v12;
    *(void *)&long long v4 = 138412290;
    long long v10 = v4;
    while (2)
    {
      for (i = 0; i != v3; i = ((char *)i + 1))
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        unsigned int v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v7, "isEnabled", v10)
          && [v7 shouldDisableVIOSession])
        {
          id v3 = sub_1000AEBF0();
          if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v10;
            int v16 = v7;
            _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ is requesting to prevent the VIO session from starting", buf, 0xCu);
          }

          LOBYTE(v3) = 1;
          goto LABEL_16;
        }
        double v8 = sub_1000AEBF0();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v10;
          int v16 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@ is NOT requesting to prevent the VIO session from starting", buf, 0xCu);
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return (char)v3;
}

- (BOOL)isVIOSessionRunning
{
  unsigned int v2 = [(VIOSessionTask *)self session];
  unsigned __int8 v3 = [v2 isVIORunning];

  return v3;
}

- (BOOL)isVLFSessionRunning
{
  unsigned int v2 = [(VIOSessionTask *)self session];
  unsigned __int8 v3 = [v2 isVLFRunning];

  return v3;
}

- (void)setCurrentNavigationSession:(id)a3
{
  uint64_t v5 = (NavigationSession *)a3;
  currentNavigationSession = self->_currentNavigationSession;
  if (currentNavigationSession != v5)
  {
    unsigned int v7 = v5;
    [currentNavigationSession removeObserver:self];
    objc_storeStrong((id *)&self->_currentNavigationSession, a3);
    [self->_currentNavigationSession addObserver:self];
    uint64_t v5 = v7;
  }
}

- (void)setCurrentRoutePlanningSession:(id)a3
{
  uint64_t v5 = (RoutePlanningSession *)a3;
  currentRoutePlanningSession = self->_currentRoutePlanningSession;
  if (currentRoutePlanningSession != v5)
  {
    unsigned int v7 = v5;
    [currentRoutePlanningSession removeObserver:self];
    objc_storeStrong((id *)&self->_currentRoutePlanningSession, a3);
    [self->_currentRoutePlanningSession addObserver:self];
    uint64_t v5 = v7;
  }
}

- (void)handleTransportTypeChanged:(int64_t)a3
{
  if ([(VIOSessionTask *)self isVLFSessionRunning]
    && +[VLFSessionTask isSupportedForTransportType:a3])
  {
    return;
  }
  if (a3 != 2)
  {
    uint64_t v8 = [(VIOSessionTask *)self analyticsCapturer];
    [(id)v8 stopRecording];

    LOBYTE(v8) = [(VIOSessionTask *)self isVIOSessionRunning];
    unsigned int v9 = [(VIOSessionTask *)self isVLFSessionRunning];
    if ((v8 & 1) == 0 && !v9) {
      goto LABEL_29;
    }
    long long v10 = sub_1000AEBF0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)(a3 - 1) > 4) {
        CFStringRef v11 = @"Undefined";
      }
      else {
        CFStringRef v11 = off_1012FF9A0[a3 - 1];
      }
      int v23 = 138412290;
      CFStringRef v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Transport type changed (%@); pausing VIO session",
        (uint8_t *)&v23,
        0xCu);
    }

    goto LABEL_28;
  }
  uint64_t v5 = [(VIOSessionTask *)self currentRoutePlanningSession];
  id v6 = objc_opt_class();
  if (v5) {
    unsigned int v7 = [v6 isVIOModeEnabledInRoutePlanning];
  }
  else {
    unsigned int v7 = [v6 isVIOModeEnabled];
  }
  unsigned int v12 = v7;

  long long v13 = [(VIOSessionTask *)self session];

  long long v14 = [(VIOSessionTask *)self analyticsCapturer];
  v15 = v14;
  if (!v12 || !v13)
  {
    [v14 stopRecording];

    unsigned __int8 v17 = [(VIOSessionTask *)self isVIOSessionRunning];
    unsigned int v18 = [(VIOSessionTask *)self isVLFSessionRunning];
    if ((v17 & 1) == 0 && !v18) {
      goto LABEL_29;
    }
    uint64_t v19 = sub_1000AEBF0();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      __int16 v20 = [(VIOSessionTask *)self currentRoutePlanningSession];
      CFStringRef v21 = @"VIO mode in route planning";
      if (!v20) {
        CFStringRef v21 = @"VIO mode";
      }
      int v23 = 138412546;
      CFStringRef v24 = @"Walk";
      __int16 v25 = 2112;
      CFStringRef v26 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Transport type changed (%@) but %@ is not enabled; pausing VIO session",
        (uint8_t *)&v23,
        0x16u);
    }
LABEL_28:
    [(VIOSessionTask *)self pauseVIOSession];
LABEL_29:
    unsigned int v22 = [(VIOSessionTask *)self monitors];
    [v22 removeAllObjects];

    return;
  }
  [v14 startRecording];

  if (![(VIOSessionTask *)self isVIOSessionRunning])
  {
    int v16 = sub_1000AEBF0();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412290;
      CFStringRef v24 = @"Walk";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Transport type changed (%@); starting VIO session",
        (uint8_t *)&v23,
        0xCu);
    }

    [(VIOSessionTask *)self startVIOSession];
  }
}

- (BOOL)isEligibleToStartVIO
{
  if (([(id)objc_opt_class() isVIOModeEnabled] & 1) == 0)
  {
    v31 = sub_1005762E4();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      int v49 = 136315906;
      v50 = "-[VIOSessionTask isEligibleToStartVIO]";
      __int16 v51 = 2080;
      v52 = "VIOSessionTask.m";
      __int16 v53 = 1024;
      int v54 = 395;
      __int16 v55 = 2080;
      v56 = "[[self class] isVIOModeEnabled]";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v49, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v32 = sub_1005762E4();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = +[NSThread callStackSymbols];
        int v49 = 138412290;
        v50 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v49, 0xCu);
      }
    }
  }
  if (([(id)objc_opt_class() isVIOModeEnabled] & 1) == 0)
  {
    long long v10 = sub_1000AEBF0();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    LOWORD(v49) = 0;
    long long v14 = "Can't start a VIO session when VIO mode is not enabled";
    goto LABEL_38;
  }
  unsigned __int8 v3 = [(VIOSessionTask *)self session];

  if (!v3)
  {
    id v34 = sub_1005762E4();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      int v49 = 136315906;
      v50 = "-[VIOSessionTask isEligibleToStartVIO]";
      __int16 v51 = 2080;
      v52 = "VIOSessionTask.m";
      __int16 v53 = 1024;
      int v54 = 401;
      __int16 v55 = 2080;
      v56 = "self.session != nil";
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v49, 0x26u);
    }

    if (sub_100BB36BC())
    {
      long long v35 = sub_1005762E4();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        long long v36 = +[NSThread callStackSymbols];
        int v49 = 138412290;
        v50 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v49, 0xCu);
      }
    }
  }
  long long v4 = [(VIOSessionTask *)self session];

  if (!v4)
  {
    long long v10 = sub_1000AEBF0();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    LOWORD(v49) = 0;
    long long v14 = "Can't start a VIO session when the current session has been transitioned to be used for another purpose";
    goto LABEL_38;
  }
  uint64_t v5 = [(VIOSessionTask *)self currentRoutePlanningSession];

  if (v5)
  {
    if (([(id)objc_opt_class() isVIOModeEnabledInRoutePlanning] & 1) == 0)
    {
      long long v37 = sub_1005762E4();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        int v49 = 136315906;
        v50 = "-[VIOSessionTask isEligibleToStartVIO]";
        __int16 v51 = 2080;
        v52 = "VIOSessionTask.m";
        __int16 v53 = 1024;
        int v54 = 408;
        __int16 v55 = 2080;
        v56 = "self.class.isVIOModeEnabledInRoutePlanning";
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v49, 0x26u);
      }

      if (sub_100BB36BC())
      {
        long long v38 = sub_1005762E4();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          __int16 v39 = +[NSThread callStackSymbols];
          int v49 = 138412290;
          v50 = v39;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v49, 0xCu);
        }
      }
    }
    if ([(id)objc_opt_class() isVIOModeEnabledInRoutePlanning])
    {
      id v6 = [(VIOSessionTask *)self currentRoutePlanningSession];
      id v7 = [v6 currentTransportType];

      if (v7 != (id)2)
      {
        v40 = sub_1005762E4();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          int v49 = 136315906;
          v50 = "-[VIOSessionTask isEligibleToStartVIO]";
          __int16 v51 = 2080;
          v52 = "VIOSessionTask.m";
          __int16 v53 = 1024;
          int v54 = 414;
          __int16 v55 = 2080;
          v56 = "self.currentRoutePlanningSession.currentTransportType == TransportTypeWalk";
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v49, 0x26u);
        }

        if (sub_100BB36BC())
        {
          v41 = sub_1005762E4();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            v42 = +[NSThread callStackSymbols];
            int v49 = 138412290;
            v50 = v42;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v49, 0xCu);
          }
        }
      }
      uint64_t v8 = [(VIOSessionTask *)self currentRoutePlanningSession];
      id v9 = [v8 currentTransportType];

      if (v9 != (id)2)
      {
        long long v10 = sub_1000AEBF0();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          CFStringRef v11 = [(VIOSessionTask *)self currentRoutePlanningSession];
          unsigned int v12 = (char *)[v11 currentTransportType];
          if ((unint64_t)(v12 - 1) > 4) {
            CFStringRef v13 = @"Undefined";
          }
          else {
            CFStringRef v13 = off_1012FF9C8[(void)(v12 - 1)];
          }
          int v49 = 138412290;
          v50 = (const char *)v13;
          v30 = "Can't start a VIO session during route planning when the transport type is %@";
LABEL_44:
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&v49, 0xCu);

          goto LABEL_39;
        }
        goto LABEL_39;
      }
      return 1;
    }
    long long v10 = sub_1000AEBF0();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    LOWORD(v49) = 0;
    long long v14 = "Can't start a VIO session during route planning when VIO mode during route planning is not enabled";
LABEL_38:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v49, 2u);
    goto LABEL_39;
  }
  v15 = [(VIOSessionTask *)self currentNavigationSession];

  if (!v15)
  {
    __int16 v25 = sub_1005762E4();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v49 = 136315650;
      v50 = "-[VIOSessionTask isEligibleToStartVIO]";
      __int16 v51 = 2080;
      v52 = "VIOSessionTask.m";
      __int16 v53 = 1024;
      int v54 = 432;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v49, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      CFStringRef v26 = sub_1005762E4();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        __int16 v27 = +[NSThread callStackSymbols];
        int v49 = 138412290;
        v50 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v49, 0xCu);
      }
    }
    long long v10 = sub_1000AEBF0();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    LOWORD(v49) = 0;
    long long v14 = "Can't start a VIO session when we're neither in route planning nor in navigation";
    goto LABEL_38;
  }
  int v16 = [(VIOSessionTask *)self currentNavigationSession];
  id v17 = [v16 currentTransportType];

  if (v17 != (id)2)
  {
    v43 = sub_1005762E4();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      int v49 = 136315906;
      v50 = "-[VIOSessionTask isEligibleToStartVIO]";
      __int16 v51 = 2080;
      v52 = "VIOSessionTask.m";
      __int16 v53 = 1024;
      int v54 = 420;
      __int16 v55 = 2080;
      v56 = "self.currentNavigationSession.currentTransportType == TransportTypeWalk";
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v49, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v44 = sub_1005762E4();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = +[NSThread callStackSymbols];
        int v49 = 138412290;
        v50 = v45;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v49, 0xCu);
      }
    }
  }
  unsigned int v18 = [(VIOSessionTask *)self currentNavigationSession];
  id v19 = [v18 currentTransportType];

  if (v19 == (id)2)
  {
    __int16 v20 = [(VIOSessionTask *)self currentNavigationSession];
    id v21 = [v20 navigationType];

    if (v21 != (id)3)
    {
      v46 = sub_1005762E4();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        int v49 = 136315906;
        v50 = "-[VIOSessionTask isEligibleToStartVIO]";
        __int16 v51 = 2080;
        v52 = "VIOSessionTask.m";
        __int16 v53 = 1024;
        int v54 = 426;
        __int16 v55 = 2080;
        v56 = "self.currentNavigationSession.navigationType == MNNavigationType_TurnByTurn";
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v49, 0x26u);
      }

      if (sub_100BB36BC())
      {
        v47 = sub_1005762E4();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v48 = +[NSThread callStackSymbols];
          int v49 = 138412290;
          v50 = v48;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v49, 0xCu);
        }
      }
    }
    unsigned int v22 = [(VIOSessionTask *)self currentNavigationSession];
    id v23 = [v22 navigationType];

    if (v23 == (id)3) {
      return 1;
    }
    long long v10 = sub_1000AEBF0();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    LOWORD(v49) = 0;
    long long v14 = "Can't start a VIO session during non-TBT navigation";
    goto LABEL_38;
  }
  long long v10 = sub_1000AEBF0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    CFStringRef v11 = [(VIOSessionTask *)self currentNavigationSession];
    id v28 = (char *)[v11 currentTransportType];
    if ((unint64_t)(v28 - 1) > 4) {
      CFStringRef v29 = @"Undefined";
    }
    else {
      CFStringRef v29 = off_1012FF9C8[(void)(v28 - 1)];
    }
    int v49 = 138412290;
    v50 = (const char *)v29;
    v30 = "Can't start a VIO session during navigation when the transport type is %@";
    goto LABEL_44;
  }
LABEL_39:

  return 0;
}

- (BOOL)isEligibleToStartVLF
{
  if (([(id)objc_opt_class() isVLFModeEnabled] & 1) == 0)
  {
    v15 = sub_1005762E4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136315906;
      __int16 v25 = "-[VIOSessionTask isEligibleToStartVLF]";
      __int16 v26 = 2080;
      __int16 v27 = "VIOSessionTask.m";
      __int16 v28 = 1024;
      int v29 = 443;
      __int16 v30 = 2080;
      v31 = "[[self class] isVLFModeEnabled]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v24, 0x26u);
    }

    if (sub_100BB36BC())
    {
      int v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = +[NSThread callStackSymbols];
        int v24 = 138412290;
        __int16 v25 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v24, 0xCu);
      }
    }
  }
  if (([(id)objc_opt_class() isVLFModeEnabled] & 1) == 0)
  {
    long long v10 = sub_1000AEBF0();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    LOWORD(v24) = 0;
    CFStringRef v11 = "Can't start a post-VLF VIO session when VLF mode is not enabled";
LABEL_13:
    unsigned int v12 = v10;
    uint32_t v13 = 2;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v24, v13);
    goto LABEL_15;
  }
  unsigned __int8 v3 = [(VIOSessionTask *)self session];

  if (!v3)
  {
    unsigned int v18 = sub_1005762E4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136315906;
      __int16 v25 = "-[VIOSessionTask isEligibleToStartVLF]";
      __int16 v26 = 2080;
      __int16 v27 = "VIOSessionTask.m";
      __int16 v28 = 1024;
      int v29 = 449;
      __int16 v30 = 2080;
      v31 = "self.session != nil";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v24, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v19 = sub_1005762E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = +[NSThread callStackSymbols];
        int v24 = 138412290;
        __int16 v25 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v24, 0xCu);
      }
    }
  }
  long long v4 = [(VIOSessionTask *)self session];

  if (!v4)
  {
    long long v10 = sub_1000AEBF0();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    LOWORD(v24) = 0;
    CFStringRef v11 = "Can't start a post-VLF VIO session when the current session has been transitioned to be used for another purpose";
    goto LABEL_13;
  }
  uint64_t v5 = [(VIOSessionTask *)self currentNavigationSession];

  if (!v5) {
    return 1;
  }
  id v6 = [(VIOSessionTask *)self currentNavigationSession];
  id v7 = (char *)[v6 currentTransportType];

  uint64_t v8 = &OBJC_METACLASS___GeoRequestCounterInterfaces;
  if (!+[VLFSessionTask isSupportedForTransportType:v7])
  {
    id v21 = sub_1005762E4();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136315906;
      __int16 v25 = "-[VIOSessionTask isEligibleToStartVLF]";
      __int16 v26 = 2080;
      __int16 v27 = "VIOSessionTask.m";
      __int16 v28 = 1024;
      int v29 = 457;
      __int16 v30 = 2080;
      v31 = "[VLFSessionTask isSupportedForTransportType:currentTransportType]";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v24, 0x26u);
    }

    if (sub_100BB36BC())
    {
      unsigned int v22 = sub_1005762E4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = +[NSThread callStackSymbols];
        int v24 = 138412290;
        __int16 v25 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v24, 0xCu);
      }
      uint64_t v8 = &OBJC_METACLASS___GeoRequestCounterInterfaces;
    }
  }
  if ([&v8[27] isSupportedForTransportType:v7]) {
    return 1;
  }
  long long v10 = sub_1000AEBF0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    if ((unint64_t)(v7 - 1) > 4) {
      CFStringRef v14 = @"Undefined";
    }
    else {
      CFStringRef v14 = off_1012FF9C8[(void)(v7 - 1)];
    }
    int v24 = 138412290;
    __int16 v25 = (const char *)v14;
    CFStringRef v11 = "Can't start a post-VLF VIO session during navigation when the transport type is %@";
    unsigned int v12 = v10;
    uint32_t v13 = 12;
    goto LABEL_14;
  }
LABEL_15:

  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = +[NSUserDefaults standardUserDefaults];
  if (v13 != v11)
  {

LABEL_10:
    v20.receiver = self;
    v20.super_class = (Class)VIOSessionTask;
    [(VIOSessionTask *)&v20 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_11;
  }
  unsigned int v14 = [v10 isEqualToString:@"MapsWalkingEnableImageBasedHeading"];

  if (!v14) {
    goto LABEL_10;
  }
  v15 = [v12 objectForKey:NSKeyValueChangeNewKey];
  unsigned int v16 = [v15 BOOLValue];

  if (v16)
  {
    if ([(VIOSessionTask *)self shouldStartVIOSession]
      && ![(VIOSessionTask *)self isVIOSessionRunning])
    {
      id v17 = sub_1000AEBF0();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "User enabled VIO from Maps settings; starting VIO session",
          buf,
          2u);
      }

      [(VIOSessionTask *)self startVIOSession];
    }
  }
  else
  {
    unsigned int v18 = sub_1000AEBF0();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "User disabled VIO from Maps settings; pausing VIO session",
        buf,
        2u);
    }

    [(VIOSessionTask *)self pauseVIOSession];
    id v19 = [(VIOSessionTask *)self monitors];
    [v19 removeAllObjects];
  }
LABEL_11:
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008C9FB4;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)sessionWasInterrupted:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008CA080;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)sessionInterruptionEnded:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008CA15C;
  v4[3] = &unk_1012E5D58;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)navigationSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008CA224;
  v4[3] = &unk_1012E69C0;
  v4[4] = self;
  void v4[5] = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  [(VIOSessionTask *)self setCurrentRoutePlanningSession:v10];

  id v11 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  [(VIOSessionTask *)self setCurrentNavigationSession:v13];
  unsigned int v14 = [(VIOSessionTask *)self session];

  if (!v14) {
    goto LABEL_48;
  }
  if ([(VIOSessionTask *)self isVLFSessionRunning])
  {
    uint64_t v15 = [(VIOSessionTask *)self currentNavigationSession];
    if (v15
      && (unsigned int v16 = (void *)v15,
          [(VIOSessionTask *)self currentNavigationSession],
          id v17 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v18 = +[VLFSessionTask isSupportedForTransportType:](VLFSessionTask, "isSupportedForTransportType:", [v17 currentTransportType]), v17, v16, (v18 & 1) == 0))
    {
      id v19 = sub_1000AEBF0();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_super v20 = [(VIOSessionTask *)self currentNavigationSession];
        id v21 = (char *)[v20 currentTransportType];
        if ((unint64_t)(v21 - 1) > 4) {
          CFStringRef v22 = @"Undefined";
        }
        else {
          CFStringRef v22 = off_1012FF9C8[(void)(v21 - 1)];
        }
        *(_DWORD *)long long v38 = 138412290;
        *(void *)&v38[4] = v22;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Post-VLF VIO is running and we entered nav for a non-supported transport type (%@); pausing VIO session",
          v38,
          0xCu);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_48;
      }
      id v19 = sub_1000AEBF0();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v38 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Navigation ended during Post-VLF VIO; pausing VIO session",
          v38,
          2u);
      }
    }

    id v23 = [(VIOSessionTask *)self analyticsCapturer];
    [v23 stopRecording];

    [(VIOSessionTask *)self pauseVIOSession];
  }
  if (![(VIOSessionTask *)self shouldStartVIOSession])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(VIOSessionTask *)self currentNavigationSession],
          __int16 v28 = objc_claimAutoreleasedReturnValue(),
          v28,
          !v28))
    {
      id v34 = [(VIOSessionTask *)self analyticsCapturer];
      [v34 stopRecording];

      if ([(VIOSessionTask *)self isVIOSessionRunning])
      {
        __int16 v30 = sub_1000AEBF0();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long v38 = 0;
          v31 = "Ended route planning; pausing VIO session";
          goto LABEL_45;
        }
        goto LABEL_46;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v29 = [(VIOSessionTask *)self analyticsCapturer];
        [v29 stopRecording];

        if ([(VIOSessionTask *)self isVIOSessionRunning])
        {
          __int16 v30 = sub_1000AEBF0();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long v38 = 0;
            v31 = "Ended navigation; pausing VIO session";
LABEL_45:
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, v31, v38, 2u);
            goto LABEL_46;
          }
          goto LABEL_46;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_48;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_48;
        }
        v32 = [(VIOSessionTask *)self analyticsCapturer];
        [v32 stopRecording];

        if ([(VIOSessionTask *)self isVIOSessionRunning])
        {
          __int16 v30 = sub_1000AEBF0();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long v38 = 0;
            v31 = "VIO session was running during route planning and now it shouldn't be during navigation; pausing VIO session";
            goto LABEL_45;
          }
LABEL_46:

          [(VIOSessionTask *)self pauseVIOSession];
        }
      }
    }
    long long v35 = [(VIOSessionTask *)self monitors];
    [v35 removeAllObjects];

    goto LABEL_48;
  }
  int v24 = [(VIOSessionTask *)self analyticsCapturer];
  [v24 startRecording];

  if (![(VIOSessionTask *)self isVIOSessionRunning])
  {
    __int16 v25 = [(VIOSessionTask *)self currentRoutePlanningSession];

    if (v25)
    {
      __int16 v26 = sub_1000AEBF0();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v38 = 0;
        __int16 v27 = "Entered pedestrian route planning; starting VIO session";
LABEL_39:
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, v27, v38, 2u);
      }
    }
    else
    {
      v33 = [(VIOSessionTask *)self currentNavigationSession];

      if (v33)
      {
        __int16 v26 = sub_1000AEBF0();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long v38 = 0;
          __int16 v27 = "Entered pedestrian navigation; starting VIO session";
          goto LABEL_39;
        }
      }
      else
      {
        long long v36 = sub_1005762E4();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long v38 = 136315650;
          *(void *)&v38[4] = "-[VIOSessionTask platformController:didChangeCurrentSessionFromSession:toSession:]";
          __int16 v39 = 2080;
          v40 = "VIOSessionTask.m";
          __int16 v41 = 1024;
          int v42 = 581;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", v38, 0x1Cu);
        }

        if (!sub_100BB36BC()) {
          goto LABEL_41;
        }
        __int16 v26 = sub_1005762E4();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          long long v37 = +[NSThread callStackSymbols];
          *(_DWORD *)long long v38 = 138412290;
          *(void *)&v38[4] = v37;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", v38, 0xCu);
        }
      }
    }

LABEL_41:
    [(VIOSessionTask *)self startVIOSession];
  }
LABEL_48:
}

- (void)sessionManager:(id)a3 didResignSessionOwnership:(id)a4
{
  id v5 = [(VIOSessionTask *)self session];

  if (!v5)
  {
    id v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315906;
      uint64_t v15 = "-[VIOSessionTask sessionManager:didResignSessionOwnership:]";
      __int16 v16 = 2080;
      id v17 = "VIOSessionTask.m";
      __int16 v18 = 1024;
      int v19 = 651;
      __int16 v20 = 2080;
      id v21 = "self.session != nil";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v14, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = +[NSThread callStackSymbols];
        int v14 = 138412290;
        uint64_t v15 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  id v6 = [(VIOSessionTask *)self session];

  if (v6)
  {
    id v7 = [(VIOSessionTask *)self analyticsCapturer];
    [v7 pauseRecording];

    id v8 = [(VIOSessionTask *)self monitors];
    [v8 removeAllObjects];

    id v9 = [(VIOSessionTask *)self session];
    [v9 _removeObserver:self];

    session = self->_session;
    self->_session = 0;
  }
}

- (void)sceneDidActivateNotification:(id)a3
{
  long long v4 = [(VIOSessionTask *)self session];

  if (v4)
  {
    id v5 = [(VIOSessionTask *)self session];
    id v6 = [v5 state];

    if (!v6)
    {
      unsigned __int8 v7 = [(VIOSessionTask *)self shouldStartVIOSession];
      unsigned int v8 = [(VIOSessionTask *)self shouldStartVLFSession];
      if ((v7 & 1) != 0 || v8)
      {
        id v9 = [(VIOSessionTask *)self analyticsCapturer];
        [v9 startRecording];

        [(VIOSessionTask *)self startVIOSession];
      }
    }
  }
}

- (void)setPlatformController:(id)a3
{
}

- (void)setMonitors:(id)a3
{
}

- (void)setAnalyticsCapturer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsCapturer, 0);
  objc_storeStrong((id *)&self->_monitors, 0);
  objc_storeStrong((id *)&self->_currentRoutePlanningSession, 0);
  objc_storeStrong((id *)&self->_currentNavigationSession, 0);
  objc_destroyWeak((id *)&self->_platformController);

  objc_storeStrong((id *)&self->_session, 0);
}

@end