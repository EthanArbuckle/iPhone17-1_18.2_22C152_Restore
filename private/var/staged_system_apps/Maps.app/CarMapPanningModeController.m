@interface CarMapPanningModeController
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)mapControlsConfiguration;
- (BOOL)allowKnobNudgeMapPanning;
- (BOOL)allowMapZoomAndRecentering;
- (BOOL)invalidAfterDisconnect;
- (BOOL)mapWasPanned;
- (BOOL)showsHeadingIndicator;
- (BOOL)showsMapView;
- (BOOL)showsNavigationBar;
- (BOOL)showsSpeedLimit;
- (BOOL)supportsAlternateRouteSelection;
- (CarMapPanningModeController)init;
- (ChromeViewController)chromeViewController;
- (NSArray)carFocusOrderSequences;
- (id)fullscreenViewController;
- (id)mapView;
- (int)currentUsageTarget;
- (void)_doneButtonPressed;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)carMapPanningViewControllerDidPan:(id)a3 inDirection:(int64_t)a4;
- (void)carMapPanningViewControllerDidTapDone:(id)a3;
- (void)configureNavigationDisplay:(id)a3;
- (void)layoutForUnobscuredBoundsChange;
- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setChromeViewController:(id)a3;
@end

@implementation CarMapPanningModeController

- (CarMapPanningModeController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CarMapPanningModeController;
  v2 = [(CarMapPanningModeController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CarMapPanningViewController);
    viewController = v2->_viewController;
    v2->_viewController = v3;

    [(CarMapPanningViewController *)v2->_viewController setPanDelegate:v2];
  }
  return v2;
}

- (id)mapView
{
  v2 = [(CarMapPanningModeController *)self chromeViewController];
  v3 = [v2 mapView];

  return v3;
}

- (BOOL)showsMapView
{
  return 1;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)mapControlsConfiguration
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 4;
  return self;
}

- (BOOL)showsHeadingIndicator
{
  return 1;
}

- (BOOL)showsSpeedLimit
{
  return 1;
}

- (BOOL)allowMapZoomAndRecentering
{
  return 0;
}

- (BOOL)allowKnobNudgeMapPanning
{
  return 1;
}

- (BOOL)supportsAlternateRouteSelection
{
  return 1;
}

- (id)fullscreenViewController
{
  return self->_viewController;
}

- (BOOL)showsNavigationBar
{
  return 0;
}

- (NSArray)carFocusOrderSequences
{
  v2 = [(CarMapPanningModeController *)self fullscreenViewController];
  v3 = [v2 carFocusOrderSequences];

  return (NSArray *)v3;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  p_chromeViewController = &self->_chromeViewController;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_chromeViewController);
  v8 = [WeakRetained acquireMapInsetPropagationSuspensionTokenForReason:@"CarPlay panning context"];
  id mapInsetPropagationSuspensionToken = self->_mapInsetPropagationSuspensionToken;
  self->_id mapInsetPropagationSuspensionToken = v8;

  v10 = [(CarMapPanningModeController *)self chromeViewController];
  v11 = [v10 mapView];
  [(CarMapPanningViewController *)self->_viewController setMapView:v11];

  v12 = [(CarMapPanningModeController *)self chromeViewController];
  [(CarMapPanningViewController *)self->_viewController setChromeViewController:v12];

  v13 = [(CarMapPanningModeController *)self carChromeViewController];
  v14 = [v13 nudgerizer];
  [(CarMapPanningViewController *)self->_viewController setNudgerizer:v14];

  viewController = self->_viewController;
  v16 = [(CarMapPanningViewController *)viewController nudgerizer];
  [v16 setDelegate:viewController];

  v17 = [(CarMapPanningViewController *)self->_viewController mapView];
  id v18 = [v6 isAnimated];

  [v17 setUserTrackingMode:0 animated:v18];
  v19 = [(CarMapPanningModeController *)self chromeViewController];
  v20 = [v19 mapView];
  self->_scrollWasEnabled = [v20 isScrollEnabled];

  id v22 = [(CarMapPanningModeController *)self chromeViewController];
  v21 = [v22 mapView];
  [v21 setScrollEnabled:0];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v5 = [(CarMapPanningModeController *)self carChromeViewController];
  id v6 = [v5 nudgerizer];
  [v6 setDelegate:0];

  v7 = [(CarMapPanningModeController *)self chromeViewController];
  v8 = [v7 mapView];
  [v8 setScrollEnabled:self->_scrollWasEnabled];

  id mapInsetPropagationSuspensionToken = self->_mapInsetPropagationSuspensionToken;
  self->_id mapInsetPropagationSuspensionToken = 0;
}

- (void)layoutForUnobscuredBoundsChange
{
}

- (void)configureNavigationDisplay:(id)a3
{
  id v3 = a3;
  [v3 setCameraStyle:0];
  [v3 setCameraPaused:&__kCFBooleanTrue];
}

- (BOOL)invalidAfterDisconnect
{
  return 1;
}

- (void)_doneButtonPressed
{
  id v3 = +[CarDisplayController sharedInstance];
  unsigned int v4 = [v3 isCarAppSceneHostingNavigation];

  v5 = [(CarMapPanningModeController *)self chromeViewController];
  id v6 = v5;
  if (v4) {
    uint64_t v7 = 3051;
  }
  else {
    uint64_t v7 = 4;
  }
  [v5 captureUserAction:v7];

  id v8 = +[CarChromeModeCoordinator sharedInstance];
  [v8 popFromContext:self];
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  if (!a4) {
    self->_mapWasPanned = 1;
  }
}

- (void)carMapPanningViewControllerDidPan:(id)a3 inDirection:(int64_t)a4
{
  id v6 = [(CarMapPanningModeController *)self chromeViewController];
  [v6 captureUserActionPannedInDirection:a4];

  self->_mapWasPanned = 1;
}

- (void)carMapPanningViewControllerDidTapDone:(id)a3
{
}

- (int)currentUsageTarget
{
  return 1002;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (BOOL)mapWasPanned
{
  return self->_mapWasPanned;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong(&self->_mapInsetPropagationSuspensionToken, 0);

  objc_storeStrong((id *)&self->_viewController, 0);
}

@end