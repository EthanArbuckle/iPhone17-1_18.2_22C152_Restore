@interface NavContainerViewController
- (BOOL)_bannerActionShouldDisplay;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isPresentingOverlappingContainee;
- (BOOL)_isSecondarySignVisible;
- (BOOL)_shouldShowNavRecenterButton;
- (BOOL)_shouldShowPedestrianARTeachableMomentCard;
- (BOOL)allowsDisplayOnLockScreen;
- (BOOL)canDisplayJunctionViewInfo;
- (BOOL)debugViewControllerEnabled;
- (BOOL)hasBigStatusBar;
- (BOOL)isConnectedToCarPlay;
- (BOOL)isForWalkingNav;
- (BOOL)shouldHideCard;
- (BOOL)shouldShowNavIndicators;
- (BOOL)showingTemporaryStatusBar;
- (GEOComposedRoute)route;
- (GuidanceObserver)guidanceObserver;
- (NavActionCoordinator)coordinator;
- (NavContainerBannerAction)bannerAction;
- (NavContainerResumeRouteControl)resumeRouteBanner;
- (NavContainerViewController)initWithCoordinator:(id)a3 guidanceObserver:(id)a4 platformController:(id)a5;
- (NavIdleTimeoutTimer)idleTimer;
- (NavIndicatorsViewController)indicatorsViewController;
- (NavJunctionViewController)junctionViewController;
- (NavLaneGuidanceViewController)laneGuidanceViewController;
- (NavSecondarySignViewController)secondarySignViewController;
- (NavSignListViewController)navSignViewController;
- (NavTrafficIncidentAlertCoordination)trafficIncidentAlertCoordinator;
- (NavigationDebugViewsController)debugViewsController;
- (PlatformController)platformController;
- (StatusIndicatorManager)statusIndicatorManager;
- (StatusIndicatorView)statusIndicatorView;
- (UIView)passThroughView;
- (double)_belowSignTopPosition;
- (double)_indicatorsTopPosition;
- (double)_indicatorsTrailingInset;
- (double)_junctionViewTopPosition;
- (double)_maxAvailableHeightForJunctionView;
- (double)_navSignBottomPosition;
- (double)_secondarySignTopPosition;
- (double)_usedPortraitTopSpace;
- (double)availableHeight;
- (double)availableHeightForJunctionView;
- (double)bottomEdgeInset;
- (double)edgePadding;
- (double)maxAvailableHeightForJunctionView:(double)a3;
- (double)signListHeight;
- (double)topEdgeInset;
- (id)mapView;
- (id)statusBarBackgroundViewStyle;
- (id)statusBarSupplementaryView;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredUserInterfaceStyle;
- (unint64_t)layoutForCurrentViewControllerWithStyle:(unint64_t)a3;
- (unint64_t)maxLayoutForEdgeInsetsUpdate;
- (unint64_t)originalLayoutForViewController:(id)a3;
- (unint64_t)signStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_applyConnectedToCarPlayAnimated:(BOOL)a3;
- (void)_closeBannerAction;
- (void)_containeeDidPresent:(id)a3;
- (void)_containeeLayoutDidChange:(id)a3;
- (void)_containeeLayoutWillChange:(id)a3;
- (void)_containeeWillPresent:(id)a3;
- (void)_drawSecondarySign;
- (void)_hideTemporaryStatusBar;
- (void)_navigationChromeVisibilityChanged;
- (void)_performBannerAction;
- (void)_pinSignAndIndicators;
- (void)_pressedRecenterButton;
- (void)_sceneConnectionsDidChange;
- (void)_showPedestrianARFeatureIntroTeachableMomentCardIfNecessary;
- (void)_showPedestrianARRaiseToEnterTeachableMomentCardIfNecessary;
- (void)_showTemporaryStatusBar;
- (void)_teardownViewHierarchy;
- (void)_toggleTraceControls;
- (void)_updateArrivalStateForced:(BOOL)a3;
- (void)_updateBacklightSceneEnvironmentUI;
- (void)_updateChildViewLayouts;
- (void)_updateContaineeHiddenIfNeeded;
- (void)_updateControlsHiddenAnimated:(BOOL)a3;
- (void)_updateIdleTimer;
- (void)_updateIndicatorsLayout;
- (void)_updateJunctionViewLayout;
- (void)_updateLaneGuidanceViewLayout;
- (void)_updateLayeringToSignProminent;
- (void)_updateLayeringToTrayProminent;
- (void)_updateNavSignForArrival:(BOOL)a3 forced:(BOOL)a4;
- (void)_updateNavSignLayout;
- (void)_updateRecenterButtonLayout;
- (void)_updateSecondarySignLayout;
- (void)_updateSignContainerLeadingConstraint;
- (void)_updateStatusBarIndicatorLayout;
- (void)applyTransitionWithProgress:(double)a3;
- (void)containerStyleManagerDidChangeStyle:(unint64_t)a3;
- (void)dealloc;
- (void)didTapLaneGuidance;
- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4;
- (void)enterPedestrianAR;
- (void)hideJunctionViewIfNeeded;
- (void)hideJunctionViewIfNeededAnimated:(BOOL)a3;
- (void)hideJunctionViewTemporarily;
- (void)hideStatusBarIfNeeded;
- (void)idleTimerDidTimeout:(id)a3;
- (void)insertDimmingOverlayForStaleMapEffectWithBlock:(id)a3;
- (void)mapView:(id)a3 didUpdateYaw:(double)a4;
- (void)mapViewNavigationCameraDidLeaveDefaultZoom:(id)a3;
- (void)mapViewNavigationCameraDidReturnToDefaultZoom:(id)a3;
- (void)mapViewNavigationCameraHasStartedPanning:(id)a3;
- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6;
- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4;
- (void)navigationService:(id)a3 hideJunctionViewForId:(id)a4;
- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4;
- (void)navigationService:(id)a3 showJunctionView:(id)a4;
- (void)navigationService:(id)a3 showLaneDirections:(id)a4;
- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5;
- (void)pressedEndNavigationWithSender:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)selectStep:(id)a3;
- (void)setBannerAction:(id)a3;
- (void)setBannerAction:(id)a3 animated:(BOOL)a4;
- (void)setConnectedToCarPlay:(BOOL)a3 animated:(BOOL)a4;
- (void)setCoordinator:(id)a3;
- (void)setDebugViewControllerEnabled:(BOOL)a3;
- (void)setDebugViewsController:(id)a3;
- (void)setIdleTimer:(id)a3;
- (void)setIndicatorsViewController:(id)a3;
- (void)setJunctionViewController:(id)a3;
- (void)setLaneGuidanceViewController:(id)a3;
- (void)setNavSignViewController:(id)a3;
- (void)setPlatformController:(id)a3;
- (void)setResumeRouteBannerHidden:(BOOL)a3;
- (void)setRoute:(id)a3;
- (void)setSecondarySignViewController:(id)a3;
- (void)setShowingTemporaryStatusBar:(BOOL)a3;
- (void)setSignListHeight:(double)a3;
- (void)setSignStyle:(unint64_t)a3;
- (void)setStatusIndicatorManager:(id)a3;
- (void)setStatusIndicatorView:(id)a3;
- (void)showJunctionViewIfNeeded;
- (void)signListHeightWillChangeAnimated:(BOOL)a3;
- (void)statusBarHeightChanged;
- (void)statusIndicatorTypeChanged:(unint64_t)a3;
- (void)suppressTransitionsOfContainee:(id)a3;
- (void)switchToOverviewMode;
- (void)switchToZoomedInMode;
- (void)toggleHeadingMode;
- (void)toggleTemporaryStatusBar;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateLaneGuidanceBackgroundColor;
- (void)updateLayoutAnimated:(BOOL)a3;
- (void)updateStatusBarColor;
- (void)updatedLaneGuidanceHeight:(double)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToParent;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)vlfContaineeViewControllerDidDisappearNotification:(id)a3;
- (void)vlfSessionTaskWillShowVLFUINotification:(id)a3;
- (void)willBeginDisplayingInSecureLockScreen;
- (void)willDismissNavigationAnimated:(BOOL)a3;
- (void)willDisplayJunctionViewInfo:(id)a3;
- (void)willHideJunctionView;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation NavContainerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NavContainerViewController)initWithCoordinator:(id)a3 guidanceObserver:(id)a4 platformController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)NavContainerViewController;
  v11 = [(ContainerViewController *)&v24 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_guidanceObserver, a4);
    v12->_signStyle = 1;
    objc_storeStrong((id *)&v12->_platformController, a5);
    [(NavContainerViewController *)v12 setCoordinator:v8];
    v13 = sub_1005F9AF4();
    [(OverlayContainerViewController *)v12 setDimmingBehaviour:v13];

    v14 = [[StatusIndicatorManager alloc] initWithDelegate:v12];
    [(NavContainerViewController *)v12 setStatusIndicatorManager:v14];

    v15 = +[MapsLightLevelController sharedController];
    [v15 addObserver:v12];

    v16 = +[MNNavigationService sharedService];
    [v16 registerObserver:v12];

    if (GEOConfigGetBOOL())
    {
      v17 = +[NSNotificationCenter defaultCenter];
      [v17 addObserver:v12 selector:"_updateBacklightSceneEnvironmentUI" name:@"NavContainerShouldUpdateBacklightSceneEnvironmentNotification" object:0];
    }
    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v12 selector:"vlfSessionTaskWillShowVLFUINotification:" name:@"VLFSessionTaskWillShowVLFUINotification" object:0];

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v12 selector:"vlfContaineeViewControllerDidDisappearNotification:" name:off_1015F7850 object:0];

    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v12 selector:"statusBarHeightChanged" name:@"IOSBasedChromeStatusBarHeightDidUpdateNotification" object:0];

    uint64_t v21 = [(PlatformController *)v12->_platformController pedestrianARSessionStateManager];
    pedestrianARSessionStateManager = v12->_pedestrianARSessionStateManager;
    v12->_pedestrianARSessionStateManager = (PedestrianARSessionStateManager *)v21;
  }
  return v12;
}

- (void)dealloc
{
  v3 = +[MapsLightLevelController sharedController];
  [v3 removeObserver:self];

  if (self->_observingCollapsedHeight)
  {
    v4 = [(NavContainerViewController *)self navSignViewController];
    v5 = NSStringFromSelector("collapsedHeight");
    [v4 removeObserver:self forKeyPath:v5];
  }
  v6.receiver = self;
  v6.super_class = (Class)NavContainerViewController;
  [(NavContainerViewController *)&v6 dealloc];
}

- (NavLaneGuidanceViewController)laneGuidanceViewController
{
  laneGuidanceViewController = self->_laneGuidanceViewController;
  if (!laneGuidanceViewController)
  {
    v4 = [[NavLaneGuidanceViewController alloc] initWithDelegate:self blurGroup:@"NavSignBlur"];
    v5 = self->_laneGuidanceViewController;
    self->_laneGuidanceViewController = v4;

    laneGuidanceViewController = self->_laneGuidanceViewController;
  }

  return laneGuidanceViewController;
}

- (NavSignListViewController)navSignViewController
{
  navSignViewController = self->_navSignViewController;
  if (!navSignViewController)
  {
    v4 = [[NavSignListViewController alloc] initWithSignDelegate:self];
    v5 = self->_navSignViewController;
    self->_navSignViewController = v4;

    navSignViewController = self->_navSignViewController;
  }

  return navSignViewController;
}

- (void)insertDimmingOverlayForStaleMapEffectWithBlock:(id)a3
{
  if (self->_isArrivalState)
  {
    id v5 = a3;
    objc_super v6 = [(NavContainerViewController *)self view];
    (*((void (**)(id, void *))a3 + 2))(v5, v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    id v8 = [(NavIndicatorsViewController *)self->_indicatorsViewController speedLimitView];
    id v9 = [v8 superview];

    id v10 = sub_10000AF10();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v11)
      {
        v12 = [(NavIndicatorsViewController *)self->_indicatorsViewController speedLimitView];
        int v16 = 138543618;
        id v17 = v7;
        __int16 v18 = 2114;
        v19 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Inserting %{public}@ below %{public}@", (uint8_t *)&v16, 0x16u);
      }
      v13 = [(NavContainerViewController *)self view];
      v14 = [(NavIndicatorsViewController *)self->_indicatorsViewController speedLimitView];
      [v13 insertSubview:v7 belowSubview:v14];
    }
    else
    {
      if (v11)
      {
        int v16 = 138543362;
        id v17 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Inserting %{public}@", (uint8_t *)&v16, 0xCu);
      }

      v13 = [(NavContainerViewController *)self view];
      [v13 addSubview:v7];
    }
  }
  else
  {
    indicatorsViewController = self->_indicatorsViewController;
    id v7 = a3;
    [(NavIndicatorsViewController *)indicatorsViewController insertDimmingOverlayForStaleMapEffectWithBlock:v7];
  }
}

- (NavJunctionViewController)junctionViewController
{
  junctionViewController = self->_junctionViewController;
  if (!junctionViewController)
  {
    v4 = (NavJunctionViewController *)objc_opt_new();
    id v5 = self->_junctionViewController;
    self->_junctionViewController = v4;

    [(NavJunctionViewController *)self->_junctionViewController setDelegate:self];
    junctionViewController = self->_junctionViewController;
  }

  return junctionViewController;
}

- (NavSecondarySignViewController)secondarySignViewController
{
  secondarySignViewController = self->_secondarySignViewController;
  if (!secondarySignViewController)
  {
    v4 = (NavSecondarySignViewController *)objc_opt_new();
    id v5 = self->_secondarySignViewController;
    self->_secondarySignViewController = v4;

    secondarySignViewController = self->_secondarySignViewController;
  }

  return secondarySignViewController;
}

- (NavIndicatorsViewController)indicatorsViewController
{
  indicatorsViewController = self->_indicatorsViewController;
  if (!indicatorsViewController)
  {
    v4 = [NavIndicatorsViewController alloc];
    id v5 = [(NavContainerViewController *)self platformController];
    objc_super v6 = [v5 pedestrianARSessionStateManager];
    id v7 = [(NavIndicatorsViewController *)v4 initWithDelegate:self pedestrianARSessionStateManager:v6];
    id v8 = self->_indicatorsViewController;
    self->_indicatorsViewController = v7;

    indicatorsViewController = self->_indicatorsViewController;
  }

  return indicatorsViewController;
}

- (NavTrafficIncidentAlertCoordination)trafficIncidentAlertCoordinator
{
  v2 = [(NavContainerViewController *)self coordinator];
  v3 = [v2 trafficIncidentAlertCoordinator];

  return (NavTrafficIncidentAlertCoordination *)v3;
}

- (id)mapView
{
  v2 = [(ContainerViewController *)self chromeViewController];
  v3 = [v2 mapView];

  return v3;
}

- (BOOL)allowsDisplayOnLockScreen
{
  return 1;
}

- (BOOL)hasBigStatusBar
{
  v2 = [(NavContainerViewController *)self view];
  [v2 safeAreaInsets];
  BOOL v4 = v3 > 40.0;

  return v4;
}

- (void)_showTemporaryStatusBar
{
  if (![(NavContainerViewController *)self hasBigStatusBar])
  {
    [(NavContainerViewController *)self setShowingTemporaryStatusBar:1];
    double v3 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_hideTemporaryStatusBar" selector:0 userInfo:0 repeats:5.0];
    temporaryStatusBarHidingTimer = self->_temporaryStatusBarHidingTimer;
    self->_temporaryStatusBarHidingTimer = v3;

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100D946F4;
    v5[3] = &unk_1012E5D08;
    v5[4] = self;
    +[UIView animateWithDuration:v5 animations:0.25];
  }
}

