@interface StepContainerViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isStepOnTransitLine:(id)a3;
- (BOOL)_isTrackingLocation;
- (BOOL)_shouldShowHeadingIndicatorForStep:(id)a3;
- (BOOL)hasDesiredUserTrackingMode;
- (BOOL)isGoingToEnterGuidance;
- (BOOL)isUserTrackingViewVisible;
- (BOOL)isVLFActive;
- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4;
- (BOOL)mustNotBreakUserTrackingMode;
- (BOOL)pptTestHasNextStep;
- (BOOL)pptTestMoveToBoardStep;
- (BOOL)pptTestSupportStepping;
- (BOOL)showStatusBarBackgroundViewUnderDimmingView;
- (BOOL)showStatusBarBackgroundViewWhenResigning;
- (BOOL)showingOverview;
- (BOOL)userIsInteractingWithMap;
- (GEOComposedRoute)route;
- (MKMapView)mapView;
- (MNLocation)previousMatchedLocation;
- (MapCameraController)mapCameraController;
- (NSDate)lastMapTouchDate;
- (NSDate)startDate;
- (NSDateComponentsFormatter)debugHoursDurationFormatter;
- (NSDateComponentsFormatter)debugMinsDurationFormatter;
- (NSLayoutConstraint)scrollViewHeightConstraint;
- (NSLayoutConstraint)userLocationBottomConstraint;
- (NSLayoutConstraint)userLocationLeadingConstraint;
- (NSLayoutConstraint)userLocationTrailingConstraint;
- (NSMutableDictionary)isExpandedMapping;
- (NSTimer)arrivalEndTimer;
- (NSTimer)backgroundArrivalTimer;
- (NSTimer)delayAutoAdvanceTimer;
- (NSTimer)locationExpirationTimer;
- (NavDebugLocationManager)debugLocationManager;
- (NavIdleTimeoutTimer)idleTimer;
- (NavigationDebugViewsController)debugViewsController;
- (StatusIndicatorManager)statusIndicatorManager;
- (StatusIndicatorView)statusIndicatorView;
- (StepActionCoordinator)stepActionCoordinator;
- (StepContainerViewController)initWithRoute:(id)a3 initialStepIndex:(unint64_t)a4;
- (StepContainerViewController)initWithRoute:(id)a3 initialStepIndex:(unint64_t)a4 desiredTrackingMode:(int64_t)a5;
- (SteppingPageViewController)pagingVC;
- (SteppingSignGenerator)signGenerator;
- (UIButton)recenterButton;
- (UIScrollView)verticalSignScrollView;
- (double)availableHeight;
- (double)maximumSignHeight;
- (double)topEdgeInset;
- (id)_geoRouteDetails;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (id)passThroughView;
- (id)statusBarBackgroundViewStyle;
- (id)statusBarSupplementaryView;
- (int64_t)desiredUserTrackingMode;
- (int64_t)hasArrived;
- (int64_t)pptTestCurrentStepIndex;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)initialStepIndex;
- (unint64_t)matchedSignIndex;
- (unint64_t)matchedStepIndex;
- (unint64_t)maxLayoutForEdgeInsetsUpdate;
- (unint64_t)originalLayoutForViewController:(id)a3;
- (void)_addNavigationObservers;
- (void)_arrivalEndTimerFired;
- (void)_backgroundArrivalTimerFired;
- (void)_delayTimerFired;
- (void)_didEnterBackground:(id)a3;
- (void)_invalidateTimers;
- (void)_locationExpirationTimerFired;
- (void)_locationManagerApprovalDidChange:(id)a3;
- (void)_pressedRecenterButton;
- (void)_setGizmoStepIndex:(unint64_t)matchedStepIndex;
- (void)_setUserTrackingMode:(int64_t)a3 animated:(BOOL)a4;
- (void)_setupConstraints;
- (void)_setupDebugUtilities;
- (void)_setupViews;
- (void)_showInitialStepIfNecessary;
- (void)_startArrivalEndTimerIfNecessary;
- (void)_stopArrivalEndTimer;
- (void)_toggleTraceControls;
- (void)_updateCompassLayout;
- (void)_updateDebugConsoleForLocation:(id)a3;
- (void)_updateForMatchedStepIndex:(unint64_t)a3 matchedSegmentIndex:(unint64_t)a4;
- (void)_updateIdleTimer;
- (void)_updateMapRegionForSignAtIndex:(int64_t)a3;
- (void)_updateStatusBarIndicatorLayout;
- (void)_updateUserLocationViewAppearanceWithMatchedLocation:(id)a3;
- (void)_willEnterForeground:(id)a3;
- (void)containerStyleManagerConfigureLayoutForStyle:(unint64_t)a3;
- (void)containerStyleManagerDidChangeStyle:(unint64_t)a3;
- (void)dealloc;
- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4;
- (void)idleTimerDidTimeout:(id)a3;
- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4;
- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4;
- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapViewDidFinishInitialUserTrackingModeAnimation:(id)a3;
- (void)mapViewDidFinishLoadingMap:(id)a3;
- (void)mapViewDidStartUserInteraction:(id)a3;
- (void)mapViewDidStopUserInteraction:(id)a3;
- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)pptTestMoveToNextStep;
- (void)setArrivalEndTimer:(id)a3;
- (void)setBackgroundArrivalTimer:(id)a3;
- (void)setDebugLocationManager:(id)a3;
- (void)setDebugViewsController:(id)a3;
- (void)setDelayAutoAdvanceTimer:(id)a3;
- (void)setDesiredUserTrackingMode:(int64_t)a3;
- (void)setHasArrived:(int64_t)a3;
- (void)setHasDesiredUserTrackingMode:(BOOL)a3;
- (void)setIdleTimer:(id)a3;
- (void)setInitialStepIndex:(unint64_t)a3;
- (void)setIsExpandedMapping:(id)a3;
- (void)setIsGoingToEnterGuidance:(BOOL)a3;
- (void)setLastMapTouchDate:(id)a3;
- (void)setLocationExpirationTimer:(id)a3;
- (void)setMapCameraController:(id)a3;
- (void)setMatchedSignIndex:(unint64_t)a3;
- (void)setMustNotBreakUserTrackingMode:(BOOL)a3;
- (void)setPagingVC:(id)a3;
- (void)setPreviousMatchedLocation:(id)a3;
- (void)setRecenterButton:(id)a3;
- (void)setScrollViewHeightConstraint:(id)a3;
- (void)setShowingOverview:(BOOL)a3;
- (void)setSignGenerator:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setStatusIndicatorManager:(id)a3;
- (void)setStatusIndicatorView:(id)a3;
- (void)setStepActionCoordinator:(id)a3;
- (void)setUserIsInteractingWithMap:(BOOL)a3;
- (void)setUserLocationBottomConstraint:(id)a3;
- (void)setUserLocationLeadingConstraint:(id)a3;
- (void)setUserLocationTrailingConstraint:(id)a3;
- (void)setUserTrackingViewVisible:(BOOL)a3;
- (void)setUserTrackingViewVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setVerticalSignScrollView:(id)a3;
- (void)setVlfActive:(BOOL)a3;
- (void)showOverview:(BOOL)a3 andZoomToMapRegion:(BOOL)a4;
- (void)statusIndicatorTypeChanged:(unint64_t)a3;
- (void)steppingPageViewController:(id)a3 didChangeCurrentSign:(int64_t)a4 previousSign:(int64_t)a5 fromUserGesture:(unint64_t)a6;
- (void)steppingPageViewControllerDidChangeSignHeight:(id)a3;
- (void)steppingPageViewControllerUserDidStartScrolling:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateLayoutAnimated:(BOOL)a3;
- (void)updateWithDisplayedStep:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)vlfContaineeViewControllerDidDisappearNotification:(id)a3;
- (void)vlfSessionTaskWillShowVLFUINotification:(id)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation StepContainerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (StepContainerViewController)initWithRoute:(id)a3 initialStepIndex:(unint64_t)a4
{
  id v7 = a3;
  v26.receiver = self;
  v26.super_class = (Class)StepContainerViewController;
  v8 = [(ContainerViewController *)&v26 initWithNibName:0 bundle:0];
  if (v8)
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [(StepContainerViewController *)v8 setAccessibilityIdentifier:v10];

    objc_storeStrong((id *)&v8->_route, a3);
    if ([(GEOComposedRoute *)v8->_route transportType] == 1)
    {
      v23 = sub_1005762E4();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v28 = "-[StepContainerViewController initWithRoute:initialStepIndex:]";
        __int16 v29 = 2080;
        v30 = "StepContainerViewController.m";
        __int16 v31 = 1024;
        int v32 = 155;
        __int16 v33 = 2080;
        v34 = "_route.transportType != GEOTransportType_TRANSIT";
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
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
    v11 = +[MNNavigationService sharedService];
    v8->_matchedStepIndex = (unint64_t)[v11 stepIndex];

    v8->_matchedSignIndex = 0x7FFFFFFFFFFFFFFFLL;
    v8->_isGoingToEnterGuidance = 1;
    uint64_t v12 = +[NSDate date];
    startDate = v8->_startDate;
    v8->_startDate = (NSDate *)v12;

    v8->_initialStepIndex = a4;
    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    isExpandedMapping = v8->_isExpandedMapping;
    v8->_isExpandedMapping = v14;

    v8->_userTrackingViewVisible = 1;
    v16 = sub_1005F9AF4();
    [(OverlayContainerViewController *)v8 setDimmingBehaviour:v16];

    [(StepContainerViewController *)v8 _addNavigationObservers];
    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v8 selector:"_willEnterForeground:" name:UISceneWillEnterForegroundNotification object:0];

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v8 selector:"_didEnterBackground:" name:UISceneDidEnterBackgroundNotification object:0];

    v19 = [[StatusIndicatorManager alloc] initWithDelegate:v8];
    [(StepContainerViewController *)v8 setStatusIndicatorManager:v19];

    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v8 selector:"vlfSessionTaskWillShowVLFUINotification:" name:@"VLFSessionTaskWillShowVLFUINotification" object:0];

    v21 = +[NSNotificationCenter defaultCenter];
    [v21 addObserver:v8 selector:"vlfContaineeViewControllerDidDisappearNotification:" name:off_1015F7850 object:0];
  }
  return v8;
}

