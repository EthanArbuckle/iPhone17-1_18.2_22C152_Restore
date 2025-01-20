@interface ChromeNavigationDisplay
+ (id)defaultConfiguration;
- (BOOL)isCameraPanning;
- (BOOL)isSuppressed;
- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4;
- (BOOL)updateRouteAnnotationsConfiguration:(id)a3;
- (ChromeNavigationDisplay)init;
- (ChromeNavigationDisplay)initWithChromeViewController:(id)a3;
- (ChromeNavigationDisplayConfiguration)configuration;
- (ChromeNavigationDisplayDelegate)delegate;
- (ChromeViewController)chromeViewController;
- (MKMapView)mapView;
- (MNTrafficIncidentAlert)trafficAlert;
- (NavCameraController)cameraController;
- (double)_horizontalCameraOffset;
- (id)mapViewDelegate;
- (unint64_t)_routeMarkerOptionsForCameraStyle:(int64_t)a3 incidentAlert:(id)a4;
- (unint64_t)currentCameraMode;
- (void)_applyHorizontalCameraOffset:(BOOL)a3 animated:(BOOL)a4;
- (void)_captureCurrentNavigationState;
- (void)_cleanupNavigationDisplay;
- (void)_clearAnnotations;
- (void)_ioHIDRepeatCurrentGuidance:(id)a3;
- (void)_pauseNavigationCameraMotion;
- (void)_prepareNavigationDisplay;
- (void)_setConfiguration:(id)a3 animated:(BOOL)a4;
- (void)_setRoute:(id)a3;
- (void)_startNavigationCameraMotionAnimated:(BOOL)a3;
- (void)_stopNavigationCameraMotion;
- (void)_transitionToCameraStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)_updateDirectionsAnnotationManagerDisplayedRoutes;
- (void)_updateForCurrentRoute;
- (void)_updateWithMatchedLocation:(id)a3;
- (void)_updateWithRouteGeniusEntry:(id)a3;
- (void)configureDisplay:(id)a3 animated:(BOOL)a4;
- (void)dealloc;
- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4;
- (void)mapInsetsDidChangeAnimated:(BOOL)a3;
- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5;
- (void)mapViewNavigationCameraHasStartedPanning:(id)a3;
- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3;
- (void)navigationDisplay:(id)a3 didChangeUserTrackingMode:(int64_t)a4;
- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4;
- (void)navigationService:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6;
- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)navigationService:(id)a3 didUpdateTrafficForRouteID:(id)a4;
- (void)navigationService:(id)a3 didUpdateTrafficIncidentAlert:(id)a4;
- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)recenterCameraAnimated:(BOOL)a3;
- (void)setCameraPanning:(BOOL)a3;
- (void)setCameraPanning:(BOOL)a3 animated:(BOOL)a4;
- (void)setChromeViewController:(id)a3;
- (void)setCurrentCameraMode:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setSuppressed:(BOOL)a3;
- (void)setSuppressed:(BOOL)a3 animated:(BOOL)a4;
- (void)setTemporaryDisplayRate:(int64_t)a3 forDuration:(double)a4;
- (void)setTrafficAlert:(id)a3;
- (void)startRunningNavigationAnimated:(BOOL)a3;
- (void)stopRunningNavigationAnimated:(BOOL)a3;
- (void)throttle:(id)a3 calculatedNewDisplayRate:(int64_t)a4;
- (void)updateDisplayRate;
- (void)updateWithRoute:(id)a3;
- (void)zoomIn;
- (void)zoomOut;
@end

@implementation ChromeNavigationDisplay

- (void)dealloc
{
  [(ChromeNavigationDisplay *)self stopRunningNavigationAnimated:0];
  v3.receiver = self;
  v3.super_class = (Class)ChromeNavigationDisplay;
  [(ChromeNavigationDisplay *)&v3 dealloc];
}

- (ChromeNavigationDisplay)init
{
  return [(ChromeNavigationDisplay *)self initWithChromeViewController:0];
}

- (ChromeNavigationDisplay)initWithChromeViewController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ChromeNavigationDisplay;
  v5 = [(ChromeNavigationDisplay *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() defaultConfiguration];
    configuration = v5->_configuration;
    v5->_configuration = (ChromeNavigationDisplayConfiguration *)v6;

    [(ChromeNavigationDisplay *)v5 setChromeViewController:v4];
  }

  return v5;
}

- (MKMapView)mapView
{
  v2 = [(ChromeNavigationDisplay *)self chromeViewController];
  objc_super v3 = [v2 mapView];

  return (MKMapView *)v3;
}

- (id)mapViewDelegate
{
  return self->_navigationDisplay;
}

+ (id)defaultConfiguration
{
  v2 = objc_opt_new();
  [v2 setCameraStyle:1];
  [v2 setCameraPaused:&__kCFBooleanFalse];
  [v2 setShowsRoadLabel:&__kCFBooleanTrue];

  return v2;
}

- (void)configureDisplay:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (void (**)(id, id))a3;
  v7 = [(ChromeNavigationDisplay *)self configuration];
  id v8 = [v7 copy];
  objc_super v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(id)objc_opt_class() defaultConfiguration];
  }
  id v15 = v10;

  v6[2](v6, v15);
  [(ChromeNavigationDisplay *)self _setConfiguration:v15 animated:v4];
  v11 = [(ChromeNavigationDisplay *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [(ChromeNavigationDisplay *)self delegate];
    id v14 = [(ChromeNavigationDisplayConfiguration *)self->_configuration copy];
    [v13 chromeNavigationDisplay:self configurationDidChange:v14];
  }
}

