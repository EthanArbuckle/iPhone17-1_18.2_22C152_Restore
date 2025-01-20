@interface CarDisplayController
+ (BOOL)_isCarIntegrationSupported;
+ (BOOL)debugLaunchPerformance;
+ (BOOL)isCarPlayAvailable;
+ (CarDisplayController)sharedInstance;
+ (double)debugLaunchPerformanceDelay;
+ (int64_t)enablingState;
+ (unint64_t)maximumListLength;
+ (void)_updateCarIntegrationState;
+ (void)launchPerformanceSetup;
- (BOOL)_shouldSendEvent:(id)a3 toCarDisplayWindow:(id)a4;
- (BOOL)_validateTransitionFromState:(unint64_t)a3 toState:(unint64_t)a4;
- (BOOL)activelyOnScreen:(id *)a3;
- (BOOL)hasMapsSuggestionsController;
- (BOOL)isAnyCarSceneHostingDrivingNavigation;
- (BOOL)isAnyCarSceneHostingNavigation;
- (BOOL)isCarAppSceneHostingNavigation;
- (BOOL)isChromeAvailable;
- (BOOL)isCurrentlyConnectedToAnyCarScene;
- (BOOL)isCurrentlyConnectedToCarAppScene;
- (BOOL)overrideShouldSuppressChrome;
- (BOOL)supportsFocusInteractionModel;
- (BOOL)supportsInteractionModels:(unint64_t)a3;
- (BOOL)supportsTouchInteractionModel;
- (BOOL)wasConnectedToAnyCarScene;
- (CARSessionStatus)carSessionStatus;
- (CGSize)screenSize;
- (CarChromeViewController)chromeViewController;
- (CarClusterSuggestionController)clusterSuggestionController;
- (CarDisplayController)init;
- (CarDisplayDelegate)delegate;
- (CarDisplayWindow)window;
- (CarMapsSuggestionsController)mapsSuggestionsController;
- (CarRouteGeniusManager)routeGeniusManager;
- (GEOCarInfo)connectedCarMainScreenInfo;
- (GuidanceObserver)guidanceObserver;
- (NSDate)backgroundAutoHideStateTrackingDate;
- (NSMapTable)connectedCarScreenInfos;
- (PlatformController)platformController;
- (SearchSession)searchSession;
- (UIScreen)screen;
- (UITraitCollection)screenTraitCollection;
- (UIWindowScene)windowScene;
- (double)_activationDelay;
- (id)availableCarPlayScreen;
- (id)carInfoForScreen:(id)a3;
- (id)contextsForCurrentAppState;
- (id)presentInterruptionOfKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5;
- (id)processSearchFieldItem:(id)a3 searchInfo:(id)a4 userInfo:(id)a5;
- (int64_t)connectionType;
- (int64_t)interactionModel;
- (int64_t)touchscreenFidelity;
- (unint64_t)primaryInteractionModel;
- (unint64_t)state;
- (unint64_t)supportedInteractionModels;
- (void)_carDisplayDidFinishLaunching:(id)a3;
- (void)_carSessionControllerObserversDidChange:(id)a3;
- (void)_carSessionController_updateNavigationHostingState;
- (void)_clearExistingTimeoutAssertionIfNeededAfterDelay:(double)a3;
- (void)_destroyChrome;
- (void)_didBecomeActive;
- (void)_didEnterBackground;
- (void)_externalDeviceUpdated;
- (void)_externalNavigationOwnershipUpdated:(id)a3;
- (void)_geoServiceDidUpdateCountryConfiguration:(id)a3;
- (void)_idleTimeoutFired:(id)a3;
- (void)_mapsCar_rebuildContextsForCurrentAppState;
- (void)_mapsCar_scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)_popIfTopModeIsInvalidAfterReconnection:(BOOL)a3;
- (void)_prepareChromeForFirstUse;
- (void)_prepareNearby;
- (void)_presentQueuedInterruptionIfNeeded;
- (void)_reactivateChromeAfterDelay:(double)a3;
- (void)_registerCarInfoForGEOLogging;
- (void)_removeQueuedInterruptionWithKey:(id)a3;
- (void)_removeQueuedInterruptionWithKey:(id)a3 animated:(BOOL)a4;
- (void)_repeatGuidanceForExternalDevice;
- (void)_screenDidConnect:(id)a3;
- (void)_screenDidDisconnect:(id)a3;
- (void)_searchSessionWillStart:(id)a3;
- (void)_sendMapsSuggestionsSignals;
- (void)_setChromeSuppressed:(BOOL)a3;
- (void)_setNeedsScreenUpdate;
- (void)_setOverrideShouldSuppressChrome:(BOOL)a3 refreshScreenConnection:(BOOL)a4;
- (void)_setupCarPlayIfNeeded;
- (void)_setupClusterSuggestionControllerIfNeeded;
- (void)_startObservingSharedAppState;
- (void)_startTimingIdleTimeout;
- (void)_stopObservingSharedAppState;
- (void)_stopTimingIdleTimout;
- (void)_tearDownCarPlayIfNeeded;
- (void)_tearDownClusterSuggestionController;
- (void)_tearDownMapsSuggestionsController;
- (void)_updateForCurrentScreen;
- (void)_updateIOHIDMonitoringAndNotification;
- (void)_updateLowFuelSuggestionState;
- (void)_willEnterForeground;
- (void)_willResignActive;
- (void)dealloc;
- (void)detourToMapItem:(id)a3;
- (void)detourToWaypoint:(id)a3;
- (void)detourToWaypoint:(id)a3 replacingWaypoint:(id)a4;
- (void)didFinishLaunchingSuspendedWithOptions:(id)a3;
- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4;
- (void)observerDeliveryPolicyDidChange:(id)a3;
- (void)offlineMapsStateChanged;
- (void)prepareCarPlay;
- (void)processItem:(id)a3 userInfo:(id)a4;
- (void)refreshedEVChargersReceieved:(id)a3;
- (void)runNewScreenRefreshTasksIfNeeded;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)searchSessionDidChangeSearchFieldItem:(id)a3;
- (void)searchSessionDidChangeSearchResults:(id)a3;
- (void)searchSessionDidFail:(id)a3;
- (void)searchSessionDidInvalidate:(id)a3 reason:(unint64_t)a4;
- (void)searchSessionWillPerformSearch:(id)a3;
- (void)session:(id)a3 didUpdateConfiguration:(id)a4;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setBackgroundAutoHideStateTrackingDate:(id)a3;
- (void)setCarSessionStatus:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setClusterSuggestionController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGuidanceObserver:(id)a3;
- (void)setMapsSuggestionsController:(id)a3;
- (void)setOverrideShouldSuppressChrome:(BOOL)a3;
- (void)setPlatformController:(id)a3;
- (void)setRouteGeniusManager:(id)a3;
- (void)setScreen:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setWasConnectedToAnyCarScene:(BOOL)a3;
- (void)setWindow:(id)a3;
- (void)setWindowScene:(id)a3;
- (void)updateForCurrentEnablingState;
- (void)updateMapsSuggestionsSignalForMapType:(int)a3;
@end

@implementation CarDisplayController

- (GuidanceObserver)guidanceObserver
{
  guidanceObserver = self->_guidanceObserver;
  if (!guidanceObserver)
  {
    v4 = objc_alloc_init(GuidanceObserver);
    v5 = self->_guidanceObserver;
    self->_guidanceObserver = v4;

    guidanceObserver = self->_guidanceObserver;
  }

  return guidanceObserver;
}

- (void)_setOverrideShouldSuppressChrome:(BOOL)a3 refreshScreenConnection:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = sub_100015DB4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = @"NO";
    if (v5) {
      v8 = @"YES";
    }
    v9 = v8;
    int v10 = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v10, 0xCu);
  }
  byte_1016110D9 = v5;
  if (v4) {
    [(CarDisplayController *)self _setNeedsScreenUpdate];
  }
}

- (BOOL)isAnyCarSceneHostingDrivingNavigation
{
  BOOL v3 = [(CarDisplayController *)self isAnyCarSceneHostingNavigation];
  if (v3)
  {
    BOOL v4 = [(CarDisplayController *)self platformController];
    BOOL v5 = [v4 currentSession];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    id v7 = v6;

    id v8 = [v7 currentTransportType];
    LOBYTE(v3) = v8 == (id)1;
  }
  return v3;
}

- (BOOL)isAnyCarSceneHostingNavigation
{
  BOOL v3 = [(CarDisplayController *)self isCurrentlyConnectedToAnyCarScene];
  if (v3)
  {
    uint64_t v4 = [(CarDisplayController *)self platformController];
    BOOL v5 = [(id)v4 currentSession];

    objc_opt_class();
    LOBYTE(v4) = objc_opt_isKindOfClass();

    LOBYTE(v3) = v4 & (v5 != 0);
  }
  return v3;
}

- (void)setState:(unint64_t)a3
{
  unint64_t state = self->_state;
  if (state != a3
    && [(CarDisplayController *)self _validateTransitionFromState:state toState:a3])
  {
    self->_unint64_t state = a3;
    if (a3)
    {
      if (a3 == 2)
      {
        v12 = sub_100015DB4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "CarPlay is running", v15, 2u);
        }

        v13 = +[MapsExternalDevice sharedInstance];
        [v13 checkForActiveCarPlayConnection];

        [(CarDisplayController *)self _prepareChromeForFirstUse];
        [(CarDisplayController *)self _activationDelay];
        -[CarDisplayController _reactivateChromeAfterDelay:](self, "_reactivateChromeAfterDelay:");
        [(CarDisplayController *)self _setNeedsScreenUpdate];
      }
      else if (a3 == 1)
      {
        v6 = sub_100015DB4();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Will prepare CarPlay", buf, 2u);
        }

        id v7 = [(CarDisplayController *)self guidanceObserver];
      }
    }
    else
    {
      id v8 = sub_100015DB4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Will tear down the CarPlay stack", v14, 2u);
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_screenUpdateOperation);
      [WeakRetained cancel];

      [(CarDisplayController *)self _destroyChrome];
      dateOfLastScreenUpdate = self->_dateOfLastScreenUpdate;
      self->_dateOfLastScreenUpdate = 0;

      v11 = [(CarDisplayController *)self window];
      [v11 setRootViewController:0];

      [(CarDisplayController *)self setWindow:0];
      [(CarDisplayController *)self setScreen:0];
    }
  }
}

- (void)updateForCurrentEnablingState
{
  id v3 = [(id)objc_opt_class() enablingState];
  uint64_t v4 = sub_100015DB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134217984;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Updating for current enabling state (state:%ld)", (uint8_t *)&v6, 0xCu);
  }

  if ((unint64_t)v3 >= 2)
  {
    if (v3 == (id)2)
    {
      [(CarDisplayController *)self _setOverrideShouldSuppressChrome:0 refreshScreenConnection:0];
      [(CarDisplayController *)self _tearDownCarPlayIfNeeded];
      goto LABEL_8;
    }
    if (v3 != (id)3) {
      return;
    }
  }
  [(CarDisplayController *)self _setOverrideShouldSuppressChrome:v3 == (id)1 refreshScreenConnection:[(CarDisplayController *)self state] != 0];
  [(CarDisplayController *)self _setupCarPlayIfNeeded];
LABEL_8:
  BOOL v5 = [(CarDisplayController *)self delegate];
  [v5 carDisplayControllerDidUpdateNavigationVisibility:self];
}

- (void)_setupClusterSuggestionControllerIfNeeded
{
  id v3 = [(CarDisplayController *)self carSessionStatus];
  uint64_t v4 = [v3 currentSession];
  unsigned __int8 v5 = [v4 supportsInstrumentCluster];

  if (v5)
  {
    if (self->_clusterSuggestionController) {
      return;
    }
    int v6 = sub_100015DB4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Car supports instrument cluster. Creating a suggestion controller.", v9, 2u);
    }

    id v7 = objc_alloc_init(CarClusterSuggestionController);
    p_super = &self->_clusterSuggestionController->super;
    self->_clusterSuggestionController = v7;
  }
  else
  {
    p_super = sub_100015DB4();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_INFO, "Car doesn't support instrument cluster. We're not creating a suggestion controller.", buf, 2u);
    }
  }
}

+ (int64_t)enablingState
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 valueForKey:@"StarkDisplayEnablingState"];

  if (v3)
  {
    int64_t v4 = (int64_t)[v3 integerValue];
    unsigned __int8 v5 = sub_100015DB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 134217984;
      int64_t v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Overriding enablingState from defaults (state:%ld)", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (+[CarDisplayController isCarPlayAvailable])
  {
    int64_t v4 = 0;
  }
  else
  {
    int64_t v4 = 2;
  }

  return v4;
}

+ (BOOL)isCarPlayAvailable
{
  if (qword_1016110F8 != -1) {
    dispatch_once(&qword_1016110F8, &stru_101322CB0);
  }
  if (!byte_1016110E0) {
    return 0;
  }

  return _[a1 _isCarIntegrationSupported];
}