- (StepContainerViewController)initWithRoute:(id)a3 initialStepIndex:(unint64_t)a4 desiredTrackingMode:(int64_t)a5
{
  result = [(StepContainerViewController *)self initWithRoute:a3 initialStepIndex:a4];
  if (result)
  {
    result->_hasDesiredUserTrackingMode = 1;
    result->_desiredUserTrackingMode = a5;
  }
  return result;
}

- (StepActionCoordinator)stepActionCoordinator
{
  stepActionCoordinator = self->_stepActionCoordinator;
  if (!stepActionCoordinator)
  {
    v4 = [[StepActionCoordinator alloc] initWithContainerViewController:self];
    v5 = self->_stepActionCoordinator;
    self->_stepActionCoordinator = v4;

    stepActionCoordinator = self->_stepActionCoordinator;
  }

  return stepActionCoordinator;
}

- (void)_addNavigationObservers
{
  id v3 = +[MNNavigationService sharedService];
  [v3 registerObserver:self];
}

- (void)_setupDebugUtilities
{
  id v3 = [(ContainerViewController *)self chromeViewController];
  id v20 = [v3 mapView];

  v4 = +[GEOPlatform sharedPlatform];
  unsigned int v5 = [v4 isInternalInstall];

  if (v5)
  {
    v6 = objc_alloc_init(NavDebugLocationManager);
    debugLocationManager = self->_debugLocationManager;
    self->_debugLocationManager = v6;

    v8 = [(ContainerViewController *)self chromeViewController];
    v9 = [v8 mapView];
    [(NavDebugLocationManager *)self->_debugLocationManager setMapView:v9];

    v10 = [v20 _debugConsole];
    [v10 setCustomTextEnabled:1];

    v11 = [v20 _debugConsole];
    [v11 setPageIndex:2];

    [(StepContainerViewController *)self _updateDebugConsoleForLocation:0];
  }
  uint64_t v12 = +[MNNavigationService sharedService];
  unsigned int v13 = [v12 isNavigatingFromTrace];

  if (v13)
  {
    v14 = [[NavigationDebugViewsController alloc] initWithDelegate:0];
    debugViewsController = self->_debugViewsController;
    self->_debugViewsController = v14;

    [(NavigationDebugViewsController *)self->_debugViewsController setShowTraceControlsForStaleLocations:0];
    v16 = [(StepContainerViewController *)self debugViewsController];
    v17 = [(OverlayContainerViewController *)self overlayView];
    v18 = [(OverlayContainerViewController *)self innerLayoutGuide];
    v19 = [(ContainerViewController *)self chromeViewController];
    [v16 addDebugViewsToView:v17 layoutGuide:v18 mapView:v20 modalPresentingViewController:v19];
  }
}

- (void)dealloc
{
  id v3 = +[MNNavigationService sharedService];
  [v3 unregisterObserver:self];

  [(StepContainerViewController *)self _invalidateTimers];
  v4.receiver = self;
  v4.super_class = (Class)StepContainerViewController;
  [(StepContainerViewController *)&v4 dealloc];
}

- (void)updateWithDisplayedStep:(id)a3
{
  pagingVC = self->_pagingVC;
  id v5 = a3;
  v6 = [(SteppingPageViewController *)pagingVC signGenerator];
  id v7 = [v6 signIndexForStep:v5];

  [(SteppingPageViewController *)self->_pagingVC setSignIndex:v7];
  if ((unint64_t)v7 <= 0x7FFFFFFFFFFFFFFELL)
  {
    v8 = [(StepContainerViewController *)self route];
    [v8 setCurrentDisplayStep:v7];
  }

  [(StepContainerViewController *)self _updateMapRegionForSignAtIndex:v7];
}

- (void)showOverview:(BOOL)a3 andZoomToMapRegion:(BOOL)a4
{
  self->_showingOverview = a3;
  if (a4)
  {
    if (a3)
    {
      id v5 = [(StepContainerViewController *)self mapCameraController];
      v6 = [(StepContainerViewController *)self route];
      v9 = v6;
      id v7 = +[NSArray arrayWithObjects:&v9 count:1];
      [v5 frameRoutes:v7 includeCompassInset:1 animated:1 completion:0];
    }
    else
    {
      int64_t v8 = [(SteppingPageViewController *)self->_pagingVC signIndex];
      [(StepContainerViewController *)self _updateMapRegionForSignAtIndex:v8];
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)StepContainerViewController;
  [(OverlayContainerViewController *)&v3 viewDidLayoutSubviews];
  [(StepContainerViewController *)self _updateCompassLayout];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)StepContainerViewController;
  [(OverlayContainerViewController *)&v5 viewDidLoad];
  [(StepContainerViewController *)self _setupViews];
  objc_super v3 = [(StepContainerViewController *)self stepActionCoordinator];
  [v3 viewControllerPresentTray:self];

  objc_super v4 = [(StepContainerViewController *)self statusIndicatorManager];
  [v4 updateIndicatorType];
}