- (void)_setConfiguration:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 cameraStyle];
  if (!v7)
  {
    id v8 = [v6 copy];

    [v8 setCameraStyle:[self->_configuration cameraStyle]];
    id v6 = v8;
  }
  p_configuration = &self->_configuration;
  objc_storeStrong((id *)&self->_configuration, v6);
  id v10 = sub_100CB3F18();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v21, 0xCu);
  }

  if ([(ChromeNavigationDisplay *)self isSuppressed])
  {
    p_super = sub_100CB3F18();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      char v12 = "Will not update for current configuration, currently suppressed";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v21, 2u);
    }
  }
  else if (self->_navigationDisplay)
  {
    if (v7) {
      [(ChromeNavigationDisplay *)self _transitionToCameraStyle:v7 animated:v4];
    }
    v13 = [(ChromeNavigationDisplayConfiguration *)self->_configuration routeGeniusEntry];
    [(ChromeNavigationDisplay *)self _updateWithRouteGeniusEntry:v13];

    id v14 = [(ChromeNavigationDisplayConfiguration *)self->_configuration cameraPaused];

    if (v14)
    {
      id v15 = [(ChromeNavigationDisplayConfiguration *)*p_configuration cameraPaused];
      unsigned int v16 = [v15 BOOLValue];

      if (v16)
      {
        v17 = sub_100CB3F18();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v21) = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Will force stop navigation camera motion", (uint8_t *)&v21, 2u);
        }

        [(ChromeNavigationDisplay *)self setCameraPanning:0 animated:v4];
        [(ChromeNavigationDisplay *)self _stopNavigationCameraMotion];
      }
      else
      {
        [(ChromeNavigationDisplay *)self _startNavigationCameraMotionAnimated:v4];
      }
    }
    v18 = [(ChromeNavigationDisplayConfiguration *)*p_configuration showsRoadLabel];

    if (v18)
    {
      v19 = [(ChromeNavigationDisplayConfiguration *)self->_configuration showsRoadLabel];
      -[NavigationDisplay setShowsRoadLabel:](self->_navigationDisplay, "setShowsRoadLabel:", [v19 BOOLValue]);
    }
    else
    {
      [(NavigationDisplay *)self->_navigationDisplay setShowsRoadLabel:1];
    }
    v20 = (ChromeNavigationDisplayConfiguration *)[(ChromeNavigationDisplayConfiguration *)self->_configuration copy];
    p_super = &self->_lastAppliedConfiguration->super;
    self->_lastAppliedConfiguration = v20;
  }
  else
  {
    p_super = sub_100CB3F18();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      char v12 = "Will not update for current configuration, navigation display not ready";
      goto LABEL_18;
    }
  }
}

- (void)updateWithRoute:(id)a3
{
  BOOL v4 = (GEOComposedRoute *)a3;
  [(NavigationDisplay *)self->_navigationDisplay updateWithRoute:v4];
  if (self->_route == v4) {
    [(ChromeNavigationDisplay *)self _updateForCurrentRoute];
  }
  else {
    [(ChromeNavigationDisplay *)self _setRoute:v4];
  }
}

- (void)_updateWithRouteGeniusEntry:(id)a3
{
  [(NavigationDisplay *)self->_navigationDisplay setRouteGeniusEntry:"setRouteGeniusEntry:"];
  if (a3)
  {
    [(ChromeNavigationDisplay *)self updateWithRoute:0];
  }
}

- (void)_captureCurrentNavigationState
{
  objc_super v3 = +[MNNavigationService sharedService];
  if ([v3 isInNavigatingState]
    && ([v3 route], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    route = self->_route;
    if (!route || route != (GEOComposedRoute *)v4)
    {
      id v7 = sub_100CB3F18();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [v5 destination];
        objc_super v9 = [v8 navDisplayName];
        int v11 = 138412290;
        char v12 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Will capture current navigation state (route:%@)", (uint8_t *)&v11, 0xCu);
      }
      [(ChromeNavigationDisplay *)self _setRoute:v5];
    }
  }
  else
  {
    id v10 = sub_100CB3F18();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Will reset navigation state, not navigating", (uint8_t *)&v11, 2u);
    }

    [(ChromeNavigationDisplay *)self _setRoute:0];
    v5 = 0;
  }
  self->_hasArrived = [v3 state] == (id)6;
}

- (void)_setRoute:(id)a3
{
  uint64_t v4 = (GEOComposedRoute *)a3;
  v5 = v4;
  if (v4)
  {
    if ([(GEOComposedRoute *)v4 transportType])
    {
      id v6 = [(ChromeNavigationDisplay *)self carChromeViewController];

      if (v6)
      {
        id v7 = sub_100CB3F18();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12) = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Trying to display a non-driving route in ChromeNavigationDisplay while in CarPlay, ignoring it", (uint8_t *)&v12, 2u);
        }

        v5 = 0;
      }
    }
  }
  p_route = &self->_route;
  if (self->_route != v5)
  {
    objc_storeStrong((id *)&self->_route, v5);
    objc_super v9 = sub_100CB3F18();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [(GEOComposedRoute *)*p_route uniqueRouteID];
      int v11 = [v10 UUIDString];
      int v12 = 138412290;
      v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Got a new route: %@", (uint8_t *)&v12, 0xCu);
    }
    if (*p_route)
    {
      [(ChromeNavigationDisplay *)self _updateWithRouteGeniusEntry:0];
      [(ChromeNavigationDisplay *)self _updateForCurrentRoute];
    }
    else
    {
      [(ChromeNavigationDisplay *)self _clearAnnotations];
    }
  }
}

