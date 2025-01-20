@interface ControlContainerViewController
+ (Class)actionCoordinatorClass;
- (ActionCoordinator)actionCoordinator;
- (BOOL)_canShowWhileLocked;
- (BOOL)_chromeEnabled;
- (BOOL)_permitCompassShowing;
- (BOOL)delaysFirstCardPresentation;
- (BOOL)isRootContainer;
- (BOOL)mapViewShouldHandleTapToDeselect:(id)a3;
- (CGRect)lookAroundButtonFrame;
- (ControlContainerViewController)initWithPlatformController:(id)a3;
- (FloatingControlsPresentation)floatingControlsPresentationController;
- (IOSBasedChromeContext)chromeContext;
- (NSDate)dateCreated;
- (PlatformController)platformController;
- (StatusIndicatorManager)statusIndicatorManager;
- (StatusIndicatorView)statusIndicatorView;
- (UIView)passThroughView;
- (UIViewController)viewControllerInActivePresentation;
- (double)_topBannerMaxHeight;
- (id)_controlContainerDimmingBehaviour;
- (id)_mapViewIfCurrent;
- (id)_topBannerViewHorizontalConstraints;
- (id)coordinator;
- (id)keyCommands;
- (id)statusBarBackgroundViewStyle;
- (id)statusBarSupplementaryView;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int64_t)floatingControlsOptions;
- (int64_t)preferredUserInterfaceStyle;
- (unint64_t)originalLayoutForViewController:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_cancelAllOngoingGesturesBeingRecognizedInView:(id)a3;
- (void)_captureStatusIndicatorViewTapAction:(int)a3;
- (void)_didTapStatusIndicatorView:(id)a3;
- (void)_offlineMapsStateChanged;
- (void)_setUpdateContentInjectionBlockForController:(id)a3;
- (void)containerStyleManagerDidChangeStyle:(unint64_t)a3;
- (void)containerStyleManagerWillChangeStyle:(unint64_t)a3;
- (void)contentHeightUpdatedWithValue:(double)a3;
- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)expandPlaceCardController;
- (void)mapView:(id)a3 calloutPrimaryActionTriggeredForAnnotationView:(id)a4;
- (void)mapView:(id)a3 calloutPrimaryActionTriggeredForLabelMarker:(id)a4;
- (void)mapView:(id)a3 didBecomePitched:(BOOL)a4;
- (void)mapView:(id)a3 didChangeDisplayedFloorOrdinal:(signed __int16)a4 forVenue:(id)a5;
- (void)mapView:(id)a3 didChangeFocusedVenue:(id)a4 focusedBuilding:(id)a5;
- (void)mapView:(id)a3 didChangeLookAroundAvailability:(int64_t)a4;
- (void)mapView:(id)a3 didChangeMapType:(unint64_t)a4;
- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5;
- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6;
- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8;
- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4;
- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5;
- (void)mapViewDidChangeVisibleRegion:(id)a3;
- (void)mapViewDidStartUserInteraction:(id)a3;
- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5 completion:(id)a6;
- (void)refreshControls;
- (void)removeControllersFromStack:(id)a3;
- (void)replaceCurrentWithController:(id)a3 moveToContaineeLayout:(unint64_t)a4;
- (void)resetState;
- (void)setChromeContext:(id)a3;
- (void)setChromeHidden:(BOOL)a3;
- (void)setChromeViewController:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setPlatformController:(id)a3;
- (void)setStatusIndicatorManager:(id)a3;
- (void)setStatusIndicatorView:(id)a3;
- (void)setViewControllerInActivePresentation:(id)a3;
- (void)statusIndicatorTypeChanged:(unint64_t)a3;
- (void)transitionAlongsideContainee:(id)a3 animated:(BOOL)a4;
- (void)updateContentInjection;
- (void)updateLayoutAnimated:(BOOL)a3;
- (void)updateTopBannerViewWithTopBannerItems:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willPresentContainee:(id)a3 animated:(BOOL)a4;
@end

@implementation ControlContainerViewController

- (void)resetState
{
  coordinator = self->_coordinator;
  id v3 = [(ContainerViewController *)self currentViewController];
  [(ActionCoordinator *)coordinator viewControllerClosed:v3 animated:0];
}

- (void)mapView:(id)a3 didChangeLookAroundAvailability:(int64_t)a4
{
  id v4 = [(ContainerViewController *)self chromeViewController];
  [v4 setNeedsUpdateComponent:@"lookAroundButton" animated:1];
}

- (void)setChromeViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ControlContainerViewController;
  [(ContainerViewController *)&v4 setChromeViewController:a3];
  [(ActionCoordinator *)self->_coordinator setContainerViewController:self];
}

- (void)refreshControls
{
  id v2 = [(ContainerViewController *)self chromeViewController];
  [v2 setNeedsUpdateComponent:@"floatingControls" animated:1];
}

- (void)mapView:(id)a3 didChangeMapType:(unint64_t)a4
{
  id v9 = a3;
  v6 = [(ContainerViewController *)self currentViewController];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(ContainerViewController *)self currentViewController];
    [v8 mapView:v9 didChangeMapType:a4];
  }
}

