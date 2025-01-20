@interface PedestrianARDebugMapAnnotationsTask
+ (int64_t)creationPreference;
- (BOOL)_shouldProvideDebugAnnotations;
- (BOOL)didShowUndulationFailureAlert;
- (BOOL)isClusteringEnabled;
- (BOOL)isProvidingARAnnotations;
- (ChromeViewController)chromeViewController;
- (GEOObserverHashTable)observers;
- (MNNavigationService)navigationService;
- (NSArray)annotations;
- (NavigationSession)navigationSession;
- (PedestrianARDebugMapAnnotationsTask)initWithPlatformController:(id)a3 navigationService:(id)a4;
- (PedestrianARRenderingView)renderingView;
- (PlatformController)platformController;
- (UIButton)debugWarningBannerButton;
- (VKMapView)mapView;
- (id)_iOSMapView;
- (id)annotationsInMapRect:(id)a3;
- (id)clusterStyleAttributes;
- (id)globalAnnotations;
- (unsigned)sceneID;
- (unsigned)sceneState;
- (void)_startProvidingARAnnotationsIfNecessary;
- (void)_stopProvidingARAnnotations;
- (void)_updateDebugRouteAnnotations;
- (void)addObserver:(id)a3;
- (void)chromeViewController:(id)a3 didMoveFromContextStack:(id)a4 toContextStack:(id)a5;
- (void)dealloc;
- (void)featureSetStateDidChange:(id)a3 previous:(int64_t)a4 current:(int64_t)a5;
- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4;
- (void)mapLayer:(id)a3 activeARWalkingFeatureDidUpdate:(id)a4;
- (void)mapLayer:(id)a3 failedElevationRequestWithReason:(int64_t)a4;
- (void)mapLayer:(id)a3 updatedFeatures:(id)a4;
- (void)navigationSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4;
- (void)navigationSession:(id)a3 didUpdateRouteCollection:(id)a4;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)platformControllerDidChangeChromeViewControllerNotification:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAnnotations:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setDebugWarningBannerButton:(id)a3;
- (void)setDidShowUndulationFailureAlert:(BOOL)a3;
- (void)setNavigationService:(id)a3;
- (void)setNavigationSession:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPlatformController:(id)a3;
- (void)setRenderingView:(id)a3;
@end

@implementation PedestrianARDebugMapAnnotationsTask

+ (int64_t)creationPreference
{
  return 2;
}

- (PedestrianARDebugMapAnnotationsTask)initWithPlatformController:(id)a3 navigationService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v20 = sub_1005762E4();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v28 = "-[PedestrianARDebugMapAnnotationsTask initWithPlatformController:navigationService:]";
      __int16 v29 = 2080;
      v30 = "PedestrianARDebugMapAnnotationsTask.m";
      __int16 v31 = 1024;
      int v32 = 137;
      __int16 v33 = 2080;
      v34 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v21 = sub_1005762E4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v28 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v7)
  {
    v23 = sub_1005762E4();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v28 = "-[PedestrianARDebugMapAnnotationsTask initWithPlatformController:navigationService:]";
      __int16 v29 = 2080;
      v30 = "PedestrianARDebugMapAnnotationsTask.m";
      __int16 v31 = 1024;
      int v32 = 138;
      __int16 v33 = 2080;
      v34 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v24 = sub_1005762E4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v28 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)PedestrianARDebugMapAnnotationsTask;
  v8 = [(PedestrianARDebugMapAnnotationsTask *)&v26 init];
  if (v8)
  {
    v9 = sub_1006CBFE8();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v28 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeWeak((id *)&v8->_platformController, v6);
    objc_storeStrong((id *)&v8->_navigationService, a4);
    v10 = +[NSNotificationCenter defaultCenter];
    v11 = PlatformControllerDidChangeChromeViewControllerNotification;
    id WeakRetained = objc_loadWeakRetained((id *)&v8->_platformController);
    [v10 addObserver:v8 selector:"platformControllerDidChangeChromeViewControllerNotification:" name:v11 object:WeakRetained];

    id v13 = objc_loadWeakRetained((id *)&v8->_platformController);
    v14 = [v13 chromeViewController];
    [(PedestrianARDebugMapAnnotationsTask *)v8 setChromeViewController:v14];

    v15 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___VKCustomFeatureDataSourceObserver queue:0];
    observers = v8->_observers;
    v8->_observers = v15;

    v17 = (NSArray *)objc_alloc_init((Class)NSArray);
    annotations = v8->_annotations;
    v8->_annotations = v17;
  }
  return v8;
}