- (void)_updateForCurrentRoute
{
  if ([(ChromeNavigationDisplay *)self isSuppressed])
  {
    objc_super v3 = sub_100CB3F18();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      uint64_t v4 = "Will not update route, currently suppressed";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v4, (uint8_t *)&v9, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  route = self->_route;
  objc_super v3 = sub_100CB3F18();
  BOOL v6 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (!route)
  {
    if (v6)
    {
      LOWORD(v9) = 0;
      uint64_t v4 = "Will not update for current route, there is no route";
      goto LABEL_10;
    }
LABEL_11:

    return;
  }
  if (v6)
  {
    id v7 = [(GEOComposedRoute *)self->_route uniqueRouteID];
    id v8 = [v7 UUIDString];
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Updating for the current route: %@", (uint8_t *)&v9, 0xCu);
  }
  [(ChromeNavigationDisplay *)self _updateDirectionsAnnotationManagerDisplayedRoutes];
}

- (BOOL)updateRouteAnnotationsConfiguration:(id)a3
{
  id v4 = a3;
  [v4 updateNavConfigurationWithCurrentRoute:self->_route incidentAlert:self->_trafficAlert];
  v5 = [(ChromeNavigationDisplay *)self mapView];
  BOOL v6 = [v5 _mapLayer];
  BOOL v7 = [v6 carDisplayType] != (id)2;

  id v8 = [(ChromeNavigationDisplay *)self configuration];
  if ([v8 cameraStyle] != (id)2 && !self->_trafficAlert) {
    BOOL v7 = 0;
  }
  [v4 setAlternateRoutesEnabled:v7];

  int64_t v9 = [(ChromeNavigationDisplayConfiguration *)self->_configuration cameraStyle];
  id v10 = [(ChromeNavigationDisplay *)self trafficAlert];
  [v4 setRouteMarkerOptions:[self _routeMarkerOptionsForCameraStyle:v9 incidentAlert:v10]];

  int v11 = +[MNNavigationService sharedService];
  int v12 = [v11 arrivalInfo];
  v13 = v12;
  if (v12 && [v12 isInArrivalState])
  {
    id v14 = [v13 destination];
    uint64_t v15 = 2;
  }
  else
  {
    id v16 = -[GEOComposedRoute legIndexForStepIndex:](self->_route, "legIndexForStepIndex:", [v11 stepIndex]);
    v17 = [(GEOComposedRoute *)self->_route legs];
    if (v16 >= [v17 count])
    {
      v19 = 0;
    }
    else
    {
      v18 = [(GEOComposedRoute *)self->_route legs];
      v19 = [v18 objectAtIndexedSubscript:v16];
    }
    id v14 = [v19 destination];
    uint64_t v15 = v14 != 0;
  }
  [v4 setCurrentNavigationWaypoint:v14];
  [v4 setProximityToCurrentNavigationWaypoint:v15];
  if (self->_route)
  {
    v20 = [(ChromeNavigationDisplay *)self delegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      id v22 = [(ChromeNavigationDisplay *)self delegate];
      [v22 chromeNavigationDisplayDidRenderRoute:self];
    }
  }

  return 1;
}

- (void)_updateDirectionsAnnotationManagerDisplayedRoutes
{
  id v2 = [(ChromeNavigationDisplay *)self chromeViewController];
  [v2 setNeedsUpdateComponent:@"routeAnnotations" animated:1];
}

- (void)_clearAnnotations
{
  objc_super v3 = sub_100CB3F18();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Clearing annotations", v7, 2u);
  }

  id v4 = [(ChromeNavigationDisplay *)self chromeViewController];
  v5 = [v4 searchPinsManager];
  [v5 clearDirectionsPins];

  BOOL v6 = [(ChromeNavigationDisplay *)self chromeViewController];
  [v6 setNeedsUpdateComponent:@"routeAnnotations" animated:1];
}

- (void)_updateWithMatchedLocation:(id)a3
{
  id v4 = a3;
  v5 = [(ChromeNavigationDisplay *)self chromeViewController];
  BOOL v6 = [v5 routeAnnotationsController];
  [v6 updateMatchedLocation:v4];

  [(NavigationDisplay *)self->_navigationDisplay updateWithLocation:v4];

  [(ChromeNavigationDisplay *)self updateDisplayRate];
}

- (void)setTrafficAlert:(id)a3
{
  id v12 = a3;
  v5 = [(MNTrafficIncidentAlert *)self->_trafficAlert alertID];
  BOOL v6 = [v12 alertID];
  unint64_t v7 = v5;
  unint64_t v8 = v6;
  if (v7 | v8)
  {
    int64_t v9 = (void *)v8;
    unsigned __int8 v10 = [(id)v7 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_trafficAlert, a3);
      [(ChromeNavigationDisplayRateThrottle *)self->_throttle setTemporaryDisplayRate:-1 forDuration:-1.0];
      int v11 = [(ChromeNavigationDisplay *)self cameraController];
      [v11 setTrafficIncidentAlert:v12];

      [(ChromeNavigationDisplay *)self _updateDirectionsAnnotationManagerDisplayedRoutes];
    }
  }
}

