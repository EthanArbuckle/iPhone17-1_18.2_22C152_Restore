@interface PedestrianARViewController
- (ARConfiguration)configuration;
- (ARSession)session;
- (AuxiliaryTasksManager)auxiliaryTasksManager;
- (BOOL)_canShowWhileLocked;
- (BOOL)allowsDisplayOnLockScreen;
- (BOOL)didFailUndulationLookup;
- (BOOL)didRenderLabel;
- (BOOL)didShowVLTracePopup;
- (BOOL)isARSessionBeingRecorded;
- (BOOL)isARSessionReplayingFromRecording;
- (BOOL)isDismissing;
- (BOOL)isRerouteNecessary;
- (BOOL)isRerouting;
- (BOOL)isShowingFailureView;
- (BOOL)isStopping;
- (BOOL)isWaitingForActiveFeature;
- (BOOL)sentDisappearNotification;
- (BOOL)shouldUpdateCameraFocusLensPosition;
- (BOOL)supportsEmptyStack;
- (GCDTimer)activeFeatureTimer;
- (GCDTimer)failureViewTimeoutTimer;
- (GCDTimer)rerouteCompletionTimer;
- (GEOComposedRoute)route;
- (GuidanceObserver)guidanceObserver;
- (MNNavigationService)navigationService;
- (MUBlurView)closeButton;
- (NSDate)arkitSessionStartTimestamp;
- (NSLayoutConstraint)arrowGuidanceViewLeadingConstraint;
- (NSLayoutConstraint)arrowGuidanceViewLeadingSafeAreaConstraint;
- (NSLayoutConstraint)arrowGuidanceViewTrailingConstraint;
- (NSLayoutConstraint)arrowGuidanceViewTrailingSafeAreaConstraint;
- (NSLayoutConstraint)closeButtonSafeAreaTrailingConstraint;
- (NSLayoutConstraint)closeButtonTopConstraint;
- (NSLayoutConstraint)closeButtonTrailingConstraint;
- (NavigationSession)navigationSession;
- (OS_os_activity)activity;
- (PedestrianARArrowGuidanceView)arrowGuidanceView;
- (PedestrianARFailureContaineeViewController)failureContainee;
- (PedestrianARGradientOverlay)gradientOverlay;
- (PedestrianARInstructionContainerView)instructionContainerView;
- (PedestrianARLocalizingView)localizingView;
- (PedestrianARRenderingView)renderingView;
- (PedestrianARSafetyView)safetyView;
- (PedestrianARViewController)initWithRoute:(id)a3 platformController:(id)a4 guidanceObserver:(id)a5 navigationService:(id)a6;
- (PedestrianARViewControllerDelegate)arDelegate;
- (PlatformController)platformController;
- (UIButton)ttrButton;
- (UINotificationFeedbackGenerator)notificationGenerator;
- (VLFSession)vlfSession;
- (id)mapView;
- (int)analyticsTarget;
- (int64_t)entryPoint;
- (int64_t)state;
- (unint64_t)supportedInterfaceOrientations;
- (void)VLFSessionLocalizationFailedWithError:(id)a3;
- (void)VLFSessionLocalizationSucceeded;
- (void)_updateConstraintsForLandscape:(BOOL)a3;
- (void)applicationDidEnterBackgroundNotification:(id)a3;
- (void)applyTransitionWithProgress:(double)a3;
- (void)cancelReroute;
- (void)cancelWaitingForActiveFeature;
- (void)closeButtonTapped:(id)a3;
- (void)createViews;
- (void)dealloc;
- (void)didResignContainee:(id)a3 finished:(BOOL)a4;
- (void)disableIdleTimer;
- (void)enableIdleTimer;
- (void)failureViewDismissButtonTapped:(id)a3;
- (void)failureViewRetryButtonTapped:(id)a3;
- (void)hideArrowGuidanceView;
- (void)hideFailureView;
- (void)hideInstructionView;
- (void)hideSafetyView;
- (void)mapLayer:(id)a3 activeARWalkingFeatureDidUpdate:(id)a4;
- (void)mapLayer:(id)a3 failedElevationRequestWithReason:(int64_t)a4;
- (void)mapLayer:(id)a3 updatedFeatures:(id)a4;
- (void)navigationSession:(id)a3 didUpdateRouteCollection:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)playFailureHaptic;
- (void)playSuccessHaptic;
- (void)replayConfigurationDidFinishReplaying:(id)a3;
- (void)reroute;
- (void)resetAnalytics;
- (void)session:(id)a3 didChangeGeoTrackingStatus:(id)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)sessionManager:(id)a3 didGainSessionOwnership:(id)a4;
- (void)sessionManager:(id)a3 didResignSessionOwnership:(id)a4;
- (void)setActiveFeatureTimer:(id)a3;
- (void)setActivity:(id)a3;
- (void)setArDelegate:(id)a3;
- (void)setArkitSessionStartTimestamp:(id)a3;
- (void)setArrowGuidanceView:(id)a3;
- (void)setArrowGuidanceViewLeadingConstraint:(id)a3;
- (void)setArrowGuidanceViewLeadingSafeAreaConstraint:(id)a3;
- (void)setArrowGuidanceViewTrailingConstraint:(id)a3;
- (void)setArrowGuidanceViewTrailingSafeAreaConstraint:(id)a3;
- (void)setAuxiliaryTasksManager:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setCloseButtonSafeAreaTrailingConstraint:(id)a3;
- (void)setCloseButtonTopConstraint:(id)a3;
- (void)setCloseButtonTrailingConstraint:(id)a3;
- (void)setDidFailUndulationLookup:(BOOL)a3;
- (void)setDidRenderLabel:(BOOL)a3;
- (void)setDidShowVLTracePopup:(BOOL)a3;
- (void)setFailureContainee:(id)a3;
- (void)setFailureViewTimeoutTimer:(id)a3;
- (void)setGradientOverlay:(id)a3;
- (void)setGuidanceObserver:(id)a3;
- (void)setInstructionContainerView:(id)a3;
- (void)setIsDismissing:(BOOL)a3;
- (void)setIsStopping:(BOOL)a3;
- (void)setLocalizingView:(id)a3;
- (void)setNavigationService:(id)a3;
- (void)setNavigationSession:(id)a3;
- (void)setNotificationGenerator:(id)a3;
- (void)setPlatformController:(id)a3;
- (void)setRenderingView:(id)a3;
- (void)setRerouteCompletionTimer:(id)a3;
- (void)setRoute:(id)a3;
- (void)setSafetyView:(id)a3;
- (void)setSentDisappearNotification:(BOOL)a3;
- (void)setShouldUpdateCameraFocusLensPosition:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setTtrButton:(id)a3;
- (void)setVlfSession:(id)a3;
- (void)showArrowGuidanceView;
- (void)showFailureView;
- (void)showInstructionView;
- (void)showSafetyView;
- (void)showVLTracePopupIfNecessaryWithCompletion:(id)a3;
- (void)start;
- (void)startFailureViewTimeoutTimer;
- (void)stop;
- (void)stopFailureViewTimeoutTimer;
- (void)ttrButtonTapped:(id)a3;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)vlfSessionDidGetFirstFrameNotification:(id)a3;
- (void)waitForActiveFeatureIfNecessary;
@end

@implementation PedestrianARViewController

- (PedestrianARViewController)initWithRoute:(id)a3 platformController:(id)a4 guidanceObserver:(id)a5 navigationService:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    v30 = sub_1005762E4();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v52 = "-[PedestrianARViewController initWithRoute:platformController:guidanceObserver:navigationService:]";
      __int16 v53 = 2080;
      v54 = "PedestrianARViewController.m";
      __int16 v55 = 1024;
      int v56 = 146;
      __int16 v57 = 2080;
      v58 = "route != nil";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v31 = sub_1005762E4();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v52 = (const char *)v32;
        v33 = (void *)v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v11)
  {
    v34 = sub_1005762E4();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v52 = "-[PedestrianARViewController initWithRoute:platformController:guidanceObserver:navigationService:]";
      __int16 v53 = 2080;
      v54 = "PedestrianARViewController.m";
      __int16 v55 = 1024;
      int v56 = 147;
      __int16 v57 = 2080;
      v58 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v35 = sub_1005762E4();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v52 = (const char *)v36;
        v37 = (void *)v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v12)
  {
    v38 = sub_1005762E4();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v52 = "-[PedestrianARViewController initWithRoute:platformController:guidanceObserver:navigationService:]";
      __int16 v53 = 2080;
      v54 = "PedestrianARViewController.m";
      __int16 v55 = 1024;
      int v56 = 148;
      __int16 v57 = 2080;
      v58 = "guidanceObserver != nil";
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v39 = sub_1005762E4();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v52 = (const char *)v40;
        v41 = (void *)v40;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v13)
  {
    v42 = sub_1005762E4();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v52 = "-[PedestrianARViewController initWithRoute:platformController:guidanceObserver:navigationService:]";
      __int16 v53 = 2080;
      v54 = "PedestrianARViewController.m";
      __int16 v55 = 1024;
      int v56 = 149;
      __int16 v57 = 2080;
      v58 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v43 = sub_1005762E4();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        uint64_t v44 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v52 = (const char *)v44;
        v45 = (void *)v44;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v50.receiver = self;
  v50.super_class = (Class)PedestrianARViewController;
  v14 = [(ContainerViewController *)&v50 initWithNibName:0 bundle:0];
  if (v14)
  {
    os_activity_t v15 = _os_activity_create((void *)&_mh_execute_header, "Pedestrian AR Session", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DETACHED);
    [(PedestrianARViewController *)v14 setActivity:v15];

    v16 = [(PedestrianARViewController *)v14 activity];
    os_activity_scope_enter(v16, &v49);

    v17 = sub_1009E7C9C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v52 = (const char *)v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 postNotificationName:@"PedestrianARViewControllerDidAppearNotification" object:v14];

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v14 selector:"applicationDidEnterBackgroundNotification:" name:UIApplicationDidEnterBackgroundNotification object:0];

    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v14 selector:"vlfSessionDidGetFirstFrameNotification:" name:@"VLFSessionDidGetFirstFrameNotification" object:0];

    v21 = +[NSUserDefaults standardUserDefaults];
    [v21 addObserver:v14 forKeyPath:@"PedestrianARAutoFocusDistanceKey" options:0 context:0];

    objc_storeWeak((id *)&v14->_platformController, v11);
    objc_storeStrong((id *)&v14->_guidanceObserver, a5);
    objc_storeStrong((id *)&v14->_navigationService, a6);
    id WeakRetained = objc_loadWeakRetained((id *)&v14->_platformController);
    v23 = [WeakRetained currentSession];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v24 = v23;
    }
    else {
      v24 = 0;
    }
    v25 = v24;

    navigationSession = v14->_navigationSession;
    v14->_navigationSession = v25;

    if (!v14->_navigationSession)
    {
      v46 = sub_1005762E4();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v52 = "-[PedestrianARViewController initWithRoute:platformController:guidanceObserver:navigationService:]";
        __int16 v53 = 2080;
        v54 = "PedestrianARViewController.m";
        __int16 v55 = 1024;
        int v56 = 170;
        __int16 v57 = 2080;
        v58 = "_navigationSession != nil";
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100BB36BC())
      {
        v47 = sub_1005762E4();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v48 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v52 = v48;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
    v14->_entryPoint = (id)[(NavigationSession *)v14->_navigationSession guidanceType] != (id)2;
    [(NavigationSession *)v14->_navigationSession addObserver:v14];
    v27 = (UINotificationFeedbackGenerator *)objc_alloc_init((Class)UINotificationFeedbackGenerator);
    notificationGenerator = v14->_notificationGenerator;
    v14->_notificationGenerator = v27;

    [(PedestrianARViewController *)v14 setRoute:v10];
    [(PedestrianARViewController *)v14 createViews];
    [(PedestrianARViewController *)v14 start];
    os_activity_scope_leave(&v49);
  }

  return v14;
}