+ (BOOL)_isCarIntegrationSupported
{
  uint64_t v2 = qword_1015F7A58;
  if (qword_1015F7A58 == -1)
  {
    [a1 _updateCarIntegrationState];
    uint64_t v2 = qword_1015F7A58;
  }
  return v2 == 1;
}

- (CarDisplayController)init
{
  v14.receiver = self;
  v14.super_class = (Class)CarDisplayController;
  uint64_t v2 = [(CarDisplayController *)&v14 init];
  id v3 = v2;
  if (v2)
  {
    v2->_hasRunNewScreenRefreshTasks = 0;
    int64_t v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"_carDisplayDidFinishLaunching:" name:@"CarDisplayDidFinishLaunchingNotification" object:0];
    [v4 addObserver:v3 selector:"_carDisplayDidUpdateEnablingState:" name:@"CarDisplayDidUpdateEnablingStateNotification" object:0];
    [v4 addObserver:v3 selector:"_externalDeviceUpdated" name:@"MapsExternalDeviceUpdated" object:0];
    [v4 addObserver:v3 selector:"_geoServiceDidUpdateCountryConfiguration:" name:GEOCountryConfigurationProvidersDidChangeNotification object:0];
    [v4 addObserver:v3 selector:"_externalNavigationOwnershipUpdated:" name:@"MapsExternalNavigationOwnershipUpdatedNotification" object:0];
    unsigned __int8 v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v3 selector:"offlineMapsStateChanged" name:@"UsingOfflineMapsStateChangedNotification" object:0];

    int v6 = off_1015EC260;
    int v7 = +[CarSessionController sharedInstance];
    [v4 addObserver:v3 selector:"_carSessionControllerObserversDidChange:" name:v6 object:v7];

    int64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("MSgSignalPackDonaterQueue", v8);
    signalPackQueue = v3->_signalPackQueue;
    v3->_signalPackQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = objc_opt_new();
    carSessionStatus = v3->_carSessionStatus;
    v3->_carSessionStatus = (CARSessionStatus *)v11;

    [(CARSessionStatus *)v3->_carSessionStatus addSessionObserver:v3];
    v3->_lastMapTypeFromiOSChrome = 0;
  }
  return v3;
}

+ (CarDisplayController)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001091DC;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_1016110F0 != -1) {
    dispatch_once(&qword_1016110F0, block);
  }
  uint64_t v2 = (void *)qword_1016110E8;

  return (CarDisplayController *)v2;
}

- (BOOL)isCurrentlyConnectedToAnyCarScene
{
  id v3 = +[CarSessionController sharedInstance];
  int64_t v4 = [v3 sessionObservers];
  id v5 = [v4 count];

  return (v5 != (id)1 || (id)[(CarDisplayController *)self state] != (id)1) && v5 != 0;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setDelegate:(id)a3
{
}

- (void)prepareCarPlay
{
  if (![(CarDisplayController *)self state]) {
    [(CarDisplayController *)self updateForCurrentEnablingState];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000167D4;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)hasMapsSuggestionsController
{
  return self->_mapsSuggestionsController != 0;
}

- (void)didFinishLaunchingSuspendedWithOptions:(id)a3
{
  if ([(CarDisplayController *)self hasMapsSuggestionsController])
  {
    int64_t v4 = +[MapsExternalDevice sharedInstance];
    unsigned int v5 = [v4 needsFuel];

    int v6 = sub_100015DB4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = @"NO";
      if (v5) {
        int v7 = @"YES";
      }
      int64_t v8 = v7;
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "launched suspended, needsFuel=%@", (uint8_t *)&v10, 0xCu);
    }
    if (v5)
    {
      dispatch_queue_t v9 = [(CarDisplayController *)self mapsSuggestionsController];
      [v9 setHoldProcessAssertion:1];
    }
  }
}

- (CarDisplayDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarDisplayDelegate *)WeakRetained;
}

- (CARSessionStatus)carSessionStatus
{
  return self->_carSessionStatus;
}

- (BOOL)_validateTransitionFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  if (a3 == a4 || a3 == 1 && (a4 & 0xFFFFFFFFFFFFFFFDLL) == 0 || a3 == 2 && a4 < 2) {
    return 1;
  }
  return !a3 && a4 == 1;
}

- (void)_setupCarPlayIfNeeded
{
  if ([(id)objc_opt_class() enablingState] == (id)2)
  {
    id v3 = sub_100015DB4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      __int16 v7 = 0;
      int64_t v4 = "Will not prepare CarPlay, disallowed.";
      unsigned int v5 = (uint8_t *)&v7;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, v4, v5, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ([(CarDisplayController *)self state])
  {
    id v3 = sub_100015DB4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      __int16 v6 = 0;
      int64_t v4 = "Will not prepare CarPlay, already running/ready.";
      unsigned int v5 = (uint8_t *)&v6;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  [(CarDisplayController *)self setState:1];

  [(CarDisplayController *)self _setupClusterSuggestionControllerIfNeeded];
}

+ (void)_updateCarIntegrationState
{
  id v2 = +[GEOCountryConfiguration sharedConfiguration];
  qword_1015F7A58 = [v2 currentCountrySupportsCarIntegration];
}

- (void)dealloc
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  int64_t v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      __int16 v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v12 = "-[CarDisplayController dealloc]";
        __int16 v13 = 2080;
        objc_super v14 = "CarDisplayController.m";
        __int16 v15 = 1024;
        int v16 = 269;
        __int16 v17 = 2080;
        v18 = "dispatch_get_main_queue()";
        __int16 v19 = 2080;
        v20 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v21 = 2080;
        v22 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        int64_t v8 = sub_1005762E4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          dispatch_queue_t v9 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v12 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  [(CarDisplayController *)self _tearDownCarPlayIfNeeded];
  __int16 v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self];

  v10.receiver = self;
  v10.super_class = (Class)CarDisplayController;
  [(CarDisplayController *)&v10 dealloc];
}

- (void)_geoServiceDidUpdateCountryConfiguration:(id)a3
{
  id v3 = objc_opt_class();

  [v3 _updateCarIntegrationState];
}

- (void)_externalNavigationOwnershipUpdated:(id)a3
{
  id v3 = +[MNNavigationService sharedService];
  unsigned int v4 = [v3 isInNavigatingState];

  BOOL v5 = +[MapsExternalDevice sharedInstance];
  unsigned int v6 = [v5 externalAccessoryIsNavigating];

  __int16 v7 = sub_100015DB4();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6) {
    BOOL v9 = v4 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v8)
    {
      if (v6) {
        objc_super v10 = @"YES";
      }
      else {
        objc_super v10 = @"NO";
      }
      uint64_t v11 = v10;
      if (v4) {
        v12 = @"YES";
      }
      else {
        v12 = @"NO";
      }
      __int16 v13 = v12;
      int v14 = 138543618;
      __int16 v15 = v11;
      __int16 v16 = 2114;
      __int16 v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Maps external navigation ownership changed but either the external device is not navigating (%{public}@) or we aren't navigating (%{public}@); ignoring",
        (uint8_t *)&v14,
        0x16u);
    }
  }
  else
  {
    if (v8)
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Will stop iOS navigation because the built-in car system has started its own navigation", (uint8_t *)&v14, 2u);
    }

    __int16 v7 = +[MNNavigationService sharedService];
    [v7 stopNavigationWithReason:2];
  }
}

- (void)_carSessionControllerObserversDidChange:(id)a3
{
  BOOL v4 = [(CarDisplayController *)self isCurrentlyConnectedToAnyCarScene];

  [(CarDisplayController *)self setWasConnectedToAnyCarScene:v4];
}

- (void)offlineMapsStateChanged
{
  id v3 = sub_100015DB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "UsingOfflineMapsStateChangedNotification fired, will reloadStatusBannerAnimated", v5, 2u);
  }

  BOOL v4 = [(CarDisplayController *)self chromeViewController];
  [v4 reloadStatusBannerAnimated:1];
}

- (void)_sendMapsSuggestionsSignals
{
  if (!self->_donater)
  {
    BOOL v4 = (MapsSuggestionsDonater *)objc_alloc_init((Class)MapsSuggestionsDonater);
    donater = self->_donater;
    self->_donater = v4;
  }
  if (!self->_signalPack)
  {
    unsigned int v6 = (MapsSuggestionsMutableSignalPack *)objc_alloc_init((Class)MapsSuggestionsMutableSignalPack);
    signalPack = self->_signalPack;
    self->_signalPack = v6;
  }
  if (self->_shouldOverrideMapTypeToStandard) {
    uint64_t lastMapTypeFromiOSChrome = 1;
  }
  else {
    uint64_t lastMapTypeFromiOSChrome = self->_lastMapTypeFromiOSChrome;
  }
  *(float *)&double v2 = (float)(int)lastMapTypeFromiOSChrome;
  [(MapsSuggestionsMutableSignalPack *)self->_signalPack writeSignalValue:21 forType:v2];
  BOOL v9 = self->_donater;
  id v10 = [(MapsSuggestionsMutableSignalPack *)self->_signalPack copy];
  [(MapsSuggestionsDonater *)v9 donateSignalPack:v10];

  GEOFindOrCreateLog();
  uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    BOOL shouldOverrideMapTypeToStandard = self->_shouldOverrideMapTypeToStandard;
    if (lastMapTypeFromiOSChrome >= 5)
    {
      __int16 v13 = +[NSString stringWithFormat:@"(unknown: %i)", lastMapTypeFromiOSChrome];
    }
    else
    {
      __int16 v13 = *(&off_101322E40 + (int)lastMapTypeFromiOSChrome);
    }
    *(_DWORD *)buf = 67109378;
    BOOL v15 = shouldOverrideMapTypeToStandard;
    __int16 v16 = 2112;
    __int16 v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "_shouldOverrideMapTypeToStandard: %d, sending: %@", buf, 0x12u);
  }
}

- (void)updateMapsSuggestionsSignalForMapType:(int)a3
{
  objc_initWeak(&location, self);
  signalPackQueue = self->_signalPackQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D45064;
  block[3] = &unk_1012F02D8;
  objc_copyWeak(&v7, &location);
  int v8 = a3;
  dispatch_async(signalPackQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)sessionDidConnect:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D452B8;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v11, &location);
  id v10 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  signalPackQueue = self->_signalPackQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100D45458;
  v7[3] = &unk_1012E6708;
  objc_copyWeak(&v8, &location);
  dispatch_async(signalPackQueue, v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)sessionDidDisconnect:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D456A4;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v11, &location);
  id v10 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  signalPackQueue = self->_signalPackQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100D45844;
  v7[3] = &unk_1012E6708;
  objc_copyWeak(&v8, &location);
  dispatch_async(signalPackQueue, v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)session:(id)a3 didUpdateConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100015DB4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "carSession: %@, didUpdateConfiguration: %@", (uint8_t *)&v9, 0x16u);
  }

  [(CarDisplayController *)self _setupClusterSuggestionControllerIfNeeded];
}

- (BOOL)isChromeAvailable
{
  if ((id)[(CarDisplayController *)self state] != (id)2) {
    return 0;
  }
  id v3 = [(CarDisplayController *)self chromeViewController];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_tearDownCarPlayIfNeeded
{
  if ([(CarDisplayController *)self state])
  {
    [(CarDisplayController *)self setState:0];
    [(CarDisplayController *)self _tearDownClusterSuggestionController];
    [(CarDisplayController *)self _tearDownMapsSuggestionsController];
  }
  else
  {
    id v3 = sub_100015DB4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Will not tear down CarPlay, already stopped.", v4, 2u);
    }
  }
}

- (double)_activationDelay
{
  double v2 = 0.0;
  if (+[CarDisplayController debugLaunchPerformance])
  {
    +[CarDisplayController debugLaunchPerformanceDelay];
    double v2 = v3;
    BOOL v4 = sub_100015DB4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 134217984;
      double v7 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Overriding activationDelay for debugging (delay:%#.1lfs)", (uint8_t *)&v6, 0xCu);
    }
  }
  return v2;
}

