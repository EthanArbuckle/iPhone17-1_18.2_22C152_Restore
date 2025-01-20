@interface TransitNavigationContext
- (BOOL)_isAuthorizedForPreciseLocation;
- (BOOL)_sceneInBackground;
- (BOOL)_shouldFrameVehiclePositions;
- (BOOL)_shouldUseManualFraming;
- (BOOL)forceManualFraming;
- (BOOL)isDisplayingManuallySelectedStep;
- (BOOL)isNavigationCameraTracking;
- (BOOL)shouldShowRecenterButton;
- (BOOL)showsMapView;
- (BOOL)updateRouteAnnotationsConfiguration:(id)a3;
- (BOOL)wantsMapSelectionControl;
- (BOOL)wantsNavigationDisplay;
- (BOOL)wantsRouteAnnotationsControl;
- (ChromeViewController)chromeViewController;
- (GEOComposedRoute)route;
- (GEOComposedRouteStep)activeStep;
- (GEOComposedRouteStep)displayedStep;
- (TransitNavigationContext)init;
- (id)_navCameraController;
- (id)_stepForTransitVehicleUpdater;
- (id)fetchCurrentRoute;
- (id)personalizedItemSources;
- (id)transitVehicleUpdater:(id)a3 shouldUpdateVehiclePositionsForTripIDs:(id)a4;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (void)_checkRouteProximityForManualFraming:(id)a3;
- (void)_manuallyFrameStep:(id)a3;
- (void)_pauseOrResumeRealtimeUpdatesIfNeeded;
- (void)_restoreMapView:(id)a3;
- (void)_sceneDidEnterBackground:(id)a3;
- (void)_sceneWillEnterForeground:(id)a3;
- (void)_setupMapView:(id)a3;
- (void)_updateAnnotationsForCurrentRoute;
- (void)_updateCurrentRouteIfNeeded;
- (void)_updateNavigationDisplayConfigurationForDisplayedStep:(id)a3;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)configureNavigationDisplay:(id)a3;
- (void)dealloc;
- (void)enterStackInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)manuallyFrameCurrentStep;
- (void)recenterOnActiveStep;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setActiveStep:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setDisplayedStep:(id)a3;
- (void)startRequestingRealtimeUpdates;
- (void)stopRequestingRealtimeUpdates;
- (void)temporarilyFrameStep:(id)a3;
- (void)transitDirectionsStepsListDataSource:(id)a3 didTapIncidentsCell:(id)a4 withAdvisory:(id)a5;
- (void)transitDirectionsStepsListDataSource:(id)a3 didTapRowForItem:(id)a4;
- (void)transitDirectionsStepsListDataSource:(id)a3 didUpdateActiveGuidanceStep:(id)a4;
- (void)transitDirectionsStepsListDataSource:(id)a3 didUpdateDisplayedGuidanceStep:(id)a4;
- (void)transitVehicleUpdater:(id)a3 didUpdateVehiclePositions:(id)a4 forTripIDs:(id)a5;
- (void)updateFramingForCurrentStep;
- (void)updateTransitVehicleUpdaterIfNeeded;
@end

@implementation TransitNavigationContext

- (void)dealloc
{
  [(GEOTransitVehicleUpdater *)self->_transitVehicleUpdater setActive:0];
  transitVehicleUpdater = self->_transitVehicleUpdater;
  self->_transitVehicleUpdater = 0;

  v4.receiver = self;
  v4.super_class = (Class)TransitNavigationContext;
  [(TransitNavigationContext *)&v4 dealloc];
}

- (TransitNavigationContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)TransitNavigationContext;
  v2 = [(TransitNavigationContext *)&v6 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_sceneDidEnterBackground:" name:UISceneDidEnterBackgroundNotification object:0];

    objc_super v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"_sceneWillEnterForeground:" name:UISceneWillEnterForegroundNotification object:0];
  }
  return v2;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)wantsNavigationDisplay
{
  return 1;
}

- (void)configureNavigationDisplay:(id)a3
{
}

