@interface NavModeController
- (BOOL)_anyNavUIForeground;
- (BOOL)_shouldShowAlternateRoutesForZoom:(unint64_t)a3;
- (BOOL)isShowingFullScreenDirectionsList;
- (BOOL)isUtteringGuidanceAudio;
- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4;
- (BOOL)notifyCurrentStateWhenStartMonitoring;
- (BOOL)permitsLookAroundShowing;
- (BOOL)permitsWeatherShowing;
- (BOOL)prefersStatusBarHidden;
- (BOOL)requiresStaleMapEffect;
- (BOOL)showsMapView;
- (BOOL)supportsLockscreen;
- (BOOL)usesDefaultTransitions;
- (BOOL)wantsDefaultDimmingOverlayForStaleMapEffect;
- (BOOL)wantsLookAroundShowing;
- (BOOL)wantsRouteAnnotationsControl;
- (BOOL)wantsStatusBarControl;
- (BOOL)wantsWeatherShowing;
- (GEOComposedRoute)route;
- (GuidanceObserver)guidanceObserver;
- (IOSBasedChromeViewController)chromeViewController;
- (MNTrafficIncidentAlert)incidentAlert;
- (NavActionCoordination)actionCoordinator;
- (NavActionCoordinator)navActionCoordinator;
- (NavContainerViewController)containerViewController;
- (NavModeController)initWithPlatformController:(id)a3;
- (NavigationCustomFeaturesSource)featuresSource;
- (NavigationDisplay)navigationDisplay;
- (NavigationPowerLogger)powerLogger;
- (NavigationSession)navigationSession;
- (PlatformController)platformController;
- (RouteAnnotationsConfiguration)routeAnnotationsConfiguration;
- (StatusBarBackgroundViewStyle)statusBarBackgroundViewStyle;
- (StatusBarSupplementaryView)statusBarSupplementaryView;
- (id)_originalRoute;
- (id)fullscreenViewControllerDismissalTransition;
- (id)fullscreenViewControllerPresentationTransition;
- (id)mapViewDelegate;
- (id)personalizedItemSources;
- (int64_t)desiredFloatingControls;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)_mapTypeFromMapView:(id)a3;
- (unint64_t)_routeMarkerOptionsForMapViewZoom:(unint64_t)a3 incidentAlert:(id)a4;
- (unint64_t)navigationCameraMode;
- (void)_archiveMapsActivity;
- (void)_becomeTopContextInChromeViewController:(id)a3 animated:(BOOL)a4;
- (void)_dismissTrafficIncidentMapDisplay;
- (void)_pauseNavigationCameraMotion;
- (void)_receivedNewRoute:(id)a3 traffic:(id)a4;
- (void)_resignTopContextInChromeViewController:(id)a3;
- (void)_sceneBackgroundedWithOurViewVisible:(id)a3;
- (void)_setRoute:(id)a3;
- (void)_setupMapView;
- (void)_startNavigationCameraMotionAnimated:(BOOL)a3;
- (void)_stopNavigationCameraMotion;
- (void)_updateArrivalState;
- (void)_updateDetour;
- (void)_updateWaypointAndOptionsOnRouteAnnotationsConfiguration:(id)a3;
- (void)_updateWithMatchedLocation:(id)a3;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)dealloc;
- (void)didEndDisplayingInLockScreen;
- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4;
- (void)endNavModeAnimated:(BOOL)a3;
- (void)enterPedestrianAR;
- (void)enterStackInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)getCurrentSceneTitleWithCompletion:(id)a3;
- (void)insertDimmingOverlayForStaleMapEffectWithBlock:(id)a3;
- (void)leaveStackInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4;
- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4;
- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4;
- (void)mapView:(id)a3 didUpdateYaw:(double)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapViewNavigationCameraDidLeaveDefaultZoom:(id)a3;
- (void)mapViewNavigationCameraDidReturnToDefaultZoom:(id)a3;
- (void)mapViewNavigationCameraHasStartedPanning:(id)a3;
- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3;
- (void)navActionCoordinator:(id)a3 didChangeMapViewZoom:(unint64_t)a4;
- (void)navigationDisplay:(id)a3 didChangeUserTrackingMode:(int64_t)a4;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4;
- (void)navigationService:(id)a3 didProcessSpeechEvent:(id)a4;
- (void)navigationService:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6;
- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6;
- (void)navigationService:(id)a3 didUpdateAlternateRoutes:(id)a4 traffics:(id)a5;
- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)navigationService:(id)a3 didUpdateTargetLegIndex:(unint64_t)a4;
- (void)navigationService:(id)a3 didUpdateTrafficForRouteID:(id)a4;
- (void)navigationService:(id)a3 didUpdateTrafficIncidentAlert:(id)a4;
- (void)navigationService:(id)a3 didUpdateUpcomingAnchorPointIndex:(unint64_t)a4;
- (void)navigationService:(id)a3 willProcessSpeechEvent:(id)a4;
- (void)performTeardown;
- (void)personalizedItemSourceDidChangeItems:(id)a3;
- (void)prepareToEnterStackInChromeViewController:(id)a3;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)screenLayoutDidChangeWithReason:(unint64_t)a3;
- (void)setChromeViewController:(id)a3;
- (void)setIncidentAlert:(id)a3;
- (void)setMapView:(id)a3;
- (void)setNavigationCameraMode:(unint64_t)a3;
- (void)setNavigationDisplay:(id)a3;
- (void)setShowFullScreenDirectionsList:(BOOL)a3;
- (void)setUtteringGuidanceAudio:(BOOL)a3;
- (void)vlfContaineeViewControllerDidDisappearNotification:(id)a3;
- (void)willBeginDisplayingInSecureLockScreen;
@end

@implementation NavModeController

- (void)willBeginDisplayingInSecureLockScreen
{
  v3 = sub_10000AF10();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = self;
    if (!v4)
    {
      v9 = @"<nil>";
      goto LABEL_10;
    }
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      v7 = [(NavModeController *)v4 performSelector:"accessibilityIdentifier"];
      v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v20 = v9;
    __int16 v21 = 2080;
    v22 = "-[NavModeController willBeginDisplayingInSecureLockScreen]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] %s", buf, 0x16u);
  }
  v10 = [(NavModeController *)self containerViewController];
  [v10 willBeginDisplayingInSecureLockScreen];

  if (![(NavModeController *)self isShowingFullScreenDirectionsList])
  {
    v11 = [(NavModeController *)self navActionCoordinator];
    [v11 dismissPlacecard];

    v12 = [(NavModeController *)self navActionCoordinator];
    [v12 dismissSearchAlongRoute];

    v13 = [(NavModeController *)self navActionCoordinator];
    [v13 dismissModalContainee];

    v14 = [(NavModeController *)self navActionCoordinator];
    [v14 dismissShareETA];

    v15 = [(NavModeController *)self navActionCoordinator];
    [v15 dismissTray];

    v16 = [(NavModeController *)self navActionCoordinator];
    [v16 dismissAddStop];

    v17 = [(NavModeController *)self navActionCoordinator];
    [v17 dismissReportAnIncident];
  }
  v18 = [(NavModeController *)self powerLogger];
  [v18 setDisplayingNavOnLockScreen:1];
}

- (void)didEndDisplayingInLockScreen
{
  v3 = sub_10000AF10();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = self;
    if (!v4)
    {
      v9 = @"<nil>";
      goto LABEL_10;
    }
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      v7 = [(NavModeController *)v4 performSelector:"accessibilityIdentifier"];
      v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v13 = v9;
    __int16 v14 = 2080;
    v15 = "-[NavModeController didEndDisplayingInLockScreen]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] %s", buf, 0x16u);
  }
  v10 = [(NavModeController *)self powerLogger];
  [v10 setDisplayingNavOnLockScreen:0];

  v11 = [(NavModeController *)self containerViewController];
  [v11 didEndDisplayingInLockScreen];
}

- (BOOL)supportsLockscreen
{
  return 1;
}