- (void)dealloc
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v3, &state);

  v4 = sub_1009E7C9C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    id v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocing", buf, 0xCu);
  }

  v5 = [(PedestrianARViewController *)self session];
  [v5 _removeObserver:self];

  v6 = +[MapsARSessionManager sharedManager];
  [v6 resignSessionWithOwner:self];

  [(NavigationSession *)self->_navigationSession removeObserver:self];
  v7 = [(PedestrianARViewController *)self safetyView];
  [v7 didEndARSession];

  [(PedestrianARViewController *)self enableIdleTimer];
  if (!self->_sentDisappearNotification)
  {
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"PedestrianARViewControllerDidDisappearNotification" object:self];
  }
  v9 = +[NSUserDefaults standardUserDefaults];
  [v9 removeObserver:self forKeyPath:@"PedestrianARAutoFocusDistanceKey"];

  os_activity_scope_leave(&state);
  v10.receiver = self;
  v10.super_class = (Class)PedestrianARViewController;
  [(PedestrianARViewController *)&v10 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v161.receiver = self;
  v161.super_class = (Class)PedestrianARViewController;
  [(ContainerViewController *)&v161 viewDidLoad];
  [(PedestrianARViewController *)self setOverrideUserInterfaceStyle:2];
  v160 = +[NSMutableArray array];
  v3 = [(PedestrianARViewController *)self view];
  renderingView = self->_renderingView;
  v5 = [(ContainerViewController *)self containerView];
  [v3 insertSubview:renderingView belowSubview:v5];

  v149 = [(PedestrianARRenderingView *)self->_renderingView leadingAnchor];
  v154 = [(PedestrianARViewController *)self view];
  v144 = [v154 leadingAnchor];
  v139 = [v149 constraintEqualToAnchor:v144];
  v168[0] = v139;
  v129 = [(PedestrianARRenderingView *)self->_renderingView trailingAnchor];
  v134 = [(PedestrianARViewController *)self view];
  v124 = [v134 trailingAnchor];
  v120 = [v129 constraintEqualToAnchor:v124];
  v168[1] = v120;
  v6 = [(PedestrianARRenderingView *)self->_renderingView topAnchor];
  v7 = [(PedestrianARViewController *)self view];
  v8 = [v7 topAnchor];
  v9 = [v6 constraintEqualToAnchor:v8];
  v168[2] = v9;
  objc_super v10 = [(PedestrianARRenderingView *)self->_renderingView bottomAnchor];
  id v11 = [(PedestrianARViewController *)self view];
  id v12 = [v11 bottomAnchor];
  id v13 = [v10 constraintEqualToAnchor:v12];
  v168[3] = v13;
  v14 = +[NSArray arrayWithObjects:v168 count:4];
  [v160 addObjectsFromArray:v14];

  os_activity_t v15 = [(PedestrianARViewController *)self view];
  gradientOverlay = self->_gradientOverlay;
  v17 = [(ContainerViewController *)self containerView];
  [v15 insertSubview:gradientOverlay belowSubview:v17];

  v150 = [(PedestrianARGradientOverlay *)self->_gradientOverlay leadingAnchor];
  v155 = [(PedestrianARViewController *)self view];
  v145 = [v155 leadingAnchor];
  v140 = [v150 constraintEqualToAnchor:v145];
  v167[0] = v140;
  v130 = [(PedestrianARGradientOverlay *)self->_gradientOverlay trailingAnchor];
  v135 = [(PedestrianARViewController *)self view];
  v125 = [v135 trailingAnchor];
  v121 = [v130 constraintEqualToAnchor:v125];
  v167[1] = v121;
  v18 = [(PedestrianARGradientOverlay *)self->_gradientOverlay topAnchor];
  v19 = [(PedestrianARViewController *)self view];
  v20 = [v19 topAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  v167[2] = v21;
  v22 = [(PedestrianARGradientOverlay *)self->_gradientOverlay bottomAnchor];
  v23 = [(PedestrianARViewController *)self view];
  v24 = [v23 bottomAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  v167[3] = v25;
  v26 = +[NSArray arrayWithObjects:v167 count:4];
  [v160 addObjectsFromArray:v26];

  v27 = [(PedestrianARViewController *)self view];
  instructionContainerView = self->_instructionContainerView;
  v29 = [(ContainerViewController *)self containerView];
  [v27 insertSubview:instructionContainerView belowSubview:v29];

  v151 = [(PedestrianARInstructionContainerView *)self->_instructionContainerView leadingAnchor];
  v156 = [(PedestrianARViewController *)self view];
  v146 = [v156 leadingAnchor];
  v141 = [v151 constraintEqualToAnchor:v146];
  v166[0] = v141;
  v131 = [(PedestrianARInstructionContainerView *)self->_instructionContainerView trailingAnchor];
  v136 = [(PedestrianARViewController *)self view];
  v126 = [v136 trailingAnchor];
  v122 = [v131 constraintEqualToAnchor:v126];
  v166[1] = v122;
  v30 = [(PedestrianARInstructionContainerView *)self->_instructionContainerView topAnchor];
  v31 = [(PedestrianARViewController *)self view];
  uint64_t v32 = [v31 topAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  v166[2] = v33;
  v34 = [(PedestrianARInstructionContainerView *)self->_instructionContainerView bottomAnchor];
  v35 = [(PedestrianARViewController *)self view];
  uint64_t v36 = [v35 bottomAnchor];
  v37 = [v34 constraintEqualToAnchor:v36];
  v166[3] = v37;
  v38 = +[NSArray arrayWithObjects:v166 count:4];
  [v160 addObjectsFromArray:v38];

  v39 = [(PedestrianARViewController *)self view];
  arrowGuidanceView = self->_arrowGuidanceView;
  v41 = [(ContainerViewController *)self containerView];
  [v39 insertSubview:arrowGuidanceView belowSubview:v41];

  v42 = [(PedestrianARArrowGuidanceView *)self->_arrowGuidanceView leadingAnchor];
  v43 = [(PedestrianARViewController *)self view];
  uint64_t v44 = [v43 leadingAnchor];
  v45 = [v42 constraintEqualToAnchor:v44 constant:16.0];
  arrowGuidanceViewLeadingConstraint = self->_arrowGuidanceViewLeadingConstraint;
  self->_arrowGuidanceViewLeadingConstraint = v45;

  v47 = [(PedestrianARArrowGuidanceView *)self->_arrowGuidanceView trailingAnchor];
  v48 = [(PedestrianARViewController *)self view];
  os_activity_scope_state_s v49 = [v48 trailingAnchor];
  objc_super v50 = [v47 constraintEqualToAnchor:v49 constant:-16.0];
  arrowGuidanceViewTrailingConstraint = self->_arrowGuidanceViewTrailingConstraint;
  self->_arrowGuidanceViewTrailingConstraint = v50;

  v52 = [(PedestrianARArrowGuidanceView *)self->_arrowGuidanceView leadingAnchor];
  __int16 v53 = [(PedestrianARViewController *)self view];
  v54 = [v53 safeAreaLayoutGuide];
  __int16 v55 = [v54 leadingAnchor];
  int v56 = [v52 constraintEqualToAnchor:v55];
  arrowGuidanceViewLeadingSafeAreaConstraint = self->_arrowGuidanceViewLeadingSafeAreaConstraint;
  self->_arrowGuidanceViewLeadingSafeAreaConstraint = v56;

  v58 = [(PedestrianARArrowGuidanceView *)self->_arrowGuidanceView trailingAnchor];
  v59 = [(PedestrianARViewController *)self view];
  v60 = [v59 safeAreaLayoutGuide];
  v61 = [v60 trailingAnchor];
  v62 = [v58 constraintEqualToAnchor:v61];
  arrowGuidanceViewTrailingSafeAreaConstraint = self->_arrowGuidanceViewTrailingSafeAreaConstraint;
  self->_arrowGuidanceViewTrailingSafeAreaConstraint = v62;

  v64 = self->_arrowGuidanceViewTrailingConstraint;
  v165[0] = self->_arrowGuidanceViewLeadingConstraint;
  v165[1] = v64;
  v157 = [(PedestrianARArrowGuidanceView *)self->_arrowGuidanceView heightAnchor];
  v65 = [(PedestrianARViewController *)self view];
  v66 = [v65 heightAnchor];
  v67 = [v157 constraintEqualToAnchor:v66 multiplier:0.5];
  v165[2] = v67;
  v68 = [(PedestrianARArrowGuidanceView *)self->_arrowGuidanceView topAnchor];
  v69 = [(MUBlurView *)self->_closeButton bottomAnchor];
  v70 = [v68 constraintEqualToAnchor:v69];
  v165[3] = v70;
  v71 = +[NSArray arrayWithObjects:v165 count:4];
  [v160 addObjectsFromArray:v71];

  v72 = [(PedestrianARViewController *)self view];
  closeButton = self->_closeButton;
  v74 = [(ContainerViewController *)self containerView];
  [v72 insertSubview:closeButton belowSubview:v74];

  v75 = [(MUBlurView *)self->_closeButton topAnchor];
  v76 = [(PedestrianARViewController *)self view];
  v77 = [v76 safeAreaLayoutGuide];
  v78 = [v77 topAnchor];
  v79 = [v75 constraintEqualToAnchor:v78];
  closeButtonTopConstraint = self->_closeButtonTopConstraint;
  self->_closeButtonTopConstraint = v79;

  v81 = [(MUBlurView *)self->_closeButton trailingAnchor];
  v82 = [(PedestrianARViewController *)self view];
  v83 = [v82 trailingAnchor];
  v84 = [v81 constraintEqualToAnchor:v83];
  closeButtonTrailingConstraint = self->_closeButtonTrailingConstraint;
  self->_closeButtonTrailingConstraint = v84;

  v86 = [(MUBlurView *)self->_closeButton trailingAnchor];
  v87 = [(PedestrianARViewController *)self view];
  v88 = [v87 safeAreaLayoutGuide];
  v89 = [v88 trailingAnchor];
  v90 = [v86 constraintEqualToAnchor:v89];
  closeButtonSafeAreaTrailingConstraint = self->_closeButtonSafeAreaTrailingConstraint;
  self->_closeButtonSafeAreaTrailingConstraint = v90;

  v92 = self->_closeButtonTopConstraint;
  v164[0] = self->_closeButtonSafeAreaTrailingConstraint;
  v164[1] = v92;
  v93 = [(MUBlurView *)self->_closeButton widthAnchor];
  v94 = [v93 constraintEqualToConstant:42.0];
  v164[2] = v94;
  v95 = [(MUBlurView *)self->_closeButton heightAnchor];
  v96 = [(MUBlurView *)self->_closeButton widthAnchor];
  v97 = [v95 constraintEqualToAnchor:v96];
  v164[3] = v97;
  v98 = +[NSArray arrayWithObjects:v164 count:4];
  [v160 addObjectsFromArray:v98];

  if (self->_ttrButton)
  {
    v99 = [(PedestrianARViewController *)self view];
    ttrButton = self->_ttrButton;
    v101 = [(ContainerViewController *)self containerView];
    [v99 insertSubview:ttrButton belowSubview:v101];

    v147 = [(UIButton *)self->_ttrButton leadingAnchor];
    v158 = [(PedestrianARViewController *)self view];
    v152 = [v158 safeAreaLayoutGuide];
    v142 = [v152 leadingAnchor];
    v137 = [v147 constraintEqualToAnchor:v142 constant:16.0];
    v163[0] = v137;
    v132 = [(UIButton *)self->_ttrButton topAnchor];
    v127 = [(MUBlurView *)self->_closeButton topAnchor];
    v123 = [v132 constraintEqualToAnchor:v127];
    v163[1] = v123;
    v102 = [(UIButton *)self->_ttrButton widthAnchor];
    v103 = [(MUBlurView *)self->_closeButton widthAnchor];
    v104 = [v102 constraintEqualToAnchor:v103];
    v163[2] = v104;
    v105 = [(UIButton *)self->_ttrButton heightAnchor];
    v106 = [(UIButton *)self->_ttrButton widthAnchor];
    v107 = [v105 constraintEqualToAnchor:v106];
    v163[3] = v107;
    v108 = +[NSArray arrayWithObjects:v163 count:4];
    [v160 addObjectsFromArray:v108];
  }
  if (self->_safetyView)
  {
    v109 = [(PedestrianARViewController *)self view];
    [v109 insertSubview:self->_safetyView belowSubview:self->_closeButton];

    v153 = [(PedestrianARSafetyView *)self->_safetyView leadingAnchor];
    v159 = [(PedestrianARViewController *)self view];
    v148 = [v159 leadingAnchor];
    v143 = [v153 constraintEqualToAnchor:v148];
    v162[0] = v143;
    v133 = [(PedestrianARSafetyView *)self->_safetyView trailingAnchor];
    v138 = [(PedestrianARViewController *)self view];
    v128 = [v138 trailingAnchor];
    v110 = [v133 constraintEqualToAnchor:v128];
    v162[1] = v110;
    v111 = [(PedestrianARSafetyView *)self->_safetyView topAnchor];
    v112 = [(PedestrianARViewController *)self view];
    v113 = [v112 topAnchor];
    v114 = [v111 constraintEqualToAnchor:v113];
    v162[2] = v114;
    v115 = [(PedestrianARSafetyView *)self->_safetyView bottomAnchor];
    v116 = [(PedestrianARViewController *)self view];
    v117 = [v116 bottomAnchor];
    v118 = [v115 constraintEqualToAnchor:v117];
    v162[3] = v118;
    v119 = +[NSArray arrayWithObjects:v162 count:4];
    [v160 addObjectsFromArray:v119];
  }
  +[NSLayoutConstraint activateConstraints:v160];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v5, &state);

  v10.receiver = self;
  v10.super_class = (Class)PedestrianARViewController;
  [(ContainerViewController *)&v10 viewWillAppear:v3];
  v6 = +[PedestrianARSessionUsageTracker sharedInstance];
  v7 = [(PedestrianARViewController *)self route];
  v8 = [v7 uniqueRouteID];
  v9 = [v8 UUIDString];
  [v6 registerUserEnteredARForRoute:v9 entryPoint:[self entryPoint]];

  os_activity_scope_leave(&state);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v5, &state);

  v6 = sub_10057812C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Ending pedestrian AR session", buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)PedestrianARViewController;
  [(ContainerViewController *)&v7 viewWillDisappear:v3];
  [(PedestrianARViewController *)self stop];
  os_activity_scope_leave(&state);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PedestrianARViewController;
  -[ContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1009E910C;
  v11[3] = &unk_101313B08;
  objc_copyWeak(&v12, &location);
  BOOL v13 = width > height;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1009E915C;
  v8[3] = &unk_101313B08;
  objc_copyWeak(&v9, &location);
  BOOL v10 = width > height;
  [v7 animateAlongsideTransition:v11 completion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)viewSafeAreaInsetsDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)PedestrianARViewController;
  [(ContainerViewController *)&v7 viewSafeAreaInsetsDidChange];
  BOOL v3 = [(PedestrianARViewController *)self view];
  [v3 frame];
  double Width = CGRectGetWidth(v8);
  v5 = [(PedestrianARViewController *)self view];
  [v5 frame];
  BOOL v6 = Width > CGRectGetHeight(v9);

  [(PedestrianARViewController *)self _updateConstraintsForLandscape:v6];
}

- (void)_updateConstraintsForLandscape:(BOOL)a3
{
  if (!a3)
  {
    v18 = [(PedestrianARViewController *)self closeButtonTopConstraint];
    [v18 setConstant:10.0];

    v19 = [(PedestrianARViewController *)self closeButtonTrailingConstraint];
    [v19 setActive:0];

    v20 = [(PedestrianARViewController *)self closeButtonSafeAreaTrailingConstraint];
    [v20 setActive:1];

    v21 = [(PedestrianARViewController *)self closeButtonSafeAreaTrailingConstraint];
    [v21 setConstant:-16.0];

    v22 = [(PedestrianARViewController *)self arrowGuidanceViewLeadingSafeAreaConstraint];
    [v22 setActive:0];

    v23 = [(PedestrianARViewController *)self arrowGuidanceViewTrailingSafeAreaConstraint];
    [v23 setActive:0];

    v24 = [(PedestrianARViewController *)self arrowGuidanceViewLeadingConstraint];
    [v24 setActive:1];

    v25 = [(PedestrianARViewController *)self arrowGuidanceViewTrailingConstraint];
    [v25 setActive:1];

    v26 = [(PedestrianARViewController *)self arrowGuidanceViewLeadingConstraint];
    [v26 setConstant:16.0];

    v27 = [(PedestrianARViewController *)self arrowGuidanceViewTrailingConstraint];
    id v36 = v27;
    double v28 = -16.0;
    goto LABEL_9;
  }
  v4 = [(PedestrianARViewController *)self view];
  id v5 = [v4 effectiveUserInterfaceLayoutDirection];

  BOOL v6 = [(PedestrianARViewController *)self view];
  objc_super v7 = [v6 window];
  CGRect v8 = [v7 windowScene];
  id v9 = [v8 interfaceOrientation];

  if (v5 != (id)1)
  {
    if (v9 != (id)4) {
      goto LABEL_4;
    }
LABEL_7:
    v29 = [(PedestrianARViewController *)self closeButtonTrailingConstraint];
    [v29 setActive:0];

    v30 = [(PedestrianARViewController *)self closeButtonSafeAreaTrailingConstraint];
    [v30 setActive:1];

    v31 = [(PedestrianARViewController *)self closeButtonSafeAreaTrailingConstraint];
    [v31 setConstant:0.0];

    uint64_t v32 = [(PedestrianARViewController *)self arrowGuidanceViewLeadingSafeAreaConstraint];
    [v32 setActive:0];

    v33 = [(PedestrianARViewController *)self arrowGuidanceViewTrailingSafeAreaConstraint];
    [v33 setActive:1];

    v34 = [(PedestrianARViewController *)self arrowGuidanceViewLeadingConstraint];
    [v34 setActive:1];

    v35 = [(PedestrianARViewController *)self arrowGuidanceViewLeadingConstraint];
    [v35 setConstant:24.0];

    v17 = [(PedestrianARViewController *)self arrowGuidanceViewTrailingConstraint];
    [v17 setActive:0];
    goto LABEL_8;
  }
  if (v9 == (id)3) {
    goto LABEL_7;
  }
LABEL_4:
  BOOL v10 = [(PedestrianARViewController *)self closeButtonSafeAreaTrailingConstraint];
  [v10 setActive:0];

  id v11 = [(PedestrianARViewController *)self closeButtonTrailingConstraint];
  [v11 setActive:1];

  id v12 = [(PedestrianARViewController *)self closeButtonTrailingConstraint];
  [v12 setConstant:-24.0];

  BOOL v13 = [(PedestrianARViewController *)self arrowGuidanceViewLeadingSafeAreaConstraint];
  [v13 setActive:1];

  v14 = [(PedestrianARViewController *)self arrowGuidanceViewTrailingSafeAreaConstraint];
  [v14 setActive:0];

  objc_super v15 = [(PedestrianARViewController *)self arrowGuidanceViewLeadingConstraint];
  [v15 setActive:0];

  v16 = [(PedestrianARViewController *)self arrowGuidanceViewTrailingConstraint];
  [v16 setActive:1];

  v17 = [(PedestrianARViewController *)self arrowGuidanceViewTrailingConstraint];
  [v17 setConstant:-24.0];
LABEL_8:

  v27 = [(PedestrianARViewController *)self closeButtonTopConstraint];
  id v36 = v27;
  double v28 = 24.0;
LABEL_9:
  [v27 setConstant:v28];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (PedestrianARLocalizingView)localizingView
{
  localizingView = self->_localizingView;
  if (!localizingView)
  {
    v4 = -[PedestrianARLocalizingView initWithFrame:]([PedestrianARLocalizingView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(PedestrianARLocalizingView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PedestrianARLocalizingView *)v4 setUserInteractionEnabled:0];
    id v5 = self->_localizingView;
    self->_localizingView = v4;

    BOOL v6 = [(PedestrianARViewController *)self view];
    objc_super v7 = self->_localizingView;
    CGRect v8 = [(PedestrianARViewController *)self gradientOverlay];
    [v6 insertSubview:v7 aboveSubview:v8];

    v25 = [(PedestrianARLocalizingView *)self->_localizingView leadingAnchor];
    v26 = [(PedestrianARViewController *)self view];
    v24 = [v26 leadingAnchor];
    v23 = [v25 constraintEqualToAnchor:v24];
    v27[0] = v23;
    v21 = [(PedestrianARLocalizingView *)self->_localizingView trailingAnchor];
    v22 = [(PedestrianARViewController *)self view];
    v20 = [v22 trailingAnchor];
    v19 = [v21 constraintEqualToAnchor:v20];
    v27[1] = v19;
    v18 = [(PedestrianARLocalizingView *)self->_localizingView topAnchor];
    id v9 = [(PedestrianARViewController *)self view];
    BOOL v10 = [v9 topAnchor];
    id v11 = [v18 constraintEqualToAnchor:v10];
    v27[2] = v11;
    id v12 = [(PedestrianARLocalizingView *)self->_localizingView bottomAnchor];
    BOOL v13 = [(PedestrianARViewController *)self view];
    v14 = [v13 bottomAnchor];
    objc_super v15 = [v12 constraintEqualToAnchor:v14];
    v27[3] = v15;
    v16 = +[NSArray arrayWithObjects:v27 count:4];
    +[NSLayoutConstraint activateConstraints:v16];

    localizingView = self->_localizingView;
  }

  return localizingView;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    id v5 = [(PedestrianARViewController *)self activity];
    os_activity_scope_enter(v5, &state);

    if ([(PedestrianARViewController *)self isStopping])
    {
      BOOL v6 = sub_1009E7C9C();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        if ((unint64_t)a3 >= 4)
        {
          objc_super v7 = +[NSString stringWithFormat:@"%ld", a3];
        }
        else
        {
          objc_super v7 = (char *)*(&off_101313B98 + a3);
        }
        *(_DWORD *)buf = 134349314;
        v33 = self;
        __int16 v34 = 2112;
        v35 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Requested to update state: %@, but we are currently stopping; ignoring",
          buf,
          0x16u);
      }
    }
    else
    {
      self->_os_activity_scope_state_s state = a3;
      CGRect v8 = sub_1009E7C9C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        if ((unint64_t)a3 >= 4)
        {
          id v9 = +[NSString stringWithFormat:@"%ld", a3];
        }
        else
        {
          id v9 = (char *)*(&off_101313B98 + a3);
        }
        *(_DWORD *)buf = 134349314;
        v33 = self;
        __int16 v34 = 2112;
        v35 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Updating state: %@", buf, 0x16u);
      }
      switch(a3)
      {
        case 0:
          BOOL v10 = sub_1005762E4();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v33 = (PedestrianARViewController *)"-[PedestrianARViewController setState:]";
            __int16 v34 = 2080;
            v35 = "PedestrianARViewController.m";
            __int16 v36 = 1024;
            int v37 = 490;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
          }

          if (sub_100BB36BC())
          {
            id v11 = sub_1005762E4();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              id v12 = +[NSThread callStackSymbols];
              *(_DWORD *)buf = 138412290;
              v33 = v12;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
            }
          }
          break;
        case 1:
          [(PedestrianARViewController *)self resetAnalytics];
          [(PedestrianARViewController *)self hideInstructionView];
          [(PedestrianARViewController *)self hideArrowGuidanceView];
          [(PedestrianARViewController *)self hideFailureView];
          [(PedestrianARViewController *)self hideSafetyView];
          v21 = [(PedestrianARViewController *)self safetyView];
          [v21 didEndARSession];

          unsigned int v22 = [(PedestrianARViewController *)self isRerouteNecessary];
          v23 = [(PedestrianARViewController *)self renderingView];
          [v23 setShouldGenerateFeatures:v22 ^ 1];

          v24 = [(PedestrianARViewController *)self renderingView];
          [v24 setShouldShowFeatures:0];

          [(PedestrianARViewController *)self disableIdleTimer];
          [(PedestrianARViewController *)self stopFailureViewTimeoutTimer];
          [(PedestrianARViewController *)self cancelReroute];
          v25 = [(PedestrianARViewController *)self localizingView];
          [v25 showAnimated:1 completion:0];

          +[GEOAPPortal captureUserAction:123 target:[(PedestrianARViewController *)self analyticsTarget] value:0];
          break;
        case 2:
          objc_initWeak((id *)buf, self);
          BOOL v13 = [(PedestrianARViewController *)self localizingView];
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_1009E9FB0;
          v29[3] = &unk_1012E6998;
          objc_copyWeak(&v30, (id *)buf);
          [v13 hideAnimated:1 completion:v29];

          [(PedestrianARViewController *)self showInstructionView];
          [(PedestrianARViewController *)self showArrowGuidanceView];
          [(PedestrianARViewController *)self hideFailureView];
          v14 = [(PedestrianARViewController *)self safetyView];
          [v14 didStartARSession];

          [(PedestrianARViewController *)self showSafetyView];
          objc_super v15 = [(PedestrianARViewController *)self renderingView];
          [v15 setShouldGenerateFeatures:1];

          v16 = [(PedestrianARViewController *)self renderingView];
          [v16 setShouldShowFeatures:1];

          [(PedestrianARViewController *)self disableIdleTimer];
          [(PedestrianARViewController *)self stopFailureViewTimeoutTimer];
          [(PedestrianARViewController *)self cancelReroute];
          [(PedestrianARViewController *)self playSuccessHaptic];
          objc_destroyWeak(&v30);
          objc_destroyWeak((id *)buf);
          break;
        case 3:
          objc_initWeak((id *)buf, self);
          v17 = [(PedestrianARViewController *)self localizingView];
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_1009EA034;
          v27[3] = &unk_1012E6998;
          objc_copyWeak(&v28, (id *)buf);
          [v17 hideAnimated:0 completion:v27];

          [(PedestrianARViewController *)self hideInstructionView];
          [(PedestrianARViewController *)self hideArrowGuidanceView];
          [(PedestrianARViewController *)self showFailureView];
          [(PedestrianARViewController *)self hideSafetyView];
          v18 = [(PedestrianARViewController *)self safetyView];
          [v18 didEndARSession];

          v19 = [(PedestrianARViewController *)self renderingView];
          [v19 setShouldGenerateFeatures:1];

          v20 = [(PedestrianARViewController *)self renderingView];
          [v20 setShouldShowFeatures:0];

          [(PedestrianARViewController *)self enableIdleTimer];
          [(PedestrianARViewController *)self startFailureViewTimeoutTimer];
          [(PedestrianARViewController *)self cancelReroute];
          [(PedestrianARViewController *)self playFailureHaptic];
          objc_destroyWeak(&v28);
          objc_destroyWeak((id *)buf);
          break;
        default:
          break;
      }
      int64_t v26 = self->_state;
      BOOL v6 = [(PedestrianARViewController *)self gradientOverlay];
      [v6 setState:v26];
    }

    os_activity_scope_leave(&state);
  }
}