- (id)personalizedItemSources
{
  v3 = [(TransitNavigationContext *)self chromeViewController];
  objc_super v4 = [v3 searchPinsManager];

  if (v4)
  {
    v5 = [(TransitNavigationContext *)self chromeViewController];
    objc_super v6 = [v5 searchPinsManager];
    v7 = [v6 routeStartEndItemSource];
    v10 = v7;
    v8 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    v8 = &__NSArray0__struct;
  }

  return v8;
}

- (void)enterStackInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100A26984;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [a4 addPreparation:v4];
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100A26B14;
  v12[3] = &unk_1012E5D58;
  v12[4] = self;
  id v6 = a3;
  id v13 = v6;
  id v7 = a4;
  [v7 addPreparation:v12];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100A26B70;
  v9[3] = &unk_1012E5D58;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  [v7 addAnimations:v9];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100A26C84;
  v6[3] = &unk_1012E5D58;
  v6[4] = self;
  id v7 = a3;
  id v5 = v7;
  [a4 addPreparation:v6];
}

- (void)_setupMapView:(id)a3
{
  id v4 = a3;
  [v4 _setApplicationState:3];
  [v4 setScaleEnabled:0];
  [v4 _setLocationPropagationEnabled:0];
  [v4 _setShouldAnimatePositionWithRouteMatch:0];
  [v4 _setAlwaysShowHeadingIndicatorIfSupported:0];
  [v4 _setClearUserLocationOnLocationReset:0];
  [v4 _setShowHeadingIndicatorForStepping:[self _isAuthorizedForPreciseLocation]];
}

- (void)_restoreMapView:(id)a3
{
  id v3 = a3;
  [v3 _setLocationPropagationEnabled:1];
  [v3 _setShouldAnimatePositionWithRouteMatch:1];
  [v3 _setClearUserLocationOnLocationReset:1];
  long long v4 = *(_OWORD *)VKAnnotationTrackingBehaviorDefault;
  uint64_t v5 = VKAnnotationTrackingBehaviorDefault[2];
  [v3 _setUserTrackingBehavior:&v4];
  [v3 _setAlwaysShowHeadingIndicatorIfSupported:1];
  [v3 _setShowHeadingIndicatorForStepping:0];
  [v3 _setShouldSplitRouteLine:0];
  [v3 _clearRouteContext];
}

- (BOOL)_isAuthorizedForPreciseLocation
{
  v2 = +[MKLocationManager sharedLocationManager];
  unsigned __int8 v3 = [v2 isLocationServicesApproved];
  char v4 = v3 & [v2 isAuthorizedForPreciseLocation];

  return v4;
}

- (id)fetchCurrentRoute
{
  return 0;
}

- (void)_updateCurrentRouteIfNeeded
{
  id obj = [(TransitNavigationContext *)self fetchCurrentRoute];
  unsigned __int8 v3 = [obj uniqueRouteID];
  route = self->_route;
  p_route = &self->_route;
  id v6 = [(GEOComposedRoute *)route uniqueRouteID];
  unint64_t v7 = v3;
  unint64_t v8 = v6;
  if (v7 | v8)
  {
    v9 = (void *)v8;
    unsigned __int8 v10 = [(id)v7 isEqual:v8];

    if ((v10 & 1) == 0) {
      objc_storeStrong((id *)p_route, obj);
    }
  }
}

- (void)_updateAnnotationsForCurrentRoute
{
  [(GEOComposedRoute *)self->_route setManeuverDisplayEnabled:1];
  id v3 = [(TransitNavigationContext *)self chromeViewController];
  [v3 setNeedsUpdateComponent:@"routeAnnotations" animated:1];
}

- (BOOL)wantsRouteAnnotationsControl
{
  return 1;
}

- (BOOL)updateRouteAnnotationsConfiguration:(id)a3
{
  lastReceivedVehiclePositions = self->_lastReceivedVehiclePositions;
  id v5 = a3;
  [v5 setTransitVehiclePositions:lastReceivedVehiclePositions];
  id v6 = [(GEOTransitVehicleUpdater *)self->_transitVehicleUpdater tripIDs];
  [v5 filterTransitVehiclePositionsForTripsNotInSet:v6];

  return 1;
}