- (void)_setupViews
{
  objc_super v3 = [[DrivingWalkingSteppingSignGenerator alloc] initWithRoute:self->_route];
  signGenerator = self->_signGenerator;
  self->_signGenerator = (SteppingSignGenerator *)v3;

  objc_super v5 = [(SteppingSignGenerator *)self->_signGenerator stepsWithCorrespondingSigns];
  [(GEOComposedRoute *)self->_route setManeuverDisplaySteps:v5];

  v6 = [objc_alloc((Class)UIScrollView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  verticalSignScrollView = self->_verticalSignScrollView;
  self->_verticalSignScrollView = v6;

  [(UIScrollView *)self->_verticalSignScrollView setContentInsetAdjustmentBehavior:2];
  [(UIScrollView *)self->_verticalSignScrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)self->_verticalSignScrollView setScrollEnabled:0];
  [(UIScrollView *)self->_verticalSignScrollView setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)self->_verticalSignScrollView setShowsVerticalScrollIndicator:0];
  [(UIScrollView *)self->_verticalSignScrollView setAccessibilityIdentifier:@"StepContainerVerticalSignScrollView"];
  int64_t v8 = [(OverlayContainerViewController *)self topContentView];
  [v8 addSubview:self->_verticalSignScrollView];

  v9 = [[SteppingPageViewController alloc] initWithSignGenerator:self->_signGenerator];
  pagingVC = self->_pagingVC;
  self->_pagingVC = v9;

  [(SteppingPageViewController *)self->_pagingVC setDelegate:self];
  [(SteppingPageViewController *)self->_pagingVC setAccessibilityIdentifier:@"StepContainerPagingView"];
  [(ContainerViewController *)self addChildViewController:self->_pagingVC];
  v11 = [(SteppingPageViewController *)self->_pagingVC view];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v12 = self->_verticalSignScrollView;
  unsigned int v13 = [(SteppingPageViewController *)self->_pagingVC view];
  [(UIScrollView *)v12 addSubview:v13];

  [(SteppingPageViewController *)self->_pagingVC didMoveToParentViewController:self];
  [(SteppingSignGenerator *)self->_signGenerator setCellVendor:self->_pagingVC];
  v14 = (UIButton *)objc_opt_new();
  recenterButton = self->_recenterButton;
  self->_recenterButton = v14;

  [(UIButton *)self->_recenterButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = +[UIColor systemBackgroundColor];
  [(UIButton *)self->_recenterButton setBackgroundColor:v16];

  v17 = +[UIColor systemBlueColor];
  [(UIButton *)self->_recenterButton setTintColor:v17];

  [(UIButton *)self->_recenterButton setAccessibilityIdentifier:@"RecenterButton"];
  v18 = +[NSBundle mainBundle];
  v19 = [v18 localizedStringForKey:@"[Navigation] Recenter" value:@"localized string not found" table:0];
  [(UIButton *)self->_recenterButton setAccessibilityLabel:v19];

  [(UIButton *)self->_recenterButton addTarget:self action:"_pressedRecenterButton" forControlEvents:64];
  id v35 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
  id v20 = self->_recenterButton;
  v21 = +[UIImage systemImageNamed:@"location.fill" withConfiguration:v35];
  [(UIButton *)v20 setImage:v21 forState:0];

  v22 = [(UIButton *)self->_recenterButton layer];
  [v22 setCornerRadius:30.0];

  v23 = [(UIButton *)self->_recenterButton layer];
  LODWORD(v24) = 1045220557;
  [v23 setShadowOpacity:v24];

  double height = CGSizeZero.height;
  objc_super v26 = [(UIButton *)self->_recenterButton layer];
  [v26 setShadowOffset:CGSizeZero.width, height];

  v27 = [(UIButton *)self->_recenterButton layer];
  [v27 setShadowRadius:1.0];

  -[UIButton _setTouchInsets:](self->_recenterButton, "_setTouchInsets:", -8.0, -16.0, -8.0, -16.0);
  v28 = [(StepContainerViewController *)self stepActionCoordinator];
  -[StepContainerViewController setUserTrackingViewVisible:](self, "setUserTrackingViewVisible:", [v28 isAuthorizedForPreciseLocation]);

  __int16 v29 = +[NSNotificationCenter defaultCenter];
  [v29 addObserver:self selector:"_locationManagerApprovalDidChange:" name:MKLocationManagerApprovalDidChangeNotification object:0];

  v30 = [(OverlayContainerViewController *)self overlayView];
  [v30 addSubview:self->_recenterButton];

  __int16 v31 = [(StepContainerViewController *)self mapView];
  [(ContainerViewController *)self edgePadding];
  double v33 = v32;
  [(ContainerViewController *)self edgePadding];
  [v31 _setCompassInsets:v33, 0.0, 0.0, v34];

  [(StepContainerViewController *)self _setupConstraints];
}

- (void)_setupConstraints
{
  objc_super v3 = [(UIScrollView *)self->_verticalSignScrollView heightAnchor];
  objc_super v4 = [v3 constraintEqualToConstant:0.0];
  scrollViewHeightConstraint = self->_scrollViewHeightConstraint;
  self->_scrollViewHeightConstraint = v4;

  v6 = [(OverlayContainerViewController *)self innerLayoutGuide];
  id v7 = [v6 bottomAnchor];
  int64_t v8 = [(UIButton *)self->_recenterButton bottomAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  userLocationBottomConstraint = self->_userLocationBottomConstraint;
  self->_userLocationBottomConstraint = v9;

  v11 = [(UIButton *)self->_recenterButton leadingAnchor];
  uint64_t v12 = [(OverlayContainerViewController *)self innerLayoutGuide];
  unsigned int v13 = [v12 leadingAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  userLocationLeadingConstraint = self->_userLocationLeadingConstraint;
  self->_userLocationLeadingConstraint = v14;

  v16 = [(OverlayContainerViewController *)self innerLayoutGuide];
  v17 = [v16 trailingAnchor];
  v18 = [(UIButton *)self->_recenterButton trailingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  userLocationTrailingConstraint = self->_userLocationTrailingConstraint;
  self->_userLocationTrailingConstraint = v19;

  v63 = [(UIScrollView *)self->_verticalSignScrollView topAnchor];
  v64 = [(OverlayContainerViewController *)self topContentView];
  v62 = [v64 topAnchor];
  v61 = [v63 constraintEqualToAnchor:v62];
  v65[0] = v61;
  v59 = [(UIScrollView *)self->_verticalSignScrollView bottomAnchor];
  v60 = [(OverlayContainerViewController *)self topContentView];
  v58 = [v60 bottomAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v65[1] = v57;
  v55 = [(UIScrollView *)self->_verticalSignScrollView leadingAnchor];
  v56 = [(OverlayContainerViewController *)self topContentView];
  v54 = [v56 leadingAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v65[2] = v53;
  v51 = [(UIScrollView *)self->_verticalSignScrollView trailingAnchor];
  v52 = [(OverlayContainerViewController *)self topContentView];
  v50 = [v52 trailingAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v65[3] = v49;
  v47 = [(UIScrollView *)self->_verticalSignScrollView widthAnchor];
  v48 = [(SteppingPageViewController *)self->_pagingVC view];
  v46 = [v48 widthAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v21 = self->_scrollViewHeightConstraint;
  v65[4] = v45;
  v65[5] = v21;
  v44 = [(SteppingPageViewController *)self->_pagingVC view];
  v43 = [v44 topAnchor];
  v42 = [(UIScrollView *)self->_verticalSignScrollView topAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v65[6] = v41;
  v40 = [(SteppingPageViewController *)self->_pagingVC view];
  v39 = [v40 bottomAnchor];
  v38 = [(UIScrollView *)self->_verticalSignScrollView bottomAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v65[7] = v37;
  v36 = [(SteppingPageViewController *)self->_pagingVC view];
  id v35 = [v36 leadingAnchor];
  double v34 = [(UIScrollView *)self->_verticalSignScrollView leadingAnchor];
  double v33 = [v35 constraintEqualToAnchor:v34];
  v65[8] = v33;
  v22 = [(SteppingPageViewController *)self->_pagingVC view];
  v23 = [v22 trailingAnchor];
  double v24 = [(UIScrollView *)self->_verticalSignScrollView trailingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v65[9] = v25;
  objc_super v26 = [(SteppingPageViewController *)self->_pagingVC signHeightConstraint];
  v65[10] = v26;
  v27 = [(UIButton *)self->_recenterButton widthAnchor];
  v28 = [v27 constraintEqualToConstant:60.0];
  v65[11] = v28;
  __int16 v29 = [(UIButton *)self->_recenterButton heightAnchor];
  v30 = [v29 constraintEqualToConstant:60.0];
  __int16 v31 = self->_userLocationBottomConstraint;
  v65[12] = v30;
  v65[13] = v31;
  v65[14] = self->_userLocationLeadingConstraint;
  double v32 = +[NSArray arrayWithObjects:v65 count:15];
  +[NSLayoutConstraint activateConstraints:v32];
}

- (void)_updateCompassLayout
{
  objc_super v3 = [(ContainerViewController *)self chromeViewController];
  objc_super v4 = [v3 mapView];
  [v4 _compassInsets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  if (sub_1000BBB44(self) != 5)
  {
    unsigned int v13 = [(ContainerViewController *)self chromeViewController];
    v14 = [v13 floatingControlsOverlay];
    [v14 margin];
    double v12 = v15;

    double v6 = v12;
  }
  id v17 = [(ContainerViewController *)self chromeViewController];
  v16 = [v17 mapView];
  [v16 _setCompassInsets:v6, v8, v10, v12];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)StepContainerViewController;
  [(ContainerViewController *)&v6 viewWillAppear:a3];
  [(StepContainerViewController *)self _setupDebugUtilities];
  if ([(StepContainerViewController *)self _isTrackingLocation])
  {
    objc_super v4 = +[MNNavigationService sharedService];
    double v5 = [v4 lastLocation];

    [(StepContainerViewController *)self _updateUserLocationViewAppearanceWithMatchedLocation:v5];
  }
  if (self->_hasDesiredUserTrackingMode)
  {
    self->_mustNotBreakUserTrackingMode = 1;
    [(StepContainerViewController *)self _setUserTrackingMode:self->_desiredUserTrackingMode animated:1];
    self->_hasDesiredUserTrackingMode = 0;
  }
  [(StepContainerViewController *)self _startArrivalEndTimerIfNecessary];
  [(StepContainerViewController *)self _updateIdleTimer];
  [(StepContainerViewController *)self _updateStatusBarIndicatorLayout];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)StepContainerViewController;
  [(OverlayContainerViewController *)&v4 viewDidAppear:a3];
  [(StepContainerViewController *)self _showInitialStepIfNecessary];
}

- (void)_showInitialStepIfNecessary
{
  id v11 = [(StepContainerViewController *)self view];
  uint64_t v3 = [v11 superview];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    unint64_t v5 = [(ContainerViewController *)self containerStyle];

    if (!v5) {
      return;
    }
    unint64_t initialStepIndex = self->_initialStepIndex;
    if (initialStepIndex == 0x7FFFFFFFFFFFFFFFLL) {
      return;
    }
    double v7 = [(GEOComposedRoute *)self->_route steps];
    id v8 = [v7 count];

    if (initialStepIndex >= (unint64_t)v8) {
      return;
    }
    double v9 = [(GEOComposedRoute *)self->_route steps];
    id v12 = [v9 objectAtIndexedSubscript:self->_initialStepIndex];

    double v10 = v12;
    if (v12)
    {
      [(StepContainerViewController *)self updateWithDisplayedStep:v12];
      -[StepContainerViewController _setGizmoStepIndex:](self, "_setGizmoStepIndex:", [v12 stepIndex]);
      double v10 = v12;
    }
    self->_unint64_t initialStepIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    double v10 = v11;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)StepContainerViewController;
  [(ContainerViewController *)&v9 viewDidDisappear:a3];
  debugViewsController = self->_debugViewsController;
  unint64_t v5 = [(OverlayContainerViewController *)self overlayView];
  [(NavigationDebugViewsController *)debugViewsController removeDebugViewsFromView:v5];

  [(NavDebugLocationManager *)self->_debugLocationManager setMapView:0];
  debugLocationManager = self->_debugLocationManager;
  self->_debugLocationManager = 0;

  double v7 = [(StepContainerViewController *)self mapView];
  id v8 = [v7 _debugConsole];
  [v8 setCustomTextEnabled:0];

  [(StepContainerViewController *)self _invalidateTimers];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)StepContainerViewController;
  [(ContainerViewController *)&v7 willTransitionToTraitCollection:a3 withTransitionCoordinator:a4];
  unint64_t v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  isExpandedMapping = self->_isExpandedMapping;
  self->_isExpandedMapping = v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)StepContainerViewController;
  [(ContainerViewController *)&v4 traitCollectionDidChange:a3];
  [(StepContainerViewController *)self _updateStatusBarIndicatorLayout];
}

- (unint64_t)originalLayoutForViewController:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(StepContainerViewController *)self stepActionCoordinator];
  id v6 = [v5 originalLayoutForViewController:v4];

  return (unint64_t)v6;
}

- (void)updateLayoutAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)StepContainerViewController;
  [(ContainerViewController *)&v4 updateLayoutAnimated:a3];
  [(StepContainerViewController *)self _updateIdleTimer];
}

- (void)containerStyleManagerConfigureLayoutForStyle:(unint64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)StepContainerViewController;
  [(OverlayContainerViewController *)&v14 containerStyleManagerConfigureLayoutForStyle:"containerStyleManagerConfigureLayoutForStyle:"];
  unint64_t v5 = &OBJC_IVAR___StepContainerViewController__userLocationLeadingConstraint;
  id v6 = &OBJC_IVAR___StepContainerViewController__userLocationTrailingConstraint;
  double v7 = 0.0;
  if (a3 <= 7 && ((1 << a3) & 0xE3) != 0)
  {
    [(ContainerViewController *)self attributionVerticalPadding];
    id v6 = &OBJC_IVAR___StepContainerViewController__userLocationLeadingConstraint;
    unint64_t v5 = &OBJC_IVAR___StepContainerViewController__userLocationTrailingConstraint;
  }
  [(NSLayoutConstraint *)self->_userLocationBottomConstraint setConstant:v7];
  [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + *v5) setActive:0];
  [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + *v6) setActive:1];
  id v8 = [(OverlayContainerViewController *)self topContentView];
  objc_super v9 = [v8 layer];
  [v9 cornerRadius];
  double v11 = v10;
  id v12 = [(SteppingPageViewController *)self->_pagingVC view];
  unsigned int v13 = [v12 layer];
  [v13 setCornerRadius:v11];
}