- (NavModeController)initWithPlatformController:(id)a3
{
  id v5 = a3;
  v44.receiver = self;
  v44.super_class = (Class)NavModeController;
  v6 = [(NavModeController *)&v44 init];
  if (!v6) {
    goto LABEL_11;
  }
  v7 = sub_10000AF10();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = v6;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      v11 = [(NavModeController *)v8 performSelector:"accessibilityIdentifier"];
      v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_8;
      }
    }
    v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v46 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}@] Initializing", buf, 0xCu);
  }
  objc_storeStrong((id *)&v6->_platformController, a3);
  v6->_navigationCameraMode = 0;
  __int16 v14 = objc_alloc_init(GuidanceObserver);
  guidanceObserver = v6->_guidanceObserver;
  v6->_guidanceObserver = v14;

  v16 = objc_alloc_init(NavigationDisplay);
  navigationDisplay = v6->_navigationDisplay;
  v6->_navigationDisplay = v16;

  [(NavigationDisplay *)v6->_navigationDisplay setDelegate:v6];
  v18 = [NavigationCustomFeaturesSource alloc];
  v19 = [(NavigationDisplay *)v6->_navigationDisplay cameraController];
  v20 = [(NavigationCustomFeaturesSource *)v18 initWithPointsFramer:v19];
  featuresSource = v6->_featuresSource;
  v6->_featuresSource = v20;

  [(NavigationCustomFeaturesSource *)v6->_featuresSource setFramingMode:1];
  [(PersonalizedItemSource *)v6->_featuresSource addObserver:v6];
  v22 = [[RAPNavigationTracker alloc] initWithPlatformController:v6->_platformController];
  rapNavigationTracker = v6->_rapNavigationTracker;
  v6->_rapNavigationTracker = v22;

  v24 = [NavActionCoordinator alloc];
  v25 = [(NavModeController *)v6 featuresSource];
  v26 = [(NavModeController *)v6 navigationDisplay];
  v27 = [(NavModeController *)v6 guidanceObserver];
  v28 = [(NavActionCoordinator *)v24 initWithMapItemDisplayer:v25 navigationDisplay:v26 guidanceObserver:v27 navigationCameraModeController:v6 rapNavigationTracker:v6->_rapNavigationTracker];
  navActionCoordinator = v6->_navActionCoordinator;
  v6->_navActionCoordinator = v28;

  if (([(NavActionCoordinator *)v6->_navActionCoordinator conformsToProtocol:&OBJC_PROTOCOL___ChromeMapSelectionDelegate] & 1) == 0)
  {
    v41 = sub_1005762E4();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v46 = "-[NavModeController initWithPlatformController:]";
      __int16 v47 = 2080;
      v48 = "NavModeController.m";
      __int16 v49 = 1024;
      int v50 = 186;
      __int16 v51 = 2080;
      v52 = "[_navActionCoordinator conformsToProtocol:@protocol(ChromeMapSelectionDelegate)]";
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v42 = sub_1005762E4();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v46 = v43;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  [(NavActionCoordinator *)v6->_navActionCoordinator setMapViewZoomDelegate:v6];
  [(PersonalizedItemSource *)v6->_featuresSource addObserver:v6->_navActionCoordinator];
  v30 = objc_alloc_init(NavigationPowerLogger);
  powerLogger = v6->_powerLogger;
  v6->_powerLogger = v30;

  [(NavigationPowerLogger *)v6->_powerLogger startLogging];
  v32 = [NavContainerViewController alloc];
  v33 = [(NavModeController *)v6 navActionCoordinator];
  v34 = [(NavModeController *)v6 guidanceObserver];
  v35 = [(NavContainerViewController *)v32 initWithCoordinator:v33 guidanceObserver:v34 platformController:v6->_platformController];
  containerViewController = v6->_containerViewController;
  v6->_containerViewController = v35;

  v37 = +[MNNavigationService sharedService];
  [v37 registerObserver:v6];

  v38 = +[NSNotificationCenter defaultCenter];
  [v38 addObserver:v6 selector:"vlfSessionTaskWillShowVLFUINotification:" name:@"VLFSessionTaskWillShowVLFUINotification" object:0];

  v39 = +[NSNotificationCenter defaultCenter];
  [v39 addObserver:v6 selector:"vlfContaineeViewControllerDidDisappearNotification:" name:off_1015F7850 object:0];

LABEL_11:
  return v6;
}

- (void)dealloc
{
  v3 = sub_10000AF10();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = self;
    if (!v4)
    {
      v9 = @"<nil>";
      goto LABEL_10;
    }
    id v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      v7 = [(NavModeController *)v4 performSelector:"accessibilityIdentifier"];
      v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] Deallocing", buf, 0xCu);
  }
  v10 = +[MNNavigationService sharedService];
  [v10 unregisterObserver:self];

  v11.receiver = self;
  v11.super_class = (Class)NavModeController;
  [(NavModeController *)&v11 dealloc];
}

- (NavActionCoordination)actionCoordinator
{
  v2 = [(NavModeController *)self containerViewController];
  v3 = [v2 coordinator];

  return (NavActionCoordination *)v3;
}

- (NavigationSession)navigationSession
{
  v2 = [(NavModeController *)self platformController];
  v3 = [v2 currentSession];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)setMapView:(id)a3
{
  id v5 = (MKMapView *)a3;
  v6 = v5;
  if (self->_mapView != v5)
  {
    v10 = v5;
    if (!v5
      || (unsigned __int8 v7 = [(NavModeController *)self isShowingFullScreenDirectionsList],
          v6 = v10,
          (v7 & 1) == 0))
    {
      objc_storeStrong((id *)&self->_mapView, a3);
      [(NavigationPowerLogger *)self->_powerLogger setMapType:[(NavModeController *)self _mapTypeFromMapView:v10]];
      if (self->_mapView)
      {
        [(NavModeController *)self _setupMapView];
        [(NavModeController *)self _setRoute:self->_route];
      }
      else
      {
        v8 = [(NavModeController *)self chromeViewController];
        v9 = [v8 searchPinsManager];
        [v9 clearDirectionsPins];
      }
      v6 = v10;
    }
  }
}

- (void)setShowFullScreenDirectionsList:(BOOL)a3
{
  if (self->_showFullScreenDirectionsList == a3) {
    return;
  }
  BOOL v3 = a3;
  self->_showFullScreenDirectionsList = a3;
  id v5 = [(NavModeController *)self navActionCoordinator];
  [v5 setShowFullScreenDirectionsList:v3];

  v6 = sub_10000AF10();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v7 = self;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      v10 = [(NavModeController *)v7 performSelector:"accessibilityIdentifier"];
      objc_super v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_8;
      }
    }
    v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_8:

    v13 = @"NO";
    if (v3) {
      v13 = @"YES";
    }
    __int16 v14 = v13;
    *(_DWORD *)buf = 138543618;
    v28 = v12;
    __int16 v29 = 2112;
    v30 = v14;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Setting show fullscreen directions list: %@", buf, 0x16u);
  }
  v15 = [(NavModeController *)self containerViewController];
  v16 = [v15 view];

  if (v16)
  {
    v17 = [(NavModeController *)self containerViewController];
    [v17 setResumeRouteBannerHidden:v3];

    id chromeDeactivationToken = self->_chromeDeactivationToken;
    if (v3)
    {
      if (!chromeDeactivationToken)
      {
        v19 = [(NavModeController *)self chromeViewController];
        v20 = [v19 acquireChromeDeactivationTokenForReason:@"full-screen directions list"];
        id v21 = self->_chromeDeactivationToken;
        self->_id chromeDeactivationToken = v20;
      }
      v22 = [(NavModeController *)self navigationDisplay];
      [v22 clearCache];

      mapView = self->_mapView;
      self->_mapView = 0;
    }
    else
    {
      self->_id chromeDeactivationToken = 0;

      v24 = [(NavModeController *)self chromeViewController];
      v25 = [v24 mapView];
      [(NavModeController *)self setMapView:v25];

      [(NavModeController *)self _startNavigationCameraMotionAnimated:0];
    }
    v26 = [(NavModeController *)self navActionCoordinator];
    [v26 presentTray];
  }
}

- (void)setNavigationCameraMode:(unint64_t)a3
{
  if (self->_navigationCameraMode == a3) {
    return;
  }
  id v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = self;
    unsigned __int8 v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [(NavModeController *)v6 performSelector:"accessibilityIdentifier"];
      v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        objc_super v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    objc_super v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

    unint64_t navigationCameraMode = self->_navigationCameraMode;
    *(_DWORD *)buf = 138543874;
    v25 = v11;
    __int16 v26 = 2048;
    unint64_t v27 = navigationCameraMode;
    __int16 v28 = 2048;
    unint64_t v29 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Changing navigationCameraMode from %lu to %lu", buf, 0x20u);
  }
  self->_unint64_t navigationCameraMode = a3;
  if (a3 == 1)
  {
    v13 = [(NavModeController *)self navActionCoordinator];
    id v14 = [v13 lowGuidanceUserPreferredHeadingOverride];

    uint64_t v15 = 0;
    uint64_t v16 = 1;
  }
  else
  {
    uint64_t v16 = 0;
    id v14 = 0;
    uint64_t v15 = 1;
  }
  v17 = [(NavModeController *)self navActionCoordinator];
  [v17 setDefaultMapViewZoom:v16];
  v18 = [(NavModeController *)self navActionCoordinator];
  BOOL v19 = [v18 currentMapViewZoom] == (id)2;

  [v17 resetMapViewZoomToDefaultAndStartCameraTracking:v19];
  v20 = [(NavModeController *)self containerViewController];
  [v20 setSignStyle:v15];

  id v21 = [(NavModeController *)self navigationDisplay];
  v22 = [v21 cameraController];
  [v22 setNavigationCameraHeadingOverride:v14];

  v23 = [(NavModeController *)self navigationDisplay];
  [v23 setNavigationDestinationState:1];
}