- (void)dealloc
{
  v3 = sub_1006CBFE8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)PedestrianARDebugMapAnnotationsTask;
  [(PedestrianARDebugMapAnnotationsTask *)&v4 dealloc];
}

- (VKMapView)mapView
{
  if ([(PedestrianARDebugMapAnnotationsTask *)self _shouldProvideDebugAnnotations])
  {
    v3 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];
    objc_super v4 = [v3 mapViewDelegate];
    v5 = [v4 mapView];
  }
  else
  {
    v5 = 0;
  }

  return (VKMapView *)v5;
}

- (BOOL)isProvidingARAnnotations
{
  v2 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setNavigationSession:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationSession);

  if (WeakRetained != v4)
  {
    id v6 = sub_1006CBFE8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = objc_loadWeakRetained((id *)&self->_navigationSession);
      int v10 = 134349570;
      v11 = self;
      __int16 v12 = 2112;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Transitioning from navigation session (%@) to (%@)", (uint8_t *)&v10, 0x20u);
    }
    id v8 = objc_loadWeakRetained((id *)&self->_navigationSession);
    [v8 removeObserver:self];

    id v9 = objc_storeWeak((id *)&self->_navigationSession, v4);
    [v4 addObserver:self];

    if ([(PedestrianARDebugMapAnnotationsTask *)self _shouldProvideDebugAnnotations]) {
      [(PedestrianARDebugMapAnnotationsTask *)self _startProvidingARAnnotationsIfNecessary];
    }
  }
}

- (void)setChromeViewController:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  if (WeakRetained != v4)
  {
    id v6 = sub_1006CBFE8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = objc_loadWeakRetained((id *)&self->_chromeViewController);
      int v13 = 134349570;
      __int16 v14 = self;
      __int16 v15 = 2112;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Transitioning from chrome VC (%@) to (%@)", (uint8_t *)&v13, 0x20u);
    }
    id v8 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    id v9 = [v8 mapView];
    int v10 = [v9 _mapLayer];
    [v10 removeCustomFeatureDataSource:self];

    id v11 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    [v11 removeContextStackObserver:self];

    id v12 = objc_storeWeak((id *)&self->_chromeViewController, v4);
    [v4 addContextStackObserver:self];

    [(PedestrianARDebugMapAnnotationsTask *)self _stopProvidingARAnnotations];
    if ([(PedestrianARDebugMapAnnotationsTask *)self _shouldProvideDebugAnnotations]) {
      [(PedestrianARDebugMapAnnotationsTask *)self _startProvidingARAnnotationsIfNecessary];
    }
  }
}