- (void)setRoute:(id)a3
{
  id v5 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  objc_super v7 = dispatch_queue_get_label(0);
  if (label != v7)
  {
    BOOL v8 = !label || v7 == 0;
    if (v8 || strcmp(label, v7))
    {
      objc_super v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v18 = 136316418;
        v19 = "-[PedestrianARViewController setRoute:]";
        __int16 v20 = 2080;
        v21 = "PedestrianARViewController.m";
        __int16 v22 = 1024;
        int v23 = 502;
        __int16 v24 = 2080;
        v25 = "dispatch_get_main_queue()";
        __int16 v26 = 2080;
        v27 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v28 = 2080;
        v29 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v18,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v16 = sub_1005762E4();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = +[NSThread callStackSymbols];
          int v18 = 138412290;
          v19 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);
        }
      }
    }
  }
  id v9 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v9, (os_activity_scope_state_t)&v18);

  unint64_t v10 = self->_route;
  unint64_t v11 = (unint64_t)v5;
  if (v11 | v10)
  {
    unsigned __int8 v12 = [(id)v10 isEqual:v11];

    if ((v12 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_route, a3);
      BOOL v13 = [(PedestrianARViewController *)self renderingView];
      [v13 setRoute:v11];

      v14 = [(PedestrianARViewController *)self instructionContainerView];
      [v14 setRoute:v11];
    }
  }
  os_activity_scope_leave((os_activity_scope_state_t)&v18);
}