- (void)_hideTemporaryStatusBar
{
  if (![(NavContainerViewController *)self hasBigStatusBar])
  {
    [(NavContainerViewController *)self setShowingTemporaryStatusBar:0];
    [(NSTimer *)self->_temporaryStatusBarHidingTimer invalidate];
    temporaryStatusBarHidingTimer = self->_temporaryStatusBarHidingTimer;
    self->_temporaryStatusBarHidingTimer = 0;

    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100D94838;
    v4[3] = &unk_1012E5D08;
    v4[4] = self;
    +[UIView animateWithDuration:v4 animations:0.25];
  }
}

- (void)toggleTemporaryStatusBar
{
  if ([(NavContainerViewController *)self showingTemporaryStatusBar])
  {
    [(NavContainerViewController *)self _hideTemporaryStatusBar];
  }
  else
  {
    [(NavContainerViewController *)self _showTemporaryStatusBar];
  }
}

- (void)hideStatusBarIfNeeded
{
  if ([(NavContainerViewController *)self showingTemporaryStatusBar])
  {
    [(NavContainerViewController *)self _hideTemporaryStatusBar];
  }
}

- (void)statusBarHeightChanged
{
  double v3 = [(NavContainerViewController *)self navSignViewController];
  [v3 updateFooterConstraints];

  id v4 = [(NavContainerViewController *)self view];
  [v4 layoutIfNeeded];
}

- (int64_t)preferredStatusBarStyle
{
  if (!self->_vlfActive)
  {
    id v4 = +[UIDevice currentDevice];
    if ([v4 userInterfaceIdiom] != (id)1)
    {
      id v5 = +[UIDevice currentDevice];
      if ([v5 userInterfaceIdiom] != (id)5)
      {
        unint64_t v6 = [(ContainerViewController *)self containerStyle];
        if (v6 <= 7
          && ((1 << v6) & 0xE3) != 0
          && (id)[(ContainerViewController *)self containerStyle] != (id)7)
        {
          if (!self->_isArrivalState)
          {

            int64_t v2 = 1;
            goto LABEL_11;
          }
          BOOL connectedToCarPlay = self->_connectedToCarPlay;

          if (connectedToCarPlay) {
            return 1;
          }
LABEL_10:
          id v4 = [(NavContainerViewController *)self theme];
          int64_t v2 = (int64_t)[v4 statusBarStyle];
LABEL_11:

          return v2;
        }
      }
    }
    goto LABEL_10;
  }
  return 0;
}