- (void)_ioHIDRepeatCurrentGuidance:(id)a3
{
  objc_super v3 = sub_100CB3F18();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "IOHID has requested repeat current guidance", v5, 2u);
  }

  id v4 = +[MNNavigationService sharedService];
  [v4 repeatCurrentGuidance:0];
}

- (NavCameraController)cameraController
{
  return [(NavigationDisplay *)self->_navigationDisplay cameraController];
}

- (void)zoomIn
{
  objc_super v3 = sub_100CB3F18();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Will zoom in", v7, 2u);
  }

  id v4 = [(ChromeNavigationDisplay *)self configuration];
  v5 = (char *)[v4 cameraStyle];

  if ((unint64_t)(v5 - 1) <= 3)
  {
    BOOL v6 = [(NavigationDisplay *)self->_navigationDisplay mapView];
    [v6 _zoomIn];
  }
}

- (void)zoomOut
{
  objc_super v3 = sub_100CB3F18();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Will zoom out", v7, 2u);
  }

  id v4 = [(ChromeNavigationDisplay *)self configuration];
  v5 = (char *)[v4 cameraStyle];

  if ((unint64_t)(v5 - 1) <= 3)
  {
    BOOL v6 = [(NavigationDisplay *)self->_navigationDisplay mapView];
    [v6 _zoomOut];
  }
}

- (void)setSuppressed:(BOOL)a3
{
}

- (void)setSuppressed:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_suppressed == a3) {
    return;
  }
  BOOL v4 = a4;
  BOOL v5 = a3;
  self->_suppressed = a3;
  BOOL isRunning = self->_isRunning;
  unint64_t v8 = sub_100CB3F18();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (!isRunning)
  {
    if (v9)
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Not navigating, will not pause", (uint8_t *)&v12, 2u);
    }
    goto LABEL_15;
  }
  if (!v5)
  {
    if (v9)
    {
      int v11 = [(ChromeNavigationDisplay *)self configuration];
      int v12 = 138412290;
      v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Will unsuppress navigation display and unpause camera display by refreshing current configuration (configuration:%@)", (uint8_t *)&v12, 0xCu);
    }
    if (self->_route) {
      [(ChromeNavigationDisplay *)self _updateForCurrentRoute];
    }
    else {
      [(ChromeNavigationDisplay *)self _clearAnnotations];
    }
    [(ChromeNavigationDisplay *)self _prepareNavigationDisplay];
    unint64_t v8 = [(ChromeNavigationDisplay *)self configuration];
    [(ChromeNavigationDisplay *)self _setConfiguration:v8 animated:v4];
LABEL_15:

    return;
  }
  if (v9)
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Will suppress navigation display and pause camera", (uint8_t *)&v12, 2u);
  }

  lastAppliedConfiguration = self->_lastAppliedConfiguration;
  self->_lastAppliedConfiguration = 0;

  [(ChromeNavigationDisplay *)self updateDisplayRate];
  [(ChromeNavigationDisplay *)self _pauseNavigationCameraMotion];
}

- (void)stopRunningNavigationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL isRunning = self->_isRunning;
  BOOL v6 = sub_100CB3F18();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (isRunning)
  {
    if (v7)
    {
      unint64_t v8 = @"NO";
      if (v3) {
        unint64_t v8 = @"YES";
      }
      BOOL v9 = v8;
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Will stop running navigation (animated:%@)", (uint8_t *)&v13, 0xCu);
    }
    unsigned __int8 v10 = +[MNNavigationService sharedService];
    [v10 unregisterObserver:self];

    [(ChromeNavigationDisplay *)self _setRoute:0];
    [(ChromeNavigationDisplay *)self _cleanupNavigationDisplay];
    self->_BOOL isRunning = 0;
  }
  else
  {
    if (v7)
    {
      int v11 = @"NO";
      if (v3) {
        int v11 = @"YES";
      }
      int v12 = v11;
      int v13 = 138412290;
      id v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Will not stop running navigation, not running (animated:%@)", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)startRunningNavigationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL isRunning = self->_isRunning;
  BOOL v6 = sub_100CB3F18();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (isRunning)
  {
    if (v7)
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Will not start running navigation, already running", (uint8_t *)&v11, 2u);
    }
  }
  else
  {
    if (v7)
    {
      unint64_t v8 = @"NO";
      if (v3) {
        unint64_t v8 = @"YES";
      }
      BOOL v9 = v8;
      int v11 = 138412290;
      int v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Will start running navigation (animated:%@)", (uint8_t *)&v11, 0xCu);
    }
    self->_BOOL isRunning = 1;
    [(ChromeNavigationDisplay *)self _captureCurrentNavigationState];
    self->_currentStepIndex = 0x7FFFFFFFFFFFFFFFLL;
    [(ChromeNavigationDisplay *)self _prepareNavigationDisplay];
    unsigned __int8 v10 = [(ChromeNavigationDisplay *)self configuration];
    [(ChromeNavigationDisplay *)self _setConfiguration:v10 animated:v3];

    BOOL v6 = +[MNNavigationService sharedService];
    [v6 registerObserver:self];
  }
}