- (unint64_t)maxLayoutForEdgeInsetsUpdate
{
  if (![(StepContainerViewController *)self isVLFActive]) {
    return 1;
  }
  uint64_t v3 = [(ContainerViewController *)self currentViewController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  unint64_t v5 = [(ContainerViewController *)self currentViewController];
  id v6 = [v5 maxLayoutForEdgeInsetsUpdate];

  return (unint64_t)v6;
}

- (double)topEdgeInset
{
  if ([(StepContainerViewController *)self isVLFActive])
  {
    uint64_t v3 = [(ContainerViewController *)self chromeViewController];
    char v4 = [v3 view];
    [v4 safeAreaInsets];
    double v6 = v5;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)StepContainerViewController;
    [(OverlayContainerViewController *)&v9 topEdgeInset];
    return v7;
  }
  return v6;
}

- (double)availableHeight
{
  uint64_t v3 = +[UIDevice currentDevice];
  if ([v3 userInterfaceIdiom] == (id)1)
  {
  }
  else
  {
    char v4 = +[UIDevice currentDevice];
    id v5 = [v4 userInterfaceIdiom];

    if (v5 != (id)5)
    {
LABEL_9:
      v23.receiver = self;
      v23.super_class = (Class)StepContainerViewController;
      [(ContainerViewController *)&v23 availableHeight];
      return v21;
    }
  }
  unint64_t v6 = [(ContainerViewController *)self containerStyle];
  if (v6 > 6 || ((1 << v6) & 0x54) == 0) {
    goto LABEL_9;
  }
  double v7 = [(StepContainerViewController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v10 = [(OverlayContainerViewController *)self topContentView];
  [v10 frame];
  double v11 = v9 - CGRectGetMaxY(v24);
  [(ContainerViewController *)self edgePadding];
  double v13 = v11 - v12;
  double v14 = 0.0;
  if (v13 >= 0.0)
  {
    double v15 = [(StepContainerViewController *)self view];
    [v15 bounds];
    double v17 = v16;
    v18 = [(OverlayContainerViewController *)self topContentView];
    [v18 frame];
    double v19 = v17 - CGRectGetMaxY(v25);
    [(ContainerViewController *)self edgePadding];
    double v14 = v19 - v20;
  }
  return v14;
}

- (void)containerStyleManagerDidChangeStyle:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)StepContainerViewController;
  [(ContainerViewController *)&v5 containerStyleManagerDidChangeStyle:a3];
  [(StepContainerViewController *)self _showInitialStepIfNecessary];
  char v4 = [(StepContainerViewController *)self iosBasedChromeViewController];
  [v4 setNeedsUpdateComponent:@"statusBarStyle" animated:0];
}

- (id)passThroughView
{
  v2 = [(ContainerViewController *)self chromeViewController];
  uint64_t v3 = [v2 passThroughView];

  return v3;
}

- (void)_pressedRecenterButton
{
}

- (MKMapView)mapView
{
  v2 = [(ContainerViewController *)self chromeViewController];
  uint64_t v3 = [v2 mapView];

  return (MKMapView *)v3;
}

- (MapCameraController)mapCameraController
{
  mapCameraController = self->_mapCameraController;
  if (!mapCameraController)
  {
    char v4 = [MapCameraController alloc];
    objc_super v5 = [(StepContainerViewController *)self mapView];
    unint64_t v6 = [(MapCameraController *)v4 initWithMapView:v5];
    double v7 = self->_mapCameraController;
    self->_mapCameraController = v6;

    mapCameraController = self->_mapCameraController;
  }

  return mapCameraController;
}

- (void)_updateMapRegionForSignAtIndex:(int64_t)a3
{
  if (!self->_userIsInteractingWithMap)
  {
    objc_super v5 = [(SteppingPageViewController *)self->_pagingVC signGenerator];
    unint64_t matchedStepIndex = self->_matchedStepIndex;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100C42C28;
    v8[3] = &unk_10131C220;
    v8[4] = self;
    [v5 rectForSignAtIndex:a3 currentStepIndex:matchedStepIndex handler:v8];

    if (self->_showingOverview)
    {
      double v7 = [(StepContainerViewController *)self stepActionCoordinator];
      [v7 viewController:self showOverview:0 zoomToMapRegion:0];
    }
  }
}

- (void)_setUserTrackingMode:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 && self->_matchedStepIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v7 = [(SteppingPageViewController *)self->_pagingVC signGenerator];
    id v8 = [v7 signIndexForStepIndex:self->_matchedStepIndex];

    [(SteppingPageViewController *)self->_pagingVC setSignIndex:v8];
  }
  id v9 = [(StepContainerViewController *)self mapView];
  [v9 setUserTrackingMode:a3 animated:v4];
}

- (void)_locationManagerApprovalDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C42E40;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setUserTrackingViewVisible:(BOOL)a3
{
}

- (void)setUserTrackingViewVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_userTrackingViewVisible != a3)
  {
    BOOL v4 = a4;
    self->_userTrackingViewVisible = a3;
    unint64_t v6 = self->_recenterButton;
    double v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    double v19 = sub_100C43048;
    double v20 = &unk_1012E6300;
    double v7 = v6;
    double v21 = v7;
    BOOL v22 = a3;
    id v8 = objc_retainBlock(&v17);
    double v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    double v13 = sub_100C4309C;
    double v14 = &unk_1012E8908;
    double v15 = v7;
    LOBYTE(v16) = a3;
    id v9 = v7;
    double v10 = objc_retainBlock(&v11);
    if (v4)
    {
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v8, v10, 0.25, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
    }
    else
    {
      ((void (*)(void ***))v8[2])(v8);
      ((void (*)(void ***, uint64_t))v10[2])(v10, 1);
    }
  }
}

- (void)_updateUserLocationViewAppearanceWithMatchedLocation:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(ContainerViewController *)self chromeViewController];
  unint64_t v6 = [(ContainerViewController *)self chromeContext];
  unsigned int v7 = [v5 isCurrentContext:v6];

  if (v4 && v7)
  {
    id v8 = [v4 routeMatch];
    id v9 = [v8 step];

    unsigned int v10 = [(StepContainerViewController *)self _isStepOnTransitLine:v9];
    double v11 = [(StepContainerViewController *)self mapView];
    id v12 = [v11 _shouldSplitRouteLine];

    double v13 = [(ContainerViewController *)self chromeViewController];
    double v14 = [v13 userLocationView];

    if (v14)
    {
      id v12 = (id)([v4 isDirectional] & v10);
      [v14 updateStateFromLocation:v4 duration:0.0];
    }
    double v15 = [(StepContainerViewController *)self mapView];
    unsigned int v16 = [v15 _shouldSplitRouteLine];

    if (v12 != v16)
    {
      double v17 = [(StepContainerViewController *)self mapView];
      [v17 _setShouldSplitRouteLine:v12];
    }
    BOOL v18 = [(StepContainerViewController *)self _shouldShowHeadingIndicatorForStep:v9];
    double v19 = [(StepContainerViewController *)self mapView];
    [v19 _setShowHeadingIndicatorForStepping:v18];

    [(NSTimer *)self->_locationExpirationTimer invalidate];
    double v20 = [v4 expirationDate];

    if (v20)
    {
      double v21 = [v4 expirationDate];
      [v21 timeIntervalSinceNow];
      double v22 = 0.0;
      if (v23 > 0.0)
      {
        CGRect v24 = [v4 expirationDate];
        [v24 timeIntervalSinceNow];
        double v22 = v25;
      }
      objc_initWeak(&location, self);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100C43364;
      v28[3] = &unk_1012E73C8;
      objc_copyWeak(&v29, &location);
      objc_super v26 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v28 block:v22];
      locationExpirationTimer = self->_locationExpirationTimer;
      self->_locationExpirationTimer = v26;

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)_isStepOnTransitLine:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 routeSegmentType] == (id)6)
  {
    id v5 = v4;
    BOOL v6 = [v5 maneuver] == 4 || [v5 maneuver] == 5;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldShowHeadingIndicatorForStep:(id)a3
{
  id v4 = a3;
  id v5 = [(StepContainerViewController *)self stepActionCoordinator];
  unsigned __int8 v6 = [v5 isAuthorizedForPreciseLocation];

  if (v4 && [v4 transportType] == 1)
  {
    unsigned int v7 = [v4 maneuver];
    if ((0x27u >> (v7 - 4))) {
      unsigned __int8 v8 = 0;
    }
    else {
      unsigned __int8 v8 = v6;
    }
    if (v7 - 4 <= 5) {
      unsigned __int8 v6 = v8;
    }
  }

  return v6;
}

- (void)_updateForMatchedStepIndex:(unint64_t)a3 matchedSegmentIndex:(unint64_t)a4
{
  unint64_t matchedStepIndex = self->_matchedStepIndex;
  -[SteppingSignGenerator signIndexForStepIndex:](self->_signGenerator, "signIndexForStepIndex:", a3, a4);
  self->_unint64_t matchedStepIndex = a3;
  if (self->_isGoingToEnterGuidance) {
    self->_isGoingToEnterGuidance = 0;
  }
  id v20 = [(SteppingPageViewController *)self->_pagingVC collectionView];
  if ([v20 isTracking]) {
    goto LABEL_6;
  }
  unsigned int v7 = [(SteppingPageViewController *)self->_pagingVC collectionView];
  if ([v7 isDragging])
  {

LABEL_6:

    return;
  }
  unsigned int v8 = [(StepContainerViewController *)self _isTrackingLocation];

  if (v8)
  {
    id v9 = [(SteppingPageViewController *)self->_pagingVC signGenerator];
    unint64_t v10 = (unint64_t)[v9 signIndexForStepIndex:a3];

    unint64_t v11 = v10 >= 0x7FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v10;
    int64_t v12 = [(SteppingPageViewController *)self->_pagingVC signIndex];
    if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v11 == v12)
      {
        if (matchedStepIndex == a3) {
          return;
        }
        double v13 = [(StepContainerViewController *)self mapView];
        id v14 = [v13 userTrackingMode];

        if (!v14)
        {
          double v15 = [(GEOComposedRoute *)self->_route segmentForStepIndex:a3];
          if ([v15 type] == (id)6) {
            [(StepContainerViewController *)self _updateMapRegionForSignAtIndex:v11];
          }
        }
      }
      else
      {
        unint64_t matchedSignIndex = self->_matchedSignIndex;
        if (matchedSignIndex != 0x7FFFFFFFFFFFFFFFLL && v11 <= matchedSignIndex) {
          return;
        }
        int64_t v17 = [(SteppingPageViewController *)self->_pagingVC signIndex];
        BOOL v18 = [(SteppingPageViewController *)self->_pagingVC signGenerator];
        id v19 = [v18 signIndexForStepIndex:a3];

        if (v17 >= (uint64_t)v19) {
          return;
        }
        [(SteppingPageViewController *)self->_pagingVC setSignIndex:v11];
        self->_unint64_t matchedSignIndex = v11;
      }
      [(StepContainerViewController *)self _setGizmoStepIndex:a3];
    }
  }
}