- (FloatingControlsPresentation)floatingControlsPresentationController
{
  id v2 = [(ContainerViewController *)self chromeViewController];
  id v3 = [v2 floatingControlsOverlay];

  return (FloatingControlsPresentation *)v3;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)ControlContainerViewController;
  [(OverlayContainerViewController *)&v5 viewDidLoad];
  id v3 = [(ControlContainerViewController *)self statusIndicatorManager];
  [v3 updateIndicatorType];

  objc_super v4 = [(OverlayContainerViewController *)self topContentView];
  [v4 setHidden:1];
}

- (void)containerStyleManagerDidChangeStyle:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ControlContainerViewController;
  [(ContainerViewController *)&v9 containerStyleManagerDidChangeStyle:a3];
  objc_super v4 = [(ContainerViewController *)self currentViewController];
  unsigned int v5 = [v4 conformsToProtocol:&OBJC_PROTOCOL___FloatingControlsProtocol];

  if (v5)
  {
    [(ControlContainerViewController *)self refreshControls];
    v6 = [(ContainerViewController *)self chromeViewController];
    [v6 setNeedsUpdateComponent:@"weatherOverlay" animated:1];

    char v7 = [(ContainerViewController *)self chromeViewController];
    [v7 setNeedsUpdateComponent:@"lookAroundButton" animated:1];

    v8 = [(ControlContainerViewController *)self statusIndicatorView];
    [v8 setProminent:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ControlContainerViewController;
  [(OverlayContainerViewController *)&v5 viewDidAppear:a3];
  objc_super v4 = [(ContainerViewController *)self currentViewController];

  if (!v4) {
    [(ActionCoordinator *)self->_coordinator viewControllerClosed:0 animated:1];
  }
}

- (void)statusIndicatorTypeChanged:(unint64_t)a3
{
  BOOL v5 = [(ControlContainerViewController *)self _appearState] == 2;
  v6 = [(ControlContainerViewController *)self statusIndicatorView];
  [v6 setType:a3];

  id v7 = [(ControlContainerViewController *)self iosBasedChromeViewController];
  [v7 setNeedsUpdateComponent:@"statusBarSupplementaryView" animated:v5];
}

- (void)transitionAlongsideContainee:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)ControlContainerViewController;
  id v6 = a3;
  [(ContainerViewController *)&v9 transitionAlongsideContainee:v6 animated:v4];
  id v7 = [(ContainerViewController *)self chromeViewController];
  v8 = [v6 transitionCoordinator];

  [v7 updateComponentsIfNeededWithTansitionCoordinator:v8];
}

- (void)willPresentContainee:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)ControlContainerViewController;
  -[ContainerViewController willPresentContainee:animated:](&v8, "willPresentContainee:animated:", a3);
  id v6 = [(ContainerViewController *)self chromeViewController];
  [v6 setNeedsUpdateComponent:@"lookAroundButton" animated:v4];

  id v7 = [(ContainerViewController *)self chromeViewController];
  [v7 setNeedsUpdateComponent:@"weatherOverlay" animated:v4];
}

- (ControlContainerViewController)initWithPlatformController:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ControlContainerViewController;
  id v6 = [(ContainerViewController *)&v16 initWithNibName:0 bundle:0];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_platformController, a3);
    objc_super v8 = (ActionCoordinator *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "actionCoordinatorClass")), "initWithPlatformController:", v7->_platformController);
    coordinator = v7->_coordinator;
    v7->_coordinator = v8;

    v7->_dateCreated = (NSDate *)+[NSDate now];
    v10 = [(ControlContainerViewController *)v7 _controlContainerDimmingBehaviour];
    [(OverlayContainerViewController *)v7 setDimmingBehaviour:v10];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v7 selector:"_applicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v7 selector:"_applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v7 selector:"_offlineMapsStateChanged" name:@"UsingOfflineMapsStateChangedNotification" object:0];

    v14 = [[StatusIndicatorManager alloc] initWithDelegate:v7];
    [(ControlContainerViewController *)v7 setStatusIndicatorManager:v14];
  }
  return v7;
}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(ActionCoordinator *)self->_coordinator venuesManager];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    objc_super v9 = [(ActionCoordinator *)self->_coordinator venuesManager];
    [v9 mapView:v10 didUpdateUserLocation:v6];
  }
}

- (id)_controlContainerDimmingBehaviour
{
  id v2 = +[NSMapTable strongToStrongObjectsMapTable];
  id v3 = sub_100105C1C();
  [v2 setObject:v3 forKey:objc_opt_class()];

  BOOL v4 = sub_100075F60();
  [v2 setObject:v4 forKey:objc_opt_class()];

  id v5 = sub_100075F60();
  [v2 setObject:v5 forKey:objc_opt_class()];

  id v6 = sub_100075F60();
  [v2 setObject:v6 forKey:objc_opt_class()];

  id v7 = [OverlayContainerDimmingController alloc];
  char v8 = sub_10001F724(&stru_1012FF008);
  objc_super v9 = [(OverlayContainerDimmingController *)v7 initWithDimmingBehaviour:v8 customBehaviours:v2];

  return v9;
}