- (void)setUtteringGuidanceAudio:(BOOL)a3
{
  if (self->_utteringGuidanceAudio != a3)
  {
    self->_utteringGuidanceAudio = a3;
    unsigned __int8 v4 = [(NavModeController *)self _anyNavUIForeground];
    id v5 = +[MNNavigationService sharedService];
    v6 = [v5 arrivalInfo];
    unsigned int v7 = [v6 isInArrivalState];
    id v8 = [v6 legIndex];
    v9 = [v5 route];
    unsigned int v10 = [v9 isLegIndexOfLastLeg:v8];

    if (!self->_utteringGuidanceAudio && (v4 & 1) == 0 && v7 && v10)
    {
      objc_super v11 = sub_10000AF10();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "setUtteringGuidanceAudio: uttering ended while the app is backgrounded and we're in arrival state -> ending navigation", v12, 2u);
      }

      [(NavModeController *)self endNavModeAnimated:0];
    }
  }
}

- (void)_setupMapView
{
  [(MKMapView *)self->_mapView _setApplicationState:2];
  BOOL v3 = [(MKMapView *)self->_mapView selectedAnnotations];
  id v4 = [v3 firstObject];

  if (v4) {
    [(MKMapView *)self->_mapView deselectAnnotation:v4 animated:0];
  }
  [(MKMapView *)self->_mapView _deselectLabelMarkerAnimated:0];
}

- (void)_setRoute:(id)a3
{
  id v5 = a3;
  v6 = sub_10000AF10();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_11;
  }
  unsigned int v7 = self;
  if (!v7)
  {
    v12 = @"<nil>";
    goto LABEL_10;
  }
  id v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  if (objc_opt_respondsToSelector())
  {
    unsigned int v10 = [(NavModeController *)v7 performSelector:"accessibilityIdentifier"];
    objc_super v11 = v10;
    if (v10 && ![v10 isEqualToString:v9])
    {
      v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

      goto LABEL_8;
    }
  }
  v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_8:

LABEL_10:
  *(_DWORD *)buf = 138543618;
  v24 = v12;
  __int16 v25 = 2112;
  id v26 = v5;
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] Updating route: %@", buf, 0x16u);

LABEL_11:
  p_route = &self->_route;
  route = self->_route;
  if (route) {
    unsigned int v15 = [(GEOComposedRoute *)route transportType];
  }
  else {
    unsigned int v15 = 4;
  }
  id v16 = [v5 transportType];
  objc_storeStrong((id *)&self->_route, a3);
  if ([(GEOComposedRoute *)*p_route transportType] == 2
    && ((GEOConfigGetBOOL() & 1) != 0 || ((unint64_t)[v5 source] & 0xFFFFFFFFFFFFFFFELL) == 2))
  {
    [(GEOComposedRoute *)*p_route setManeuverDisplayEnabled:1];
    v17 = [(GEOComposedRoute *)*p_route steps];
    [(GEOComposedRoute *)*p_route setManeuverDisplaySteps:v17];
  }
  else
  {
    [(GEOComposedRoute *)*p_route setManeuverDisplayEnabled:0];
    [(GEOComposedRoute *)*p_route setManeuverDisplaySteps:0];
  }
  [(NavigationDisplay *)self->_navigationDisplay updateWithRoute:v5];
  v18 = [(NavModeController *)self route];
  BOOL v19 = [(NavModeController *)self containerViewController];
  [v19 setRoute:v18];

  routeAnnotationsConfiguration = self->_routeAnnotationsConfiguration;
  self->_routeAnnotationsConfiguration = 0;

  id v21 = [(NavModeController *)self chromeViewController];
  [v21 setNeedsUpdateComponent:@"routeAnnotations" animated:1];

  if (v15 != v16)
  {
    v22 = [(NavModeController *)self navigationDisplay];
    [v22 setTransportType:v16 animated:v15 == 4];
  }
}

- (void)_receivedNewRoute:(id)a3 traffic:(id)a4
{
  -[NavModeController _setRoute:](self, "_setRoute:", a3, a4);
  [(NavModeController *)self _updateDetour];

  [(NavModeController *)self _archiveMapsActivity];
}

- (BOOL)_shouldShowAlternateRoutesForZoom:(unint64_t)a3
{
  id v5 = [(NavModeController *)self _originalRoute];

  if (v5) {
    return 1;
  }
  char BOOL = GEOConfigGetBOOL();
  BOOL result = 1;
  if (!a3 && (BOOL & 1) == 0) {
    return self->_incidentAlert != 0;
  }
  return result;
}

- (id)_originalRoute
{
  v2 = +[MNNavigationService sharedService];
  BOOL v3 = [v2 originalRoute];
  if ([v3 source] == (id)2 || objc_msgSend(v3, "source") == (id)3)
  {
    id v4 = [v2 route];
    id v5 = [v4 uniqueRouteID];
    v6 = [v3 uniqueRouteID];
    unsigned int v7 = [v5 isEqual:v6];

    if (v7) {
      id v8 = 0;
    }
    else {
      id v8 = v3;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (unint64_t)_routeMarkerOptionsForMapViewZoom:(unint64_t)a3 incidentAlert:(id)a4
{
  if (a3 | (unint64_t)a4) {
    return 3;
  }
  else {
    return 0;
  }
}

- (void)_updateDetour
{
  BOOL v3 = +[MNNavigationService sharedService];
  unsigned int v4 = [v3 isDetour];

  id v5 = [(NavModeController *)self containerViewController];
  v6 = [v5 bannerAction];

  unsigned int v7 = sub_10000AF10();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    goto LABEL_13;
  }
  id v8 = self;
  if (!v8)
  {
    v13 = @"<nil>";
    goto LABEL_10;
  }
  id v9 = (objc_class *)objc_opt_class();
  unsigned int v10 = NSStringFromClass(v9);
  if (objc_opt_respondsToSelector())
  {
    objc_super v11 = [(NavModeController *)v8 performSelector:"accessibilityIdentifier"];
    v12 = v11;
    if (v11 && ![v11 isEqualToString:v10])
    {
      v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

      goto LABEL_8;
    }
  }
  v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

LABEL_10:
  id v14 = @"NO";
  if (v4) {
    id v14 = @"YES";
  }
  unsigned int v15 = v14;
  *(_DWORD *)buf = 138543874;
  unint64_t v27 = v13;
  __int16 v28 = 2112;
  unint64_t v29 = v15;
  __int16 v30 = 2112;
  v31 = v6;
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] _updateDetour: %@ existingAction: %@", buf, 0x20u);

LABEL_13:
  if (!v4)
  {
    v17 = 0;
LABEL_20:
    v22 = [(NavModeController *)self containerViewController];
    [v22 setBannerAction:v17 animated:1];
    goto LABEL_21;
  }
  id v16 = +[MNNavigationService sharedService];
  v17 = [v16 originalDestinationName];

  id v18 = [v17 length];
  BOOL v19 = +[NSBundle mainBundle];
  v20 = v19;
  if (v18)
  {
    uint64_t v21 = [v19 localizedStringForKey:@"[Navigation Top Banner View] Resume Route to %@" value:@"localized string not found" table:0];

    v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v17);
    v20 = (void *)v21;
  }
  else
  {
    v22 = [v19 localizedStringForKey:@"[Navigation Top Banner View] Resume Original Route" value:@"localized string not found" table:0];
  }

  v23 = [v6 title];
  unsigned __int8 v24 = [v23 isEqualToString:v22];

  if ((v24 & 1) == 0)
  {
    __int16 v25 = objc_opt_new();
    [v25 setTitle:v22];
    [v25 setActionHandler:&stru_1012F6858];

    v17 = v25;
    goto LABEL_20;
  }
LABEL_21:
}

- (BOOL)_anyNavUIForeground
{
  if (SBUIIsSystemApertureEnabled())
  {
    v2 = +[IPCServer sharedServer];
    BOOL v3 = [v2 activeBannerViewController];

    if (v3) {
      return 1;
    }
  }

  return +[UIApplication _maps_isAnyApplicationOrCarPlayApplicationSceneForeground];
}

- (BOOL)usesDefaultTransitions
{
  return 0;
}

- (id)fullscreenViewControllerPresentationTransition
{
  v2 = objc_opt_new();

  return v2;
}

