@interface NavigationStateMonitoringTask
+ (int64_t)creationPreference;
- (BOOL)_shouldSuppressAnimationsForAndromeda;
- (BOOL)isNavigationAutoLaunchInProgress;
- (BOOL)shouldStartNavigationAutoLaunchTimer;
- (ChromeViewController)chromeViewController;
- (GCDTimer)navigationAutoLaunchTimer;
- (MNNavigationService)navigationService;
- (NSHashTable)navigationCompletionBlocks;
- (NavigationSession)observedNavigationSession;
- (NavigationStateMonitoringTask)initWithPlatformController:(id)a3 navigationService:(id)a4;
- (PlatformController)platformController;
- (RoutePlanningSession)observedRoutePlanningSession;
- (id)currentRoutePlanningSessionConfiguration;
- (void)_checkAnimationsForAndromeda:(id)a3;
- (void)_checkAnimationsMitigation;
- (void)_checkETAUpdatesMitigation;
- (void)_checkMapViewMitigation;
- (void)_checkModernMapMitigation;
- (void)beginNavigationWithRouteCollection:(id)a3 navigationDetailsOptions:(NavigationDetailsOptions *)a4 mapServiceTraits:(id)a5 sessionInitiator:(unint64_t)a6 isResumingMultipointRoute:(BOOL)a7;
- (void)callNavigationCompletionBlocksIfNecessary;
- (void)cancelNavigationAutoLaunchIfNeccessary;
- (void)dealloc;
- (void)didUpdateMitigationNamed:(id)a3;
- (void)endNavigationWithCompletion:(id)a3;
- (void)handoffDestinationToExternalDevice:(id)a3;
- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)platformControllerDidChangeChromeViewControllerNotification:(id)a3;
- (void)presentHandoffAlertForDestination:(id)a3;
- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5;
- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5;
- (void)setChromeViewController:(id)a3;
- (void)setNavigationAutoLaunchTimer:(id)a3;
- (void)setNavigationCompletionBlocks:(id)a3;
- (void)setNavigationService:(id)a3;
- (void)setObservedNavigationSession:(id)a3;
- (void)setObservedRoutePlanningSession:(id)a3;
- (void)setPlatformController:(id)a3;
- (void)startNavigationAutoLaunchTimer;
- (void)updateHikingMapConfiguration;
@end

@implementation NavigationStateMonitoringTask

- (void)_checkAnimationsForAndromeda:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 userInfo];
    v7 = [v6 objectForKey:@"kBacklightLuminanceInitialSetupDoneKey"];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  if ((-[NavigationStateMonitoringTask _shouldSuppressAnimationsForAndromeda](self, "_shouldSuppressAnimationsForAndromeda")|| v8)&& (+[BLSBacklight sharedBacklight](BLSBacklight, "sharedBacklight"), v9 = objc_claimAutoreleasedReturnValue(), unsigned int v10 = [v9 isAlwaysOnEnabled], v9, v10))
  {
    if (!self->_andromedaAnimationSuppressionToken)
    {
      v11 = sub_1004AC4FC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Acquiring animation suppression token", buf, 2u);
      }

      v12 = +[MapsAppAnimationSuppressor acquireAnimationSuppressionTokenForReason:@"Backlight Luminance"];
      id andromedaAnimationSuppressionToken = self->_andromedaAnimationSuppressionToken;
      self->_id andromedaAnimationSuppressionToken = v12;
LABEL_15:
    }
  }
  else if (self->_andromedaAnimationSuppressionToken)
  {
    v14 = sub_1004AC4FC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Releasing animation suppression token", v15, 2u);
    }

    id andromedaAnimationSuppressionToken = self->_andromedaAnimationSuppressionToken;
    self->_id andromedaAnimationSuppressionToken = 0;
    goto LABEL_15;
  }
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)_checkAnimationsMitigation
{
  v3 = +[MapsThermalPressureController sharedController];
  unsigned int v4 = [v3 shouldActivateMitigationNamed:@"NavigationSuppressAllAnimations"];

  id thermalPressureAnimationSuppressionToken = self->_thermalPressureAnimationSuppressionToken;
  if (v4)
  {
    if (thermalPressureAnimationSuppressionToken) {
      return;
    }
    v6 = sub_1004AC4FC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Acquiring thermal pressure animation suppression token", buf, 2u);
    }

    v7 = +[MapsAppAnimationSuppressor acquireAnimationSuppressionTokenForReason:@"Thermal Pressure"];
  }
  else
  {
    if (!thermalPressureAnimationSuppressionToken) {
      return;
    }
    BOOL v8 = sub_1004AC4FC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Releasing thermal pressure animation suppression token", v10, 2u);
    }

    v7 = 0;
  }
  id v9 = self->_thermalPressureAnimationSuppressionToken;
  self->_id thermalPressureAnimationSuppressionToken = v7;
}

- (void)_checkETAUpdatesMitigation
{
  v3 = +[MapsThermalPressureController sharedController];
  unsigned int v4 = [v3 shouldActivateMitigationNamed:@"NavigationSuppressETAUpdates"];

  navigationService = self->_navigationService;
  if (v4)
  {
    [(MNNavigationService *)navigationService disableNavigationCapability:1 reason:1];
  }
  else
  {
    [(MNNavigationService *)navigationService enableNavigationCapability:1 reason:1];
  }
}

- (void)platformControllerDidChangeChromeViewControllerNotification:(id)a3
{
  id v5 = [(NavigationStateMonitoringTask *)self platformController];
  unsigned int v4 = [v5 chromeViewController];
  [(NavigationStateMonitoringTask *)self setChromeViewController:v4];
}

- (void)setChromeViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  if (WeakRetained != obj)
  {
    id navigationModernMapToken = self->_navigationModernMapToken;
    self->_id navigationModernMapToken = 0;

    id routePlanningModernMapToken = self->_routePlanningModernMapToken;
    self->_id routePlanningModernMapToken = 0;

    id navigationHikingMapToken = self->_navigationHikingMapToken;
    self->_id navigationHikingMapToken = 0;

    id routePlanningHikingMapToken = self->_routePlanningHikingMapToken;
    self->_id routePlanningHikingMapToken = 0;

    id thermalPressureMapToken = self->_thermalPressureMapToken;
    self->_id thermalPressureMapToken = 0;

    id thermalPressureChromeDeactivationToken = self->_thermalPressureChromeDeactivationToken;
    self->_id thermalPressureChromeDeactivationToken = 0;

    objc_storeWeak((id *)&self->_chromeViewController, obj);
    [(NavigationStateMonitoringTask *)self _checkModernMapMitigation];
    [(NavigationStateMonitoringTask *)self _checkMapViewMitigation];
  }
}