- (unint64_t)supportedInterfaceOrientations
{
  id v2 = +[UIDevice currentDevice];
  if ([v2 userInterfaceIdiom] == (id)1)
  {
    unint64_t v3 = 30;
  }
  else
  {
    BOOL v4 = +[UIDevice currentDevice];
    if ([v4 userInterfaceIdiom] == (id)5) {
      unint64_t v3 = 30;
    }
    else {
      unint64_t v3 = 26;
    }
  }
  return v3;
}

- (int64_t)preferredUserInterfaceStyle
{
  id v2 = [(ContainerViewController *)self chromeViewController];
  id v3 = [v2 preferredUserInterfaceStyle];

  return (int64_t)v3;
}

- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  v12 = [(ContainerViewController *)self currentViewController];
  id v13 = [(ContainerViewController *)self currentViewController];

  v16.receiver = self;
  v16.super_class = (Class)ControlContainerViewController;
  [(OverlayContainerViewController *)&v16 presentController:v10 animated:v8 useDefaultContaineeLayout:v7 completion:v11];

  if (v13 != v10)
  {
    if (v12)
    {
      v14 = [(ControlContainerViewController *)self statusIndicatorView];
      [v14 setProminent:0];
    }
    [(ControlContainerViewController *)self _setUpdateContentInjectionBlockForController:v10];
  }
  v15 = [(ContainerViewController *)self chromeViewController];
  [v15 setNeedsUpdateComponent:@"floatingControls" animated:1];
}

- (void)updateTopBannerViewWithTopBannerItems:(id)a3
{
  id v4 = a3;
  [(OverlayContainerViewController *)self topEdgeInset];
  double v6 = v5;
  v9.receiver = self;
  v9.super_class = (Class)ControlContainerViewController;
  [(OverlayContainerViewController *)&v9 updateTopBannerViewWithTopBannerItems:v4];

  if ([(ActionCoordinator *)self->_coordinator isRoutePlanningPresented])
  {
    BOOL v7 = [(ControlContainerViewController *)self view];
    [v7 layoutIfNeeded];

    [(OverlayContainerViewController *)self topEdgeInset];
    if (vabdd_f64(v6, v8) > 2.22044605e-16) {
      [(ActionCoordinator *)self->_coordinator ensureRoutePlanningContentIsVisible];
    }
  }
}

- (void)_setUpdateContentInjectionBlockForController:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = v4;
    objc_initWeak(&location, self);
    double v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    double v8 = sub_1006C8E80;
    objc_super v9 = &unk_1012F5260;
    objc_copyWeak(&v10, &location);
    [v5 setUpdateContentInjection:&v6];
    [v5 addContentToMapView:v6, v7, v8, v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (unint64_t)originalLayoutForViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(ContainerViewController *)self currentViewController];
  if (v5)
  {
    double v6 = [(ContainerViewController *)self currentViewController];
    uint64_t v7 = [v6 cardPresentationController];
    unint64_t v8 = (unint64_t)[v7 defaultContaineeLayout];
  }
  else
  {
    double v6 = [v4 cardPresentationController];
    unint64_t v8 = (unint64_t)[v6 defaultContaineeLayout];
  }

  if (!v8)
  {
    if ((id)[(ContainerViewController *)self containerStyle] == (id)5
      || (id)[(ContainerViewController *)self containerStyle] == (id)4)
    {
      unint64_t v8 = 3;
    }
    else if ((id)[(ContainerViewController *)self containerStyle] == (id)6)
    {
      unint64_t v8 = 3;
    }
    else
    {
      unint64_t v8 = 2;
    }
  }

  return v8;
}

- (id)statusBarBackgroundViewStyle
{
  return +[StatusBarBackgroundViewStyle defaultBlurredStyleWithDefaultColorProvider:&stru_1012F7D48];
}

- (id)coordinator
{
  return self->_coordinator;
}

- (id)_mapViewIfCurrent
{
  id v3 = [(ControlContainerViewController *)self chromeContext];
  id v4 = [(ContainerViewController *)self chromeViewController];
  id v5 = [v4 topIOSBasedContext];

  if (v3 == v5)
  {
    uint64_t v7 = [(ContainerViewController *)self chromeViewController];
    double v6 = [v7 mapView];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (IOSBasedChromeContext)chromeContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeContext);

  return (IOSBasedChromeContext *)WeakRetained;
}

