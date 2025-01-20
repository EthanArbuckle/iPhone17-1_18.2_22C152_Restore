@interface StepModeController
- (BOOL)initializedWithUserTrackingMode;
- (BOOL)permitsLookAroundShowing;
- (BOOL)permitsWeatherShowing;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldResetStateAfterResigning;
- (BOOL)showsMapView;
- (BOOL)supportsLockscreen;
- (BOOL)updateRouteAnnotationsConfiguration:(id)a3;
- (BOOL)usesDefaultTransitions;
- (BOOL)wantsCompassLayoutControl;
- (BOOL)wantsLookAroundShowing;
- (BOOL)wantsRouteAnnotationsControl;
- (BOOL)wantsStatusBarControl;
- (BOOL)wantsWeatherShowing;
- (GEOComposedRoute)route;
- (IOSBasedChromeViewController)chromeViewController;
- (MKMapCamera)desiredInitialCamera;
- (StatusBarBackgroundViewStyle)statusBarBackgroundViewStyle;
- (StatusBarSupplementaryView)statusBarSupplementaryView;
- (StepActionCoordination)actionCoordinator;
- (StepContainerViewController)containerViewController;
- (StepModeController)initWithRoute:(id)a3 initialStepIndex:(unint64_t)a4 desiredUserTrackingMode:(id)a5;
- (id)mapViewDelegate;
- (id)personalizedItemSources;
- (id)transitionControllerForPopToMode:(id)a3;
- (id)transitionControllerForPushFromMode:(id)a3;
- (int64_t)desiredTrackingMode;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)initialStepIndex;
- (void)_becomeTopContextInChromeViewController:(id)a3;
- (void)_locationManagerApprovalDidChange:(id)a3;
- (void)_resignTopContextInChromeViewController:(id)a3;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)getCurrentSceneTitleWithCompletion:(id)a3;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setChromeViewController:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)setDesiredInitialCamera:(id)a3;
- (void)setDesiredTrackingMode:(int64_t)a3;
- (void)setInitialStepIndex:(unint64_t)a3;
- (void)setInitializedWithUserTrackingMode:(BOOL)a3;
- (void)setRoute:(id)a3;
- (void)updateWithDisplayedStep:(id)a3;
- (void)willBeginDisplayingInSecureLockScreen;
@end

@implementation StepModeController

- (StepModeController)initWithRoute:(id)a3 initialStepIndex:(unint64_t)a4 desiredUserTrackingMode:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)StepModeController;
  v11 = [(StepModeController *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_route, a3);
    v12->_initialStepIndex = a4;
    if (v10)
    {
      v12->_initializedWithUserTrackingMode = 1;
      v12->_desiredTrackingMode = (int64_t)[v10 integerValue];
    }
    if ([(GEOComposedRoute *)v12->_route transportType] == 1)
    {
      v13 = objc_alloc_init(NavigationPowerLogger);
      powerLogger = v12->_powerLogger;
      v12->_powerLogger = v13;

      [(NavigationPowerLogger *)v12->_powerLogger startLogging];
    }
  }

  return v12;
}

- (void)setDesiredInitialCamera:(id)a3
{
  v4 = (MKMapCamera *)[a3 copy];
  desiredInitialCamera = self->_desiredInitialCamera;
  self->_desiredInitialCamera = v4;
}

- (void)updateWithDisplayedStep:(id)a3
{
  id v4 = a3;
  id v5 = [(StepModeController *)self containerViewController];
  [v5 updateWithDisplayedStep:v4];
}

- (StepActionCoordination)actionCoordinator
{
  v2 = [(StepModeController *)self containerViewController];
  v3 = [v2 stepActionCoordinator];

  return (StepActionCoordination *)v3;
}

- (void)setChromeViewController:(id)a3
{
  p_chromeViewController = &self->_chromeViewController;
  id v5 = a3;
  objc_storeWeak((id *)p_chromeViewController, v5);
  [(ContainerViewController *)self->_containerViewController setChromeViewController:v5];
}