- (void)mapViewDidFinishLoadingMap:(id)a3
{
  self->_userIsInteractingWithMap = 0;
}

- (void)mapViewDidStartUserInteraction:(id)a3
{
  self->_userIsInteractingWithMap = 1;
  [(StepContainerViewController *)self _stopArrivalEndTimer];
}

- (void)mapViewDidStopUserInteraction:(id)a3
{
  self->_userIsInteractingWithMap = 0;
  id v4 = +[NSDate date];
  lastMapTouchDate = self->_lastMapTouchDate;
  self->_lastMapTouchDate = v4;

  [(StepContainerViewController *)self _startArrivalEndTimerIfNecessary];
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  if (self->_userIsInteractingWithMap) {
    self->_mustNotBreakUserTrackingMode = 0;
  }
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  return [(NavDebugLocationManager *)self->_debugLocationManager rendererForOverlay:a4];
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  return [(NavDebugLocationManager *)self->_debugLocationManager viewForAnnotation:a4];
}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = [(StepContainerViewController *)self stepActionCoordinator];
  unsigned __int8 v7 = [v6 canSelectVKLabelMarker:v5];

  return v7;
}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v5 = a4;
  id v6 = [(StepContainerViewController *)self stepActionCoordinator];
  [v6 selectVKLabelMarker:v5];
}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  id v5 = a4;
  id v6 = [(StepContainerViewController *)self stepActionCoordinator];
  [v6 deselectVKLabelMarker:v5];
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v13 = a4;
  id v6 = a3;
  unsigned __int8 v7 = [v13 annotation];
  [v6 deselectAnnotation:v7 animated:0];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 isVLFPuckVisible])
  {
    unsigned int v8 = [(ContainerViewController *)self chromeViewController];
    id v9 = [v8 appCoordinator];
    unint64_t v10 = [v9 platformController];
    unint64_t v11 = [v10 auxiliaryTasksManager];
    int64_t v12 = [v11 auxilaryTaskForClass:objc_opt_class()];

    [v12 showVLFUI];
  }
}

- (void)mapViewDidFinishInitialUserTrackingModeAnimation:(id)a3
{
  id v15 = a3;
  if ([v15 userTrackingMode])
  {
    id v4 = [(MNLocation *)self->_previousMatchedLocation routeMatch];
    id v5 = [v4 transitTripStep];

    if ([v5 maneuver] == 5)
    {
      uint64_t v6 = [v5 previousTransitStep];

      id v5 = (void *)v6;
    }
    if ([(StepContainerViewController *)self _isStepOnTransitLine:v5])
    {
      [v5 startGeoCoordinate];
      [v5 endGeoCoordinate];
      GEOCalculateDistance();
      double v8 = fmin(v7 * 3.3, 8000.0);
      double v9 = v8 - v8 * 0.2;
      double v10 = v8 + v8 * 0.2;
    }
    else
    {
      double v9 = 0.0;
      double v8 = 1500.0;
      double v10 = 4500.0;
    }
    unint64_t v11 = [v15 camera];
    [v11 altitude];
    if (v12 < v9 || ([v11 altitude], v10 < v13))
    {
      id v14 = [v11 copy];

      [v14 setAltitude:v8];
      [v15 setCamera:v14 animated:1];
      unint64_t v11 = v14;
    }
  }
}