- (id)statusBarBackgroundViewStyle
{
  if (self->_vlfActive) {
    goto LABEL_9;
  }
  double v3 = +[UIDevice currentDevice];
  if ([v3 userInterfaceIdiom] == (id)1) {
    goto LABEL_8;
  }
  id v4 = +[UIDevice currentDevice];
  if ([v4 userInterfaceIdiom] == (id)5
    || (unint64_t v5 = [(ContainerViewController *)self containerStyle], v5 > 7)
    || ((1 << v5) & 0xE3) == 0
    || (id)[(ContainerViewController *)self containerStyle] == (id)7)
  {

LABEL_8:
LABEL_9:
    unint64_t v6 = +[StatusBarBackgroundViewStyle defaultBlurredStyleWithDefaultColorProvider:&stru_1012F7D48];
    goto LABEL_10;
  }
  if (self->_isArrivalState)
  {
    BOOL connectedToCarPlay = self->_connectedToCarPlay;

    if (!connectedToCarPlay) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  unint64_t v6 = [[StatusBarBackgroundViewStyle alloc] initWithBlurStyle:19 groupName:@"NavSignBlur" defaultColorProvider:&stru_101323D38 disableBlur:1];
LABEL_10:

  return v6;
}

- (void)updateStatusBarColor
{
  double v3 = [(NavContainerViewController *)self traitCollection];
  unsigned __int8 v4 = [v3 isLuminanceReduced];

  if (v4) {
    return;
  }
  unint64_t v5 = [(NavContainerViewController *)self laneGuidanceViewController];
  if ([v5 hasLaneGuidance])
  {

LABEL_5:
    id v8 = sub_10082634C();
    id v9 = [(NavContainerViewController *)self navSignViewController];
    [v9 layoutProgress];
    id v19 = [v8 colorWithAlphaComponent:v10 * 0.239999995];
    goto LABEL_6;
  }
  unint64_t v6 = [(NavContainerViewController *)self navSignViewController];
  unsigned int v7 = [v6 hasElevationGraph];

  if (v7) {
    goto LABEL_5;
  }
  v12 = [(NavContainerViewController *)self navSignViewController];
  [v12 activeStepFadeIn];
  double v14 = v13;

  if (v14 <= 0.0)
  {
    id v19 = 0;
    goto LABEL_7;
  }
  id v8 = sub_10082634C();
  id v9 = [(NavContainerViewController *)self navSignViewController];
  [v9 layoutProgress];
  double v16 = v15 * 0.239999995;
  id v17 = [(NavContainerViewController *)self navSignViewController];
  [v17 activeStepFadeIn];
  id v19 = [v8 colorWithAlphaComponent:v16 * v18];

LABEL_6:
LABEL_7:
  BOOL v11 = [(NavContainerViewController *)self iosBasedChromeViewController];
  [v11 setStatusBarAdditionalColor:v19];
}

- (void)updateLaneGuidanceBackgroundColor
{
  double v3 = [(NavContainerViewController *)self traitCollection];
  unsigned __int8 v4 = [v3 isLuminanceReduced];

  if ((v4 & 1) == 0)
  {
    id v8 = [(NavContainerViewController *)self navSignViewController];
    [v8 layoutProgress];
    double v6 = v5;
    unsigned int v7 = [(NavContainerViewController *)self laneGuidanceViewController];
    [v7 setLayoutProgress:v6];
  }
}

- (void)viewDidLoad
{
  v140.receiver = self;
  v140.super_class = (Class)NavContainerViewController;
  [(OverlayContainerViewController *)&v140 viewDidLoad];
  +[CATransaction setFrameStallSkipRequest:1];
  double v3 = [(NavContainerViewController *)self laneGuidanceViewController];
  unsigned __int8 v4 = [v3 view];

  double v5 = [(NavContainerViewController *)self laneGuidanceViewController];
  [(ContainerViewController *)self addChildViewController:v5];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v6 = [v4 heightAnchor];
  unsigned int v7 = [v6 constraintEqualToConstant:0.0];
  laneGuidanceHeightConstraint = self->_laneGuidanceHeightConstraint;
  self->_laneGuidanceHeightConstraint = v7;

  id v9 = [(NavContainerViewController *)self laneGuidanceViewController];
  [v9 didMoveToParentViewController:self];

  double v10 = [v4 layer];
  [v10 setCornerRadius:10.0];

  BOOL v11 = [(NavContainerViewController *)self navSignViewController];
  v12 = [v11 view];

  double v13 = [(NavContainerViewController *)self navSignViewController];
  [(ContainerViewController *)self addChildViewController:v13];

  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v14 = [(NavContainerViewController *)self navSignViewController];
  [v14 didMoveToParentViewController:self];

  self->_observingCollapsedHeight = 1;
  double v15 = [(NavContainerViewController *)self navSignViewController];
  double v16 = NSStringFromSelector("collapsedHeight");
  [v15 addObserver:self forKeyPath:v16 options:1 context:0];

  id v17 = [(ContainerViewController *)self containerStyleManager];
  [v17 containerWidth];
  double v19 = v18;
  v20 = [(NavContainerViewController *)self navSignViewController];
  [v20 setCardWidth:v19];

  uint64_t v21 = [(NavContainerViewController *)self secondarySignViewController];
  v22 = [v21 view];

  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  v23 = [(NavContainerViewController *)self secondarySignViewController];
  [(ContainerViewController *)self addChildViewController:v23];

  objc_super v24 = [(NavContainerViewController *)self secondarySignViewController];
  [v24 didMoveToParentViewController:self];

  v25 = v22;
  v26 = [v22 layer];
  [v26 setCornerRadius:10.0];

  v27 = [(NavContainerViewController *)self junctionViewController];
  v28 = [v27 view];

  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v28 setHidden:1];
  v29 = [(NavContainerViewController *)self junctionViewController];
  [(ContainerViewController *)self addChildViewController:v29];

  v30 = [(NavContainerViewController *)self junctionViewController];
  [v30 didMoveToParentViewController:self];

  v139 = v28;
  v31 = [v28 layer];
  [v31 setCornerRadius:10.0];

  v32 = [(NavContainerViewController *)self indicatorsViewController];
  v33 = [v32 view];

  v137 = v33;
  [v33 setTranslatesAutoresizingMaskIntoConstraints:0];
  v34 = [(NavContainerViewController *)self indicatorsViewController];
  [(ContainerViewController *)self addChildViewController:v34];

  v35 = [(NavContainerViewController *)self indicatorsViewController];
  [v35 didMoveToParentViewController:self];

  v36 = [(NavContainerViewController *)self statusIndicatorManager];
  [v36 updateIndicatorType];

  v37 = (UIButton *)objc_opt_new();
  recenterButton = self->_recenterButton;
  self->_recenterButton = v37;

  [(UIButton *)self->_recenterButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v39 = +[UIButtonConfiguration borderlessButtonConfiguration];
  v40 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:22.0];
  [v39 setPreferredSymbolConfigurationForImage:v40];

  v41 = +[UIColor colorNamed:@"NavigationMaterialColor"];
  v42 = [v39 background];
  [v42 setBackgroundColor:v41];

  v43 = [v39 background];
  [v43 setCornerRadius:30.0];

  [v39 setCornerStyle:-1];
  v44 = +[UIImage systemImageNamed:@"location.fill"];
  [v39 setImage:v44];

  v45 = +[UIColor systemBlueColor];
  [(UIButton *)self->_recenterButton setTintColor:v45];

  v46 = +[NSBundle mainBundle];
  v47 = [v46 localizedStringForKey:@"[Navigation] Recenter" value:@"localized string not found" table:0];
  [(UIButton *)self->_recenterButton setAccessibilityLabel:v47];

  [(UIButton *)self->_recenterButton addTarget:self action:"_pressedRecenterButton" forControlEvents:64];
  v48 = [(UIButton *)self->_recenterButton layer];
  [v48 setCornerRadius:30.0];

  v49 = [(UIButton *)self->_recenterButton layer];
  LODWORD(v50) = 1045220557;
  [v49 setShadowOpacity:v50];

  double height = CGSizeZero.height;
  v52 = [(UIButton *)self->_recenterButton layer];
  [v52 setShadowOffset:CGSizeZero.width, height];

  v53 = [(UIButton *)self->_recenterButton layer];
  [v53 setShadowRadius:1.0];

  v54 = [(UIButton *)self->_recenterButton layer];
  [v54 setShadowPathIsBounds:1];

  -[UIButton _setTouchInsets:](self->_recenterButton, "_setTouchInsets:", -8.0, -16.0, -8.0, -16.0);
  [(UIButton *)self->_recenterButton setAccessibilityIdentifier:@"RecenterButton"];
  v136 = v39;
  [(UIButton *)self->_recenterButton setConfiguration:v39];
  v55 = [(NavContainerViewController *)self view];
  [v55 insertSubview:self->_recenterButton atIndex:0];

  v56 = -[NavContainerResumeRouteControl initWithFrame:]([NavContainerResumeRouteControl alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  resumeRouteBanner = self->_resumeRouteBanner;
  self->_resumeRouteBanner = v56;

  v58 = [(NavContainerViewController *)self resumeRouteBanner];
  [v58 setTranslatesAutoresizingMaskIntoConstraints:0];

  v59 = [(NavContainerViewController *)self resumeRouteBanner];
  [v59 addTarget:self action:"_performBannerAction" forControlEvents:64];

  v60 = [(NavContainerViewController *)self resumeRouteBanner];
  [v60 addTarget:self action:"_closeBannerAction" forControlEvents:0x1000000];

  v61 = +[GEOPlatform sharedPlatform];
  LODWORD(v47) = [v61 isInternalInstall];

  if (v47)
  {
    v62 = +[NSNotificationCenter defaultCenter];
    [v62 addObserver:self selector:"_navigationChromeVisibilityChanged" name:@"__internal__hideChromeInNavigation" object:0];
  }
  v63 = +[NSNotificationCenter defaultCenter];
  [v63 addObserver:self selector:"_containeeLayoutWillChange:" name:@"ContainerWillChangeLayoutNotification" object:0];

  v64 = +[NSNotificationCenter defaultCenter];
  [v64 addObserver:self selector:"_containeeLayoutDidChange:" name:@"ContainerDidChangeLayoutNotification" object:0];

  v65 = +[NSNotificationCenter defaultCenter];
  [v65 addObserver:self selector:"_containeeWillPresent:" name:@"ContainerWillPresentContaineeNotification" object:0];

  v66 = +[NSNotificationCenter defaultCenter];
  [v66 addObserver:self selector:"_containeeDidPresent:" name:@"ContainerDidPresentContaineeNotification" object:0];

  v67 = (UIView *)objc_opt_new();
  navSignContainerView = self->_navSignContainerView;
  self->_navSignContainerView = v67;

  [(UIView *)self->_navSignContainerView setAccessibilityIdentifier:@"NavSignContainerView"];
  [(UIView *)self->_navSignContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_navSignContainerView setClipsToBounds:1];
  v69 = self->_navSignContainerView;
  v70 = [(NavContainerViewController *)self secondarySignViewController];
  v71 = [v70 view];
  [(UIView *)v69 addSubview:v71];

  v72 = self->_navSignContainerView;
  v73 = [(NavContainerViewController *)self junctionViewController];
  v74 = [v73 view];
  [(UIView *)v72 addSubview:v74];

  [(UIView *)self->_navSignContainerView addSubview:v12];
  [(UIView *)self->_navSignContainerView addSubview:v4];
  v75 = [v12 topAnchor];
  v76 = [(UIView *)self->_navSignContainerView topAnchor];
  v77 = [v75 constraintEqualToAnchor:v76];
  signTopConstraint = self->_signTopConstraint;
  self->_signTopConstraint = v77;

  v138 = v25;
  v79 = [v25 topAnchor];
  v80 = [(UIView *)self->_navSignContainerView topAnchor];
  v81 = [v79 constraintEqualToAnchor:v80];
  secondarySignTopConstraint = self->_secondarySignTopConstraint;
  self->_secondarySignTopConstraint = v81;

  v83 = [v139 topAnchor];
  v84 = [(UIView *)self->_navSignContainerView topAnchor];
  v85 = [v83 constraintEqualToAnchor:v84];
  junctionViewTopConstraint = self->_junctionViewTopConstraint;
  self->_junctionViewTopConstraint = v85;

  v134 = [v4 leadingAnchor];
  v132 = [(UIView *)self->_navSignContainerView leadingAnchor];
  v131 = [v134 constraintEqualToAnchor:v132];
  v141[0] = v131;
  v133 = v4;
  v130 = [v4 trailingAnchor];
  v129 = [(UIView *)self->_navSignContainerView trailingAnchor];
  v128 = [v130 constraintEqualToAnchor:v129];
  v141[1] = v128;
  v127 = [v4 topAnchor];
  v125 = [(UIView *)self->_navSignContainerView topAnchor];
  v124 = [v127 constraintEqualToAnchor:v125];
  v87 = self->_laneGuidanceHeightConstraint;
  v141[2] = v124;
  v141[3] = v87;
  v135 = [v12 leadingAnchor];
  v123 = [(UIView *)self->_navSignContainerView leadingAnchor];
  v122 = [v135 constraintEqualToAnchor:v123];
  v141[4] = v122;
  v126 = v12;
  v121 = [v12 widthAnchor];
  v120 = [(UIView *)self->_navSignContainerView widthAnchor];
  v119 = [v121 constraintEqualToAnchor:v120];
  v88 = self->_signTopConstraint;
  v141[5] = v119;
  v141[6] = v88;
  v118 = [v12 bottomAnchor];
  v117 = [(UIView *)self->_navSignContainerView bottomAnchor];
  v116 = [v118 constraintEqualToAnchor:v117];
  v141[7] = v116;
  v115 = [v25 leadingAnchor];
  v114 = [(UIView *)self->_navSignContainerView leadingAnchor];
  v113 = [v115 constraintEqualToAnchor:v114];
  v141[8] = v113;
  v112 = [v25 trailingAnchor];
  v111 = [(UIView *)self->_navSignContainerView trailingAnchor];
  v110 = [v112 constraintEqualToAnchor:v111];
  v89 = self->_secondarySignTopConstraint;
  v141[9] = v110;
  v141[10] = v89;
  v109 = [v139 leadingAnchor];
  v108 = [(UIView *)self->_navSignContainerView leadingAnchor];
  v107 = [v109 constraintEqualToAnchor:v108];
  v141[11] = v107;
  v106 = [v139 trailingAnchor];
  v105 = [(UIView *)self->_navSignContainerView trailingAnchor];
  v104 = [v106 constraintEqualToAnchor:v105];
  v90 = self->_junctionViewTopConstraint;
  v141[12] = v104;
  v141[13] = v90;
  v102 = [(UIButton *)self->_recenterButton leadingAnchor];
  v103 = [(OverlayContainerViewController *)self innerLayoutGuide];
  v101 = [v103 leadingAnchor];
  v91 = [v102 constraintEqualToAnchor:v101];
  v141[14] = v91;
  v92 = [(UIButton *)self->_recenterButton bottomAnchor];
  v93 = [(OverlayContainerViewController *)self innerLayoutGuide];
  v94 = [v93 bottomAnchor];
  v95 = [v92 constraintEqualToAnchor:v94];
  v141[15] = v95;
  v96 = [(UIButton *)self->_recenterButton widthAnchor];
  v97 = [v96 constraintEqualToConstant:60.0];
  v141[16] = v97;
  v98 = [(UIButton *)self->_recenterButton heightAnchor];
  v99 = [v98 constraintEqualToConstant:60.0];
  v141[17] = v99;
  v100 = +[NSArray arrayWithObjects:v141 count:18];
  +[NSLayoutConstraint activateConstraints:v100];
}

- (void)viewDidMoveToParent
{
  [(NavContainerViewController *)self _teardownViewHierarchy];
  self->_layoutSetup = 1;
  double v3 = [(ContainerViewController *)self containerStyleManager];
  [v3 containerWidth];
  double v5 = v4;
  double v6 = [(NavContainerViewController *)self navSignViewController];
  [v6 setCardWidth:v5];

  unsigned int v7 = [(NavContainerViewController *)self indicatorsViewController];
  id v8 = [v7 view];

  id v9 = [v8 topAnchor];
  double v10 = [(ContainerViewController *)self chromeViewController];
  BOOL v11 = [v10 viewportLayoutGuide];
  v12 = [v11 topAnchor];
  double v13 = [v9 constraintEqualToAnchor:v12];
  portraitIndicatorsTopConstraint = self->_portraitIndicatorsTopConstraint;
  self->_portraitIndicatorsTopConstraint = v13;

  v49 = [v8 leadingAnchor];
  v51 = [(NavContainerViewController *)self view];
  v47 = [v51 safeAreaLayoutGuide];
  v46 = [v47 leadingAnchor];
  v45 = [v49 constraintEqualToAnchor:v46];
  v56[0] = v45;
  v53 = v8;
  double v15 = [v8 trailingAnchor];
  double v16 = [(NavContainerViewController *)self view];
  id v17 = [v16 safeAreaLayoutGuide];
  double v18 = [v17 trailingAnchor];
  double v19 = [v15 constraintEqualToAnchor:v18];
  v20 = self->_portraitIndicatorsTopConstraint;
  v56[1] = v19;
  v56[2] = v20;
  uint64_t v21 = [v8 bottomAnchor];
  v22 = [(NavContainerViewController *)self view];
  v23 = [v22 bottomAnchor];
  objc_super v24 = [v21 constraintEqualToAnchor:v23];
  v56[3] = v24;
  v25 = +[NSArray arrayWithObjects:v56 count:4];
  portraitIndicatorsConstraints = self->_portraitIndicatorsConstraints;
  self->_portraitIndicatorsConstraints = v25;

  v27 = [v53 trailingAnchor];
  v28 = [(NavContainerViewController *)self view];
  v29 = [v28 safeAreaLayoutGuide];
  v30 = [v29 trailingAnchor];
  v31 = [v27 constraintEqualToAnchor:v30];
  landscapeIndicatorsTrailingConstraint = self->_landscapeIndicatorsTrailingConstraint;
  self->_landscapeIndicatorsTrailingConstraint = v31;

  v52 = [v53 leadingAnchor];
  double v50 = [(UIView *)self->_navSignContainerView trailingAnchor];
  v48 = [v52 constraintEqualToAnchor:v50];
  v33 = self->_landscapeIndicatorsTrailingConstraint;
  v55[0] = v48;
  v55[1] = v33;
  v34 = [v53 topAnchor];
  v35 = [(ContainerViewController *)self chromeViewController];
  v36 = [v35 viewportLayoutGuide];
  v37 = [v36 topAnchor];
  v38 = [v34 constraintEqualToAnchor:v37];
  v55[2] = v38;
  v39 = [v53 bottomAnchor];
  v40 = [(NavContainerViewController *)self view];
  v41 = [v40 bottomAnchor];
  v42 = [v39 constraintEqualToAnchor:v41];
  v55[3] = v42;
  v43 = +[NSArray arrayWithObjects:v55 count:4];
  landscapeIndicatorsConstraints = self->_landscapeIndicatorsConstraints;
  self->_landscapeIndicatorsConstraints = v43;

  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_100D96238;
  v54[3] = &unk_1012E5D08;
  v54[4] = self;
  +[UIView performWithoutAnimation:v54];
  [(NavContainerViewController *)self setNeedsStatusBarAppearanceUpdate];
  [(NavContainerViewController *)self _updateArrivalStateForced:1];
}

- (void)_teardownViewHierarchy
{
  [(UIView *)self->_navSignContainerView removeFromSuperview];
  double v3 = [(NavContainerViewController *)self indicatorsViewController];
  double v4 = [v3 view];
  [v4 removeFromSuperview];

  self->_layoutSetup = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NavContainerViewController;
  -[ContainerViewController viewWillAppear:](&v8, "viewWillAppear:");
  double v5 = [(NavContainerViewController *)self iosBasedChromeViewController];
  [v5 setNeedsUpdateComponent:@"statusBarStyle" animated:v3];

  double v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_sceneConnectionsDidChange" name:UISceneWillConnectNotification object:0];

  unsigned int v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"_sceneConnectionsDidChange" name:UISceneDidDisconnectNotification object:0];

  [(NavContainerViewController *)self setConnectedToCarPlay:+[UIApplication _maps_isAnySceneConnectedForRole:_UIWindowSceneSessionRoleCarPlay] animated:0];
  [(NavContainerViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (void)viewDidAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)NavContainerViewController;
  [(OverlayContainerViewController *)&v16 viewDidAppear:a3];
  double v4 = [(NavContainerViewController *)self coordinator];
  [v4 presentWithContainerViewController:self];

  [(NavContainerViewController *)self setDebugViewControllerEnabled:1];
  [(NavContainerViewController *)self _updateIdleTimer];
  if ([(NavContainerViewController *)self isForWalkingNav])
  {
    if (self->_pedestrianARFeatureIntroTeachableMomentTimer
      || !+[PedestrianARFeatureIntroTeachableMomentContaineeViewController shouldShowTeachableMoment])
    {
      objc_initWeak(&location, self);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100D96694;
      block[3] = &unk_1012E6708;
      objc_copyWeak(&v12, &location);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      double v10 = &v12;
    }
    else
    {
      objc_initWeak(&location, self);
      GEOConfigGetDouble();
      double v6 = v5;
      id v7 = &_dispatch_main_q;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100D96654;
      v13[3] = &unk_1012E7638;
      objc_copyWeak(&v14, &location);
      objc_super v8 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v13 block:v6];
      pedestrianARFeatureIntroTeachableMomentTimer = self->_pedestrianARFeatureIntroTeachableMomentTimer;
      self->_pedestrianARFeatureIntroTeachableMomentTimer = v8;

      double v10 = &v14;
    }
    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }
  [(NavContainerViewController *)self _updateContaineeHiddenIfNeeded];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NavContainerViewController;
  [(ContainerViewController *)&v6 viewDidDisappear:a3];
  [(NavContainerViewController *)self setDebugViewControllerEnabled:0];
  [(NavContainerViewController *)self setIdleTimer:0];
  [(GCDTimer *)self->_pedestrianARFeatureIntroTeachableMomentTimer invalidate];
  temporaryStatusBarHidingTimer = self->_temporaryStatusBarHidingTimer;
  if (temporaryStatusBarHidingTimer)
  {
    [(NSTimer *)temporaryStatusBarHidingTimer invalidate];
    double v5 = self->_temporaryStatusBarHidingTimer;
    self->_temporaryStatusBarHidingTimer = 0;
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NavContainerViewController;
  id v6 = a3;
  [(ContainerViewController *)&v8 willTransitionToTraitCollection:v6 withTransitionCoordinator:a4];
  id v7 = [(NavContainerViewController *)self coordinator];
  [v7 updateCameraForTraits:v6 containerStyle:[self containerStyle]];

  [(NavContainerViewController *)self _updateChildViewLayouts];
  [(NavContainerViewController *)self setShowingTemporaryStatusBar:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)NavContainerViewController;
  id v7 = a4;
  -[OverlayContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100D968D8;
  v8[3] = &unk_1012E81F8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)_updateSignContainerLeadingConstraint
{
  BOOL v3 = [(NavContainerViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;

  if (v5 <= 0.0)
  {
    v34 = [(NavContainerViewController *)self view];
    v35 = [v34 traitCollection];
    id v36 = [v35 verticalSizeClass];

    v37 = [(NavContainerViewController *)self view];
    v38 = [v37 traitCollection];
    id v39 = [v38 horizontalSizeClass];

    double v40 = 10.0;
    if (v39 == (id)1) {
      double v40 = 0.0;
    }
    if (v36 == (id)1) {
      double v30 = 8.0;
    }
    else {
      double v30 = v40;
    }
  }
  else
  {
    id v6 = +[UIApplication sharedApplication];
    id v7 = [v6 userInterfaceLayoutDirection];

    objc_super v8 = [(NavContainerViewController *)self view];
    [v8 bounds];
    double v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    id v17 = [(NavContainerViewController *)self view];
    double v18 = v17;
    double v19 = UIRectCornerRadiiZero[1];
    double v20 = UIRectCornerRadiiZero[2];
    double v21 = UIRectCornerRadiiZero[3];
    CGFloat rect = v10;
    if (v7 == (id)1)
    {
      [v17 _rectTuckedAgainstBoundingPathEdge:8 withSize:1.0 cornerRadii:UIRectCornerRadiiZero[0] minimumPadding:v19, v20, v21, 0.0];
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;

      v54.origin.x = v23;
      v54.origin.y = v25;
      v54.size.double width = v27;
      v54.size.double height = v29;
      double v30 = 23.0;
      if (!CGRectIsNull(v54))
      {
        v55.origin.x = rect;
        v55.origin.y = v12;
        v55.size.double width = v14;
        v55.size.double height = v16;
        double MaxX = CGRectGetMaxX(v55);
        v56.origin.x = v23;
        v56.origin.y = v25;
        v56.size.double width = v27;
        v56.size.double height = v29;
        if (MaxX - CGRectGetMaxX(v56) != 0.0)
        {
          v32 = [(NavContainerViewController *)self view];
          [v32 safeAreaInsets];
          double v30 = v33;
LABEL_17:
        }
      }
    }
    else
    {
      [v17 _rectTuckedAgainstBoundingPathEdge:2 withSize:1.0 cornerRadii:UIRectCornerRadiiZero[0] minimumPadding:v19, v20, v21, 0.0];
      CGFloat v43 = v42;
      CGFloat v45 = v44;
      CGFloat v47 = v46;
      CGFloat v49 = v48;

      v57.origin.x = v43;
      v57.origin.y = v45;
      v57.size.double width = v47;
      v57.size.double height = v49;
      double v30 = 23.0;
      if (!CGRectIsNull(v57))
      {
        v58.origin.x = v43;
        v58.origin.y = v45;
        v58.size.double width = v47;
        v58.size.double height = v49;
        double MinX = CGRectGetMinX(v58);
        v59.size.double height = v16;
        v59.origin.x = rect;
        v59.origin.y = v12;
        v59.size.double width = v14;
        if (MinX - CGRectGetMinX(v59) != 0.0)
        {
          v32 = [(NavContainerViewController *)self view];
          [v32 safeAreaInsets];
          double v30 = v51;
          goto LABEL_17;
        }
      }
    }
  }
  signContainerLeadingConstraint = self->_signContainerLeadingConstraint;

  [(NSLayoutConstraint *)signContainerLeadingConstraint setConstant:v30];
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)NavContainerViewController;
  [(ContainerViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(NavContainerViewController *)self _updateIndicatorsLayout];
  [(NavContainerViewController *)self _updateSignContainerLeadingConstraint];
}

- (unint64_t)supportedInterfaceOrientations
{
  if (![(NavContainerViewController *)self isConnectedToCarPlay]) {
    return 30;
  }
  if (sub_1003E3F60()) {
    return 2;
  }
  return 6;
}

- (int64_t)preferredUserInterfaceStyle
{
  int64_t v2 = [(ContainerViewController *)self chromeViewController];
  id v3 = [v2 preferredUserInterfaceStyle];

  return (int64_t)v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NavContainerViewController;
  id v4 = a3;
  [(ContainerViewController *)&v11 traitCollectionDidChange:v4];
  double v5 = [(NavContainerViewController *)self traitCollection];
  int v6 = sub_100045060(v4, v5);

  if (v6)
  {
    id v7 = [(NavContainerViewController *)self traitCollection];
    id v8 = [v7 isLuminanceReduced];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100D96DC0;
    v9[3] = &unk_1012E6300;
    char v10 = (char)v8;
    v9[4] = self;
    +[UIView _maps_animateForAndromeda:v8 animations:v9];
  }
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  [(NavContainerViewController *)self toggleTemporaryStatusBar];
  if ([(NavContainerViewController *)self debugViewControllerEnabled]) {
    [(NavContainerViewController *)self _toggleTraceControls];
  }
  id v7 = [(ContainerViewController *)self currentViewController];
  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___MapViewResponderHandling]) {
    [v7 didTapMapView:v9 atPoint:CGPointMake(x, y)];
  }
  id v8 = [(NavContainerViewController *)self indicatorsViewController];
  [v8 didTapMapView:v9 atPoint:CGPointMake(x, y)];

  [(NavContainerViewController *)self hideJunctionViewTemporarily];
}

- (NavigationDebugViewsController)debugViewsController
{
  debugViewsController = self->_debugViewsController;
  if (!debugViewsController)
  {
    id v4 = [[NavigationDebugViewsController alloc] initWithDelegate:0];
    [(NavigationDebugViewsController *)v4 setShowTraceControlsForStaleLocations:0];
    double v5 = self->_debugViewsController;
    self->_debugViewsController = v4;

    debugViewsController = self->_debugViewsController;
  }

  return debugViewsController;
}

- (void)setDebugViewControllerEnabled:(BOOL)a3
{
  if (self->_debugViewControllerEnabled == a3) {
    return;
  }
  BOOL v3 = a3;
  self->_debugViewControllerEnabled = a3;
  double v5 = [(ContainerViewController *)self chromeViewController];
  id v12 = [v5 mapView];

  if (!v3)
  {
    id v8 = [(NavContainerViewController *)self debugViewsController];
    id v9 = [(OverlayContainerViewController *)self overlayView];
    [v8 removeDebugViewsFromView:v9];
    goto LABEL_6;
  }
  int v6 = +[NSUserDefaults standardUserDefaults];
  unsigned int v7 = [v6 BOOLForKey:@"PlaybackControls"];

  if (v7)
  {
    id v8 = [(NavContainerViewController *)self debugViewsController];
    id v9 = [(OverlayContainerViewController *)self overlayView];
    char v10 = [(OverlayContainerViewController *)self innerLayoutGuide];
    objc_super v11 = [(ContainerViewController *)self chromeViewController];
    [v8 addDebugViewsToView:v9 layoutGuide:v10 mapView:v12 modalPresentingViewController:v11];

LABEL_6:
  }
}

- (void)_toggleTraceControls
{
  uint64_t v3 = [(NavContainerViewController *)self debugViewsController];
  if (v3)
  {
    id v4 = (void *)v3;
    double v5 = +[NSUserDefaults standardUserDefaults];
    unsigned int v6 = [v5 BOOLForKey:@"PlaybackControls"];

    if (v6)
    {
      unsigned int v7 = [(NavContainerViewController *)self debugViewsController];
      unsigned int v8 = [v7 isShowingTraceControls];

      id v9 = [(NavContainerViewController *)self debugViewsController];
      id v10 = v9;
      if (v8) {
        [v9 hideTraceControlsAnimated:1];
      }
      else {
        [v9 showTraceControls];
      }
    }
  }
}

- (BOOL)_shouldShowNavRecenterButton
{
  uint64_t v3 = [(ContainerViewController *)self currentViewController];
  id v4 = [v3 cardPresentationController];
  if ([v4 containeeLayout] == (id)1)
  {
    double v5 = [(NavContainerViewController *)self coordinator];
    BOOL v6 = ([v5 shouldShowNavRecenterButton] & 1) != 0 || self->_isPanned;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_pressedRecenterButton
{
  uint64_t v3 = +[MKMapService sharedService];
  [v3 captureUserAction:4001 onTarget:[self currentMapViewTargetForAnalytics] eventValue:0];

  id v4 = [(NavContainerViewController *)self navSignViewController];
  [v4 clearSelectionAnimated:1];

  double v5 = [(NavContainerViewController *)self coordinator];
  [v5 recenterNavigation];

  [(NavContainerViewController *)self updateLayoutAnimated:1];
}

- (UIView)passThroughView
{
  int64_t v2 = [(ContainerViewController *)self chromeViewController];
  uint64_t v3 = [v2 passThroughView];

  return (UIView *)v3;
}

- (BOOL)canDisplayJunctionViewInfo
{
  if (!self->_junctionViewActive) {
    return 0;
  }
  uint64_t v3 = [(NavContainerViewController *)self coordinator];
  BOOL v4 = ([v3 isDisplayingTrafficIncident] & 1) == 0
    && !self->_trayOpen
    && !self->_isPanned
    && (id)[(NavContainerViewController *)self signStyle] == (id)1;

  return v4;
}

- (void)willDisplayJunctionViewInfo:(id)a3
{
  if (a3)
  {
    self->_junctionViewActive = 1;
    BOOL v4 = [(NavContainerViewController *)self resumeRouteBanner];
    [v4 hideIfNeeded];

    [(NavContainerViewController *)self _updateContaineeHiddenIfNeeded];
  }
  else
  {
    [(NavContainerViewController *)self willHideJunctionView];
  }
}

- (void)showJunctionViewIfNeeded
{
  junctionViewTimer = self->_junctionViewTimer;
  self->_junctionViewTimer = 0;

  if ([(NavContainerViewController *)self canDisplayJunctionViewInfo])
  {
    BOOL v4 = [(NavContainerViewController *)self resumeRouteBanner];
    [v4 hideIfNeeded];

    BOOL junctionViewDisplayed = self->_junctionViewDisplayed;
    self->_BOOL junctionViewDisplayed = 1;
    BOOL v6 = [(NavContainerViewController *)self junctionViewController];
    unsigned int v7 = [v6 view];
    [v7 setHidden:0];

    if (!junctionViewDisplayed)
    {
      unsigned int v8 = [(NavContainerViewController *)self view];
      [v8 layoutIfNeeded];

      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100D975AC;
      v9[3] = &unk_1012E5D08;
      v9[4] = self;
      +[UIView animateWithDuration:v9 animations:0.25];
    }
  }
}

- (void)hideJunctionViewIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL junctionViewDisplayed = self->_junctionViewDisplayed;
  self->_BOOL junctionViewDisplayed = 0;
  junctionViewTimer = self->_junctionViewTimer;
  self->_junctionViewTimer = 0;

  if (junctionViewDisplayed)
  {
    unsigned int v7 = [(NavContainerViewController *)self view];
    [v7 layoutIfNeeded];

    double v8 = 0.0;
    if (v3) {
      double v8 = 0.25;
    }
    v9[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100D97728;
    v10[3] = &unk_1012E5D08;
    v10[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100D977A0;
    v9[3] = &unk_1012E7D28;
    +[UIView animateWithDuration:v10 animations:v9 completion:v8];
  }
}

- (void)hideJunctionViewIfNeeded
{
}

- (void)willHideJunctionView
{
  self->_junctionViewActive = 0;
  BOOL v3 = [(NavContainerViewController *)self resumeRouteBanner];
  [v3 showIfNeeded];

  [(NavContainerViewController *)self _updateContaineeHiddenIfNeeded];
}

- (double)_maxAvailableHeightForJunctionView
{
  [(ContainerViewController *)self statusBarHeight];
  double v4 = v3;
  double v5 = [(NavContainerViewController *)self view];
  [v5 frame];
  double Height = CGRectGetHeight(v17);

  unint64_t v7 = [(ContainerViewController *)self containerStyle];
  if (v7 <= 7 && ((1 << v7) & 0xE3) != 0)
  {
    [(NavContainerViewController *)self _belowSignTopPosition];
    double v9 = v4 + v8;
    id v10 = [(ContainerViewController *)self currentViewController];
    objc_super v11 = [v10 view];
    [v11 bounds];
    double v12 = Height - CGRectGetHeight(v18);

    double v13 = v12 - v9;
    double v14 = -110.0;
  }
  else
  {
    [(NavContainerViewController *)self _belowSignTopPosition];
    double v13 = Height - (v4 + 0.0 + v16);
    double v14 = -8.0;
  }
  return v13 + v14;
}

- (void)suppressTransitionsOfContainee:(id)a3
{
}

- (void)_updateChildViewLayouts
{
  if ([(PassThroughViewController *)self hasParentView])
  {
    if (self->_layoutSetup)
    {
      [(NavContainerViewController *)self _updateNavSignLayout];
      [(NavContainerViewController *)self _updateSecondarySignLayout];
      [(NavContainerViewController *)self _updateJunctionViewLayout];
      [(NavContainerViewController *)self _updateIndicatorsLayout];
      [(NavContainerViewController *)self _updateRecenterButtonLayout];
      [(NavContainerViewController *)self _updateStatusBarIndicatorLayout];
      [(NavContainerViewController *)self _updateLaneGuidanceViewLayout];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100D97A34;
      block[3] = &unk_1012E5D08;
      void block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)_updateNavSignLayout
{
  double v3 = [(ContainerViewController *)self containerStyleManager];
  [v3 containerWidth];
  double v5 = v4;
  BOOL v6 = [(NavContainerViewController *)self navSignViewController];
  [v6 setCardWidth:v5];

  unint64_t v7 = [(ContainerViewController *)self containerStyle];
  double v8 = [(NavContainerViewController *)self view];
  [v8 safeAreaInsets];
  if (v9 == 0.0)
  {
    id v10 = [(NavContainerViewController *)self statusIndicatorView];
    unsigned int v11 = [v10 isVisible] ^ 1;
  }
  else
  {
    unsigned int v11 = 0;
  }

  double v12 = [(NavContainerViewController *)self laneGuidanceViewController];
  unsigned int v13 = [v12 hasLaneGuidance];

  BOOL v14 = ![(NavContainerViewController *)self _isSecondarySignVisible]
     && !self->_junctionViewDisplayed;
  if (v7 == 1) {
    int v15 = 1;
  }
  else {
    int v15 = v11;
  }
  BOOL v16 = (v15 | v13) == 0;
  uint64_t v17 = 3;
  if (!v16) {
    uint64_t v17 = 0;
  }
  if (v14 && v7 != 1) {
    uint64_t v18 = v17 | 0xC;
  }
  else {
    uint64_t v18 = v17;
  }
  double v19 = [(NavContainerViewController *)self navSignViewController];
  [v19 setCornerRadius:10.0];

  id v20 = [(NavContainerViewController *)self navSignViewController];
  [v20 setCornerMask:v18];
}

- (void)_updateSecondarySignLayout
{
  [(NavContainerViewController *)self _secondarySignTopPosition];
  -[NSLayoutConstraint setConstant:](self->_secondarySignTopConstraint, "setConstant:");
  unint64_t v3 = [(ContainerViewController *)self containerStyle];
  if (v3 <= 7 && ((1 << v3) & 0xE3) != 0)
  {
    id v8 = [(NavContainerViewController *)self secondarySignViewController];
    double v4 = [v8 view];
    double v5 = [v4 layer];
    BOOL v6 = v5;
    uint64_t v7 = 0;
  }
  else
  {
    id v8 = [(NavContainerViewController *)self secondarySignViewController];
    double v4 = [v8 view];
    double v5 = [v4 layer];
    BOOL v6 = v5;
    uint64_t v7 = 12;
  }
  [v5 setMaskedCorners:v7];
}

- (void)_updateLaneGuidanceViewLayout
{
  if ((id)[(ContainerViewController *)self containerStyle] == (id)1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    double v4 = [(NavContainerViewController *)self view];
    [v4 safeAreaInsets];
    if (v5 == 0.0) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = 3;
    }
  }
  id v8 = [(NavContainerViewController *)self laneGuidanceViewController];
  BOOL v6 = [v8 view];
  uint64_t v7 = [v6 layer];
  [v7 setMaskedCorners:v3];
}

- (void)_updateJunctionViewLayout
{
  [(NavContainerViewController *)self _junctionViewTopPosition];
  -[NSLayoutConstraint setConstant:](self->_junctionViewTopConstraint, "setConstant:");
  [(NavContainerViewController *)self maxAvailableHeightForJunctionView:0.0];
  double v4 = v3;
  double v5 = [(NavContainerViewController *)self junctionViewController];
  [v5 setAvailableHeight:v4];

  unint64_t v6 = [(ContainerViewController *)self containerStyle];
  if (v6 <= 7 && ((1 << v6) & 0xE3) != 0)
  {
    id v11 = [(NavContainerViewController *)self junctionViewController];
    uint64_t v7 = [v11 view];
    id v8 = [v7 layer];
    double v9 = v8;
    uint64_t v10 = 0;
  }
  else
  {
    id v11 = [(NavContainerViewController *)self junctionViewController];
    uint64_t v7 = [v11 view];
    id v8 = [v7 layer];
    double v9 = v8;
    uint64_t v10 = 12;
  }
  [v8 setMaskedCorners:v10];
}

- (void)_updateIndicatorsLayout
{
  [(NavContainerViewController *)self _indicatorsTopPosition];
  -[NSLayoutConstraint setConstant:](self->_portraitIndicatorsTopConstraint, "setConstant:");
  [(NavContainerViewController *)self _indicatorsTrailingInset];
  -[NSLayoutConstraint setConstant:](self->_landscapeIndicatorsTrailingConstraint, "setConstant:");
  unint64_t v3 = [(ContainerViewController *)self containerStyle];
  if (v3 > 7)
  {
    double v5 = &OBJC_IVAR___NavContainerViewController__landscapeIndicatorsConstraints;
    double v4 = &OBJC_IVAR___NavContainerViewController__portraitIndicatorsConstraints;
  }
  else
  {
    double v4 = off_101323D78[v3];
    double v5 = off_101323DB8[v3];
  }
  +[NSLayoutConstraint deactivateConstraints:*(Class *)((char *)&self->super.super.super.super.super.super.super.isa + *v4)];
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa + *v5);

  +[NSLayoutConstraint activateConstraints:v6];
}

- (void)_updateRecenterButtonLayout
{
  unint64_t v3 = [(ContainerViewController *)self chromeViewController];
  id v7 = [v3 nextTopContext];

  if (!v7 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), double v4 = 0.0, (isKindOfClass & 1) != 0))
  {
    unsigned int v6 = [(NavContainerViewController *)self _shouldShowNavRecenterButton];
    double v4 = 0.0;
    if (v6) {
      double v4 = 1.0;
    }
  }
  [(UIButton *)self->_recenterButton setAlpha:v4];
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
    double v4 = +[MapsLightLevelController sharedController];
    if ([v4 shouldUseNightMode]) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 3;
    }
  }
  statusIndicatorView = self->_statusIndicatorView;

  [(StatusIndicatorView *)statusIndicatorView updateWithStatusBarStyle:v5];
}

- (unint64_t)layoutForCurrentViewControllerWithStyle:(unint64_t)a3
{
  if ([(ContainerViewController *)self containeeLayout])
  {
    return [(ContainerViewController *)self containeeLayout];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NavContainerViewController;
    return [(ContainerViewController *)&v6 layoutForCurrentViewControllerWithStyle:a3];
  }
}

- (void)_containeeLayoutWillChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  objc_super v6 = [v5 objectForKeyedSubscript:@"ContainerContainee"];

  id v7 = [v4 userInfo];

  id v8 = [v7 objectForKeyedSubscript:@"ContainerLayout"];
  id v9 = [v8 unsignedIntegerValue];

  uint64_t v10 = sub_1000BF6B8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v13 = 138543874;
    BOOL v14 = self;
    __int16 v15 = 2114;
    BOOL v16 = v6;
    __int16 v17 = 2048;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@ containee: %{public}@ willChangeTo: %lu", (uint8_t *)&v13, 0x20u);
  }

  if ([(PassThroughViewController *)self hasParentView])
  {
    if (self->_layoutSetup)
    {
      self->_trayOpen = (unint64_t)v9 > 1;
      if (v6 != self->_suppressedContainee)
      {
        if ((unint64_t)v9 >= 2)
        {
          id v11 = [(NavContainerViewController *)self navSignViewController];
          [v11 clearDragState];
        }
        double v12 = [(NavContainerViewController *)self navSignViewController];
        [v12 clearPartialExpansionAnimated:[UIView areAnimationsEnabled]];

        if (self->_trayOpen) {
          [(NavContainerViewController *)self _updateLayeringToTrayProminent];
        }
        [(NavContainerViewController *)self _updateControlsHiddenAnimated:+[UIView areAnimationsEnabled]];
        [(GCDTimer *)self->_pedestrianARFeatureIntroTeachableMomentTimer invalidate];
      }
    }
  }
}