- (void)_cleanupNavigationDisplay
{
  [(ChromeNavigationDisplay *)self _applyHorizontalCameraOffset:0 animated:0];
  [(ChromeNavigationDisplay *)self _stopNavigationCameraMotion];
  [(ChromeNavigationDisplayRateThrottle *)self->_throttle setDelegate:0];
  [(ChromeNavigationDisplayRateThrottle *)self->_throttle setMapView:0];
  throttle = self->_throttle;
  self->_throttle = 0;

  lastAppliedConfiguration = self->_lastAppliedConfiguration;
  self->_lastAppliedConfiguration = 0;

  BOOL v5 = [(ChromeNavigationDisplay *)self mapView];
  [v5 setShowsTraffic:1];

  BOOL v6 = [(NavigationDisplay *)self->_navigationDisplay mapView];
  BOOL v7 = [v6 _mapLayer];
  [v7 setFocusedLabelsPolyline:0];

  BOOL mapClearsUserLocationOnReset = self->_mapClearsUserLocationOnReset;
  BOOL v9 = [(NavigationDisplay *)self->_navigationDisplay mapView];
  [v9 _setClearUserLocationOnLocationReset:mapClearsUserLocationOnReset];

  unsigned __int8 v10 = [(NavigationDisplay *)self->_navigationDisplay mapView];
  [v10 _setShouldSplitRouteLine:0];

  [(NavigationDisplay *)self->_navigationDisplay clearAllAnnotations];
  int v11 = [(NavigationDisplay *)self->_navigationDisplay cameraController];
  [v11 resetMapViewNavigationState];

  int v12 = [(NavigationDisplay *)self->_navigationDisplay userLocationAnnotationView];
  [v12 setInNavMode:0 animated:0];

  [(NavigationDisplay *)self->_navigationDisplay setUserLocationAnnotationView:0];
  [(NavigationDisplay *)self->_navigationDisplay setChromeViewController:0];
  [(NavigationDisplay *)self->_navigationDisplay setDelegate:0];
  navigationDisplay = self->_navigationDisplay;
  self->_navigationDisplay = 0;
}

- (void)_prepareNavigationDisplay
{
  if ([(ChromeNavigationDisplay *)self isSuppressed])
  {
    BOOL v3 = sub_100CB3F18();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Will not prepare navigation display, currently paused", buf, 2u);
    }
  }
  else
  {
    if (!self->_navigationDisplay)
    {
      BOOL v4 = objc_alloc_init(NavigationDisplay);
      navigationDisplay = self->_navigationDisplay;
      self->_navigationDisplay = v4;

      [(NavigationDisplay *)self->_navigationDisplay setDelegate:self];
    }
    BOOL v3 = [(ChromeNavigationDisplay *)self carChromeViewController];
    if (v3)
    {
      BOOL v6 = [(NavigationDisplay *)self->_navigationDisplay cameraController];
      [v6 setIncidentsDisabled:[v3 sceneType] == 2];
    }
    if (!self->_throttle
      && +[ChromeNavigationDisplayRateThrottle isAvailable])
    {
      BOOL v7 = objc_alloc_init(ChromeNavigationDisplayRateThrottle);
      throttle = self->_throttle;
      self->_throttle = v7;

      [(ChromeNavigationDisplayRateThrottle *)self->_throttle setDelegate:self];
    }
    BOOL v9 = [(ChromeNavigationDisplay *)self mapView];
    unsigned __int8 v10 = [(NavigationDisplay *)self->_navigationDisplay mapView];

    if (v9 != v10) {
      self->_BOOL mapClearsUserLocationOnReset = [v9 _clearUserLocationOnLocationReset];
    }
    int v11 = [(ChromeNavigationDisplay *)self chromeViewController];
    [(NavigationDisplay *)self->_navigationDisplay setChromeViewController:v11];

    [(ChromeNavigationDisplayRateThrottle *)self->_throttle setMapView:v9];
    int v12 = +[MNNavigationService sharedService];
    unsigned int v13 = [v12 isInNavigatingState];

    if (v13)
    {
      id v14 = +[MNNavigationService sharedService];
      uint64_t v15 = [v14 route];
      id v16 = [v15 destination];

      [(NavigationDisplay *)self->_navigationDisplay setDestinationWaypoint:v16];
    }
    v17 = [(ChromeNavigationDisplay *)self carChromeViewController];

    v18 = self->_navigationDisplay;
    if (v17)
    {
      [(NavigationDisplay *)v18 setSky:2];
      [v9 _setCanSelectPOIs:0];
      [v9 setShowsTraffic:0];
      v19 = self->_navigationDisplay;
      id v20 = 0;
    }
    else
    {
      [(NavigationDisplay *)v18 setSky:0];
      char v21 = self->_navigationDisplay;
      id v20 = [(GEOComposedRoute *)self->_route transportType];
      v19 = v21;
    }
    [(NavigationDisplay *)v19 setTransportType:v20];
    id v22 = [(ChromeNavigationDisplay *)self chromeViewController];
    v23 = [v22 userLocationView];
    [(NavigationDisplay *)self->_navigationDisplay setUserLocationAnnotationView:v23];

    v24 = [(NavigationDisplay *)self->_navigationDisplay userLocationAnnotationView];
    [v24 setInNavMode:1 animated:0];

    *(_OWORD *)v26 = *(_OWORD *)((char *)VKAnnotationTrackingBehaviorDefault + 1);
    *(void *)&v26[15] = VKAnnotationTrackingBehaviorDefault[2];
    char v25 = 0;
    [v9 _setUserTrackingBehavior:&v25];
    [v9 _setClearUserLocationOnLocationReset:0];
    [v9 _setShouldSplitRouteLine:1];
  }
}

