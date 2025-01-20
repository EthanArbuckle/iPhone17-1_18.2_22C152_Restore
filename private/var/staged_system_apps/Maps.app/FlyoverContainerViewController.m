@interface FlyoverContainerViewController
- (BOOL)flyoverIntroCompleted;
- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4;
- (BOOL)prefersStatusBarHidden;
- (FlyoverActionCoordinator)flyoverActionCoordinator;
- (FlyoverBannerView)flyoverBannerView;
- (FlyoverContainerViewController)initWithMapItem:(id)a3;
- (FlyoverContainerViewControllerDelegate)flyoverDelegate;
- (FlyoverStatusView)statusView;
- (MKMapItem)mapItem;
- (NSMutableDictionary)trackingStateAndReasonChangesBegan;
- (NSString)savedTourLabelText;
- (NSTimer)flyoverIntroTimer;
- (UILabel)tourLabel;
- (UIView)passThroughView;
- (double)compassDiameter;
- (id)mapView;
- (int)flyoverMode;
- (int64_t)initialOrientation;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredUserInterfaceStyle;
- (int64_t)startViewMode;
- (unint64_t)currentTrackingState;
- (unint64_t)currentTrackingStateReason;
- (unint64_t)maxLayoutForEdgeInsetsUpdate;
- (unint64_t)originalLayoutForViewController:(id)a3;
- (unint64_t)sessionInterruptedReason;
- (void)_captureTelemetricEventWithOldKey:(int)a3 newKey:(int)a4;
- (void)_enterFlyover;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)cleanupFlyover;
- (void)dealloc;
- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4;
- (void)hideChrome:(BOOL)a3 animated:(BOOL)a4;
- (void)mapView:(id)a3 arSessionWasInterrupted:(unint64_t)a4;
- (void)mapView:(id)a3 arTrackingStateDidChange:(unint64_t)a4 reason:(unint64_t)a5;
- (void)mapView:(id)a3 didEncounterARError:(id)a4;
- (void)mapView:(id)a3 didStopFlyoverTourCompleted:(BOOL)a4;
- (void)mapView:(id)a3 flyoverModeDidChange:(int)a4;
- (void)mapView:(id)a3 flyoverTourLabelDidChange:(id)a4;
- (void)mapViewARSessionInterruptionEnded:(id)a3;
- (void)mapViewDidEnterAR:(id)a3;
- (void)mapViewDidExitAR:(id)a3;
- (void)mapViewWillEnterAR:(id)a3;
- (void)mapViewWillStartFlyoverTour:(id)a3;
- (void)setCurrentTrackingState:(unint64_t)a3;
- (void)setCurrentTrackingStateReason:(unint64_t)a3;
- (void)setFlyoverActionCoordinator:(id)a3;
- (void)setFlyoverBannerView:(id)a3;
- (void)setFlyoverDelegate:(id)a3;
- (void)setFlyoverIntroCompleted:(BOOL)a3;
- (void)setFlyoverIntroTimer:(id)a3;
- (void)setFlyoverMode:(int)a3;
- (void)setSavedTourLabelText:(id)a3;
- (void)setStartViewMode:(int64_t)a3;
- (void)setStatusView:(id)a3;
- (void)setTourLabel:(id)a3;
- (void)setTrackingStateAndReasonChangesBegan:(id)a3;
- (void)stopFlyoverRequestedByBanner:(id)a3;
- (void)updateMapEdgeInsets;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation FlyoverContainerViewController