- (id)fullscreenViewControllerDismissalTransition
{
  v2 = objc_opt_new();

  return v2;
}

- (id)mapViewDelegate
{
  return self->_navigationDisplay;
}

- (BOOL)showsMapView
{
  return 1;
}

- (int64_t)desiredFloatingControls
{
  return 0;
}

- (void)enterPedestrianAR
{
  id v2 = [(NavModeController *)self navActionCoordinator];
  [v2 enterPedestrianAR];
}

- (id)personalizedItemSources
{
  BOOL v3 = [(NavModeController *)self chromeViewController];
  unsigned int v4 = [v3 searchPinsManager];

  if (v4)
  {
    v10[0] = self->_featuresSource;
    id v5 = [(NavModeController *)self chromeViewController];
    v6 = [v5 searchPinsManager];
    unsigned int v7 = [v6 routeStartEndItemSource];
    v10[1] = v7;
    id v8 = +[NSArray arrayWithObjects:v10 count:2];
  }
  else
  {
    id v8 = &__NSArray0__struct;
  }

  return v8;
}

- (void)prepareToEnterStackInChromeViewController:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = self;
    if (!v6)
    {
      objc_super v11 = @"<nil>";
      goto LABEL_10;
    }
    unsigned int v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(NavModeController *)v6 performSelector:"accessibilityIdentifier"];
      unsigned int v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        objc_super v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    objc_super v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    id v16 = v11;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Preparing to enter stack in chrome VC: %@", buf, 0x16u);
  }
  v12 = [v4 customPOIsController];
  v13 = [(NavModeController *)self navActionCoordinator];
  [v13 setCustomPOIsController:v12];

  id v14 = [(NavModeController *)self containerViewController];
  [v14 setChromeViewController:v4];
}

- (void)enterStackInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5 = a3;
  v6 = sub_10000AF10();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v7 = self;
    if (!v7)
    {
      v12 = @"<nil>";
      goto LABEL_10;
    }
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      unsigned int v10 = [(NavModeController *)v7 performSelector:"accessibilityIdentifier"];
      objc_super v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_8;
      }
    }
    v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    __int16 v17 = v12;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] Entering stack in chrome VC: %@", buf, 0x16u);
  }
  v13 = +[MNNavigationService sharedService];
  id v14 = [v13 route];

  if (v14)
  {
    unsigned int v15 = [(NavModeController *)self containerViewController];
    [v15 loadViewIfNeeded];

    [(NavModeController *)self _setRoute:v14];
  }
  [(NavModeController *)self _archiveMapsActivity];
}

- (void)leaveStackInChromeViewController:(id)a3 withAnimation:(id)a4
{
  if (self->_isPedestrianARActive)
  {
    id v5 = sub_10000AF10();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:

      [(NavModeController *)self performTeardown];
      return;
    }
    v6 = self;
    unsigned int v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(NavModeController *)v6 performSelector:"accessibilityIdentifier"];
      unsigned int v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        objc_super v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    objc_super v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v13 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Leaving stack while Pedestrian AR is active; performing teardown now",
      buf,
      0xCu);

    goto LABEL_9;
  }
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  unsigned __int8 v8 = [v7 isAnimated];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_10071F4E0;
  v10[3] = &unk_1012E9838;
  objc_copyWeak(&v12, &location);
  id v9 = v6;
  id v11 = v9;
  unsigned __int8 v13 = v8;
  [v7 addPreparation:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_becomeTopContextInChromeViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_10000AF10();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v8 = self;
    if (!v8)
    {
      unsigned __int8 v13 = @"<nil>";
      goto LABEL_10;
    }
    id v9 = (objc_class *)objc_opt_class();
    unsigned int v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      id v11 = [(NavModeController *)v8 performSelector:"accessibilityIdentifier"];
      id v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        unsigned __int8 v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_8;
      }
    }
    unsigned __int8 v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v57 = v13;
    __int16 v58 = 2112;
    id v59 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Becoming top context in chrome VC: %@", buf, 0x16u);
  }
  id v14 = [v6 previousTopContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v16 = sub_10000AF10();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
LABEL_36:

      self->_isPedestrianARActive = 0;
      id v27 = [(NavModeController *)self containerViewController];
      [v27 setLayoutIfSupported:1 animated:0];
      goto LABEL_37;
    }
    __int16 v17 = self;
    if (!v17)
    {
      v22 = @"<nil>";
      goto LABEL_35;
    }
    __int16 v18 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v18);
    if (objc_opt_respondsToSelector())
    {
      v20 = [(NavModeController *)v17 performSelector:"accessibilityIdentifier"];
      uint64_t v21 = v20;
      if (v20 && ![v20 isEqualToString:v19])
      {
        v22 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v21];

        goto LABEL_19;
      }
    }
    v22 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
LABEL_19:

LABEL_35:
    *(_DWORD *)buf = 138543362;
    v57 = v22;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[%{public}@] Previous top context is the PedestrianAR one; not doing the usual setup",
      buf,
      0xCu);

    goto LABEL_36;
  }
  v23 = [v6 previousTopContext];
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v24 = [v6 previousTopContext];
    __int16 v25 = [v24 fullscreenViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v26 = v25;
    }
    else {
      id v26 = 0;
    }
    id v27 = v26;
  }
  else
  {
    id v27 = 0;
  }

  [v27 setContaineesHidden:1];
  __int16 v28 = [(NavModeController *)self containerViewController];
  [v28 setChromeContext:self];

  unint64_t v29 = [(NavModeController *)self chromeViewController];
  __int16 v30 = [(NavModeController *)self navigationDisplay];
  [v30 setChromeViewController:v29];

  unsigned int v31 = [(NavModeController *)self isShowingFullScreenDirectionsList];
  id chromeDeactivationToken = self->_chromeDeactivationToken;
  if (v31)
  {
    if (!chromeDeactivationToken)
    {
      v33 = [(NavModeController *)self chromeViewController];
      v34 = [v33 acquireChromeDeactivationTokenForReason:@"full-screen directions list"];
      id v35 = self->_chromeDeactivationToken;
      self->_id chromeDeactivationToken = v34;
    }
    v36 = [(NavModeController *)self navigationDisplay];
    [v36 clearCache];

    mapView = self->_mapView;
    self->_mapView = 0;
  }
  else
  {
    self->_id chromeDeactivationToken = 0;

    mapView = [(NavModeController *)self chromeViewController];
    v38 = [mapView mapView];
    [(NavModeController *)self setMapView:v38];
  }
  v39 = +[MNNavigationService sharedService];
  id v40 = [v39 desiredNavigationType];

  if (!v40)
  {
    v41 = +[MNNavigationService sharedService];
    id v40 = [v41 navigationType];
  }
  [(NavModeController *)self setNavigationCameraMode:v40 != (id)3];
  v42 = [(NavModeController *)self chromeViewController];
  v43 = [v42 userLocationView];
  objc_super v44 = [(NavModeController *)self navigationDisplay];
  [v44 setUserLocationAnnotationView:v43];

  v45 = [(NavModeController *)self navigationDisplay];
  v46 = [v45 mapView];
  [v46 _setShouldSplitRouteLine:1];

  __int16 v47 = [(NavModeController *)self navigationDisplay];
  v48 = +[MNNavigationService sharedService];
  __int16 v49 = [v48 route];
  int v50 = [v49 destination];
  [v47 setDestinationWaypoint:v50];

  __int16 v51 = [(NavModeController *)self navigationDisplay];
  v52 = +[MNNavigationService sharedService];
  [v51 setTransportType:[v52 navigationTransportType]];

  [(NavModeController *)self _startNavigationCameraMotionAnimated:v4];
  v53 = +[NSNotificationCenter defaultCenter];
  [v53 addObserver:self selector:"_sceneBackgroundedWithOurViewVisible:" name:UISceneDidEnterBackgroundNotification object:0];
  v54 = +[UIApplication sharedMapsDelegate];
  [v54 acquireSecureAppAssertionIfNeeded];

  v55 = [(NavModeController *)self containerViewController];
  [v55 updateStatusBarColor];