- (void)contentHeightUpdatedWithValue:(double)a3
{
  v35.receiver = self;
  v35.super_class = (Class)ControlContainerViewController;
  -[OverlayContainerViewController contentHeightUpdatedWithValue:](&v35, "contentHeightUpdatedWithValue:");
  unint64_t v5 = [(ContainerViewController *)self containerStyle];
  double v6 = [(ContainerViewController *)self currentViewController];
  uint64_t v7 = [v6 cardPresentationController];
  unsigned int v8 = [v7 usingSheetPresentation];

  if (v8)
  {
    objc_super v9 = [(ContainerViewController *)self currentViewController];
    id v10 = [v9 cardPresentationController];
    unint64_t v5 = (unint64_t)[v10 containerStyle];
  }
  if ((v5 | 4) != 5) {
    goto LABEL_19;
  }
  id v11 = [(ControlContainerViewController *)self _mapViewIfCurrent];
  id v12 = [v11 userTrackingMode];

  if (v12 == (id)1)
  {
    id v13 = [(ControlContainerViewController *)self _mapViewIfCurrent];
    [v13 setUserTrackingMode:0];
  }
  if (v5 == 5) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = 2;
  }
  v15 = [(ContainerViewController *)self currentViewController];
  [v15 heightForLayout:v14];
  double v17 = v16;

  if (v17 != a3)
  {
    v18 = [(ControlContainerViewController *)self statusIndicatorView];
    [v18 setProminent:0];
  }
  v19 = [(ContainerViewController *)self currentViewController];
  [v19 heightForLayout:3];
  double v21 = v20;

  if (v21 != v17)
  {
    if (v17 < a3)
    {
      double v22 = (a3 - v17) / (v17 * 1.10000002 - v17);
      double v23 = 0.0;
      if (v22 >= 0.0) {
        double v24 = v22;
      }
      else {
        double v24 = 0.0;
      }
      v25 = [(ControlContainerViewController *)self _mapViewIfCurrent];
      [v25 setCompassEnabled:0];

      if (v24 <= 1.0) {
        double v23 = 1.0 - v24;
      }
      v26 = [(OverlayContainerViewController *)self topBannerView];
      [v26 setAlpha:v23];

      v27 = [(ContainerViewController *)self chromeViewController];
      v28 = [v27 userLocationView];
      v29 = v28;
      double v30 = v23;
      goto LABEL_20;
    }
LABEL_19:
    BOOL v31 = [(ControlContainerViewController *)self _permitCompassShowing];
    v32 = [(ControlContainerViewController *)self _mapViewIfCurrent];
    [v32 setCompassEnabled:v31];

    v33 = [(OverlayContainerViewController *)self topBannerView];
    [v33 setAlpha:1.0];

    v27 = [(ContainerViewController *)self chromeViewController];
    v28 = [v27 userLocationView];
    v29 = v28;
    double v30 = 1.0;
LABEL_20:
    [v28 setVlfCalloutAlpha:v30];

    if (sub_1000BBB44(self) == 1)
    {
      v34 = [(ContainerViewController *)self chromeViewController];
      [v34 setNeedsUpdateComponent:@"weatherOverlay" animated:1];
    }
  }
}

- (int64_t)floatingControlsOptions
{
  if ((id)[(ContainerViewController *)self containerStyle] != (id)6)
  {
    id v3 = [(ContainerViewController *)self currentViewController];
    id v4 = [v3 presentedViewController];
    if ([v4 isBeingDismissed])
    {
    }
    else
    {
      unint64_t v5 = [(ContainerViewController *)self currentViewController];
      double v6 = [v5 presentedViewController];
      uint64_t v7 = [v6 presentationController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        return 0;
      }
    }
  }
  id v10 = [(ContainerViewController *)self currentViewController];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(ContainerViewController *)self currentViewController];
    id v13 = [v12 floatingControlsOptions];

    return (int64_t)v13;
  }
  else if (sub_1000BBB44(self) == 5)
  {
    return 76;
  }
  else
  {
    return 72;
  }
}

- (BOOL)_permitCompassShowing
{
  if (![(ControlContainerViewController *)self _chromeEnabled]) {
    return 0;
  }
  id v3 = [(ContainerViewController *)self currentOrPendingViewController];
  do
  {
    unsigned __int8 v4 = [v3 isMemberOfClass:objc_opt_class()];
    if (v4) {
      break;
    }
    uint64_t v5 = [v3 presentedViewController];

    id v3 = (void *)v5;
  }
  while (v5);
  char v6 = v4 ^ 1;

  return v6;
}