- (BOOL)_shouldProvideDebugAnnotations
{
  BOOL v3 = [(PedestrianARDebugMapAnnotationsTask *)self chromeViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(PedestrianARDebugMapAnnotationsTask *)self iosBasedChromeViewController];
    v5 = [v4 currentIOSBasedContext];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [(PedestrianARDebugMapAnnotationsTask *)self navigationSession];
      if (v6)
      {
        id v7 = [(PedestrianARDebugMapAnnotationsTask *)self navigationSession];
        BOOL v8 = [v7 currentTransportType] == (id)2;
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_startProvidingARAnnotationsIfNecessary
{
  if ([(PedestrianARDebugMapAnnotationsTask *)self _shouldProvideDebugAnnotations])
  {
    BOOL v3 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];

    if (v3)
    {
      id v4 = sub_1006CBFE8();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v101 = self;
        v5 = "[%{public}p] We already have a rendering view; will not start providing AR annotations again";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v5, buf, 0xCu);
      }
    }
    else
    {
      id v9 = +[MapsRadarController sharedInstance];
      [v9 addAttachmentProvider:self];

      int v10 = sub_1006CBFE8();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v101 = self;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Starting to provide AR annotations now", buf, 0xCu);
      }

      id v11 = [(PedestrianARDebugMapAnnotationsTask *)self _iOSMapView];
      [v11 addCustomFeatureDataSource:self];

      id v12 = [(PedestrianARDebugMapAnnotationsTask *)self iosBasedChromeViewController];
      v98 = [v12 currentIOSBasedContext];

      int v13 = [PedestrianARRenderingView alloc];
      __int16 v14 = [v98 guidanceObserver];
      __int16 v15 = [(PedestrianARDebugMapAnnotationsTask *)self navigationService];
      id v16 = [(PedestrianARRenderingView *)v13 initWithGuidanceObserver:v14 navigationService:v15];
      [(PedestrianARDebugMapAnnotationsTask *)self setRenderingView:v16];

      __int16 v17 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];
      id v18 = [v17 mapViewDelegate];
      [v18 registerObserver:self];

      v19 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];
      v20 = [v19 mapViewDelegate];
      v21 = [v20 mapView];
      [v21 setARMode:3];

      v22 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];
      v23 = [v22 mapViewDelegate];
      v24 = [v23 mapView];
      [v24 setARSceneType:0];

      v25 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];
      objc_super v26 = [v25 mapViewDelegate];
      v27 = [v26 mapView];
      [v27 setRendersInBackground:1];

      v28 = [(PedestrianARDebugMapAnnotationsTask *)self navigationSession];
      __int16 v29 = [v28 currentRouteCollection];
      v30 = [v29 currentRoute];
      __int16 v31 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];
      [v31 setRoute:v30];

      int v32 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];
      [v32 setShouldGenerateFeatures:1];

      __int16 v33 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];
      [v33 setShouldShowFeatures:1];

      v34 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];
      v35 = [v34 mapViewDelegate];
      v36 = [v35 mapView];
      [v36 setOpacity:0.0];

      v37 = [(PedestrianARDebugMapAnnotationsTask *)self iosBasedChromeViewController];
      v38 = [v37 view];
      v39 = [v38 layer];
      v40 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];
      v41 = [v40 mapViewDelegate];
      v42 = [v41 mapView];
      [v39 insertSublayer:v42 atIndex:0];

      v43 = [(PedestrianARDebugMapAnnotationsTask *)self iosBasedChromeViewController];
      v44 = [v43 view];
      v45 = [v44 window];
      [v45 frame];
      double v47 = v46;
      double v49 = v48;
      double v51 = v50;
      double v53 = v52;
      v54 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];
      v55 = [v54 mapViewDelegate];
      v56 = [v55 mapView];
      [v56 setBounds:v47, v49, v51, v53];

      id v57 = [objc_alloc((Class)UIButton) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      [(PedestrianARDebugMapAnnotationsTask *)self setDebugWarningBannerButton:v57];

      v58 = [(PedestrianARDebugMapAnnotationsTask *)self debugWarningBannerButton];
      [v58 setTranslatesAutoresizingMaskIntoConstraints:0];

      v59 = [(PedestrianARDebugMapAnnotationsTask *)self debugWarningBannerButton];
      v60 = +[UIAction actionWithHandler:&stru_1012F5280];
      [v59 addAction:v60 forControlEvents:64];

      v61 = +[UIColor redColor];
      v62 = [v61 colorWithAlphaComponent:0.600000024];
      v63 = [(PedestrianARDebugMapAnnotationsTask *)self debugWarningBannerButton];
      [v63 setBackgroundColor:v62];

      v64 = [(PedestrianARDebugMapAnnotationsTask *)self debugWarningBannerButton];
      [v64 setTitle:@"AR nav label simulation active. Tap to file radars." forState:0];

      v65 = [(PedestrianARDebugMapAnnotationsTask *)self debugWarningBannerButton];
      v66 = [v65 titleLabel];
      [v66 setAdjustsFontSizeToFitWidth:1];

      v67 = [(PedestrianARDebugMapAnnotationsTask *)self debugWarningBannerButton];
      v68 = [v67 titleLabel];
      [v68 setMinimumScaleFactor:0.0];

      v69 = +[UIColor whiteColor];
      v70 = [(PedestrianARDebugMapAnnotationsTask *)self debugWarningBannerButton];
      v71 = [v70 titleLabel];
      [v71 setTextColor:v69];

      v72 = [(PedestrianARDebugMapAnnotationsTask *)self debugWarningBannerButton];
      v73 = [v72 layer];
      [v73 setZPosition:3.40282347e38];

      v74 = [(PedestrianARDebugMapAnnotationsTask *)self iosBasedChromeViewController];
      v75 = [v74 view];
      v76 = [(PedestrianARDebugMapAnnotationsTask *)self debugWarningBannerButton];
      [v75 addSubview:v76];

      v97 = [(PedestrianARDebugMapAnnotationsTask *)self debugWarningBannerButton];
      v95 = [v97 leadingAnchor];
      v96 = [(PedestrianARDebugMapAnnotationsTask *)self iosBasedChromeViewController];
      v94 = [v96 view];
      v93 = [v94 leadingAnchor];
      v92 = [v95 constraintEqualToAnchor:v93];
      v99[0] = v92;
      v91 = [(PedestrianARDebugMapAnnotationsTask *)self debugWarningBannerButton];
      v89 = [v91 trailingAnchor];
      v90 = [(PedestrianARDebugMapAnnotationsTask *)self iosBasedChromeViewController];
      v88 = [v90 view];
      v87 = [v88 trailingAnchor];
      v77 = [v89 constraintEqualToAnchor:v87];
      v99[1] = v77;
      v78 = [(PedestrianARDebugMapAnnotationsTask *)self debugWarningBannerButton];
      v79 = [v78 topAnchor];
      v80 = [(PedestrianARDebugMapAnnotationsTask *)self iosBasedChromeViewController];
      v81 = [v80 view];
      v82 = [v81 safeAreaLayoutGuide];
      v83 = [v82 topAnchor];
      v84 = [v79 constraintEqualToAnchor:v83];
      v99[2] = v84;
      v85 = +[NSArray arrayWithObjects:v99 count:3];
      +[NSLayoutConstraint activateConstraints:v85];

      v86 = [(PedestrianARDebugMapAnnotationsTask *)self observers];
      [v86 globalFeaturesDidChangeForDataSource:self];

      id v4 = v98;
    }
  }
  else
  {
    id v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v101 = (PedestrianARDebugMapAnnotationsTask *)"-[PedestrianARDebugMapAnnotationsTask _startProvidingARAnnotationsIfNecessary]";
      __int16 v102 = 2080;
      v103 = "PedestrianARDebugMapAnnotationsTask.m";
      __int16 v104 = 1024;
      int v105 = 224;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      id v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        BOOL v8 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v101 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    id v4 = sub_1006CBFE8();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v101 = self;
      v5 = "[%{public}p] Cannot provide AR annotations";
      goto LABEL_13;
    }
  }
}