LABEL_37:
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10071FC78;
  v9[3] = &unk_1012E6690;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [v7 addPreparation:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_resignTopContextInChromeViewController:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    if (!v6)
    {
      id v11 = @"<nil>";
      goto LABEL_10;
    }
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(NavModeController *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v23 = v11;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Resign top context in chrome VC: %@", buf, 0x16u);
  }
  id v12 = [v4 nextTopContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v14 = sub_10000AF10();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
LABEL_23:

      self->_isPedestrianARActive = 1;
      goto LABEL_24;
    }
    unsigned int v15 = self;
    if (!v15)
    {
      v20 = @"<nil>";
      goto LABEL_22;
    }
    id v16 = (objc_class *)objc_opt_class();
    __int16 v17 = NSStringFromClass(v16);
    if (objc_opt_respondsToSelector())
    {
      __int16 v18 = [(NavModeController *)v15 performSelector:"accessibilityIdentifier"];
      id v19 = v18;
      if (v18 && ![v18 isEqualToString:v17])
      {
        v20 = +[NSString stringWithFormat:@"%@<%p, %@>", v17, v15, v19];

        goto LABEL_19;
      }
    }
    v20 = +[NSString stringWithFormat:@"%@<%p>", v17, v15];
LABEL_19:

LABEL_22:
    *(_DWORD *)buf = 138543362;
    v23 = v20;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[%{public}@] Next top context is the PedestrianAR one; not doing the usual teardown",
      buf,
      0xCu);

    goto LABEL_23;
  }
  [(NavModeController *)self performTeardown];
  uint64_t v21 = [(NavModeController *)self iosBasedChromeViewController];
  [v21 setStatusBarAdditionalColor:0];

LABEL_24:
}

- (void)performTeardown
{
  BOOL v3 = [(NavModeController *)self route];
  unsigned int v4 = [v3 transportType];

  if (v4 == 2)
  {
    id v5 = [(NavModeController *)self route];
    [v5 setManeuverDisplayEnabled:0];
  }
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self];

  id chromeDeactivationToken = self->_chromeDeactivationToken;
  self->_id chromeDeactivationToken = 0;

  [(MKMapView *)self->_mapView _setDisplayedSearchResultsType:0];
  id v8 = [(MKMapView *)self->_mapView _mapLayer];
  [v8 setFocusedLabelsPolyline:0];

  [(MKMapView *)self->_mapView _setApplicationState:0];
  [(MKMapView *)self->_mapView _clearRouteContext];
  if (v4 == 2) {
    [(MKMapView *)self->_mapView _setShowHeadingIndicatorForStepping:0];
  }
  [(NavModeController *)self setMapView:0];
  [(MKMapView *)self->_mapView _setDebugConsoleAdditionalInfoProvider:0];
  id v9 = [(NavigationDisplay *)self->_navigationDisplay cameraController];
  [v9 setTrafficIncidentAlert:0];

  [(NavigationDisplay *)self->_navigationDisplay stopCameraMotion];
  id v10 = [(NavigationDisplay *)self->_navigationDisplay cameraController];
  [v10 resetMapViewNavigationState];

  id v11 = [(NavigationDisplay *)self->_navigationDisplay userLocationAnnotationView];
  [v11 setInNavMode:0 animated:1];

  [(NavigationDisplay *)self->_navigationDisplay setUserLocationAnnotationView:0];
  [(NavigationDisplay *)self->_navigationDisplay setChromeViewController:0];
  id v12 = [(NavModeController *)self navActionCoordinator];
  unsigned __int8 v13 = [v12 trafficIncidentAlertCoordinator];
  [v13 dismissVisibleTrafficAlertView:1];

  id v14 = +[MapsScreenLayoutMonitor sharedMonitor];
  [v14 stopMonitoringWithObserver:self];
}

- (void)getCurrentSceneTitleWithCompletion:(id)a3
{
  unsigned int v4 = (void (**)(id, id))a3;
  id v5 = [(NavModeController *)self route];
  id v6 = [v5 destination];
  id v7 = [v6 name];

  id v8 = +[NSBundle mainBundle];
  if (v7)
  {
    id v9 = [v8 localizedStringForKey:@"[App switcher title] Directions to <destination>" value:@"localized string not found" table:0];
    id v10 = [(NavModeController *)self route];
    id v11 = [v10 destination];
    id v12 = [v11 name];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = [v8 localizedStringForKey:@"[App switcher title] Directions" value:@"localized string not found" table:0];
  }

  v4[2](v4, v13);
}

- (BOOL)requiresStaleMapEffect
{
  return 1;
}

- (BOOL)wantsDefaultDimmingOverlayForStaleMapEffect
{
  return 0;
}

- (void)insertDimmingOverlayForStaleMapEffectWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(NavModeController *)self containerViewController];
  [v5 insertDimmingOverlayForStaleMapEffectWithBlock:v4];
}

- (BOOL)wantsRouteAnnotationsControl
{
  return 1;
}

- (RouteAnnotationsConfiguration)routeAnnotationsConfiguration
{
  BOOL v3 = [(NavModeController *)self chromeViewController];

  if (!v3)
  {
LABEL_13:
    unsigned int v15 = 0;
    goto LABEL_14;
  }
  id v4 = [(NavModeController *)self navigationSession];
  id v5 = [v4 sessionState];

  if (v5 != (id)1)
  {
    id v16 = sub_10000AF10();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Cannot update annotations when not navigating", buf, 2u);
    }

    goto LABEL_13;
  }
  routeAnnotationsConfiguration = self->_routeAnnotationsConfiguration;
  if (!routeAnnotationsConfiguration)
  {
    id v7 = +[RouteAnnotationsMutableConfiguration navConfigurationWithCurrentRoute:self->_route incidentAlert:self->_incidentAlert];
    id v8 = [(NavModeController *)self _originalRoute];
    if (v8)
    {
      id v9 = [(RouteAnnotationsConfiguration *)v7 routes];
      id v10 = [v9 mutableCopy];

      [v10 addObject:v8];
      [(RouteAnnotationsConfiguration *)v7 setRoutes:v10];
    }
    id v11 = [v8 uniqueRouteID];
    [(RouteAnnotationsConfiguration *)v7 setOriginalRouteID:v11];

    id v12 = +[MNNavigationService sharedService];
    -[RouteAnnotationsConfiguration setOriginalRouteDivergenceCoordinate:](v7, "setOriginalRouteDivergenceCoordinate:", [v12 originalRouteDivergenceCoordinate]);

    id v13 = sub_10000AF10();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int16 v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Created new route annotations configuration", v18, 2u);
    }

    id v14 = self->_routeAnnotationsConfiguration;
    self->_routeAnnotationsConfiguration = v7;

    routeAnnotationsConfiguration = self->_routeAnnotationsConfiguration;
  }
  [(NavModeController *)self _updateWaypointAndOptionsOnRouteAnnotationsConfiguration:routeAnnotationsConfiguration];
  unsigned int v15 = self->_routeAnnotationsConfiguration;
LABEL_14:

  return (RouteAnnotationsConfiguration *)v15;
}

- (void)_updateWaypointAndOptionsOnRouteAnnotationsConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(NavModeController *)self actionCoordinator];
  id v6 = [v5 currentMapViewZoom];

  [v4 setAlternateRoutesEnabled:[self _shouldShowAlternateRoutesForZoom:v6]];
  id v7 = [(NavModeController *)self incidentAlert];
  [v4 setRouteMarkerOptions:[self _routeMarkerOptionsForMapViewZoom:v6 incidentAlert:v7]];

  id v8 = +[MNNavigationService sharedService];
  id v9 = [v8 arrivalInfo];
  id v10 = v9;
  if (v9 && [v9 isInArrivalState])
  {
    uint64_t v11 = [v10 destination];
    unint64_t v12 = 0;
    uint64_t v13 = 2;
  }
  else
  {
    uint64_t v14 = [v8 lastLocation];
    if (v14
      && (unsigned int v15 = (void *)v14,
          [v8 lastLocation],
          id v16 = objc_claimAutoreleasedReturnValue(),
          id v17 = [v16 state],
          v16,
          v15,
          v17 == (id)1))
    {
      route = self->_route;
      id v19 = [v8 lastLocation];
      v20 = [v19 routeMatch];
      id v27 = 0;
      id v28 = 0;
      -[GEOComposedRoute nextWaypointOrAnchorPointFromRouteCoordinate:outWaypoint:outAnchorPoint:](route, "nextWaypointOrAnchorPointFromRouteCoordinate:outWaypoint:outAnchorPoint:", [v20 routeCoordinate], &v28, &v27);
      uint64_t v11 = (uint64_t)v28;
      unint64_t v12 = (unint64_t)v27;

      uint64_t v13 = (v11 | v12) != 0;
    }
    else
    {
      id v21 = -[GEOComposedRoute legIndexForStepIndex:](self->_route, "legIndexForStepIndex:", [v8 stepIndex]);
      v22 = [(GEOComposedRoute *)self->_route legs];
      if (v21 >= [v22 count])
      {
        __int16 v24 = 0;
      }
      else
      {
        v23 = [(GEOComposedRoute *)self->_route legs];
        __int16 v24 = [v23 objectAtIndexedSubscript:v21];
      }
      uint64_t v11 = [v24 destination];
      uint64_t v13 = v11 != 0;

      unint64_t v12 = 0;
    }
  }
  if (v11) {
    uint64_t v25 = v11;
  }
  else {
    uint64_t v25 = v12;
  }
  [v4 setCurrentNavigationWaypoint:v25];
  [v4 setProximityToCurrentNavigationWaypoint:v13];
  id v26 = sub_10000AF10();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Updated route annotations configuration: %{public}@", buf, 0xCu);
  }
}