- (void)_prepareChromeForFirstUse
{
  double v3 = [(CarDisplayController *)self chromeViewController];

  if (!v3)
  {
    BOOL v4 = +[CarDisplayController sharedInstance];
    id v5 = [v4 platformController];
    int v6 = [v5 currentSession];

    double v7 = sub_100015DB4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Instantiating and suppressing CarChromeViewController.", buf, 2u);
    }

    id v8 = [(CarDisplayController *)self windowScene];
    int v9 = [v8 delegate];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    if (!v11)
    {
      v36 = sub_1005762E4();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v46 = "-[CarDisplayController _prepareChromeForFirstUse]";
        __int16 v47 = 2080;
        v48 = "CarDisplayController.m";
        __int16 v49 = 1024;
        int v50 = 592;
        __int16 v51 = 2080;
        v52 = "carSceneDelegate != nil";
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100BB36BC())
      {
        v37 = sub_1005762E4();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v38 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v46 = v38;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
    id v12 = [CarChromeViewController alloc];
    id v13 = [v11 sceneType];

    int v14 = [(CarChromeViewController *)v12 initWithCarSceneType:v13];
    [(CarDisplayController *)self setChromeViewController:v14];

    BOOL v15 = [(CarDisplayController *)self chromeViewController];
    v39 = _NSConcreteStackBlock;
    uint64_t v40 = 3221225472;
    v41 = sub_100D461C4;
    v42 = &unk_1012F6BE0;
    id v16 = v6;
    id v43 = v16;
    [v15 setFallbackContextCoordinationBlock:&v39];

    __int16 v17 = [(CarDisplayController *)self chromeViewController];
    v18 = [v17 acquireChromeDeactivationTokenForReason:@"CarPlay preparing new chrome for first use"];
    id chromeDeactivationToken = self->_chromeDeactivationToken;
    self->_id chromeDeactivationToken = v18;

    v20 = [(CarDisplayController *)self chromeViewController];
    [v20 setSuppressed:1];

    __int16 v21 = +[NSUserDefaults standardUserDefaults];
    if ([v21 BOOLForKey:@"__internal_CarCardTestDebug"])
    {
      v22 = +[GEOPlatform sharedPlatform];
      unsigned int v23 = [v22 isInternalInstall];

      if (v23)
      {
        v24 = objc_alloc_init(CarCardTestModeController);
        v25 = sub_100015DB4();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Will set CarCardTestModeController as root mode for new CarChromeViewController.", buf, 2u);
        }

        v26 = [(CarDisplayController *)self chromeViewController];
        v44 = v24;
        v27 = +[NSArray arrayWithObjects:&v44 count:1];
        [v26 setContexts:v27 animated:0 completion:0];

        goto LABEL_17;
      }
    }
    else
    {
    }
    v28 = sub_100015DB4();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Will set contextsForCurrentAppState as the new mode stack.", buf, 2u);
    }

    v24 = [(CarDisplayController *)self chromeViewController];
    v26 = [(CarDisplayController *)self contextsForCurrentAppState];
    [(CarCardTestModeController *)v24 setContexts:v26 animated:0 completion:0];
LABEL_17:

    v29 = +[CarChromeModeCoordinator sharedInstance];
    v30 = [(CarDisplayController *)self chromeViewController];
    [v29 addChromeViewController:v30];

    v31 = +[SearchSession currentSearchSession];
    v32 = [(CarDisplayController *)self platformController];
    v33 = [v32 currentSession];
    if (v33 || !v31)
    {
    }
    else
    {
      id v34 = [v31 origin];

      if (v34 == (id)1)
      {
LABEL_25:
        [(CarDisplayController *)self _startObservingSharedAppState];

        return;
      }
      v35 = sub_100015DB4();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Will display current search session.", buf, 2u);
      }

      objc_storeStrong((id *)&self->_searchSession, v31);
      [(SearchSession *)self->_searchSession addObserver:self];
      v32 = +[CarChromeModeCoordinator sharedInstance];
      [v32 displaySearchSession:v31];
    }

    goto LABEL_25;
  }
}

- (id)contextsForCurrentAppState
{
  double v3 = objc_alloc_init(CarMapBrowsingModeController);
  BOOL v4 = +[NSMutableArray arrayWithObject:v3];
  id v5 = +[CarDisplayController sharedInstance];
  int v6 = [v5 platformController];
  double v7 = [v6 currentSession];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [CarRouteGeniusModeController alloc];
    int v9 = +[CarRouteGeniusService sharedService];
    id v10 = [v9 suggestion];
    id v11 = [(CarRouteGeniusModeController *)v8 initWithSuggestion:v10];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [[CarRoutePlanningModeController alloc] initWithExistingRouteLoading];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_14;
      }
      id v13 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v14 = v13;
      }
      else {
        int v14 = 0;
      }
      id v15 = v14;

      unsigned int v16 = [v15 isCarNavigationCompatible];
      __int16 v17 = off_1012D26B8;
      if (!v16) {
        __int16 v17 = off_1012D26A0;
      }
      id v12 = (CarRoutePlanningModeController *)objc_alloc_init(*v17);
    }
    id v11 = (CarRouteGeniusModeController *)v12;
  }
  [v4 addObject:v11];

LABEL_14:
  v18 = sub_100015DB4();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = v4;
    v20 = v19;
    if (v19)
    {
      if ([v19 count])
      {
        __int16 v21 = [v20 componentsJoinedByString:@", "];
        v22 = +[NSString stringWithFormat:@"<%p> [%@]", v20, v21];
      }
      else
      {
        v22 = +[NSString stringWithFormat:@"<%p> (empty)", v20];
      }
    }
    else
    {
      v22 = @"<nil>";
    }

    unsigned int v23 = [(CarDisplayController *)self chromeViewController];
    *(_DWORD *)buf = 138412546;
    v27 = v22;
    __int16 v28 = 2048;
    v29 = v23;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Recreating current app state with modes: %@ for chrome: %p", buf, 0x16u);
  }
  id v24 = [v4 copy];

  return v24;
}

- (void)_destroyChrome
{
  double v3 = sub_100015DB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Will tear down and destroy the chrome.", v7, 2u);
  }

  [(CarDisplayController *)self _stopObservingSharedAppState];
  BOOL v4 = [(CarDisplayController *)self chromeViewController];
  [v4 setContexts:&__NSArray0__struct];

  id v5 = [(CarDisplayController *)self chromeViewController];
  [v5 setSuppressed:1];

  id chromeDeactivationToken = self->_chromeDeactivationToken;
  self->_id chromeDeactivationToken = 0;

  [(CarDisplayController *)self setChromeViewController:0];
}

- (void)_setChromeSuppressed:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CarDisplayController *)self chromeViewController];

  if (v5)
  {
    int v6 = [(CarDisplayController *)self chromeViewController];
    double v7 = v6;
    if (v3)
    {
      [v6 setSuppressed:1];

      self->_isPreparingNavigation = 0;
    }
    else
    {
      unsigned int v11 = [v6 isSuppressed];

      id v12 = [(CarDisplayController *)self chromeViewController];
      id v15 = v12;
      if (v11)
      {
        [v12 loadViewIfNeeded];

        id v13 = [(CarDisplayController *)self chromeViewController];
        [v13 setSuppressed:0];

        int v14 = sub_100015DB4();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Will attempt to run new screen refresh tasks and present queued interruption because we unsuppressed a suppressed chrome", buf, 2u);
        }

        [(CarDisplayController *)self runNewScreenRefreshTasksIfNeeded];
        [(CarDisplayController *)self _presentQueuedInterruptionIfNeeded];
      }
      else
      {
        [v12 setSuppressed:0];
      }
    }
  }
  else
  {
    id v8 = sub_100015DB4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = @"NO";
      if (v3) {
        int v9 = @"YES";
      }
      id v10 = v9;
      *(_DWORD *)buf = 138543362;
      __int16 v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "We don't have a chromeVC yet; ignoring suppression(%{public}@)",
        buf,
        0xCu);
    }
  }
}

- (void)_reactivateChromeAfterDelay:(double)a3
{
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100D46A88;
  v7[3] = &unk_1012F0708;
  objc_copyWeak(v8, &location);
  v8[1] = *(id *)&a3;
  BOOL v4 = objc_retainBlock(v7);
  id v5 = sub_100015DB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Will reactivate chrome after %#.2lfs delay", buf, 0xCu);
  }

  if (a3 == -1.0)
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  }
  else if (a3 == 0.0)
  {
    ((void (*)(void *))v4[2])(v4);
  }
  else
  {
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v4);
  }

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (void)_tearDownMapsSuggestionsController
{
}

- (void)_tearDownClusterSuggestionController
{
  BOOL v3 = sub_100015DB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Tearing down clusterSuggestionController", v5, 2u);
  }

  clusterSuggestionController = self->_clusterSuggestionController;
  self->_clusterSuggestionController = 0;
}

- (void)_carDisplayDidFinishLaunching:(id)a3
{
  if ((id)[(CarDisplayController *)self state] == (id)1)
  {
    [(CarDisplayController *)self setState:2];
  }
}

- (void)_willResignActive
{
  BOOL v3 = [(CarDisplayController *)self windowScene];

  if (v3)
  {
    BOOL v4 = sub_100015DB4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Notified main CarPlay scene will resign active", buf, 2u);
    }

    if ((id)[(CarDisplayController *)self state] != (id)2)
    {
      id v5 = sub_100015DB4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)dispatch_time_t v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Chrome is not running, do nothing", v6, 2u);
      }
    }
  }
}

- (void)_didEnterBackground
{
  BOOL v3 = [(CarDisplayController *)self windowScene];

  if (v3)
  {
    BOOL v4 = sub_100015DB4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Notified main CarPlay scene did enter background", (uint8_t *)&v11, 2u);
    }

    if ((id)[(CarDisplayController *)self state] == (id)2)
    {
      id v5 = [(CarDisplayController *)self chromeViewController];
      unsigned int v6 = [v5 isAutohidingContentHiddenForCurrentContext];

      if (v6)
      {
        double v7 = +[NSDate date];
        [(CarDisplayController *)self setBackgroundAutoHideStateTrackingDate:v7];

        id v8 = sub_100015DB4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          int v9 = [(CarDisplayController *)self backgroundAutoHideStateTrackingDate];
          int v11 = 138412290;
          id v12 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Recorded background autohide state tracking date as %@", (uint8_t *)&v11, 0xCu);
        }
      }
      [(CarDisplayController *)self _registerCarInfoForGEOLogging];
      +[GEOAPPortal captureUserAction:2197 target:0 value:0];
      [(CarDisplayController *)self _updateForCurrentScreen];
    }
    else
    {
      id v10 = sub_100015DB4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Chrome is not running, do nothing", (uint8_t *)&v11, 2u);
      }
    }
  }
}

- (void)_willEnterForeground
{
  BOOL v3 = [(CarDisplayController *)self windowScene];

  if (v3)
  {
    BOOL v4 = sub_100015DB4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Notified main CarPlay scene will enter foreground", v11, 2u);
    }

    [(CarDisplayController *)self _registerCarInfoForGEOLogging];
    +[GEOAPPortal captureUserAction:2196 target:0 value:0];
    if ((id)[(CarDisplayController *)self state] == (id)2)
    {
      uint64_t v5 = [(CarDisplayController *)self backgroundAutoHideStateTrackingDate];
      if (!v5
        || (unsigned int v6 = (void *)v5,
            [(CarDisplayController *)self backgroundAutoHideStateTrackingDate],
            double v7 = objc_claimAutoreleasedReturnValue(),
            [v7 timeIntervalSinceNow],
            double v9 = fabs(v8),
            v7,
            v6,
            v9 > 480.0))
      {
        id v10 = [(CarDisplayController *)self chromeViewController];
        [v10 interruptAutohideForIncidentalInteraction];
      }
      [(CarDisplayController *)self setBackgroundAutoHideStateTrackingDate:0];
    }
    [(CarDisplayController *)self _updateForCurrentScreen];
  }
}

- (void)_didBecomeActive
{
  BOOL v3 = [(CarDisplayController *)self windowScene];

  if (v3)
  {
    BOOL v4 = sub_100015DB4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Notified main CarPlay scene did become active", buf, 2u);
    }

    if ((id)[(CarDisplayController *)self state] != (id)2)
    {
      uint64_t v5 = sub_100015DB4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)unsigned int v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Chrome is not running, do nothing", v6, 2u);
      }
    }
  }
}

- (void)_externalDeviceUpdated
{
  BOOL v3 = sub_100015DB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[CarDisplayController] - External device is updated.", v6, 2u);
  }

  BOOL v4 = +[MapsExternalDevice sharedInstance];
  unsigned int v5 = [v4 ownsScreen];

  if (v5) {
    [(CarDisplayController *)self _setNeedsScreenUpdate];
  }
  else {
    [(CarDisplayController *)self _updateForCurrentScreen];
  }
  [(CarDisplayController *)self _updateLowFuelSuggestionState];
}

- (void)_updateLowFuelSuggestionState
{
  BOOL v3 = sub_100015DB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    BOOL v4 = +[MapsExternalDevice sharedInstance];
    int v10 = 134218240;
    uint64_t v11 = [v4 hasEngineType];
    __int16 v12 = 2048;
    unint64_t v13 = [(CarDisplayController *)self state];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[CarDisplayController] - Update low fuel suggestion state with Engine type availability: %ld, And state is: %ld", (uint8_t *)&v10, 0x16u);
  }
  unsigned int v5 = +[MapsExternalDevice sharedInstance];
  id v6 = [v5 hasEngineType];
  double v7 = [(CarDisplayController *)self mapsSuggestionsController];
  [v7 setMonitorLowFuel:v6];

  double v8 = +[MapsExternalDevice sharedInstance];
  LOBYTE(v6) = [v8 needsFuel];

  if ((v6 & 1) == 0)
  {
    double v9 = [(CarDisplayController *)self mapsSuggestionsController];
    [v9 setAllowLowFuelAlert:1];
  }
}