- (void)steppingPageViewController:(id)a3 didChangeCurrentSign:(int64_t)a4 previousSign:(int64_t)a5 fromUserGesture:(unint64_t)a6
{
  id v23 = a3;
  if (a6) {
    [(StepContainerViewController *)self _startArrivalEndTimerIfNecessary];
  }
  if (a4 != a5)
  {
    double v10 = [(StepContainerViewController *)self route];
    unint64_t v11 = [(SteppingPageViewController *)self->_pagingVC signGenerator];
    double v12 = [v11 stepAtSignIndex:[self->_pagingVC signIndex]];

    if (v12) {
      uint64_t v13 = (uint64_t)[v12 stepIndex];
    }
    else {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    id v14 = [v10 segmentIndexForStepIndex:v13];
    id v15 = [(StepContainerViewController *)self stepActionCoordinator];
    unsigned int v16 = [v15 trayContaineeViewController];
    [v16 setCurrentStepIndex:v13];

    int64_t v17 = [(StepContainerViewController *)self mapView];
    [v17 _setRouteContextInspectedSegmentIndex:v14 inspectedStepIndex:v13];

    if ((unint64_t)a4 <= 0x7FFFFFFFFFFFFFFELL) {
      [v10 setCurrentDisplayStep:a4];
    }
    BOOL v18 = +[NSDate date];
    [v18 timeIntervalSinceDate:self->_lastMapTouchDate];
    double v20 = v19;

    if (a6
      || (!self->_lastMapTouchDate || v20 > 4.0)
      && ([(StepContainerViewController *)self mapView],
          double v21 = objc_claimAutoreleasedReturnValue(),
          id v22 = [v21 userTrackingMode],
          v21,
          !v22))
    {
      [(StepContainerViewController *)self _updateMapRegionForSignAtIndex:a4];
    }
    [(StepContainerViewController *)self _setGizmoStepIndex:v13];
  }
}

- (void)steppingPageViewControllerUserDidStartScrolling:(id)a3
{
  self->_mustNotBreakUserTrackingMode = 0;
  [(StepContainerViewController *)self _setUserTrackingMode:0 animated:1];

  [(StepContainerViewController *)self _stopArrivalEndTimer];
}

- (void)steppingPageViewControllerDidChangeSignHeight:(id)a3
{
  id v20 = a3;
  [(StepContainerViewController *)self maximumSignHeight];
  double v6 = v5;
  double v7 = [v20 signHeightConstraint];
  [v7 constant];
  double v9 = v8;

  if (v9 <= v6)
  {
    double v10 = [v20 signHeightConstraint];
    [v10 constant];
    id v3 = &OBJC_IVAR___StepContainerViewController__verticalSignScrollView;
    -[NSLayoutConstraint setConstant:](self->_scrollViewHeightConstraint, "setConstant:");

    [(UIScrollView *)self->_verticalSignScrollView setScrollEnabled:0];
  }
  else
  {
    [(UIScrollView *)self->_verticalSignScrollView setScrollEnabled:1];
    [(NSLayoutConstraint *)self->_scrollViewHeightConstraint setConstant:v6];
  }
  unint64_t v11 = [(ContainerViewController *)self containeeLayout];
  if (v11 - 3 >= 2)
  {
    if (v11 != 5) {
      goto LABEL_18;
    }
    uint64_t v13 = +[UIDevice currentDevice];
    id v14 = [v13 userInterfaceIdiom];
    if (v14 != (id)1)
    {
      id v3 = +[UIDevice currentDevice];
      if ([v3 userInterfaceIdiom] != (id)5) {
        goto LABEL_17;
      }
    }
    id v15 = [(ContainerViewController *)self currentViewController];
    unsigned int v16 = [v15 cardPresentationController];
    unsigned int v17 = [v16 presentedModally];

    if (v14 != (id)1)
    {

      if ((v17 & 1) == 0) {
        goto LABEL_18;
      }
      goto LABEL_16;
    }

    if (v17)
    {
LABEL_16:
      uint64_t v13 = [(ContainerViewController *)self currentViewController];
      id v3 = [v13 cardPresentationController];
      [v3 updateHeightForCurrentLayout];
LABEL_17:
    }
  }
  else
  {
    double v12 = +[UIDevice currentDevice];
    if ([v12 userInterfaceIdiom] == (id)1)
    {

      goto LABEL_16;
    }
    BOOL v18 = +[UIDevice currentDevice];
    id v19 = [v18 userInterfaceIdiom];

    if (v19 == (id)5) {
      goto LABEL_16;
    }
  }
LABEL_18:
}

- (double)maximumSignHeight
{
  id v3 = [(StepContainerViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v6 = [(OverlayContainerViewController *)self topContentView];
  [v6 frame];
  double v8 = v5 - v7;
  [(ContainerViewController *)self edgePadding];
  double v10 = v8 - v9;
  unint64_t v11 = [(StepContainerViewController *)self stepActionCoordinator];
  double v12 = [v11 trayContaineeViewController];
  [v12 heightForLayout:1];
  double v14 = v10 - v13;
  double v15 = 512.0;
  if (v14 < 512.0)
  {
    unsigned int v16 = [(StepContainerViewController *)self view];
    [v16 bounds];
    double v18 = v17;
    id v19 = [(OverlayContainerViewController *)self topContentView];
    [v19 frame];
    double v21 = v18 - v20;
    [(ContainerViewController *)self edgePadding];
    double v23 = v21 - v22;
    CGRect v24 = [(StepContainerViewController *)self stepActionCoordinator];
    double v25 = [v24 trayContaineeViewController];
    [v25 heightForLayout:1];
    double v15 = v23 - v26;
  }
  return v15;
}

- (void)_willEnterForeground:(id)a3
{
  id v9 = [a3 object];
  double v4 = [(StepContainerViewController *)self view];
  double v5 = [v4 window];
  id v6 = [v5 windowScene];

  double v7 = v9;
  if (v9 == v6)
  {
    [(NSTimer *)self->_backgroundArrivalTimer invalidate];
    backgroundArrivalTimer = self->_backgroundArrivalTimer;
    self->_backgroundArrivalTimer = 0;

    double v7 = v9;
  }
}

- (void)_didEnterBackground:(id)a3
{
  id v4 = a3;
  double v5 = [v4 object];
  id v6 = [(StepContainerViewController *)self view];
  double v7 = [v6 window];
  double v8 = [v7 windowScene];

  if (v5 == v8)
  {
    previousMatchedLocation = self->_previousMatchedLocation;
    if (previousMatchedLocation)
    {
      double v10 = [(MNLocation *)previousMatchedLocation routeMatch];
      unint64_t v11 = [v10 step];

      if (v11)
      {
        if ([v11 isArrivalStep])
        {
          double v12 = [(StepContainerViewController *)self stepActionCoordinator];
          [v12 pressedEndWithSender:self];
        }
        else
        {
          double v12 = -[GEOComposedRoute segmentForStepIndex:](self->_route, "segmentForStepIndex:", [v11 stepIndex]);
          double v13 = [(GEOComposedRoute *)self->_route segments];
          double v14 = [v13 lastObject];

          if (v14 == v12)
          {
            [v12 expectedTime];
            double v16 = 15.0;
            if (v15 * 3.0 >= 15.0)
            {
              [v12 expectedTime];
              double v16 = v17 * 3.0;
            }
            objc_initWeak(&location, self);
            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472;
            v20[2] = sub_100C44404;
            v20[3] = &unk_1012E73C8;
            objc_copyWeak(&v21, &location);
            double v18 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v20 block:v16];
            backgroundArrivalTimer = self->_backgroundArrivalTimer;
            self->_backgroundArrivalTimer = v18;

            objc_destroyWeak(&v21);
            objc_destroyWeak(&location);
          }
        }
      }
    }
  }
}

- (void)_startArrivalEndTimerIfNecessary
{
  if (self->_hasArrived)
  {
    [(StepContainerViewController *)self _stopArrivalEndTimer];
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100C44548;
    v5[3] = &unk_1012E73C8;
    objc_copyWeak(&v6, &location);
    id v3 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v5 block:15.0];
    arrivalEndTimer = self->_arrivalEndTimer;
    self->_arrivalEndTimer = v3;

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_stopArrivalEndTimer
{
  [(NSTimer *)self->_arrivalEndTimer invalidate];
  arrivalEndTimer = self->_arrivalEndTimer;
  self->_arrivalEndTimer = 0;
}

- (void)_arrivalEndTimerFired
{
  [(NSTimer *)self->_arrivalEndTimer invalidate];
  arrivalEndTimer = self->_arrivalEndTimer;
  self->_arrivalEndTimer = 0;

  [(NSTimer *)self->_backgroundArrivalTimer invalidate];
  backgroundArrivalTimer = self->_backgroundArrivalTimer;
  self->_backgroundArrivalTimer = 0;

  id v5 = [(StepContainerViewController *)self stepActionCoordinator];
  [v5 pressedEndWithSender:self];
}

- (void)_locationExpirationTimerFired
{
  v2 = [(ContainerViewController *)self chromeViewController];
  id v5 = [v2 userLocationView];

  id v3 = v5;
  if (v5)
  {
    unsigned __int8 v4 = [v5 isStale];
    id v3 = v5;
    if ((v4 & 1) == 0)
    {
      [v5 locationManagerFailedToUpdateLocation];
      id v3 = v5;
    }
  }
}

- (void)_backgroundArrivalTimerFired
{
  [(NSTimer *)self->_arrivalEndTimer invalidate];
  arrivalEndTimer = self->_arrivalEndTimer;
  self->_arrivalEndTimer = 0;

  [(NSTimer *)self->_backgroundArrivalTimer invalidate];
  backgroundArrivalTimer = self->_backgroundArrivalTimer;
  self->_backgroundArrivalTimer = 0;

  id v5 = [(StepContainerViewController *)self stepActionCoordinator];
  [v5 pressedEndWithSender:self];
}

- (void)_delayTimerFired
{
  delayAutoAdvanceTimer = self->_delayAutoAdvanceTimer;
  self->_delayAutoAdvanceTimer = 0;

  previousMatchedLocation = self->_previousMatchedLocation;
  if (previousMatchedLocation)
  {
    id v8 = [(MNLocation *)previousMatchedLocation routeMatch];
    id v5 = [v8 stepIndex];
    id v6 = [v8 route];
    id v7 = [v6 segmentIndexForStepIndex:v5];

    [(StepContainerViewController *)self _updateForMatchedStepIndex:v5 matchedSegmentIndex:v7];
  }
}

- (void)_invalidateTimers
{
  [(NSTimer *)self->_arrivalEndTimer invalidate];
  arrivalEndTimer = self->_arrivalEndTimer;
  self->_arrivalEndTimer = 0;

  [(NSTimer *)self->_backgroundArrivalTimer invalidate];
  backgroundArrivalTimer = self->_backgroundArrivalTimer;
  self->_backgroundArrivalTimer = 0;

  [(NSTimer *)self->_locationExpirationTimer invalidate];
  locationExpirationTimer = self->_locationExpirationTimer;
  self->_locationExpirationTimer = 0;

  [(NSTimer *)self->_delayAutoAdvanceTimer invalidate];
  delayAutoAdvanceTimer = self->_delayAutoAdvanceTimer;
  self->_delayAutoAdvanceTimer = 0;

  [(StepContainerViewController *)self setIdleTimer:0];
}

- (void)_setGizmoStepIndex:(unint64_t)matchedStepIndex
{
  id v5 = [(SteppingPageViewController *)self->_pagingVC signGenerator];
  id v6 = [v5 signIndexForStepIndex:self->_matchedStepIndex];

  id v7 = [(SteppingPageViewController *)self->_pagingVC signGenerator];
  id v8 = [v7 signIndexForStepIndex:matchedStepIndex];

  if (v6 == v8) {
    unint64_t matchedStepIndex = self->_matchedStepIndex;
  }
  id v9 = +[MNNavigationService sharedService];
  [v9 setDisplayedStepIndex:matchedStepIndex];
}

- (BOOL)_isTrackingLocation
{
  v2 = +[MNNavigationService sharedService];
  unsigned __int8 v3 = [v2 isTrackingCurrentLocation];

  return v3;
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  objc_storeStrong((id *)&self->_previousMatchedLocation, a4);
  id v8 = a4;
  [(StepContainerViewController *)self _updateUserLocationViewAppearanceWithMatchedLocation:v8];
  debugLocationManager = self->_debugLocationManager;
  id v7 = [v8 rawLocation];
  [(NavDebugLocationManager *)debugLocationManager addLocation:v7];

  [(StepContainerViewController *)self _updateDebugConsoleForLocation:v8];
}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = +[NSDate date];
  double v10 = [(NavigationDebugViewsController *)self->_debugViewsController tracePlayer];
  GEOConfigGetDouble();
  double v12 = v11;
  if (v10) {
    [v10 speedMultiplier];
  }
  else {
    double v13 = 1.0;
  }
  double v14 = v12 / v13;
  [v9 timeIntervalSinceDate:self->_startDate];
  if (v15 >= v14)
  {
    [(StepContainerViewController *)self _updateForMatchedStepIndex:a4 matchedSegmentIndex:a5];
  }
  else if (!self->_delayAutoAdvanceTimer)
  {
    double v16 = v14 - v15;
    objc_initWeak(&location, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100C44C3C;
    v19[3] = &unk_1012E73C8;
    objc_copyWeak(&v20, &location);
    double v17 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v19 block:v16];
    delayAutoAdvanceTimer = self->_delayAutoAdvanceTimer;
    self->_delayAutoAdvanceTimer = v17;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v7 = [a3 route];
  self->_hasArrived = [v7 isLegIndexOfLastLeg:a5];

  if (self->_hasArrived)
  {
    [(StepContainerViewController *)self _startArrivalEndTimerIfNecessary];
  }
}

- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if (!a5)
  {
    id v7 = [(StepContainerViewController *)self stepActionCoordinator];
    [v7 pressedEndWithSender:self];
  }
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  id v7 = +[MNNavigationService sharedService];
  unsigned int v8 = [v7 isNavigatingFromTrace];

  if (v8) {
    [(StepContainerViewController *)self _toggleTraceControls];
  }
  id v9 = [(ContainerViewController *)self currentViewController];
  if ([v9 conformsToProtocol:&OBJC_PROTOCOL___MapViewResponderHandling]) {
    [v9 didTapMapView:v10 atPoint:CGPointMake(x, y)];
  }
}

- (int64_t)preferredStatusBarStyle
{
  if (![(StepContainerViewController *)self isVLFActive])
  {
    unsigned __int8 v4 = +[UIDevice currentDevice];
    if ([v4 userInterfaceIdiom] != (id)1)
    {
      uint64_t v5 = +[UIDevice currentDevice];
      if ([v5 userInterfaceIdiom] != (id)5)
      {
        unint64_t v6 = [(ContainerViewController *)self containerStyle];
        if (v6 <= 7 && ((1 << v6) & 0xE3) != 0)
        {

          int64_t v3 = 1;
          goto LABEL_10;
        }
      }
    }
    unsigned __int8 v4 = [(StepContainerViewController *)self theme];
    int64_t v3 = (int64_t)[v4 statusBarStyle];
LABEL_10:

    return v3;
  }
  return 0;
}

- (id)statusBarBackgroundViewStyle
{
  if ([(StepContainerViewController *)self isVLFActive]) {
    goto LABEL_6;
  }
  int64_t v3 = +[UIDevice currentDevice];
  if ([v3 userInterfaceIdiom] == (id)1)
  {
LABEL_5:

LABEL_6:
    uint64_t v5 = +[StatusBarBackgroundViewStyle defaultBlurredStyleWithDefaultColorProvider:&stru_1012F7D48];
    goto LABEL_7;
  }
  unsigned __int8 v4 = +[UIDevice currentDevice];
  if ([v4 userInterfaceIdiom] == (id)5
    || (unint64_t v7 = [(ContainerViewController *)self containerStyle], v7 > 7)
    || ((1 << v7) & 0xE3) == 0)
  {

    goto LABEL_5;
  }

  unsigned int v8 = [StatusBarBackgroundViewStyle alloc];
  id v9 = [(StepContainerViewController *)self theme];
  id v10 = [v9 navSignPrimaryColor];
  uint64_t v5 = [(StatusBarBackgroundViewStyle *)v8 initWithColor:v10];

LABEL_7:

  return v5;
}

- (BOOL)showStatusBarBackgroundViewWhenResigning
{
  return 1;
}

- (BOOL)showStatusBarBackgroundViewUnderDimmingView
{
  return 1;
}

- (StatusIndicatorView)statusIndicatorView
{
  statusIndicatorView = self->_statusIndicatorView;
  if (!statusIndicatorView)
  {
    unsigned __int8 v4 = [[StatusIndicatorView alloc] initForLimitedMode:1];
    uint64_t v5 = self->_statusIndicatorView;
    self->_statusIndicatorView = v4;

    statusIndicatorView = self->_statusIndicatorView;
  }

  return statusIndicatorView;
}

- (void)statusIndicatorTypeChanged:(unint64_t)a3
{
  uint64_t v5 = [(StepContainerViewController *)self statusIndicatorView];
  [v5 setType:a3];

  id v6 = [(StepContainerViewController *)self iosBasedChromeViewController];
  [v6 setNeedsUpdateComponent:@"statusBarSupplementaryView" animated:1];
}

- (void)_updateStatusBarIndicatorLayout
{
  unint64_t v3 = [(ContainerViewController *)self containerStyle];
  if (v3 < 8 && ((0xE3u >> v3) & 1) != 0)
  {
    uint64_t v5 = 1;
  }
  else
  {
    unsigned __int8 v4 = [(StepContainerViewController *)self traitCollection];
    if ([v4 userInterfaceStyle] == (id)2) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 3;
    }
  }
  statusIndicatorView = self->_statusIndicatorView;

  [(StatusIndicatorView *)statusIndicatorView updateWithStatusBarStyle:v5];
}

- (id)statusBarSupplementaryView
{
  unint64_t v3 = [(StepContainerViewController *)self statusIndicatorView];
  if ([v3 isVisible])
  {
    unsigned __int8 v4 = [(StepContainerViewController *)self statusIndicatorView];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)_updateIdleTimer
{
  if ([(StepContainerViewController *)self isViewLoaded]
    && ([(StepContainerViewController *)self view],
        unint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 window],
        unsigned __int8 v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4)
    && (id)[(ContainerViewController *)self containeeLayout] != (id)1)
  {
    uint64_t v5 = [NavIdleTimeoutTimer alloc];
    id v6 = [(StepContainerViewController *)self view];
    unint64_t v7 = [v6 window];
    unsigned int v8 = [(NavIdleTimeoutTimer *)v5 initWithWindow:v7];
    [(StepContainerViewController *)self setIdleTimer:v8];

    id v9 = [(StepContainerViewController *)self idleTimer];
    [v9 setDelegate:self];
  }
  else
  {
    [(StepContainerViewController *)self setIdleTimer:0];
  }
}

- (void)idleTimerDidTimeout:(id)a3
{
  unsigned __int8 v4 = [(ContainerViewController *)self currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(ContainerViewController *)self setLayoutIfSupported:1 animated:1];
  }
}