- (BOOL)isShowingFailureView
{
  v2 = self;
  BOOL v3 = [(ContainerViewController *)self currentViewController];
  v4 = [(PedestrianARViewController *)v2 failureContainee];
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (BOOL)allowsDisplayOnLockScreen
{
  return 1;
}

- (void)createViews
{
  BOOL v3 = [PedestrianARRenderingView alloc];
  v4 = [(PedestrianARViewController *)self guidanceObserver];
  id v5 = [(PedestrianARViewController *)self navigationService];
  BOOL v6 = [(PedestrianARRenderingView *)v3 initWithGuidanceObserver:v4 navigationService:v5];

  [(PedestrianARRenderingView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v7 = [(PedestrianARViewController *)self route];
  [(PedestrianARRenderingView *)v6 setRoute:v7];

  BOOL v8 = [(PedestrianARRenderingView *)v6 mapViewDelegate];
  [v8 registerObserver:self];

  renderingView = self->_renderingView;
  self->_renderingView = v6;

  unint64_t v10 = [PedestrianARGradientOverlay alloc];
  unint64_t v11 = +[PedestrianARGradientOverlayConfiguration defaultConfiguration];
  unsigned __int8 v12 = [(PedestrianARGradientOverlay *)v10 initWithConfiguration:v11];

  [(PedestrianARGradientOverlay *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PedestrianARGradientOverlay *)v12 setUserInteractionEnabled:0];
  gradientOverlay = self->_gradientOverlay;
  self->_gradientOverlay = v12;

  if (+[MapsTapToRadarExtras shouldEnableTTRButton])
  {
    v14 = +[NSUserDefaults standardUserDefaults];
    unsigned int v15 = [v14 BOOLForKey:@"PedestrianARTTRButtonEnabledKey"];

    if (v15)
    {
      v16 = +[UIImage imageNamed:@"PedestrianARTTR"];
      v17 = [v16 imageWithRenderingMode:2];

      int v18 = +[UIButton buttonWithType:0];
      [(UIButton *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIButton *)v18 setImage:v17 forState:0];
      v19 = +[UIColor labelColor];
      [(UIButton *)v18 setTintColor:v19];

      __int16 v20 = +[UIColor secondarySystemBackgroundColor];
      [(UIButton *)v18 setBackgroundColor:v20];

      [(UIButton *)v18 _setCornerRadius:21.0];
      [(UIButton *)v18 addTarget:self action:"ttrButtonTapped:" forControlEvents:64];

      ttrButton = self->_ttrButton;
      self->_ttrButton = v18;
    }
  }
  id v22 = [objc_alloc((Class)MUBlurView) initWithBlurEffectStyle:16];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  int v23 = +[UIColor secondarySystemBackgroundColor];
  [v22 setNonBlurredColor:v23];

  [v22 _setCornerRadius:21.0];
  __int16 v24 = [v22 layer];
  [v24 setMasksToBounds:1];

  [v22 setClipsToBounds:1];
  v25 = [(PedestrianARViewController *)self traitCollection];
  __int16 v26 = [v25 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryLarge];
  v27 = +[UIFont _maps_fontWithTextStyle:UIFontTextStyleBody weight:v26 compatibleWithTraitCollection:UIFontWeightBold];
  v62 = +[UIImageSymbolConfiguration configurationWithFont:v27];

  __int16 v28 = +[UIImage systemImageNamed:@"xmark" withConfiguration:v62];
  v61 = [v28 imageWithRenderingMode:2];

  v29 = +[UIButton buttonWithType:0];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v29 setImage:v61 forState:0];
  id v30 = +[UIColor secondaryLabelColor];
  [v29 setTintColor:v30];

  [v29 addTarget:self action:"closeButtonTapped:" forControlEvents:64];
  [v22 addSubview:v29];
  v60 = [v29 leadingAnchor];
  v59 = [v22 leadingAnchor];
  v58 = [v60 constraintEqualToAnchor:v59];
  v63[0] = v58;
  __int16 v57 = [v29 trailingAnchor];
  int v56 = [v22 trailingAnchor];
  __int16 v55 = [v57 constraintEqualToAnchor:v56];
  v63[1] = v55;
  v31 = [v29 topAnchor];
  uint64_t v32 = [v22 topAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  v63[2] = v33;
  __int16 v34 = [v29 bottomAnchor];
  v35 = [v22 bottomAnchor];
  __int16 v36 = [v34 constraintEqualToAnchor:v35];
  v63[3] = v36;
  int v37 = +[NSArray arrayWithObjects:v63 count:4];
  +[NSLayoutConstraint activateConstraints:v37];

  closeButton = self->_closeButton;
  self->_closeButton = (MUBlurView *)v22;

  v39 = [PedestrianARInstructionContainerView alloc];
  uint64_t v40 = [(PedestrianARRenderingView *)self->_renderingView mapViewDelegate];
  v41 = [(PedestrianARInstructionContainerView *)v39 initWithMapViewDelegate:v40 navigationService:self->_navigationService];

  [(PedestrianARInstructionContainerView *)v41 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PedestrianARInstructionContainerView *)v41 setUserInteractionEnabled:0];
  [(PedestrianARInstructionContainerView *)v41 setHidden:1];
  v42 = [(PedestrianARViewController *)self route];
  [(PedestrianARInstructionContainerView *)v41 setRoute:v42];

  instructionContainerView = self->_instructionContainerView;
  self->_instructionContainerView = v41;

  uint64_t v44 = [PedestrianARArrowGuidanceView alloc];
  v45 = [(PedestrianARRenderingView *)self->_renderingView mapViewDelegate];
  v46 = [(PedestrianARViewController *)self route];
  v47 = [(PedestrianARViewController *)self activity];
  v48 = [(PedestrianARArrowGuidanceView *)v44 initWithMapViewDelegate:v45 route:v46 activity:v47];

  [(PedestrianARArrowGuidanceView *)v48 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PedestrianARArrowGuidanceView *)v48 setUserInteractionEnabled:0];
  [(PedestrianARArrowGuidanceView *)v48 setHidden:1];
  arrowGuidanceView = self->_arrowGuidanceView;
  self->_arrowGuidanceView = v48;

  objc_super v50 = [[PedestrianARFailureContaineeViewController alloc] initWithEntryPoint:[(PedestrianARViewController *)self entryPoint]];
  [(PedestrianARFailureContaineeViewController *)v50 setFailureContaineeDelegate:self];
  failureContainee = self->_failureContainee;
  self->_failureContainee = v50;

  v52 = +[NSUserDefaults standardUserDefaults];
  LODWORD(v45) = [v52 BOOLForKey:@"PedestrianARSafetyUIKey"];

  if (v45)
  {
    __int16 v53 = objc_alloc_init(PedestrianARSafetyView);
    [(PedestrianARSafetyView *)v53 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PedestrianARSafetyView *)v53 setUserInteractionEnabled:0];
    [(PedestrianARSafetyView *)v53 setHidden:1];
    safetyView = self->_safetyView;
    self->_safetyView = v53;
  }
}