- (BOOL)isDisplayingManuallySelectedStep
{
  return 0;
}

- (BOOL)wantsMapSelectionControl
{
  return 0;
}

- (id)_navCameraController
{
  v2 = [(TransitNavigationContext *)self chromeViewController];
  id v3 = [v2 navigationDisplay];
  char v4 = [v3 cameraController];

  return v4;
}

- (BOOL)isNavigationCameraTracking
{
  v2 = [(TransitNavigationContext *)self chromeViewController];
  id v3 = [v2 navigationDisplay];
  char v4 = [v3 configuration];

  id v5 = [v4 cameraPaused];
  LOBYTE(v3) = [v5 BOOLValue] ^ 1;

  return (char)v3;
}

- (BOOL)_shouldUseManualFraming
{
  return self->_forceManualFraming
      || [(TransitNavigationContext *)self isDisplayingManuallySelectedStep]
      || self->_temporarilyFramedStep != 0;
}

- (void)manuallyFrameCurrentStep
{
  p_temporarilyFramedStep = &self->_temporarilyFramedStep;
  temporarilyFramedStep = self->_temporarilyFramedStep;
  id v5 = sub_10057767C();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (temporarilyFramedStep)
  {
    if (v6)
    {
      id v7 = [(GEOComposedRouteStep *)*p_temporarilyFramedStep stepIndex];
      int v9 = 134217984;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Will temporarily frame step %lu", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v6)
    {
      id v8 = [(GEOComposedRouteStep *)self->_displayedStep stepIndex];
      int v9 = 134217984;
      id v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Will frame current/displayed step %lu", (uint8_t *)&v9, 0xCu);
    }

    p_temporarilyFramedStep = &self->_displayedStep;
  }
  [(TransitNavigationContext *)self _manuallyFrameStep:*p_temporarilyFramedStep];
}

- (void)temporarilyFrameStep:(id)a3
{
  id v4 = a3;
  id v5 = sub_10057767C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    id v8 = [v4 stepIndex];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Asked to temporarily frame step %lu", (uint8_t *)&v7, 0xCu);
  }

  temporarilyFramedStep = self->_temporarilyFramedStep;
  self->_temporarilyFramedStep = (GEOComposedRouteStep *)v4;

  [(TransitNavigationContext *)self canRecenterDidChange];
  [(TransitNavigationContext *)self updateFramingForCurrentStep];
}

- (void)_manuallyFrameStep:(id)a3
{
  id v4 = a3;
  if (!self->_manualSteppingFramer)
  {
    id v5 = objc_alloc_init(TransitSteppingCameraFramer);
    manualSteppingFramer = self->_manualSteppingFramer;
    self->_manualSteppingFramer = v5;
  }
  [(TransitNavigationContext *)self willManuallyFrameStep];
  id v7 = [v4 stepIndex];
  objc_initWeak(&location, self);
  id v8 = self->_manualSteppingFramer;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100A274A8;
  v9[3] = &unk_1012F9230;
  objc_copyWeak(&v10, &location);
  void v9[4] = self;
  [(TransitSteppingCameraFramer *)v8 rectForStep:v4 currentStepIndex:v7 handler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_checkRouteProximityForManualFraming:(id)a3
{
  id v4 = a3;
  id v5 = [v4 origin];
  unsigned __int8 v6 = [v5 isCurrentLocation];

  if (v6)
  {
    if (self->_forceManualFraming)
    {
      id v7 = sub_10057767C();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Route is from current location, disable forced manual framing", (uint8_t *)&v19, 2u);
      }

      self->_forceManualFraming = 0;
    }
  }
  else if (!self->_forceManualFraming)
  {
    if (GEOConfigGetBOOL())
    {
      id v8 = v4;
      if (v8)
      {
        id v9 = [objc_alloc((Class)MNRouteProximitySensor) initWithRoute:v8];
        GEOConfigGetDouble();
        [v9 setProximityThreshold:];
        id v10 = [(TransitNavigationContext *)self fetchLastLocation];
        id v11 = [objc_alloc((Class)GEOLocation) initWithCLLocation:v10];
        [v9 updateForLocation:v11];
        id v12 = [v9 proximity];
        self->_forceManualFraming = (unint64_t)v12 < 2;
        id v13 = sub_10057767C();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          if ((unint64_t)v12 > 4) {
            CFStringRef v14 = &stru_101324E70;
          }
          else {
            CFStringRef v14 = *(&off_101314AE8 + (void)v12);
          }
          if (self->_forceManualFraming) {
            v16 = @"YES";
          }
          else {
            v16 = @"NO";
          }
          v17 = v16;
          [v9 proximityThreshold];
          int v19 = 138543874;
          CFStringRef v20 = v14;
          __int16 v21 = 2114;
          v22 = v16;
          __int16 v23 = 2048;
          uint64_t v24 = v18;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Route is point-to-point, proximity to route is %{public}@, force manual framing: %{public}@ (threshold: %#.1lfm)", (uint8_t *)&v19, 0x20u);
        }
      }
    }
    else
    {
      v15 = sub_10057767C();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Route is point-to-point, force manual framing", (uint8_t *)&v19, 2u);
      }

      self->_forceManualFraming = 1;
    }
  }
}