- (void)vlfSessionTaskWillShowVLFUINotification:(id)a3
{
  unsigned __int8 v4 = [(StepContainerViewController *)self pagingVC];
  uint64_t v5 = [v4 view];
  [v5 setHidden:1];

  id v6 = [(StepContainerViewController *)self recenterButton];
  [v6 setHidden:1];

  [(StepContainerViewController *)self setVlfActive:1];
  id v7 = [(StepContainerViewController *)self iosBasedChromeViewController];
  [v7 setNeedsUpdateComponent:@"statusBarStyle" animated:0];
}

- (void)vlfContaineeViewControllerDidDisappearNotification:(id)a3
{
  unsigned __int8 v4 = [(StepContainerViewController *)self pagingVC];
  uint64_t v5 = [v4 view];
  [v5 setHidden:0];

  id v6 = [(StepContainerViewController *)self recenterButton];
  [v6 setHidden:0];

  [(StepContainerViewController *)self setVlfActive:0];
  id v7 = [(StepContainerViewController *)self iosBasedChromeViewController];
  [v7 setNeedsUpdateComponent:@"statusBarStyle" animated:0];
}

- (id)_geoRouteDetails
{
  unint64_t v3 = [(SteppingPageViewController *)self->_pagingVC signGenerator];
  unsigned __int8 v4 = [v3 stepAtSignIndex:[self _pagingVC] signIndex];

  uint64_t v5 = +[MNNavigationService sharedService];
  id v6 = [v5 lastLocation];
  id v7 = [v6 routeMatch];
  id v8 = [v7 isGoodMatch];

  id v9 = [(StepContainerViewController *)self route];
  id v10 = [v9 _maps_routeIndex];

  if (v4) {
    uint64_t v11 = (uint64_t)[v4 stepIndex];
  }
  else {
    uint64_t v11 = 0xFFFFFFFFLL;
  }
  double v12 = [(SteppingPageViewController *)self->_pagingVC signGenerator];
  id v13 = [v12 signIndexForStepIndex:self->_matchedStepIndex];

  BOOL v14 = v13 == (id)[(SteppingPageViewController *)self->_pagingVC signIndex];
  double v15 = [(ContainerViewController *)self chromeViewController];
  double v16 = [v15 mapView];
  BOOL v17 = [v16 userTrackingMode] != 0;

  double v18 = +[MNNavigationService sharedService];
  id v19 = [v18 currentRequest];
  [v19 requestTime];
  double v21 = v20;

  double v22 = +[GEORouteDetails routeDetailsWithResultIndex:v10 stepID:v11 nearRoute:v8 nearCurrentlyDisplayedStep:v14 userTrackingOn:v17 timeSinceResponse:CFAbsoluteTimeGetCurrent() - v21];

  return v22;
}

- (NSDateComponentsFormatter)debugMinsDurationFormatter
{
  debugMinsDurationFormatter = self->_debugMinsDurationFormatter;
  if (!debugMinsDurationFormatter)
  {
    unsigned __int8 v4 = (NSDateComponentsFormatter *)objc_alloc_init((Class)NSDateComponentsFormatter);
    [(NSDateComponentsFormatter *)v4 setZeroFormattingBehavior:0];
    [(NSDateComponentsFormatter *)v4 setUnitsStyle:0];
    [(NSDateComponentsFormatter *)v4 setAllowedUnits:192];
    uint64_t v5 = self->_debugMinsDurationFormatter;
    self->_debugMinsDurationFormatter = v4;

    debugMinsDurationFormatter = self->_debugMinsDurationFormatter;
  }

  return debugMinsDurationFormatter;
}

- (NSDateComponentsFormatter)debugHoursDurationFormatter
{
  debugHoursDurationFormatter = self->_debugHoursDurationFormatter;
  if (!debugHoursDurationFormatter)
  {
    unsigned __int8 v4 = [(StepContainerViewController *)self debugMinsDurationFormatter];
    uint64_t v5 = (NSDateComponentsFormatter *)[v4 copy];

    [(NSDateComponentsFormatter *)v5 setAllowedUnits:[(NSDateComponentsFormatter *)v5 allowedUnits] | 0x20];
    id v6 = self->_debugHoursDurationFormatter;
    self->_debugHoursDurationFormatter = v5;

    debugHoursDurationFormatter = self->_debugHoursDurationFormatter;
  }

  return debugHoursDurationFormatter;
}

- (void)_updateDebugConsoleForLocation:(id)a3
{
  id v35 = a3;
  unsigned __int8 v4 = +[GEOPlatform sharedPlatform];
  unsigned int v5 = [v4 isInternalInstall];

  id v6 = v35;
  if (v5)
  {
    if (v35)
    {
      id v7 = [v35 routeMatch];
      [v7 locationCoordinate];
      uint64_t v9 = v8;
      uint64_t v11 = v10;
      id v12 = [v7 routeCoordinate];
      id v13 = [v7 step];
      if ([v13 transportType] == 1) {
        BOOL v14 = v13;
      }
      else {
        BOOL v14 = 0;
      }
      id v15 = v14;
      double v16 = v15;
      if (v15)
      {
        id v17 = [v15 maneuver];
        if (v17 >= 0xB)
        {
          double v18 = +[NSString stringWithFormat:@"(unknown: %i)", v17];
        }
        else
        {
          double v18 = *(&off_10131C270 + (int)v17);
        }
        double v22 = [v18 lowercaseString];
      }
      else
      {
        double v21 = (char *)[v13 routeSegmentType] - 1;
        if ((unint64_t)v21 > 5) {
          double v22 = @"unknown";
        }
        else {
          double v22 = *(&off_10131C240 + (void)v21);
        }
      }
      double v23 = +[MNNavigationService sharedService];
      unsigned __int8 v24 = [v23 isNavigatingFromTrace];

      if (v24)
      {
        double v25 = +[MNNavigationService sharedService];
        [v25 tracePosition];
      }
      else
      {
        double v25 = +[NSDate date];
        [v25 timeIntervalSinceDate:self->_startDate];
      }
      double v27 = v26;

      if (v27 >= 3600.0) {
        [(StepContainerViewController *)self debugHoursDurationFormatter];
      }
      else {
      v28 = [(StepContainerViewController *)self debugMinsDurationFormatter];
      }
      id v29 = [v28 stringFromTimeInterval:v27];
      id v30 = [v7 stepIndex];
      [v7 distanceFromRoute];
      double v20 = +[NSString stringWithFormat:@"%@,  (%0.5f %0.5f),  [%d, %0.2f],  Step %d\n[%@],  dist to route: %0.1fm", v29, v9, v11, v12, *((float *)&v12 + 1), v30, v22, v31];
      if ([v7 isGoodMatch]) {
        +[UIColor greenColor];
      }
      else {
      id v19 = +[UIColor orangeColor];
      }
    }
    else
    {
      id v19 = +[UIColor redColor];
      double v20 = @"No location";
    }
    double v32 = [(ContainerViewController *)self chromeViewController];
    double v33 = [v32 mapView];
    double v34 = [v33 _debugConsole];

    [v34 updateCustomText:v20 textColor:v19];
    id v6 = v35;
  }
}

