@interface VLFSessionTask
+ (BOOL)isSupportedForTransportType:(int64_t)a3;
+ (BOOL)isVLFModeSupported;
+ (int64_t)creationPreference;
- (BOOL)canShowVLFPuckUI;
- (BOOL)wasLastLocalizationSuccessful;
- (NavigationSession)navigationSession;
- (PlatformController)platformController;
- (VLFSessionAnalyticsTracker)analyticsTracker;
- (VLFSessionStateManager)stateManager;
- (VLFSessionTask)initWithPlatformController:(id)a3;
- (VLFSessionTaskMapState)originalMapState;
- (VLFSessionTaskUserState)originalUserState;
- (void)clearMapState;
- (void)clearUserState;
- (void)dealloc;
- (void)navigationSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)saveMapState;
- (void)saveUserState;
- (void)setAnalyticsTracker:(id)a3;
- (void)setCanShowVLFPuckUI:(BOOL)a3;
- (void)setNavigationSession:(id)a3;
- (void)setOriginalMapState:(id)a3;
- (void)setOriginalUserState:(id)a3;
- (void)setPlatformController:(id)a3;
- (void)setStateManager:(id)a3;
- (void)setWasLastLocalizationSuccessful:(BOOL)a3;
- (void)showVLFUI;
- (void)stateManager:(id)a3 didChangeState:(int64_t)a4;
- (void)updateVLFPuckUIForState:(int64_t)a3;
- (void)vlfContaineeViewControllerDidAppearNotification:(id)a3;
- (void)vlfContaineeViewControllerDidDisappearNotification:(id)a3;
- (void)vlfContaineeViewControllerWillCancelNotification:(id)a3;
- (void)vlfSessionDidStartNotification:(id)a3;
- (void)vlfSessionDidStopNotification:(id)a3;
@end

@implementation VLFSessionTask

- (VLFSessionTask)initWithPlatformController:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v18 = sub_1005762E4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v23 = "-[VLFSessionTask initWithPlatformController:]";
      __int16 v24 = 2080;
      v25 = "VLFSessionTask.m";
      __int16 v26 = 1024;
      int v27 = 97;
      __int16 v28 = 2080;
      v29 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v19 = sub_1005762E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v23 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)VLFSessionTask;
  v5 = [(VLFSessionTask *)&v21 init];
  v6 = v5;
  if (v5)
  {
    v5->_canShowVLFPuckUI = 1;
    objc_storeWeak((id *)&v5->_platformController, v4);
    v7 = objc_alloc_init(VLFSessionAnalyticsTracker);
    analyticsTracker = v6->_analyticsTracker;
    v6->_analyticsTracker = v7;

    v9 = [VLFSessionStateManager alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_platformController);
    v11 = [(VLFSessionStateManager *)v9 initWithPlatformController:WeakRetained];
    stateManager = v6->_stateManager;
    v6->_stateManager = v11;

    [(VLFSessionStateManager *)v6->_stateManager addObserver:v6];
    v13 = +[MKLocationManager sharedLocationManager];
    [v13 setFusionInfoEnabled:1];

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v6 selector:"vlfSessionDidStartNotification:" name:@"VLFSessionDidStartNotification" object:0];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v6 selector:"vlfContaineeViewControllerDidAppearNotification:" name:off_1015F7858 object:0];

    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v6 selector:"vlfContaineeViewControllerWillCancelNotification:" name:off_1015F7870 object:0];
  }
  return v6;
}

+ (BOOL)isVLFModeSupported
{
  BOOL v2 = sub_1000D4BB8();
  if (v2)
  {
    if (qword_10160ECD8 != -1) {
      dispatch_once(&qword_10160ECD8, &stru_1012EA5A0);
    }
    LOBYTE(v2) = byte_10160ECD0 != 0;
  }
  return v2;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)dealloc
{
  [(VLFSessionStateManager *)self->_stateManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)VLFSessionTask;
  [(VLFSessionTask *)&v3 dealloc];
}