- (void)start
{
  BOOL v3 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v3, &v31);

  v4 = sub_1009E7C9C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    v33 = self;
    __int16 v34 = 2080;
    v35 = "-[PedestrianARViewController start]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] %s", buf, 0x16u);
  }

  id v5 = [(PedestrianARViewController *)self arkitSessionStartTimestamp];
  BOOL v6 = v5 == 0;

  if (v6)
  {
    unint64_t v11 = sub_10057812C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Starting pedestrian AR session", buf, 2u);
    }

    unsigned __int8 v12 = sub_10057812C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      BOOL v13 = [(GEOComposedRoute *)self->_route origin];
      v14 = [v13 hawkQueryRepresentation];
      unsigned int v15 = [(GEOComposedRoute *)self->_route destination];
      v16 = [v15 hawkQueryRepresentation];
      *(_DWORD *)buf = 138478083;
      v33 = v14;
      __int16 v34 = 2113;
      v35 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Origin: %{private}@ -- Destination: %{private}@", buf, 0x16u);
    }
    v17 = +[NSDate date];
    [(PedestrianARViewController *)self setArkitSessionStartTimestamp:v17];

    [(PedestrianARViewController *)self cancelReroute];
    [(PedestrianARViewController *)self cancelWaitingForActiveFeature];
    int v18 = [[VLFSession alloc] initWithMode:0];
    [(PedestrianARViewController *)self setVlfSession:v18];

    v19 = [(PedestrianARViewController *)self vlfSession];
    [v19 setDelegate:self];

    if ([(PedestrianARViewController *)self entryPoint])
    {
      __int16 v20 = [(PedestrianARViewController *)self vlfSession];
      [v20 setEntryPoint:4];
    }
    else
    {
      __int16 v20 = [(PedestrianARViewController *)self vlfSession];
      [v20 setEntryPoint:3];
    }

    v21 = [(PedestrianARViewController *)self vlfSession];
    [v21 start];

    id v22 = [(PedestrianARViewController *)self notificationGenerator];
    [v22 prepare];

    int v23 = [(PedestrianARViewController *)self vlfSession];
    __int16 v24 = [v23 session];
    v25 = +[PedestrianARFloatingDebugViewController sharedInstance];
    [v25 setSession:v24];

    __int16 v26 = [(PedestrianARViewController *)self vlfSession];
    v27 = [v26 session];
    __int16 v28 = [(PedestrianARViewController *)self localizingView];
    [v28 setSession:v27];

    unint64_t v10 = [(PedestrianARViewController *)self vlfSession];
    v29 = [v10 session];
    id v30 = [(PedestrianARViewController *)self renderingView];
    [v30 setSession:v29];
  }
  else
  {
    objc_super v7 = sub_1005762E4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v33 = (PedestrianARViewController *)"-[PedestrianARViewController start]";
      __int16 v34 = 2080;
      v35 = "PedestrianARViewController.m";
      __int16 v36 = 1024;
      int v37 = 652;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      BOOL v8 = sub_1005762E4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v33 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    unint64_t v10 = sub_1009E7C9C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      v33 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{public}p] ARKit session has already been started. Cannot start twice.", buf, 0xCu);
    }
  }

  os_activity_scope_leave(&v31);
}

- (void)stop
{
  if (![(PedestrianARViewController *)self isStopping])
  {
    BOOL v3 = [(PedestrianARViewController *)self activity];
    os_activity_scope_enter(v3, &v13);

    [(PedestrianARViewController *)self setIsStopping:1];
    v4 = sub_1009E7C9C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      unsigned int v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Stopping pedestrian AR", buf, 0xCu);
    }

    [(PedestrianARViewController *)self setSentDisappearNotification:1];
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 postNotificationName:@"PedestrianARViewControllerDidDisappearNotification" object:self];

    id v6 = objc_alloc_init((Class)GEOVLFARFailureTypes);
    [v6 setArWalkingNoLabels:[self didRenderLabel] ^ 1];
    [v6 setArWalkingUndulationFailure:[self didFailUndulationLookup]];
    objc_super v7 = [(PedestrianARViewController *)self vlfSession];
    [v7 stop];

    BOOL v8 = [(PedestrianARViewController *)self vlfSession];
    [v8 sendAnalytics:v6];

    [(PedestrianARViewController *)self setArkitSessionStartTimestamp:0];
    id v9 = +[MapsARSessionManager sharedManager];
    [v9 resignSessionWithOwner:self];

    unint64_t v10 = [(PedestrianARViewController *)self arrowGuidanceView];
    [v10 stop];

    unint64_t v11 = [(PedestrianARViewController *)self arDelegate];
    [v11 pedestrianARViewControllerDidStop:self];

    unsigned __int8 v12 = +[PedestrianARFloatingDebugViewController sharedInstance];
    [v12 setSession:0];

    os_activity_scope_leave(&v13);
  }
}

- (void)showInstructionView
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  BOOL v3 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v3, &state);

  v4 = sub_1009E7C9C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(PedestrianARViewController *)self instructionContainerView];
    *(_DWORD *)buf = 134349312;
    os_activity_scope_state_s v13 = self;
    __int16 v14 = 2048;
    unsigned int v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Showing instruction view: %p", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  id v6 = [(PedestrianARViewController *)self instructionContainerView];
  [v6 setHidden:0];

  objc_super v7 = [(PedestrianARViewController *)self instructionContainerView];
  [v7 setAlpha:0.0];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009EB4F4;
  v10[3] = &unk_1012E5D08;
  v10[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1009EB53C;
  v8[3] = &unk_1012E6998;
  objc_copyWeak(&v9, (id *)buf);
  +[UIView animateWithDuration:0x10000 delay:v10 options:v8 animations:0.15 completion:0.6];
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
  os_activity_scope_leave(&state);
}

- (void)hideInstructionView
{
  BOOL v3 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v3, &v8);

  v4 = sub_1009E7C9C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(PedestrianARViewController *)self instructionContainerView];
    *(_DWORD *)buf = 134349312;
    unint64_t v10 = self;
    __int16 v11 = 2048;
    unsigned __int8 v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Hiding instruction view: %p", buf, 0x16u);
  }
  id v6 = [(PedestrianARViewController *)self instructionContainerView];
  [v6 _removeAllAnimations:1];

  objc_super v7 = [(PedestrianARViewController *)self instructionContainerView];
  [v7 setHidden:1];

  os_activity_scope_leave(&v8);
}

- (void)showFailureView
{
  BOOL v3 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v3, &v10);

  v4 = sub_1009E7C9C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(PedestrianARViewController *)self failureContainee];
    *(_DWORD *)buf = 134349312;
    unsigned __int8 v12 = self;
    __int16 v13 = 2048;
    __int16 v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Showing failure view: %p", buf, 0x16u);
  }
  id v6 = [(PedestrianARViewController *)self vlfSession];
  [v6 stop];

  objc_super v7 = [(PedestrianARViewController *)self vlfSession];
  [v7 sendAnalytics:0];

  [(PedestrianARViewController *)self setArkitSessionStartTimestamp:0];
  os_activity_scope_state_s v8 = [(PedestrianARViewController *)self closeButton];
  [v8 setHidden:1];

  id v9 = [(PedestrianARViewController *)self failureContainee];
  [(ContainerViewController *)self presentController:v9];

  os_activity_scope_leave(&v10);
}

- (void)hideFailureView
{
  BOOL v3 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v3, &v7);

  v4 = sub_1009E7C9C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(PedestrianARViewController *)self failureContainee];
    *(_DWORD *)buf = 134349312;
    id v9 = self;
    __int16 v10 = 2048;
    __int16 v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Hiding failure view: %p", buf, 0x16u);
  }
  [(ContainerViewController *)self popLastViewControllerAnimated:1];
  id v6 = [(PedestrianARViewController *)self closeButton];
  [v6 setHidden:0];

  os_activity_scope_leave(&v7);
}

- (void)showArrowGuidanceView
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  BOOL v3 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v3, &state);

  v4 = sub_1009E7C9C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(PedestrianARViewController *)self arrowGuidanceView];
    *(_DWORD *)buf = 134349312;
    __int16 v13 = self;
    __int16 v14 = 2048;
    unsigned int v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Showing arrow guidance view: %p", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  id v6 = [(PedestrianARViewController *)self arrowGuidanceView];
  [v6 setHidden:0];

  os_activity_scope_state_s v7 = [(PedestrianARViewController *)self arrowGuidanceView];
  [v7 setAlpha:0.0];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009EBC9C;
  v10[3] = &unk_1012E5D08;
  v10[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1009EBCE4;
  v8[3] = &unk_1012E6998;
  objc_copyWeak(&v9, (id *)buf);
  +[UIView animateWithDuration:0x10000 delay:v10 options:v8 animations:0.15 completion:0.6];
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
  os_activity_scope_leave(&state);
}