- (BOOL)_shouldSuppressAnimationsForAndromeda
{
  v3 = [(NavigationStateMonitoringTask *)self iosChromeViewController];
  unsigned __int8 v4 = [v3 isTransitioningToLockScreen];

  if (v4) {
    return 1;
  }
  v6 = [(NavigationStateMonitoringTask *)self chromeViewController];
  v7 = [v6 traitCollection];
  unsigned __int8 v8 = [v7 isLuminanceReduced];

  id v9 = [(NavigationStateMonitoringTask *)self navigationService];
  if ([v9 navigationState] == 6)
  {
    BOOL v10 = 1;
  }
  else
  {
    v11 = [(NavigationStateMonitoringTask *)self navigationService];
    BOOL v10 = [v11 navigationState] == 7;
  }
  v12 = [(NavigationStateMonitoringTask *)self navigationService];
  [v12 state];
  int v13 = MNNavigationServiceStateIsNavigating() & v10;

  return v8 & (v13 ^ 1);
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)_checkMapViewMitigation
{
  v3 = +[MapsThermalPressureController sharedController];
  unsigned int v4 = [v3 shouldActivateMitigationNamed:@"NavigationThermalMitigationForceMapInactive"];

  id thermalPressureChromeDeactivationToken = self->_thermalPressureChromeDeactivationToken;
  if (v4)
  {
    if (thermalPressureChromeDeactivationToken) {
      return;
    }
    v6 = sub_1004AC4FC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Acquiring thermal pressure chrome deactivation token", buf, 2u);
    }

    v7 = [(NavigationStateMonitoringTask *)self iosBasedChromeViewController];
    unsigned __int8 v8 = [v7 acquireChromeDeactivationTokenForReason:@"thermal"];
    id v9 = self->_thermalPressureChromeDeactivationToken;
    self->_id thermalPressureChromeDeactivationToken = v8;
  }
  else
  {
    if (!thermalPressureChromeDeactivationToken) {
      return;
    }
    BOOL v10 = sub_1004AC4FC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Releasing thermal pressure chrome deactivation token", v11, 2u);
    }

    v7 = self->_thermalPressureChromeDeactivationToken;
    self->_id thermalPressureChromeDeactivationToken = 0;
  }
}

- (void)_checkModernMapMitigation
{
  v3 = +[MapsThermalPressureController sharedController];
  unsigned int v4 = [v3 shouldActivateMitigationNamed:@"NavigationForceModernMapMitigation"];

  id thermalPressureMapToken = self->_thermalPressureMapToken;
  if (v4)
  {
    if (thermalPressureMapToken) {
      return;
    }
    v6 = sub_1004AC4FC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Acquiring thermal pressure map mode token", buf, 2u);
    }

    v7 = [(NavigationStateMonitoringTask *)self iosBasedChromeViewController];
    unsigned __int8 v8 = [v7 acquireModernMapTokenForReason:1];
    id v9 = self->_thermalPressureMapToken;
    self->_id thermalPressureMapToken = v8;
  }
  else
  {
    if (!thermalPressureMapToken) {
      return;
    }
    BOOL v10 = sub_1004AC4FC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Releasing thermal pressure map mode token", v11, 2u);
    }

    v7 = self->_thermalPressureMapToken;
    self->_id thermalPressureMapToken = 0;
  }
}

- (NavigationStateMonitoringTask)initWithPlatformController:(id)a3 navigationService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)NavigationStateMonitoringTask;
  unsigned __int8 v8 = [(NavigationStateMonitoringTask *)&v23 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_platformController, v6);
    BOOL v10 = +[NSNotificationCenter defaultCenter];
    v11 = PlatformControllerDidChangeChromeViewControllerNotification;
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_platformController);
    [v10 addObserver:v9 selector:"platformControllerDidChangeChromeViewControllerNotification:" name:v11 object:WeakRetained];

    id v13 = objc_loadWeakRetained((id *)&v9->_platformController);
    v14 = [v13 chromeViewController];
    [(NavigationStateMonitoringTask *)v9 setChromeViewController:v14];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v9 selector:"_checkAnimationsForAndromeda:" name:@"BacklightLuminanceDidChangeNotification" object:0];

    objc_storeStrong((id *)&v9->_navigationService, a4);
    uint64_t v16 = +[NSHashTable hashTableWithOptions:66048];
    navigationCompletionBlocks = v9->_navigationCompletionBlocks;
    v9->_navigationCompletionBlocks = (NSHashTable *)v16;

    [(MNNavigationService *)v9->_navigationService registerObserver:v9];
    [(MNNavigationService *)v9->_navigationService openForClient:v9];
    v18 = +[MapsThermalPressureController sharedController];
    [v18 addObserver:v9 forMitigationNamed:@"NavigationForceModernMapMitigation"];

    v19 = +[MapsThermalPressureController sharedController];
    [v19 addObserver:v9 forMitigationNamed:@"NavigationSuppressAllAnimations"];

    v20 = +[MapsThermalPressureController sharedController];
    [v20 addObserver:v9 forMitigationNamed:@"NavigationSuppressETAUpdates"];

    v21 = +[MapsThermalPressureController sharedController];
    [v21 addObserver:v9 forMitigationNamed:@"NavigationThermalMitigationForceMapInactive"];

    [(NavigationStateMonitoringTask *)v9 _checkModernMapMitigation];
    [(NavigationStateMonitoringTask *)v9 _checkAnimationsMitigation];
    [(NavigationStateMonitoringTask *)v9 _checkETAUpdatesMitigation];
    [(NavigationStateMonitoringTask *)v9 _checkMapViewMitigation];
    [(NavigationStateMonitoringTask *)v9 _checkAnimationsForAndromeda:0];
  }

  return v9;
}

+ (int64_t)creationPreference
{
  return 0;
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (void)dealloc
{
  [(NavigationStateMonitoringTask *)self cancelNavigationAutoLaunchIfNeccessary];
  [(MNNavigationService *)self->_navigationService unregisterObserver:self];
  [(MNNavigationService *)self->_navigationService closeForClient:self];
  v3.receiver = self;
  v3.super_class = (Class)NavigationStateMonitoringTask;
  [(NavigationStateMonitoringTask *)&v3 dealloc];
}

- (BOOL)isNavigationAutoLaunchInProgress
{
  v2 = [(NavigationStateMonitoringTask *)self navigationAutoLaunchTimer];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)cancelNavigationAutoLaunchIfNeccessary
{
  BOOL v3 = sub_1004AC4FC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Canceling auto launch timer", v7, 2u);
  }

  unsigned int v4 = [(NavigationStateMonitoringTask *)self navigationAutoLaunchTimer];

  if (v4)
  {
    id v5 = [(NavigationStateMonitoringTask *)self navigationAutoLaunchTimer];
    [v5 invalidate];

    [(NavigationStateMonitoringTask *)self setNavigationAutoLaunchTimer:0];
  }
  id v6 = [(NavigationStateMonitoringTask *)self currentRoutePlanningSessionConfiguration];
  [v6 setNavigationAutoLaunchDelay:0];
}