- (void)_stopProvidingARAnnotations
{
  BOOL v3 = sub_1006CBFE8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v9 = 134349056;
    int v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Stop providing AR annotations", (uint8_t *)&v9, 0xCu);
  }

  id v4 = +[MapsRadarController sharedInstance];
  [v4 removeAttachmentProvider:self];

  [(PedestrianARDebugMapAnnotationsTask *)self setRenderingView:0];
  v5 = [(PedestrianARDebugMapAnnotationsTask *)self debugWarningBannerButton];
  [v5 removeFromSuperview];

  [(PedestrianARDebugMapAnnotationsTask *)self setDebugWarningBannerButton:0];
  id v6 = [(PedestrianARDebugMapAnnotationsTask *)self _iOSMapView];
  [v6 removeCustomFeatureDataSource:self];
  id v7 = [v6 routeContext];
  BOOL v8 = [v7 routeInfo];
  [v8 setDebugAnnotations:0];
}

- (id)_iOSMapView
{
  v2 = [(PedestrianARDebugMapAnnotationsTask *)self iosBasedChromeViewController];
  BOOL v3 = [v2 mapView];
  id v4 = [v3 _mapLayer];

  return v4;
}

- (void)_updateDebugRouteAnnotations
{
  if ([(PedestrianARDebugMapAnnotationsTask *)self _shouldProvideDebugAnnotations])
  {
    BOOL v3 = [(PedestrianARDebugMapAnnotationsTask *)self annotations];
    id v4 = sub_1000990A8(v3, &stru_1012F52C0);

    if (!v4)
    {
LABEL_38:

      return;
    }
    v5 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];
    id v6 = [v5 mapViewDelegate];
    id v7 = [v4 labelMarker];
    BOOL v8 = [v7 arWalkingFeature];
    int v9 = [v6 guidanceInfoForFeature:v8];

    int v10 = [v4 labelMarker];
    id v11 = [v10 arWalkingFeature];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    int v13 = [v4 labelMarker];
    __int16 v14 = [v13 arWalkingFeature];
    objc_opt_class();
    char v15 = objc_opt_isKindOfClass();

    id v16 = [v4 labelMarker];
    [v16 facingDirection];
    float v18 = v17;

    CFStringRef v19 = @"N";
    if (v18 < 337.5 && v18 >= 22.5)
    {
      if (v18 >= 67.5)
      {
        if (v18 >= 112.5)
        {
          if (v18 >= 157.5)
          {
            if (v18 >= 202.5)
            {
              if (v18 >= 247.5)
              {
                if (v18 >= 292.5 || v18 < 247.5) {
                  CFStringRef v19 = @"NW";
                }
                else {
                  CFStringRef v19 = @"W";
                }
              }
              else
              {
                CFStringRef v19 = @"SW";
              }
            }
            else
            {
              CFStringRef v19 = @"S";
            }
          }
          else
          {
            CFStringRef v19 = @"SE";
          }
        }
        else
        {
          CFStringRef v19 = @"E";
        }
      }
      else
      {
        CFStringRef v19 = @"NE";
      }
    }
    id v57 = v9;
    if (isKindOfClass)
    {
      v21 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];
      v22 = [v21 route];
      v23 = [v22 legs];
      v24 = [v23 lastObject];

      v25 = [v24 destinationDisplayInfo];
      objc_super v26 = [v25 arInfo];

      v27 = [v26 storefrontFaceGeometrys];
      id v28 = [v27 count];

      __int16 v29 = +[NSUserDefaults standardUserDefaults];
      unsigned int v30 = [v29 BOOLForKey:@"PedestrianARInjectFakeStorefrontArrivalDataKey"];

      CFStringRef v31 = @"Non-AARL";
      if (v30) {
        CFStringRef v31 = @"Fake-AARL";
      }
      if (v28) {
        CFStringRef v32 = @"AARL";
      }
      else {
        CFStringRef v32 = v31;
      }
      __int16 v33 = [v9 arrowLabel];

      if (v33)
      {
        v34 = [v9 arrowLabel];
        v35 = +[NSString stringWithFormat:@"%@\n%@", v32, v34];
      }
      else
      {
        v35 = +[NSString stringWithFormat:@"%@", v32];
      }
    }
    else
    {
      v36 = [v9 arrowLabel];

      if (v15) {
        CFStringRef v37 = @"CARL";
      }
      else {
        CFStringRef v37 = @"MARL";
      }
      if (!v36)
      {
        v35 = +[NSString stringWithFormat:@"%@ - %@", v37, v19];
        goto LABEL_37;
      }
      v24 = [v9 arrowLabel];
      v35 = +[NSString stringWithFormat:@"%@ - %@\n%@", v37, v19, v24];
    }