- (void)showVLFUI
{
  objc_super v3 = [(VLFSessionTask *)self platformController];
  id v4 = [v3 currentSession];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
    BOOL v8 = 0;
    BOOL v9 = 0;
LABEL_16:
    v16 = [(VLFSessionTask *)self platformController];
    v17 = [v16 chromeViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }
    v14 = v18;

    if (!v14)
    {
      v35 = sub_1005762E4();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        int v41 = 136315906;
        v42 = "-[VLFSessionTask showVLFUI]";
        __int16 v43 = 2080;
        v44 = "VLFSessionTask.m";
        __int16 v45 = 1024;
        int v46 = 173;
        __int16 v47 = 2080;
        v48 = "chromeVC != nil";
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v41, 0x26u);
      }

      if (sub_100BB36BC())
      {
        v36 = sub_1005762E4();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v37 = +[NSThread callStackSymbols];
          int v41 = 138412290;
          v42 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v41, 0xCu);
        }
      }
      int v27 = sub_100440F48();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v41) = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "chromeVC was not an IOSBased one; ignoring",
          (uint8_t *)&v41,
          2u);
      }
      goto LABEL_36;
    }
    v19 = [(VLFSessionTask *)self originalUserState];

    if (!v19) {
      [(VLFSessionTask *)self saveUserState];
    }
    v20 = [(VLFSessionTask *)self originalMapState];

    if (!v20) {
      [(VLFSessionTask *)self saveMapState];
    }
    objc_super v21 = +[NSNotificationCenter defaultCenter];
    [v21 postNotificationName:@"VLFSessionTaskWillShowVLFUINotification" object:0];

    v22 = [v14 mapView];
    id v23 = [v22 userTrackingMode];

    if (v23 == (id)2)
    {
      __int16 v24 = [v14 mapView];
      [v24 setUserTrackingMode:1 animated:0];
    }
    v25 = [v14 mapView];
    [v25 setUserTrackingMode:0 animated:0];

    __int16 v26 = [v14 appCoordinator];
    int v27 = v26;
    if (v9)
    {
      __int16 v28 = [v26 navModeController];
    }
    else if (v8)
    {
      __int16 v28 = [v26 stepModeController];
      if (!v28)
      {
        uint64_t v29 = [v27 transitNavigationContext];
        if (v29)
        {
          v30 = (void *)v29;
        }
        else
        {
          v38 = sub_1005762E4();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            int v41 = 136315906;
            v42 = "-[VLFSessionTask showVLFUI]";
            __int16 v43 = 2080;
            v44 = "VLFSessionTask.m";
            __int16 v45 = 1024;
            int v46 = 204;
            __int16 v47 = 2080;
            v48 = "transitNavigationContext != nil";
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v41, 0x26u);
          }

          if (sub_100BB36BC())
          {
            v39 = sub_1005762E4();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              v40 = +[NSThread callStackSymbols];
              int v41 = 138412290;
              v42 = v40;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v41, 0xCu);
            }
          }
          v30 = 0;
        }
        v31 = 0;
        goto LABEL_35;
      }
    }
    else
    {
      __int16 v28 = [v26 baseModeController];
    }
    v31 = v28;
    v30 = [v28 actionCoordinator];
LABEL_35:
    [v30 showVLF];

    v32 = [(VLFSessionTask *)self platformController];
    v33 = [v32 auxiliaryTasksManager];
    v34 = [v33 auxilaryTaskForClass:objc_opt_class()];

    [v34 cancelNavigationAutoLaunchIfNeccessary];
LABEL_36:

    goto LABEL_37;
  }
  v7 = (char *)[v6 currentTransportType];
  BOOL v8 = v7 != (char *)2;
  BOOL v9 = v7 == (char *)2;
  if ((unint64_t)(v7 - 4) > 0xFFFFFFFFFFFFFFFDLL) {
    goto LABEL_16;
  }
  v10 = v7;
  v11 = sub_1005762E4();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v41 = 136315650;
    v42 = "-[VLFSessionTask showVLFUI]";
    __int16 v43 = 2080;
    v44 = "VLFSessionTask.m";
    __int16 v45 = 1024;
    int v46 = 166;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v41, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    v12 = sub_1005762E4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = +[NSThread callStackSymbols];
      int v41 = 138412290;
      v42 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v41, 0xCu);
    }
  }
  v14 = sub_100440F48();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    if ((unint64_t)(v10 - 1) > 4) {
      CFStringRef v15 = @"Undefined";
    }
    else {
      CFStringRef v15 = off_1012EA648[(void)(v10 - 1)];
    }
    int v41 = 138412290;
    v42 = (const char *)v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Invalid transport type for VLF during navigation: %@", (uint8_t *)&v41, 0xCu);
  }