- (void)beginNavigationWithRouteCollection:(id)a3 navigationDetailsOptions:(NavigationDetailsOptions *)a4 mapServiceTraits:(id)a5 sessionInitiator:(unint64_t)a6 isResumingMultipointRoute:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a5;
  if (!v12)
  {
    v44 = sub_1005762E4();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v50 = 136315906;
      *(void *)&v50[4] = "-[NavigationStateMonitoringTask beginNavigationWithRouteCollection:navigationDetailsOptions:m"
                           "apServiceTraits:sessionInitiator:isResumingMultipointRoute:]";
      *(_WORD *)&v50[12] = 2080;
      *(void *)&v50[14] = "NavigationStateMonitoringTask.m";
      *(_WORD *)&v50[22] = 1024;
      *(_DWORD *)&v50[24] = 185;
      *(_WORD *)&v50[28] = 2080;
      *(void *)&v50[30] = "routeCollection != nil";
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", v50, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v45 = sub_1005762E4();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v46 = +[NSThread callStackSymbols];
        *(_DWORD *)v50 = 138412290;
        *(void *)&v50[4] = v46;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%@", v50, 0xCu);
      }
    }
  }
  if (!v13)
  {
    v47 = sub_1005762E4();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v50 = 136315906;
      *(void *)&v50[4] = "-[NavigationStateMonitoringTask beginNavigationWithRouteCollection:navigationDetailsOptions:m"
                           "apServiceTraits:sessionInitiator:isResumingMultipointRoute:]";
      *(_WORD *)&v50[12] = 2080;
      *(void *)&v50[14] = "NavigationStateMonitoringTask.m";
      *(_WORD *)&v50[22] = 1024;
      *(_DWORD *)&v50[24] = 186;
      *(_WORD *)&v50[28] = 2080;
      *(void *)&v50[30] = "mapServiceTraits != nil";
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", v50, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v48 = sub_1005762E4();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = +[NSThread callStackSymbols];
        *(_DWORD *)v50 = 138412290;
        *(void *)&v50[4] = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%@", v50, 0xCu);
      }
    }
  }
  v14 = sub_1004AC4FC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v50 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Attempting to begin navigation", v50, 2u);
  }

  [(NavigationStateMonitoringTask *)self cancelNavigationAutoLaunchIfNeccessary];
  v15 = [(NavigationStateMonitoringTask *)self platformController];
  uint64_t v16 = [v15 currentSession];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v18 = sub_1005762E4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v50 = 136315650;
      *(void *)&v50[4] = "-[NavigationStateMonitoringTask beginNavigationWithRouteCollection:navigationDetailsOptions:m"
                           "apServiceTraits:sessionInitiator:isResumingMultipointRoute:]";
      *(_WORD *)&v50[12] = 2080;
      *(void *)&v50[14] = "NavigationStateMonitoringTask.m";
      *(_WORD *)&v50[22] = 1024;
      *(_DWORD *)&v50[24] = 192;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", v50, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      v19 = sub_1005762E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = +[NSThread callStackSymbols];
        *(_DWORD *)v50 = 138412290;
        *(void *)&v50[4] = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", v50, 0xCu);
      }
    }
    v21 = sub_1004AC4FC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = [(NavigationStateMonitoringTask *)self platformController];
      objc_super v23 = [v22 currentSession];
      *(_DWORD *)v50 = 138412290;
      *(void *)&v50[4] = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Attempted to begin navigation, but there is already a NavigationSession on the sessionStack: %@", v50, 0xCu);
LABEL_26:
    }
  }
  else
  {
    v24 = [(NavigationStateMonitoringTask *)self platformController];
    v25 = [v24 chromeViewController];
    v26 = [v25 topMostPresentedViewController];
    objc_opt_class();
    char v27 = objc_opt_isKindOfClass();

    if (v27)
    {
      v28 = [v12 currentRoute];
      unsigned int v29 = [v28 carplayDestinationHandoffRequired];

      if (v29)
      {
        v30 = [v12 currentRoute];
        v31 = [v30 _maps_directionsWaypoints];
        v21 = [v31 lastObject];

        v32 = [v21 pin];
        if ([(NavigationStateMonitoringTask *)self shouldStartNavigationAutoLaunchTimer])
        {
          [(NavigationStateMonitoringTask *)self handoffDestinationToExternalDevice:v32];
        }
        else
        {
          [(NavigationStateMonitoringTask *)self presentHandoffAlertForDestination:v32];
        }
      }
      else
      {
        if (a6 == 6)
        {
          v37 = [(NavigationStateMonitoringTask *)self observedRoutePlanningSession];
          v38 = [v37 configuration];
          v21 = [v38 tracePlaybackPath];
        }
        else
        {
          v21 = 0;
        }
        v39 = [NavigationSessionBuilder alloc];
        long long v40 = *(_OWORD *)&a4->guidanceType;
        *(_OWORD *)v50 = *(_OWORD *)&a4->shouldSimulateLocations;
        *(_OWORD *)&v50[16] = v40;
        *(_OWORD *)&v50[32] = *(_OWORD *)&a4->isReconnecting;
        unint64_t navigationModeContext = a4->navigationModeContext;
        v41 = [(NavigationSessionBuilder *)v39 initWithRouteCollection:v12 navigationDetailsOptions:v50 mapServiceTraits:v13 sessionInitiator:a6 isResumingMultipointRoute:v7 tracePlaybackPath:v21];
        v42 = [(NavigationSessionBuilder *)v41 build];

        v43 = [(NavigationStateMonitoringTask *)self platformController];
        [v43 pushSession:v42];
      }
    }
    else
    {
      v33 = sub_1005762E4();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v50 = 136315650;
        *(void *)&v50[4] = "-[NavigationStateMonitoringTask beginNavigationWithRouteCollection:navigationDetailsOptions"
                             ":mapServiceTraits:sessionInitiator:isResumingMultipointRoute:]";
        *(_WORD *)&v50[12] = 2080;
        *(void *)&v50[14] = "NavigationStateMonitoringTask.m";
        *(_WORD *)&v50[22] = 1024;
        *(_DWORD *)&v50[24] = 198;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", v50, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        v34 = sub_1005762E4();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v35 = +[NSThread callStackSymbols];
          *(_DWORD *)v50 = 138412290;
          *(void *)&v50[4] = v35;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%@", v50, 0xCu);
        }
      }
      v21 = sub_1004AC4FC();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = [(NavigationStateMonitoringTask *)self platformController];
        objc_super v23 = [v22 chromeViewController];
        v36 = [v23 topMostPresentedViewController];
        *(_DWORD *)v50 = 138412290;
        *(void *)&v50[4] = v36;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Attempted to begin navigation but there is an unexpected VC at the top of the stack: %@", v50, 0xCu);

        goto LABEL_26;
      }
    }
  }
}