- (void)runNewScreenRefreshTasksIfNeeded
{
  if (self->_hasRunNewScreenRefreshTasks) {
    goto LABEL_2;
  }
  id v6 = [(CarDisplayController *)self chromeViewController];
  unsigned __int8 v7 = [v6 isSuppressed];

  if (v7)
  {
    if (self->_hasRunNewScreenRefreshTasks)
    {
LABEL_2:
      double v2 = sub_100015DB4();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
LABEL_5:

        return;
      }
      *(_WORD *)buf = 0;
      BOOL v3 = "Not running new screen refresh tasks because we've already run them";
      BOOL v4 = buf;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, v3, v4, 2u);
      goto LABEL_5;
    }
    double v8 = [(CarDisplayController *)self chromeViewController];
    unsigned int v9 = [v8 isSuppressed];

    if (v9)
    {
      double v2 = sub_100015DB4();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_INFO)) {
        goto LABEL_5;
      }
      __int16 v13 = 0;
      BOOL v3 = "Not running new screen refresh tasks because the chrome VC is suppressed";
      BOOL v4 = (uint8_t *)&v13;
      goto LABEL_4;
    }
  }
  else
  {
    int v10 = sub_100015DB4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Running new screen refresh tasks", v15, 2u);
    }

    [(CarDisplayController *)self _prepareNearby];
    id v11 = +[MSPSharedTripService sharedInstance];
    [(CarDisplayController *)self _registerCarInfoForGEOLogging];
    __int16 v12 = [(CarDisplayController *)self mapsSuggestionsController];
    [v12 setAllowLowFuelAlert:1];

    self->_hasRunNewScreenRefreshTasks = 1;
  }
}

- (void)_startTimingIdleTimeout
{
  [(NSTimer *)self->_idleTimeoutTimer invalidate];
  idleTimeoutTimer = self->_idleTimeoutTimer;
  self->_idleTimeoutTimer = 0;

  [(CarDisplayController *)self _clearExistingTimeoutAssertionIfNeededAfterDelay:1.0];
  GEOConfigGetDouble();
  if (v4 == 0.0)
  {
    unsigned int v5 = sub_100015DB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CarDisplayController will not track disconnected and idle timeout, will fire immediately", (uint8_t *)&v19, 2u);
    }

    [(CarDisplayController *)self _idleTimeoutFired:0];
  }
  else
  {
    double v6 = v4;
    if (v4 == -1.0)
    {
      unsigned __int8 v7 = sub_100015DB4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CarDisplayController will not track disconnected and idle timeout, will keep chrome alive", (uint8_t *)&v19, 2u);
      }
    }
    else
    {
      if (GEOConfigGetBOOL())
      {
        [(CarDisplayController *)self _clearExistingTimeoutAssertionIfNeededAfterDelay:1.0];
        double v8 = sub_100015DB4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v19) = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CarDisplayController will take assertion for idle timeout timer", (uint8_t *)&v19, 2u);
        }

        unsigned int v9 = (BKSProcessAssertion *)[objc_alloc((Class)BKSProcessAssertion) initWithBundleIdentifier:@"com.apple.Maps" flags:1 reason:7 name:@"recent CarPlay disconnection"];
        idleTimeoutAssertion = self->_idleTimeoutAssertion;
        self->_idleTimeoutAssertion = v9;

        unsigned int v11 = [(BKSProcessAssertion *)self->_idleTimeoutAssertion acquire];
        __int16 v12 = sub_100015DB4();
        __int16 v13 = v12;
        if (v11)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            int v14 = self->_idleTimeoutAssertion;
            int v19 = 134217984;
            double v20 = *(double *)&v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Acquired idle timeout assertion %p", (uint8_t *)&v19, 0xCu);
          }
        }
        else
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            id v15 = self->_idleTimeoutAssertion;
            int v19 = 134217984;
            double v20 = *(double *)&v15;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to acquire idle timeout assertion %p, clearing ivar", (uint8_t *)&v19, 0xCu);
          }

          __int16 v13 = self->_idleTimeoutAssertion;
          self->_idleTimeoutAssertion = 0;
        }
      }
      unsigned int v16 = sub_100015DB4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 134217984;
        double v20 = v6;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CarDisplayController started tracking idle timeout: %lfs", (uint8_t *)&v19, 0xCu);
      }

      __int16 v17 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_idleTimeoutFired:" selector:0 userInfo:0 repeats:v6];
      v18 = self->_idleTimeoutTimer;
      self->_idleTimeoutTimer = v17;
    }
  }
}

- (void)_stopTimingIdleTimout
{
  idleTimeoutTimer = self->_idleTimeoutTimer;
  double v4 = sub_100015DB4();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (idleTimeoutTimer)
  {
    if (v5)
    {
      *(_WORD *)unsigned __int8 v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CarDisplayController stopped tracking idle timeout", v7, 2u);
    }

    [(NSTimer *)self->_idleTimeoutTimer invalidate];
    double v6 = self->_idleTimeoutTimer;
    self->_idleTimeoutTimer = 0;

    [(CarDisplayController *)self _clearExistingTimeoutAssertionIfNeededAfterDelay:1.0];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CarDisplayController asked to stop tracking idle timeout, but no timer", buf, 2u);
    }
  }
}

- (void)_idleTimeoutFired:(id)a3
{
  double v4 = sub_100015DB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CarDisplayController notified idle timeout fired", (uint8_t *)&v10, 2u);
  }

  [(NSTimer *)self->_idleTimeoutTimer invalidate];
  idleTimeoutTimer = self->_idleTimeoutTimer;
  self->_idleTimeoutTimer = 0;

  double v6 = [(CarDisplayController *)self screen];

  if (v6)
  {
    unsigned __int8 v7 = sub_100015DB4();
    double v8 = 1.0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "CarDisplayController tried to destroy chrome with active screen, aborting.", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    [(CarDisplayController *)self _destroyChrome];
    unsigned int v9 = sub_100015DB4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      CFStringRef v11 = @"CarDisplayIsDisconnectedAndIdle";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Post notification (%@)", (uint8_t *)&v10, 0xCu);
    }

    unsigned __int8 v7 = +[NSNotificationCenter defaultCenter];
    [v7 postNotificationName:@"CarDisplayIsDisconnectedAndIdle" object:self];
    double v8 = 3.0;
  }

  [(CarDisplayController *)self _clearExistingTimeoutAssertionIfNeededAfterDelay:v8];
}

- (void)_clearExistingTimeoutAssertionIfNeededAfterDelay:(double)a3
{
  BOOL v5 = self->_idleTimeoutAssertion;
  double v6 = sub_100015DB4();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 134218240;
      __int16 v13 = v5;
      __int16 v14 = 2048;
      double v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Will invalidate idle timeout assertion %p after %#.1lfs", buf, 0x16u);
    }

    idleTimeoutAssertion = self->_idleTimeoutAssertion;
    self->_idleTimeoutAssertion = 0;

    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100D47B98;
    block[3] = &unk_1012E5D08;
    CFStringRef v11 = v5;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
    double v6 = v11;
  }
  else if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No timeout assertion to invalidate", buf, 2u);
  }
}

- (void)_popIfTopModeIsInvalidAfterReconnection:(BOOL)a3
{
  id v3 = +[CarChromeModeCoordinator sharedInstance];
  [v3 cleanupForDisconnect];
}

- (UITraitCollection)screenTraitCollection
{
  id v3 = [(CarDisplayController *)self screen];

  if (v3) {
    [(CarDisplayController *)self screen];
  }
  else {
  double v4 = +[UIScreen _carScreen];
  }
  BOOL v5 = [v4 traitCollection];

  return (UITraitCollection *)v5;
}

- (GEOCarInfo)connectedCarMainScreenInfo
{
  id v3 = [(CarDisplayController *)self carSessionStatus];
  double v4 = [v3 currentSession];
  BOOL v5 = [v4 configuration];
  double v6 = [v5 _maps_primaryScreen];
  BOOL v7 = [(CarDisplayController *)self carInfoForScreen:v6];

  return (GEOCarInfo *)v7;
}

- (NSMapTable)connectedCarScreenInfos
{
  id v3 = +[NSMapTable strongToStrongObjectsMapTable];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v4 = [(CarDisplayController *)self carSessionStatus];
  BOOL v5 = [v4 currentSession];
  double v6 = [v5 configuration];
  BOOL v7 = [v6 screens];

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        __int16 v13 = [(CarDisplayController *)self carInfoForScreen:v12];
        [v3 setObject:v13 forKey:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return (NSMapTable *)v3;
}

- (id)carInfoForScreen:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CarDisplayController *)self carSessionStatus];
  double v6 = [v5 currentSession];
  BOOL v7 = [v6 configuration];

  unsigned int v8 = [(CarDisplayController *)self isCurrentlyConnectedToAnyCarScene];
  id v9 = 0;
  if (v8 && v7)
  {
    id v9 = objc_opt_new();
    id v10 = [v7 transportType];
    if (v10 == (id)1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 2 * (v10 == (id)3);
    }
    [v9 setDeviceConnection:v11];
    if (([v4 availableInteractionModels] & 2) != 0)
    {
      if ([v4 supportsHighFidelityTouch]) {
        uint64_t v12 = 3;
      }
      else {
        uint64_t v12 = 4;
      }
      [v9 addInputMethod:v12];
    }
    if (([v4 availableInteractionModels] & 4) != 0) {
      [v9 addInputMethod:1];
    }
    if (([v4 availableInteractionModels] & 8) != 0) {
      [v9 addInputMethod:2];
    }
    if ([v4 availableInteractionModels]) {
      [v9 addInputMethod:0];
    }
    memset(v29, 0, sizeof(v29));
    [v4 pixelSize];
    uint64_t v14 = v13;
    [v4 pixelSize];
    v27[0] = v14;
    v27[1] = v15;
    char v28 = 3;
    [v9 setScreenResolution:v27];
    long long v16 = objc_opt_new();
    [v4 physicalSize];
    [v16 setWidth:];
    [v4 physicalSize];
    [v16 setHeight:v17];
    [v9 setScreenDimension:v16];
    long long v18 = +[MapsExternalDevice sharedInstance];
    [v9 setDestinationSharingEnabled:[v18 destinationHandoffEnabled]];

    int v19 = +[MapsExternalDevice sharedInstance];
    unsigned int v20 = [v19 supportsNavigationAidedDriving];

    if (v20)
    {
      __int16 v21 = +[MapsExternalDevice sharedInstance];
      unsigned int v22 = [v21 isNavigationAidedDrivingEnabled];

      if (v22) {
        uint64_t v23 = 3;
      }
      else {
        uint64_t v23 = 2;
      }
    }
    else
    {
      uint64_t v23 = 1;
    }
    [v9 setNavAidedDrivingStatus:v23];
    id v24 = +[MapsExternalDevice sharedInstance];
    unsigned int v25 = [v24 engineTypes];

    if (v25)
    {
      [v9 addEngineType:1];
      if ((v25 & 0x10000) == 0)
      {
LABEL_24:
        if ((v25 & 0x1000000) == 0) {
          goto LABEL_25;
        }
        goto LABEL_33;
      }
    }
    else if ((v25 & 0x10000) == 0)
    {
      goto LABEL_24;
    }
    [v9 addEngineType:3];
    if ((v25 & 0x1000000) == 0)
    {
LABEL_25:
      if ((v25 & 0x100) == 0)
      {
LABEL_27:

        goto LABEL_28;
      }
LABEL_26:
      [v9 addEngineType:2];
      goto LABEL_27;
    }
LABEL_33:
    [v9 addEngineType:4];
    if ((v25 & 0x100) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_28:

  return v9;
}

- (id)availableCarPlayScreen
{
  double v2 = +[UIScreen _carScreen];
  id v3 = sub_100015DB4();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Did find connected CarPlay screen", buf, 2u);
    }

    id v5 = v2;
  }
  else
  {
    if (v4)
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Did not find any connected CarPlay screens", v7, 2u);
    }
  }

  return v2;
}

- (void)_screenDidConnect:(id)a3
{
  id v4 = a3;
  id v5 = [(CarDisplayController *)self screen];

  if (v5 != v4)
  {
    double v6 = sub_100015DB4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notified of incoming CarPlay screen", v7, 2u);
    }

    [(CarDisplayController *)self setScreen:v4];
  }
}

- (void)_screenDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = [(CarDisplayController *)self screen];

  if (v5 == v4)
  {
    double v6 = sub_100015DB4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notified its CarPlay screen was disconnected", v7, 2u);
    }

    [(CarDisplayController *)self setScreen:0];
  }
}