- (void)hideArrowGuidanceView
{
  BOOL v3 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v3, &v8);

  v4 = sub_1009E7C9C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(PedestrianARViewController *)self arrowGuidanceView];
    *(_DWORD *)buf = 134349312;
    __int16 v10 = self;
    __int16 v11 = 2048;
    unsigned __int8 v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Hiding arrow guidance view: %p", buf, 0x16u);
  }
  id v6 = [(PedestrianARViewController *)self arrowGuidanceView];
  [v6 _removeAllAnimations:0];

  os_activity_scope_state_s v7 = [(PedestrianARViewController *)self arrowGuidanceView];
  [v7 setHidden:1];

  os_activity_scope_leave(&v8);
}

- (void)showSafetyView
{
  BOOL v3 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v3, &v7);

  v4 = sub_1009E7C9C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(PedestrianARViewController *)self safetyView];
    *(_DWORD *)buf = 134349312;
    id v9 = self;
    __int16 v10 = 2048;
    __int16 v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Showing safety view: %p", buf, 0x16u);
  }
  id v6 = [(PedestrianARViewController *)self safetyView];
  [v6 setHidden:0];

  os_activity_scope_leave(&v7);
}

- (void)hideSafetyView
{
  BOOL v3 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v3, &v7);

  v4 = sub_1009E7C9C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(PedestrianARViewController *)self safetyView];
    *(_DWORD *)buf = 134349312;
    id v9 = self;
    __int16 v10 = 2048;
    __int16 v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Hiding safety view: %p", buf, 0x16u);
  }
  id v6 = [(PedestrianARViewController *)self safetyView];
  [v6 setHidden:1];

  os_activity_scope_leave(&v7);
}

- (void)disableIdleTimer
{
  id v3 = +[UIApplication sharedMapsDelegate];
  v2 = [v3 idleTimerController];
  [v2 setDesiredIdleTimerState:1 forReason:4];
}

- (void)enableIdleTimer
{
  id v3 = +[UIApplication sharedMapsDelegate];
  v2 = [v3 idleTimerController];
  [v2 setDesiredIdleTimerState:0 forReason:4];
}

- (BOOL)isRerouteNecessary
{
  id v3 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v3, &v30);

  v4 = [(PedestrianARViewController *)self route];
  if ([v4 source] == (id)2)
  {

LABEL_4:
    uint64_t v7 = sub_1009E7C9C();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v32 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_INFO, "[%{public}p] The current route is curated or user created; do not re-route",
        buf,
        0xCu);
    }
    BOOL v8 = 0;
    goto LABEL_23;
  }
  id v5 = [(PedestrianARViewController *)self route];
  BOOL v6 = [v5 source] == (id)3;

  if (v6) {
    goto LABEL_4;
  }
  id v9 = [(PedestrianARViewController *)self navigationService];
  uint64_t v7 = [v9 lastLocation];

  __int16 v10 = [(PedestrianARViewController *)self session];
  __int16 v11 = [v10 currentFrame];
  uint64_t v12 = [v11 location];

  if (v7 | v12)
  {
    if (v12)
    {
      __int16 v13 = (id)v12;
      id v14 = [objc_alloc((Class)GEOLocation) initWithCLLocation:v13];
      id v15 = objc_alloc((Class)GEORouteMatcher);
      v16 = [(PedestrianARViewController *)self route];
      id v17 = [v15 initWithRoute:v16 auditToken:0];

      int v18 = [v17 matchToRouteWithLocation:v14];
    }
    else
    {
      __int16 v13 = (id)v7;
      int v18 = [v13 routeMatch];
    }
    [v18 distanceFromRoute];
    double v20 = v19;
    GEOConfigGetDouble();
    double v22 = v21;
    int v23 = sub_1009E7C9C();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349568;
      uint64_t v32 = self;
      __int16 v33 = 2048;
      double v34 = v20;
      __int16 v35 = 2048;
      double v36 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[%{public}p] Distance from the route: (%f) threshold: (%f)", buf, 0x20u);
    }

    if (v20 <= v22)
    {
      [v13 horizontalAccuracy];
      double v25 = v24;
      GEOConfigGetDouble();
      double v27 = v26;
      __int16 v28 = sub_1009E7C9C();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349568;
        uint64_t v32 = self;
        __int16 v33 = 2048;
        double v34 = v25;
        __int16 v35 = 2048;
        double v36 = v27;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "[%{public}p] Location horizontal accuracy: (%f) threshold: (%f)", buf, 0x20u);
      }

      BOOL v8 = v25 > v27;
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    __int16 v13 = sub_1009E7C9C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v32 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] There is no known last location; cannot determine whether reroute is necessary",
        buf,
        0xCu);
    }
    BOOL v8 = 0;
  }

LABEL_23:
  os_activity_scope_leave(&v30);
  return v8;
}

- (BOOL)isRerouting
{
  v2 = [(PedestrianARViewController *)self rerouteCompletionTimer];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)reroute
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  BOOL v3 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v3, &state);

  if (![(PedestrianARViewController *)self isRerouteNecessary])
  {
    id v14 = sub_1005762E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      double v21 = (PedestrianARViewController *)"-[PedestrianARViewController reroute]";
      __int16 v22 = 2080;
      int v23 = "PedestrianARViewController.m";
      __int16 v24 = 1024;
      int v25 = 833;
      __int16 v26 = 2080;
      double v27 = "[self isRerouteNecessary]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        double v21 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v4 = [(PedestrianARViewController *)self rerouteCompletionTimer];
  BOOL v5 = v4 == 0;

  BOOL v6 = sub_1009E7C9C();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      double v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Rerouting", buf, 0xCu);
    }

    BOOL v8 = [(PedestrianARViewController *)self navigationService];
    [v8 forceReroute];

    GEOConfigGetDouble();
    double v10 = v9;
    __int16 v11 = sub_1009E7C9C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349312;
      double v21 = self;
      __int16 v22 = 2048;
      int v23 = *(const char **)&v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Starting reroute completion timer with timeout: %f", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    id v12 = &_dispatch_main_q;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1009ECA48;
    v17[3] = &unk_1012E7638;
    objc_copyWeak(&v18, (id *)buf);
    __int16 v13 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v17 block:v10];
    [(PedestrianARViewController *)self setRerouteCompletionTimer:v13];

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      double v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Reroute already in progress; ignoring",
        buf,
        0xCu);
    }
  }
  os_activity_scope_leave(&state);
}

- (void)cancelReroute
{
  uint64_t v3 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter((os_activity_t)v3, &v6);

  v4 = [(PedestrianARViewController *)self rerouteCompletionTimer];
  LOBYTE(v3) = v4 == 0;

  if ((v3 & 1) == 0)
  {
    BOOL v5 = sub_1009E7C9C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      BOOL v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Canceling reroute timer", buf, 0xCu);
    }

    [(PedestrianARViewController *)self setRerouteCompletionTimer:0];
  }
  os_activity_scope_leave(&v6);
}

- (BOOL)isWaitingForActiveFeature
{
  v2 = [(PedestrianARViewController *)self activeFeatureTimer];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)waitForActiveFeatureIfNecessary
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  BOOL v3 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v3, &state);

  v4 = [(PedestrianARViewController *)self renderingView];
  [v4 setShouldGenerateFeatures:1];

  BOOL v5 = [(PedestrianARViewController *)self renderingView];
  os_activity_scope_state_s v6 = [v5 mapViewDelegate];
  unsigned int v7 = [v6 hasActiveFeatureSet];

  if (v7)
  {
    BOOL v8 = sub_1009E7C9C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      id v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Active feature already exists; no need to wait",
        buf,
        0xCu);
    }

    [(PedestrianARViewController *)self setState:2];
  }
  else
  {
    GEOConfigGetDouble();
    double v10 = v9;
    __int16 v11 = sub_1009E7C9C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349312;
      id v18 = self;
      __int16 v19 = 2048;
      double v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Waiting for active feature with timeout: %f", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    id v12 = &_dispatch_main_q;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1009ECF48;
    v14[3] = &unk_1012E7638;
    objc_copyWeak(&v15, (id *)buf);
    __int16 v13 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v14 block:v10];
    [(PedestrianARViewController *)self setActiveFeatureTimer:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  os_activity_scope_leave(&state);
}

- (void)cancelWaitingForActiveFeature
{
  uint64_t v3 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter((os_activity_t)v3, &v6);

  v4 = [(PedestrianARViewController *)self activeFeatureTimer];
  LOBYTE(v3) = v4 == 0;

  if ((v3 & 1) == 0)
  {
    BOOL v5 = sub_1009E7C9C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      BOOL v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Canceling active feature timer", buf, 0xCu);
    }

    [(PedestrianARViewController *)self setActiveFeatureTimer:0];
  }
  os_activity_scope_leave(&v6);
}

- (void)startFailureViewTimeoutTimer
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v3 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v3, &state);

  GEOConfigGetDouble();
  double v5 = v4;
  os_activity_scope_state_s v6 = sub_1009E7C9C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    __int16 v13 = self;
    __int16 v14 = 2048;
    double v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Starting failure view timeout with threshold: %f", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  id v7 = &_dispatch_main_q;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1009ED36C;
  v9[3] = &unk_1012E7638;
  objc_copyWeak(&v10, (id *)buf);
  BOOL v8 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v9 block:v5];
  [(PedestrianARViewController *)self setFailureViewTimeoutTimer:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
  os_activity_scope_leave(&state);
}

- (void)stopFailureViewTimeoutTimer
{
}

- (void)resetAnalytics
{
  [(PedestrianARViewController *)self setDidRenderLabel:0];

  [(PedestrianARViewController *)self setDidFailUndulationLookup:0];
}

- (void)showVLTracePopupIfNecessaryWithCompletion:(id)a3
{
  double v4 = (void (**)(void))a3;
  if (!v4)
  {
    __int16 v14 = sub_1005762E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136315906;
      *(void *)&location[4] = "-[PedestrianARViewController showVLTracePopupIfNecessaryWithCompletion:]";
      __int16 v23 = 2080;
      __int16 v24 = "PedestrianARViewController.m";
      __int16 v25 = 1024;
      int v26 = 929;
      __int16 v27 = 2080;
      __int16 v28 = "completion != nil";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", location, 0x26u);
    }

    if (sub_100BB36BC())
    {
      double v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = +[NSThread callStackSymbols];
        *(_DWORD *)id location = 138412290;
        *(void *)&location[4] = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);
      }
    }
  }
  double v5 = +[GEOPlatform sharedPlatform];
  unsigned __int8 v6 = [v5 isInternalInstall];

  if ((v6 & 1) == 0
    || [(PedestrianARViewController *)self didShowVLTracePopup]
    || (+[NSUserDefaults standardUserDefaults],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 BOOLForKey:@"PedestrianARViewControllerTemporarilyEnableVLTraceRecordingKey"], v7, v8)|| GEOConfigGetBOOL())
  {
    v4[2](v4);
  }
  else
  {
    double v9 = +[UIAlertController alertControllerWithTitle:@"Localization failure [Internal only]" message:@"Would you like to enable VL trace recording until the next time you cold launch Maps? VL trace recording is required to diagnose issues with localization." preferredStyle:1];
    objc_initWeak((id *)location, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1009ED8D8;
    v19[3] = &unk_101313B58;
    objc_copyWeak(&v21, (id *)location);
    id v10 = v4;
    id v20 = v10;
    __int16 v11 = +[UIAlertAction actionWithTitle:@"Yes" style:0 handler:v19];
    [v9 addAction:v11];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1009EDB20;
    v17[3] = &unk_1012E6E08;
    id v18 = v10;
    id v12 = +[UIAlertAction actionWithTitle:@"No" style:1 handler:v17];
    [v9 addAction:v12];

    __int16 v13 = [(ContainerViewController *)self chromeViewController];
    [v13 _maps_topMostPresentViewController:v9 animated:1 completion:0];

    [(PedestrianARViewController *)self setDidShowVLTracePopup:1];
    [(PedestrianARViewController *)self stopFailureViewTimeoutTimer];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)location);
  }
}