- (void)updateFramingForCurrentStep
{
  id v3 = sub_10057767C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Updating camera behaviour for current step...", buf, 2u);
  }

  id v4 = [(TransitNavigationContext *)self chromeViewController];
  id v5 = [v4 navigationDisplay];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100A27B78;
  v10[3] = &unk_1012E68D8;
  v10[4] = self;
  [v5 configureDisplay:v10 animated:1];

  if ([(TransitNavigationContext *)self isNavigationCameraTracking]
    && ([(TransitNavigationContext *)self isCameraPanningOrZoomed] & 1) == 0)
  {
    unsigned __int8 v6 = sub_10057767C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Automatically returning to puck, navigation display is unpaused and user has no panned/zoomed map", buf, 2u);
    }

    id v7 = [(TransitNavigationContext *)self chromeViewController];
    id v8 = [v7 mapView];
    [v8 navigationCameraReturnToPuck];
  }
  if ([(TransitNavigationContext *)self _shouldUseManualFraming])
  {
    id v9 = sub_10057767C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Will manually frame current step", buf, 2u);
    }

    [(TransitNavigationContext *)self manuallyFrameCurrentStep];
  }
}

- (void)_updateNavigationDisplayConfigurationForDisplayedStep:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_displayedStep)
  {
    [v4 setCameraStyle:1];
    if ([(TransitNavigationContext *)self _shouldUseManualFraming])
    {
      if ([(TransitNavigationContext *)self isNavigationCameraTracking])
      {
        unsigned __int8 v6 = sub_10057767C();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Pausing camera to frame step manually", buf, 2u);
        }

        id v7 = &__kCFBooleanTrue;
LABEL_14:
        [v5 setCameraPaused:v7];
      }
    }
    else
    {
      id v9 = [v5 cameraPaused];
      unsigned int v10 = [v9 BOOLValue];

      if (v10)
      {
        id v11 = sub_10057767C();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v12 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Starting camera for automatic step framing", v12, 2u);
        }

        id v7 = &__kCFBooleanFalse;
        goto LABEL_14;
      }
    }
  }
  else
  {
    id v8 = sub_10057767C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CFStringRef v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "No displayedStep set to configure in navigation display", v14, 2u);
    }
  }
}

- (BOOL)shouldShowRecenterButton
{
  return ([(TransitNavigationContext *)self isCameraPanningOrZoomed] & 1) != 0
      || [(TransitNavigationContext *)self isDisplayingManuallySelectedStep]
      || self->_temporarilyFramedStep != 0;
}