- (void)setScreen:(id)a3
{
  id v4 = (UIScreen *)a3;
  if ([(CarDisplayController *)self overrideShouldSuppressChrome])
  {
    id v5 = sub_100015DB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Overriding screen to nil", (uint8_t *)&v19, 2u);
    }

    id v4 = 0;
  }
  screen = self->_screen;
  if (screen != v4)
  {
    int v7 = (v4 != 0) ^ (screen != 0);
    objc_storeStrong((id *)&self->_screen, v4);
    unsigned int v8 = sub_100015DB4();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v9)
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Will attach to a new screen", (uint8_t *)&v19, 2u);
      }

      [(CarDisplayController *)self _stopTimingIdleTimout];
      if (!self->_HIDEventObserver)
      {
        id v10 = objc_alloc_init((Class)BKSHIDEventDeliveryPolicyObserver);
        [v10 addObserver:self];
        HIDEventObserver = self->_HIDEventObserver;
        self->_HIDEventObserver = (BKSHIDEventDeliveryPolicyObserver *)v10;
      }
      uint64_t v12 = [(UIScreen *)v4 displayConfiguration];
      uint64_t v13 = [v12 hardwareIdentifier];

      uint64_t v14 = +[BKSHIDEventDisplay displayWithHardwareIdentifier:v13];
      [(BKSHIDEventDeliveryPolicyObserver *)self->_HIDEventObserver setDisplay:v14];
    }
    else
    {
      if (v9)
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Will detach from its screen", (uint8_t *)&v19, 2u);
      }

      self->_hasRunNewScreenRefreshTasks = 0;
      uint64_t v15 = self->_HIDEventObserver;
      if (v15)
      {
        [(BKSHIDEventDeliveryPolicyObserver *)v15 removeObserver:self];
        long long v16 = self->_HIDEventObserver;
        self->_HIDEventObserver = 0;
      }
      [(CarDisplayController *)self _startTimingIdleTimeout];
      [(CarDisplayController *)self _registerCarInfoForGEOLogging];
      [(CarDisplayController *)self _popIfTopModeIsInvalidAfterReconnection:0];
    }
    [(CarDisplayController *)self _setNeedsScreenUpdate];
    if (v7)
    {
      double v17 = sub_100015DB4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412290;
        CFStringRef v20 = @"CarDisplayDidChangeConnectedNotification";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Post notification (%@)", (uint8_t *)&v19, 0xCu);
      }

      long long v18 = +[NSNotificationCenter defaultCenter];
      [v18 postNotificationName:@"CarDisplayDidChangeConnectedNotification" object:self];
    }
  }
}

- (BOOL)activelyOnScreen:(id *)a3
{
  if (GEOConfigGetBOOL())
  {
    LOBYTE(BOOL) = 1;
    if (a3)
    {
      double v6 = @"deactivation has been overridden, will report we're actively on-screen";
LABEL_14:
      *a3 = v6;
    }
  }
  else if (self->_screen)
  {
    if ([(id)objc_opt_class() enablingState] == (id)3)
    {
      LOBYTE(BOOL) = 0;
      if (a3)
      {
        double v6 = @"simulated no screen ownership";
        goto LABEL_14;
      }
    }
    else
    {
      int v7 = +[MapsExternalDevice sharedInstance];
      unsigned int v8 = [v7 ownsScreen];

      if (v8)
      {
        int BOOL = GEOConfigGetBOOL();
        double v6 = @"device owns screen";
        if (BOOL) {
          double v6 = @"device owns screen, but override default allows it";
        }
        if (a3) {
          goto LABEL_14;
        }
      }
      else
      {
        unsigned int v9 = [(CarDisplayController *)self isCarAppSceneHostingNavigation];
        double v6 = @"hosting navigation";
        if (!v9) {
          double v6 = 0;
        }
        LOBYTE(BOOL) = 1;
        if (a3) {
          goto LABEL_14;
        }
      }
    }
  }
  else
  {
    LOBYTE(BOOL) = 0;
    if (a3)
    {
      double v6 = @"no screen";
      goto LABEL_14;
    }
  }
  return BOOL;
}

- (CarMapsSuggestionsController)mapsSuggestionsController
{
  double v2 = self;
  objc_sync_enter(v2);
  mapsSuggestionsController = v2->_mapsSuggestionsController;
  if (!mapsSuggestionsController)
  {
    id v4 = sub_100015DB4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v9 = 134217984;
      unint64_t v10 = [(CarDisplayController *)v2 state];
    }

    uint64_t v5 = objc_opt_new();
    double v6 = v2->_mapsSuggestionsController;
    v2->_mapsSuggestionsController = (CarMapsSuggestionsController *)v5;

    mapsSuggestionsController = v2->_mapsSuggestionsController;
  }
  int v7 = mapsSuggestionsController;
  objc_sync_exit(v2);

  return v7;
}

- (void)setMapsSuggestionsController:(id)a3
{
  uint64_t v5 = (CarMapsSuggestionsController *)a3;
  double v6 = self;
  objc_sync_enter(v6);
  p_mapsSuggestionsController = (void **)&v6->_mapsSuggestionsController;
  mapsSuggestionsController = v6->_mapsSuggestionsController;
  if (mapsSuggestionsController != v5)
  {
    if (mapsSuggestionsController)
    {
      [(CarMapsSuggestionsController *)mapsSuggestionsController setSinkAttached:0];
      int v9 = *p_mapsSuggestionsController;
      *p_mapsSuggestionsController = 0;
    }
    unint64_t v10 = sub_100015DB4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *p_mapsSuggestionsController;
      int v12 = 138412546;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      uint64_t v15 = v5;
    }

    objc_storeStrong((id *)&v6->_mapsSuggestionsController, a3);
    [(CarDisplayController *)v6 _updateLowFuelSuggestionState];
  }
  objc_sync_exit(v6);
}

- (void)_setNeedsScreenUpdate
{
  if ([(id)objc_opt_class() enablingState] == (id)2)
  {
    id v3 = sub_100015DB4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [(id)objc_opt_class() enablingState]);
      *(_DWORD *)buf = 138412290;
      long long v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Will not schedule screen update (enablingState:%@)", buf, 0xCu);
    }
  }
  else
  {
    p_screenUpdateOperation = &self->_screenUpdateOperation;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_screenUpdateOperation);

    if (!WeakRetained)
    {
      int v7 = sub_100015DB4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Will schedule a screen update", buf, 2u);
      }

      objc_initWeak((id *)buf, self);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100D48CD8;
      v13[3] = &unk_1012E6708;
      objc_copyWeak(&v14, (id *)buf);
      unsigned int v8 = objc_retainBlock(v13);
      if (self->_updatingScreen || self->_dateOfLastScreenUpdate && self->_screen)
      {
        int v9 = +[NSBlockOperation blockOperationWithBlock:v8];
        objc_storeWeak((id *)p_screenUpdateOperation, v9);
        unint64_t v10 = +[NSOperationQueue mainQueue];
        [v10 addOperation:v9];
      }
      else
      {
        uint64_t v11 = sub_100015DB4();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int v12 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Will perform first screen update immediately", v12, 2u);
        }

        ((void (*)(void *))v8[2])(v8);
      }

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_updateForCurrentScreen
{
  if (!self->_updatingScreen)
  {
    if (+[NSThread isMainThread])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_screenUpdateOperation);
      [WeakRetained cancel];

      objc_storeWeak((id *)&self->_screenUpdateOperation, 0);
      self->_updatingScreen = 1;
      id v4 = [(CarDisplayController *)self screen];
      if ([(CarDisplayController *)self state] && v4)
      {
        if (!self->_window)
        {
          uint64_t v5 = [CarDisplayWindow alloc];
          double v6 = [(CarDisplayController *)self windowScene];
          int v7 = [(CarDisplayWindow *)v5 initWithWindowScene:v6];
          window = self->_window;
          self->_window = v7;

          [(CarDisplayWindow *)self->_window setAccessibilityIdentifier:@"Maps.CarPlayApplication"];
        }
      }
      else if (!v4)
      {
        goto LABEL_10;
      }
      if (self->_window)
      {
        int v9 = [(CarDisplayController *)self windowScene];
        unint64_t v10 = [v9 coordinateSpace];
        [v10 bounds];
        -[CarDisplayWindow setFrame:](self->_window, "setFrame:");
      }
LABEL_10:
      unint64_t v11 = [(CarDisplayController *)self state];
      if (v11 != 2)
      {
        if (v11 != 1)
        {
          [(CarDisplayWindow *)self->_window setHidden:1];
          [(CarDisplayWindow *)self->_window setRootViewController:0];
          v26 = self->_window;
          self->_window = 0;

          self->_updatingScreen = 0;
LABEL_53:

          return;
        }
        int v12 = sub_100015DB4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Will show launch screen, in prepare state", buf, 2u);
        }

        uint64_t v13 = [(CarDisplayWindow *)self->_window rootViewController];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          uint64_t v15 = objc_alloc_init(CarLaunchLoadingViewController);
          [(CarDisplayWindow *)self->_window setRootViewController:v15];
        }
        [(CarDisplayWindow *)self->_window setHidden:0];
LABEL_45:
        id v34 = [(CarDisplayController *)self carSessionStatus];
        v35 = [v34 currentSession];
        v36 = [v35 configuration];

        v37 = [v36 _maps_primaryScreen];
        [v37 pixelSize];
        self->_screenSize.width = v38;
        self->_screenSize.height = v39;
        uint64_t v40 = +[MNNavigationService sharedService];
        unsigned int v41 = [v40 isInNavigatingState];

        if (v41)
        {
          BOOL v42 = [(CarDisplayController *)self isCurrentlyConnectedToCarAppScene];
          id v43 = +[MNNavigationService sharedService];
          [v43 setIsConnectedToCarplay:v42];

          v44 = +[NavigationFeedbackCollector sharedFeedbackCollector];
          [v44 setIsConnectedToCarplay:v42];

          [(CarDisplayController *)self _carSessionController_updateNavigationHostingState];
        }
        if (self->_window)
        {
          v45 = +[NSDate date];
          p_dateOfLastScreenUpdate = &self->_dateOfLastScreenUpdate;
          dateOfLastScreenUpdate = self->_dateOfLastScreenUpdate;
          self->_dateOfLastScreenUpdate = v45;
        }
        else
        {
          p_dateOfLastScreenUpdate = &self->_dateOfLastScreenUpdate;
          dateOfLastScreenUpdate = self->_dateOfLastScreenUpdate;
          self->_dateOfLastScreenUpdate = 0;
        }

        v48 = sub_100015DB4();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v49 = *p_dateOfLastScreenUpdate;
          *(_DWORD *)buf = 138412290;
          v56 = (const char *)v49;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Recorded date of last screen update: %@", buf, 0xCu);
        }

        self->_updatingScreen = 0;
        goto LABEL_53;
      }
      if (!v4)
      {
        [(CarDisplayController *)self _setChromeSuppressed:1];
        if (self->_window)
        {
          v27 = sub_100015DB4();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Will suppress CarChromeViewController and tear down the window", buf, 2u);
          }

          [(CarDisplayWindow *)self->_window setHidden:1];
          [(CarDisplayWindow *)self->_window setRootViewController:0];
          char v28 = self->_window;
          self->_window = 0;
        }
        [(CarDisplayController *)self setState:1];
        goto LABEL_45;
      }
      long long v16 = [(CarDisplayWindow *)self->_window rootViewController];
      double v17 = [(CarDisplayController *)self chromeViewController];

      if (v16 != v17)
      {
        long long v18 = sub_100015DB4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Will attach CarChromeViewController to window and unsuppress it", buf, 2u);
        }

        int v19 = [(CarDisplayController *)self chromeViewController];
        [(CarDisplayWindow *)self->_window setRootViewController:v19];

        [(CarDisplayWindow *)self->_window setHidden:0];
      }
      [(CarDisplayController *)self _setChromeSuppressed:0];
      id v54 = 0;
      unsigned int v20 = [(CarDisplayController *)self activelyOnScreen:&v54];
      __int16 v21 = (__CFString *)v54;
      unsigned int v22 = sub_100015DB4();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      if (v20)
      {
        if (v23)
        {
          CFStringRef v24 = &stru_101324E70;
          if (v21) {
            CFStringRef v24 = v21;
          }
          *(_DWORD *)buf = 138412290;
          v56 = (const char *)v24;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "CarChromeViewController should be active, we are on-screen (%@)", buf, 0xCu);
        }

        id chromeDeactivationToken = self->_chromeDeactivationToken;
        self->_id chromeDeactivationToken = 0;
      }
      else
      {
        if (v23)
        {
          CFStringRef v29 = &stru_101324E70;
          if (v21) {
            CFStringRef v29 = v21;
          }
          *(_DWORD *)buf = 138412290;
          v56 = (const char *)v29;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "CarChromeViewController should be inactive, we are not on-screen (%@)", buf, 0xCu);
        }

        if (self->_chromeDeactivationToken) {
          goto LABEL_44;
        }
        v30 = [(CarDisplayController *)self chromeViewController];
        id chromeDeactivationToken = v30;
        if (v21) {
          CFStringRef v31 = v21;
        }
        else {
          CFStringRef v31 = @"(not actively on screen)");
        }
        v32 = [v30 acquireChromeDeactivationTokenForReason:v31];
        id v33 = self->_chromeDeactivationToken;
        self->_id chromeDeactivationToken = v32;
      }
LABEL_44:

      goto LABEL_45;
    }
    int v50 = sub_1005762E4();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      __int16 v51 = +[NSString stringWithFormat:@"updateForCurrentScreen called off main thread, will attempt to reroute"];
      *(_DWORD *)buf = 136316162;
      v56 = "-[CarDisplayController _updateForCurrentScreen]";
      __int16 v57 = 2080;
      v58 = "CarDisplayController.m";
      __int16 v59 = 1024;
      int v60 = 1276;
      __int16 v61 = 2080;
      v62 = "isMainThread";
      __int16 v63 = 2112;
      v64 = v51;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
    }
    if (sub_100BB36BC())
    {
      v52 = sub_1005762E4();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v56 = v53;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    [(CarDisplayController *)self _setNeedsScreenUpdate];
  }
}