- (void)playSuccessHaptic
{
  id v2 = [(PedestrianARViewController *)self notificationGenerator];
  [v2 notificationOccurred:0];
}

- (void)playFailureHaptic
{
  id v2 = [(PedestrianARViewController *)self notificationGenerator];
  [v2 notificationOccurred:2];
}

- (ARConfiguration)configuration
{
  id v2 = [(PedestrianARViewController *)self session];
  uint64_t v3 = [v2 configuration];

  return (ARConfiguration *)v3;
}

- (BOOL)isARSessionBeingRecorded
{
  id v2 = [(PedestrianARViewController *)self configuration];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isARSessionReplayingFromRecording
{
  id v2 = [(PedestrianARViewController *)self configuration];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (int)analyticsTarget
{
  if ([(PedestrianARViewController *)self entryPoint]) {
    return 402;
  }
  else {
    return 302;
  }
}

- (id)mapView
{
  id v2 = [(PedestrianARViewController *)self renderingView];
  uint64_t v3 = [v2 mapViewDelegate];
  double v4 = [v3 mapView];

  return v4;
}

- (BOOL)supportsEmptyStack
{
  return 1;
}

- (void)mapLayer:(id)a3 activeARWalkingFeatureDidUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v8, &v20);

  double v9 = sub_1009E7C9C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = [v7 feature];
    if ([v7 isVisible]) {
      __int16 v11 = @"YES";
    }
    else {
      __int16 v11 = @"NO";
    }
    id v12 = v11;
    if ([v7 isDirectlyBehind]) {
      __int16 v13 = @"YES";
    }
    else {
      __int16 v13 = @"NO";
    }
    __int16 v14 = v13;
    [v7 screenHeading];
    *(_DWORD *)buf = 134350338;
    __int16 v22 = self;
    __int16 v23 = 2112;
    id v24 = v7;
    __int16 v25 = 2112;
    int v26 = v10;
    __int16 v27 = 2112;
    __int16 v28 = v12;
    __int16 v29 = 2112;
    os_activity_scope_state_s v30 = v14;
    __int16 v31 = 2048;
    uint64_t v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Feature did update: %@, feature: %@, isVisible: %@, isDirectlyBehind: %@, screenHeading: %f", buf, 0x3Eu);
  }
  v16 = [v7 feature];
  if (v16)
  {
    unsigned __int8 v17 = [(PedestrianARViewController *)self didRenderLabel];

    if ((v17 & 1) == 0) {
      [(PedestrianARViewController *)self setDidRenderLabel:1];
    }
  }
  if ([v7 isVisible])
  {
    id v18 = +[PedestrianARSessionUsageTracker sharedInstance];
    [v18 registerARElementRendered];

    __int16 v19 = +[NSNotificationCenter defaultCenter];
    [v19 postNotificationName:@"PedestrianARViewControllerARFeatureDidAppearNotification" object:self];
  }
  os_activity_scope_leave(&v20);
}

- (void)mapLayer:(id)a3 updatedFeatures:(id)a4
{
  id v8 = [(PedestrianARViewController *)self renderingView];
  double v5 = [v8 mapViewDelegate];
  if ([v5 hasActiveFeatureSet])
  {
    unsigned int v6 = [(PedestrianARViewController *)self isWaitingForActiveFeature];

    if (v6)
    {
      [(PedestrianARViewController *)self cancelWaitingForActiveFeature];
      id v7 = sub_1009E7C9C();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        id v10 = self;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Got first active feature; changing state to .Running",
          buf,
          0xCu);
      }

      [(PedestrianARViewController *)self setState:2];
    }
  }
  else
  {
  }
}

- (void)mapLayer:(id)a3 failedElevationRequestWithReason:(int64_t)a4
{
  if (a4 == 1 && ![(PedestrianARViewController *)self didFailUndulationLookup])
  {
    [(PedestrianARViewController *)self setDidFailUndulationLookup:1];
  }
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  unsigned int v6 = sub_1009E7C9C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349314;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[%{public}p] ARSession did fail with error: %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1009EE264;
  v8[3] = &unk_1012E6690;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)session:(id)a3 didChangeGeoTrackingStatus:(id)a4
{
  if (objc_msgSend(a4, "state", a3) != (id)3)
  {
    id v5 = sub_1009E7C9C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      id v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] ARKit is no longer localized; re-starting localization",
        buf,
        0xCu);
    }

    objc_initWeak((id *)buf, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1009EE5D4;
    block[3] = &unk_1012E6708;
    objc_copyWeak(&v7, (id *)buf);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1009EE75C;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)replayConfigurationDidFinishReplaying:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  unsigned int v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      __int16 v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136316418;
        unsigned __int8 v17 = (PedestrianARViewController *)"-[PedestrianARViewController replayConfigurationDidFinishReplaying:]";
        __int16 v18 = 2080;
        __int16 v19 = "PedestrianARViewController.m";
        __int16 v20 = 1024;
        int v21 = 1116;
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
          uint64_t v15 = +[NSThread callStackSymbols];
          int v16 = 138412290;
          unsigned __int8 v17 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
        }
      }
    }
  }
  id v8 = sub_1009E7C9C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v16 = 134349056;
    unsigned __int8 v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] ARKit replay ended", (uint8_t *)&v16, 0xCu);
  }

  id v9 = +[NSUserDefaults standardUserDefaults];
  unsigned int v10 = [v9 BOOLForKey:@"MapsARSessionPlaybackLoopKey"];

  __int16 v11 = sub_1009E7C9C();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      int v16 = 134349056;
      unsigned __int8 v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Looping replay", (uint8_t *)&v16, 0xCu);
    }

    [(PedestrianARViewController *)self setArkitSessionStartTimestamp:0];
    [(PedestrianARViewController *)self start];
  }
  else
  {
    if (v12)
    {
      int v16 = 134349056;
      unsigned __int8 v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Stopping AR", (uint8_t *)&v16, 0xCu);
    }

    [(PedestrianARViewController *)self stop];
  }
}

- (void)sessionManager:(id)a3 didGainSessionOwnership:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v8, &v20);

  objc_storeStrong((id *)&self->_session, a4);
  if ([(PedestrianARViewController *)self isARSessionBeingRecorded])
  {
    id v9 = [(PedestrianARViewController *)self configuration];
    unsigned int v10 = [v9 fileURL];
    __int16 v11 = [v10 path];

    BOOL v12 = [(PedestrianARViewController *)self navigationService];
    [v12 recordPedestrianTracePath:v11];
  }
  else
  {
    if ([(PedestrianARViewController *)self isARSessionReplayingFromRecording])
    {
      id v9 = [(PedestrianARViewController *)self configuration];
      [v9 setDelegate:self];
      goto LABEL_6;
    }
    if (!GEOConfigGetBOOL()) {
      goto LABEL_7;
    }
    id v9 = [(PedestrianARViewController *)self configuration];
    GEOConfigGetDouble();
    double v18 = v17;
    __int16 v19 = sub_1009E7C9C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349312;
      __int16 v22 = self;
      __int16 v23 = 2048;
      double v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}p] Configuring VL with custom interval: %f", buf, 0x16u);
    }

    [v9 setVisualLocalizationCallInterval:v18];
    __int16 v11 = [(PedestrianARViewController *)self session];
    [v11 runWithConfiguration:v9];
  }

LABEL_6:
LABEL_7:
  __int16 v13 = [(PedestrianARViewController *)self configuration];
  -[PedestrianARViewController setShouldUpdateCameraFocusLensPosition:](self, "setShouldUpdateCameraFocusLensPosition:", [v13 isAutoFocusEnabled] ^ 1);

  id v14 = [(PedestrianARViewController *)self session];
  [v14 _addObserver:self];

  uint64_t v15 = [(PedestrianARViewController *)self session];
  int v16 = +[PedestrianARFloatingDebugViewController sharedInstance];
  [v16 setSession:v15];

  os_activity_scope_leave(&v20);
}

- (void)sessionManager:(id)a3 didResignSessionOwnership:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v8 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v8, &state);

  id v9 = [(PedestrianARViewController *)self session];
  [v9 _removeObserver:self];

  if ([(PedestrianARViewController *)self isARSessionBeingRecorded])
  {
    unsigned int v10 = [(PedestrianARViewController *)self configuration];
    __int16 v11 = [v10 fileURL];
    BOOL v12 = [v11 path];

    __int16 v13 = sub_1009E7C9C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      __int16 v26 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Ending ARKit session recording", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    id v14 = [(PedestrianARViewController *)self configuration];
    double v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    os_activity_scope_state_s v20 = sub_1009EF054;
    int v21 = &unk_1012EB690;
    objc_copyWeak(&v23, (id *)buf);
    id v15 = v12;
    id v22 = v15;
    [v14 finishRecordingWithHandler:&v18];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
    goto LABEL_7;
  }
  if ([(PedestrianARViewController *)self isARSessionReplayingFromRecording])
  {
    id v15 = [(PedestrianARViewController *)self configuration];
    [v15 setDelegate:0];
LABEL_7:
  }
  int v16 = +[PedestrianARFloatingDebugViewController sharedInstance];
  [v16 setSession:0];

  session = self->_session;
  self->_session = 0;

  os_activity_scope_leave(&state);
}

- (void)VLFSessionLocalizationSucceeded
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v3 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v3, &state);

  id v4 = sub_10057812C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "VLF localization succeeded", v10, 2u);
  }

  id v5 = +[PedestrianARSessionUsageTracker sharedInstance];
  id v6 = [(PedestrianARViewController *)self route];
  id v7 = [v6 uniqueRouteID];
  id v8 = [v7 UUIDString];
  [v5 registerLocalizationSuccessForRoute:v8];

  id v9 = +[MapsARSessionManager sharedManager];
  [v9 requestSessionWithOwner:self];

  if ([(PedestrianARViewController *)self isRerouteNecessary]) {
    [(PedestrianARViewController *)self reroute];
  }
  else {
    [(PedestrianARViewController *)self waitForActiveFeatureIfNecessary];
  }
  +[GEOAPPortal captureUserAction:121 target:[(PedestrianARViewController *)self analyticsTarget] value:0];
  os_activity_scope_leave(&state);
}

- (void)VLFSessionLocalizationFailedWithError:(id)a3
{
  id v4 = (PedestrianARViewController *)a3;
  id v5 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v5, &v12);

  id v6 = sub_1009E7C9C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349314;
    id v14 = self;
    __int16 v15 = 2112;
    int v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[%{public}p] VLF localization failed with error: %@", buf, 0x16u);
  }

  id v7 = [(PedestrianARViewController *)v4 domain];
  unsigned int v8 = [v7 isEqualToString:@"com.apple.Maps.VLFSession"];

  if (v8)
  {
    if ([(PedestrianARViewController *)v4 code] == (id)2)
    {
      uint64_t v9 = [(PedestrianARViewController *)self analyticsTarget];
      uint64_t v10 = 122;
    }
    else
    {
      uint64_t v9 = [(PedestrianARViewController *)self analyticsTarget];
      uint64_t v10 = 119;
    }
  }
  else
  {
    uint64_t v9 = [(PedestrianARViewController *)self analyticsTarget];
    uint64_t v10 = 120;
  }
  +[GEOAPPortal captureUserAction:v10 target:v9 value:0];
  if (![(PedestrianARViewController *)self isStopping])
  {
    __int16 v11 = sub_10057812C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "VLF localization failed: %@", buf, 0xCu);
    }

    [(PedestrianARViewController *)self setState:3];
  }
  os_activity_scope_leave(&v12);
}