- (void)recenterOnActiveStep
{
  if ([(TransitNavigationContext *)self shouldShowRecenterButton])
  {
    if (self->_temporarilyFramedStep)
    {
      id v3 = sub_10057767C();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Camera clearing temporarily-framed step (recenter button)", buf, 2u);
      }

      temporarilyFramedStep = self->_temporarilyFramedStep;
      self->_temporarilyFramedStep = 0;

      [(TransitNavigationContext *)self canRecenterDidChange];
      [(TransitNavigationContext *)self updateFramingForCurrentStep];
    }
    else if ([(TransitNavigationContext *)self isNavigationCameraTracking])
    {
      id v5 = sub_10057767C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unsigned int v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Camera returning to automatic/puck framing (recenter button)", v10, 2u);
      }

      unsigned __int8 v6 = [(TransitNavigationContext *)self chromeViewController];
      id v7 = [v6 mapView];
      [v7 navigationCameraReturnToPuck];
    }
    else if ([(TransitNavigationContext *)self _shouldUseManualFraming])
    {
      id v8 = sub_10057767C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Camera returning to point-to-point framing (recenter button)", v9, 2u);
      }

      [(TransitNavigationContext *)self manuallyFrameCurrentStep];
    }
  }
}

- (id)transitVehicleUpdater:(id)a3 shouldUpdateVehiclePositionsForTripIDs:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = [(TransitNavigationContext *)self _stepForTransitVehicleUpdater];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = v6;
    id UInteger = (id)GEOConfigGetUInteger();
    id v9 = +[NSMutableSet setWithCapacity:UInteger];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    unsigned int v10 = [v7 vehicleEntries];
    id v11 = [v10 upcomingTripIDs];

    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
LABEL_5:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * v15);
        if ([v5 containsObject:v16]) {
          [v9 addObject:v16];
        }
        if ([v9 count] == UInteger) {
          break;
        }
        if (v13 == (id)++v15)
        {
          id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v13) {
            goto LABEL_5;
          }
          break;
        }
      }
    }

    id v17 = [v9 copy];
  }
  else
  {
    id v17 = +[NSSet set];
  }

  return v17;
}

- (void)transitVehicleUpdater:(id)a3 didUpdateVehiclePositions:(id)a4 forTripIDs:(id)a5
{
  unsigned __int8 v6 = [a4 allObjects];
  objc_storeStrong((id *)&self->_lastReceivedVehiclePositions, v6);
  [(TransitNavigationContext *)self _updateAnnotationsForCurrentRoute];
  if ([v6 count]
    && ![(TransitNavigationContext *)self _shouldFrameVehiclePositions])
  {
    id v7 = sub_10057767C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 134217984;
      id v10 = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Will not frame %lu vehicle positions, displayed step is not active step", (uint8_t *)&v9, 0xCu);
    }

    unsigned __int8 v6 = &__NSArray0__struct;
  }
  id v8 = [(TransitNavigationContext *)self _navCameraController];
  [v8 frameVehiclePositions:v6];
}

- (id)_stepForTransitVehicleUpdater
{
  return self->_displayedStep;
}

- (void)updateTransitVehicleUpdaterIfNeeded
{
  if (self->_transitVehicleUpdater)
  {
    id v3 = [(TransitNavigationContext *)self _stepForTransitVehicleUpdater];
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v4 = v3;
      id v5 = [v4 vehicleEntries];
      if (v5)
      {
        unsigned __int8 v6 = [v4 vehicleEntries];
        id v7 = [v6 tripIDs];
      }
      else
      {
        id v7 = &__NSArray0__struct;
      }

      id v8 = +[NSSet setWithArray:v7];
      [(GEOTransitVehicleUpdater *)self->_transitVehicleUpdater setTripIDs:v8];
    }
    else
    {
      id v4 = +[NSSet set];
      [(GEOTransitVehicleUpdater *)self->_transitVehicleUpdater setTripIDs:v4];
    }

    [(TransitNavigationContext *)self _updateAnnotationsForCurrentRoute];
    int v9 = [(GEOTransitVehicleUpdater *)self->_transitVehicleUpdater tripIDs];
    if ([v9 count]
      && ![(TransitNavigationContext *)self _shouldFrameVehiclePositions])
    {
      id v10 = sub_10057767C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Will not frame any vehicle positions, displayed step is not active step", v13, 2u);
      }

      uint64_t v11 = +[NSSet set];

      int v9 = (void *)v11;
    }
    id v12 = [(TransitNavigationContext *)self _navCameraController];
    [v12 filterVehiclePositionsForTripsNotInSet:v9];
  }
}