LABEL_37:
}

- (void)setNavigationSession:(id)a3
{
  v5 = (NavigationSession *)a3;
  navigationSession = self->_navigationSession;
  if (navigationSession != v5)
  {
    v7 = v5;
    [(NavigationSession *)navigationSession removeObserver:self];
    objc_storeStrong((id *)&self->_navigationSession, a3);
    [(NavigationSession *)self->_navigationSession addObserver:self];
    v5 = v7;
  }
}

- (void)setCanShowVLFPuckUI:(BOOL)a3
{
  if (self->_canShowVLFPuckUI != a3)
  {
    self->_canShowVLFPuckUI = a3;
    id v4 = sub_100440F48();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_canShowVLFPuckUI) {
        v5 = @"YES";
      }
      else {
        v5 = @"NO";
      }
      id v6 = v5;
      int v8 = 138412290;
      BOOL v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Can show VLF puck UI: %@", (uint8_t *)&v8, 0xCu);
    }
    v7 = [(VLFSessionTask *)self stateManager];
    -[VLFSessionTask updateVLFPuckUIForState:](self, "updateVLFPuckUIForState:", [v7 currentState]);
  }
}

- (void)updateVLFPuckUIForState:(int64_t)a3
{
  v5 = [(VLFSessionTask *)self platformController];
  id v6 = [v5 chromeViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (!v8)
  {
    v10 = sub_100440F48();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "chromeVC was not an IOSBased one; ignoring",
        v11,
        2u);
    }
    goto LABEL_12;
  }
  if (![(VLFSessionTask *)self canShowVLFPuckUI])
  {
    v10 = [v8 userLocationView];
    [v10 setVlfMode:0];
LABEL_12:

    goto LABEL_13;
  }
  if (a3 != 2) {
    a3 = a3 == 1;
  }
  BOOL v9 = [v8 userLocationView];
  [v9 setVlfMode:a3];

LABEL_13:
}

- (void)saveUserState
{
  objc_super v3 = sub_100440F48();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Saving user state", buf, 2u);
  }

  id v4 = [(VLFSessionTask *)self platformController];
  v5 = [v4 chromeViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = objc_opt_new();
    BOOL v9 = [v7 mapView];
    v10 = [v9 camera];
    [v10 centerCoordinateDistance];
    [v8 setOriginalCenterCoordinateDistance:];

    v11 = [v7 mapView];
    [v8 setOriginalUserTrackingMode:[v11 userTrackingMode]];

    v12 = [v7 mapView];
    v13 = v12;
    if (v12)
    {
      [v12 _userTrackingBehavior];
    }
    else
    {
      long long v29 = 0uLL;
      uint64_t v30 = 0;
    }
    long long v27 = v29;
    uint64_t v28 = v30;
    [v8 setOriginalUserTrackingBehavior:&v27];

    [(VLFSessionTask *)self setOriginalUserState:v8];
    memset(buf, 0, sizeof(buf));
    v14 = [(VLFSessionTask *)self originalUserState];
    CFStringRef v15 = v14;
    if (v14) {
      [v14 originalUserTrackingBehavior];
    }
    else {
      memset(buf, 0, sizeof(buf));
    }

    v16 = sub_100440F48();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = [(VLFSessionTask *)self originalUserState];
      [v17 originalCenterCoordinateDistance];
      *(_DWORD *)v31 = 134217984;
      id v32 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Original center coordinate distance: %f", v31, 0xCu);
    }
    v19 = sub_100440F48();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = [(VLFSessionTask *)self originalUserState];
      id v21 = [v20 originalUserTrackingMode];
      *(_DWORD *)v31 = 134217984;
      id v32 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Original tracking mode: %ld", v31, 0xCu);
    }
    v22 = sub_100440F48();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      id v23 = VKStringForAnnotationTrackingBehavior();
      *(_DWORD *)v31 = 138412290;
      id v32 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Original tracking behavior: %@", v31, 0xCu);
    }
  }
  else
  {
    __int16 v24 = sub_1005762E4();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[VLFSessionTask saveUserState]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "VLFSessionTask.m";
      *(_WORD *)&buf[22] = 1024;
      int v34 = 261;
      __int16 v35 = 2080;
      v36 = "chromeVC != nil";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v25 = sub_1005762E4();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        __int16 v26 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    v22 = sub_100440F48();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "chromeVC was not an IOSBased one; ignoring",
        buf,
        2u);
    }
  }
}