- (void)_containeeLayoutDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  objc_super v6 = [v5 objectForKeyedSubscript:@"ContainerContainee"];

  id v7 = [v4 userInfo];

  id v8 = [v7 objectForKeyedSubscript:@"ContainerLayout"];
  id v9 = [v8 unsignedIntegerValue];

  uint64_t v10 = sub_1000BF6B8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v13 = 138543874;
    BOOL v14 = self;
    __int16 v15 = 2114;
    BOOL v16 = v6;
    __int16 v17 = 2048;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@ containee: %{public}@ didChangeTo: %lu", (uint8_t *)&v13, 0x20u);
  }

  if ([(PassThroughViewController *)self hasParentView])
  {
    if (self->_layoutSetup)
    {
      id v11 = [(ContainerViewController *)self currentViewController];

      if (v6 == v11)
      {
        suppressedContainee = self->_suppressedContainee;
        self->_suppressedContainee = 0;

        if (v9 == (id)1) {
          [(NavContainerViewController *)self _updateLayeringToSignProminent];
        }
        [(NavContainerViewController *)self _updateControlsHiddenAnimated:+[UIView areAnimationsEnabled]];
      }
    }
  }
}

- (void)_containeeWillPresent:(id)a3
{
  id v10 = a3;
  if ([(PassThroughViewController *)self hasParentView] && self->_layoutSetup)
  {
    id v4 = [v10 userInfo];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"ContainerContainee"];

    objc_super v6 = [v5 viewIfLoaded];
    id v7 = [v6 window];

    if (v7)
    {
      id v8 = [v5 cardPresentationController];
      id v9 = [v8 containeeLayout];
    }
    else
    {
      id v9 = [(NavContainerViewController *)self originalLayoutForViewController:v5];
    }
    self->_trayOpen = (unint64_t)v9 > 1;
    [(NavContainerViewController *)self _updateControlsHiddenAnimated:+[UIView areAnimationsEnabled]];
  }
}