LABEL_37:
    v38 = [v4 labelMarker];
    v39 = [v38 arWalkingFeature];
    unsigned int v40 = [v4 isOccluded];
    id v41 = v39;
    id v42 = objc_alloc((Class)GEOFeatureStyleAttributes);
    id v43 = [v41 type];

    id v44 = [v42 initWithAttributes:65632, v43, 150, 1, 65594, v40, 0];
    v45 = [(PedestrianARDebugMapAnnotationsTask *)self _iOSMapView];
    double v46 = [v45 routeContext];

    double v47 = [v46 routeInfo];
    double v48 = [v47 route];

    id v49 = [objc_alloc((Class)GEORouteMatcher) initWithRoute:v48 auditToken:0];
    [v4 coordinate];
    double v51 = v50;
    [v4 coordinate];
    id v52 = [v49 closestRouteCoordinateForLocationCoordinate:v51];
    id v53 = [objc_alloc((Class)VKRouteEtaDescription) initWithEtaText:v35 etaAdvisoryFeatureStyleAttributes:v44 routeEtaType:6];
    id v54 = [objc_alloc((Class)VKRouteRangeAnnotationInfo) initWithEtaDescription:v53 start:v52 end:v52];
    id v58 = v54;
    v55 = +[NSArray arrayWithObjects:&v58 count:1];
    v56 = [v46 routeInfo];
    [v56 setDebugAnnotations:v55];

    goto LABEL_38;
  }
}