- (void)clearUserState
{
  objc_super v3 = sub_100440F48();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Clearing user state", v4, 2u);
  }

  [(VLFSessionTask *)self setOriginalUserState:0];
}

- (void)saveMapState
{
  objc_super v3 = sub_100440F48();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v36) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Saving map state", (uint8_t *)&v36, 2u);
  }

  id v4 = [(VLFSessionTask *)self platformController];
  v5 = [v4 chromeViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = objc_opt_new();
    BOOL v9 = [v7 mapView];
    [v8 setScrollEnabled:[v9 isScrollEnabled]];

    v10 = [v7 mapView];
    [v8 setRotateEnabled:[v10 isRotateEnabled]];

    v11 = [v7 mapView];
    [v8 setZoomEnabled:[v11 isZoomEnabled]];

    v12 = [v7 mapView];
    [v8 setPitchEnabled:[v12 isPitchEnabled]];

    [(VLFSessionTask *)self setOriginalMapState:v8];
    v13 = sub_100440F48();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = [(VLFSessionTask *)self originalMapState];
      unsigned int v15 = [v14 scrollEnabled];
      v16 = @"NO";
      if (v15) {
        v16 = @"YES";
      }
      v17 = v16;
      int v36 = 138412290;
      v37 = (const char *)v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Original scroll enabled: %@", (uint8_t *)&v36, 0xCu);
    }
    v18 = sub_100440F48();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = [(VLFSessionTask *)self originalMapState];
      unsigned int v20 = [v19 rotateEnabled];
      id v21 = @"NO";
      if (v20) {
        id v21 = @"YES";
      }
      v22 = v21;
      int v36 = 138412290;
      v37 = (const char *)v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Original rotate enabled: %@", (uint8_t *)&v36, 0xCu);
    }
    id v23 = sub_100440F48();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      __int16 v24 = [(VLFSessionTask *)self originalMapState];
      unsigned int v25 = [v24 zoomEnabled];
      __int16 v26 = @"NO";
      if (v25) {
        __int16 v26 = @"YES";
      }
      long long v27 = v26;
      int v36 = 138412290;
      v37 = (const char *)v27;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Original zoom enabled: %@", (uint8_t *)&v36, 0xCu);
    }
    uint64_t v28 = sub_100440F48();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      long long v29 = [(VLFSessionTask *)self originalMapState];
      unsigned int v30 = [v29 pitchEnabled];
      v31 = @"NO";
      if (v30) {
        v31 = @"YES";
      }
      id v32 = v31;
      int v36 = 138412290;
      v37 = (const char *)v32;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Original pitch enabled: %@", (uint8_t *)&v36, 0xCu);
    }
  }
  else
  {
    v33 = sub_1005762E4();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      int v36 = 136315906;
      v37 = "-[VLFSessionTask saveMapState]";
      __int16 v38 = 2080;
      v39 = "VLFSessionTask.m";
      __int16 v40 = 1024;
      int v41 = 293;
      __int16 v42 = 2080;
      __int16 v43 = "chromeVC != nil";
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v36, 0x26u);
    }

    if (sub_100BB36BC())
    {
      int v34 = sub_1005762E4();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        __int16 v35 = +[NSThread callStackSymbols];
        int v36 = 138412290;
        v37 = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v36, 0xCu);
      }
    }
    uint64_t v28 = sub_100440F48();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v36) = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "chromeVC was not an IOSBased one; ignoring",
        (uint8_t *)&v36,
        2u);
    }
  }
}

- (void)clearMapState
{
  objc_super v3 = sub_100440F48();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Clearing map state", v4, 2u);
  }

  [(VLFSessionTask *)self setOriginalMapState:0];
}