- (void)_startNavigationCameraMotionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  -[NavigationDisplay startMotion:](self->_navigationDisplay, "startMotion:");
  id v5 = [(NavigationDisplay *)self->_navigationDisplay userLocationAnnotationView];
  [v5 setInNavMode:1 animated:v3];
}

- (void)_pauseNavigationCameraMotion
{
}

- (void)_stopNavigationCameraMotion
{
}

- (void)_updateWithMatchedLocation:(id)a3
{
  navigationDisplay = self->_navigationDisplay;
  id v5 = a3;
  [(NavigationDisplay *)navigationDisplay updateWithLocation:v5];
  id v7 = [(NavModeController *)self chromeViewController];
  id v6 = [v7 routeAnnotationsController];
  [v6 updateMatchedLocation:v5];
}

- (void)_archiveMapsActivity
{
  id v3 = [(NavModeController *)self actionCoordinator];
  id v2 = [v3 appCoordinator];
  [v2 archiveMapsActivity];
}

- (void)_updateArrivalState
{
  id v3 = +[MNNavigationService sharedService];
  id v4 = [v3 arrivalInfo];
  if (![v4 arrivalState] || objc_msgSend(v4, "arrivalState") == (id)-1)
  {
    v32 = +[MapsScreenLayoutMonitor sharedMonitor];
    [v32 stopMonitoringWithObserver:self];
LABEL_32:

    goto LABEL_33;
  }
  id v5 = [(NavModeController *)self chromeViewController];
  [v5 setNeedsUpdateComponent:@"routeAnnotations" animated:1];

  id v6 = [v3 route];
  unsigned int v7 = [v6 isLegIndexOfLastLeg:[v4 legIndex]];

  if (v7)
  {
    [(NavModeController *)self _archiveMapsActivity];
    if (!self->_route) {
      goto LABEL_13;
    }
    id v8 = sub_10000AF10();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      +[HistoryEntryRecentsItem markRouteAsComplete:self->_route];
LABEL_13:
      unsigned int v15 = [v4 isInArrivalState];
      id v16 = sub_10000AF10();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
        goto LABEL_20;
      }
      id v17 = self;
      __int16 v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      if (objc_opt_respondsToSelector())
      {
        v20 = [(NavModeController *)v17 performSelector:"accessibilityIdentifier"];
        id v21 = v20;
        if (v20 && ![v20 isEqualToString:v19])
        {
          v22 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v21];

          goto LABEL_19;
        }
      }
      v22 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
LABEL_19:

      *(_DWORD *)buf = 138543618;
      v52 = v22;
      __int16 v53 = 1024;
      unsigned int v54 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}@] Should auto end nav: %d", buf, 0x12u);

LABEL_20:
      if ((v15 & 1) == 0)
      {
        v23 = +[MapsScreenLayoutMonitor sharedMonitor];
        [v23 stopMonitoringWithObserver:self];
      }
      if (+[UIApplication _maps_isAnyCarPlayApplicationSceneForeground])
      {
        __int16 v24 = sub_10000AF10();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
LABEL_30:

          unsigned int v31 = [(NavModeController *)self navActionCoordinator];
          [v31 dismissShareETA];

          goto LABEL_33;
        }
        uint64_t v25 = self;
        id v26 = (objc_class *)objc_opt_class();
        id v27 = NSStringFromClass(v26);
        if (objc_opt_respondsToSelector())
        {
          id v28 = [(NavModeController *)v25 performSelector:"accessibilityIdentifier"];
          unint64_t v29 = v28;
          if (v28 && ![v28 isEqualToString:v27])
          {
            id v30 = +[NSString stringWithFormat:@"%@<%p, %@>", v27, v25, v29];

            goto LABEL_29;
          }
        }
        id v30 = +[NSString stringWithFormat:@"%@<%p>", v27, v25];
LABEL_29:

        *(_DWORD *)buf = 138543362;
        v52 = v30;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}@] navigationServiceDidArrive: while CarPlay Maps is foreground", buf, 0xCu);

        goto LABEL_30;
      }
      if (+[UIApplication _maps_isAnySceneForegroundForRole:](UIApplication, "_maps_isAnySceneForegroundForRole:", _UIWindowSceneSessionTypeCoverSheet)|| (+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"), v33 = objc_claimAutoreleasedReturnValue(), unsigned int v34 = [v33 isLocked], v33, v34))
      {
        id v35 = sub_10000AF10();
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
          goto LABEL_43;
        }
        v36 = self;
        v37 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v37);
        if (objc_opt_respondsToSelector())
        {
          v39 = [(NavModeController *)v36 performSelector:"accessibilityIdentifier"];
          id v40 = v39;
          if (v39 && ![v39 isEqualToString:v38])
          {
            v41 = +[NSString stringWithFormat:@"%@<%p, %@>", v38, v36, v40];

            goto LABEL_42;
          }
        }
        v41 = +[NSString stringWithFormat:@"%@<%p>", v38, v36];
LABEL_42:

        *(_DWORD *)buf = 138543362;
        v52 = v41;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "[%{public}@] navigationServiceDidArrive: while Maps is in the lockscreen or the device is locked", buf, 0xCu);

LABEL_43:
        if (!v15) {
          goto LABEL_33;
        }
        goto LABEL_53;
      }
      v42 = sub_10000AF10();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
LABEL_52:

        __int16 v49 = [(NavModeController *)self navActionCoordinator];
        [v49 dismissShareETA];

        int v50 = [(NavModeController *)self navActionCoordinator];
        [v50 dismissSearchAlongRoute];

        if (!v15) {
          goto LABEL_33;
        }
LABEL_53:
        v32 = +[MapsScreenLayoutMonitor sharedMonitor];
        [v32 startMonitoringWithObserver:self];
        goto LABEL_32;
      }
      v43 = self;
      objc_super v44 = (objc_class *)objc_opt_class();
      v45 = NSStringFromClass(v44);
      if (objc_opt_respondsToSelector())
      {
        v46 = [(NavModeController *)v43 performSelector:"accessibilityIdentifier"];
        __int16 v47 = v46;
        if (v46 && ![v46 isEqualToString:v45])
        {
          v48 = +[NSString stringWithFormat:@"%@<%p, %@>", v45, v43, v47];

          goto LABEL_51;
        }
      }
      v48 = +[NSString stringWithFormat:@"%@<%p>", v45, v43];
LABEL_51:

      *(_DWORD *)buf = 138543362;
      v52 = v48;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "[%{public}@] navigationServiceDidArrive: while Maps is foreground", buf, 0xCu);

      goto LABEL_52;
    }
    id v9 = self;
    id v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      unint64_t v12 = [(NavModeController *)v9 performSelector:"accessibilityIdentifier"];
      uint64_t v13 = v12;
      if (v12 && ![v12 isEqualToString:v11])
      {
        uint64_t v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_11;
      }
    }
    uint64_t v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_11:

    *(_DWORD *)buf = 138543362;
    v52 = v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] navigationServiceDidArrive: will mark route as complete", buf, 0xCu);

    goto LABEL_12;
  }
LABEL_33:
}

- (void)navigationDisplay:(id)a3 didChangeUserTrackingMode:(int64_t)a4
{
  id v5 = +[UIApplication sharedMapsDelegate];
  [v5 setTrackingMode:a4 monitorBatteryState:0];
}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NavModeController *)self navActionCoordinator];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(NavModeController *)self navActionCoordinator];
    unsigned __int8 v11 = [v10 mapView:v6 shouldSelectLabelMarker:v7];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [(NavModeController *)self navActionCoordinator];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(NavModeController *)self navActionCoordinator];
    [v9 mapView:v15 didSelectLabelMarker:v6];
  }
  if (([v6 isRouteAnnotation] & 1) == 0
    && ([v6 isRouteEta] & 1) == 0)
  {
    [v6 coordinate];
    CLLocationDegrees v11 = v10;
    [v6 coordinate];
    CLLocationCoordinate2D v13 = CLLocationCoordinate2DMake(v11, v12);
    uint64_t v14 = [(NavModeController *)self featuresSource];
    [v14 setOverriddenPointToFrame:v13.latitude, v13.longitude];
  }
}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(NavModeController *)self navActionCoordinator];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(NavModeController *)self navActionCoordinator];
    [v9 mapView:v12 didDeselectLabelMarker:v6];
  }
  double longitude = kCLLocationCoordinate2DInvalid.longitude;
  CLLocationDegrees v11 = [(NavModeController *)self featuresSource];
  [v11 setOverriddenPointToFrame:kCLLocationCoordinate2DInvalid.latitude longitude];
}