- (BOOL)isCurrentlyConnectedToCarAppScene
{
  double v2 = [(CarDisplayController *)self screen];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setWasConnectedToAnyCarScene:(BOOL)a3
{
  if (self->_wasConnectedToAnyCarScene != a3)
  {
    self->_wasConnectedToAnyCarScene = a3;
    id v4 = [(CarDisplayController *)self delegate];
    [v4 carDisplayControllerDidUpdateNavigationVisibility:self];
  }
}

- (void)_carSessionController_updateNavigationHostingState
{
  BOOL v3 = [(CarDisplayController *)self isAnyCarSceneHostingNavigation];
  id v4 = +[MapsExternalDevice sharedInstance];
  if (v3 != [v4 carPlayIsNavigating])
  {
    [v4 setCarPlayIsNavigating:v3];
    uint64_t v5 = sub_100015DB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notify delegate: didUpdateNavigationVisibility", v7, 2u);
    }

    double v6 = [(CarDisplayController *)self delegate];
    [v6 carDisplayControllerDidUpdateNavigationVisibility:self];
  }
  [(CarDisplayController *)self _updateIOHIDMonitoringAndNotification];
}

- (void)_mapsCar_scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6 = a3;
  [(CarDisplayController *)self setWindowScene:v6];
  [(CarDisplayController *)self prepareCarPlay];
  [(CarDisplayController *)self _prepareChromeForFirstUse];
  id v7 = [v6 screen];

  [(CarDisplayController *)self _screenDidConnect:v7];
}

- (void)_mapsCar_rebuildContextsForCurrentAppState
{
  BOOL v3 = [(CarDisplayController *)self chromeViewController];
  id v4 = [(CarDisplayController *)self contextsForCurrentAppState];
  [v3 setContexts:v4 animated:0 completion:0];

  id v5 = [(CarDisplayController *)self chromeViewController];
  [v5 setNeedsUpdateComponent:@"accessories" animated:0];
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  id v5 = [(CarDisplayController *)self windowScene];

  if (v5 != v4)
  {
    id v6 = sub_100015DB4();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_13:

      goto LABEL_14;
    }
    id v7 = v4;
    if (!v7)
    {
      int v12 = @"<nil>";
      goto LABEL_12;
    }
    unsigned int v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      unint64_t v10 = [v7 performSelector:"accessibilityIdentifier"];
      unint64_t v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        int v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_9;
      }
    }
    int v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138543362;
    id v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] will enter foreground", buf, 0xCu);

    goto LABEL_13;
  }
  [(CarDisplayController *)self _willEnterForeground];
LABEL_14:
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  id v5 = [(CarDisplayController *)self windowScene];

  if (v5 != v4)
  {
    id v6 = sub_100015DB4();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_13:

      goto LABEL_14;
    }
    id v7 = v4;
    if (!v7)
    {
      int v12 = @"<nil>";
      goto LABEL_12;
    }
    unsigned int v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      unint64_t v10 = [v7 performSelector:"accessibilityIdentifier"];
      unint64_t v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        int v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_9;
      }
    }
    int v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138543362;
    id v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] did become active", buf, 0xCu);

    goto LABEL_13;
  }
  [(CarDisplayController *)self _didBecomeActive];
LABEL_14:
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  id v5 = [(CarDisplayController *)self windowScene];

  if (v5 != v4)
  {
    id v6 = sub_100015DB4();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_13:

      goto LABEL_14;
    }
    id v7 = v4;
    if (!v7)
    {
      int v12 = @"<nil>";
      goto LABEL_12;
    }
    unsigned int v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      unint64_t v10 = [v7 performSelector:"accessibilityIdentifier"];
      unint64_t v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        int v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_9;
      }
    }
    int v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138543362;
    id v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] will resign active", buf, 0xCu);

    goto LABEL_13;
  }
  [(CarDisplayController *)self _willResignActive];
LABEL_14:
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  id v5 = [(CarDisplayController *)self windowScene];

  if (v5 != v4)
  {
    id v6 = sub_100015DB4();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_13:

      goto LABEL_14;
    }
    id v7 = v4;
    if (!v7)
    {
      int v12 = @"<nil>";
      goto LABEL_12;
    }
    unsigned int v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      unint64_t v10 = [v7 performSelector:"accessibilityIdentifier"];
      unint64_t v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        int v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_9;
      }
    }
    int v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138543362;
    id v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] did enter background", buf, 0xCu);

    goto LABEL_13;
  }
  [(CarDisplayController *)self _didEnterBackground];
LABEL_14:
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  [(CarDisplayController *)self setWindowScene:0];
  id v5 = [v4 screen];

  [(CarDisplayController *)self _screenDidDisconnect:v5];
}

- (BOOL)supportsInteractionModels:(unint64_t)a3
{
  return ([(CarDisplayController *)self supportedInteractionModels] & a3) != 0;
}

- (int64_t)interactionModel
{
  BOOL v3 = [(CarDisplayController *)self screen];
  unint64_t v4 = [(CarDisplayController *)self primaryInteractionModel];
  id v5 = [v3 _capabilityForKey:_UIScreenCapabilityTouchLevelsKey];
  id v6 = [v5 integerValue];

  if (v4 <= 1) {
    unint64_t v7 = 1;
  }
  else {
    unint64_t v7 = v4;
  }
  if (v4) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  if ((v7 & 1) == 0 || v8)
  {
    if ((v7 & 1) != 0 && v8 == (id)1)
    {
      int64_t v9 = 2;
    }
    else if ((v7 & 2) != 0)
    {
      int64_t v9 = 3;
    }
    else
    {
      int64_t v9 = (v7 >> 1) & 4;
    }
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

- (unint64_t)primaryInteractionModel
{
  double v2 = [(CarDisplayController *)self screen];
  BOOL v3 = [v2 traitCollection];
  id v4 = [v3 primaryInteractionModel];

  return (unint64_t)v4;
}

- (unint64_t)supportedInteractionModels
{
  double v2 = [(CarDisplayController *)self screen];
  BOOL v3 = [v2 traitCollection];
  id v4 = [v3 interactionModel];

  return (unint64_t)v4;
}

- (BOOL)supportsTouchInteractionModel
{
  return [(CarDisplayController *)self supportsInteractionModels:1];
}

- (BOOL)supportsFocusInteractionModel
{
  return [(CarDisplayController *)self supportsInteractionModels:10];
}

- (int64_t)touchscreenFidelity
{
  double v2 = [(CarDisplayController *)self screen];
  BOOL v3 = [v2 _capabilityForKey:_UIScreenCapabilityTouchLevelsKey];
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

+ (unint64_t)maximumListLength
{
  double v2 = +[MapsExternalDevice sharedInstance];
  unsigned int v3 = [v2 limitLongLists];

  if (v3) {
    return 12;
  }
  else {
    return -1;
  }
}

- (int64_t)connectionType
{
  double v2 = +[MapsExternalDevice sharedInstance];
  id v3 = [v2 connectionType];

  return (int64_t)v3;
}

- (BOOL)_shouldSendEvent:(id)a3 toCarDisplayWindow:(id)a4
{
  id v5 = a3;
  unsigned __int8 v6 = 1;
  switch((unint64_t)[v5 type])
  {
    case 0uLL:
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v7 = [v5 allTouches];
      id v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (!v8) {
        goto LABEL_28;
      }
      id v9 = v8;
      uint64_t v10 = *(void *)v27;
      while (1)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          if ([*(id *)(*((void *)&v26 + 1) + 8 * i) type] == (id)1) {
            goto LABEL_26;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
        unsigned __int8 v6 = 1;
        if (!v9) {
          goto LABEL_28;
        }
      }
    case 3uLL:
      id v12 = v5;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0;
      }
      id v7 = v13;

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v14 = [v7 allPresses];
      id v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (!v15) {
        goto LABEL_22;
      }
      id v16 = v15;
      uint64_t v17 = *(void *)v23;
      break;
    case 6uLL:
      goto LABEL_27;
    case 7uLL:
      if (((unint64_t)[v5 subtype] & 0xFFFFFFFFFFFFFFFELL) != 0xC8) {
        goto LABEL_29;
      }
      int v19 = [(CarDisplayController *)self chromeViewController];
      unsigned __int8 v6 = [v19 _shouldAllowKnobFocusMovement];

      goto LABEL_27;
    default:
      goto LABEL_29;
  }
  while (2)
  {
    for (j = 0; j != v16; j = (char *)j + 1)
    {
      if (*(void *)v23 != v17) {
        objc_enumerationMutation(v14);
      }
      if ([*(id *)(*((void *)&v22 + 1) + 8 * (void)j) type] == (id)4)
      {

LABEL_26:
        unsigned __int8 v6 = 1;
LABEL_27:
        id v7 = [(CarDisplayController *)self chromeViewController];
        [v7 interruptAutohideForIncidentalInteraction];
        goto LABEL_28;
      }
    }
    id v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v16) {
      continue;
    }
    break;
  }
LABEL_22:

  unsigned __int8 v6 = 1;
LABEL_28:

LABEL_29:
  unsigned int v20 = [(CarDisplayController *)self chromeViewController];
  [v20 restartAutohideIdleTimerIfStarted];

  return v6;
}

- (void)observerDeliveryPolicyDidChange:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100D4A410;
  v4[3] = &unk_1012E5D58;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)processItem:(id)a3 userInfo:(id)a4
{
  id v18 = a3;
  id v5 = a4;
  unsigned __int8 v6 = +[SearchFieldItem searchFieldItemWithObject:v18];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 completion];

    if (v8) {
      uint64_t v9 = 12;
    }
    else {
      uint64_t v9 = 6;
    }
    uint64_t v10 = +[NSNumber numberWithInt:v9];
    unint64_t v11 = +[NSMutableDictionary dictionaryWithObject:v10 forKey:@"Source"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 setObject:&__kCFBooleanFalse forKeyedSubscript:@"CreateHistoryEntry"];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v11 setObject:&__kCFBooleanFalse forKeyedSubscript:@"CreateHistoryEntry"];
        id v12 = v18;
        uint64_t v13 = +[Recents sharedRecents];
        [v13 recordCoreRecentContact:v12];
      }
    }
    id v14 = [v5 objectForKeyedSubscript:@"userTypedSearchString"];
    [v7 setUserTypedStringForRAP:v14];

    id v15 = +[CarDisplayController sharedInstance];
    id v16 = [v11 copy];
    id v17 = [v15 processSearchFieldItem:v7 searchInfo:0 userInfo:v16];
  }
}

- (id)processSearchFieldItem:(id)a3 searchInfo:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  searchSession = self->_searchSession;
  if (!searchSession
    || (id)[(SearchSession *)searchSession origin] != (id)1
    || ([v9 shouldPreserveResults] & 1) == 0)
  {
    [(SearchSession *)self->_searchSession removeObserver:self];
    [(SearchSession *)self->_searchSession invalidate];
    id v12 = self->_searchSession;
    self->_searchSession = 0;
  }
  if (v8)
  {
    if (!self->_searchSession)
    {
      uint64_t v13 = [SearchSession alloc];
      id v14 = [v10 objectForKeyedSubscript:@"LowFuel"];
      id v15 = [(SearchSession *)v13 initWithOrigin:1 options:v14 != 0];
      id v16 = self->_searchSession;
      self->_searchSession = v15;

      [(SearchSession *)self->_searchSession addObserver:self];
      id v17 = [(CarDisplayController *)self chromeViewController];
      id v18 = [v17 currentTraits];

      int v19 = +[MNNavigationService sharedService];
      unsigned int v20 = [v19 isInNavigatingState];

      if (v20) {
        uint64_t v21 = 2;
      }
      else {
        uint64_t v21 = 0;
      }
      [v18 setSearchOriginationType:v21];
      long long v22 = [v10 objectForKeyedSubscript:@"SAROtherEVStationRequest"];

      if (v22)
      {
        [v18 setSearchOriginationType:3];
        id v23 = objc_alloc_init((Class)GEOSearchImplicitFilterInfo);
        [v23 setSearchImplicitType:1];
        long long v24 = [v10 objectForKeyedSubscript:@"SARImplicitRequestMUID"];
        [v23 setSearchAlongRouteMuid:[v24 unsignedLongLongValue]];

        [v18 setSearchImplicitFilterInfo:v23];
      }
      [v18 useOnlineToOfflineFailoverRequestModeIfAllowed];
      [(SearchSession *)self->_searchSession setTraits:v18];
      long long v25 = [v10 objectForKeyedSubscript:@"Source"];
      if (v25)
      {
        long long v26 = [v10 objectForKeyedSubscript:@"Source"];
        uint64_t v27 = (uint64_t)[v26 integerValue];
      }
      else
      {
        uint64_t v27 = 6;
      }

      [(SearchSession *)self->_searchSession setSource:v27];
      long long v29 = [v10 objectForKeyedSubscript:@"CreateHistoryEntry"];
      if (v29)
      {
        v30 = [v10 objectForKeyedSubscript:@"CreateHistoryEntry"];
        uint64_t v31 = (uint64_t)[v30 BOOLValue];
      }
      else
      {
        uint64_t v31 = 1;
      }

      [(SearchSession *)self->_searchSession setShouldCreateHistoryEntry:v31];
      v32 = [v10 objectForKeyedSubscript:@"ShouldBroadcast"];

      if (v32)
      {
        id v33 = [v10 objectForKeyedSubscript:@"ShouldBroadcast"];
        -[SearchSession setShouldBroadcast:](self->_searchSession, "setShouldBroadcast:", [v33 BOOLValue]);
      }
    }
    if (MapsFeature_IsEnabled_DrivingMultiWaypointRoutes())
    {
      id v34 = +[MNNavigationService sharedService];
      id v35 = [v34 isInNavigatingState];
      v36 = [(SearchSession *)self->_searchSession traits];
      [v36 setNavigating:v35];
    }
    v37 = self->_searchSession;
    if (v9) {
      [(SearchSession *)v37 restoreSearchForItem:v8 withResults:v9];
    }
    else {
      [(SearchSession *)v37 startSearch:v8];
    }
    long long v28 = self->_searchSession;
  }
  else
  {
    long long v28 = 0;
  }

  return v28;
}