+ (BOOL)isSupportedForTransportType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFALL) != 0;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v15 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v15;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  [(VLFSessionTask *)self setNavigationSession:v7];

  id v8 = [(VLFSessionTask *)self navigationSession];

  if (!v8) {
    goto LABEL_7;
  }
  BOOL v9 = objc_opt_class();
  v10 = [(VLFSessionTask *)self navigationSession];
  uint64_t v11 = [v9 isSupportedForTransportType:[v10 currentTransportType]];

  if (!v11) {
    goto LABEL_9;
  }
  v12 = [(VLFSessionTask *)self navigationSession];
  id v13 = [v12 currentTransportType];

  if (v13 != (id)3)
  {
    v14 = [(VLFSessionTask *)self navigationSession];
    uint64_t v11 = [v14 navigationType] != (id)2;
  }
  else
  {
LABEL_7:
    uint64_t v11 = 1;
  }
LABEL_9:
  [(VLFSessionTask *)self setCanShowVLFPuckUI:v11];
}

- (void)navigationSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4
{
  id v5 = [(id)objc_opt_class() isSupportedForTransportType:a4];

  [(VLFSessionTask *)self setCanShowVLFPuckUI:v5];
}

- (void)stateManager:(id)a3 didChangeState:(int64_t)a4
{
}

- (void)vlfSessionDidStartNotification:(id)a3
{
  id v4 = sub_100440F48();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "VLF session started", buf, 2u);
  }

  id v5 = sub_100440F48();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Disabling idle timer", v9, 2u);
  }

  id v6 = +[UIApplication sharedMapsDelegate];
  id v7 = [v6 idleTimerController];
  [v7 setDesiredIdleTimerState:1 forReason:3];

  [(VLFSessionTask *)self setWasLastLocalizationSuccessful:0];
  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"vlfSessionDidStopNotification:" name:@"VLFSessionDidStopNotification" object:0];
}

- (void)vlfSessionDidStopNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_100440F48();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "VLF session stopped", (uint8_t *)&v15, 2u);
  }

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:@"VLFSessionDidStopNotification" object:0];

  id v7 = sub_100440F48();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Enabling idle timer", (uint8_t *)&v15, 2u);
  }

  id v8 = +[UIApplication sharedMapsDelegate];
  BOOL v9 = [v8 idleTimerController];
  [v9 setDesiredIdleTimerState:0 forReason:3];

  v10 = [v4 object];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = sub_1005762E4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315906;
      v16 = "-[VLFSessionTask vlfSessionDidStopNotification:]";
      __int16 v17 = 2080;
      v18 = "VLFSessionTask.m";
      __int16 v19 = 1024;
      int v20 = 412;
      __int16 v21 = 2080;
      v22 = "[session isKindOfClass:[VLFSession class]]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v15, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = +[NSThread callStackSymbols];
        int v15 = 138412290;
        v16 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[VLFSessionTask setWasLastLocalizationSuccessful:](self, "setWasLastLocalizationSuccessful:", [v10 wasLastLocalizationSuccessful]);
  }
  else
  {
    uint64_t v11 = sub_100440F48();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      v16 = (const char *)v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Notification object (%@), was not a VLFSession; ignoring",
        (uint8_t *)&v15,
        0xCu);
    }
  }
}

- (void)vlfContaineeViewControllerDidAppearNotification:(id)a3
{
  id v4 = sub_100440F48();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "VLF mode VC did appear", buf, 2u);
  }

  id v5 = [(VLFSessionTask *)self platformController];
  id v6 = [v5 chromeViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_100442554;
    __int16 v17 = &unk_1012E5D58;
    v18 = v8;
    __int16 v19 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v14);
    BOOL v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:self selector:"vlfContaineeViewControllerDidDisappearNotification:" name:off_1015F7850 object:0];

    v10 = v18;
  }
  else
  {
    uint64_t v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v21 = "-[VLFSessionTask vlfContaineeViewControllerDidAppearNotification:]";
      __int16 v22 = 2080;
      id v23 = "VLFSessionTask.m";
      __int16 v24 = 1024;
      int v25 = 426;
      __int16 v26 = 2080;
      long long v27 = "chromeVC != nil";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        __int16 v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    v10 = sub_100440F48();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "chromeVC was not an IOSBased one; ignoring",
        buf,
        2u);
    }
  }
}