- (StepContainerViewController)containerViewController
{
  containerViewController = self->_containerViewController;
  if (!containerViewController)
  {
    BOOL initializedWithUserTrackingMode = self->_initializedWithUserTrackingMode;
    id v5 = [StepContainerViewController alloc];
    route = self->_route;
    unint64_t initialStepIndex = self->_initialStepIndex;
    if (initializedWithUserTrackingMode) {
      v8 = [(StepContainerViewController *)v5 initWithRoute:route initialStepIndex:initialStepIndex desiredTrackingMode:self->_desiredTrackingMode];
    }
    else {
      v8 = [(StepContainerViewController *)v5 initWithRoute:route initialStepIndex:initialStepIndex];
    }
    id v9 = self->_containerViewController;
    self->_containerViewController = v8;

    [(ContainerViewController *)self->_containerViewController setChromeContext:self];
    id v10 = [(StepModeController *)self chromeViewController];
    [(ContainerViewController *)self->_containerViewController setChromeViewController:v10];

    containerViewController = self->_containerViewController;
  }

  return containerViewController;
}

- (BOOL)usesDefaultTransitions
{
  return 0;
}

- (id)transitionControllerForPushFromMode:(id)a3
{
  v3 = objc_opt_new();

  return v3;
}

- (id)transitionControllerForPopToMode:(id)a3
{
  v3 = objc_opt_new();

  return v3;
}

- (id)mapViewDelegate
{
  return self->_containerViewController;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)wantsCompassLayoutControl
{
  return sub_1000BBB44(self->_containerViewController) != 5;
}

- (id)personalizedItemSources
{
  v3 = [(StepModeController *)self chromeViewController];
  id v4 = [v3 searchPinsManager];

  if (v4)
  {
    id v5 = [(StepModeController *)self chromeViewController];
    v6 = [v5 searchPinsManager];
    v7 = [v6 routeStartEndItemSource];
    id v10 = v7;
    v8 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    v8 = &__NSArray0__struct;
  }

  return v8;
}

- (BOOL)wantsRouteAnnotationsControl
{
  return 1;
}

- (BOOL)updateRouteAnnotationsConfiguration:(id)a3
{
  if (self->_route)
  {
    route = self->_route;
    id v3 = a3;
    id v4 = +[NSArray arrayWithObjects:&route count:1];
    [v3 setRoutes:v4 route];
  }
  else
  {
    id v4 = a3;
    [v4 setRoutes:0];
  }

  return 1;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100CD2628;
  v9[3] = &unk_1012E6690;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [v7 addPreparation:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_becomeTopContextInChromeViewController:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_locationManagerApprovalDidChange:" name:MKLocationManagerApprovalDidChangeNotification object:0];

  id v5 = [(StepModeController *)self chromeViewController];
  id v6 = [v5 mapView];

  [v6 setCompassEnabled:1];
  [v6 setScaleEnabled:0];
  [v6 _setLocationPropagationEnabled:0];
  [v6 _setShouldAnimatePositionWithRouteMatch:0];
  *(_OWORD *)v15 = *(_OWORD *)((char *)VKAnnotationTrackingBehaviorDefault + 1);
  *(void *)&v15[15] = VKAnnotationTrackingBehaviorDefault[2];
  char v14 = 0;
  [v6 _setUserTrackingBehavior:&v14];
  [v6 _setAlwaysShowHeadingIndicatorIfSupported:0];
  id v7 = [(StepModeController *)self actionCoordinator];
  [v6 _setShowHeadingIndicatorForStepping:[v7 isAuthorizedForPreciseLocation]];

  [v6 _setApplicationState:3];
  if ([(GEOComposedRoute *)self->_route transportType] == 1)
  {
    id v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v17 = "-[StepModeController _becomeTopContextInChromeViewController:]";
      __int16 v18 = 2080;
      v19 = "StepModeController.m";
      __int16 v20 = 1024;
      int v21 = 193;
      __int16 v22 = 2080;
      v23 = "_route.transportType != GEOTransportType_TRANSIT";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  [(GEOComposedRoute *)self->_route setManeuverDisplayEnabled:1];
  id v8 = [(StepModeController *)self chromeViewController];
  [v8 updateViewMode:0 animated:0];

  id v9 = [(StepModeController *)self chromeViewController];
  id v10 = [v9 userLocationView];

  [v10 setMode:0 animated:1];
  self->_previousHeadingIndicatorStyle = (int64_t)[v10 headingIndicatorStyle];
  [v10 setHeadingIndicatorStyle:0];
  self->_previousEnabledStatus = [v10 isEnabled];
  [v10 setEnabled:0];
  if ([(GEOComposedRoute *)self->_route transportType]) {
    [v6 setShowsTraffic:0];
  }
  if (self->_desiredInitialCamera) {
    [v6 setCamera:];
  }
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100CD2A84;
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
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:MKLocationManagerApprovalDidChangeNotification object:0];

  id v5 = [(StepModeController *)self chromeViewController];
  id v6 = [v5 mapView];

  [v6 _setLocationPropagationEnabled:1];
  [v6 _setShouldAnimatePositionWithRouteMatch:1];
  [v6 _setClearUserLocationOnLocationReset:1];
  long long v10 = *(_OWORD *)VKAnnotationTrackingBehaviorDefault;
  uint64_t v11 = VKAnnotationTrackingBehaviorDefault[2];
  [v6 _setUserTrackingBehavior:&v10];
  [v6 _setAlwaysShowHeadingIndicatorIfSupported:1];
  [v6 _setShowHeadingIndicatorForStepping:0];
  [v6 _setApplicationState:0];
  [v6 _clearRouteContext];
  if ([v6 userTrackingMode])
  {
    id v7 = +[UIApplication sharedMapsDelegate];
    [v7 setTrackingMode:0 monitorBatteryState:0];
  }
  id v8 = [(StepModeController *)self chromeViewController];
  id v9 = [v8 userLocationView];

  [v9 setHeadingIndicatorStyle:self->_previousHeadingIndicatorStyle];
  [v9 setEnabled:self->_previousEnabledStatus];
  [v6 _setShouldSplitRouteLine:0];
  [(GEOComposedRoute *)self->_route setManeuverDisplayEnabled:0];
  [(NavigationPowerLogger *)self->_powerLogger stopLogging];
}

- (void)getCurrentSceneTitleWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = [(StepModeController *)self route];
  id v6 = [v5 destination];
  id v7 = [v6 name];

  id v8 = +[NSBundle mainBundle];
  if (v7)
  {
    id v9 = [v8 localizedStringForKey:@"[App switcher title] Directions to <destination>" value:@"localized string not found" table:0];
    long long v10 = [(StepModeController *)self route];
    uint64_t v11 = [v10 destination];
    v12 = [v11 name];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = [v8 localizedStringForKey:@"[App switcher title] Directions" value:@"localized string not found" table:0];
  }

  v4[2](v4, v13);
}