- (void)mapViewNavigationCameraHasStartedPanning:(id)a3
{
  id v7 = a3;
  id v4 = [(NavModeController *)self navActionCoordinator];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(NavModeController *)self navActionCoordinator];
    [v6 mapViewNavigationCameraHasStartedPanning:v7];
  }
}

- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3
{
  id v7 = a3;
  id v4 = [(NavModeController *)self navActionCoordinator];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(NavModeController *)self navActionCoordinator];
    [v6 mapViewNavigationCameraHasStoppedPanning:v7];
  }
}

- (void)mapViewNavigationCameraDidLeaveDefaultZoom:(id)a3
{
  id v7 = a3;
  id v4 = [(NavModeController *)self navActionCoordinator];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(NavModeController *)self navActionCoordinator];
    [v6 mapViewNavigationCameraDidLeaveDefaultZoom:v7];
  }
}

- (void)mapViewNavigationCameraDidReturnToDefaultZoom:(id)a3
{
  id v7 = a3;
  id v4 = [(NavModeController *)self navActionCoordinator];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(NavModeController *)self navActionCoordinator];
    [v6 mapViewNavigationCameraDidReturnToDefaultZoom:v7];
  }
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v17 = a3;
  id v7 = [(NavModeController *)self chromeViewController];
  char v8 = [v7 routeAnnotationsController];
  char v9 = [v8 configuration];

  if ([v9 alternateRoutesEnabled])
  {
    mapView = self->_mapView;
    CLLocationDegrees v11 = [v9 routes];
    id v12 = [v9 selectedRoute];
    CLLocationCoordinate2D v13 = +[MNNavigationService sharedService];
    uint64_t v14 = sub_1005BE5F0(v13);
    id v15 = +[RouteAnnotationsResponder routeAtPoint:inMapView:withRoutes:selectedRoute:overlappingRouteSelectorBlock:](RouteAnnotationsResponder, "routeAtPoint:inMapView:withRoutes:selectedRoute:overlappingRouteSelectorBlock:", mapView, v11, v12, v14, x, y);

    if (v15 && ((unint64_t)[v15 source] & 0xFFFFFFFFFFFFFFFELL) != 2)
    {
      id v16 = [(NavModeController *)self navActionCoordinator];
      [v16 viewController:0 switchNavigationToRoute:v15];
      goto LABEL_7;
    }
  }
  else
  {
    id v15 = 0;
  }
  id v16 = [(NavModeController *)self navActionCoordinator];
  [v16 didTapMapView:v17 atPoint:CGPointMake(x, y)];
LABEL_7:
}

- (void)mapView:(id)a3 didUpdateYaw:(double)a4
{
  id v6 = a3;
  id v7 = [(NavModeController *)self actionCoordinator];
  [v7 mapView:v6 didUpdateYaw:a4];
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  id v7 = [v11 annotation];
  [v6 deselectAnnotation:v7 animated:0];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 isVLFPuckVisible])
  {
    char v8 = [(NavModeController *)self platformController];
    char v9 = [v8 auxiliaryTasksManager];
    double v10 = [v9 auxilaryTaskForClass:objc_opt_class()];

    [v10 showVLFUI];
  }
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  UIAccessibilityNotifications v5 = UIAccessibilityLayoutChangedNotification;
  id v6 = a3;
  UIAccessibilityPostNotification(v5, 0);
  unint64_t v7 = [(NavModeController *)self _mapTypeFromMapView:v6];

  powerLogger = self->_powerLogger;

  [(NavigationPowerLogger *)powerLogger setMapType:v7];
}

- (unint64_t)_mapTypeFromMapView:(id)a3
{
  id v3 = a3;
  if ([v3 _isShowingCuratedElevatedGround])
  {
    unint64_t v4 = 2;
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    UIAccessibilityNotifications v5 = [v3 _visibleTileSets];
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      unint64_t v4 = 1;
LABEL_5:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 style] == 68) {
          break;
        }
        if (v7 == (id)++v9)
        {
          id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v7) {
            goto LABEL_5;
          }
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:
      unint64_t v4 = 0;
    }
  }
  return v4;
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v6 = a4;
  id v7 = [v6 traffic];
  [(NavModeController *)self _receivedNewRoute:v6 traffic:v7];
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v13 = a3;
  if (a5)
  {
    if (MNNavigationServiceStateChangedToNavigating())
    {
      uint64_t v8 = [v13 route];
      uint64_t v9 = [v8 traffic];

      double v10 = [v13 route];
      [(NavModeController *)self _receivedNewRoute:v10 traffic:v9];
    }
    else if (a5 != a4 && a5 - 3 <= 2)
    {
      routeAnnotationsConfiguration = self->_routeAnnotationsConfiguration;
      self->_routeAnnotationsConfiguration = 0;

      long long v12 = [(NavModeController *)self chromeViewController];
      [v12 setNeedsUpdateComponent:@"routeAnnotations" animated:1];

      [(NavModeController *)self _archiveMapsActivity];
    }
  }
  else
  {
    [(NavModeController *)self endNavModeAnimated:1];
  }
}

- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  id v6 = [(NavModeController *)self chromeViewController];
  [v6 setNeedsUpdateComponent:@"routeAnnotations" animated:1];
}

- (void)navigationService:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (![(NavModeController *)self isShowingFullScreenDirectionsList])
  {
    [(NavModeController *)self setIncidentAlert:v7];
    uint64_t v9 = [(NavModeController *)self navActionCoordinator];
    double v10 = [v9 trafficIncidentAlertCoordinator];
    long long v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    long long v14 = sub_100721DDC;
    long long v15 = &unk_1012EB2E0;
    id v16 = self;
    id v17 = v8;
    [v10 presentAlertViewForTrafficIncidentAlert:v7 responseCallback:&v12];

    id v11 = [(NavModeController *)self containerViewController];
    [v11 updateLayoutAnimated:1];
  }
}

- (void)navigationService:(id)a3 didUpdateTrafficIncidentAlert:(id)a4
{
  id v14 = a4;
  if (![(NavModeController *)self isShowingFullScreenDirectionsList])
  {
    UIAccessibilityNotifications v5 = [v14 bannerID];
    id v6 = [(NavModeController *)self navActionCoordinator];
    id v7 = [v6 trafficIncidentAlertCoordinator];
    id v8 = [v7 presentedAlert];
    uint64_t v9 = [v8 bannerID];
    unsigned int v10 = [v5 isEqualToString:v9];

    if (v10)
    {
      id v11 = [(NavigationDisplay *)self->_navigationDisplay cameraController];
      [v11 setTrafficIncidentAlert:v14];

      long long v12 = [(NavModeController *)self navActionCoordinator];
      uint64_t v13 = [v12 trafficIncidentAlertCoordinator];
      [v13 updatedAlertViewWithTrafficIncidentAlert:v14];
    }
  }
}

- (void)navigationService:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4
{
  if (![(NavModeController *)self isShowingFullScreenDirectionsList])
  {
    [(NavModeController *)self _dismissTrafficIncidentMapDisplay];
    id v6 = [(NavModeController *)self navActionCoordinator];
    UIAccessibilityNotifications v5 = [v6 trafficIncidentAlertCoordinator];
    [v5 dismissVisibleTrafficAlertView:0];
  }
}

- (void)navigationService:(id)a3 didUpdateTrafficForRouteID:(id)a4
{
  id v5 = a4;
  id v6 = [(NavModeController *)self chromeViewController];
  id v7 = [v6 routeAnnotationsController];
  id v8 = [v7 configuration];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v8 routes];
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v15 = [v14 uniqueRouteID];
        unsigned int v16 = [v15 isEqual:v5];

        if (v16) {
          [v14 _maps_refreshTrafficIncidentsOnRoute];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)navigationService:(id)a3 didUpdateAlternateRoutes:(id)a4 traffics:(id)a5
{
  routeAnnotationsConfiguration = self->_routeAnnotationsConfiguration;
  self->_routeAnnotationsConfiguration = 0;

  id v7 = [(NavModeController *)self chromeViewController];
  [v7 setNeedsUpdateComponent:@"routeAnnotations" animated:1];
}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id v7 = [(NavModeController *)self route];
  unsigned int v8 = [v7 transportType];

  if (v8 == 2)
  {
    uint64_t v9 = [(NavModeController *)self route];
    [v9 setCurrentDisplayStep:a4];
  }
  id v10 = [(NavModeController *)self chromeViewController];
  [v10 setNeedsUpdateComponent:@"routeAnnotations" animated:1];
}