- (BOOL)_chromeEnabled
{
  id v2 = +[MKSystemController sharedInstance];
  if ([v2 isInternalInstall])
  {
    id v3 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v4 = [v3 BOOLForKey:@"__internal__DisableChrome"];

    char v5 = v4 ^ 1;
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (id)statusBarSupplementaryView
{
  id v3 = [(ControlContainerViewController *)self statusIndicatorView];
  if ([v3 isVisible])
  {
    unsigned __int8 v4 = [(ControlContainerViewController *)self statusIndicatorView];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (StatusIndicatorView)statusIndicatorView
{
  statusIndicatorView = self->_statusIndicatorView;
  if (!statusIndicatorView)
  {
    unsigned __int8 v4 = -[StatusIndicatorView initWithFrame:]([StatusIndicatorView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    char v5 = self->_statusIndicatorView;
    self->_statusIndicatorView = v4;

    [(StatusIndicatorView *)self->_statusIndicatorView setTarget:self action:"_didTapStatusIndicatorView:"];
    statusIndicatorView = self->_statusIndicatorView;
  }

  return statusIndicatorView;
}

- (StatusIndicatorManager)statusIndicatorManager
{
  return self->_statusIndicatorManager;
}

- (void)setStatusIndicatorManager:(id)a3
{
}

- (void)setChromeContext:(id)a3
{
}

- (BOOL)isRootContainer
{
  return 1;
}

- (void)containerStyleManagerWillChangeStyle:(unint64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ControlContainerViewController;
  [(ContainerViewController *)&v3 containerStyleManagerWillChangeStyle:a3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_applicationDidBecomeActive:(id)a3
{
  if ([(ActionCoordinator *)self->_coordinator isRoutePlanningPresented])
  {
    unsigned __int8 v4 = [(ControlContainerViewController *)self view];
    [v4 frame];
    BOOL v5 = CGRectEqualToRect(v7, self->_frameWhenEnteringBackground);

    if (!v5) {
      [(ActionCoordinator *)self->_coordinator ensureRoutePlanningContentIsVisible];
    }
  }
  CGSize size = CGRectZero.size;
  self->_frameWhenEnteringBackground.origin = CGRectZero.origin;
  self->_frameWhenEnteringBackground.CGSize size = size;
}

+ (Class)actionCoordinatorClass
{
  return (Class)objc_opt_class();
}

- (CGRect)lookAroundButtonFrame
{
  id v2 = [(ContainerViewController *)self chromeViewController];
  objc_super v3 = [v2 floatingControlsOverlay];
  unsigned __int8 v4 = [v3 floatingControlsViewController];
  [v4 lookAroundButtonFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)keyCommands
{
  v14.receiver = self;
  v14.super_class = (Class)ControlContainerViewController;
  uint64_t v3 = [(ControlContainerViewController *)&v14 keyCommands];
  unsigned __int8 v4 = (void *)v3;
  if (v3) {
    double v5 = (void *)v3;
  }
  else {
    double v5 = &__NSArray0__struct;
  }
  id v6 = v5;

  double v7 = [(ControlContainerViewController *)self _mapViewIfCurrent];
  unsigned int v8 = [v7 isFocused];

  if (v8)
  {
    double v9 = [(ContainerViewController *)self currentViewController];
    double v10 = [v9 keyCommands];
    double v11 = v10;
    if (!v10) {
      double v10 = &__NSArray0__struct;
    }
    uint64_t v12 = [v10 arrayByAddingObjectsFromArray:v6];

    id v6 = (id)v12;
  }

  return v6;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  double v7 = [(ContainerViewController *)self currentViewController];
  unsigned int v8 = [v7 targetForAction:a3 withSender:v6];

  if (!v8)
  {
    v10.receiver = self;
    v10.super_class = (Class)ControlContainerViewController;
    unsigned int v8 = [(ControlContainerViewController *)&v10 targetForAction:a3 withSender:v6];
  }

  return v8;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(_MKMapViewSuspendedEffectsToken *)self->_mapSuspendedEffectsToken invalidate];
  mapSuspendedEffectsToken = self->_mapSuspendedEffectsToken;
  self->_mapSuspendedEffectsToken = 0;

  v6.receiver = self;
  v6.super_class = (Class)ControlContainerViewController;
  [(OverlayContainerViewController *)&v6 viewWillDisappear:v3];
}

- (void)updateLayoutAnimated:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ControlContainerViewController;
  [(ContainerViewController *)&v11 updateLayoutAnimated:a3];
  if ((id)[(ContainerViewController *)self containeeLayout] == (id)3
    || (id)[(ContainerViewController *)self containeeLayout] == (id)4)
  {
    char v6 = 0;
  }
  else
  {
    BOOL v3 = [(ContainerViewController *)self currentViewController];
    unsigned __int8 v4 = [v3 cardPresentationController];
    if (![v4 takesAvailableHeight]) {
      goto LABEL_13;
    }
    char v6 = 1;
  }
  unint64_t v7 = [(ContainerViewController *)self containerStyle];
  if (v7 > 7 || ((1 << v7) & 0xA3) == 0)
  {
    if ((v6 & 1) == 0)
    {
LABEL_14:
      [(_MKMapViewSuspendedEffectsToken *)self->_mapSuspendedEffectsToken invalidate];
      mapSuspendedEffectsToken = self->_mapSuspendedEffectsToken;
      self->_mapSuspendedEffectsToken = 0;
      goto LABEL_15;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (v6)
  {
  }
  if (!self->_mapSuspendedEffectsToken)
  {
    mapSuspendedEffectsToken = [(ControlContainerViewController *)self _mapViewIfCurrent];
    double v9 = [mapSuspendedEffectsToken beginStoppingEffects];
    objc_super v10 = self->_mapSuspendedEffectsToken;
    self->_mapSuspendedEffectsToken = v9;

LABEL_15:
  }
}

- (BOOL)delaysFirstCardPresentation
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  unsigned int v8 = sub_1000BD86C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "ControlContainer viewWillTransitionToSize %@", buf, 0xCu);
  }

  v24.receiver = self;
  v24.super_class = (Class)ControlContainerViewController;
  -[OverlayContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v24, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  double v9 = [(ControlContainerViewController *)self view];
  objc_super v10 = [v9 window];
  objc_super v11 = [v10 windowScene];

  if (![v11 activationState] || objc_msgSend(v11, "activationState") == (id)1)
  {
    uint64_t v12 = [(ControlContainerViewController *)self chromeContext];
    double v13 = [(ContainerViewController *)self chromeViewController];
    objc_super v14 = [v13 topIOSBasedContext];

    if (v12 == v14)
    {
      double v15 = [(ContainerViewController *)self chromeViewController];
      double v16 = [v15 mapView];

      [v16 centerCoordinate];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1006C8A08;
      v20[3] = &unk_1012F5238;
      uint64_t v22 = v17;
      uint64_t v23 = v18;
      v20[4] = self;
      id v21 = v16;
      id v19 = v16;
      [v7 animateAlongsideTransition:&stru_1012F5210 completion:v20];
    }
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  p_frameWhenEnteringBackground = &self->_frameWhenEnteringBackground;
  id v8 = [(ControlContainerViewController *)self viewIfLoaded];
  [v8 frame];
  p_frameWhenEnteringBackground->origin.x = v4;
  p_frameWhenEnteringBackground->origin.y = v5;
  p_frameWhenEnteringBackground->size.double width = v6;
  p_frameWhenEnteringBackground->size.double height = v7;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!-[ContainerViewController delaysFirstCardPresentation]_0()
    || ([(ControlContainerViewController *)self presentedViewController],
        CGFloat v7 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        (isKindOfClass & 1) == 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)ControlContainerViewController;
    [(ControlContainerViewController *)&v9 dismissViewControllerAnimated:v4 completion:v6];
  }
}

- (void)removeControllersFromStack:(id)a3
{
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 conformsToProtocol:&OBJC_PROTOCOL___ContaineeContentInjection]) {
          [v8 removeContentFromMapView];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)replaceCurrentWithController:(id)a3 moveToContaineeLayout:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(ContainerViewController *)self currentViewController];

  v8.receiver = self;
  v8.super_class = (Class)ControlContainerViewController;
  [(ContainerViewController *)&v8 replaceCurrentWithController:v6 moveToContaineeLayout:a4];
  if (v7 != v6) {
    [(ControlContainerViewController *)self _setUpdateContentInjectionBlockForController:v6];
  }
}

- (void)updateContentInjection
{
  id v2 = [(ContainerViewController *)self currentViewController];
  if (objc_opt_respondsToSelector()) {
    [v2 removeContentFromMapView];
  }
  if (objc_opt_respondsToSelector()) {
    [v2 addContentToMapView];
  }
}

- (UIView)passThroughView
{
  id v2 = [(ContainerViewController *)self chromeViewController];
  id v3 = [v2 passThroughView];

  return (UIView *)v3;
}

- (void)_cancelAllOngoingGesturesBeingRecognizedInView:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [a3 gestureRecognizers];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 isEnabled])
        {
          [v8 setEnabled:0];
          [v8 setEnabled:1];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)mapView:(id)a3 didBecomePitched:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ControlContainerViewController;
  [(ContainerViewController *)&v5 mapView:a3 didBecomePitched:a4];
  [(ActionCoordinator *)self->_coordinator finishExitFrom3dMode];
}

- (BOOL)mapViewShouldHandleTapToDeselect:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(ActionCoordinator *)self->_coordinator venuesManager];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(ActionCoordinator *)self->_coordinator venuesManager];
    unsigned __int8 v8 = [v7 mapViewShouldHandleTapToDeselect:v4];
  }
  else
  {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (void)mapViewDidChangeVisibleRegion:(id)a3
{
  id v7 = a3;
  id v4 = [(ContainerViewController *)self currentViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(ContainerViewController *)self currentViewController];
    [v6 mapViewDidChangeVisibleRegion:v7];
  }
}

- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  char v6 = [(ContainerViewController *)self currentViewController];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    unsigned __int8 v8 = [(ContainerViewController *)self currentViewController];
    [v8 mapView:v12 regionDidChangeAnimated:v4];
  }
  long long v9 = [(ControlContainerViewController *)self chromeContext];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    long long v11 = [(ControlContainerViewController *)self chromeContext];
    [v11 mapView:v12 regionWillChangeAnimated:v4];
  }
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ControlContainerViewController;
  [(ContainerViewController *)&v15 mapView:v6 regionDidChangeAnimated:v4];
  char v7 = [(ContainerViewController *)self currentViewController];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    long long v9 = [(ContainerViewController *)self currentViewController];
    [v9 mapView:v6 regionDidChangeAnimated:v4];
  }
  [(ActionCoordinator *)self->_coordinator finishExitFrom3dMode];
  char v10 = [(ActionCoordinator *)self->_coordinator appCoordinator];
  [v10 setNeedsUserActivityUpdate];

  [(NSDate *)self->_dateCreated timeIntervalSinceNow];
  double v12 = v11;
  [(NSDate *)self->_dateCreated timeIntervalSinceNow];
  if (v12 < 0.0) {
    double v13 = -v13;
  }
  if (v13 > 5.0)
  {
    objc_super v14 = [(ControlContainerViewController *)self statusIndicatorView];
    [v14 setProminent:0];
  }
}

- (void)mapView:(id)a3 didChangeFocusedVenue:(id)a4 focusedBuilding:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = [(ActionCoordinator *)self->_coordinator venuesManager];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    double v12 = [(ActionCoordinator *)self->_coordinator venuesManager];
    [v12 mapView:v13 didChangeFocusedVenue:v8 focusedBuilding:v9];
  }
}