- (void)navigationSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4
{
  if (a4 != 2)
  {
    v5 = sub_1006CBFE8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 134349056;
      id v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Navigation changed transport type to non-walking", (uint8_t *)&v6, 0xCu);
    }

    [(PedestrianARDebugMapAnnotationsTask *)self _stopProvidingARAnnotations];
  }
}

- (void)navigationSession:(id)a3 didUpdateRouteCollection:(id)a4
{
  id v5 = a4;
  [(PedestrianARDebugMapAnnotationsTask *)self _stopProvidingARAnnotations];
  id v8 = [v5 currentRoute];

  if ([v8 transportType] == 2)
  {
    unsigned int v6 = [(PedestrianARDebugMapAnnotationsTask *)self _shouldProvideDebugAnnotations];

    if (v6)
    {
      id v7 = sub_1006CBFE8();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        int v10 = self;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Navigation re-routed and the new route's transport type is walking", buf, 0xCu);
      }

      [(PedestrianARDebugMapAnnotationsTask *)self _startProvidingARAnnotationsIfNecessary];
    }
  }
  else
  {
  }
}

- (id)globalAnnotations
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v4 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];
  id v5 = [v4 mapViewDelegate];
  unsigned int v6 = [v5 mapView];
  id v7 = [v6 labelMarkers];

  id obj = v7;
  id v8 = [v7 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v45;
    v39 = self;
    unsigned int v40 = v3;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if ([v12 isARWalkingFeature])
        {
          int v13 = [v12 arWalkingFeature];

          if (v13)
          {
            __int16 v14 = [v12 arWalkingFeature];
            char v15 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];
            id v16 = [v15 mapViewDelegate];
            float v17 = [v16 currentFeature];

            if (v14 == v17)
            {
              id v19 = [v12 featureLabelIdentifier];
              v20 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];
              v21 = [v20 mapViewDelegate];
              BOOL v18 = v19 == [v21 currentIdentifier];
            }
            else
            {
              BOOL v18 = 0;
            }
            v22 = [(PedestrianARDebugMapAnnotationsTask *)self annotations];
            v42[0] = _NSConcreteStackBlock;
            v42[1] = 3221225472;
            v42[2] = sub_1006CDE64;
            v42[3] = &unk_1012F52E8;
            v42[4] = v12;
            BOOL v43 = v18;
            sub_1000990A8(v22, v42);
            v23 = (PedestrianARCustomFeatureAnnotation *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              v24 = sub_1006CBFE8();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                v25 = [(PedestrianARCustomFeatureAnnotation *)v23 debugDescription];
                *(_DWORD *)buf = 134349314;
                id v49 = self;
                __int16 v50 = 2112;
                double v51 = v25;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}p] Found cached annotation: %@", buf, 0x16u);
              }
            }
            else
            {
              id v26 = objc_alloc((Class)VKCustomFeature);
              [v12 coordinate3D];
              v24 = [v26 initWithCoordinate3D:];
              [v24 setDataSource:self];
              v23 = [[PedestrianARCustomFeatureAnnotation alloc] initWithCustomFeature:v24 labelMarker:v12 isActive:v18];
              v27 = sub_1006CBFE8();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                id v28 = [(PedestrianARCustomFeatureAnnotation *)v23 debugDescription];
                *(_DWORD *)buf = 134349314;
                id v49 = self;
                __int16 v50 = 2112;
                double v51 = v28;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "[%{public}p] Annotation was not present in cache; created a new one: %@",
                  buf,
                  0x16u);
              }
            }

            __int16 v29 = [(PedestrianARCustomFeatureAnnotation *)v23 feature];
            unsigned int v30 = [v12 arWalkingFeature];
            unsigned int v31 = [v12 isOccluded];
            id v32 = v30;
            id v33 = objc_alloc((Class)GEOFeatureStyleAttributes);
            id v34 = [v32 type];

            id v35 = [v33 initWithAttributes:5, 3, 65632, v34, 65538, v18, 150, 1, 65594, v31, 0];
            [v29 setStyleAttributes:v35];
            id v3 = v40;
            [v40 addObject:v23];

            self = v39;
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v9);
  }

  v36 = self;
  id v37 = [v3 copy];
  [(PedestrianARDebugMapAnnotationsTask *)v36 setAnnotations:v37];

  [(PedestrianARDebugMapAnnotationsTask *)v36 _updateDebugRouteAnnotations];

  return v3;
}