- (FlyoverContainerViewController)initWithMapItem:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FlyoverContainerViewController;
  v6 = [(ContainerViewController *)&v15 initWithNibName:0 bundle:0];
  if (v6)
  {
    v7 = [[FlyoverActionCoordinator alloc] initWithContainerViewController:v6];
    flyoverActionCoordinator = v6->_flyoverActionCoordinator;
    v6->_flyoverActionCoordinator = v7;

    v6->_initialOrientation = 0;
    objc_storeStrong((id *)&v6->_mapItem, a3);
    v6->_sessionInterruptedReason = 0;
    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    trackingStateAndReasonChangesBegan = v6->_trackingStateAndReasonChangesBegan;
    v6->_trackingStateAndReasonChangesBegan = v9;

    v11 = [OverlayContainerDimmingController alloc];
    v12 = sub_100105C1C();
    v13 = [(OverlayContainerDimmingController *)v11 initWithDimmingBehaviour:v12 customBehaviours:0];
    [(OverlayContainerViewController *)v6 setDimmingBehaviour:v13];
  }
  return v6;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIApplicationWillResignActiveNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)FlyoverContainerViewController;
  [(FlyoverContainerViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)FlyoverContainerViewController;
  [(OverlayContainerViewController *)&v4 viewDidLoad];
  v3 = [(OverlayContainerViewController *)self topContentView];
  [v3 setHidden:1];

  [(FlyoverContainerViewController *)self _setupViews];
  [(FlyoverContainerViewController *)self _setupConstraints];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FlyoverContainerViewController;
  [(OverlayContainerViewController *)&v4 viewDidAppear:a3];
  [(FlyoverContainerViewController *)self hideChrome:1 animated:0];
}

- (int64_t)preferredUserInterfaceStyle
{
  return 2;
}