- (void)mapView:(id)a3 didChangeDisplayedFloorOrdinal:(signed __int16)a4 forVenue:(id)a5
{
  uint64_t v6 = a4;
  id v12 = a3;
  id v8 = a5;
  id v9 = [(ActionCoordinator *)self->_coordinator venuesManager];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    char v11 = [(ActionCoordinator *)self->_coordinator venuesManager];
    [v11 mapView:v12 didChangeDisplayedFloorOrdinal:v6 forVenue:v8];
  }
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = [(ContainerViewController *)self currentViewController];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [(ContainerViewController *)self currentViewController];
    [v10 mapView:v11 willStartRespondingToGesture:a4 animated:v5];
  }
}

- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  BOOL v9 = a7;
  id v17 = a3;
  objc_super v14 = [(ContainerViewController *)self currentViewController];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    double v16 = [(ContainerViewController *)self currentViewController];
    [v16 mapView:v17 didStopRespondingToGesture:a4 zoomDirection:a5 zoomGestureType:a6 didDecelerate:v9 tiltDirection:a8];
  }
}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v17 = a3;
  char v10 = [(ActionCoordinator *)self->_coordinator venuesManager];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(ActionCoordinator *)self->_coordinator venuesManager];
    [v12 mapView:v17 didChangeUserTrackingMode:a4 animated:v7 fromTrackingButton:v6];
  }
  id v13 = [(ContainerViewController *)self currentViewController];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    char v15 = [(ContainerViewController *)self currentViewController];
    [v15 mapView:v17 didChangeUserTrackingMode:a4 animated:v7 fromTrackingButton:v6];
  }
  double v16 = [(ActionCoordinator *)self->_coordinator searchSessionManager];
  [v16 clearLastSearchSessionViewport];
}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ControlContainerViewController;
  [(ContainerViewController *)&v16 mapView:v8 didChangeUserTrackingMode:a4 animated:v5];
  BOOL v9 = [(ActionCoordinator *)self->_coordinator venuesManager];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    char v11 = [(ActionCoordinator *)self->_coordinator venuesManager];
    [v11 mapView:v8 didChangeUserTrackingMode:a4 animated:v5];
  }
  id v12 = [(ContainerViewController *)self currentViewController];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    char v14 = [(ContainerViewController *)self currentViewController];
    [v14 mapView:v8 didChangeUserTrackingMode:a4 animated:v5];
  }
  char v15 = [(ActionCoordinator *)self->_coordinator searchSessionManager];
  [v15 clearLastSearchSessionViewport];
}

- (void)mapViewDidStartUserInteraction:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ControlContainerViewController;
  [(ContainerViewController *)&v5 mapViewDidStartUserInteraction:a3];
  BOOL v4 = [(ControlContainerViewController *)self statusIndicatorView];
  [v4 setProminent:0];
}

- (void)mapView:(id)a3 calloutPrimaryActionTriggeredForLabelMarker:(id)a4
{
}

- (void)mapView:(id)a3 calloutPrimaryActionTriggeredForAnnotationView:(id)a4
{
}

- (void)expandPlaceCardController
{
  id v3 = [(ContainerViewController *)self currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(ContainerViewController *)self currentViewController];
    objc_super v5 = [v6 cardPresentationController];
    [v5 wantsLayout:2];
  }
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  -[ActionCoordinator didTapMapView:atPoint:](self->_coordinator, "didTapMapView:atPoint:", a3, a4.x, a4.y);
  objc_super v5 = +[MKSystemController sharedInstance];
  unsigned int v6 = [v5 isInternalInstall];

  if (!v6) {
    return;
  }
  BOOL v7 = [(ActionCoordinator *)self->_coordinator mapSelectionManager];
  if ([v7 hasSelection])
  {
  }
  else
  {
    id v8 = +[NSUserDefaults standardUserDefaults];
    unsigned int v9 = [v8 BOOLForKey:@"__internal__EnabletapToMinimize"];

    if (v9)
    {
      id v14 = [(ContainerViewController *)self currentViewController];
      char v10 = [v14 cardPresentationController];
      [v10 wantsLayout:1];

LABEL_7:

      return;
    }
  }
  id v14 = [(ActionCoordinator *)self->_coordinator mapSelectionManager];
  if ([v14 hasSelection]) {
    goto LABEL_7;
  }
  char v11 = +[NSUserDefaults standardUserDefaults];
  unsigned int v12 = [v11 BOOLForKey:@"__internal__EnabletapToHide"];

  if (v12)
  {
    uint64_t v13 = [(ContainerViewController *)self chromeHidden] ^ 1;
    [(ControlContainerViewController *)self setChromeHidden:v13];
  }
}

- (void)setChromeHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ContainerViewController *)self chromeHidden] != a3)
  {
    v15.receiver = self;
    v15.super_class = (Class)ControlContainerViewController;
    [(ContainerViewController *)&v15 setChromeHidden:v3];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    objc_super v5 = [(ContainerViewController *)self visibleCardViews];
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        unsigned int v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) setHidden:v3];
          unsigned int v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v7);
    }

    char v10 = [(OverlayContainerViewController *)self topContentView];
    [v10 setHidden:v3];
  }
}