- (id)annotationsInMapRect:(id)a3
{
  return &__NSArray0__struct;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PedestrianARDebugMapAnnotationsTask *)self observers];
  [v5 registerObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PedestrianARDebugMapAnnotationsTask *)self observers];
  [v5 unregisterObserver:v4];
}

- (id)clusterStyleAttributes
{
  return 0;
}

- (BOOL)isClusteringEnabled
{
  return 0;
}

- (unsigned)sceneID
{
  return 0;
}

- (unsigned)sceneState
{
  return 1;
}

- (void)featureSetStateDidChange:(id)a3 previous:(int64_t)a4 current:(int64_t)a5
{
  id v10 = a3;
  unsigned int v6 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];
  id v7 = [v6 mapViewDelegate];
  id v8 = [v7 currentFeatureSet];

  if (v8 == v10)
  {
    id v9 = [(PedestrianARDebugMapAnnotationsTask *)self observers];
    [v9 globalFeaturesDidChangeForDataSource:self];
  }
  else
  {
    [v10 removeObserver:self];
  }
}

- (void)mapLayer:(id)a3 updatedFeatures:(id)a4
{
  id v5 = a4;
  unsigned int v6 = sub_1006CBFE8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v11 = 134349314;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] VKMapView updated features: %@", (uint8_t *)&v11, 0x16u);
  }

  id v7 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];
  id v8 = [v7 mapViewDelegate];
  id v9 = [v8 currentFeatureSet];
  [v9 addObserver:self];

  id v10 = [(PedestrianARDebugMapAnnotationsTask *)self observers];
  [v10 globalFeaturesDidChangeForDataSource:self];
}

- (void)mapLayer:(id)a3 activeARWalkingFeatureDidUpdate:(id)a4
{
  id v5 = a4;
  unsigned int v6 = sub_1006CBFE8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v11 = 134349314;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] VKMapView updated the active feature: %@", (uint8_t *)&v11, 0x16u);
  }

  id v7 = [(PedestrianARDebugMapAnnotationsTask *)self renderingView];
  id v8 = [v7 mapViewDelegate];
  id v9 = [v8 currentFeatureSet];
  [v9 addObserver:self];

  id v10 = [(PedestrianARDebugMapAnnotationsTask *)self observers];
  [v10 globalFeaturesDidChangeForDataSource:self];
}