- (void)endNavigationWithCompletion:(id)a3
{
  unsigned int v4 = (void (**)(void))a3;
  id v5 = [(NavigationStateMonitoringTask *)self navigationService];
  if ([v5 isInNavigatingState])
  {

LABEL_4:
    if (v4)
    {
      id v9 = [(NavigationStateMonitoringTask *)self navigationCompletionBlocks];
      objc_sync_enter(v9);
      BOOL v10 = [(NavigationStateMonitoringTask *)self navigationCompletionBlocks];
      v11 = objc_retainBlock(v4);
      [v10 addObject:v11];

      objc_sync_exit(v9);
    }
    id v12 = sub_1004AC4FC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      CFStringRef v13 = @"with";
      if (!v4) {
        CFStringRef v13 = @"without";
      }
      int v16 = 138412290;
      CFStringRef v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Ending navigation %@ a completion block", (uint8_t *)&v16, 0xCu);
    }

    v14 = [(NavigationStateMonitoringTask *)self platformController];
    [v14 clearIfCurrentSessionIsKindOfClass:objc_opt_class()];

    goto LABEL_11;
  }
  id v6 = [(NavigationStateMonitoringTask *)self platformController];
  BOOL v7 = [v6 currentSession];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_4;
  }
  v15 = sub_1004AC4FC();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Cannot end navigation when navigation is not running", (uint8_t *)&v16, 2u);
  }

  if (v4) {
    v4[2](v4);
  }
LABEL_11:
}

- (id)currentRoutePlanningSessionConfiguration
{
  v2 = [(NavigationStateMonitoringTask *)self observedRoutePlanningSession];
  BOOL v3 = [v2 configuration];

  return v3;
}

- (BOOL)shouldStartNavigationAutoLaunchTimer
{
  v2 = [(NavigationStateMonitoringTask *)self currentRoutePlanningSessionConfiguration];
  unsigned __int8 v3 = [v2 shouldAutoLaunchNavigation];

  return v3;
}

- (void)startNavigationAutoLaunchTimer
{
  unsigned __int8 v3 = [(NavigationStateMonitoringTask *)self navigationAutoLaunchTimer];

  if (!v3)
  {
    unsigned int v4 = [(NavigationStateMonitoringTask *)self currentRoutePlanningSessionConfiguration];
    id v5 = [v4 navigationAutoLaunchDelay];
    [v5 doubleValue];
    double v7 = v6;

    unsigned __int8 v8 = sub_1004AC4FC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting navigation auto launch timer with delay: %f", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    id v9 = &_dispatch_main_q;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1004AD180;
    v11[3] = &unk_1012E7638;
    objc_copyWeak(&v12, (id *)buf);
    BOOL v10 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v11 block:v7];
    [(NavigationStateMonitoringTask *)self setNavigationAutoLaunchTimer:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

- (void)presentHandoffAlertForDestination:(id)a3
{
  id v21 = a3;
  unsigned __int8 v3 = sub_1004AC4FC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Presenting NAD handoff alert", buf, 2u);
  }

  unsigned int v4 = +[MapsExternalDevice sharedInstance];
  id v5 = [v4 mapsDisplayName];

  double v6 = +[NSBundle mainBundle];
  if (v5)
  {
    double v7 = [v6 localizedStringForKey:@"Destination handoff alert title [phone]" value:@"localized string not found" table:0];
    unsigned __int8 v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v5);

    id v9 = +[NSBundle mainBundle];
    BOOL v10 = [v9 localizedStringForKey:@"Destination handoff alert message [phone]" value:@"localized string not found" table:0];
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v5);
  }
  else
  {
    unsigned __int8 v8 = [v6 localizedStringForKey:@"Unknown destination handoff alert title [phone]" value:@"localized string not found" table:0];

    id v9 = +[NSBundle mainBundle];
    v11 = [v9 localizedStringForKey:@"Unknown destination handoff alert message [phone]" value:@"localized string not found" table:0];
  }

  id v12 = +[UIAlertController alertControllerWithTitle:v8 message:v11 preferredStyle:1];
  CFStringRef v13 = +[NSBundle mainBundle];
  double v14 = [v13 localizedStringForKey:@"Cancel [destination handoff action to CarPlay car]" value:@"localized string not found" table:0];
  v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:0];

  [v12 addAction:v15];
  int v16 = +[NSBundle mainBundle];
  CFStringRef v17 = [v16 localizedStringForKey:@"Continue [destination handoff action to CarPlay car]" value:@"localized string not found" table:0];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1004AD8D8;
  v23[3] = &unk_1012E9640;
  v23[4] = self;
  id v24 = v21;
  id v18 = v21;
  v19 = +[UIAlertAction actionWithTitle:v17 style:0 handler:v23];

  [v12 addAction:v19];
  [v12 setPreferredAction:v19];
  v20 = [(NavigationStateMonitoringTask *)self chromeViewController];
  [v20 _maps_topMostPresentViewController:v12 animated:1 completion:0];
}

- (void)handoffDestinationToExternalDevice:(id)a3
{
  id v4 = a3;
  id v5 = sub_1004AC4FC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Performing NAD handoff", buf, 2u);
  }

  double v6 = +[MapsExternalDevice sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1004AD9E4;
  v8[3] = &unk_1012EC2D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 handoffDestination:v7 completion:v8];
}

- (void)callNavigationCompletionBlocksIfNecessary
{
  id v13 = [(NavigationStateMonitoringTask *)self platformController];
  unsigned __int8 v3 = [v13 currentSession];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    id v4 = [(NavigationStateMonitoringTask *)self navigationService];
    unsigned __int8 v5 = [v4 isInNavigatingState];

    if ((v5 & 1) == 0)
    {
      double v6 = [(NavigationStateMonitoringTask *)self navigationCompletionBlocks];
      objc_sync_enter(v6);
      id v7 = [(NavigationStateMonitoringTask *)self navigationCompletionBlocks];
      id v8 = [v7 count];

      if (v8)
      {
        id v9 = [(NavigationStateMonitoringTask *)self navigationCompletionBlocks];
        BOOL v10 = [v9 allObjects];

        v11 = [(NavigationStateMonitoringTask *)self navigationCompletionBlocks];
        [v11 removeAllObjects];

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1004ADCD0;
        block[3] = &unk_1012E5D08;
        id v15 = v10;
        id v12 = v10;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
      objc_sync_exit(v6);
    }
  }
}