- (BOOL)_shouldFrameVehiclePositions
{
  id v3 = [(TransitNavigationContext *)self _stepForTransitVehicleUpdater];
  id v4 = [v3 stepIndex];

  if (v4 == [(GEOComposedRouteStep *)self->_activeStep stepIndex]) {
    return 1;
  }
  unsigned __int8 v6 = +[NSUserDefaults standardUserDefaults];
  if ([v6 BOOLForKey:@"NavigationTransitFrameVehiclePositionsForSelectedStep"]) {
    BOOL v5 = v4 == [(GEOComposedRouteStep *)self->_displayedStep stepIndex];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TransitNavigationContext *)self chromeViewController];
  unsigned __int8 v6 = [v5 view];
  id v7 = [v6 window];
  id v9 = [v7 windowScene];

  id v8 = [v4 object];

  if (v9 == v8) {
    [(TransitNavigationContext *)self _pauseOrResumeRealtimeUpdatesIfNeeded];
  }
}

- (void)_sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TransitNavigationContext *)self chromeViewController];
  unsigned __int8 v6 = [v5 view];
  id v7 = [v6 window];
  id v9 = [v7 windowScene];

  id v8 = [v4 object];

  if (v9 == v8) {
    [(TransitNavigationContext *)self _pauseOrResumeRealtimeUpdatesIfNeeded];
  }
}

- (void)startRequestingRealtimeUpdates
{
}

- (void)stopRequestingRealtimeUpdates
{
}

- (void)_pauseOrResumeRealtimeUpdatesIfNeeded
{
  if (!self->_requestingRealtimeUpdates)
  {
LABEL_5:
    if (![(TransitNavigationContext *)self _sceneInBackground])
    {
      BOOL v5 = [(TransitNavigationContext *)self chromeViewController];
      unsigned int v6 = [v5 isTopContext:self];

      if (v6)
      {
        id v7 = sub_10057767C();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v9 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Resuming realtime updates from context", v9, 2u);
        }

        self->_requestingRealtimeUpdates = 1;
        [(TransitNavigationContext *)self startRequestingRealtimeUpdates];
      }
    }
    return;
  }
  if (![(TransitNavigationContext *)self _sceneInBackground])
  {
    id v3 = [(TransitNavigationContext *)self chromeViewController];
    unsigned __int8 v4 = [v3 isTopContext:self];

    if (v4)
    {
      if (self->_requestingRealtimeUpdates) {
        return;
      }
      goto LABEL_5;
    }
  }
  id v8 = sub_10057767C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Pausing realtime updates from context", buf, 2u);
  }

  self->_requestingRealtimeUpdates = 0;
  [(TransitNavigationContext *)self stopRequestingRealtimeUpdates];
}