- (void)mapLayer:(id)a3 failedElevationRequestWithReason:(int64_t)a4
{
  unsigned int v6 = sub_1006CBFE8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v20 = self;
    __int16 v21 = 2048;
    int64_t v22 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] An elevation request failed with reason: %ld", buf, 0x16u);
  }

  if (![(PedestrianARDebugMapAnnotationsTask *)self didShowUndulationFailureAlert])
  {
    [(PedestrianARDebugMapAnnotationsTask *)self setDidShowUndulationFailureAlert:1];
    id v7 = objc_opt_new();
    [v7 setTitle:@"[AR Nav Label Simulator] Elevation lookup failure"];
    id v8 = +[NSString stringWithFormat:@"AR walking elevation request failed with reason: %ld", a4];
    [v7 setDescriptionText:v8];

    [v7 setClassification:6];
    id v9 = +[MapsRadarComponent mapsAppNavUIWalkingComponent];
    [v7 setComponent:v9];

    id v10 = sub_1006CBFE8();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      float v17 = +[MapsRadarController sharedInstance];
      BOOL v18 = [(PedestrianARDebugMapAnnotationsTask *)self chromeViewController];
      [v17 launchTTRWithRadar:v7 promptTitle:@"there was an error while looking up the elevation of an AR label" fromViewController:v18];

      return;
    }
    int v11 = self;
    if (!v11)
    {
      id v16 = @"<nil>";
      goto LABEL_13;
    }
    id v12 = (objc_class *)objc_opt_class();
    __int16 v13 = NSStringFromClass(v12);
    if (objc_opt_respondsToSelector())
    {
      id v14 = [(PedestrianARDebugMapAnnotationsTask *)v11 performSelector:"accessibilityIdentifier"];
      char v15 = v14;
      if (v14 && ![v14 isEqualToString:v13])
      {
        id v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

        goto LABEL_11;
      }
    }
    id v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_11:

LABEL_13:
    *(_DWORD *)buf = 138543362;
    v20 = (PedestrianARDebugMapAnnotationsTask *)v16;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Launching TTR for elevation request failure", buf, 0xCu);

    goto LABEL_14;
  }
}

- (void)chromeViewController:(id)a3 didMoveFromContextStack:(id)a4 toContextStack:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_1006CBFE8();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 134349570;
    int v11 = self;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Chrome VC moved from stack: %@ to stack: %@", (uint8_t *)&v10, 0x20u);
  }

  [(PedestrianARDebugMapAnnotationsTask *)self _stopProvidingARAnnotations];
  if ([(PedestrianARDebugMapAnnotationsTask *)self _shouldProvideDebugAnnotations]) {
    [(PedestrianARDebugMapAnnotationsTask *)self _startProvidingARAnnotationsIfNecessary];
  }
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v6 = v8;
  }
  else {
    unsigned int v6 = 0;
  }
  id v7 = v6;
  [(PedestrianARDebugMapAnnotationsTask *)self setNavigationSession:v7];
}

- (void)platformControllerDidChangeChromeViewControllerNotification:(id)a3
{
  id v5 = [(PedestrianARDebugMapAnnotationsTask *)self platformController];
  id v4 = [v5 chromeViewController];
  [(PedestrianARDebugMapAnnotationsTask *)self setChromeViewController:v4];
}

- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006CE8B4;
  block[3] = &unk_1012E80F0;
  block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (void)setPlatformController:(id)a3
{
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
}

- (NavigationSession)navigationSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationSession);

  return (NavigationSession *)WeakRetained;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (PedestrianARRenderingView)renderingView
{
  return self->_renderingView;
}

- (void)setRenderingView:(id)a3
{
}

- (UIButton)debugWarningBannerButton
{
  return self->_debugWarningBannerButton;
}

- (void)setDebugWarningBannerButton:(id)a3
{
}

- (BOOL)didShowUndulationFailureAlert
{
  return self->_didShowUndulationFailureAlert;
}

- (void)setDidShowUndulationFailureAlert:(BOOL)a3
{
  self->_didShowUndulationFailureAlert = a3;
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_debugWarningBannerButton, 0);
  objc_storeStrong((id *)&self->_renderingView, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_destroyWeak((id *)&self->_navigationSession);
  objc_storeStrong((id *)&self->_navigationService, 0);

  objc_destroyWeak((id *)&self->_platformController);
}

@end