- (void)updateHikingMapConfiguration
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v4 = dispatch_queue_get_label(0);
  val = self;
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v90 = sub_1005762E4();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      {
        v91 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v92 = dispatch_queue_get_label(0);
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = "-[NavigationStateMonitoringTask updateHikingMapConfiguration]";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "NavigationStateMonitoringTask.m";
        *(_WORD *)&buf[22] = 1024;
        int v146 = 386;
        __int16 v147 = 2080;
        v148 = "dispatch_get_main_queue()";
        __int16 v149 = 2080;
        v150 = v91;
        __int16 v151 = 2080;
        v152 = v92;
        _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v93 = sub_1005762E4();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
        {
          v94 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v94;
          _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  id droppedPinBlock = self->_droppedPinBlock;
  if (droppedPinBlock)
  {
    dispatch_block_cancel(droppedPinBlock);
    id v7 = self->_droppedPinBlock;
    self->_id droppedPinBlock = 0;
  }
  if (self->_routePlanningHikingMapToken) {
    BOOL obj = self->_navigationHikingMapToken != 0;
  }
  else {
    BOOL obj = 0;
  }
  id v8 = [(NavigationStateMonitoringTask *)self observedRoutePlanningSession];
  BOOL v9 = v8 == 0;

  if (v9)
  {
    id routePlanningHikingMapToken = val->_routePlanningHikingMapToken;
    val->_id routePlanningHikingMapToken = 0;
  }
  v11 = [(NavigationStateMonitoringTask *)val observedNavigationSession];
  BOOL v12 = v11 == 0;

  if (v12)
  {
    id navigationHikingMapToken = val->_navigationHikingMapToken;
    val->_id navigationHikingMapToken = 0;
  }
  v102 = +[NSMutableArray array];
  v106 = [(NavigationStateMonitoringTask *)val observedRoutePlanningSession];
  double v14 = [v106 currentRouteCollection];
  v100 = [v14 currentRoute];

  v103 = [v106 resolvedWaypoints];
  v99 = [v103 waypointsOrNull];
  v104 = [(NavigationStateMonitoringTask *)val observedNavigationSession];
  id v15 = [v104 currentRouteCollection];
  v105 = [v15 currentRoute];

  v98 = [v105 anchorPoints];
  v97 = [v105 waypoints];
  if (v106)
  {
    int v16 = sub_1004AC4FC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      *(void *)&uint8_t buf[4] = val;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Updating hiking map configuration in route planning", buf, 0xCu);
    }

    if (![v103 areAllValidWaypoints]
      || [v106 currentTransportType] != (id)2
      || (MapsFeature_IsEnabled_HikingiOS() & 1) == 0)
    {
      id v21 = sub_1004AC4FC();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        *(void *)&uint8_t buf[4] = val;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}p] Waypoints are not all valid or we are in an unsupported transport type; disabling topographic map",
          buf,
          0xCu);
      }

      id v18 = val->_routePlanningHikingMapToken;
      val->_id routePlanningHikingMapToken = 0;
      goto LABEL_44;
    }
    if ([v100 source] == (id)2)
    {
      CFStringRef v17 = sub_1004AC4FC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        *(void *)&uint8_t buf[4] = val;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] Found curated route; enabling topographic map",
          buf,
          0xCu);
      }

      id v18 = [(NavigationStateMonitoringTask *)val chromeViewController];
      uint64_t v19 = [v18 acquireHikingMapToken];
      id v20 = val->_routePlanningHikingMapToken;
      val->_id routePlanningHikingMapToken = (id)v19;

      goto LABEL_44;
    }
    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    id v18 = v99;
    id v46 = [v18 countByEnumeratingWithState:&v132 objects:v144 count:16];
    if (!v46) {
      goto LABEL_44;
    }
    uint64_t v47 = *(void *)v133;
    uint64_t v96 = 138412290;
LABEL_64:
    uint64_t v48 = 0;
    while (1)
    {
      if (*(void *)v133 != v47) {
        objc_enumerationMutation(v18);
      }
      v49 = *(void **)(*((void *)&v132 + 1) + 8 * v48);
      v50 = +[NSNull null];
      unsigned int v51 = [v49 isEqual:v50];

      if (v51) {
        break;
      }
      if ([v49 mapDisplayType] == 1)
      {
        v78 = sub_1004AC4FC();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
        {
          v79 = [v49 name];
          *(_DWORD *)buf = 134349314;
          *(void *)&uint8_t buf[4] = val;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v79;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "[%{public}p] Found waypoint with topographic map display type; enabling topographic map (%@)",
            buf,
            0x16u);
        }
        goto LABEL_131;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v78 = sub_1004AC4FC();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
        {
          v80 = [v49 name];
          *(_DWORD *)buf = 134349314;
          *(void *)&uint8_t buf[4] = val;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v80;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "[%{public}p] Found waypoint to route; enabling topographic map (%@)",
            buf,
            0x16u);
        }
LABEL_131:

        v81 = [(NavigationStateMonitoringTask *)val chromeViewController];
        uint64_t v82 = [v81 acquireHikingMapToken];
        id v83 = val->_routePlanningHikingMapToken;
        val->_id routePlanningHikingMapToken = (id)v82;

        goto LABEL_44;
      }
      if ([v49 isCurrentLocation])
      {
        v55 = sub_1004AC4FC();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          v56 = [v49 name];
          *(_DWORD *)buf = 134349314;
          *(void *)&uint8_t buf[4] = val;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v56;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "[%{public}p] Found current location waypoint: %@", buf, 0x16u);
        }
        if (!GEOConfigGetBOOL()) {
          goto LABEL_94;
        }
      }
      else if ([v49 isLocationWaypointType])
      {
        v57 = sub_1004AC4FC();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          v58 = [v49 name];
          *(_DWORD *)buf = 134349314;
          *(void *)&uint8_t buf[4] = val;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v58;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "[%{public}p] Found location waypoint: %@", buf, 0x16u);
        }
        if (!GEOConfigGetBOOL()) {
          goto LABEL_94;
        }
      }
      else
      {
        unsigned int v59 = [v49 isAddressWaypointType];
        v53 = sub_1004AC4FC();
        BOOL v60 = os_log_type_enabled(v53, OS_LOG_TYPE_INFO);
        if (!v59)
        {
          if (v60)
          {
            v62 = [v49 name];
            *(_DWORD *)buf = 134349314;
            *(void *)&uint8_t buf[4] = val;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v62;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "[%{public}p] Found other waypoint: %@", buf, 0x16u);
          }
LABEL_93:

          goto LABEL_94;
        }
        if (v60)
        {
          v61 = [v49 name];
          *(_DWORD *)buf = 134349314;
          *(void *)&uint8_t buf[4] = val;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v61;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "[%{public}p] Found address waypoint: %@", buf, 0x16u);
        }
        if (!GEOConfigGetBOOL()) {
          goto LABEL_94;
        }
      }
      [v102 addObject:v49];