- (BOOL)_sceneInBackground
{
  v2 = [(TransitNavigationContext *)self chromeViewController];
  id v3 = [v2 view];
  unsigned __int8 v4 = [v3 window];
  BOOL v5 = [v4 windowScene];

  if ([v5 activationState]) {
    BOOL v6 = [v5 activationState] != (id)1;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapRowForItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 matchingRouteStepIndex];
  id v9 = [(TransitNavigationContext *)self displayedStep];
  if (v9)
  {
    id v10 = [(TransitNavigationContext *)self displayedStep];
    uint64_t v11 = (uint64_t)[v10 stepIndex];
  }
  else
  {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if ((id)v11 == v8)
  {
    [(TransitNavigationContext *)self didReselectDisplayedStep];
  }
  else
  {
    id v12 = sub_10057767C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 134218496;
      id v20 = v8;
      __int16 v21 = 2048;
      uint64_t v22 = v11;
      __int16 v23 = 2048;
      id v24 = [v6 activeComposedRouteStepIndex];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Will manually select stepIndex: %lu, previous: %lu, auto-advance: %lu", (uint8_t *)&v19, 0x20u);
    }

    id v13 = [v6 displayedItemIndex];
    uint64_t v14 = [v6 indexOfItem:v7];
    uint64_t v15 = [(TransitNavigationContext *)self currentUITargetForAnalytics];
    uint64_t v16 = +[NSNumber numberWithInteger:v14 - v13];
    id v17 = [v16 stringValue];
    uint64_t v18 = [v6 displayedItemIndexForAnalytics];
    +[GEOAPPortal captureUserAction:235 target:v15 value:v17 transitStep:v18];

    [v6 setDisplayedComposedRouteStepIndex:[v7 matchingRouteStepIndex]];
    [(TransitNavigationContext *)self canRecenterDidChange];
  }
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didUpdateDisplayedGuidanceStep:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(TransitNavigationContext *)self displayedStep];
  if (!v6
    || (id v7 = (void *)v6,
        [(TransitNavigationContext *)self displayedStep],
        id v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v8 stepIndex],
        id v10 = [v5 stepIndex],
        v8,
        v7,
        v9 != v10))
  {
    uint64_t v11 = sub_10057767C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = [(TransitNavigationContext *)self displayedStep];
      int v13 = 134218240;
      id v14 = [v12 stepIndex];
      __int16 v15 = 2048;
      id v16 = [v5 stepIndex];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Notified displayed step changed from %lu to %lu", (uint8_t *)&v13, 0x16u);
    }
    [(TransitNavigationContext *)self setDisplayedStep:v5];
    [(TransitNavigationContext *)self canRecenterDidChange];
    [(TransitNavigationContext *)self updateTransitVehicleUpdaterIfNeeded];
    [(TransitNavigationContext *)self updateFramingForCurrentStep];
  }
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didUpdateActiveGuidanceStep:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TransitNavigationContext *)self activeStep];
  if (!v8
    || (id v9 = (void *)v8,
        [(TransitNavigationContext *)self activeStep],
        id v10 = objc_claimAutoreleasedReturnValue(),
        id v11 = [v10 stepIndex],
        id v12 = [v7 stepIndex],
        v10,
        v9,
        v11 != v12))
  {
    int v13 = sub_10057767C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v14 = [(TransitNavigationContext *)self activeStep];
      int v17 = 134218240;
      id v18 = [v14 stepIndex];
      __int16 v19 = 2048;
      id v20 = [v7 stepIndex];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Notified active step changed from %lu to %lu", (uint8_t *)&v17, 0x16u);
    }
    [(TransitNavigationContext *)self setActiveStep:v7];
    [(TransitNavigationContext *)self canRecenterDidChange];
    uint64_t v15 = [(TransitNavigationContext *)self currentUITargetForAnalytics];
    id v16 = [v6 displayedItemIndexForAnalytics];
    +[GEOAPPortal captureUserAction:3066 target:v15 value:0 transitStep:v16];
  }
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapIncidentsCell:(id)a4 withAdvisory:(id)a5
{
}

- (int)currentUITargetForAnalytics
{
  return 610;
}

- (int)currentMapViewTargetForAnalytics
{
  return 505;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (GEOComposedRouteStep)activeStep
{
  return self->_activeStep;
}

- (void)setActiveStep:(id)a3
{
}

- (GEOComposedRouteStep)displayedStep
{
  return self->_displayedStep;
}

- (void)setDisplayedStep:(id)a3
{
}

- (BOOL)forceManualFraming
{
  return self->_forceManualFraming;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_lastReceivedVehiclePositions, 0);
  objc_storeStrong((id *)&self->_transitVehicleUpdater, 0);
  objc_storeStrong((id *)&self->_temporarilyFramedStep, 0);
  objc_storeStrong((id *)&self->_manualSteppingFramer, 0);
  objc_storeStrong((id *)&self->_displayedStep, 0);
  objc_storeStrong((id *)&self->_activeStep, 0);

  objc_storeStrong((id *)&self->_route, 0);
}

@end