- (void)_containeeDidPresent:(id)a3
{
  suppressedContainee = self->_suppressedContainee;
  self->_suppressedContainee = 0;
}

- (void)_updateLayeringToSignProminent
{
  unint64_t v3 = [(NavContainerViewController *)self view];
  id v4 = [(NavContainerViewController *)self indicatorsViewController];
  uint64_t v5 = [v4 view];
  [v3 addSubview:v5];

  objc_super v6 = [(NavContainerViewController *)self view];
  [v6 addSubview:self->_navSignContainerView];

  [(NavContainerViewController *)self _pinSignAndIndicators];
}

- (void)_updateLayeringToTrayProminent
{
  unint64_t v3 = [(NavContainerViewController *)self view];
  id v4 = [(NavContainerViewController *)self indicatorsViewController];
  uint64_t v5 = [v4 view];
  [v3 insertSubview:v5 aboveSubview:self->_recenterButton];

  objc_super v6 = [(NavContainerViewController *)self view];
  navSignContainerView = self->_navSignContainerView;
  id v8 = [(NavContainerViewController *)self indicatorsViewController];
  id v9 = [v8 view];
  [v6 insertSubview:navSignContainerView aboveSubview:v9];

  [(NavContainerViewController *)self _pinSignAndIndicators];
}

- (void)_pinSignAndIndicators
{
  if (![(NSLayoutConstraint *)self->_signContainerTopConstraint isActive])
  {
    unint64_t v3 = [(UIView *)self->_navSignContainerView topAnchor];
    id v4 = [(ContainerViewController *)self chromeViewController];
    uint64_t v5 = [v4 viewportLayoutGuide];
    objc_super v6 = [v5 topAnchor];
    id v7 = [v3 constraintEqualToAnchor:v6];
    signContainerTopConstraint = self->_signContainerTopConstraint;
    self->_signContainerTopConstraint = v7;

    id v9 = [(UIView *)self->_navSignContainerView leadingAnchor];
    id v10 = [(NavContainerViewController *)self view];
    id v11 = [v10 leadingAnchor];
    double v12 = [v9 constraintEqualToAnchor:v11];
    signContainerLeadingConstraint = self->_signContainerLeadingConstraint;
    self->_signContainerLeadingConstraint = v12;

    BOOL v14 = self->_signContainerLeadingConstraint;
    v24[0] = self->_signContainerTopConstraint;
    v24[1] = v14;
    __int16 v15 = [(UIView *)self->_navSignContainerView widthAnchor];
    BOOL v16 = [(ContainerViewController *)self containerView];
    __int16 v17 = [v16 widthAnchor];
    id v18 = [v15 constraintEqualToAnchor:v17];
    v24[2] = v18;
    double v19 = [(UIView *)self->_navSignContainerView bottomAnchor];
    id v20 = [(NavContainerViewController *)self view];
    double v21 = [v20 bottomAnchor];
    double v22 = [v19 constraintEqualToAnchor:v21];
    v24[3] = v22;
    CGFloat v23 = +[NSArray arrayWithObjects:v24 count:4];
    +[NSLayoutConstraint activateConstraints:v23];

    [(NavContainerViewController *)self _updateSignContainerLeadingConstraint];
  }
}

- (BOOL)shouldHideCard
{
  if (self->_isArrivalState && ![(NavContainerViewController *)self isConnectedToCarPlay])
  {
    __int16 v17 = sub_10000AF10();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
LABEL_12:
      LOBYTE(v24) = 0;
      goto LABEL_53;
    }
    id v18 = self;
    double v19 = (objc_class *)objc_opt_class();
    id v20 = NSStringFromClass(v19);
    if (objc_opt_respondsToSelector())
    {
      double v21 = [(NavContainerViewController *)v18 performSelector:"accessibilityIdentifier"];
      double v22 = v21;
      if (v21 && ![v21 isEqualToString:v20])
      {
        CGFloat v23 = +[NSString stringWithFormat:@"%@<%p, %@>", v20, v18, v22];

        goto LABEL_11;
      }
    }
    CGFloat v23 = +[NSString stringWithFormat:@"%@<%p>", v20, v18];
LABEL_11:

    *(_DWORD *)buf = 138543362;
    v64 = v23;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will unhide tray because we've arrived and aren't connected to CarPlay", buf, 0xCu);

    goto LABEL_12;
  }
  unint64_t v3 = [(NavContainerViewController *)self view];
  [v3 frame];
  double Height = CGRectGetHeight(v83);
  uint64_t v5 = [(ContainerViewController *)self currentViewController];
  objc_super v6 = [v5 view];
  [v6 bounds];
  double v7 = CGRectGetHeight(v84);

  [(ContainerViewController *)self statusBarHeight];
  double v9 = v8;
  id v10 = [(NavContainerViewController *)self navSignViewController];
  [v10 footerBottomPosition];
  double v12 = v9 + v11;

  if (self->_junctionViewDisplayed)
  {
    [(NavContainerViewController *)self _navSignBottomPosition];
    double v14 = v13;
    [(NavContainerViewController *)self maxAvailableHeightForJunctionView:0.0];
    double v16 = v14 + v15;
  }
  else
  {
    double v16 = 0.0;
  }
  double v25 = Height - v7;
  if (v12 <= v16) {
    double v26 = v16;
  }
  else {
    double v26 = v12;
  }
  [(NavSignListViewController *)self->_navSignViewController collapsedHeight];
  double v28 = v27;
  signListdouble Height = self->_signListHeight;
  unint64_t v30 = [(ContainerViewController *)self containerStyle];
  if (v30 <= 7 && ((1 << v30) & 0xE3) != 0)
  {
    int v24 = v26 > v25 && signListHeight > v28;
  }
  else
  {
    BOOL v52 = signListHeight > v28;
    if (v26 <= v25) {
      BOOL v52 = 0;
    }
    if (self->_junctionViewDisplayed) {
      int v24 = v26 > v25;
    }
    else {
      int v24 = v52;
    }
  }
  unsigned int v31 = [(ContainerViewController *)self containeesHidden];
  v32 = sub_10000AF10();
  __int16 v17 = v32;
  if (v24 == v31)
  {
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_53;
    }
    CGFloat v43 = self;
    double v44 = (objc_class *)objc_opt_class();
    CGFloat v45 = NSStringFromClass(v44);
    if (objc_opt_respondsToSelector())
    {
      double v46 = [(NavContainerViewController *)v43 performSelector:"accessibilityIdentifier"];
      CGFloat v47 = v46;
      if (v46 && ![v46 isEqualToString:v45])
      {
        double v48 = +[NSString stringWithFormat:@"%@<%p, %@>", v45, v43, v47];

        goto LABEL_39;
      }
    }
    double v48 = +[NSString stringWithFormat:@"%@<%p>", v45, v43];
LABEL_39:

    if (v24) {
      CGFloat v49 = "hide";
    }
    else {
      CGFloat v49 = "show";
    }
    unint64_t v50 = [(ContainerViewController *)v43 containerStyle];
    if (v50 > 7) {
      int v51 = 1;
    }
    else {
      int v51 = dword_100F74128[v50];
    }
    BOOL junctionViewDisplayed = self->_junctionViewDisplayed;
    *(_DWORD *)buf = 138544642;
    v64 = v48;
    __int16 v65 = 2080;
    v66 = v49;
    __int16 v67 = 1024;
    int v68 = v51;
    __int16 v69 = 1024;
    BOOL v70 = v26 > v25;
    __int16 v71 = 1024;
    BOOL v72 = signListHeight > v28;
    __int16 v73 = 1024;
    LODWORD(v74) = junctionViewDisplayed;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[%{public}@] Should %s tray because isLandscape: %d, bottomOfSignsIsGreaterThanTopOfTray: %d, signHeightGreaterThanCollapsed: %d, junctionViewDisplayed: %d", buf, 0x2Eu);

    goto LABEL_53;
  }
  if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_53;
  }
  double v33 = self;
  v34 = (objc_class *)objc_opt_class();
  v35 = NSStringFromClass(v34);
  if (objc_opt_respondsToSelector())
  {
    id v36 = [(NavContainerViewController *)v33 performSelector:"accessibilityIdentifier"];
    v37 = v36;
    if (v36 && ![v36 isEqualToString:v35])
    {
      v38 = +[NSString stringWithFormat:@"%@<%p, %@>", v35, v33, v37];

      goto LABEL_29;
    }
  }
  v38 = +[NSString stringWithFormat:@"%@<%p>", v35, v33];
LABEL_29:

  id v39 = "show";
  if (v24) {
    id v39 = "hide";
  }
  v62 = v39;
  id v40 = v38;
  unint64_t v41 = [(ContainerViewController *)v33 containerStyle];
  if (v41 > 7) {
    int v42 = 1;
  }
  else {
    int v42 = dword_100F74128[v41];
  }
  int v61 = v42;
  BOOL v53 = v26 > v25;
  double v54 = self->_signListHeight;
  [(NavSignListViewController *)self->_navSignViewController layoutProgress];
  uint64_t v56 = v55;
  unsigned int v57 = [(NavSignListViewController *)self->_navSignViewController isDragging];

  BOOL v58 = self->_junctionViewDisplayed;
  *(_DWORD *)buf = 138545666;
  v64 = v38;
  __int16 v65 = 2080;
  v66 = v62;
  __int16 v67 = 1024;
  int v68 = v61;
  __int16 v69 = 1024;
  BOOL v70 = v53;
  __int16 v71 = 1024;
  BOOL v72 = signListHeight > v28;
  __int16 v73 = 2048;
  double v74 = v54;
  __int16 v75 = 2048;
  double v76 = v28;
  __int16 v77 = 2048;
  uint64_t v78 = v56;
  __int16 v79 = 1024;
  unsigned int v80 = v57;
  __int16 v81 = 1024;
  BOOL v82 = v58;
  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Should %s tray because isLandscape: %d, bottomOfSignsIsGreaterThanTopOfTray: %d, signHeightGreaterThanCollapsed: %d (currentHeight: %f, collapsedHeight: %f, layoutProgress: %f, isDragging: %d), junctionViewDisplayed: %d", buf, 0x52u);

LABEL_53:
  return v24;
}

- (void)updateLayoutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NavContainerViewController;
  [(ContainerViewController *)&v10 updateLayoutAnimated:"updateLayoutAnimated:"];
  [(ContainerViewController *)self updateContaineeStackState];
  [(NavContainerViewController *)self _updateIdleTimer];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100D99120;
  v9[3] = &unk_1012E5D08;
  v9[4] = self;
  uint64_t v5 = objc_retainBlock(v9);
  objc_super v6 = v5;
  if (v3)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100D99180;
    v7[3] = &unk_1012E6EA8;
    double v8 = v5;
    +[UIView _animateUsingDefaultTimingWithOptions:4 animations:v7 completion:0];
  }
  else
  {
    ((void (*)(void *))v5[2])(v5);
  }
}

- (unint64_t)originalLayoutForViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ContainerViewController *)self currentViewController];
  objc_super v6 = [v5 cardPresentationController];
  unint64_t v7 = (unint64_t)[v6 defaultContaineeLayout];

  if (!v7)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (id v9 = v4,
          unint64_t v10 = [(ContainerViewController *)self containerStyle],
          [(NavContainerViewController *)self traitCollection],
          double v11 = objc_claimAutoreleasedReturnValue(),
          unint64_t v7 = (unint64_t)[v9 defaultLayoutForContainerStyle:v10 traitCollection:v11],
          v9,
          v11,
          !v7))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v7 = 1;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          unint64_t v7 = 1;
        }
        else {
          unint64_t v7 = 2;
        }
      }
    }
  }

  return v7;
}

- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(NavContainerViewController *)self coordinator];
  unsigned int v10 = [v9 isShowingFullScreenDirectionsList];

  double v11 = sub_10000AF10();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Showing expanded nav sign; skipping presentation of %@",
        buf,
        0xCu);
    }
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Presenting controller: %@", buf, 0xCu);
    }

    v13.receiver = self;
    v13.super_class = (Class)NavContainerViewController;
    [(ContainerViewController *)&v13 presentController:v8 animated:v6 useDefaultContaineeLayout:v5];
  }
}

- (void)containerStyleManagerDidChangeStyle:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NavContainerViewController;
  -[ContainerViewController containerStyleManagerDidChangeStyle:](&v8, "containerStyleManagerDidChangeStyle:");
  BOOL v5 = [(NavContainerViewController *)self coordinator];
  BOOL v6 = [(NavContainerViewController *)self traitCollection];
  [v5 updateCameraForTraits:v6 containerStyle:a3];

  [(NavContainerViewController *)self _updateChildViewLayouts];
  unint64_t v7 = [(NavContainerViewController *)self iosBasedChromeViewController];
  [v7 setNeedsUpdateComponent:@"statusBarStyle" animated:0];

  if ([(NavContainerViewController *)self canDisplayJunctionViewInfo]) {
    [(NavContainerViewController *)self showJunctionViewIfNeeded];
  }
  else {
    [(NavContainerViewController *)self hideJunctionViewIfNeededAnimated:1];
  }
}