- (void)closeButtonTapped:(id)a3
{
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v5, &state);

  id v6 = sub_10057812C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "User tapped close button", v7, 2u);
  }

  [(PedestrianARViewController *)self stop];
  os_activity_scope_leave(&state);
}

- (void)ttrButtonTapped:(id)a3
{
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v5, &state);

  id v6 = sub_10057812C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "User tapped TTR button", v8, 2u);
  }

  id v7 = +[PedestrianARFloatingDebugViewController sharedInstance];
  [v7 composeTTR];

  os_activity_scope_leave(&state);
}

- (void)applyTransitionWithProgress:(double)a3
{
  id v4 = [(PedestrianARViewController *)self view];
  [v4 setAlpha:a3];
}

- (void)failureViewRetryButtonTapped:(id)a3
{
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v5, &state);

  id v6 = sub_10057812C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "User-initiated retry after failure", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1009EF8B4;
  v7[3] = &unk_1012E6708;
  objc_copyWeak(&v8, buf);
  [(PedestrianARViewController *)self showVLTracePopupIfNecessaryWithCompletion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
  os_activity_scope_leave(&state);
}

- (void)failureViewDismissButtonTapped:(id)a3
{
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v5, &state);

  id v6 = sub_10057812C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "User-initiated dismiss after failure", v7, 2u);
  }

  [(PedestrianARViewController *)self setIsDismissing:1];
  [(ContainerViewController *)self popLastViewControllerAnimated:1];
  os_activity_scope_leave(&state);
}

- (void)didResignContainee:(id)a3 finished:(BOOL)a4
{
  id v7 = a3;
  id v5 = [(PedestrianARViewController *)self failureContainee];
  if (v5 == v7)
  {
    unsigned int v6 = [(PedestrianARViewController *)self isDismissing];

    if (v6) {
      [(PedestrianARViewController *)self stop];
    }
  }
  else
  {
  }
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v5, &v7);

  unsigned int v6 = sub_1009E7C9C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] App backgrounded; dismissing ourselves",
      buf,
      0xCu);
  }

  [(PedestrianARViewController *)self stop];
  os_activity_scope_leave(&v7);
}

- (void)vlfSessionDidGetFirstFrameNotification:(id)a3
{
}

- (void)navigationSession:(id)a3 didUpdateRouteCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PedestrianARViewController *)self activity];
  os_activity_scope_enter(v8, &v14);

  uint64_t v9 = [v7 currentRoute];
  uint64_t v10 = sub_1009E7C9C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = [v9 uniqueRouteID];
    os_activity_scope_state_s v12 = [v11 UUIDString];
    *(_DWORD *)buf = 134349314;
    int v16 = self;
    __int16 v17 = 2112;
    double v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Route updated: %@", buf, 0x16u);
  }
  [(PedestrianARViewController *)self setRoute:v9];
  if ([(PedestrianARViewController *)self isRerouting])
  {
    [(PedestrianARViewController *)self cancelReroute];
    __int16 v13 = sub_1009E7C9C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      int v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Reroute succeeded", buf, 0xCu);
    }

    [(PedestrianARViewController *)self waitForActiveFeatureIfNecessary];
  }

  os_activity_scope_leave(&v14);
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
    os_activity_scope_state_s v14 = [(PedestrianARViewController *)self configuration];
    if (v14)
    {
      __int16 v15 = [(PedestrianARViewController *)self configuration];
      -[PedestrianARViewController setShouldUpdateCameraFocusLensPosition:](self, "setShouldUpdateCameraFocusLensPosition:", [v15 isAutoFocusEnabled] ^ 1);
    }
    else
    {
      [(PedestrianARViewController *)self setShouldUpdateCameraFocusLensPosition:0];
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)PedestrianARViewController;
    [(PedestrianARViewController *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (PedestrianARViewControllerDelegate)arDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_arDelegate);

  return (PedestrianARViewControllerDelegate *)WeakRetained;
}

- (void)setArDelegate:(id)a3
{
}

- (NavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (void)setNavigationSession:(id)a3
{
}

- (int64_t)entryPoint
{
  return self->_entryPoint;
}

- (int64_t)state
{
  return self->_state;
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (void)setPlatformController:(id)a3
{
}

- (GuidanceObserver)guidanceObserver
{
  return self->_guidanceObserver;
}

- (void)setGuidanceObserver:(id)a3
{
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
}

- (UIButton)ttrButton
{
  return self->_ttrButton;
}

- (void)setTtrButton:(id)a3
{
}

- (MUBlurView)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (NSLayoutConstraint)closeButtonTopConstraint
{
  return self->_closeButtonTopConstraint;
}

- (void)setCloseButtonTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)closeButtonTrailingConstraint
{
  return self->_closeButtonTrailingConstraint;
}

- (void)setCloseButtonTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)closeButtonSafeAreaTrailingConstraint
{
  return self->_closeButtonSafeAreaTrailingConstraint;
}

- (void)setCloseButtonSafeAreaTrailingConstraint:(id)a3
{
}

- (PedestrianARRenderingView)renderingView
{
  return self->_renderingView;
}

- (void)setRenderingView:(id)a3
{
}

- (PedestrianARGradientOverlay)gradientOverlay
{
  return self->_gradientOverlay;
}

- (void)setGradientOverlay:(id)a3
{
}

- (void)setLocalizingView:(id)a3
{
}

- (PedestrianARInstructionContainerView)instructionContainerView
{
  return self->_instructionContainerView;
}

- (void)setInstructionContainerView:(id)a3
{
}

- (PedestrianARSafetyView)safetyView
{
  return self->_safetyView;
}

- (void)setSafetyView:(id)a3
{
}

- (PedestrianARArrowGuidanceView)arrowGuidanceView
{
  return self->_arrowGuidanceView;
}

- (void)setArrowGuidanceView:(id)a3
{
}

- (NSLayoutConstraint)arrowGuidanceViewLeadingConstraint
{
  return self->_arrowGuidanceViewLeadingConstraint;
}

- (void)setArrowGuidanceViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)arrowGuidanceViewLeadingSafeAreaConstraint
{
  return self->_arrowGuidanceViewLeadingSafeAreaConstraint;
}

- (void)setArrowGuidanceViewLeadingSafeAreaConstraint:(id)a3
{
}

- (NSLayoutConstraint)arrowGuidanceViewTrailingConstraint
{
  return self->_arrowGuidanceViewTrailingConstraint;
}

- (void)setArrowGuidanceViewTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)arrowGuidanceViewTrailingSafeAreaConstraint
{
  return self->_arrowGuidanceViewTrailingSafeAreaConstraint;
}

- (void)setArrowGuidanceViewTrailingSafeAreaConstraint:(id)a3
{
}

- (PedestrianARFailureContaineeViewController)failureContainee
{
  return self->_failureContainee;
}

- (void)setFailureContainee:(id)a3
{
}

- (AuxiliaryTasksManager)auxiliaryTasksManager
{
  return self->_auxiliaryTasksManager;
}

- (void)setAuxiliaryTasksManager:(id)a3
{
}

- (NSDate)arkitSessionStartTimestamp
{
  return self->_arkitSessionStartTimestamp;
}

- (void)setArkitSessionStartTimestamp:(id)a3
{
}

- (ARSession)session
{
  return self->_session;
}

- (VLFSession)vlfSession
{
  return self->_vlfSession;
}

- (void)setVlfSession:(id)a3
{
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (BOOL)isStopping
{
  return self->_isStopping;
}

- (void)setIsStopping:(BOOL)a3
{
  self->_isStopping = a3;
}

- (BOOL)didRenderLabel
{
  return self->_didRenderLabel;
}

- (void)setDidRenderLabel:(BOOL)a3
{
  self->_didRenderLabel = a3;
}

- (BOOL)didFailUndulationLookup
{
  return self->_didFailUndulationLookup;
}

- (void)setDidFailUndulationLookup:(BOOL)a3
{
  self->_didFailUndulationLookup = a3;
}

- (BOOL)sentDisappearNotification
{
  return self->_sentDisappearNotification;
}

- (void)setSentDisappearNotification:(BOOL)a3
{
  self->_sentDisappearNotification = a3;
}

- (BOOL)shouldUpdateCameraFocusLensPosition
{
  return self->_shouldUpdateCameraFocusLensPosition;
}

- (void)setShouldUpdateCameraFocusLensPosition:(BOOL)a3
{
  self->_shouldUpdateCameraFocusLensPosition = a3;
}

- (BOOL)didShowVLTracePopup
{
  return self->_didShowVLTracePopup;
}

- (void)setDidShowVLTracePopup:(BOOL)a3
{
  self->_didShowVLTracePopup = a3;
}

- (GCDTimer)failureViewTimeoutTimer
{
  return self->_failureViewTimeoutTimer;
}

- (void)setFailureViewTimeoutTimer:(id)a3
{
}

- (GCDTimer)rerouteCompletionTimer
{
  return self->_rerouteCompletionTimer;
}

- (void)setRerouteCompletionTimer:(id)a3
{
}

- (GCDTimer)activeFeatureTimer
{
  return self->_activeFeatureTimer;
}

- (void)setActiveFeatureTimer:(id)a3
{
}

- (UINotificationFeedbackGenerator)notificationGenerator
{
  return self->_notificationGenerator;
}

- (void)setNotificationGenerator:(id)a3
{
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_notificationGenerator, 0);
  objc_storeStrong((id *)&self->_activeFeatureTimer, 0);
  objc_storeStrong((id *)&self->_rerouteCompletionTimer, 0);
  objc_storeStrong((id *)&self->_failureViewTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_vlfSession, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_arkitSessionStartTimestamp, 0);
  objc_storeStrong((id *)&self->_auxiliaryTasksManager, 0);
  objc_storeStrong((id *)&self->_failureContainee, 0);
  objc_storeStrong((id *)&self->_arrowGuidanceViewTrailingSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_arrowGuidanceViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_arrowGuidanceViewLeadingSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_arrowGuidanceViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_arrowGuidanceView, 0);
  objc_storeStrong((id *)&self->_safetyView, 0);
  objc_storeStrong((id *)&self->_instructionContainerView, 0);
  objc_storeStrong((id *)&self->_localizingView, 0);
  objc_storeStrong((id *)&self->_gradientOverlay, 0);
  objc_storeStrong((id *)&self->_renderingView, 0);
  objc_storeStrong((id *)&self->_closeButtonSafeAreaTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_closeButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_closeButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_ttrButton, 0);
  objc_storeStrong((id *)&self->_navigationService, 0);
  objc_storeStrong((id *)&self->_guidanceObserver, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong((id *)&self->_navigationSession, 0);
  objc_destroyWeak((id *)&self->_arDelegate);

  objc_storeStrong((id *)&self->_route, 0);
}

@end