- (void)_setupViews
{
  v3 = [(FlyoverContainerViewController *)self view];
  [v3 setAccessibilityIdentifier:@"FlyoverContainerView"];

  objc_super v4 = +[VKPlatform sharedPlatform];
  unsigned int v5 = [v4 supportsARMode];

  if (v5)
  {
    v6 = -[FlyoverStatusView initWithFrame:]([FlyoverStatusView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    statusView = self->_statusView;
    self->_statusView = v6;

    [(FlyoverStatusView *)self->_statusView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(FlyoverContainerViewController *)self view];
    [v8 addSubview:self->_statusView];
  }
  v9 = [(FlyoverContainerViewController *)self traitCollection];
  id v10 = [v9 userInterfaceIdiom];

  if (v10 == (id)5)
  {
    v11 = [[FlyoverBannerView alloc] initWithDelegate:self];
    p_flyoverBannerView = &self->_flyoverBannerView;
    flyoverBannerView = self->_flyoverBannerView;
    self->_flyoverBannerView = v11;

    [(FlyoverBannerView *)self->_flyoverBannerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(FlyoverBannerView *)self->_flyoverBannerView setAlpha:0.0];
    [(FlyoverContainerViewController *)self view];
  }
  else
  {
    v14 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    p_flyoverBannerView = &self->_tourLabel;
    tourLabel = self->_tourLabel;
    self->_tourLabel = v14;

    [(UILabel *)self->_tourLabel setAlpha:0.0];
    [(UILabel *)self->_tourLabel setAdjustsFontSizeToFitWidth:1];
    v16 = +[UIFont boldSystemFontOfSize:22.0];
    [(UILabel *)self->_tourLabel setFont:v16];

    [(UILabel *)self->_tourLabel setMinimumScaleFactor:0.5];
    [(UILabel *)self->_tourLabel setNumberOfLines:1];
    v17 = +[UIColor blackColor];
    v18 = [v17 colorWithAlphaComponent:0.5];
    [(UILabel *)self->_tourLabel setShadowColor:v18];

    -[UILabel setShadowOffset:](self->_tourLabel, "setShadowOffset:", -1.0, 1.0);
    [(UILabel *)self->_tourLabel setTextAlignment:1];
    v19 = +[UIColor whiteColor];
    [(UILabel *)self->_tourLabel setTextColor:v19];

    [(UILabel *)self->_tourLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_tourLabel setAccessibilityIdentifier:@"FlyoverTourLabel"];
    [(OverlayContainerViewController *)self overlayView];
  }
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  [v20 addSubview:*p_flyoverBannerView];
}

- (void)_setupConstraints
{
  v3 = +[VKPlatform sharedPlatform];
  unsigned int v4 = [v3 supportsARMode];

  unsigned int v5 = GEOResultRefinementSort_ptr;
  if (v4)
  {
    v40 = [(FlyoverStatusView *)self->_statusView topAnchor];
    v6 = [(FlyoverContainerViewController *)self view];
    v7 = [v6 safeAreaLayoutGuide];
    v8 = [v7 topAnchor];
    v9 = [v40 constraintEqualToAnchor:v8 constant:6.0];
    v43[0] = v9;
    id v10 = [(FlyoverStatusView *)self->_statusView centerXAnchor];
    v11 = [(FlyoverContainerViewController *)self view];
    v12 = [v11 centerXAnchor];
    v13 = [v10 constraintEqualToAnchor:v12];
    v43[1] = v13;
    v14 = +[NSArray arrayWithObjects:v43 count:2];
    +[NSLayoutConstraint activateConstraints:v14];

    unsigned int v5 = GEOResultRefinementSort_ptr;
  }
  objc_super v15 = [(FlyoverContainerViewController *)self traitCollection];
  id v16 = [v15 userInterfaceIdiom];

  if (v16 == (id)5)
  {
    v17 = [(FlyoverBannerView *)self->_flyoverBannerView bottomAnchor];
    v18 = [(FlyoverContainerViewController *)self view];
    v19 = [v18 bottomAnchor];
    id v20 = [v17 constraintEqualToAnchor:v19 constant:-8.0];
    v42[0] = v20;
    v21 = [(FlyoverBannerView *)self->_flyoverBannerView centerXAnchor];
    v22 = [(OverlayContainerViewController *)self innerLayoutGuide];
    v23 = [v22 centerXAnchor];
    v24 = [v21 constraintEqualToAnchor:v23];
    v42[1] = v24;
    v25 = [v5[501] arrayWithObjects:v42 count:2];
    +[NSLayoutConstraint activateConstraints:v25];
  }
  else
  {
    v38 = [(UILabel *)self->_tourLabel leadingAnchor];
    v39 = [(OverlayContainerViewController *)self innerLayoutGuide];
    uint64_t v37 = [v39 leadingAnchor];
    uint64_t v36 = [v38 constraintGreaterThanOrEqualToAnchor:v37];
    v41[0] = v36;
    v33 = [(UILabel *)self->_tourLabel trailingAnchor];
    v35 = [(OverlayContainerViewController *)self innerLayoutGuide];
    v23 = [v35 trailingAnchor];
    v24 = [v33 constraintLessThanOrEqualToAnchor:v23];
    v41[1] = v24;
    v25 = [(UILabel *)self->_tourLabel centerXAnchor];
    v34 = [(OverlayContainerViewController *)self innerLayoutGuide];
    v26 = [v34 centerXAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v41[2] = v27;
    v28 = [(UILabel *)self->_tourLabel bottomAnchor];
    v29 = [(OverlayContainerViewController *)self overlayView];
    v30 = [v29 bottomAnchor];
    v31 = [v28 constraintEqualToAnchor:v30 constant:-15.0];
    v41[3] = v31;
    v32 = [v5[501] arrayWithObjects:v41 count:4];
    +[NSLayoutConstraint activateConstraints:v32];

    v21 = v33;
    id v20 = (void *)v36;

    v22 = v35;
    v19 = (void *)v37;

    v18 = v39;
    v17 = v38;
  }
}

- (double)compassDiameter
{
  v2 = [(FlyoverContainerViewController *)self mapView];
  [v2 _compassDiameter];
  double v4 = v3;

  return v4;
}

- (unint64_t)originalLayoutForViewController:(id)a3
{
  double v3 = +[VKPlatform sharedPlatform];
  if ([v3 supportsARMode]) {
    unint64_t v4 = 2;
  }
  else {
    unint64_t v4 = 1;
  }

  return v4;
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  v7 = [(ContainerViewController *)self currentViewController];
  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___MapViewResponderHandling]) {
    [v7 didTapMapView:v10 atPoint:CGPointMake(x, y)];
  }
  v8 = [(FlyoverContainerViewController *)self flyoverActionCoordinator];
  unsigned int v9 = [v8 isFlyoverRunning];

  if (v9) {
    [(FlyoverContainerViewController *)self hideChrome:[(ContainerViewController *)self chromeHidden] ^ 1 animated:1];
  }
}

- (void)hideChrome:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(ContainerViewController *)self chromeHidden] != a3)
  {
    [(ContainerViewController *)self setChromeHidden:v5];
    if (-[ContainerViewController delaysFirstCardPresentation]_0())
    {
      [(ContainerViewController *)self setContaineesHidden:v5];
    }
    else
    {
      [(ContainerViewController *)self visibleCardViews];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100595F30;
      v13[3] = &unk_1012E5D58;
      v13[4] = self;
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      id v14 = v7;
      v8 = objc_retainBlock(v13);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100596108;
      v12[3] = &unk_1012E7D28;
      v12[4] = self;
      unsigned int v9 = objc_retainBlock(v12);
      id v10 = [(FlyoverContainerViewController *)self view];
      [v10 endEditing:1];

      v11 = [(FlyoverContainerViewController *)self view];
      [v11 setUserInteractionEnabled:0];

      if (v4)
      {
        +[UIView animateWithDuration:v8 animations:v9 completion:0.25];
      }
      else
      {
        ((void (*)(void *))v8[2])(v8);
        ((void (*)(void *, uint64_t))v9[2])(v9, 1);
      }
    }
  }
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  if ([(ContainerViewController *)self chromeHidden]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)FlyoverContainerViewController;
  return [(FlyoverContainerViewController *)&v4 prefersStatusBarHidden];
}