LABEL_94:
      if (v46 == (id)++v48)
      {
        id v46 = [v18 countByEnumeratingWithState:&v132 objects:v144 count:16];
        if (v46) {
          goto LABEL_64;
        }
        goto LABEL_44;
      }
    }
    v52 = sub_1005762E4();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[NavigationStateMonitoringTask updateHikingMapConfiguration]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "NavigationStateMonitoringTask.m";
      *(_WORD *)&buf[22] = 1024;
      int v146 = 421;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (!sub_100BB36BC()) {
      goto LABEL_94;
    }
    v53 = sub_1005762E4();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v54 = +[NSThread callStackSymbols];
      *(_DWORD *)buf = v96;
      *(void *)&uint8_t buf[4] = v54;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    goto LABEL_93;
  }
  v22 = val;
  if (!v104) {
    goto LABEL_45;
  }
  objc_super v23 = sub_1004AC4FC();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    *(void *)&uint8_t buf[4] = val;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[%{public}p] Updating hiking map configuration in navigation", buf, 0xCu);
  }

  id v24 = [v104 currentRouteCollection];
  v25 = [v24 currentRoute];
  if (!v25) {
    goto LABEL_40;
  }
  if ([v104 currentTransportType] != (id)2)
  {

LABEL_40:
    goto LABEL_41;
  }
  char IsEnabled_HikingiOS = MapsFeature_IsEnabled_HikingiOS();

  if ((IsEnabled_HikingiOS & 1) == 0)
  {
LABEL_41:
    v30 = sub_1004AC4FC();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      *(void *)&uint8_t buf[4] = val;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[%{public}p] We have no route or we are in an unsupported transport type; disabling topographic map",
        buf,
        0xCu);
    }

    id v18 = val->_navigationHikingMapToken;
    val->_id navigationHikingMapToken = 0;
    goto LABEL_44;
  }
  if ([v105 source] == (id)2)
  {
    char v27 = sub_1004AC4FC();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      *(void *)&uint8_t buf[4] = val;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "[%{public}p] Found curated route; enabling topographic map",
        buf,
        0xCu);
    }

    id v18 = [(NavigationStateMonitoringTask *)val chromeViewController];
    uint64_t v28 = [v18 acquireHikingMapToken];
    id v29 = val->_navigationHikingMapToken;
    val->_id navigationHikingMapToken = (id)v28;

    goto LABEL_44;
  }
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id v63 = [v98 count];
  v64 = v98;
  if (!v63) {
    v64 = v97;
  }
  id v18 = v64;
  id v65 = [v18 countByEnumeratingWithState:&v128 objects:v143 count:16];
  if (v65)
  {
    uint64_t v66 = *(void *)v129;
    do
    {
      for (i = 0; i != v65; i = (char *)i + 1)
      {
        if (*(void *)v129 != v66) {
          objc_enumerationMutation(v18);
        }
        v68 = *(void **)(*((void *)&v128 + 1) + 8 * i);
        if ([v68 mapDisplayType] == 1)
        {
          v84 = sub_1004AC4FC();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
          {
            v85 = [v68 name];
            *(_DWORD *)buf = 134349314;
            *(void *)&uint8_t buf[4] = val;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v85;
            _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_INFO, "[%{public}p] Found waypoint with topographic map display type; enabling topographic map (%@)",
              buf,
              0x16u);
          }
          goto LABEL_137;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v84 = sub_1004AC4FC();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
          {
            v86 = [v68 name];
            *(_DWORD *)buf = 134349314;
            *(void *)&uint8_t buf[4] = val;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v86;
            _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_INFO, "[%{public}p] Found waypoint to route; enabling topographic map (%@)",
              buf,
              0x16u);
          }
LABEL_137:

          v87 = [(NavigationStateMonitoringTask *)val chromeViewController];
          uint64_t v88 = [v87 acquireHikingMapToken];
          id v89 = val->_navigationHikingMapToken;
          val->_id navigationHikingMapToken = (id)v88;

          goto LABEL_44;
        }
        if ([v68 isCurrentLocation])
        {
          v69 = sub_1004AC4FC();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
          {
            v70 = [v68 name];
            *(_DWORD *)buf = 134349314;
            *(void *)&uint8_t buf[4] = val;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v70;
            _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "[%{public}p] Found current location waypoint: %@", buf, 0x16u);
          }
          if (GEOConfigGetBOOL()) {
            goto LABEL_120;
          }
        }
        else if ([v68 isLocationWaypointType])
        {
          v71 = sub_1004AC4FC();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
          {
            v72 = [v68 name];
            *(_DWORD *)buf = 134349314;
            *(void *)&uint8_t buf[4] = val;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v72;
            _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "[%{public}p] Found location waypoint: %@", buf, 0x16u);
          }
          if (GEOConfigGetBOOL()) {
            goto LABEL_120;
          }
        }
        else
        {
          unsigned int v73 = [v68 isAddressWaypointType];
          v74 = sub_1004AC4FC();
          BOOL v75 = os_log_type_enabled(v74, OS_LOG_TYPE_INFO);
          if (v73)
          {
            if (v75)
            {
              v76 = [v68 name];
              *(_DWORD *)buf = 134349314;
              *(void *)&uint8_t buf[4] = val;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v76;
              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "[%{public}p] Found address waypoint: %@", buf, 0x16u);
            }
            if (GEOConfigGetBOOL())
            {
LABEL_120:
              [v102 addObject:v68];
              continue;
            }
          }
          else
          {
            if (v75)
            {
              v77 = [v68 name];
              *(_DWORD *)buf = 134349314;
              *(void *)&uint8_t buf[4] = val;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v77;
              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "[%{public}p] Found other waypoint: %@", buf, 0x16u);
            }
          }
        }
      }
      id v65 = [v18 countByEnumeratingWithState:&v128 objects:v143 count:16];
    }
    while (v65);
  }