- (void)_toggleTraceControls
{
  if (self->_debugViewsController)
  {
    unint64_t v3 = +[NSUserDefaults standardUserDefaults];
    unsigned int v4 = [v3 BOOLForKey:@"PlaybackControls"];

    if (v4)
    {
      unsigned int v5 = [(NavigationDebugViewsController *)self->_debugViewsController isShowingTraceControls];
      debugViewsController = self->_debugViewsController;
      if (v5)
      {
        [(NavigationDebugViewsController *)debugViewsController hideTraceControlsAnimated:1];
      }
      else
      {
        [(NavigationDebugViewsController *)debugViewsController showTraceControls];
      }
    }
  }
}

- (BOOL)pptTestSupportStepping
{
  return 1;
}

- (int64_t)pptTestCurrentStepIndex
{
  v2 = [(StepContainerViewController *)self pagingVC];
  id v3 = [v2 signIndex];

  return (int64_t)v3;
}

- (BOOL)pptTestHasNextStep
{
  id v3 = [(StepContainerViewController *)self pagingVC];
  unsigned int v4 = [v3 signGenerator];
  uint64_t v5 = (uint64_t)[v4 numberOfSigns];

  if (v5 < 2) {
    return 0;
  }
  id v7 = [(StepContainerViewController *)self pagingVC];
  uint64_t v8 = (char *)[v7 signIndex];
  uint64_t v9 = [(StepContainerViewController *)self pagingVC];
  uint64_t v10 = [v9 signGenerator];
  BOOL v6 = (uint64_t)v8 < (uint64_t)((char *)[v10 numberOfSigns] - 1);

  return v6;
}

- (void)pptTestMoveToNextStep
{
  if ([(StepContainerViewController *)self pptTestHasNextStep])
  {
    id v3 = [(StepContainerViewController *)self pagingVC];
    [v3 setSignIndex:[v3 signIndex] + 1];
  }
}

- (BOOL)pptTestMoveToBoardStep
{
  id v3 = [(StepContainerViewController *)self route];
  unsigned int v4 = [v3 steps];
  uint64_t v5 = [v4 firstObject];

  BOOL v6 = [v5 nextBoardingStep];
  if (v6
    && ([(StepContainerViewController *)self pagingVC],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 signGenerator],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v8 signIndexForStep:v6],
        v8,
        v7,
        v9 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v11 = [(StepContainerViewController *)self pagingVC];
    [v11 setSignIndex:v9 animated:0];

    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (unint64_t)matchedStepIndex
{
  return self->_matchedStepIndex;
}

- (void)setStepActionCoordinator:(id)a3
{
}

- (SteppingPageViewController)pagingVC
{
  return self->_pagingVC;
}

- (void)setPagingVC:(id)a3
{
}

- (SteppingSignGenerator)signGenerator
{
  return self->_signGenerator;
}

- (void)setSignGenerator:(id)a3
{
}

- (UIScrollView)verticalSignScrollView
{
  return self->_verticalSignScrollView;
}

- (void)setVerticalSignScrollView:(id)a3
{
}

- (NSLayoutConstraint)scrollViewHeightConstraint
{
  return self->_scrollViewHeightConstraint;
}

- (void)setScrollViewHeightConstraint:(id)a3
{
}

- (UIButton)recenterButton
{
  return self->_recenterButton;
}

- (void)setRecenterButton:(id)a3
{
}

- (void)setMapCameraController:(id)a3
{
}

- (NavDebugLocationManager)debugLocationManager
{
  return self->_debugLocationManager;
}

- (void)setDebugLocationManager:(id)a3
{
}

- (NavigationDebugViewsController)debugViewsController
{
  return self->_debugViewsController;
}

- (void)setDebugViewsController:(id)a3
{
}

- (StatusIndicatorManager)statusIndicatorManager
{
  return self->_statusIndicatorManager;
}

- (void)setStatusIndicatorManager:(id)a3
{
}

- (void)setStatusIndicatorView:(id)a3
{
}

- (NSLayoutConstraint)userLocationBottomConstraint
{
  return self->_userLocationBottomConstraint;
}

- (void)setUserLocationBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)userLocationLeadingConstraint
{
  return self->_userLocationLeadingConstraint;
}

- (void)setUserLocationLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)userLocationTrailingConstraint
{
  return self->_userLocationTrailingConstraint;
}

- (void)setUserLocationTrailingConstraint:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)lastMapTouchDate
{
  return self->_lastMapTouchDate;
}

- (void)setLastMapTouchDate:(id)a3
{
}

- (unint64_t)matchedSignIndex
{
  return self->_matchedSignIndex;
}

- (void)setMatchedSignIndex:(unint64_t)a3
{
  self->_unint64_t matchedSignIndex = a3;
}

- (BOOL)isGoingToEnterGuidance
{
  return self->_isGoingToEnterGuidance;
}

- (void)setIsGoingToEnterGuidance:(BOOL)a3
{
  self->_isGoingToEnterGuidance = a3;
}

- (MNLocation)previousMatchedLocation
{
  return self->_previousMatchedLocation;
}

- (void)setPreviousMatchedLocation:(id)a3
{
}

- (BOOL)mustNotBreakUserTrackingMode
{
  return self->_mustNotBreakUserTrackingMode;
}

- (void)setMustNotBreakUserTrackingMode:(BOOL)a3
{
  self->_mustNotBreakUserTrackingMode = a3;
}

- (BOOL)hasDesiredUserTrackingMode
{
  return self->_hasDesiredUserTrackingMode;
}

- (void)setHasDesiredUserTrackingMode:(BOOL)a3
{
  self->_hasDesiredUserTrackingMode = a3;
}

- (int64_t)desiredUserTrackingMode
{
  return self->_desiredUserTrackingMode;
}

- (void)setDesiredUserTrackingMode:(int64_t)a3
{
  self->_desiredUserTrackingMode = a3;
}

- (BOOL)userIsInteractingWithMap
{
  return self->_userIsInteractingWithMap;
}

- (void)setUserIsInteractingWithMap:(BOOL)a3
{
  self->_userIsInteractingWithMap = a3;
}

- (int64_t)hasArrived
{
  return self->_hasArrived;
}

- (void)setHasArrived:(int64_t)a3
{
  self->_hasArrived = a3;
}

- (NSMutableDictionary)isExpandedMapping
{
  return self->_isExpandedMapping;
}

- (void)setIsExpandedMapping:(id)a3
{
}

- (BOOL)showingOverview
{
  return self->_showingOverview;
}

- (void)setShowingOverview:(BOOL)a3
{
  self->_showingOverview = a3;
}

- (unint64_t)initialStepIndex
{
  return self->_initialStepIndex;
}

- (void)setInitialStepIndex:(unint64_t)a3
{
  self->_unint64_t initialStepIndex = a3;
}

- (BOOL)isVLFActive
{
  return self->_vlfActive;
}

- (void)setVlfActive:(BOOL)a3
{
  self->_vlfActive = a3;
}

- (BOOL)isUserTrackingViewVisible
{
  return self->_userTrackingViewVisible;
}

- (NSTimer)delayAutoAdvanceTimer
{
  return self->_delayAutoAdvanceTimer;
}

- (void)setDelayAutoAdvanceTimer:(id)a3
{
}

- (NSTimer)locationExpirationTimer
{
  return self->_locationExpirationTimer;
}

- (void)setLocationExpirationTimer:(id)a3
{
}

- (NSTimer)arrivalEndTimer
{
  return self->_arrivalEndTimer;
}

- (void)setArrivalEndTimer:(id)a3
{
}

- (NSTimer)backgroundArrivalTimer
{
  return self->_backgroundArrivalTimer;
}

- (void)setBackgroundArrivalTimer:(id)a3
{
}

- (NavIdleTimeoutTimer)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_backgroundArrivalTimer, 0);
  objc_storeStrong((id *)&self->_arrivalEndTimer, 0);
  objc_storeStrong((id *)&self->_locationExpirationTimer, 0);
  objc_storeStrong((id *)&self->_delayAutoAdvanceTimer, 0);
  objc_storeStrong((id *)&self->_isExpandedMapping, 0);
  objc_storeStrong((id *)&self->_previousMatchedLocation, 0);
  objc_storeStrong((id *)&self->_lastMapTouchDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_userLocationTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_userLocationLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_userLocationBottomConstraint, 0);
  objc_storeStrong((id *)&self->_statusIndicatorView, 0);
  objc_storeStrong((id *)&self->_statusIndicatorManager, 0);
  objc_storeStrong((id *)&self->_debugViewsController, 0);
  objc_storeStrong((id *)&self->_debugLocationManager, 0);
  objc_storeStrong((id *)&self->_mapCameraController, 0);
  objc_storeStrong((id *)&self->_recenterButton, 0);
  objc_storeStrong((id *)&self->_scrollViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_verticalSignScrollView, 0);
  objc_storeStrong((id *)&self->_signGenerator, 0);
  objc_storeStrong((id *)&self->_pagingVC, 0);
  objc_storeStrong((id *)&self->_stepActionCoordinator, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_debugHoursDurationFormatter, 0);

  objc_storeStrong((id *)&self->_debugMinsDurationFormatter, 0);
}

@end