- (void)updateMapEdgeInsets
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100596234;
  v2[3] = &unk_1012E5D08;
  v2[4] = self;
  +[UIView animateWithDuration:v2 animations:&stru_1012F0798 completion:0.25];
}

- (unint64_t)maxLayoutForEdgeInsetsUpdate
{
  return 2;
}

- (void)mapViewWillEnterAR:(id)a3
{
  id v10 = [a3 _mapLayer];
  objc_super v4 = [(ContainerViewController *)self chromeViewController];
  BOOL v5 = [v4 view];
  v6 = [v5 window];
  id v7 = [v6 windowScene];
  unint64_t v8 = (unint64_t)[v7 interfaceOrientation] - 1;
  if (v8 > 3) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = qword_100F6FE18[v8];
  }
  [v10 setARInterfaceOrientation:v9];
}

- (void)mapViewWillStartFlyoverTour:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[MKMapService sharedService];
  id v6 = [v4 _currentFlyoverAnimationID];

  [v5 captureUserAction:17028 flyoverAnimationID:v6];
  id v7 = +[VKPlatform sharedPlatform];
  if ([v7 supportsARMode])
  {
    unint64_t v8 = [(FlyoverContainerViewController *)self mapView];
    uint64_t v9 = [v8 _mapLayer];
    unsigned int v10 = [v9 isFlyoverUnificationEnabled];

    if (!v10) {
      return;
    }
  }
  else
  {
  }
  [(FlyoverContainerViewController *)self _enterFlyover];
  id v11 = [(FlyoverContainerViewController *)self flyoverDelegate];
  [v11 viewControllerDidStartFlyover:self];
}