- (void)navigationService:(id)a3 didUpdateTargetLegIndex:(unint64_t)a4
{
  id v4 = [(NavModeController *)self chromeViewController];
  [v4 setNeedsUpdateComponent:@"routeAnnotations" animated:1];
}

- (void)navigationService:(id)a3 willProcessSpeechEvent:(id)a4
{
}

- (void)navigationService:(id)a3 didProcessSpeechEvent:(id)a4
{
}

- (void)navigationService:(id)a3 didUpdateUpcomingAnchorPointIndex:(unint64_t)a4
{
  id v4 = [(NavModeController *)self chromeViewController];
  [v4 setNeedsUpdateComponent:@"routeAnnotations" animated:1];
}

- (void)_dismissTrafficIncidentMapDisplay
{
  [(NavModeController *)self setIncidentAlert:0];
  id v4 = [(NavModeController *)self navActionCoordinator];
  id v3 = [v4 mapSelectionManager];
  [v3 clearSelection];
}

- (void)setIncidentAlert:(id)a3
{
  unsigned int v8 = (MNTrafficIncidentAlert *)a3;
  if (self->_incidentAlert != v8)
  {
    objc_storeStrong((id *)&self->_incidentAlert, a3);
    id v5 = [(NavigationDisplay *)self->_navigationDisplay cameraController];
    [v5 setTrafficIncidentAlert:v8];

    routeAnnotationsConfiguration = self->_routeAnnotationsConfiguration;
    self->_routeAnnotationsConfiguration = 0;

    id v7 = [(NavModeController *)self chromeViewController];
    [v7 setNeedsUpdateComponent:@"routeAnnotations" animated:1];
  }
}

- (void)endNavModeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    if (!v6)
    {
      id v11 = @"<nil>";
      goto LABEL_10;
    }
    id v7 = (objc_class *)objc_opt_class();
    unsigned int v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = [(NavModeController *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    unsigned int v16 = v11;
    __int16 v17 = 1024;
    BOOL v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] endNavModeAnimated: %d", buf, 0x12u);
  }
  uint64_t v12 = +[MapsScreenLayoutMonitor sharedMonitor];
  [v12 stopMonitoringWithObserver:self];

  [(NavigationPowerLogger *)self->_powerLogger stopLogging];
  uint64_t v13 = [(NavModeController *)self actionCoordinator];
  id v14 = [v13 appCoordinator];
  [v14 endNavigationAndReturnToRoutePlanning:0];
}

- (void)_sceneBackgroundedWithOurViewVisible:(id)a3
{
  if (+[UIApplication _maps_isAnyApplicationOrCarPlayApplicationSceneForeground])
  {
    id v4 = sub_10000AF10();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_sceneBackgroundedWithOurViewVisible: there is at least one foreground scene, ignoring this call.", buf, 2u);
    }
  }
  else
  {
    id v5 = +[MNNavigationService sharedService];
    id v4 = [v5 arrivalInfo];

    if ([v4 isInArrivalState])
    {
      unsigned int v6 = [(NavModeController *)self isUtteringGuidanceAudio];
      id v7 = sub_10000AF10();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
      if (v6)
      {
        if (v8)
        {
          *(_WORD *)id v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "_sceneBackgroundedWithOurViewVisible: while arrived, but still uttering. Will end nav when we stop uttering.", v11, 2u);
        }
      }
      else
      {
        if (v8)
        {
          *(_WORD *)id v10 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "_sceneBackgroundedWithOurViewVisible: while arrived, ending navigation", v10, 2u);
        }

        [(NavModeController *)self endNavModeAnimated:0];
      }
    }
    else
    {
      uint64_t v9 = sub_10000AF10();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "_sceneBackgroundedWithOurViewVisible: not in arrival state, continue navigation", v12, 2u);
      }
    }
  }
}

- (void)personalizedItemSourceDidChangeItems:(id)a3
{
  id v4 = a3;
  id v5 = [(NavModeController *)self featuresSource];

  if (v5 == v4)
  {
    unsigned int v6 = [(NavModeController *)self featuresSource];
    id v7 = [v6 allItems];
    id v8 = [v7 count];

    if (v8 == (id)1)
    {
      mapView = self->_mapView;
      uint64_t v10 = 4;
    }
    else
    {
      id v11 = [(NavModeController *)self featuresSource];
      uint64_t v12 = [v11 allItems];
      id v13 = [v12 count];

      mapView = self->_mapView;
      uint64_t v10 = v13 != 0;
    }
    [(MKMapView *)mapView _setDisplayedSearchResultsType:v10];
  }
}

- (void)navActionCoordinator:(id)a3 didChangeMapViewZoom:(unint64_t)a4
{
  id v4 = [(NavModeController *)self chromeViewController];
  [v4 setNeedsUpdateComponent:@"routeAnnotations" animated:1];
}

- (void)screenLayoutDidChangeWithReason:(unint64_t)a3
{
  id v9 = +[MapsScreenLayoutMonitor sharedMonitor];
  if ([v9 isScreenOn])
  {
  }
  else
  {
    id v4 = +[MNNavigationService sharedService];
    id v5 = [v4 arrivalInfo];
    unsigned int v6 = [v5 isInArrivalState];

    if (v6)
    {
      id v7 = sub_10000AF10();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Screen turned off while arrived, ending navigation", buf, 2u);
      }

      [(NavModeController *)self endNavModeAnimated:0];
      id v8 = +[MapsScreenLayoutMonitor sharedMonitor];
      [v8 stopMonitoringWithObserver:self];
    }
  }
}

- (BOOL)notifyCurrentStateWhenStartMonitoring
{
  return 0;
}

- (void)vlfContaineeViewControllerDidDisappearNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100722A98;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)wantsStatusBarControl
{
  id v2 = +[MNNavigationService sharedService];
  [v2 state];
  char IsNavigating = MNNavigationServiceStateIsNavigating();

  return IsNavigating;
}

- (BOOL)prefersStatusBarHidden
{
  id v2 = [(NavModeController *)self containerViewController];
  unsigned __int8 v3 = [v2 prefersStatusBarHidden];

  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  id v2 = [(NavModeController *)self containerViewController];
  id v3 = [v2 preferredStatusBarStyle];

  return (int64_t)v3;
}

- (StatusBarBackgroundViewStyle)statusBarBackgroundViewStyle
{
  id v2 = [(NavModeController *)self containerViewController];
  id v3 = [v2 statusBarBackgroundViewStyle];

  return (StatusBarBackgroundViewStyle *)v3;
}

- (StatusBarSupplementaryView)statusBarSupplementaryView
{
  id v2 = [(NavModeController *)self containerViewController];
  id v3 = [v2 statusBarSupplementaryView];

  return (StatusBarSupplementaryView *)v3;
}

- (BOOL)wantsWeatherShowing
{
  return 0;
}

- (BOOL)permitsWeatherShowing
{
  return 0;
}

- (BOOL)wantsLookAroundShowing
{
  return 0;
}

- (BOOL)permitsLookAroundShowing
{
  return 0;
}

- (unint64_t)navigationCameraMode
{
  return self->_navigationCameraMode;
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (IOSBasedChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (IOSBasedChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (NavActionCoordinator)navActionCoordinator
{
  return self->_navActionCoordinator;
}

- (NavContainerViewController)containerViewController
{
  return self->_containerViewController;
}

- (GuidanceObserver)guidanceObserver
{
  return self->_guidanceObserver;
}

- (NavigationDisplay)navigationDisplay
{
  return self->_navigationDisplay;
}

- (void)setNavigationDisplay:(id)a3
{
}

- (BOOL)isShowingFullScreenDirectionsList
{
  return self->_showFullScreenDirectionsList;
}

- (NavigationCustomFeaturesSource)featuresSource
{
  return self->_featuresSource;
}

- (NavigationPowerLogger)powerLogger
{
  return self->_powerLogger;
}

- (MNTrafficIncidentAlert)incidentAlert
{
  return self->_incidentAlert;
}

- (BOOL)isUtteringGuidanceAudio
{
  return self->_utteringGuidanceAudio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentAlert, 0);
  objc_storeStrong((id *)&self->_powerLogger, 0);
  objc_storeStrong((id *)&self->_featuresSource, 0);
  objc_storeStrong((id *)&self->_navigationDisplay, 0);
  objc_storeStrong((id *)&self->_guidanceObserver, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_navActionCoordinator, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_routeAnnotationsConfiguration, 0);
  objc_storeStrong(&self->_chromeDeactivationToken, 0);
  objc_storeStrong((id *)&self->_rapNavigationTracker, 0);

  objc_storeStrong((id *)&self->_mapView, 0);
}

@end