LABEL_44:

  v22 = val;
LABEL_45:
  objc_initWeak(&location, v22);
  v124[0] = _NSConcreteStackBlock;
  v124[1] = 3221225472;
  v124[2] = sub_1004AF2DC;
  v124[3] = &unk_1012E6830;
  v95 = &v125;
  objc_copyWeak(&v125, &location);
  BOOL v126 = obj;
  v101 = objc_retainBlock(v124);
  v31 = v101;
  if (![v102 count] || val->_routePlanningHikingMapToken || val->_navigationHikingMapToken)
  {
    ((void (*)(void *))v101[2])(v101);
  }
  else
  {
    v32 = sub_1004AC4FC();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      *(void *)&uint8_t buf[4] = val;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[%{public}p] Checking all location waypoints for hiking contextual regions", buf, 0xCu);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    LOBYTE(v146) = 0;
    v33 = dispatch_group_create();
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    id obja = v102;
    id v34 = [obja countByEnumeratingWithState:&v120 objects:v142 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v121;
      do
      {
        for (j = 0; j != v34; j = (char *)j + 1)
        {
          if (*(void *)v121 != v35) {
            objc_enumerationMutation(obja);
          }
          v37 = *(void **)(*((void *)&v120 + 1) + 8 * (void)j);
          dispatch_group_enter(v33);
          [v37 coordinate];
          CLLocationDegrees v39 = v38;
          [v37 coordinate];
          CLLocationCoordinate2D v41 = CLLocationCoordinate2DMake(v39, v40);
          v42 = sub_1004AC4FC();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v136 = 134349569;
            v137 = val;
            __int16 v138 = 2049;
            CLLocationDegrees latitude = v41.latitude;
            __int16 v140 = 2049;
            CLLocationDegrees longitude = v41.longitude;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "[%{public}p] Checking location %{private}f, %{private}f", v136, 0x20u);
          }

          v43 = [(NavigationStateMonitoringTask *)val chromeViewController];
          v115[0] = _NSConcreteStackBlock;
          v115[1] = 3221225472;
          v115[2] = sub_1004AF35C;
          v115[3] = &unk_1012EC300;
          objc_copyWeak(&v118, &location);
          CLLocationCoordinate2D v119 = v41;
          v117 = buf;
          v116 = v33;
          [v43 checkIfCoordinate:v115 isInHikingContextualRegionWithCompletionHandler:v41.latitude, v41.longitude];

          objc_destroyWeak(&v118);
        }
        id v34 = [obja countByEnumeratingWithState:&v120 objects:v142 count:16];
      }
      while (v34);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004AF45C;
    block[3] = &unk_1012EC328;
    objc_copyWeak(&v114, &location);
    v113 = buf;
    id v111 = v106;
    v112 = v101;
    dispatch_block_t v44 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
    id v45 = val->_droppedPinBlock;
    val->_id droppedPinBlock = v44;

    dispatch_group_notify(v33, (dispatch_queue_t)&_dispatch_main_q, val->_droppedPinBlock);
    objc_destroyWeak(&v114);

    _Block_object_dispose(buf, 8);
    v31 = v101;
  }

  objc_destroyWeak(v95);
  objc_destroyWeak(&location);
}

- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v12 = a5;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = v12;
  if (isKindOfClass)
  {
    id v8 = [v12 currentTransportType];
    if ((v8 == (id)5 || v8 == (id)2) && !self->_navigationModernMapToken)
    {
      BOOL v9 = [(NavigationStateMonitoringTask *)self iosBasedChromeViewController];
      BOOL v10 = [v9 acquireModernMapTokenForReason:0];
      id navigationModernMapToken = self->_navigationModernMapToken;
      self->_id navigationModernMapToken = v10;
    }
    [(NavigationStateMonitoringTask *)self updateHikingMapConfiguration];
    id v7 = v12;
  }
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v18 = a4;
  id v7 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(NavigationStateMonitoringTask *)self cancelNavigationAutoLaunchIfNeccessary];
    id routePlanningModernMapToken = self->_routePlanningModernMapToken;
    self->_id routePlanningModernMapToken = 0;

    id routePlanningHikingMapToken = self->_routePlanningHikingMapToken;
    self->_id routePlanningHikingMapToken = 0;
  }
  id v10 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  [(NavigationStateMonitoringTask *)self setObservedRoutePlanningSession:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(NavigationStateMonitoringTask *)self callNavigationCompletionBlocksIfNecessary];
    id navigationModernMapToken = self->_navigationModernMapToken;
    self->_id navigationModernMapToken = 0;

    id navigationHikingMapToken = self->_navigationHikingMapToken;
    self->_id navigationHikingMapToken = 0;
  }
  id v15 = v10;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v16 = v15;
  }
  else {
    int v16 = 0;
  }
  id v17 = v16;

  [(NavigationStateMonitoringTask *)self setObservedNavigationSession:v17];
}

- (void)setObservedRoutePlanningSession:(id)a3
{
  BOOL v5 = (RoutePlanningSession *)a3;
  observedRoutePlanningSession = self->_observedRoutePlanningSession;
  if (observedRoutePlanningSession != v5)
  {
    id v12 = v5;
    [observedRoutePlanningSession removeObserver:self];
    [self->_observedRoutePlanningSession setNavigationStateMonitoringTask:0];
    objc_storeStrong((id *)&self->_observedRoutePlanningSession, a3);
    [self->_observedRoutePlanningSession addObserver:self];
    [self->_observedRoutePlanningSession setNavigationStateMonitoringTask:self];
    id v7 = self->_observedRoutePlanningSession;
    if (v7)
    {
      if (!self->_routePlanningModernMapToken)
      {
        id v8 = [(RoutePlanningSession *)v7 currentTransportType];
        if (v8 == (id)5 || v8 == (id)2)
        {
          BOOL v9 = [(NavigationStateMonitoringTask *)self iosBasedChromeViewController];
          id v10 = [v9 acquireModernMapTokenForReason:0];
          id routePlanningModernMapToken = self->_routePlanningModernMapToken;
          self->_id routePlanningModernMapToken = v10;
        }
      }
    }
    [(NavigationStateMonitoringTask *)self updateHikingMapConfiguration];
    BOOL v5 = v12;
  }
}