- (void)mapViewDidEnterAR:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[MKMapService sharedService];
  id v6 = [v4 mapRegion];
  [v4 _zoomLevel];
  double v8 = v7;
  id v9 = [v4 mapType];
  uint64_t v10 = 1;
  switch((unint64_t)v9)
  {
    case 0uLL:
      break;
    case 1uLL:
    case 3uLL:
      uint64_t v10 = 2;
      break;
    case 2uLL:
    case 4uLL:
      uint64_t v10 = 3;
      break;
    default:
      if (v9 == (id)104) {
        unsigned int v11 = 4;
      }
      else {
        unsigned int v11 = 0;
      }
      if (v9 == (id)102) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = v11;
      }
      break;
  }
  [v5 captureUserAction:33 onTarget:646 eventValue:0 mapRegion:v6 zoomLevel:v10 mapType:v8];

  [(FlyoverContainerViewController *)self _enterFlyover];
  v12 = [v4 _mapLayer];
  v13 = [(ContainerViewController *)self chromeViewController];
  id v14 = [v13 view];
  objc_super v15 = [v14 window];
  id v16 = [v15 windowScene];
  v17 = (char *)[v16 interfaceOrientation];
  uint64_t v18 = 0;
  if ((unint64_t)(v17 - 1) <= 3) {
    uint64_t v18 = qword_100F6FE18[(void)(v17 - 1)];
  }
  [v12 setARInterfaceOrientation:v18];

  v19 = [(FlyoverContainerViewController *)self view];

  if (v19)
  {
    objc_initWeak(&location, self);
    id v20 = +[NSDate dateWithTimeIntervalSinceNow:5.0];
    v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    v26 = sub_100596714;
    v27 = &unk_1012E73C8;
    objc_copyWeak(&v28, &location);
    v21 = +[NSTimer _maps_scheduledTimerWithFireDate:v20 block:&v24];
    flyoverIntroTimer = self->_flyoverIntroTimer;
    self->_flyoverIntroTimer = v21;

    v23 = [(FlyoverContainerViewController *)self flyoverDelegate];
    [v23 viewControllerDidStartFlyover:self];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

- (void)mapViewDidExitAR:(id)a3
{
  [(NSTimer *)self->_flyoverIntroTimer invalidate];
  flyoverIntroTimer = self->_flyoverIntroTimer;
  self->_flyoverIntroTimer = 0;

  BOOL v5 = +[VKPlatform sharedPlatform];
  if ([v5 supportsARMode])
  {
    id v6 = [(FlyoverContainerViewController *)self mapView];
    double v7 = [v6 _mapLayer];
    unsigned __int8 v8 = [v7 isFlyoverUnificationEnabled];

    if (v8) {
      goto LABEL_11;
    }
    unint64_t currentTrackingState = self->_currentTrackingState;
    if (currentTrackingState >= 3) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = (currentTrackingState + 4011);
    }
    [(FlyoverContainerViewController *)self _captureTelemetricEventWithOldKey:v10 newKey:0];
    unint64_t currentTrackingStateReason = self->_currentTrackingStateReason;
    if (currentTrackingStateReason >= 5) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = (currentTrackingStateReason + 4021);
    }
    [(FlyoverContainerViewController *)self _captureTelemetricEventWithOldKey:v12 newKey:0];
    BOOL v5 = +[MKMapService sharedService];
    [v5 captureUserAction:34 onTarget:646 eventValue:0];
  }

LABEL_11:
  id v13 = [(FlyoverContainerViewController *)self flyoverDelegate];
  [v13 viewControllerDidEndFlyover:self];
}

- (void)cleanupFlyover
{
  double v3 = +[UIApplication sharedMapsDelegate];
  [v3 setMapsIsShowingTour:0];

  int64_t v4 = [(FlyoverContainerViewController *)self startViewMode];
  if (v4 != 6)
  {
    int64_t v5 = v4;
    id v6 = [(FlyoverContainerViewController *)self flyoverActionCoordinator];
    [v6 updateViewMode:v5 animated:1];
  }
}

- (void)mapView:(id)a3 didEncounterARError:(id)a4
{
  int64_t v5 = [(FlyoverContainerViewController *)self flyoverActionCoordinator];
  [v5 viewControllerEndFlyover:self];

  id v7 = [(FlyoverContainerViewController *)self flyoverActionCoordinator];
  id v6 = [v7 appCoordinator];
  [v6 exitFlyover];
}

- (void)mapView:(id)a3 arSessionWasInterrupted:(unint64_t)a4
{
  if (a4 != 2 && !self->_flyoverMode)
  {
    statusView = self->_statusView;
    id v7 = a3;
    [(FlyoverStatusView *)statusView setTrackingStateReason:4];
    unint64_t currentTrackingStateReason = self->_currentTrackingStateReason;
    if (currentTrackingStateReason >= 5) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = (currentTrackingStateReason + 4021);
    }
    [(FlyoverContainerViewController *)self _captureTelemetricEventWithOldKey:v9 newKey:4025];
    uint64_t v10 = [v7 _mapLayer];

    [v10 setFlyoverMode:2];
    unsigned int v11 = [(FlyoverContainerViewController *)self flyoverActionCoordinator];
    unsigned int v12 = [v11 isFlyoverRunning];

    if (v12) {
      [(FlyoverContainerViewController *)self hideChrome:0 animated:1];
    }
  }
  self->_sessionInterruptedReason = a4;
}