- (void)recenterCameraAnimated:(BOOL)a3
{
  [(ChromeNavigationDisplay *)self setCameraPanning:0 animated:a3];
  BOOL v4 = sub_100576084();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [(ChromeNavigationDisplay *)self mapView];
    int v7 = 136315394;
    unint64_t v8 = "-[ChromeNavigationDisplay recenterCameraAnimated:]";
    __int16 v9 = 2114;
    unsigned __int8 v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s, navigationCameraReturnToPuck! on mapView: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  BOOL v6 = [(ChromeNavigationDisplay *)self mapView];
  [v6 navigationCameraReturnToPuck];
}

- (void)_applyHorizontalCameraOffset:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = 0.0;
  if (a3 && self->_navigationDisplay)
  {
    [(ChromeNavigationDisplay *)self _horizontalCameraOffset];
    double v7 = v8;
  }
  if (self->_currentCameraOffset != v7)
  {
    self->_currentCameraOffset = v7;
    __int16 v9 = (id *)&kCAMediaTimingFunctionEaseInEaseOut;
    if (v4) {
      double v10 = 2.5;
    }
    else {
      double v10 = 0.0;
    }
    if (!v5) {
      __int16 v9 = (id *)&kCAMediaTimingFunctionDefault;
    }
    id v11 = *v9;
    int v12 = sub_100CB3F18();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134217984;
      double v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Will set camera offset (offset:%lf)", (uint8_t *)&v17, 0xCu);
    }

    unsigned int v13 = [(ChromeNavigationDisplay *)self chromeViewController];
    id v14 = [v13 mapView];

    uint64_t v15 = [v14 _mapLayer];
    id v16 = +[CAMediaTimingFunction functionWithName:v11];

    [v15 setCameraHorizontalOffset:v16 duration:v7 timingFunction:v10];
  }
}

- (double)_horizontalCameraOffset
{
  BOOL v3 = [(ChromeNavigationDisplay *)self chromeViewController];
  BOOL v4 = [v3 view];
  [v4 layoutIfNeeded];

  BOOL v5 = [(ChromeNavigationDisplay *)self chromeViewController];
  [v5 unobscuredMapContentBoundsInContainingView];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  id v14 = [(ChromeNavigationDisplay *)self chromeViewController];
  uint64_t v15 = [v14 mapView];
  [v15 frame];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v26.origin.x = v7;
  v26.origin.y = v9;
  v26.size.width = v11;
  v26.size.height = v13;
  double MidX = CGRectGetMidX(v26);
  v27.origin.x = v17;
  v27.origin.y = v19;
  v27.size.width = v21;
  v27.size.height = v23;
  return MidX - CGRectGetMidX(v27);
}

- (void)mapInsetsDidChangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ChromeNavigationDisplay *)self configuration];
  -[ChromeNavigationDisplay _applyHorizontalCameraOffset:animated:](self, "_applyHorizontalCameraOffset:animated:", ((unint64_t)[v5 cameraStyle] & 0xFFFFFFFFFFFFFFFDLL) != 0, v3);
}

- (void)_startNavigationCameraMotionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ChromeNavigationDisplay *)self configuration];
  double v6 = [v5 cameraPaused];
  unsigned int v7 = [v6 BOOLValue];

  if (v7)
  {
    double v8 = sub_100CB3F18();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CGFloat v9 = [(ChromeNavigationDisplay *)self configuration];
      double v10 = [v9 cameraPaused];
      if ([v10 BOOLValue]) {
        CGFloat v11 = @"YES";
      }
      else {
        CGFloat v11 = @"NO";
      }
      double v12 = v11;
      if (v3) {
        CGFloat v13 = @"YES";
      }
      else {
        CGFloat v13 = @"NO";
      }
      id v14 = v13;
      int v24 = 138412546;
      char v25 = v12;
      __int16 v26 = 2112;
      CGRect v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Will not start navigation camera (cameraPaused:%@, animated:%@)", (uint8_t *)&v24, 0x16u);
    }
  }
  else
  {
    uint64_t v15 = [(ChromeNavigationDisplay *)self configuration];
    id v16 = [v15 cameraStyle];

    if (+[ChromeNavigationDisplayConfiguration _cameraStyleRequiresCameraMotion:v16])
    {
      CGFloat v17 = [(NavigationDisplay *)self->_navigationDisplay mapView];
      [v17 setUserTrackingMode:0];

      double v18 = sub_100CB3F18();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        CGFloat v19 = @"NO";
        if (v3) {
          CGFloat v19 = @"YES";
        }
        double v20 = v19;
        int v24 = 138412290;
        char v25 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Will start navigation camera (animated:%@)", (uint8_t *)&v24, 0xCu);
      }
      [(ChromeNavigationDisplay *)self setCameraPanning:0];
      CGFloat v21 = [(ChromeNavigationDisplay *)self configuration];
      -[ChromeNavigationDisplay _applyHorizontalCameraOffset:animated:](self, "_applyHorizontalCameraOffset:animated:", ((unint64_t)[v21 cameraStyle] & 0xFFFFFFFFFFFFFFFDLL) != 0, v3);

      [(ChromeNavigationDisplay *)self updateDisplayRate];
      [(NavigationDisplay *)self->_navigationDisplay startMotion:v3];
    }
    else
    {
      double v22 = sub_100CB3F18();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        CGFloat v23 = +[NSNumber numberWithInteger:v16];
        int v24 = 138412290;
        char v25 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Will not start navigation camera (cameraStyle:%@)", (uint8_t *)&v24, 0xCu);
      }
    }
  }
}