- (void)_searchSessionWillStart:(id)a3
{
  id v4 = [a3 object];
  id v5 = v4;
  if (v4 && self->_searchSession != v4 && (id)[(SearchSession *)v4 origin] != (id)1)
  {
    unsigned __int8 v6 = sub_100015DB4();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

      [(SearchSession *)v5 addObserver:self];
      objc_storeStrong((id *)&self->_searchSession, v5);
      goto LABEL_12;
    }
    id v7 = v5;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      id v10 = [(SearchSession *)v7 performSelector:"accessibilityIdentifier"];
      unint64_t v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        id v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_10;
      }
    }
    id v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_10:

    *(_DWORD *)buf = 138412290;
    id v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

    goto LABEL_11;
  }
LABEL_12:
}

- (void)searchSessionDidChangeSearchFieldItem:(id)a3
{
  id v4 = a3;
  id v5 = sub_100015DB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    if (!v6)
    {
      unint64_t v11 = @"<nil>";
      goto LABEL_10;
    }
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        unint64_t v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    unint64_t v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    id v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v14 = v11;
    __int16 v15 = 2112;
    id v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);
  }
}

- (void)searchSessionWillPerformSearch:(id)a3
{
  id v4 = a3;
  id v5 = sub_100015DB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    if (!v6)
    {
      unint64_t v11 = @"<nil>";
      goto LABEL_10;
    }
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        unint64_t v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    unint64_t v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    id v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v14 = v11;
    __int16 v15 = 2112;
    id v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);
  }
}

- (void)searchSessionDidChangeSearchResults:(id)a3
{
  id v4 = a3;
  id v5 = [v4 currentResultsSearchInfo];
  id v6 = sub_100015DB4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v4;
    if (!v7)
    {
      id v12 = @"<nil>";
      goto LABEL_10;
    }
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      id v10 = [v7 performSelector:"accessibilityIdentifier"];
      unint64_t v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        id v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_8;
      }
    }
    id v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_8:

LABEL_10:
    uint64_t v13 = NSStringFromSelector(a2);
    id v14 = [v5 results];
    *(_DWORD *)buf = 138412802;
    id v17 = v12;
    __int16 v18 = 2112;
    int v19 = v13;
    __int16 v20 = 2048;
    id v21 = [v14 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ %@ Did receive %lu search results", buf, 0x20u);
  }
  __int16 v15 = +[CarChromeModeCoordinator sharedInstance];
  [v15 displaySearchSession:v4];
}

- (void)refreshedEVChargersReceieved:(id)a3
{
  id v4 = a3;
  id v5 = sub_100015DB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Did receive the search results to update the ev charger information. Results: %@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = +[CarChromeModeCoordinator sharedInstance];
  id v7 = [(CarDisplayController *)self chromeViewController];
  id v8 = [v7 contexts];
  [v6 refreshSessionWithEVResults:v4 contexts:v8];
}

- (void)searchSessionDidFail:(id)a3
{
  id v4 = a3;
  id v5 = sub_100015DB4();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_11;
  }
  id v6 = v4;
  if (!v6)
  {
    unint64_t v11 = @"<nil>";
    goto LABEL_10;
  }
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  if (objc_opt_respondsToSelector())
  {
    int v9 = [v6 performSelector:"accessibilityIdentifier"];
    id v10 = v9;
    if (v9 && ![v9 isEqualToString:v8])
    {
      unint64_t v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

      goto LABEL_8;
    }
  }
  unint64_t v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
  id v12 = NSStringFromSelector(a2);
  uint64_t v13 = [v6 lastError];
  *(_DWORD *)buf = 138412802;
  long long v22 = v11;
  __int16 v23 = 2112;
  long long v24 = v12;
  __int16 v25 = 2112;
  long long v26 = v13;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: %@ error=(%@)", buf, 0x20u);

LABEL_11:
  id v14 = [v4 lastError];
  __int16 v15 = [v14 domain];
  id v16 = GEOErrorDomain();
  unsigned int v17 = [v15 isEqualToString:v16];

  if (v17)
  {
    __int16 v18 = +[CarChromeModeCoordinator sharedInstance];
    [v18 displaySearchSession:v4];
  }
  else
  {
    __int16 v18 = +[UIApplication sharedMapsDelegate];
    int v19 = [v4 lastError];
    __int16 v20 = sub_100D4B644(v19, 0);
    [v18 interruptApplicationWithKind:3 userInfo:v20 completionHandler:0];
  }
}

- (void)searchSessionDidInvalidate:(id)a3 reason:(unint64_t)a4
{
  id v5 = (SearchSession *)a3;
  id v6 = sub_100015DB4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    if (!v7)
    {
      id v12 = @"<nil>";
      goto LABEL_10;
    }
    id v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      id v10 = [(SearchSession *)v7 performSelector:"accessibilityIdentifier"];
      unint64_t v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        id v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_8;
      }
    }
    id v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138412290;
    __int16 v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  if (self->_searchSession == v5)
  {
    if ((id)[(SearchSession *)v5 origin] != (id)1)
    {
      uint64_t v13 = +[MNNavigationService sharedService];
      unsigned __int8 v14 = [v13 isInNavigatingState];

      if ((v14 & 1) == 0)
      {
        __int16 v15 = +[CarChromeModeCoordinator sharedInstance];
        [v15 endSearchSession:v5];
      }
    }
    searchSession = self->_searchSession;
    self->_searchSession = 0;
  }
}

- (CarRouteGeniusManager)routeGeniusManager
{
  routeGeniusManager = self->_routeGeniusManager;
  if (!routeGeniusManager)
  {
    id v4 = objc_alloc_init(CarRouteGeniusManager);
    id v5 = self->_routeGeniusManager;
    self->_routeGeniusManager = v4;

    routeGeniusManager = self->_routeGeniusManager;
  }

  return routeGeniusManager;
}

- (void)_updateIOHIDMonitoringAndNotification
{
  unsigned int v3 = [(CarDisplayController *)self isAnyCarSceneHostingNavigation];
  id externalDeviceRepeatGuidanceObserver = self->_externalDeviceRepeatGuidanceObserver;
  if (v3)
  {
    if (!externalDeviceRepeatGuidanceObserver)
    {
      objc_initWeak(location, self);
      id v5 = sub_100015DB4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Registering for External Device notifications to repeat current guidance", buf, 2u);
      }

      id v6 = +[NSNotificationCenter defaultCenter];
      id v7 = +[MapsExternalDevice sharedInstance];
      id v8 = +[NSOperationQueue mainQueue];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100D4C28C;
      v16[3] = &unk_1012E6730;
      objc_copyWeak(&v17, location);
      int v9 = [v6 addObserverForName:@"MapsExternalDeviceRepeatNavigationInstructionNotification" object:v7 queue:v8 usingBlock:v16];
      id v10 = self->_externalDeviceRepeatGuidanceObserver;
      self->_id externalDeviceRepeatGuidanceObserver = v9;

      unint64_t v11 = +[MapsExternalDevice sharedInstance];
      [v11 startMonitoringIOHIDRepeatCurrentGuidance];

      objc_destroyWeak(&v17);
      objc_destroyWeak(location);
    }
  }
  else if (externalDeviceRepeatGuidanceObserver)
  {
    id v12 = sub_100015DB4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unregistering from External Device notifications to repeat current guidance", (uint8_t *)location, 2u);
    }

    uint64_t v13 = +[MapsExternalDevice sharedInstance];
    [v13 stopMonitoringIOHIDRepeatCurrentGuidance];

    unsigned __int8 v14 = +[NSNotificationCenter defaultCenter];
    [v14 removeObserver:self->_externalDeviceRepeatGuidanceObserver];

    id v15 = self->_externalDeviceRepeatGuidanceObserver;
    self->_id externalDeviceRepeatGuidanceObserver = 0;
  }
}

- (void)_repeatGuidanceForExternalDevice
{
  double v2 = +[MNNavigationService sharedService];
  unsigned int v3 = [v2 isInNavigatingState];

  id v4 = sub_100015DB4();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Repeating current guidance for external device", buf, 2u);
    }

    id v5 = +[MNNavigationService sharedService];
    [v5 repeatCurrentGuidance:0];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Asked to repeat current guidance, but guidance is not running", v6, 2u);
  }
}

- (void)detourToMapItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 _geoMapItem];
  id v16 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v5];

  id v6 = [objc_alloc((Class)GEOComposedWaypoint) initWithMapItem:v16];
  id v7 = +[MNNavigationService sharedService];
  id v8 = [v7 arrivalInfo];

  int v9 = +[MNNavigationService sharedService];
  id v10 = [v9 route];

  unint64_t v11 = [v10 legs];
  id v12 = [v11 objectAtIndex:[v8 legIndex]];

  uint64_t v13 = [v4 pointOfInterestCategory];

  if ([v13 isEqualToString:MKPointOfInterestCategoryEVCharger]
    && (([v8 isInArrivalState] & 1) != 0
     || ([v8 isInParkingState] & 1) != 0))
  {
    unsigned __int8 v14 = [v12 chargingStationInfo];

    if (v14)
    {
      id v15 = [v8 destination];
      [(CarDisplayController *)self detourToWaypoint:v6 replacingWaypoint:v15];

      goto LABEL_8;
    }
  }
  else
  {
  }
  [(CarDisplayController *)self detourToWaypoint:v6];
LABEL_8:
}

- (void)detourToWaypoint:(id)a3
{
}

- (void)detourToWaypoint:(id)a3 replacingWaypoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CarDisplayController *)self isCarAppSceneHostingNavigation])
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100D4CAE8;
    v33[3] = &unk_1012E5D08;
    v33[4] = self;
    id v8 = objc_retainBlock(v33);
    if (MapsFeature_IsEnabled_DrivingMultiWaypointRoutes())
    {
      int v9 = [(CarDisplayController *)self platformController];
      id v10 = [v9 currentNavigationSession];
      unint64_t v11 = [v10 waypointController];

      if (v11)
      {
        id v12 = sub_100015DB4();
        BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
        if (v7)
        {
          if (v13)
          {
            unsigned __int8 v14 = [v7 name];
            id v15 = [v6 name];
            *(_DWORD *)buf = 138412546;
            id v35 = v14;
            __int16 v36 = 2112;
            v37 = v15;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[MPR] replacing waypoint %@ with %@", buf, 0x16u);
          }
          [v11 replaceWaypoint:v7 with:v6];
        }
        else
        {
          if (v13)
          {
            v30 = [v6 name];
            *(_DWORD *)buf = 138412290;
            id v35 = v30;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[MPR] inserting new waypoint %@", buf, 0xCu);
          }
          [v11 insertWaypoint:v6];
        }
      }
      else
      {
        long long v29 = sub_100015DB4();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "Failed to access nav waypoint controller in CarDisplayController", buf, 2u);
        }
      }
      ((void (*)(void *))v8[2])(v8);
    }
    else
    {
      __int16 v18 = sub_100015DB4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = [v6 name];
        *(_DWORD *)buf = 138412290;
        id v35 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "MPR is not enabled, will replace destination with %@", buf, 0xCu);
      }
      __int16 v20 = +[MNNavigationService sharedService];
      [v20 updateDestination:v6];

      id v21 = [(CarDisplayController *)self platformController];
      unint64_t v11 = [v21 auxiliaryTasksManager];

      long long v22 = [v11 routePlanningSessionRouteLoadedNotifier];
      __int16 v23 = [v22 currentRouteHistoryEntry];

      long long v24 = [v23 historyEntry];
      BOOL v25 = v24 == 0;

      long long v26 = sub_100015DB4();
      uint64_t v27 = v26;
      if (v25)
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to interrupt route, because the history was nil", buf, 2u);
        }
      }
      else
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          long long v28 = [(CarDisplayController *)self mapsSuggestionsController];
          *(_DWORD *)buf = 138412546;
          id v35 = v23;
          __int16 v36 = 2112;
          v37 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Will interrupt route with history entry: %@, hinting refresh on engine: %@.", buf, 0x16u);
        }
        objc_initWeak((id *)buf, self);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100D4CC24;
        v31[3] = &unk_101316D00;
        objc_copyWeak(&v32, (id *)buf);
        [v23 setNavigationInterrupted:1 completion:v31];
        objc_destroyWeak(&v32);
        objc_destroyWeak((id *)buf);
      }
      ((void (*)(void *))v8[2])(v8);
    }
  }
  else
  {
    id v16 = sub_100015DB4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = [v6 shortDescription];
      *(_DWORD *)buf = 138412290;
      id v35 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Dropping detour request to mapItem: %@", buf, 0xCu);
    }
  }
}