- (void)mapViewARSessionInterruptionEnded:(id)a3
{
  self->_sessionInterruptedReason = 0;
  if (self->_flyoverMode != 1)
  {
    int64_t v4 = [a3 _mapLayer];
    [v4 setFlyoverMode:0];

    [(FlyoverStatusView *)self->_statusView setTrackingStateReason:0];
    [(FlyoverContainerViewController *)self _captureTelemetricEventWithOldKey:4025 newKey:4021];
  }
}

- (void)mapView:(id)a3 arTrackingStateDidChange:(unint64_t)a4 reason:(unint64_t)a5
{
  [(FlyoverStatusView *)self->_statusView setTrackingStateReason:a5];
  +[GEOAPPortal captureTelemetricEntityCountForEventKey:4001 eventValue:a4 eventDetail:0];
  +[GEOAPPortal captureTelemetricEntityCountForEventKey:4002 eventValue:a5 eventDetail:0];
  unint64_t currentTrackingState = self->_currentTrackingState;
  if (currentTrackingState != a4)
  {
    if (currentTrackingState >= 3) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = (currentTrackingState + 4011);
    }
    if (a4 >= 3) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = (a4 + 4011);
    }
    [(FlyoverContainerViewController *)self _captureTelemetricEventWithOldKey:v9 newKey:v10];
  }
  unint64_t currentTrackingStateReason = self->_currentTrackingStateReason;
  if (currentTrackingStateReason != a5)
  {
    if (currentTrackingStateReason >= 5) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = (currentTrackingStateReason + 4021);
    }
    if (a5 >= 5) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = (a5 + 4021);
    }
    [(FlyoverContainerViewController *)self _captureTelemetricEventWithOldKey:v12 newKey:v13];
  }
  self->_unint64_t currentTrackingState = a4;
  self->_unint64_t currentTrackingStateReason = a5;
}

- (void)mapView:(id)a3 didStopFlyoverTourCompleted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 _currentFlyoverAnimationID];
  if (v4)
  {
    unsigned __int8 v8 = +[MKMapService sharedService];
    [v8 captureUserAction:17025 flyoverAnimationID:v7];
  }
  uint64_t v9 = +[MKMapService sharedService];
  [v9 captureUserAction:17026 flyoverAnimationID:v7];

  [v6 _setCurrentFlyoverAnimationID:0];
  [(FlyoverContainerViewController *)self cleanupFlyover];
  uint64_t v10 = +[VKPlatform sharedPlatform];
  if ([v10 supportsARMode])
  {
    unsigned int v11 = [(FlyoverContainerViewController *)self mapView];
    uint64_t v12 = [v11 _mapLayer];
    unsigned int v13 = [v12 isFlyoverUnificationEnabled];

    if (!v13 && v4)
    {
      flyoverActionCoordinator = self->_flyoverActionCoordinator;
      [(FlyoverActionCoordinator *)flyoverActionCoordinator flyoverTourCompleted];
      return;
    }
  }
  else
  {
  }
  [(FlyoverActionCoordinator *)self->_flyoverActionCoordinator viewControllerEndFlyover:self];
  id v15 = [(FlyoverActionCoordinator *)self->_flyoverActionCoordinator appCoordinator];
  [v15 exitFlyover];
}

- (void)mapView:(id)a3 flyoverModeDidChange:(int)a4
{
  id v14 = a3;
  if (a4 == 1)
  {
    if (self->_savedTourLabelText)
    {
      -[FlyoverContainerViewController mapView:flyoverTourLabelDidChange:](self, "mapView:flyoverTourLabelDidChange:", v14);
      savedTourLabelText = self->_savedTourLabelText;
      self->_savedTourLabelText = 0;
    }
  }
  else
  {
    id v7 = [(FlyoverContainerViewController *)self tourLabel];
    unsigned __int8 v8 = [v7 text];
    id v9 = [v8 length];

    if (v9)
    {
      uint64_t v10 = [(FlyoverContainerViewController *)self tourLabel];
      unsigned int v11 = [v10 text];
      uint64_t v12 = (NSString *)[v11 copy];
      unsigned int v13 = self->_savedTourLabelText;
      self->_savedTourLabelText = v12;

      [(FlyoverContainerViewController *)self mapView:v14 flyoverTourLabelDidChange:&stru_101324E70];
    }
  }
  [(FlyoverStatusView *)self->_statusView setHidden:a4 == 1];
  self->_flyoverMode = a4;
}