- (void)_captureStatusIndicatorViewTapAction:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v4 = [(ControlContainerViewController *)self currentUITargetForAnalytics];
  if (v4 > 300)
  {
    if ((v4 - 301) < 5 || v4 == 607)
    {
      uint64_t v5 = 504;
      goto LABEL_6;
    }
  }
  else
  {
    if ((v4 - 8) < 6)
    {
      uint64_t v5 = 502;
      goto LABEL_6;
    }
    if (v4 == 201)
    {
      uint64_t v5 = 501;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  id v6 = +[MKMapService sharedService];
  [v6 captureUserAction:v3 onTarget:v5 eventValue:0];
}

- (void)_didTapStatusIndicatorView:(id)a3
{
  id v4 = [a3 type];
  if (v4 == (id)8)
  {
    uint64_t v5 = +[MKMapService sharedService];
    [v5 captureUserAction:390 onTarget:83 eventValue:0];

    id v6 = [(ControlContainerViewController *)self coordinator];
    [v6 viewControllerShowOfflineMaps:0];
  }
  else if (v4 == (id)6)
  {
    [(ControlContainerViewController *)self _captureStatusIndicatorViewTapAction:61];
    id v6 = +[UIApplication sharedMapsDelegate];
    [v6 promptPreciseLocationOff];
  }
  else
  {
    if (v4 != (id)5) {
      return;
    }
    id v6 = +[UIApplication sharedMapsDelegate];
    [v6 promptLocationServicesOff];
  }
}

- (id)_topBannerViewHorizontalConstraints
{
  uint64_t v3 = [(ContainerViewController *)self chromeViewController];
  id v4 = [v3 floatingControlsOverlay];
  uint64_t v5 = [v4 floatingControlsViewController];

  if (v5)
  {
    objc_super v16 = [(OverlayContainerViewController *)self topBannerView];
    id v6 = [v16 leadingAnchor];
    id v7 = [(OverlayContainerViewController *)self overlayView];
    uint64_t v8 = [v7 leadingAnchor];
    unsigned int v9 = [v6 constraintEqualToAnchor:v8 constant:sub_1000BBAF8()];
    v18[0] = v9;
    char v10 = [(OverlayContainerViewController *)self topBannerView];
    long long v11 = [v10 trailingAnchor];
    long long v12 = [v5 floatingButtonLeadingGuide];
    long long v13 = [v11 constraintEqualToAnchor:v12 constant:-sub_1000BBAF8()];
    v18[1] = v13;
    long long v14 = +[NSArray arrayWithObjects:v18 count:2];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)ControlContainerViewController;
    long long v14 = [(OverlayContainerViewController *)&v17 _topBannerViewHorizontalConstraints];
  }

  return v14;
}

- (double)_topBannerMaxHeight
{
  uint64_t v3 = [(ControlContainerViewController *)self traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)5)
  {
    v10.receiver = self;
    v10.super_class = (Class)ControlContainerViewController;
    [(OverlayContainerViewController *)&v10 _topBannerMaxHeight];
  }
  else
  {
    id v6 = [(ContainerViewController *)self chromeViewController];
    id v7 = [v6 floatingControlsOverlay];
    uint64_t v8 = [v7 floatingControlsViewController];

    [v8 floatingButtonsFrame];
    double Height = CGRectGetHeight(v11);

    return Height;
  }
  return result;
}

- (void)_offlineMapsStateChanged
{
  uint64_t v3 = [(ContainerViewController *)self chromeViewController];
  [v3 setNeedsUpdateComponent:@"lookAroundButton" animated:1];

  id v4 = [(ContainerViewController *)self chromeViewController];
  [v4 setNeedsUpdateComponent:@"weatherOverlay" animated:1];

  id v5 = [(ContainerViewController *)self chromeViewController];
  [v5 setNeedsUpdateComponent:@"floatingControls" animated:1];
}

- (int)currentUITargetForAnalytics
{
  uint64_t v3 = [(ControlContainerViewController *)self coordinator];
  if (objc_opt_respondsToSelector())
  {
    unsigned int v4 = [v3 currentUITargetForAnalytics];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ControlContainerViewController;
    unsigned int v4 = [(ContainerViewController *)&v7 currentUITargetForAnalytics];
  }
  int v5 = v4;

  return v5;
}

- (int)currentMapViewTargetForAnalytics
{
  uint64_t v3 = [(ControlContainerViewController *)self coordinator];
  if (objc_opt_respondsToSelector())
  {
    unsigned int v4 = [v3 currentMapViewTargetForAnalytics];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ControlContainerViewController;
    unsigned int v4 = [(ContainerViewController *)&v7 currentMapViewTargetForAnalytics];
  }
  int v5 = v4;

  return v5;
}

- (ActionCoordinator)actionCoordinator
{
  return self->_coordinator;
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
}

- (void)setStatusIndicatorView:(id)a3
{
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
  self->_dateCreated = (NSDate *)a3;
}

- (UIViewController)viewControllerInActivePresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerInActivePresentation);

  return (UIViewController *)WeakRetained;
}

- (void)setViewControllerInActivePresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewControllerInActivePresentation);
  objc_storeStrong((id *)&self->_statusIndicatorView, 0);
  objc_storeStrong((id *)&self->_statusIndicatorManager, 0);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_destroyWeak((id *)&self->_chromeContext);
  objc_storeStrong((id *)&self->_mapSuspendedEffectsToken, 0);

  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end