- (void)setObservedNavigationSession:(id)a3
{
  BOOL v5 = (NavigationSession *)a3;
  observedNavigationSession = self->_observedNavigationSession;
  if (observedNavigationSession != v5)
  {
    id v7 = v5;
    [observedNavigationSession removeObserver:self];
    objc_storeStrong((id *)&self->_observedNavigationSession, a3);
    [self->_observedNavigationSession addObserver:self];
    [(NavigationStateMonitoringTask *)self updateHikingMapConfiguration];
    BOOL v5 = v7;
  }
}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  id v10 = a3;
  if (a4 == 5 || a4 == 2)
  {
    if (self->_routePlanningModernMapToken) {
      goto LABEL_8;
    }
    id v7 = [(NavigationStateMonitoringTask *)self iosBasedChromeViewController];
    id v8 = [v7 acquireModernMapTokenForReason:0];
    id routePlanningModernMapToken = self->_routePlanningModernMapToken;
    self->_id routePlanningModernMapToken = v8;
  }
  else
  {
    id v7 = self->_routePlanningModernMapToken;
    if (!v7) {
      goto LABEL_8;
    }
    self->_id routePlanningModernMapToken = 0;
  }

LABEL_8:
  [(NavigationStateMonitoringTask *)self updateHikingMapConfiguration];
}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  id v8 = a4;
  if ([a3 currentTransportType] == (id)a5
    && [v8 isSuccess]
    && [(NavigationStateMonitoringTask *)self shouldStartNavigationAutoLaunchTimer])
  {
    [(NavigationStateMonitoringTask *)self startNavigationAutoLaunchTimer];
  }
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v6 = a3;
  id v7 = +[UIDevice currentDevice];
  if ([v7 userInterfaceIdiom] || (MNNavigationServiceStateChangedToNavigating() & 1) == 0)
  {
LABEL_16:

LABEL_17:
    if (MNNavigationServiceStateChangedFromNavigatingToStopped())
    {
      id v24 = [(NavigationStateMonitoringTask *)self platformController];
      v25 = [v24 currentSession];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        char v27 = sub_1004AC4FC();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Detected MNNavigationService ended navigation with a currently active NavigationSession; clearing session stack",
            buf,
            2u);
        }

        uint64_t v28 = [(NavigationStateMonitoringTask *)self platformController];
        [v28 clearSessions];
      }
      else
      {
        [(NavigationStateMonitoringTask *)self callNavigationCompletionBlocksIfNecessary];
      }
    }
    goto LABEL_23;
  }
  id v8 = [(NavigationStateMonitoringTask *)self platformController];
  BOOL v9 = [v8 currentSession];
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();

  if (v10) {
    goto LABEL_17;
  }
  id v7 = [v6 route];
  v11 = sub_1004AC4FC();
  id v12 = v11;
  if (v7)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Detected MNNavigationService started navigation without a currently active NavigationSession; pushing new NavigationSession",
        buf,
        2u);
    }

    id v13 = +[NSMutableArray arrayWithObject:v7];
    double v14 = [v6 alternateRoutes];

    if (v14)
    {
      id v15 = [v6 alternateRoutes];
      id v16 = [v13 arrayByAddingObjectsFromArray:v15];
    }
    id v17 = [[RouteCollection alloc] initWithRoutes:v13 currentRouteIndex:0];
    id v18 = [(NavigationStateMonitoringTask *)self observedRoutePlanningSession];
    uint64_t v19 = [v18 configuration];
    id v20 = [v19 traits];
    id v21 = v20;
    v30 = v13;
    if (v20)
    {
      id v22 = v20;
    }
    else
    {
      [(NavigationStateMonitoringTask *)self chromeViewController];
      objc_super v23 = v29 = v7;
      id v22 = [v23 currentTraits];

      id v7 = v29;
    }

    +[StartNavigationDetailsBuilder defaultNavigationDetailsOptions];
    [(NavigationStateMonitoringTask *)self beginNavigationWithRouteCollection:v17 navigationDetailsOptions:v31 mapServiceTraits:v22 sessionInitiator:3 isResumingMultipointRoute:0];

    goto LABEL_16;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Navigation started without an active nav session but the service didn't have a route.  Telling navd to exit navigation state", buf, 2u);
  }

  [v6 stopNavigationWithReason:1];
LABEL_23:
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  id v10 = a5;
  if (([v10 transportType] & 0xFFFFFFFE) == 2 && !self->_navigationModernMapToken)
  {
    id v7 = [(NavigationStateMonitoringTask *)self iosBasedChromeViewController];
    id v8 = [v7 acquireModernMapTokenForReason:0];
    id navigationModernMapToken = self->_navigationModernMapToken;
    self->_id navigationModernMapToken = v8;

    goto LABEL_7;
  }
  if (([v10 transportType] & 0xFFFFFFFE) != 2)
  {
    id v7 = self->_navigationModernMapToken;
    if (v7)
    {
      self->_id navigationModernMapToken = 0;
LABEL_7:
    }
  }
  [(NavigationStateMonitoringTask *)self updateHikingMapConfiguration];
}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v6 = [(NavigationStateMonitoringTask *)self chromeViewController];
  id v7 = [v6 traitCollection];
  unsigned int v8 = [v7 isLuminanceReduced];

  if (v8)
  {
    [(NavigationStateMonitoringTask *)self _checkAnimationsForAndromeda:0];
  }
}

- (void)didUpdateMitigationNamed:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1004AFF9C;
  v5[3] = &unk_1012E5D58;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)setPlatformController:(id)a3
{
}

- (void)setNavigationService:(id)a3
{
}

- (RoutePlanningSession)observedRoutePlanningSession
{
  return self->_observedRoutePlanningSession;
}

- (NavigationSession)observedNavigationSession
{
  return self->_observedNavigationSession;
}

- (GCDTimer)navigationAutoLaunchTimer
{
  return self->_navigationAutoLaunchTimer;
}

- (void)setNavigationAutoLaunchTimer:(id)a3
{
}

- (NSHashTable)navigationCompletionBlocks
{
  return self->_navigationCompletionBlocks;
}

- (void)setNavigationCompletionBlocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_navigationAutoLaunchTimer, 0);
  objc_storeStrong((id *)&self->_observedNavigationSession, 0);
  objc_storeStrong((id *)&self->_observedRoutePlanningSession, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_navigationService, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong(&self->_droppedPinBlock, 0);
  objc_storeStrong(&self->_andromedaAnimationSuppressionToken, 0);
  objc_storeStrong(&self->_thermalPressureAnimationSuppressionToken, 0);
  objc_storeStrong(&self->_thermalPressureChromeDeactivationToken, 0);
  objc_storeStrong(&self->_thermalPressureMapToken, 0);
  objc_storeStrong(&self->_navigationHikingMapToken, 0);
  objc_storeStrong(&self->_routePlanningHikingMapToken, 0);
  objc_storeStrong(&self->_navigationModernMapToken, 0);

  objc_storeStrong(&self->_routePlanningModernMapToken, 0);
}

@end