- (void)vlfContaineeViewControllerDidDisappearNotification:(id)a3
{
  id v4 = sub_100440F48();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "VLF mode VC did disappear", buf, 2u);
  }

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:off_1015F7850 object:0];

  id v6 = [(VLFSessionTask *)self platformController];
  id v7 = [v6 chromeViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    unsigned int v10 = [(VLFSessionTask *)self wasLastLocalizationSuccessful];
    uint64_t v11 = [(VLFSessionTask *)self originalMapState];
    v12 = [(VLFSessionTask *)self originalUserState];
    id v13 = v12;
    memset(buf, 0, sizeof(buf));
    if (v12) {
      [v12 originalUserTrackingBehavior];
    }
    if ([v13 originalUserTrackingMode] || v10)
    {
      [v13 originalCenterCoordinateDistance];
      *(void *)&buf[8] = v14;
      buf[17] = 1;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100442C24;
    block[3] = &unk_1012EA608;
    id v23 = v11;
    id v15 = v9;
    long long v26 = *(_OWORD *)buf;
    uint64_t v27 = *(void *)&buf[16];
    id v24 = v15;
    id v25 = v13;
    char v28 = v10;
    id v16 = v13;
    id v17 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    [(VLFSessionTask *)self clearUserState];
    [(VLFSessionTask *)self clearMapState];
  }
  else
  {
    v18 = sub_1005762E4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[VLFSessionTask vlfContaineeViewControllerDidDisappearNotification:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "VLFSessionTask.m";
      *(_WORD *)&buf[22] = 1024;
      int v30 = 465;
      __int16 v31 = 2080;
      id v32 = "chromeVC != nil";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      __int16 v19 = sub_1005762E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v20 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    __int16 v21 = sub_100440F48();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "chromeVC was not an IOSBased one; ignoring",
        buf,
        2u);
    }
  }
}

- (void)vlfContaineeViewControllerWillCancelNotification:(id)a3
{
  id v4 = sub_100440F48();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "VLF will cancel", (uint8_t *)&v16, 2u);
  }

  id v5 = [(VLFSessionTask *)self platformController];
  id v6 = [v5 chromeViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [v8 mapView];
    id v10 = [v9 userTrackingMode];

    if (v10 == (id)2)
    {
      uint64_t v11 = [v8 mapView];
      [v11 setUserTrackingMode:1 animated:0];
    }
    v12 = [v8 mapView];
    [v12 setUserTrackingMode:0 animated:0];
  }
  else
  {
    id v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315906;
      id v17 = "-[VLFSessionTask vlfContaineeViewControllerWillCancelNotification:]";
      __int16 v18 = 2080;
      __int16 v19 = "VLFSessionTask.m";
      __int16 v20 = 1024;
      int v21 = 521;
      __int16 v22 = 2080;
      id v23 = "chromeVC != nil";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v16, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = +[NSThread callStackSymbols];
        int v16 = 138412290;
        id v17 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
      }
    }
    v12 = sub_100440F48();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "chromeVC was not an IOSBased one; ignoring",
        (uint8_t *)&v16,
        2u);
    }
  }
}

- (VLFSessionAnalyticsTracker)analyticsTracker
{
  return self->_analyticsTracker;
}

- (void)setAnalyticsTracker:(id)a3
{
}

- (VLFSessionStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (void)setPlatformController:(id)a3
{
}

- (NavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (BOOL)canShowVLFPuckUI
{
  return self->_canShowVLFPuckUI;
}

- (VLFSessionTaskUserState)originalUserState
{
  return self->_originalUserState;
}

- (void)setOriginalUserState:(id)a3
{
}

- (VLFSessionTaskMapState)originalMapState
{
  return self->_originalMapState;
}

- (void)setOriginalMapState:(id)a3
{
}

- (BOOL)wasLastLocalizationSuccessful
{
  return self->_wasLastLocalizationSuccessful;
}

- (void)setWasLastLocalizationSuccessful:(BOOL)a3
{
  self->_wasLastLocalizationSuccessful = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalMapState, 0);
  objc_storeStrong((id *)&self->_originalUserState, 0);
  objc_storeStrong((id *)&self->_navigationSession, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong((id *)&self->_stateManager, 0);

  objc_storeStrong((id *)&self->_analyticsTracker, 0);
}

@end