- (void)_pauseNavigationCameraMotion
{
  BOOL v3 = sub_100CB3F18();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Will pause navigation camera", v4, 2u);
  }

  [(NavigationDisplay *)self->_navigationDisplay pauseCameraMotion];
}

- (void)_stopNavigationCameraMotion
{
  BOOL v3 = sub_100CB3F18();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Will stop navigation camera", v4, 2u);
  }

  [(NavigationDisplay *)self->_navigationDisplay stopCameraMotion];
}

- (void)setCameraPanning:(BOOL)a3
{
}

- (void)setCameraPanning:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_cameraPanning != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_cameraPanning = a3;
    if (!a3)
    {
      unsigned int v7 = [(ChromeNavigationDisplay *)self chromeViewController];
      [v7 clearMapGesturesAndAnimations];
    }
    double v8 = [(ChromeNavigationDisplay *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(ChromeNavigationDisplay *)self delegate];
      [v10 chromeNavigationDisplay:self didChangePanning:v5 animated:v4];
    }
  }
}

- (void)_transitionToCameraStyle:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v7 = sub_100CB3F18();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 4) {
      CFStringRef v8 = @".Unknown";
    }
    else {
      CFStringRef v8 = *(&off_101320B00 + a3);
    }
    char v9 = @"NO";
    if (v4) {
      char v9 = @"YES";
    }
    id v10 = v9;
    *(_DWORD *)buf = 138412546;
    CFStringRef v22 = v8;
    __int16 v23 = 2112;
    int v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Will configure camera style %@ (animated:%@)", buf, 0x16u);
  }
  if ([(ChromeNavigationDisplay *)self isCameraPanning]) {
    [(ChromeNavigationDisplay *)self setCameraPanning:0 animated:v4];
  }
  int64_t v11 = [(ChromeNavigationDisplayConfiguration *)self->_lastAppliedConfiguration cameraStyle];
  switch(a3)
  {
    case 0:
      return;
    case 1:
      unint64_t currentCameraMode = 0;
      self->_unint64_t currentCameraMode = 0;
      break;
    case 2:
      unint64_t currentCameraMode = 1;
      goto LABEL_16;
    case 3:
      unint64_t currentCameraMode = 2;
      goto LABEL_16;
    case 4:
      unint64_t currentCameraMode = 3;
LABEL_16:
      self->_unint64_t currentCameraMode = currentCameraMode;
      break;
    default:
      unint64_t currentCameraMode = self->_currentCameraMode;
      break;
  }
  [(NavigationDisplay *)self->_navigationDisplay setNavigationCameraMode:currentCameraMode];
  [(ChromeNavigationDisplay *)self _startNavigationCameraMotionAnimated:v4];
  if (v11 != a3)
  {
    CGFloat v13 = [(ChromeNavigationDisplay *)self chromeViewController];
    [v13 setNeedsUpdateMapInsets];

    id v14 = [(ChromeNavigationDisplay *)self mapView];
    uint64_t v15 = [v14 _mapLayer];
    BOOL v16 = [v15 carDisplayType] != (id)2;

    CGFloat v17 = [(ChromeNavigationDisplay *)self chromeViewController];
    double v18 = [v17 routeAnnotationsController];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100CB5F64;
    v19[3] = &unk_101320AC0;
    v19[4] = self;
    v19[5] = a3;
    BOOL v20 = v16;
    [v18 updateConfigurationWithBlock:v19];
  }
}

- (unint64_t)_routeMarkerOptionsForCameraStyle:(int64_t)a3 incidentAlert:(id)a4
{
  if (!a3) {
    return 0;
  }
  if (a3 != 4 && a3 != 1) {
    return 3;
  }
  if (a4) {
    return 3;
  }
  return 0;
}

- (void)updateDisplayRate
{
  if (self->_throttle)
  {
    if ([(ChromeNavigationDisplay *)self isSuppressed]
      || ([(ChromeNavigationDisplay *)self chromeViewController],
          BOOL v3 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v4 = [v3 isThrottlingMapViewFrameRate],
          v3,
          (v4 & 1) != 0))
    {
      BOOL v5 = 0;
    }
    else
    {
      throttle = self->_throttle;
      if (throttle && ([(ChromeNavigationDisplayRateThrottle *)throttle settings], v23))
      {
        BOOL v5 = 1;
      }
      else
      {
        CGFloat v13 = [(ChromeNavigationDisplay *)self configuration];
        BOOL v5 = [v13 cameraStyle] == (id)2;
      }
    }
    double v6 = [(ChromeNavigationDisplay *)self carChromeViewController];

    if (v6 && v5)
    {
      unsigned int v7 = self->_throttle;
      if (v7)
      {
        [(ChromeNavigationDisplayRateThrottle *)v7 settings];
        if (BYTE1(v22)) {
          goto LABEL_11;
        }
      }
      else
      {
        uint64_t v22 = 0;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
      }
      int64_t v11 = +[CarDisplayController sharedInstance];
      id v12 = [v11 connectionType];

      if (v12 != (id)2) {
        goto LABEL_17;
      }
    }
    else if (!v5)
    {
LABEL_17:
      [(ChromeNavigationDisplayRateThrottle *)self->_throttle setEnabled:0];
      return;
    }
LABEL_11:
    [(ChromeNavigationDisplayRateThrottle *)self->_throttle setEnabled:1];
    int64_t v8 = [(ChromeNavigationDisplayRateThrottle *)self->_throttle calculateThrottledDisplayRate];
    char v9 = [(NavigationDisplay *)self->_navigationDisplay cameraController];
    [v9 setDesiredDisplayRate:v8];
  }
}