- (void)mapView:(id)a3 flyoverTourLabelDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [(FlyoverContainerViewController *)self traitCollection];
  id v7 = [v6 userInterfaceIdiom];

  if (v7 == (id)5)
  {
    unsigned __int8 v8 = [(FlyoverContainerViewController *)self flyoverBannerView];
    [v8 setLocationString:v5];
  }
  else
  {
    id v9 = [v5 length];
    uint64_t v10 = [(FlyoverContainerViewController *)self tourLabel];
    unsigned __int8 v8 = v10;
    if (v9)
    {
      [v10 setText:v5];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1005970EC;
      v17[3] = &unk_1012E5D08;
      unsigned int v11 = &v18;
      id v18 = v8;
      +[UIView animateWithDuration:v17 animations:1.0];
    }
    else
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1005970F8;
      v15[3] = &unk_1012E5D08;
      unsigned int v11 = &v16;
      id v16 = v10;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100597104;
      v12[3] = &unk_1012E6160;
      id v13 = v16;
      id v14 = v5;
      +[UIView animateWithDuration:v15 animations:v12 completion:1.0];
    }
  }
}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  return 0;
}

- (UIView)passThroughView
{
  v2 = [(ContainerViewController *)self chromeViewController];
  double v3 = [v2 passThroughView];

  return (UIView *)v3;
}

- (id)mapView
{
  v2 = [(ContainerViewController *)self chromeViewController];
  double v3 = [v2 mapView];

  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FlyoverContainerViewController;
  -[OverlayContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100597310;
  v10[3] = &unk_1012F07C0;
  objc_copyWeak(&v11, &location);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100597420;
  v8[3] = &unk_1012F07C0;
  objc_copyWeak(&v9, &location);
  [v7 animateAlongsideTransition:v10 completion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_captureTelemetricEventWithOldKey:(int)a3 newKey:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  trackingStateAndReasonChangesBegan = self->_trackingStateAndReasonChangesBegan;
  unsigned __int8 v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
  id v16 = [(NSMutableDictionary *)trackingStateAndReasonChangesBegan objectForKeyedSubscript:v8];

  if (v16)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [v16 doubleValue];
    +[GEOAPPortal captureTelemetricEntityCountForEventKey:v5 eventValue:(unint64_t)((Current - v10) * 1000.0) eventDetail:0];
    id v11 = self->_trackingStateAndReasonChangesBegan;
    uint64_t v12 = +[NSNumber numberWithInt:v5];
    [(NSMutableDictionary *)v11 setObject:0 forKeyedSubscript:v12];
  }
  objc_super v13 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
  id v14 = self->_trackingStateAndReasonChangesBegan;
  id v15 = +[NSNumber numberWithInt:v4];
  [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];
}

- (void)_enterFlyover
{
  double v3 = +[UIApplication sharedMapsDelegate];
  [v3 setMapsIsShowingTour:1];

  uint64_t v4 = [(FlyoverContainerViewController *)self flyoverActionCoordinator];
  -[FlyoverContainerViewController setStartViewMode:](self, "setStartViewMode:", [v4 displayedViewMode]);

  uint64_t v5 = +[VKPlatform sharedPlatform];
  if ([v5 supportsARMode])
  {
    id v6 = [(FlyoverContainerViewController *)self mapView];
    id v7 = [v6 _mapLayer];
    if ([v7 isFlyoverUnificationEnabled]) {
      uint64_t v8 = 6;
    }
    else {
      uint64_t v8 = 5;
    }
  }
  else
  {
    uint64_t v8 = 6;
  }

  id v9 = [(FlyoverContainerViewController *)self flyoverActionCoordinator];
  [v9 updateViewMode:v8 animated:1];

  double v10 = [(FlyoverContainerViewController *)self view];

  if (v10)
  {
    [(FlyoverContainerViewController *)self hideChrome:0 animated:1];
    id v11 = [(FlyoverContainerViewController *)self flyoverActionCoordinator];
    [v11 viewControllerPresentTray:self];

    if (sub_1000BBB44(self) == 5)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100597834;
      v12[3] = &unk_1012E5D08;
      void v12[4] = self;
      +[UIView animateWithDuration:3 delay:v12 options:0 animations:1.0 completion:0.5];
    }
  }
}