- (double)availableHeight
{
  unint64_t v3 = [(ContainerViewController *)self containerStyle];
  if (v3 > 6) {
    goto LABEL_13;
  }
  if (((1 << v3) & 0x54) != 0)
  {
    id v4 = +[UIDevice currentDevice];
    if ([v4 userInterfaceIdiom] == (id)1)
    {

      goto LABEL_9;
    }
    id v15 = +[UIDevice currentDevice];
    id v16 = [v15 userInterfaceIdiom];

    if (v16 == (id)5)
    {
LABEL_9:
      BOOL v5 = [(NavContainerViewController *)self view];
      [v5 bounds];
      double v18 = v17;
      objc_super v8 = [(OverlayContainerViewController *)self topContentView];
      [v8 frame];
      double v19 = v18 - CGRectGetMaxY(v32);
      [(NavContainerViewController *)self edgePadding];
      double v21 = v19 - v20;
      double v10 = 0.0;
      if (v21 >= 0.0)
      {
        double v11 = [(NavContainerViewController *)self view];
        [v11 bounds];
        double v23 = v22;
        int v24 = [(OverlayContainerViewController *)self topContentView];
        [v24 frame];
        double v25 = v23 - CGRectGetMaxY(v33);
        [(NavContainerViewController *)self edgePadding];
        double v10 = v25 - v26;

        goto LABEL_11;
      }
      goto LABEL_12;
    }
LABEL_13:
    v29.receiver = self;
    v29.super_class = (Class)NavContainerViewController;
    [(ContainerViewController *)&v29 availableHeight];
    return v27;
  }
  if (((1 << v3) & 0x22) == 0) {
    goto LABEL_13;
  }
  BOOL v5 = [(NavContainerViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  objc_super v8 = [(OverlayContainerViewController *)self topContentView];
  [v8 frame];
  double v9 = v7 - CGRectGetMaxY(v30) + 8.0;
  double v10 = 0.0;
  if (v9 >= 0.0)
  {
    double v11 = [(NavContainerViewController *)self view];
    [v11 bounds];
    double v13 = v12;
    double v14 = [(OverlayContainerViewController *)self topContentView];
    [v14 frame];
    double v10 = v13 - CGRectGetMaxY(v31) + 8.0;

LABEL_11:
  }
LABEL_12:

  return v10;
}

- (double)edgePadding
{
  return 16.0;
}

- (unint64_t)maxLayoutForEdgeInsetsUpdate
{
  unint64_t v3 = [(ContainerViewController *)self currentViewController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  BOOL v5 = [(ContainerViewController *)self currentViewController];
  id v6 = [v5 maxLayoutForEdgeInsetsUpdate];

  return (unint64_t)v6;
}

- (void)mapViewNavigationCameraHasStartedPanning:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Panning] mapViewNavigationCameraHasStartedPanning:", v9, 2u);
  }

  self->_isPanned = 1;
  [(NavContainerViewController *)self updateLayoutAnimated:1];
  if (self->_trayOpen && (id)[(ContainerViewController *)self containerStyle] != (id)7)
  {
    id v6 = [(ContainerViewController *)self currentViewController];
    double v7 = [v6 cardPresentationController];
    [v7 wantsLayout:1];
  }
  [(NavContainerViewController *)self hideJunctionViewIfNeededAnimated:1];
  objc_super v8 = [(NavContainerViewController *)self indicatorsViewController];
  [v8 mapViewNavigationCameraHasStartedPanning:v4];

  [(NavContainerViewController *)self _updateControlsHiddenAnimated:1];
}

- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Panning] mapViewNavigationCameraHasStoppedPanning:", v7, 2u);
  }

  self->_isPanned = 0;
  [(NavContainerViewController *)self updateLayoutAnimated:1];
  [(NavContainerViewController *)self showJunctionViewIfNeeded];
  id v6 = [(NavContainerViewController *)self indicatorsViewController];
  [v6 mapViewNavigationCameraHasStoppedPanning:v4];

  [(NavContainerViewController *)self _updateControlsHiddenAnimated:1];
}

- (void)mapViewNavigationCameraDidLeaveDefaultZoom:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Panning] mapViewNavigationCameraDidLeaveDefaultZoom:", v9, 2u);
  }

  self->_isPanned = 1;
  [(NavContainerViewController *)self updateLayoutAnimated:1];
  if (self->_trayOpen && (id)[(ContainerViewController *)self containerStyle] != (id)7)
  {
    id v6 = [(ContainerViewController *)self currentViewController];
    double v7 = [v6 cardPresentationController];
    [v7 wantsLayout:1];
  }
  [(NavContainerViewController *)self hideJunctionViewIfNeededAnimated:1];
  objc_super v8 = [(NavContainerViewController *)self indicatorsViewController];
  [v8 mapViewNavigationCameraDidLeaveDefaultZoom:v4];

  [(NavContainerViewController *)self _updateControlsHiddenAnimated:1];
}

- (void)mapViewNavigationCameraDidReturnToDefaultZoom:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Panning] mapViewNavigationCameraDidReturnToDefaultZoom:", v7, 2u);
  }

  self->_isPanned = 0;
  [(NavContainerViewController *)self updateLayoutAnimated:1];
  [(NavContainerViewController *)self showJunctionViewIfNeeded];
  id v6 = [(NavContainerViewController *)self indicatorsViewController];
  [v6 mapViewNavigationCameraDidReturnToDefaultZoom:v4];

  [(NavContainerViewController *)self _updateControlsHiddenAnimated:1];
}

- (void)_updateControlsHiddenAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(NavContainerViewController *)self indicatorsViewController];
  id v6 = v5;
  BOOL v7 = self->_trayOpen || self->_isPanned || self->_isArrivalState;
  [v5 setControlsHidden:v7 animated:v3];

  objc_super v8 = [(NavContainerViewController *)self indicatorsViewController];
  BOOL v9 = self->_isPanned || self->_isArrivalState;
  id v10 = v8;
  [v8 setIndicatorsHidden:v9 animated:v3];
}

- (void)mapView:(id)a3 didUpdateYaw:(double)a4
{
  id v5 = [(NavContainerViewController *)self indicatorsViewController];
  [v5 setYaw:a4];
}

- (void)setRoute:(id)a3
{
  id v5 = (GEOComposedRoute *)a3;
  if (v5 && self->_route != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_route, a3);
    [(NavContainerViewController *)self _updateRecenterButtonLayout];
    id v5 = v6;
  }
}

- (void)setSignStyle:(unint64_t)a3
{
  if (self->_signStyle != a3)
  {
    self->_signStyle = a3;
    if ([(NavContainerViewController *)self isViewLoaded])
    {
      id v5 = [(NavContainerViewController *)self indicatorsViewController];
      [v5 setIndicatorsType:a3 != 1];

      id v6 = [(NavContainerViewController *)self iosBasedChromeViewController];
      [v6 setNeedsUpdateComponent:@"statusBarStyle" animated:0];
    }
    if (a3 == 1)
    {
      [(NavContainerViewController *)self showJunctionViewIfNeeded];
    }
    else
    {
      [(NavContainerViewController *)self hideJunctionViewIfNeeded];
    }
  }
}

- (void)setResumeRouteBannerHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NavContainerViewController *)self resumeRouteBanner];
  id v5 = v4;
  if (v3) {
    [v4 hideIfNeeded];
  }
  else {
    [v4 showIfNeeded];
  }
}

- (BOOL)isForWalkingNav
{
  int64_t v2 = [(NavContainerViewController *)self route];
  BOOL v3 = [v2 transportType] == 2;

  return v3;
}

- (void)willDismissNavigationAnimated:(BOOL)a3
{
  double v3 = 0.0;
  if (a3) {
    double v3 = 0.25;
  }
  v4[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100D99F18;
  v5[3] = &unk_1012E5D08;
  v5[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100D9A00C;
  v4[3] = &unk_1012E7D28;
  +[UIView animateWithDuration:v5 animations:v4 completion:v3];
}

- (void)_navigationChromeVisibilityChanged
{
  double v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 BOOLForKey:@"__internal__hideChromeInNavigation"];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(NavContainerViewController *)self view];
  id v6 = [v5 subviews];

  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setHidden:v4];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = NSStringFromSelector("collapsedHeight");
  unsigned int v14 = [v10 isEqualToString:v13];

  if (v14)
  {
    id v15 = [(NavContainerViewController *)self navSignViewController];
    [v15 collapsedHeight];
    double v17 = v16;

    [(NavContainerViewController *)self signListHeight];
    if (v17 <= v18)
    {
      [(NavContainerViewController *)self signListHeight];
      double v17 = v19;
    }
    [(NavContainerViewController *)self setSignListHeight:v17];
    [(NavContainerViewController *)self _indicatorsTopPosition];
    -[NSLayoutConstraint setConstant:](self->_portraitIndicatorsTopConstraint, "setConstant:");
    [(NavContainerViewController *)self _secondarySignTopPosition];
    -[NSLayoutConstraint setConstant:](self->_secondarySignTopConstraint, "setConstant:");
    [(NavContainerViewController *)self _junctionViewTopPosition];
    -[NSLayoutConstraint setConstant:](self->_junctionViewTopConstraint, "setConstant:");
    [(ContainerViewController *)self updateMapEdgeInsets];
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)NavContainerViewController;
    [(NavContainerViewController *)&v20 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (double)topEdgeInset
{
  unint64_t v3 = [(ContainerViewController *)self containerStyle];
  if (v3 > 7 || ((1 << v3) & 0xE3) == 0)
  {
    id v6 = [(ContainerViewController *)self chromeViewController];
    id v7 = [v6 viewport];
    [v7 frame];
    double MinY = CGRectGetMinY(v10);

    return MinY;
  }
  else
  {
    [(NavContainerViewController *)self _usedPortraitTopSpace];
  }
  return result;
}

- (double)bottomEdgeInset
{
  unint64_t v3 = [(ContainerViewController *)self containerStyle];
  if (v3 - 2 < 2)
  {
    id v8 = [(NavContainerViewController *)self view];
    [v8 safeAreaInsets];
    double v10 = v9;
LABEL_13:

    return v10;
  }
  if (v3 == 1 || v3 == 5)
  {
    id v4 = [(ContainerViewController *)self currentViewController];
    id v5 = [(NavContainerViewController *)self trafficIncidentAlertCoordinator];
    id v6 = [v5 alertViewController];
    if (v4 == v6)
    {
      id v11 = [(ContainerViewController *)self currentViewController];
      id v12 = [v11 cardPresentationController];
      BOOL v7 = [v12 containeeLayout] == (id)5;
    }
    else
    {
      BOOL v7 = 0;
    }

    long long v13 = [(ContainerViewController *)self currentViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v15 = [(ContainerViewController *)self currentViewController];
    objc_opt_class();
    char v16 = objc_opt_isKindOfClass();

    if (v7 || (isKindOfClass & 1) != 0 || (v16 & 1) != 0)
    {
      id v8 = [(ContainerViewController *)self currentViewController];
      double v18 = [v8 cardPresentationController];
      [v18 cardHeight];
      double v10 = v19;

      goto LABEL_13;
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)NavContainerViewController;
  [(ContainerViewController *)&v21 bottomEdgeInset];
  return v17;
}

- (void)setBannerAction:(id)a3
{
}

- (void)setBannerAction:(id)a3 animated:(BOOL)a4
{
  if (self->_bannerAction != a3)
  {
    BOOL v4 = a4;
    id v6 = (NavContainerBannerAction *)[a3 copy];
    bannerAction = self->_bannerAction;
    self->_bannerAction = v6;

    id v8 = [(NavContainerBannerAction *)self->_bannerAction title];
    double v9 = [(NavContainerViewController *)self resumeRouteBanner];
    [v9 setTitle:v8];

    id v10 = [(NavContainerViewController *)self iosBasedChromeViewController];
    [v10 setNeedsUpdateComponent:@"statusBarSupplementaryView" animated:v4];
  }
}

- (void)_performBannerAction
{
  unint64_t v3 = [(NavContainerViewController *)self bannerAction];
  BOOL v4 = [v3 actionHandler];

  if (v4)
  {
    id v5 = [(NavContainerViewController *)self bannerAction];
    id v6 = [v5 actionHandler];
    int v7 = v6[2]();

    if (v7)
    {
      [(NavContainerViewController *)self setBannerAction:0 animated:1];
    }
  }
}

- (void)_closeBannerAction
{
  unint64_t v3 = [(NavContainerViewController *)self bannerAction];
  id v4 = [v3 copy];

  [v4 setHidden:1];
  [(NavContainerViewController *)self setBannerAction:v4 animated:1];
}

- (BOOL)_bannerActionShouldDisplay
{
  if ([(NavContainerBannerAction *)self->_bannerAction hidden]) {
    return 0;
  }
  id v4 = [(NavContainerBannerAction *)self->_bannerAction title];
  if ([v4 length]) {
    BOOL v3 = !self->_junctionViewActive;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)switchToOverviewMode
{
  BOOL v3 = [(NavContainerViewController *)self coordinator];
  [v3 sender:self switchToNavigationCameraMode:1];

  pedestrianARFeatureIntroTeachableMomentTimer = self->_pedestrianARFeatureIntroTeachableMomentTimer;

  [(GCDTimer *)pedestrianARFeatureIntroTeachableMomentTimer invalidate];
}

- (void)switchToZoomedInMode
{
  BOOL v3 = [(NavContainerViewController *)self coordinator];
  [v3 sender:self switchToNavigationCameraMode:0];

  pedestrianARFeatureIntroTeachableMomentTimer = self->_pedestrianARFeatureIntroTeachableMomentTimer;

  [(GCDTimer *)pedestrianARFeatureIntroTeachableMomentTimer invalidate];
}

- (void)toggleHeadingMode
{
  BOOL v3 = [(NavContainerViewController *)self coordinator];
  [v3 toggleLowGuidanceNavigationCameraHeading];

  pedestrianARFeatureIntroTeachableMomentTimer = self->_pedestrianARFeatureIntroTeachableMomentTimer;

  [(GCDTimer *)pedestrianARFeatureIntroTeachableMomentTimer invalidate];
}

- (void)enterPedestrianAR
{
  [(GCDTimer *)self->_pedestrianARFeatureIntroTeachableMomentTimer invalidate];
  BOOL v3 = [(NavContainerViewController *)self coordinator];
  [v3 enterPedestrianAR];

  [(ContainerViewController *)self setLayoutIfSupported:1 animated:0];
}

- (StatusIndicatorView)statusIndicatorView
{
  statusIndicatorView = self->_statusIndicatorView;
  if (!statusIndicatorView)
  {
    id v4 = [[StatusIndicatorView alloc] initForLimitedMode:1];
    id v5 = self->_statusIndicatorView;
    self->_statusIndicatorView = v4;

    statusIndicatorView = self->_statusIndicatorView;
  }

  return statusIndicatorView;
}

- (void)statusIndicatorTypeChanged:(unint64_t)a3
{
  id v5 = [(NavContainerViewController *)self statusIndicatorView];
  [v5 setType:a3];

  id v6 = [(NavContainerViewController *)self iosBasedChromeViewController];
  [v6 setNeedsUpdateComponent:@"statusBarStyle" animated:0];

  int v7 = [(NavContainerViewController *)self iosBasedChromeViewController];
  [v7 setNeedsUpdateComponent:@"statusBarSupplementaryView" animated:1];

  id v8 = [(NavContainerViewController *)self iosBasedChromeViewController];
  [v8 updateComponentsIfNeeded];

  [(NavContainerViewController *)self _updateNavSignLayout];
  id v9 = [(NavContainerViewController *)self navSignViewController];
  [v9 updateHeightConstraints];
}

- (id)statusBarSupplementaryView
{
  if ([(NavContainerViewController *)self _bannerActionShouldDisplay])
  {
    BOOL v3 = [(NavContainerViewController *)self resumeRouteBanner];
  }
  else
  {
    id v4 = [(NavContainerViewController *)self statusIndicatorView];
    if ([v4 isVisible])
    {
      BOOL v3 = [(NavContainerViewController *)self statusIndicatorView];
    }
    else
    {
      BOOL v3 = 0;
    }
  }

  return v3;
}

- (void)_updateIdleTimer
{
  if ([(PassThroughViewController *)self hasParentView]
    && (id)[(ContainerViewController *)self containeeLayout] != (id)1)
  {
    BOOL v3 = [(ContainerViewController *)self currentViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v4 = 5.0;
    }
    else {
      double v4 = 15.0;
    }

    id v5 = [NavIdleTimeoutTimer alloc];
    id v6 = [(NavContainerViewController *)self view];
    int v7 = [v6 window];
    id v8 = [(NavIdleTimeoutTimer *)v5 initWithWindow:v7 idleTimeout:v4];
    [(NavContainerViewController *)self setIdleTimer:v8];

    id v9 = [(NavContainerViewController *)self idleTimer];
    [v9 setDelegate:self];
  }
  else
  {
    [(NavContainerViewController *)self setIdleTimer:0];
  }
}

- (void)idleTimerDidTimeout:(id)a3
{
  double v4 = [(NavContainerViewController *)self coordinator];
  id v5 = [v4 defaultContaineeViewControllerType];

  if (v5 == (id)1) {
    return;
  }
  id v6 = [(ContainerViewController *)self currentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_5;
  }
  int v7 = [(ContainerViewController *)self currentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

LABEL_5:
LABEL_6:
    [(ContainerViewController *)self popLastViewControllerAnimated:1];
    return;
  }
  id v8 = [(ContainerViewController *)self currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_6;
  }
  id v10 = [(ContainerViewController *)self currentViewController];
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  if (v11)
  {
    id v12 = [(NavContainerViewController *)self coordinator];
    [v12 dismissModalContainee];

    id v13 = [(NavContainerViewController *)self coordinator];
    [v13 dismissTray];
  }
  else
  {
    [(ContainerViewController *)self setLayoutIfSupported:1 animated:1];
  }
}

- (int)currentUITargetForAnalytics
{
  int64_t v2 = [(NavContainerViewController *)self route];
  unsigned int v3 = [v2 transportType] - 1;
  if (v3 > 4) {
    int v4 = 401;
  }
  else {
    int v4 = dword_100F74148[v3];
  }

  return v4;
}

- (int)currentMapViewTargetForAnalytics
{
  int64_t v2 = [(ContainerViewController *)self currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 506;
  }
  else {
    return 505;
  }
}

- (void)willBeginDisplayingInSecureLockScreen
{
  v3.receiver = self;
  v3.super_class = (Class)NavContainerViewController;
  [(ContainerViewController *)&v3 willBeginDisplayingInSecureLockScreen];
  [(NavContainerViewController *)self hideStatusBarIfNeeded];
  [(NavContainerViewController *)self setIdleTimer:0];
}

- (void)vlfSessionTaskWillShowVLFUINotification:(id)a3
{
  [(UIView *)self->_navSignContainerView setHidden:1];
  int v4 = [(NavContainerViewController *)self indicatorsViewController];
  id v5 = [v4 view];
  [v5 setHidden:1];

  self->_vlfActive = 1;
  [(NavContainerViewController *)self _updateRecenterButtonLayout];
  id v6 = [(NavContainerViewController *)self iosBasedChromeViewController];
  [v6 setNeedsUpdateComponent:@"statusBarStyle" animated:0];
}

- (void)vlfContaineeViewControllerDidDisappearNotification:(id)a3
{
  [(UIView *)self->_navSignContainerView setHidden:0];
  int v4 = [(NavContainerViewController *)self indicatorsViewController];
  id v5 = [v4 view];
  [v5 setHidden:0];

  self->_vlfActive = 0;
  [(NavContainerViewController *)self _updateRecenterButtonLayout];
  id v6 = [(NavContainerViewController *)self iosBasedChromeViewController];
  [v6 setNeedsUpdateComponent:@"statusBarStyle" animated:0];
}

- (void)_sceneConnectionsDidChange
{
  BOOL v3 = +[UIApplication _maps_isAnySceneConnectedForRole:_UIWindowSceneSessionRoleCarPlay];

  [(NavContainerViewController *)self setConnectedToCarPlay:v3 animated:1];
}

- (void)sceneWillEnterForeground:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NavContainerViewController;
  id v4 = a3;
  [(ContainerViewController *)&v8 sceneWillEnterForeground:v4];
  id v5 = [v4 object];

  id v6 = [(ContainerViewController *)self chromeViewController];
  int v7 = [v6 _maps_uiScene];

  if (v5 == v7) {
    [(NavContainerViewController *)self _applyConnectedToCarPlayAnimated:0];
  }
}

- (void)setConnectedToCarPlay:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_connectedToCarPlay != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    int v7 = sub_10000AF10();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      self->_BOOL connectedToCarPlay = v5;
      [(NavContainerViewController *)self _applyConnectedToCarPlayAnimated:v4];
      return;
    }
    objc_super v8 = self;
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      char v11 = [(NavContainerViewController *)v8 performSelector:"accessibilityIdentifier"];
      id v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        id v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_8;
      }
    }
    id v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

    BOOL connectedToCarPlay = self->_connectedToCarPlay;
    *(_DWORD *)buf = 138543874;
    char v16 = v13;
    __int16 v17 = 1024;
    BOOL v18 = connectedToCarPlay;
    __int16 v19 = 1024;
    BOOL v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Changing connectedToCarPlay from %d to %d", buf, 0x18u);

    goto LABEL_9;
  }
}

- (void)_applyConnectedToCarPlayAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    if (!v6)
    {
      char v11 = @"<nil>";
      goto LABEL_10;
    }
    int v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(NavContainerViewController *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        char v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    char v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    BOOL connectedToCarPlay = v6->_connectedToCarPlay;
    *(_DWORD *)buf = 138543618;
    __int16 v17 = v11;
    __int16 v18 = 1024;
    BOOL v19 = connectedToCarPlay;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Applying connectedToCarPlay %d", buf, 0x12u);
  }
  id v13 = [(NavContainerViewController *)self navSignViewController];
  [v13 setConnectedToCarPlay:self->_connectedToCarPlay animated:v3];

  if (self->_connectedToCarPlay)
  {
    unsigned int v14 = +[UIDevice currentDevice];
    [v14 setOrientation:1 animated:v3];
  }
  [(NavContainerViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D9B56C;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setSignListHeight:(double)a3
{
  BOOL v5 = [(NavContainerViewController *)self view];
  [v5 frame];
  double MaxY = CGRectGetMaxY(v12);
  [(UIView *)self->_navSignContainerView frame];
  double v7 = MaxY - CGRectGetMinY(v13);
  [(NSLayoutConstraint *)self->_signTopConstraint constant];
  double v9 = v7 - v8;

  if (v9 <= a3) {
    double v10 = v9;
  }
  else {
    double v10 = a3;
  }
  self->_signListdouble Height = v10;

  [(NavContainerViewController *)self _updateContaineeHiddenIfNeeded];
}

- (void)_updateContaineeHiddenIfNeeded
{
  id v16 = [(ContainerViewController *)self currentViewController];
  BOOL v3 = [v16 cardPresentationController];
  if (([v3 usingSheetPresentation] & 1) == 0)
  {
LABEL_10:

    return;
  }
  BOOL v4 = [(ContainerViewController *)self currentViewController];
  if ([v4 isBeingPresented])
  {
LABEL_9:

    goto LABEL_10;
  }
  BOOL v5 = [(ContainerViewController *)self currentViewController];
  if ([v5 isBeingDismissed])
  {
LABEL_8:

    goto LABEL_9;
  }
  id v6 = [(NavContainerViewController *)self view];
  uint64_t v7 = [v6 superview];
  if (!v7)
  {
LABEL_7:

    goto LABEL_8;
  }
  double v8 = (void *)v7;
  double v9 = [(ContainerViewController *)self chromeViewController];
  double v10 = [v9 currentIOSBasedContext];
  char v11 = [(ContainerViewController *)self chromeContext];
  if (v10 != v11)
  {

    goto LABEL_7;
  }
  unsigned __int8 v12 = [(NavContainerViewController *)self _isPresentingOverlappingContainee];

  if ((v12 & 1) == 0)
  {
    [(ContainerViewController *)self setContaineesHidden:[(NavContainerViewController *)self shouldHideCard]];
    signListdouble Height = self->_signListHeight;
    [(NavSignListViewController *)self->_navSignViewController collapsedHeight];
    if (signListHeight > v14)
    {
      pedestrianARFeatureIntroTeachableMomentTimer = self->_pedestrianARFeatureIntroTeachableMomentTimer;
      [(GCDTimer *)pedestrianARFeatureIntroTeachableMomentTimer invalidate];
    }
  }
}

- (BOOL)_isPresentingOverlappingContainee
{
  uint64_t v2 = [(ContainerViewController *)self currentViewController];
  BOOL v3 = (void *)v2;
  if (qword_1016111F0 != -1)
  {
    dispatch_once(&qword_1016111F0, &stru_101323D58);
    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    unsigned __int8 v4 = 0;
    goto LABEL_6;
  }
  if (!v2) {
    goto LABEL_5;
  }
LABEL_3:
  unsigned __int8 v4 = [(id)qword_1016111E8 containsObject:objc_opt_class()];
LABEL_6:

  return v4;
}

- (void)signListHeightWillChangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(ContainerViewController *)self currentViewController];
  id v6 = [v5 cardPresentationController];
  id v7 = [v6 containeeLayout];

  if (v7 == (id)2)
  {
    double v8 = [(ContainerViewController *)self currentViewController];
    double v9 = [v8 cardPresentationController];
    [v9 wantsLayout:1];
  }
  double v10 = 0.0;
  if (v3) {
    double v10 = 0.25;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100D9BAF4;
  v11[3] = &unk_1012E5D08;
  v11[4] = self;
  +[UIView animateWithDuration:v11 animations:v10];
}

- (void)selectStep:(id)a3
{
  id v4 = a3;
  id v17 = v4;
  if (v4)
  {
    id v5 = [v4 stepIndex];
    id v6 = [(NavContainerViewController *)self route];
    id v7 = [v6 segmentIndexForStepIndex:v5];

    double v8 = [(NavContainerViewController *)self mapView];
    [v8 _setRouteContextInspectedSegmentIndex:v7 inspectedStepIndex:v5];

    double v9 = sub_1008C0030(v17);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    id v16 = [(NavContainerViewController *)self coordinator];
    [v16 viewController:self updateMapRect:v9, v11, v13, v15];
  }
  else
  {
    id v16 = [(NavContainerViewController *)self coordinator];
    [v16 recenterNavigation];
  }

  [(NavContainerViewController *)self updateLayoutAnimated:1];
}

- (void)pressedEndNavigationWithSender:(id)a3
{
  id v4 = a3;
  id v5 = [(NavContainerViewController *)self coordinator];
  [v5 pressedEndWithSender:v4];
}

- (void)updatedLaneGuidanceHeight:(double)a3
{
  -[NSLayoutConstraint setConstant:](self->_signTopConstraint, "setConstant:");
  [(NSLayoutConstraint *)self->_laneGuidanceHeightConstraint setConstant:a3];
  [(UIView *)self->_navSignContainerView frame];
  double v5 = CGRectGetHeight(v13) - a3;
  if (fabs(a3) <= 2.22044605e-16)
  {
    id v6 = [(NavContainerViewController *)self navSignViewController];
    if ([v6 isExpanded])
    {
      id v7 = [(NavContainerViewController *)self navSignViewController];
      unsigned int v8 = [v7 isDragging];

      if (!v8) {
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  [(NavContainerViewController *)self signListHeight];
  if (v9 < v5)
  {
    [(NavContainerViewController *)self signListHeight];
    double v5 = v10;
  }
LABEL_8:
  [(NavContainerViewController *)self setSignListHeight:v5];
  double v11 = [(NavContainerViewController *)self navSignViewController];
  [v11 updateFooterConstraints];

  [(NavContainerViewController *)self _indicatorsTopPosition];
  -[NSLayoutConstraint setConstant:](self->_portraitIndicatorsTopConstraint, "setConstant:");
  [(NavContainerViewController *)self _secondarySignTopPosition];
  -[NSLayoutConstraint setConstant:](self->_secondarySignTopConstraint, "setConstant:");
  [(NavContainerViewController *)self _junctionViewTopPosition];
  -[NSLayoutConstraint setConstant:](self->_junctionViewTopConstraint, "setConstant:");
  [(ContainerViewController *)self updateMapEdgeInsets];
  [(NavContainerViewController *)self _updateLaneGuidanceViewLayout];

  [(NavContainerViewController *)self _updateNavSignLayout];
}

- (void)didTapLaneGuidance
{
  BOOL v3 = sub_10000AF10();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Toggling nav sign list due to lane guidance tap", v5, 2u);
  }

  id v4 = [(NavContainerViewController *)self navSignViewController];
  [v4 toggleExpansionAnimated:1];
}

- (double)_belowSignTopPosition
{
  [(NSLayoutConstraint *)self->_laneGuidanceHeightConstraint constant];
  double v4 = v3;
  double v5 = [(NavContainerViewController *)self navSignViewController];
  [v5 collapsedHeight];
  double v7 = v4 + v6;

  return v7;
}

- (double)_indicatorsTopPosition
{
  [(NavContainerViewController *)self _belowSignTopPosition];
  double v4 = v3;
  unsigned int v5 = [(NavContainerViewController *)self _isSecondarySignVisible];
  double v6 = -0.0;
  if (v5) {
    double v6 = 52.0;
  }
  return v4 + v6;
}

- (double)_indicatorsTrailingInset
{
  uint64_t v2 = [(NavContainerViewController *)self view];
  [v2 safeAreaInsets];
  double v4 = v3;

  double result = 0.0;
  if (v4 > 0.0) {
    return 16.0;
  }
  return result;
}

- (double)_usedPortraitTopSpace
{
  double v3 = [(ContainerViewController *)self chromeViewController];
  double v4 = [v3 viewport];
  [v4 frame];
  double MinY = CGRectGetMinY(v17);

  [(NSLayoutConstraint *)self->_laneGuidanceHeightConstraint constant];
  double v7 = v6;
  double Height = 0.0;
  double v9 = 0.0;
  if (![(UIView *)self->_navSignContainerView isHidden])
  {
    double v10 = [(NavContainerViewController *)self navSignViewController];
    [v10 collapsedHeight];
    double v9 = v11;
  }
  unsigned int v12 = [(NavContainerViewController *)self _isSecondarySignVisible];
  if (self->_junctionViewDisplayed)
  {
    CGRect v13 = [(NavContainerViewController *)self junctionViewController];
    double v14 = [v13 view];
    [v14 frame];
    double Height = CGRectGetHeight(v18);
  }
  double v15 = 52.0;
  if (!v12) {
    double v15 = 0.0;
  }
  if (v15 <= Height) {
    double v15 = Height;
  }
  return MinY + v7 + v9 + v15;
}

- (double)_navSignBottomPosition
{
  [(NSLayoutConstraint *)self->_signTopConstraint constant];
  double v4 = v3;
  unsigned int v5 = [(NavContainerViewController *)self navSignViewController];
  [v5 collapsedHeight];
  double v7 = v4 + v6;

  return v7;
}

- (double)_secondarySignTopPosition
{
  unsigned int v3 = [(NavContainerViewController *)self _isSecondarySignVisible];
  [(NavContainerViewController *)self _navSignBottomPosition];
  double v5 = 52.0;
  if (v3) {
    double v5 = 0.0;
  }
  return v4 - v5;
}

- (double)_junctionViewTopPosition
{
  BOOL junctionViewDisplayed = self->_junctionViewDisplayed;
  [(NavContainerViewController *)self _navSignBottomPosition];
  double v5 = v4;
  if (!junctionViewDisplayed)
  {
    [(NavContainerViewController *)self maxAvailableHeightForJunctionView:0.0];
    return v5 - v6;
  }
  return v5;
}

- (double)maxAvailableHeightForJunctionView:(double)a3
{
  [(NavContainerViewController *)self _maxAvailableHeightForJunctionView];
  double v4 = 250.0;
  if (v5 < 250.0)
  {
    [(NavContainerViewController *)self _maxAvailableHeightForJunctionView];
    double v4 = v6;
  }
  unint64_t v7 = [(ContainerViewController *)self containerStyle];
  if (v7 <= 7 && ((1 << v7) & 0xE3) != 0 && v4 < 150.0) {
    return 0.0;
  }
  return v4;
}

- (void)hideJunctionViewTemporarily
{
  [(NavContainerViewController *)self hideJunctionViewIfNeededAnimated:1];
  objc_initWeak(&location, self);
  id v3 = &_dispatch_main_q;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100D9C340;
  v6[3] = &unk_1012E7638;
  objc_copyWeak(&v7, &location);
  double v4 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v6 block:10.0];
  junctionViewTimer = self->_junctionViewTimer;
  self->_junctionViewTimer = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)applyTransitionWithProgress:(double)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NavContainerViewController;
  -[OverlayContainerViewController applyTransitionWithProgress:](&v14, "applyTransitionWithProgress:");
  double v5 = [(ContainerViewController *)self chromeViewController];
  double v6 = [v5 previousTopContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    id v7 = [(ContainerViewController *)self chromeViewController];
    unsigned int v8 = [v7 nextTopContext];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      return;
    }
  }
  [(UIView *)self->_navSignContainerView setAlpha:a3];
  double v10 = [(NavContainerViewController *)self indicatorsViewController];
  double v11 = [v10 view];
  [v11 setAlpha:a3];

  unsigned int v12 = [(ContainerViewController *)self currentViewController];
  CGRect v13 = [v12 view];
  [v13 setAlpha:a3];
}

- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [(NavContainerViewController *)self _isSecondarySignVisible];
  id v7 = [v5 secondarySign];

  self->_secondarySignActive = v7 != 0;
  if (v6 != [(NavContainerViewController *)self _isSecondarySignVisible]) {
    [(NavContainerViewController *)self _drawSecondarySign];
  }
  id v9 = [(NavContainerViewController *)self traitCollection];
  if ([v9 isLuminanceReduced])
  {
    char BOOL = GEOConfigGetBOOL();

    if ((BOOL & 1) == 0)
    {
      [(NavContainerViewController *)self _updateBacklightSceneEnvironmentUI];
    }
  }
  else
  {
  }
}

- (void)navigationService:(id)a3 showLaneDirections:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [(NavContainerViewController *)self _isSecondarySignVisible];
  unsigned __int8 v7 = [v5 isForManeuver];

  self->_isShowingMidstepLaneGuidance = v7 ^ 1;
  if (v6 != [(NavContainerViewController *)self _isSecondarySignVisible])
  {
    [(NavContainerViewController *)self _drawSecondarySign];
  }
}

- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4
{
  unsigned int v5 = [(NavContainerViewController *)self _isSecondarySignVisible];
  self->_isShowingMidstepLaneGuidance = 0;
  if (v5 != [(NavContainerViewController *)self _isSecondarySignVisible])
  {
    [(NavContainerViewController *)self _drawSecondarySign];
  }
}

- (void)navigationService:(id)a3 showJunctionView:(id)a4
{
  self->_junctionViewActive = 1;
  id v5 = a4;
  unsigned int v6 = [[NavJunctionViewInfo alloc] initWithGuidanceJunctionViewInfo:v5];

  unsigned __int8 v7 = [(NavContainerViewController *)self junctionViewController];
  [v7 setJunctionViewInfo:v6];

  [(NavContainerViewController *)self showJunctionViewIfNeeded];
}

- (void)navigationService:(id)a3 hideJunctionViewForId:(id)a4
{
  self->_junctionViewActive = 0;
  -[NavContainerViewController hideJunctionViewIfNeededAnimated:](self, "hideJunctionViewIfNeededAnimated:", 1, a4);
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if ((MNNavigationServiceStateChangedFromNavigatingToStopped() & 1) != 0
    || MNNavigationServiceStateChangedToNavigating())
  {
    id v6 = [(NavContainerViewController *)self iosBasedChromeViewController];
    [v6 setNeedsUpdateComponent:@"statusBarStyle" animated:0];
  }
}

- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4
{
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
}

- (void)_updateArrivalStateForced:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[MNNavigationService sharedService];
  id v7 = [v5 arrivalInfo];

  if (v7) {
    BOOL v6 = [v7 arrivalState] != 0;
  }
  else {
    BOOL v6 = 0;
  }
  [(NavContainerViewController *)self _updateNavSignForArrival:v6 forced:v3];
}

- (void)_updateNavSignForArrival:(BOOL)a3 forced:(BOOL)a4
{
  if (self->_isArrivalState != a3 || a4)
  {
    BOOL v5 = a3;
    self->_isArrivalState = a3;
    if (![(NavContainerViewController *)self isConnectedToCarPlay]) {
      [(UIView *)self->_navSignContainerView setHidden:v5];
    }
    [(NavContainerViewController *)self _updateControlsHiddenAnimated:1];
    [(NavContainerViewController *)self _updateChildViewLayouts];
    [(NavContainerViewController *)self _updateContaineeHiddenIfNeeded];
    [(ContainerViewController *)self updateMapEdgeInsets];
    id v7 = [(NavContainerViewController *)self iosBasedChromeViewController];
    [v7 setNeedsUpdateComponent:@"statusBarStyle" animated:1];

    unsigned int v8 = [(NavContainerViewController *)self iosBasedChromeViewController];
    [v8 setNeedsUpdateComponent:@"StaleMapEffect" animated:1];

    id v9 = [(NavContainerViewController *)self iosBasedChromeViewController];
    [v9 updateComponentsIfNeeded];
  }
}

- (BOOL)_isSecondarySignVisible
{
  return self->_isShowingMidstepLaneGuidance || self->_secondarySignActive;
}

- (void)_drawSecondarySign
{
  BOOL v3 = [(NavContainerViewController *)self view];
  [v3 layoutIfNeeded];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100D9CAA8;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  +[UIView animateWithDuration:v4 animations:0.25];
}

- (void)_updateBacklightSceneEnvironmentUI
{
  if (GEOConfigGetBOOL())
  {
    lastBacklightSceneUpdateDate = self->_lastBacklightSceneUpdateDate;
    if (lastBacklightSceneUpdateDate)
    {
      [(NSDate *)lastBacklightSceneUpdateDate timeIntervalSinceNow];
      if (v4 > -0.9) {
        return;
      }
    }
    BOOL v5 = (NSDate *)objc_opt_new();
    BOOL v6 = self->_lastBacklightSceneUpdateDate;
    self->_lastBacklightSceneUpdateDate = v5;
  }
  id v10 = [(NavContainerViewController *)self view];
  id v7 = [v10 window];
  unsigned int v8 = [v7 windowScene];
  id v9 = [v8 _backlightSceneEnvironment];
  [v9 invalidateAllTimelinesForReason:@"Navigation service received sign info update"];
}

- (BOOL)_shouldShowPedestrianARTeachableMomentCard
{
  if (!self->_pedestrianARSessionStateManager)
  {
    BOOL v5 = sub_10000AF10();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    LOWORD(v11) = 0;
    id v7 = "Not showing Pedestrian AR teachable moment card because the feature is not enabled";
    goto LABEL_17;
  }
  BOOL v3 = +[UIApplication sharedMapsDelegate];
  double v4 = (char *)[v3 currentInterruptionKind];

  if (!v4)
  {
    if (([(ContainerViewController *)self containerStyle] & 0xFFFFFFFFFFFFFFFDLL) == 4)
    {
      BOOL v5 = sub_10000AF10();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_19;
      }
      LOWORD(v11) = 0;
      id v7 = "Not showing Pedestrian AR teachable moment card because the phone is in landscape";
    }
    else
    {
      if ([(PedestrianARSessionStateManager *)self->_pedestrianARSessionStateManager shouldShowPedestrianAR])
      {
        return 1;
      }
      BOOL v5 = sub_10000AF10();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_19;
      }
      LOWORD(v11) = 0;
      id v7 = "Not showing the Pedestrian AR teachable moment card because the feature is not available right now";
    }
LABEL_17:
    id v9 = v5;
    uint32_t v10 = 2;
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v11, v10);
    goto LABEL_19;
  }
  BOOL v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(v4 - 2) > 0x15) {
      CFStringRef v6 = @"kMapsInterruptionDirectionsSafetyWarning";
    }
    else {
      CFStringRef v6 = off_101323DF8[(void)(v4 - 2)];
    }
    int v11 = 138412290;
    CFStringRef v12 = v6;
    id v7 = "Not showing Pedestrian AR teachable moment card because there is currently an interruption present: %@";
    id v9 = v5;
    uint32_t v10 = 12;
    goto LABEL_18;
  }
LABEL_19:

  return 0;
}

- (void)_showPedestrianARFeatureIntroTeachableMomentCardIfNecessary
{
  if (![(NavContainerViewController *)self _shouldShowPedestrianARTeachableMomentCard])
  {
    double v4 = sub_10000AF10();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    __int16 v10 = 0;
    CFStringRef v6 = "Not showing Pedestrian AR feature intro teachable moment card because we should not show any teachable moment cards right now";
    id v7 = (uint8_t *)&v10;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v6, v7, 2u);
    goto LABEL_11;
  }
  unsigned __int8 v3 = +[PedestrianARFeatureIntroTeachableMomentContaineeViewController shouldShowTeachableMoment];
  double v4 = sub_10000AF10();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if ((v3 & 1) == 0)
  {
    if (!v5) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    CFStringRef v6 = "Not showing Pedestrian AR feature intro teachable moment card because it is not eligible to be shown";
    id v7 = buf;
    goto LABEL_10;
  }
  if (v5)
  {
    *(_WORD *)unsigned int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Showing the Pedestrian AR feature intro teachable moment card", v8, 2u);
  }

  double v4 = [(NavContainerViewController *)self coordinator];
  [v4 showPedestrianARFeatureIntroTeachableMomentCard];
LABEL_11:
}

- (void)_showPedestrianARRaiseToEnterTeachableMomentCardIfNecessary
{
  if ([(NavContainerViewController *)self _shouldShowPedestrianARTeachableMomentCard])
  {
    if (+[PedestrianARRaiseToEnterTeachableMomentContaineeViewController hasShownTeachableMoment])
    {
      unsigned __int8 v3 = sub_10000AF10();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        __int16 v17 = 0;
        double v4 = "Not showing Pedestrian AR raise to enter teachable moment card because it has already been shown before";
        BOOL v5 = (uint8_t *)&v17;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
      }
    }
    else
    {
      CFStringRef v6 = +[PedestrianARSessionUsageTracker sharedInstance];
      id v7 = [(NavContainerViewController *)self route];
      unsigned int v8 = [v7 uniqueRouteID];
      id v9 = [v8 UUIDString];
      unsigned __int8 v10 = [v6 hasAREverLocalizedForRoute:v9];

      if ((v10 & 1) == 0)
      {
        unsigned __int8 v3 = sub_10000AF10();
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
          goto LABEL_8;
        }
        __int16 v16 = 0;
        double v4 = "Not showing Pedestrian AR raise to enter teachable moment card because the user hasn't localized on the current route yet";
        BOOL v5 = (uint8_t *)&v16;
        goto LABEL_7;
      }
      int v11 = +[PedestrianARSessionUsageTracker sharedInstance];
      unsigned __int8 v12 = [v11 hasARElementRendered];

      unsigned __int8 v3 = sub_10000AF10();
      BOOL v13 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
      if ((v12 & 1) == 0)
      {
        if (!v13) {
          goto LABEL_8;
        }
        __int16 v15 = 0;
        double v4 = "Not showing Pedestrian AR raise to enter teachable moment card because the user hasn't seen an AR element yet";
        BOOL v5 = (uint8_t *)&v15;
        goto LABEL_7;
      }
      if (v13)
      {
        *(_WORD *)objc_super v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Showing the Pedestrian AR raise to enter teachable moment card", v14, 2u);
      }

      unsigned __int8 v3 = [(NavContainerViewController *)self coordinator];
      [v3 showPedestrianARRaiseToEnterTeachableMomentCard];
    }
  }
  else
  {
    unsigned __int8 v3 = sub_10000AF10();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      double v4 = "Not showing Pedestrian AR raise to enter teachable moment card because we should not show any teachable momen"
           "t cards right now";
      BOOL v5 = buf;
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (double)signListHeight
{
  return self->_signListHeight;
}

- (NavContainerBannerAction)bannerAction
{
  return self->_bannerAction;
}

- (NavActionCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (BOOL)showingTemporaryStatusBar
{
  return self->_showingTemporaryStatusBar;
}

- (void)setShowingTemporaryStatusBar:(BOOL)a3
{
  self->_showingTemporaryStatusBar = a3;
}

- (GuidanceObserver)guidanceObserver
{
  return self->_guidanceObserver;
}

- (double)availableHeightForJunctionView
{
  return self->_availableHeightForJunctionView;
}

- (unint64_t)signStyle
{
  return self->_signStyle;
}

- (BOOL)shouldShowNavIndicators
{
  return self->_shouldShowNavIndicators;
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
}

- (void)setDebugViewsController:(id)a3
{
}

- (BOOL)debugViewControllerEnabled
{
  return self->_debugViewControllerEnabled;
}

- (NavContainerResumeRouteControl)resumeRouteBanner
{
  return self->_resumeRouteBanner;
}

- (NavIdleTimeoutTimer)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
}

- (void)setLaneGuidanceViewController:(id)a3
{
}

- (void)setNavSignViewController:(id)a3
{
}

- (void)setJunctionViewController:(id)a3
{
}

- (void)setSecondarySignViewController:(id)a3
{
}

- (void)setIndicatorsViewController:(id)a3
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

- (BOOL)isConnectedToCarPlay
{
  return self->_connectedToCarPlay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusIndicatorView, 0);
  objc_storeStrong((id *)&self->_statusIndicatorManager, 0);
  objc_storeStrong((id *)&self->_indicatorsViewController, 0);
  objc_storeStrong((id *)&self->_secondarySignViewController, 0);
  objc_storeStrong((id *)&self->_junctionViewController, 0);
  objc_storeStrong((id *)&self->_navSignViewController, 0);
  objc_storeStrong((id *)&self->_laneGuidanceViewController, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_resumeRouteBanner, 0);
  objc_storeStrong((id *)&self->_debugViewsController, 0);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_guidanceObserver, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_bannerAction, 0);
  objc_storeStrong((id *)&self->_lastBacklightSceneUpdateDate, 0);
  objc_storeStrong((id *)&self->_recenterButton, 0);
  objc_storeStrong((id *)&self->_pedestrianARFeatureIntroTeachableMomentTimer, 0);
  objc_storeStrong((id *)&self->_pedestrianARSessionStateManager, 0);
  objc_storeStrong((id *)&self->_suppressedContainee, 0);
  objc_storeStrong((id *)&self->_junctionViewTimer, 0);
  objc_storeStrong((id *)&self->_temporaryStatusBarHidingTimer, 0);
  objc_storeStrong((id *)&self->_laneGuidanceHeightConstraint, 0);
  objc_storeStrong((id *)&self->_landscapeIndicatorsTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_landscapeIndicatorsConstraints, 0);
  objc_storeStrong((id *)&self->_portraitIndicatorsTopConstraint, 0);
  objc_storeStrong((id *)&self->_portraitIndicatorsConstraints, 0);
  objc_storeStrong((id *)&self->_junctionViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_secondarySignTopConstraint, 0);
  objc_storeStrong((id *)&self->_signTopConstraint, 0);
  objc_storeStrong((id *)&self->_signContainerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_signContainerTopConstraint, 0);

  objc_storeStrong((id *)&self->_navSignContainerView, 0);
}

@end