- (void)_locationManagerApprovalDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100CD2E40;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)supportsLockscreen
{
  return [(GEOComposedRoute *)self->_route transportType] == 1;
}

- (void)willBeginDisplayingInSecureLockScreen
{
  id v2 = [(StepModeController *)self containerViewController];
  [v2 willBeginDisplayingInSecureLockScreen];
}

- (BOOL)shouldResetStateAfterResigning
{
  return 1;
}

- (BOOL)wantsStatusBarControl
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  id v2 = [(StepModeController *)self containerViewController];
  unsigned __int8 v3 = [v2 prefersStatusBarHidden];

  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  id v2 = [(StepModeController *)self containerViewController];
  id v3 = [v2 preferredStatusBarStyle];

  return (int64_t)v3;
}

- (StatusBarBackgroundViewStyle)statusBarBackgroundViewStyle
{
  id v2 = [(StepModeController *)self containerViewController];
  id v3 = [v2 statusBarBackgroundViewStyle];

  return (StatusBarBackgroundViewStyle *)v3;
}

- (StatusBarSupplementaryView)statusBarSupplementaryView
{
  id v2 = [(StepModeController *)self containerViewController];
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

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (IOSBasedChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (IOSBasedChromeViewController *)WeakRetained;
}

- (void)setContainerViewController:(id)a3
{
}

- (int64_t)desiredTrackingMode
{
  return self->_desiredTrackingMode;
}

- (void)setDesiredTrackingMode:(int64_t)a3
{
  self->_desiredTrackingMode = a3;
}

- (BOOL)initializedWithUserTrackingMode
{
  return self->_initializedWithUserTrackingMode;
}

- (void)setInitializedWithUserTrackingMode:(BOOL)a3
{
  self->_BOOL initializedWithUserTrackingMode = a3;
}

- (MKMapCamera)desiredInitialCamera
{
  return self->_desiredInitialCamera;
}

- (unint64_t)initialStepIndex
{
  return self->_initialStepIndex;
}

- (void)setInitialStepIndex:(unint64_t)a3
{
  self->_unint64_t initialStepIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredInitialCamera, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_route, 0);

  objc_storeStrong((id *)&self->_powerLogger, 0);
}

@end