- (void)setTemporaryDisplayRate:(int64_t)a3 forDuration:(double)a4
{
  if (a3 == -1)
  {
    uint64_t v6 = [(ChromeNavigationDisplay *)self carChromeViewController];
    if (v6)
    {
      unsigned int v7 = (void *)v6;
      int64_t v8 = +[CarDisplayController sharedInstance];
      id v9 = [v8 connectionType];

      if (v9 == (id)2) {
        a3 = 12;
      }
      else {
        a3 = 15;
      }
    }
    else
    {
      a3 = 15;
    }
  }
  throttle = self->_throttle;

  [(ChromeNavigationDisplayRateThrottle *)throttle setTemporaryDisplayRate:a3 forDuration:a4];
}

- (void)throttle:(id)a3 calculatedNewDisplayRate:(int64_t)a4
{
  uint64_t v6 = [(ChromeNavigationDisplay *)self chromeViewController];
  unsigned __int8 v7 = [v6 isThrottlingMapViewFrameRate];

  if ((v7 & 1) == 0)
  {
    id v8 = [(NavigationDisplay *)self->_navigationDisplay cameraController];
    [v8 setDesiredDisplayRate:a4];
  }
}

- (void)navigationDisplay:(id)a3 didChangeUserTrackingMode:(int64_t)a4
{
  id v5 = +[UIApplication sharedMapsDelegate];
  [v5 setTrackingMode:a4 monitorBatteryState:0];
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  if (!a4)
  {
    id v7 = a3;
    [(ChromeNavigationDisplay *)self setCameraPanning:1 animated:1];
    [(ChromeNavigationDisplay *)self mapViewNavigationCameraHasStartedPanning:v7];
  }
}

- (void)mapViewNavigationCameraHasStartedPanning:(id)a3
{
}

- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3
{
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  id v7 = [(ChromeNavigationDisplay *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(ChromeNavigationDisplay *)self delegate];
    [v9 chromeNavigationDisplay:self userDidTapMap:v10 atPoint:x, y];
  }
}

- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if (MNNavigationServiceStateChangedToNavigating())
  {
    [(ChromeNavigationDisplay *)self setCameraPanning:0 animated:0];
  }
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if ((MNNavigationServiceStateChangedToNavigating() & 1) != 0
    || MNNavigationServiceStateChangedFromNavigatingToStopped())
  {
    [(ChromeNavigationDisplay *)self _captureCurrentNavigationState];
  }
  else if (a5 != a4 && (a5 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    [(ChromeNavigationDisplay *)self _updateDirectionsAnnotationManagerDisplayedRoutes];
  }
}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(ChromeNavigationDisplay *)self chromeViewController];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(ChromeNavigationDisplay *)self chromeViewController];
    unsigned __int8 v11 = [v10 mapView:v6 shouldSelectLabelMarker:v7];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  throttle = self->_throttle;
  id v7 = a4;
  [(ChromeNavigationDisplayRateThrottle *)throttle setTemporaryDisplayRate:-1 forDuration:-1.0];
  [(ChromeNavigationDisplay *)self _setRoute:v7];
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v7 = a3;
  [(ChromeNavigationDisplay *)self _updateDirectionsAnnotationManagerDisplayedRoutes];
  id v8 = [v7 route];

  self->_hasArrived = [v8 isLegIndexOfLastLeg:a5];
}

- (void)navigationService:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5
{
  id v5 = a4;
  id v6 = sub_100CB3F18();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 alertTitles];
    id v8 = [v7 firstObject];
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(alert:%@)", (uint8_t *)&v9, 0xCu);
  }
}

- (void)navigationService:(id)a3 didUpdateTrafficIncidentAlert:(id)a4
{
  id v4 = a4;
  id v5 = sub_100CB3F18();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 alertTitles];
    id v7 = [v6 firstObject];
    int v8 = 138412290;
    int v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(alert:%@)", (uint8_t *)&v8, 0xCu);
  }
}

- (void)navigationService:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4
{
  id v4 = a4;
  id v5 = sub_100CB3F18();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 alertTitles];
    id v7 = [v6 firstObject];
    int v8 = 138412290;
    int v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(alert:%@)", (uint8_t *)&v8, 0xCu);
  }
}

- (void)navigationService:(id)a3 didUpdateTrafficForRouteID:(id)a4
{
  id v5 = a4;
  id v6 = [(ChromeNavigationDisplay *)self chromeViewController];
  id v7 = [v6 routeAnnotationsController];
  int v8 = [v7 configuration];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v9 = [v8 routes];
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
        long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
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

- (ChromeNavigationDisplayConfiguration)configuration
{
  return self->_configuration;
}

- (ChromeNavigationDisplayDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ChromeNavigationDisplayDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isSuppressed
{
  return self->_suppressed;
}

- (BOOL)isCameraPanning
{
  return self->_cameraPanning;
}

- (MNTrafficIncidentAlert)trafficAlert
{
  return self->_trafficAlert;
}

- (unint64_t)currentCameraMode
{
  return self->_currentCameraMode;
}

- (void)setCurrentCameraMode:(unint64_t)a3
{
  self->_unint64_t currentCameraMode = a3;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_trafficAlert, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastAppliedConfiguration, 0);
  objc_storeStrong((id *)&self->_throttle, 0);
  objc_storeStrong((id *)&self->_navigationDisplay, 0);
  objc_storeStrong((id *)&self->_route, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end