- (int64_t)initialOrientation
{
  int64_t result = self->_initialOrientation;
  if (!result)
  {
    uint64_t v4 = [(ContainerViewController *)self chromeViewController];
    uint64_t v5 = [v4 view];
    id v6 = [v5 window];
    id v7 = [v6 windowScene];
    self->_initialOrientation = (int64_t)[v7 interfaceOrientation];

    return self->_initialOrientation;
  }
  return result;
}

- (void)stopFlyoverRequestedByBanner:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FlyoverContainerViewController *)self flyoverActionCoordinator];
  [v5 flyoverTourCompleted];

  [(FlyoverContainerViewController *)self cleanupFlyover];
  v7[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100597A1C;
  v8[3] = &unk_1012E5D08;
  id v9 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100597A28;
  v7[3] = &unk_1012E7D28;
  id v6 = v4;
  +[UIView animateWithDuration:v8 animations:v7 completion:0.2];
}

- (FlyoverContainerViewControllerDelegate)flyoverDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flyoverDelegate);

  return (FlyoverContainerViewControllerDelegate *)WeakRetained;
}

- (void)setFlyoverDelegate:(id)a3
{
}

- (FlyoverActionCoordinator)flyoverActionCoordinator
{
  return self->_flyoverActionCoordinator;
}

- (void)setFlyoverActionCoordinator:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (unint64_t)sessionInterruptedReason
{
  return self->_sessionInterruptedReason;
}

- (int64_t)startViewMode
{
  return self->_startViewMode;
}

- (void)setStartViewMode:(int64_t)a3
{
  self->_startViewMode = a3;
}

- (BOOL)flyoverIntroCompleted
{
  return self->_flyoverIntroCompleted;
}

- (void)setFlyoverIntroCompleted:(BOOL)a3
{
  self->_flyoverIntroCompleted = a3;
}

- (FlyoverStatusView)statusView
{
  return self->_statusView;
}

- (void)setStatusView:(id)a3
{
}

- (NSTimer)flyoverIntroTimer
{
  return self->_flyoverIntroTimer;
}

- (void)setFlyoverIntroTimer:(id)a3
{
}

- (UILabel)tourLabel
{
  return self->_tourLabel;
}

- (void)setTourLabel:(id)a3
{
}

- (FlyoverBannerView)flyoverBannerView
{
  return self->_flyoverBannerView;
}

- (void)setFlyoverBannerView:(id)a3
{
}

- (NSString)savedTourLabelText
{
  return self->_savedTourLabelText;
}

- (void)setSavedTourLabelText:(id)a3
{
}

- (int)flyoverMode
{
  return self->_flyoverMode;
}

- (void)setFlyoverMode:(int)a3
{
  self->_flyoverMode = a3;
}

- (unint64_t)currentTrackingState
{
  return self->_currentTrackingState;
}

- (void)setCurrentTrackingState:(unint64_t)a3
{
  self->_unint64_t currentTrackingState = a3;
}

- (unint64_t)currentTrackingStateReason
{
  return self->_currentTrackingStateReason;
}

- (void)setCurrentTrackingStateReason:(unint64_t)a3
{
  self->_unint64_t currentTrackingStateReason = a3;
}

- (NSMutableDictionary)trackingStateAndReasonChangesBegan
{
  return self->_trackingStateAndReasonChangesBegan;
}

- (void)setTrackingStateAndReasonChangesBegan:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingStateAndReasonChangesBegan, 0);
  objc_storeStrong((id *)&self->_savedTourLabelText, 0);
  objc_storeStrong((id *)&self->_flyoverBannerView, 0);
  objc_storeStrong((id *)&self->_tourLabel, 0);
  objc_storeStrong((id *)&self->_flyoverIntroTimer, 0);
  objc_storeStrong((id *)&self->_statusView, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_flyoverActionCoordinator, 0);

  objc_destroyWeak((id *)&self->_flyoverDelegate);
}

@end