- (BOOL)isCarAppSceneHostingNavigation
{
  BOOL v3 = [(CarDisplayController *)self isCurrentlyConnectedToCarAppScene];
  if (v3)
  {
    uint64_t v4 = [(CarDisplayController *)self platformController];
    id v5 = [(id)v4 currentSession];

    objc_opt_class();
    LOBYTE(v4) = objc_opt_isKindOfClass();

    LOBYTE(v3) = v4 & (v5 != 0);
  }
  return v3;
}

- (void)_startObservingSharedAppState
{
  if (!self->_observingMapsAppState)
  {
    BOOL v3 = sub_100015DB4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Will start observing shared app state (SearchSession, PlatformController)", v8, 2u);
    }

    self->_observingMapsAppState = 1;
    uint64_t v4 = +[CarSessionController sharedInstance];
    [v4 addObserver:self];

    id v5 = +[MapsRadarController sharedInstance];
    [v5 addAttachmentProvider:self];

    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"_searchSessionWillStart:" name:@"SearchSessionWillStart" object:0];

    id v7 = [(CarDisplayController *)self guidanceObserver];
  }
}

- (void)_stopObservingSharedAppState
{
  if (self->_observingMapsAppState)
  {
    BOOL v3 = sub_100015DB4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Will stop observing shared app state (SearchSession, PlatformController)", v8, 2u);
    }

    self->_observingMapsAppState = 0;
    uint64_t v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:@"SearchSessionWillStart" object:0];

    id v5 = +[MapsRadarController sharedInstance];
    [v5 removeAttachmentProvider:self];

    [(SearchSession *)self->_searchSession removeObserver:self];
    searchSession = self->_searchSession;
    self->_searchSession = 0;

    id v7 = +[CarSessionController sharedInstance];
    [v7 removeObserver:self];
  }
}

- (void)_prepareNearby
{
  double v2 = [(CarDisplayController *)self chromeViewController];

  if (!v2)
  {
    BOOL v3 = sub_100015DB4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Will prepare Nearby for CarPlay", v4, 2u);
    }

    +[CarSearchCategoriesModeController prepareNearby];
  }
}

- (id)presentInterruptionOfKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([(CarDisplayController *)self isCurrentlyConnectedToCarAppScene]
    && [(CarDisplayController *)self isChromeAvailable])
  {
    id v10 = sub_100015DB4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Will present interruption immediately in CarChromeViewController", buf, 2u);
    }

    unint64_t v11 = [(CarDisplayController *)self chromeViewController];
    id v12 = [v11 presentInterruptionOfKind:a3 userInfo:v8 completionHandler:v9];
  }
  else
  {
    id v13 = [v9 copy];
    id queuedInterruptionHandler = self->_queuedInterruptionHandler;
    self->_id queuedInterruptionHandler = v13;

    id v15 = (NSDictionary *)[v8 copy];
    queuedInterruptionUserInfo = self->_queuedInterruptionUserInfo;
    self->_queuedInterruptionUserInfo = v15;

    self->_queuedInterruptionKind = a3;
    id v17 = +[NSUUID UUID];
    objc_storeStrong((id *)&self->_queuedInterruptionKey, v17);
    __int16 v18 = sub_100015DB4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Will queue interruption, chrome not available (key:%@)", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100D4D1CC;
    v21[3] = &unk_1012FADD0;
    id v22 = v17;
    id v19 = v17;
    objc_copyWeak(&v23, (id *)buf);
    id v12 = objc_retainBlock(v21);
    objc_destroyWeak(&v23);

    objc_destroyWeak((id *)buf);
  }

  return v12;
}

- (void)_presentQueuedInterruptionIfNeeded
{
  if (!self->_queuedInterruptionKey)
  {
    uint64_t v4 = sub_100015DB4();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    id v17 = "Will not present queued interruption, we don't have one";
    goto LABEL_11;
  }
  if (![(CarDisplayController *)self isChromeAvailable])
  {
    uint64_t v4 = sub_100015DB4();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    id v17 = "Will not present queued interruption, no chrome available";
LABEL_11:
    __int16 v18 = v4;
    uint32_t v19 = 2;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    goto LABEL_13;
  }
  int64_t queuedInterruptionKind = self->_queuedInterruptionKind;
  uint64_t v4 = sub_100015DB4();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!queuedInterruptionKind)
  {
    if (!v5) {
      goto LABEL_13;
    }
    queuedInterruptionKey = self->_queuedInterruptionKey;
    *(_DWORD *)buf = 138412290;
    v30 = queuedInterruptionKey;
    id v17 = "Will not present queued interruption, it's already been presented (key:%@)";
    __int16 v18 = v4;
    uint32_t v19 = 12;
    goto LABEL_12;
  }
  if (v5)
  {
    id v6 = self->_queuedInterruptionKey;
    *(_DWORD *)buf = 138412290;
    v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Will present queued interruption (key:%@)", buf, 0xCu);
  }

  id v7 = self->_queuedInterruptionKey;
  objc_initWeak((id *)buf, self);
  id v8 = [self->_queuedInterruptionHandler copy];
  id v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  id v23 = sub_100D4D570;
  long long v24 = &unk_101322CF8;
  id v9 = v8;
  id v27 = v9;
  BOOL v25 = self;
  objc_copyWeak(&v28, (id *)buf);
  uint64_t v4 = v7;
  long long v26 = v4;
  id v10 = objc_retainBlock(&v21);
  unint64_t v11 = [(CarDisplayController *)self chromeViewController];
  id v12 = [v11 presentInterruptionOfKind:self->_queuedInterruptionKind userInfo:self->_queuedInterruptionUserInfo completionHandler:v10];
  id v13 = [v12 copy];
  id queuedInterruptionDismissalBlock = self->_queuedInterruptionDismissalBlock;
  self->_id queuedInterruptionDismissalBlock = v13;

  self->_int64_t queuedInterruptionKind = 0;
  id queuedInterruptionHandler = self->_queuedInterruptionHandler;
  self->_id queuedInterruptionHandler = 0;

  queuedInterruptionUserInfo = self->_queuedInterruptionUserInfo;
  self->_queuedInterruptionUserInfo = 0;

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
LABEL_13:
}

- (void)_removeQueuedInterruptionWithKey:(id)a3
{
}

- (void)_removeQueuedInterruptionWithKey:(id)a3 animated:(BOOL)a4
{
  BOOL v5 = (NSUUID *)a3;
  unsigned int v6 = [(NSUUID *)self->_queuedInterruptionKey isEqual:v5];
  id queuedInterruptionDismissalBlock = sub_100015DB4();
  BOOL v8 = os_log_type_enabled(queuedInterruptionDismissalBlock, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v14 = 138412290;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, queuedInterruptionDismissalBlock, OS_LOG_TYPE_DEFAULT, "Will remove queued interruption (key:%@)", (uint8_t *)&v14, 0xCu);
    }

    queuedInterruptionKey = self->_queuedInterruptionKey;
    self->_queuedInterruptionKey = 0;

    id queuedInterruptionHandler = self->_queuedInterruptionHandler;
    self->_id queuedInterruptionHandler = 0;

    queuedInterruptionUserInfo = self->_queuedInterruptionUserInfo;
    self->_int64_t queuedInterruptionKind = 0;
    self->_queuedInterruptionUserInfo = 0;

    if (self->_queuedInterruptionDismissalBlock)
    {
      id v12 = sub_100015DB4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v5;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Will fire interruption's dismissal block (key:%@)", (uint8_t *)&v14, 0xCu);
      }

      (*((void (**)(void))self->_queuedInterruptionDismissalBlock + 2))();
      id queuedInterruptionDismissalBlock = self->_queuedInterruptionDismissalBlock;
    }
    else
    {
      id queuedInterruptionDismissalBlock = 0;
    }
    self->_id queuedInterruptionDismissalBlock = 0;
  }
  else if (v8)
  {
    id v13 = self->_queuedInterruptionKey;
    int v14 = 138412546;
    id v15 = v13;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, queuedInterruptionDismissalBlock, OS_LOG_TYPE_DEFAULT, "Will not remove queued interruption, (current key:%@, passed key:%@)", (uint8_t *)&v14, 0x16u);
  }
}

+ (void)launchPerformanceSetup
{
  if (qword_1016110D0 != -1) {
    dispatch_once(&qword_1016110D0, &stru_101322D18);
  }
}

+ (BOOL)debugLaunchPerformance
{
  return byte_1016110D8;
}

+ (double)debugLaunchPerformanceDelay
{
  return *(double *)&qword_1015F7A60;
}

- (BOOL)overrideShouldSuppressChrome
{
  return byte_1016110D9;
}

- (void)setOverrideShouldSuppressChrome:(BOOL)a3
{
}

- (void)_registerCarInfoForGEOLogging
{
  double v2 = [(CarDisplayController *)self connectedCarMainScreenInfo];
  BOOL v3 = sub_100015DB4();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      __int16 v8 = 0;
      BOOL v5 = "Will register all CarPlay screen traits for analytics";
      unsigned int v6 = (uint8_t *)&v8;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, v5, v6, 2u);
    }
  }
  else if (v4)
  {
    *(_WORD *)buf = 0;
    BOOL v5 = "Will register for analytics that we do not have a current CarPlay screen";
    unsigned int v6 = buf;
    goto LABEL_6;
  }

  id v7 = +[GEOAPSharedStateData sharedData];
  [v7 setCarPlayInfo:v2];
}

- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D4DBC4;
  block[3] = &unk_1012E80F0;
  void block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
}

- (void)setGuidanceObserver:(id)a3
{
}

- (void)setRouteGeniusManager:(id)a3
{
}

- (UIScreen)screen
{
  return self->_screen;
}

- (CarDisplayWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (CGSize)screenSize
{
  double width = self->_screenSize.width;
  double height = self->_screenSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (SearchSession)searchSession
{
  return self->_searchSession;
}

- (CarChromeViewController)chromeViewController
{
  return self->_chromeViewController;
}

- (void)setChromeViewController:(id)a3
{
}

- (CarClusterSuggestionController)clusterSuggestionController
{
  return self->_clusterSuggestionController;
}

- (void)setClusterSuggestionController:(id)a3
{
}

- (void)setCarSessionStatus:(id)a3
{
}

- (UIWindowScene)windowScene
{
  return self->_windowScene;
}

- (void)setWindowScene:(id)a3
{
}

- (NSDate)backgroundAutoHideStateTrackingDate
{
  return self->_backgroundAutoHideStateTrackingDate;
}

- (void)setBackgroundAutoHideStateTrackingDate:(id)a3
{
}

- (BOOL)wasConnectedToAnyCarScene
{
  return self->_wasConnectedToAnyCarScene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundAutoHideStateTrackingDate, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_clusterSuggestionController, 0);
  objc_storeStrong((id *)&self->_chromeViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_routeGeniusManager, 0);
  objc_storeStrong((id *)&self->_guidanceObserver, 0);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_mapsSuggestionsController, 0);
  objc_storeStrong((id *)&self->_signalPackQueue, 0);
  objc_storeStrong((id *)&self->_signalPack, 0);
  objc_storeStrong((id *)&self->_donater, 0);
  objc_storeStrong((id *)&self->_queuedInterruptionKey, 0);
  objc_storeStrong(&self->_queuedInterruptionDismissalBlock, 0);
  objc_storeStrong(&self->_queuedInterruptionHandler, 0);
  objc_storeStrong((id *)&self->_queuedInterruptionUserInfo, 0);
  objc_storeStrong((id *)&self->_nightModeToggleGesture, 0);
  objc_storeStrong((id *)&self->_searchSession, 0);
  objc_storeStrong((id *)&self->_arrivalResetTimer, 0);
  objc_storeStrong((id *)&self->_simulationAlertController, 0);
  objc_storeStrong(&self->_externalDeviceRepeatGuidanceObserver, 0);
  objc_storeStrong((id *)&self->_dateOfLastScreenUpdate, 0);
  objc_destroyWeak((id *)&self->_screenUpdateOperation);
  objc_storeStrong(&self->_chromeDeactivationToken, 0);
  objc_storeStrong((id *)&self->_idleTimeoutAssertion, 0);
  objc_storeStrong((id *)&self->_idleTimeoutTimer, 0);

  objc_storeStrong((id *)&self->_HIDEventObserver, 0);
}

@end