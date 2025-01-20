@interface LookAroundContainerViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_getRatioControls:(double *)a3 scale:(double *)a4 forContentHeightValue:(double)a5;
- (BOOL)_pipHugsLeading;
- (BOOL)_shouldTakePIPViewHeightIntoAccount;
- (BOOL)_shouldTakeSidebarIntoAccount;
- (BOOL)isDisplayingLookAroundFullScreen;
- (BOOL)isDisplayingLookAroundPIP;
- (BOOL)useBackdrop;
- (CGAffineTransform)transformForPIPView:(SEL)a3;
- (CGRect)_sanitizedOriginFrame;
- (CGRect)frameForPIPView;
- (CGRect)lookAroundButtonFrame;
- (CGRect)originFrame;
- (LookAroundActionCoordinator)actionCoordinator;
- (LookAroundContainerViewController)initWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5;
- (LookAroundContainerViewControllerAnimationDelegate)animationDelegate;
- (LookAroundPIPDataCoordinator)dataCoordinator;
- (MKLookAroundView)lookAroundView;
- (MKMapItem)currentMapItem;
- (ShareItemSource)currentShareItemSource;
- (UIEdgeInsets)compassInsets;
- (UIView)passThroughView;
- (double)pipViewWidthIfNeeded;
- (double)sidebarWidthIfNeeded;
- (double)topEdgeInset;
- (id)_createOrReuseLookAroundView:(id)a3 completion:(id)a4;
- (id)_createPlaceCardItemFromMapItem:(id)a3 isMarkedLocation:(BOOL)a4;
- (id)createActivityViewControllerForCurrentContext;
- (id)pipViewController;
- (id)puckViewController;
- (id)titleForMapActivity:(id)a3;
- (id)urlForMapActivity:(id)a3;
- (int)_targetForAnalytics;
- (int64_t)preferredUserInterfaceStyle;
- (unint64_t)_pipLayout;
- (unint64_t)originalLayoutForViewController:(id)a3;
- (void)_captureActivityCardAnalyticsForUserAction:(int)a3 onTarget:(int)a4;
- (void)_captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5;
- (void)_commonInit;
- (void)_handlePIPViewTap:(id)a3;
- (void)_insertPuckViewIntoMapView:(id)a3;
- (void)_removePuckViewFromMapView;
- (void)_reportAnIssue;
- (void)_setModeDidBecomeCurrent;
- (void)_setModeDidResignCurrent;
- (void)_setupForFullScreen;
- (void)_setupForPIP;
- (void)_shareCurrentLocation:(id)a3;
- (void)_showPuckAnimated;
- (void)_showTTRButton:(BOOL)a3;
- (void)_toggleShowingLabels:(BOOL)a3;
- (void)_updateCompassLayout;
- (void)_updateLayoutWithCurrentValue;
- (void)_updateLayoutWithValue:(double)a3;
- (void)_updatePIPLayout;
- (void)_updateTTRButtonState;
- (void)animateFromModeTransition:(id)a3;
- (void)animateToModeTransition:(id)a3;
- (void)animateTransitionToFullScreen:(BOOL)a3;
- (void)contentHeightUpdatedWithValue:(double)a3;
- (void)dealloc;
- (void)didCompleteModeTransition;
- (void)lookAroundPIPDataCoordinatorDidEndMovingLookAroundView:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidStartPanningMapView:(id)a3;
- (void)lookAroundTTRButtonView:(id)a3 didTapTTRButton:(id)a4;
- (void)lookAroundTrayContaineeViewController:(id)a3 didTapReportAnIssueButton:(id)a4;
- (void)lookAroundTrayContaineeViewController:(id)a3 didTapShareButton:(id)a4;
- (void)lookAroundTrayContaineeViewController:(id)a3 didTapToggleLabelsButton:(id)a4;
- (void)lookAroundView:(id)a3 didChangeCameraFrame:(id)a4;
- (void)lookAroundView:(id)a3 didChangeLocationInfo:(id)a4;
- (void)lookAroundView:(id)a3 didDeselectLabelMarker:(id)a4;
- (void)lookAroundView:(id)a3 didSelectLabelMarker:(id)a4;
- (void)lookAroundView:(id)a3 didTapAtPoint:(CGPoint)a4 areaAvailable:(BOOL)a5;
- (void)lookAroundView:(id)a3 didTapLabelMarker:(id)a4;
- (void)lookAroundView:(id)a3 didZoomWithDirection:(int64_t)a4 type:(int64_t)a5;
- (void)lookAroundViewDidPan:(id)a3;
- (void)lookAroundViewDidStartUserInteraction:(id)a3;
- (void)lookAroundViewDidStopUserInteraction:(id)a3;
- (void)lookAroundViewWillChangeLocationInfo:(id)a3;
- (void)mapView:(id)a3 didChangeLookAroundAvailability:(int64_t)a4;
- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapView:(id)a3 willSelectLabelMarker:(id)a4;
- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5;
- (void)mapViewDidChangeVisibleRegion:(id)a3;
- (void)mapViewDidStartUserInteraction:(id)a3;
- (void)mapViewDidStopUserInteraction:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)popLastViewControllerAnimated:(BOOL)a3;
- (void)prepareForExit;
- (void)prepareForExitWithCompletion:(id)a3;
- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5;
- (void)setAnimationDelegate:(id)a3;
- (void)setLookAroundButtonFrame:(CGRect)a3;
- (void)setOriginFrame:(CGRect)a3;
- (void)snapToLayout:(unint64_t)a3;
- (void)updateMapEdgeInsets;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation LookAroundContainerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_commonInit
{
  self->_showsLabels = 1;
  self->_currentDragRatio = 0.0;
  self->_currentDragScale = 1.0;
  self->_displayState = 0;
  self->_locationState = 0;
  v3 = [[LookAroundActionCoordinator alloc] initWithContainerViewController:self];
  actionCoordinator = self->_actionCoordinator;
  self->_actionCoordinator = v3;

  v5 = [OverlayContainerDimmingController alloc];
  v6 = sub_100105C1C();
  v7 = [(OverlayContainerDimmingController *)v5 initWithDimmingBehaviour:v6 customBehaviours:0];
  [(OverlayContainerViewController *)self setDimmingBehaviour:v7];

  id v8 = +[NSUserDefaults standardUserDefaults];
  [v8 addObserver:self forKeyPath:@"__internal__HideTapToRadarInMunin" options:1 context:off_1015EC638];
}

- (id)_createOrReuseLookAroundView:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  id v8 = v6;
  id v9 = v8;
  if (v8)
  {
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v9 = [objc_alloc((Class)MKLookAroundView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v9 setCompassHidden:1];
  [v9 setShowsPointLabels:self->_showsLabels];
  [v9 setShowsRoadLabels:self->_showsLabels];
  if (v7) {
LABEL_3:
  }
    v7[2](v7, v9);
LABEL_4:

  return v9;
}

- (LookAroundContainerViewController)initWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)LookAroundContainerViewController;
  v11 = [(ContainerViewController *)&v27 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    [(LookAroundContainerViewController *)v11 _commonInit];
    objc_storeStrong((id *)&v12->_entryPoint, a3);
    v12->_showsFullScreen = a5;
    v13 = [[LookAroundActionCoordinator alloc] initWithContainerViewController:v12];
    actionCoordinator = v12->_actionCoordinator;
    v12->_actionCoordinator = v13;

    v15 = [OverlayContainerDimmingController alloc];
    v16 = sub_100105C1C();
    v17 = [(OverlayContainerDimmingController *)v15 initWithDimmingBehaviour:v16 customBehaviours:0];
    [(OverlayContainerViewController *)v12 setDimmingBehaviour:v17];

    objc_initWeak(&location, v12);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10080DDE0;
    v23[3] = &unk_1012F9C50;
    objc_copyWeak(&v25, &location);
    id v24 = v9;
    uint64_t v18 = [(LookAroundContainerViewController *)v12 _createOrReuseLookAroundView:v10 completion:v23];
    lookAroundView = v12->_lookAroundView;
    v12->_lookAroundView = (MKLookAroundView *)v18;

    uint64_t v20 = [(MKLookAroundView *)v12->_lookAroundView superview];
    lookAroundViewOriginalSuperview = v12->_lookAroundViewOriginalSuperview;
    v12->_lookAroundViewOriginalSuperview = (UIView *)v20;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)dealloc
{
  v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"__internal__HideTapToRadarInMunin" context:off_1015EC638];

  v4.receiver = self;
  v4.super_class = (Class)LookAroundContainerViewController;
  [(LookAroundContainerViewController *)&v4 dealloc];
}

- (BOOL)isDisplayingLookAroundFullScreen
{
  return self->_displayState == 1;
}

- (BOOL)isDisplayingLookAroundPIP
{
  return self->_displayState == 2;
}

- (MKMapItem)currentMapItem
{
  p_lookAroundView = &self->_lookAroundView;
  if (([(MKLookAroundView *)self->_lookAroundView hasEnteredLookAround] & 1) == 0) {
    p_lookAroundView = &self->_entryPoint;
  }
  objc_super v4 = [(MKLookAroundView *)*p_lookAroundView mapItem];

  return (MKMapItem *)v4;
}

- (LookAroundPIPDataCoordinator)dataCoordinator
{
  return [(LookAroundActionCoordinator *)self->_actionCoordinator dataCoordinator];
}

- (id)puckViewController
{
  puckViewController = self->_puckViewController;
  if (!puckViewController)
  {
    objc_super v4 = objc_alloc_init(LookAroundPuckViewController);
    v5 = self->_puckViewController;
    self->_puckViewController = v4;

    id v6 = [(LookAroundPuckViewController *)self->_puckViewController view];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    v7 = [(LookAroundContainerViewController *)self dataCoordinator];
    [v7 addObserver:self->_puckViewController];

    puckViewController = self->_puckViewController;
  }

  return puckViewController;
}

- (id)pipViewController
{
  pipViewController = self->_pipViewController;
  if (!pipViewController)
  {
    objc_super v4 = [LookAroundPIPViewController alloc];
    v5 = [(LookAroundContainerViewController *)self dataCoordinator];
    id v6 = [(LookAroundPIPViewController *)v4 initWithDataCoordinator:v5 lookAroundView:self->_lookAroundView];
    v7 = self->_pipViewController;
    self->_pipViewController = v6;

    id v8 = [(LookAroundContainerViewController *)self actionCoordinator];
    [(LookAroundPIPViewController *)self->_pipViewController setActionCoordinator:v8];

    id v9 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handlePIPViewTap:"];
    pipViewTapGestureRecognizer = self->_pipViewTapGestureRecognizer;
    self->_pipViewTapGestureRecognizer = v9;

    v11 = [(LookAroundPIPViewController *)self->_pipViewController view];
    [v11 addGestureRecognizer:self->_pipViewTapGestureRecognizer];

    [(ContainerViewController *)self addChildViewController:self->_pipViewController];
    v12 = [(LookAroundContainerViewController *)self view];
    v13 = [(LookAroundPIPViewController *)self->_pipViewController view];
    v14 = [(OverlayContainerViewController *)self topContentView];
    [v12 insertSubview:v13 aboveSubview:v14];

    [(LookAroundPIPViewController *)self->_pipViewController didMoveToParentViewController:self];
    pipViewController = self->_pipViewController;
  }

  return pipViewController;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)LookAroundContainerViewController;
  [(OverlayContainerViewController *)&v3 viewDidLayoutSubviews];
  [(LookAroundContainerViewController *)self _updateCompassLayout];
  [(LookAroundContainerViewController *)self _updatePIPLayout];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)LookAroundContainerViewController;
  [(OverlayContainerViewController *)&v5 viewDidLoad];
  [(LookAroundActionCoordinator *)self->_actionCoordinator viewControllerPresentTray:self showsFullScreen:self->_showsFullScreen usingLookAroundView:self->_lookAroundView];
  objc_super v3 = [(MKLookAroundView *)self->_lookAroundView mapItem];
  if (v3)
  {
    objc_super v4 = [(LookAroundContainerViewController *)self _createPlaceCardItemFromMapItem:v3 isMarkedLocation:[(MKLookAroundEntryPoint *)self->_entryPoint isMarkedLocation]];
    [(LookAroundActionCoordinator *)self->_actionCoordinator viewController:self presentPlaceCardForItem:v4 animated:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LookAroundContainerViewController;
  [(OverlayContainerViewController *)&v7 viewDidAppear:a3];
  self->_containerIsVisible = 1;
  if (self->_modeIsCurrent)
  {
    objc_super v4 = [(ContainerViewController *)self chromeViewController];
    objc_super v5 = [v4 mapView];
    [(LookAroundContainerViewController *)self _insertPuckViewIntoMapView:v5];
  }
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"LookAroundTrayContaineeViewControllerDidAppear" object:self userInfo:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LookAroundContainerViewController;
  [(ContainerViewController *)&v5 viewDidDisappear:a3];
  [(LookAroundContainerViewController *)self _showTTRButton:0];
  self->_containerIsVisible = 0;
  if (!self->_modeIsCurrent) {
    [(LookAroundContainerViewController *)self _removePuckViewFromMapView];
  }
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"LookAroundTrayContaineeViewControllerDidDisappear" object:self userInfo:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)LookAroundContainerViewController;
  id v7 = a4;
  -[OverlayContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  id v8 = [(LookAroundContainerViewController *)self dataCoordinator];
  [v8 pause];

  self->_viewWillTransitionToSize.double width = width;
  self->_viewWillTransitionToSize.double height = height;
  v9[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10080E528;
  v10[3] = &unk_1012E81F8;
  v10[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10080E588;
  v9[3] = &unk_1012E81F8;
  [v7 animateAlongsideTransition:v10 completion:v9];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)LookAroundContainerViewController;
  id v6 = a4;
  [(ContainerViewController *)&v10 willTransitionToTraitCollection:a3 withTransitionCoordinator:v6];
  id v7 = [(LookAroundContainerViewController *)self dataCoordinator];
  [v7 pause];

  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10080E700;
  v9[3] = &unk_1012E81F8;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10080E760;
  v8[3] = &unk_1012E81F8;
  [v6 animateAlongsideTransition:v9 completion:v8];
}

- (UIEdgeInsets)compassInsets
{
  objc_super v3 = [(ContainerViewController *)self chromeViewController];
  objc_super v4 = [v3 mapView];
  [v4 _compassInsets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  if (sub_1000BBB44(self) != 5)
  {
    double v6 = 8.0;
    if (sub_1000BBB44(self) == 5) {
      double v6 = sub_1000BBAF8();
    }
    v13 = [(LookAroundContainerViewController *)self view];
    [v13 safeAreaInsets];
    double v12 = v6 + v14;

    if ([(LookAroundContainerViewController *)self isDisplayingLookAroundPIP])
    {
      v15 = [(LookAroundPIPViewController *)self->_pipViewController view];
      [v15 bounds];
      UIRectInset();
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;

      unint64_t v24 = [(LookAroundContainerViewController *)self _pipLayout];
      if (v24)
      {
        if (v24 == 3) {
          double v12 = 8.0;
        }
      }
      else
      {
        v29.origin.x = v17;
        v29.origin.y = v19;
        v29.size.double width = v21;
        v29.size.double height = v23;
        double v12 = v12 - CGRectGetWidth(v29);
        v30.origin.x = v17;
        v30.origin.y = v19;
        v30.size.double width = v21;
        v30.size.double height = v23;
        double v6 = v6 + CGRectGetHeight(v30);
      }
    }
  }
  double v25 = v6;
  double v26 = v8;
  double v27 = v10;
  double v28 = v12;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (void)_updateCompassLayout
{
  if (!self->_modeTransition && self->_pipViewController)
  {
    [(LookAroundContainerViewController *)self compassInsets];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v11 = [(ContainerViewController *)self chromeViewController];
    double v12 = [v11 mapView];
    [v12 _setCompassInsets:v4, v6, v8, v10];

    double v16 = self->_lookAroundView;
    [(MKLookAroundView *)v16 compassInsets];
    v13 = [(LookAroundPIPViewController *)self->_pipViewController floatingButtonsView];
    [v13 frame];
    double v15 = v14 + 32.0;

    -[MKLookAroundView setCompassInsets:](v16, "setCompassInsets:", v15, 16.0, 16.0, 16.0);
  }
}

- (void)_updatePIPLayout
{
  if (!self->_modeTransition)
  {
    [(LookAroundContainerViewController *)self frameForPIPView];
    double x = v26.origin.x;
    double y = v26.origin.y;
    double width = v26.size.width;
    double height = v26.size.height;
    CGFloat v7 = CGRectGetWidth(v26);
    v27.origin.double x = x;
    v27.origin.double y = y;
    v27.size.double width = width;
    v27.size.double height = height;
    CGFloat v8 = CGRectGetHeight(v27);
    memset(&v25, 0, sizeof(v25));
    -[LookAroundContainerViewController transformForPIPView:](self, "transformForPIPView:", x, y, width, height);
    double v9 = [(LookAroundPIPViewController *)self->_pipViewController view];
    double v10 = v9;
    if (v9) {
      [v9 transform];
    }
    else {
      memset(&t1, 0, sizeof(t1));
    }
    CGAffineTransform t2 = v25;
    BOOL v11 = CGAffineTransformEqualToTransform(&t1, &t2);
    [v10 bounds];
    v29.origin.double x = 0.0;
    v29.origin.double y = 0.0;
    v29.size.double width = v7;
    v29.size.double height = v8;
    BOOL v12 = CGRectEqualToRect(v28, v29);
    if (self->_viewWillTransitionToSize.width == CGSizeZero.width
      && self->_viewWillTransitionToSize.height == CGSizeZero.height)
    {
      BOOL v16 = 0;
      if (!v10)
      {
LABEL_19:

        return;
      }
    }
    else
    {
      double v14 = [(LookAroundContainerViewController *)self view];
      [v14 bounds];
      BOOL v16 = v15 > self->_viewWillTransitionToSize.width;

      if (!v10) {
        goto LABEL_19;
      }
    }
    char v17 = self->_isRespondingToPanGesture || v16;
    if ((v17 & 1) == 0 && (!v11 || !v12 || self->_forceUpdatePIPLayout))
    {
      long long v18 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v22[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v22[1] = v18;
      v22[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      [v10 setTransform:v22];
      [v10 setFrame:CGRectMake(x, y, width, height)];
      CGAffineTransform v21 = v25;
      [v10 setTransform:&v21];
      [(LookAroundContainerViewController *)self updateMapEdgeInsets];
      CGAffineTransform t2 = v25;
      IsIdentitdouble y = CGAffineTransformIsIdentity(&t2);
      double v20 = [(LookAroundPIPViewController *)self->_pipViewController lookAroundContainerView];
      [v20 setUserInteractionEnabled:IsIdentity];

      [(UITapGestureRecognizer *)self->_pipViewTapGestureRecognizer setEnabled:IsIdentity ^ 1];
    }
    goto LABEL_19;
  }
}

- (CGRect)frameForPIPView
{
  double v3 = [(LookAroundContainerViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;

  double v12 = sub_1000BBAF8();
  if ([(LookAroundContainerViewController *)self isDisplayingLookAroundFullScreen])
  {
    double Height = v11;
    double v14 = v7;
  }
  else
  {
    unsigned __int8 v15 = [(LookAroundContainerViewController *)self _pipHugsLeading];
    BOOL v16 = [(LookAroundContainerViewController *)self view];
    [v16 safeAreaInsets];
    double v17 = 3.0;
    if (v18 == 0.0) {
      double v17 = v12;
    }
    double v68 = v17;

    if (sub_1000BBB44(self) == 5)
    {
      v69.origin.double x = v5;
      v69.origin.double y = v7;
      v69.size.double width = v9;
      v69.size.double height = v11;
      double v19 = ceil(CGRectGetWidth(v69)) / 2.5;
      double v20 = [(LookAroundContainerViewController *)self view];
      [v20 safeAreaInsets];
      double v14 = v12 + v21;

      double v22 = v19 * 0.625;
LABEL_7:
      double Height = ceil(v22);
    }
    else
    {
      [(ContainerViewController *)self topEdgePadding];
      double v14 = v23;
      v70.origin.double x = v5;
      v70.origin.double y = v7;
      v70.size.double width = v9;
      v70.size.double height = v11;
      double Height = CGRectGetHeight(v70);
      switch([(LookAroundContainerViewController *)self _pipLayout])
      {
        case 0uLL:
        case 1uLL:
          v71.origin.double x = v5;
          v71.origin.double y = v7;
          v71.size.double width = v9;
          v71.size.double height = v11;
          double v19 = fmin(ceil(CGRectGetWidth(v71) * 0.479999989), 630.0);
          v72.origin.double x = v5;
          v72.origin.double y = v7;
          v72.size.double width = v9;
          v72.size.double height = v11;
          double v24 = CGRectGetHeight(v72) * 0.400000006;
          goto LABEL_19;
        case 2uLL:
          CGAffineTransform v25 = [(ContainerViewController *)self currentViewController];
          CGRect v26 = [v25 view];

          [v26 frame];
          double v28 = v27;
          double v30 = v29;
          double v63 = v32;
          double v65 = v31;
          v33 = [(LookAroundContainerViewController *)self view];
          [v26 convertRect:v33 toView:v28];
          CGFloat v64 = v35;
          CGFloat v66 = v34;
          CGFloat v37 = v36;
          CGFloat rect = v38;

          v73.origin.double x = v5;
          v73.origin.double y = v7;
          v73.size.double width = v9;
          v73.size.double height = v11;
          double Width = CGRectGetWidth(v73);
          v74.size.double width = v64;
          v74.origin.double x = v66;
          v74.origin.double y = v37;
          v74.size.double height = rect;
          double v40 = Width - CGRectGetMaxX(v74) - v12 - v68;
          v41 = [(LookAroundContainerViewController *)self view];
          [v41 safeAreaInsets];
          double v19 = v40 - v42;

          v75.origin.double x = v5;
          v75.origin.double y = v7;
          v75.size.double width = v9;
          v75.size.double height = v11;
          double Height = ceil(CGRectGetHeight(v75) * 0.400000006);
          goto LABEL_16;
        case 3uLL:
          v76.origin.double x = v5;
          v76.origin.double y = v7;
          v76.size.double width = v9;
          v76.size.double height = v11;
          double v19 = ceil(CGRectGetWidth(v76) * 0.479999989);
          [(ContainerViewController *)self statusBarHeight];
          double v67 = Height - (v12 + v43);
          v44 = [(LookAroundContainerViewController *)self view];
          [v44 safeAreaInsets];
          if (v45 == 0.0) {
            double v46 = v12;
          }
          else {
            double v46 = 3.0;
          }

          CGRect v26 = [(LookAroundContainerViewController *)self view];
          [v26 safeAreaInsets];
          double Height = v67 - (v46 + v47);
LABEL_16:

          break;
        case 4uLL:
          v79.origin.double x = v5;
          v79.origin.double y = v7;
          v79.size.double width = v9;
          v79.size.double height = v11;
          double v19 = CGRectGetWidth(v79);
          double v24 = Height * 0.400000006;
LABEL_19:
          double Height = fmin(ceil(v24), 390.0);
          break;
        case 5uLL:
          v77.origin.double x = v5;
          v77.origin.double y = v7;
          v77.size.double width = v9;
          v77.size.double height = v11;
          double v19 = CGRectGetWidth(v77);
          v78.origin.double x = v5;
          v78.origin.double y = v7;
          v78.size.double width = v9;
          v78.size.double height = v11;
          double v22 = CGRectGetHeight(v78) * 0.349999994;
          goto LABEL_7;
        default:
          double v19 = 0.0;
          break;
      }
    }
    double v48 = v5;
    CGFloat v49 = v7;
    double v50 = v9;
    CGFloat v51 = v11;
    if (v15)
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v48);
      v53 = [(LookAroundContainerViewController *)self view];
      [v53 safeAreaInsets];
      double v55 = MinX + v54;
    }
    else
    {
      CGFloat v56 = CGRectGetMaxX(*(CGRect *)&v48) - v19;
      v53 = [(LookAroundContainerViewController *)self view];
      [v53 safeAreaInsets];
      double v55 = v56 - v57;
    }

    double v9 = v19 - v12 - v68;
    double v5 = v12 + v55;
  }
  double v58 = v5;
  double v59 = v14;
  double v60 = v9;
  double v61 = Height;
  result.size.double height = v61;
  result.size.double width = v60;
  result.origin.double y = v59;
  result.origin.double x = v58;
  return result;
}

- (unint64_t)_pipLayout
{
  double v3 = [(LookAroundContainerViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v23.origin.double x = v5;
  v23.origin.double y = v7;
  v23.size.double width = v9;
  v23.size.double height = v11;
  double Height = CGRectGetHeight(v23);
  if (sub_1000BBB44(self))
  {
    BOOL v13 = 0;
  }
  else
  {
    double v14 = [(LookAroundContainerViewController *)self traitCollection];
    if ([v14 horizontalSizeClass] == (id)1)
    {
      unsigned __int8 v15 = [(LookAroundContainerViewController *)self traitCollection];
      BOOL v13 = [v15 verticalSizeClass] == (id)1;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  BOOL v16 = [(ContainerViewController *)self currentViewController];
  if (v16)
  {
    double v17 = [(ContainerViewController *)self currentViewController];
    objc_opt_class();
    char v18 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v18 = 0;
  }

  if (v13
    || ([(LookAroundContainerViewController *)self traitCollection],
        double v19 = objc_claimAutoreleasedReturnValue(),
        id v20 = [v19 horizontalSizeClass],
        v19,
        v20 == (id)2))
  {
    unint64_t v21 = 2;
    if ((v18 & 1) == 0) {
      unint64_t v21 = 3;
    }
    if (Height > 500.0) {
      return v18 & 1;
    }
    else {
      return v21;
    }
  }
  else if (Height <= 500.0)
  {
    return 5;
  }
  else
  {
    return 4;
  }
}

- (CGAffineTransform)transformForPIPView:(SEL)a3
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  long long v17 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v18 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v17;
  long long v16 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tCGFloat x = v16;
  CGRect result = (CGAffineTransform *)[(LookAroundContainerViewController *)self isDisplayingLookAroundFullScreen];
  if ((result & 1) == 0)
  {
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    double v11 = CGRectGetWidth(v21);
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    double v12 = CGRectGetHeight(v22);
    double currentDragScale = self->_currentDragScale;
    if (currentDragScale < 1.0)
    {
      *(_OWORD *)&v20.a = v18;
      *(_OWORD *)&v20.c = v17;
      *(_OWORD *)&v20.tCGFloat x = v16;
      CGAffineTransformTranslate(retstr, &v20, (v11 - v11 * currentDragScale) * -0.5, v12 / v11 * ((v11 - v11 * currentDragScale) * -0.5));
      long long v14 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v19.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v19.c = v14;
      *(_OWORD *)&v19.tCGFloat x = *(_OWORD *)&retstr->tx;
      CGRect result = CGAffineTransformScale(&v20, &v19, currentDragScale, currentDragScale);
      long long v15 = *(_OWORD *)&v20.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v20.a;
      *(_OWORD *)&retstr->c = v15;
      *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v20.tx;
    }
  }
  return result;
}

- (void)_updateLayoutWithValue:(double)a3
{
  uint64_t v9 = 0x3FF0000000000000;
  double v10 = 0.0;
  if ([(LookAroundContainerViewController *)self isDisplayingLookAroundFullScreen])
  {
    double v5 = 0.0;
    double v6 = 1.0;
  }
  else
  {
    [(LookAroundContainerViewController *)self _getRatioControls:&v10 scale:&v9 forContentHeightValue:a3];
    double v6 = *(double *)&v9;
    double v5 = v10;
  }
  self->_currentDragRatio = v5;
  self->_double currentDragScale = v6;
  if (!self->_modeTransition)
  {
    double v7 = 1.0 - v5;
    double v8 = [(LookAroundPIPViewController *)self->_pipViewController floatingButtonsView];
    [v8 setAlpha:v7];
  }
  [(LookAroundContainerViewController *)self _updatePIPLayout];
}

- (void)_updateLayoutWithCurrentValue
{
  double v3 = [(ContainerViewController *)self currentViewController];
  double v4 = [v3 view];

  if (v4)
  {
    id v7 = [(ContainerViewController *)self currentViewController];
    double v5 = [v7 view];
    [v5 frame];
    [(LookAroundContainerViewController *)self _updateLayoutWithValue:v6];
  }
}

- (BOOL)_getRatioControls:(double *)a3 scale:(double *)a4 forContentHeightValue:(double)a5
{
  if (([(ContainerViewController *)self containerStyle] & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    goto LABEL_20;
  }
  uint64_t v9 = [(ContainerViewController *)self currentViewController];
  [v9 heightForLayout:1];
  double v11 = v10;

  double v12 = [(ContainerViewController *)self currentViewController];
  [v12 heightForLayout:2];
  double v14 = v13;

  if (v14 == v11) {
    return 0;
  }
  if (v11 < a5)
  {
    if (v14 >= a5) {
      double v16 = a5;
    }
    else {
      double v16 = v14;
    }
    double v17 = (v16 - v11) / (v14 - v11);
    if (v17 < 0.0) {
      double v17 = 0.0;
    }
    if (v17 > 1.0) {
      double v17 = 1.0;
    }
    if (a3) {
      *a3 = v17;
    }
    if (!a4) {
      return 1;
    }
    double v18 = (1.0 - v17) * 0.699999988 + 0.300000012;
    if (v18 < 0.300000012) {
      double v18 = 0.300000012;
    }
    if (v18 > 1.0) {
      double v18 = 1.0;
    }
  }
  else
  {
LABEL_20:
    if (a3) {
      *a3 = 0.0;
    }
    double v18 = 1.0;
    if (!a4) {
      return 1;
    }
  }
  *a4 = v18;
  return 1;
}

- (void)_handlePIPViewTap:(id)a3
{
}

- (void)_setupForFullScreen
{
  if (self->_displayState != 1)
  {
    double v3 = [(LookAroundContainerViewController *)self dataCoordinator];
    [v3 removeObserver:self];

    double v4 = [(LookAroundContainerViewController *)self puckViewController];
    double v5 = [v4 view];
    [v5 setAlpha:0.0];

    double v6 = [(LookAroundContainerViewController *)self puckViewController];
    id v7 = [v6 view];
    [v7 setHidden:1];

    double v8 = [(LookAroundContainerViewController *)self pipViewController];
    [v8 setShowsMinimizedButton:1];

    [(MKLookAroundView *)self->_lookAroundView setShowsPointLabels:self->_showsLabels];
    [(MKLookAroundView *)self->_lookAroundView setShowsRoadLabels:self->_showsLabels];
    [(MKLookAroundView *)self->_lookAroundView setUserInteractionEnabled:1];
    BOOL v9 = self->_trayContaineeViewController != 0;
    double v10 = [(ContainerViewController *)self containerView];
    [v10 setUserInteractionEnabled:v9];

    double v11 = [(LookAroundContainerViewController *)self pipViewController];
    double v12 = [v11 view];
    [v12 setAccessibilityIdentifier:@"LookAroundFullScreenView"];

    [(LookAroundTrayContaineeViewController *)self->_trayContaineeViewController setVisible:1 animated:1];
    self->_displayState = 1;
    double v13 = [(ContainerViewController *)self chromeViewController];
    [v13 setNeedsUserInterfaceAppearanceUpdate];

    [(OverlayContainerViewController *)self updateTheme];
  }
}

- (void)_setupForPIP
{
  if (self->_displayState != 2)
  {
    double v3 = [(ContainerViewController *)self chromeViewController];
    unint64_t v4 = ((unint64_t)[v3 displayedViewMode] - 1) & 0xFFFFFFFFFFFFFFFALL;

    if (!v4)
    {
      double v5 = [(ContainerViewController *)self chromeViewController];
      [v5 updateViewMode:0 animated:0];
    }
    double v6 = [(LookAroundContainerViewController *)self dataCoordinator];
    [v6 addObserver:self];

    id v7 = [(LookAroundContainerViewController *)self dataCoordinator];
    [v7 setNeedsLookAroundAvailabilityUpdate];

    double v8 = [(LookAroundContainerViewController *)self puckViewController];
    BOOL v9 = [v8 view];
    [v9 setAlpha:1.0];

    double v10 = [(LookAroundContainerViewController *)self puckViewController];
    double v11 = [v10 view];
    [v11 setHidden:0];

    double v12 = [(LookAroundContainerViewController *)self pipViewController];
    [v12 setShowsMinimizedButton:0];

    self->_showsLabels = [(MKLookAroundView *)self->_lookAroundView showsPointLabels];
    [(MKLookAroundView *)self->_lookAroundView setShowsPointLabels:0];
    [(MKLookAroundView *)self->_lookAroundView setShowsRoadLabels:0];
    double v13 = [(ContainerViewController *)self containerView];
    [v13 setUserInteractionEnabled:0];

    [(LookAroundTrayContaineeViewController *)self->_trayContaineeViewController setVisible:0 animated:1];
    double v14 = [(LookAroundContainerViewController *)self pipViewController];
    long long v15 = [v14 view];
    [v15 setAccessibilityIdentifier:@"LookAroundPiPView"];

    self->_displayState = 2;
    double v16 = [(ContainerViewController *)self chromeViewController];
    [v16 setNeedsUserInterfaceAppearanceUpdate];

    [(OverlayContainerViewController *)self updateTheme];
  }
}

- (void)_showTTRButton:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = +[MKSystemController sharedInstance];
  unsigned int v6 = [v5 isInternalInstall];

  if (v6)
  {
    if (!v3) {
      goto LABEL_5;
    }
    uint64_t v7 = [(MKLookAroundView *)self->_lookAroundView window];
    if (!v7) {
      goto LABEL_5;
    }
    double v8 = (void *)v7;
    BOOL v9 = [(MKLookAroundView *)self->_lookAroundView window];
    double v10 = [(OverlayContainerViewController *)self overlayView];
    double v11 = [v10 window];

    if (v9 == v11)
    {
      if (self->_ttrButtonView) {
        goto LABEL_8;
      }
      double v14 = objc_alloc_init(LookAroundTTRButtonView);
      ttrButtonView = self->_ttrButtonView;
      self->_ttrButtonView = v14;

      [(LookAroundTTRButtonView *)self->_ttrButtonView setDelegate:self];
      [(LookAroundTTRButtonView *)self->_ttrButtonView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(LookAroundTTRButtonView *)self->_ttrButtonView setTag:MKLookAroundTTRButtonTag];
      [(MKLookAroundView *)self->_lookAroundView addSubview:self->_ttrButtonView];
      double v16 = [(LookAroundContainerViewController *)self traitCollection];
      id v17 = [v16 userInterfaceIdiom];

      if (v17 == (id)5) {
        double v18 = -76.0;
      }
      else {
        double v18 = -16.0;
      }
      double v29 = [(LookAroundTTRButtonView *)self->_ttrButtonView bottomAnchor];
      double v30 = [(OverlayContainerViewController *)self overlayView];
      CGAffineTransform v19 = [v30 safeAreaLayoutGuide];
      CGAffineTransform v20 = [v19 bottomAnchor];
      CGRect v21 = [(LookAroundTTRButtonView *)v29 constraintEqualToAnchor:v20 constant:-16.0];
      v31[0] = v21;
      CGRect v22 = [(LookAroundTTRButtonView *)self->_ttrButtonView trailingAnchor];
      CGRect v23 = [(OverlayContainerViewController *)self overlayView];
      double v24 = [v23 safeAreaLayoutGuide];
      CGAffineTransform v25 = [v24 trailingAnchor];
      CGRect v26 = [v22 constraintEqualToAnchor:v25 constant:v18];
      v31[1] = v26;
      double v27 = +[NSArray arrayWithObjects:v31 count:2];
      [v28 activateConstraints:v27];

      double v13 = v29;
    }
    else
    {
LABEL_5:
      double v12 = self->_ttrButtonView;
      if (!v12)
      {
LABEL_8:
        [(LookAroundContainerViewController *)self _updateTTRButtonState];
        return;
      }
      [(LookAroundTTRButtonView *)v12 removeFromSuperview];
      double v13 = self->_ttrButtonView;
      self->_ttrButtonView = 0;
    }

    goto LABEL_8;
  }
}

- (void)animateFromModeTransition:(id)a3
{
  id v4 = a3;
  self->_modeTransition = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);
  unsigned int v6 = [(LookAroundContainerViewController *)self pipViewController];
  uint64_t v7 = [v6 view];

  double v8 = [(LookAroundContainerViewController *)self pipViewController];
  BOOL v9 = [v8 cardView];

  double v10 = [v7 layer];
  [v10 setShouldRasterize:1];

  double v11 = [(LookAroundContainerViewController *)self pipViewController];
  double v12 = [v11 floatingButtonsView];

  double v13 = self->_lookAroundView;
  [(MKLookAroundView *)v13 setCompassHidden:1];
  id chromeDeactivationToken = self->_chromeDeactivationToken;
  self->_id chromeDeactivationToken = 0;

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100810090;
  v32[3] = &unk_1012E98D8;
  v32[4] = self;
  long long v15 = v13;
  v33 = v15;
  id v16 = v7;
  id v34 = v16;
  id v17 = v12;
  id v35 = v17;
  id v18 = v9;
  id v36 = v18;
  CGAffineTransform v19 = objc_retainBlock(v32);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10081029C;
  v28[3] = &unk_1012E66E0;
  id v20 = WeakRetained;
  id v29 = v20;
  double v30 = self;
  id v21 = v4;
  id v31 = v21;
  CGRect v22 = objc_retainBlock(v28);
  if ([v21 isAnimated])
  {
    +[CATransaction begin];
    +[CATransaction setAnimationDuration:0.449999988];
    CGRect v23 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    +[CATransaction setAnimationTimingFunction:v23];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1008102E4;
    v26[3] = &unk_1012E6EA8;
    double v27 = v19;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1008102F4;
    v24[3] = &unk_1012EAFC0;
    CGAffineTransform v25 = v22;
    +[UIView animateWithDuration:v26 animations:v24 completion:0.449999988];
    +[CATransaction commit];
  }
  else
  {
    ((void (*)(void *))v19[2])(v19);
    ((void (*)(void *))v22[2])(v22);
  }
}

- (void)animateToModeTransition:(id)a3
{
  id v4 = a3;
  double v5 = [(LookAroundContainerViewController *)self view];
  [v5 layoutIfNeeded];

  self->_modeTransition = 1;
  if (self->_showsFullScreen)
  {
    [(LookAroundContainerViewController *)self _setupForFullScreen];
    uint64_t v6 = 7;
  }
  else
  {
    [(LookAroundContainerViewController *)self _setupForPIP];
    uint64_t v6 = 6;
  }
  uint64_t v7 = [(LookAroundContainerViewController *)self pipViewController];
  double v8 = [v7 view];

  BOOL v9 = [(LookAroundContainerViewController *)self pipViewController];
  double v10 = [v9 cardView];

  double v11 = [(LookAroundContainerViewController *)self pipViewController];
  double v12 = [v11 floatingButtonsView];

  [v12 setAlpha:0.0];
  double v13 = [self->_trayContaineeViewController cardPresentationController];
  [v13 setHidden:1];

  [v10 setLayoutStyle:6];
  double v14 = [(LookAroundContainerViewController *)self pipViewController];
  long long v15 = [v14 lookAroundContainerView];

  LOBYTE(v14) = self->_showsFullScreen;
  [(LookAroundContainerViewController *)self frameForPIPView];
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100810768;
  v42[3] = &unk_1012F9C78;
  id v24 = v10;
  id v43 = v24;
  uint64_t v47 = v6;
  id v25 = v8;
  id v44 = v25;
  uint64_t v48 = v17;
  uint64_t v49 = v19;
  uint64_t v50 = v21;
  uint64_t v51 = v23;
  id v26 = v12;
  id v45 = v26;
  id v27 = v15;
  id v46 = v27;
  char v52 = (char)v14;
  id v28 = objc_retainBlock(v42);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1008107DC;
  v39[3] = &unk_1012E5D58;
  id v29 = v4;
  id v40 = v29;
  v41 = self;
  double v30 = objc_retainBlock(v39);
  if ([v29 isAnimated])
  {
    [(LookAroundContainerViewController *)self _sanitizedOriginFrame];
    [v25 setFrame:];
    double v31 = 1.0;
    if (!self->_lookAroundViewOriginalSuperview) {
      double v31 = 0.0;
    }
    [v25 setAlpha:v31];
    double v32 = [(LookAroundContainerViewController *)self puckViewController];
    v33 = [v32 view];
    [v33 setAlpha:0.0];

    [v25 layoutIfNeeded];
    +[CATransaction begin];
    +[CATransaction setAnimationDuration:0.449999988];
    id v34 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    +[CATransaction setAnimationTimingFunction:v34];

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100810904;
    v37[3] = &unk_1012E6EA8;
    double v38 = v28;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100810914;
    v35[3] = &unk_1012EAFC0;
    id v36 = v30;
    +[UIView animateWithDuration:v37 animations:v35 completion:0.449999988];
    +[CATransaction commit];
  }
  else
  {
    ((void (*)(void *))v28[2])(v28);
    ((void (*)(void *))v30[2])(v30);
  }
}

- (void)didCompleteModeTransition
{
}

- (void)_showPuckAnimated
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1008109BC;
  v2[3] = &unk_1012E5D08;
  v2[4] = self;
  +[UIView animateWithDuration:v2 animations:&stru_1012F9C98 completion:0.449999988];
}

- (void)prepareForExitWithCompletion:(id)a3
{
  double v8 = (void (**)(void))a3;
  id chromeDeactivationToken = self->_chromeDeactivationToken;
  self->_id chromeDeactivationToken = 0;

  double v5 = [(ContainerViewController *)self currentViewController];
  uint64_t v6 = [v5 cardPresentationController];
  unsigned int v7 = [v6 usingSheetPresentation];

  if (v7)
  {
    if (v8) {
      v8[2]();
    }
  }
  else
  {
    [(LookAroundContainerViewController *)self dismissViewControllerAnimated:1 completion:v8];
  }
}

- (void)prepareForExit
{
}

- (void)animateTransitionToFullScreen:(BOOL)a3
{
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100810C0C;
  v8[3] = &unk_1012E9838;
  BOOL v10 = a3;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  double v5 = objc_retainBlock(v8);
  uint64_t v6 = v5;
  if (self->_displayState)
  {
    ((void (*)(void *))v5[2])(v5);
  }
  else
  {
    dispatch_time_t v7 = dispatch_time(0, 100000000);
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v6);
  }

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)contentHeightUpdatedWithValue:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LookAroundContainerViewController;
  -[OverlayContainerViewController contentHeightUpdatedWithValue:](&v5, "contentHeightUpdatedWithValue:");
  [(LookAroundContainerViewController *)self _updateLayoutWithValue:a3];
}

- (void)snapToLayout:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LookAroundContainerViewController;
  [(ContainerViewController *)&v4 snapToLayout:a3];
  [(LookAroundContainerViewController *)self _updateLayoutWithCurrentValue];
}

- (BOOL)useBackdrop
{
  return 0;
}

- (unint64_t)originalLayoutForViewController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0
    || (unint64_t v6 = [(ContainerViewController *)self containerStyle], result = 3, v6 <= 7)
    && ((1 << v6) & 0xE3) != 0)
  {
    BOOL v8 = self->_locationState < 2;
    if ((v8 || (isKindOfClass & 1) == 0) | [(LookAroundContainerViewController *)self isDisplayingLookAroundPIP])return 1; {
    else
    }
      return 2;
  }
  return result;
}

- (void)popLastViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(ContainerViewController *)self currentViewController];
  v8.receiver = self;
  v8.super_class = (Class)LookAroundContainerViewController;
  [(ContainerViewController *)&v8 popLastViewControllerAnimated:v3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v6 = [(LookAroundContainerViewController *)self dataCoordinator];
    dispatch_time_t v7 = [v6 mapView];
    [v7 _deselectLabelMarkerAnimated:1];

    if (self->_locationState != 2) {
      [(MKLookAroundView *)self->_lookAroundView deselectLabelMarker];
    }
  }
}

- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ![(LookAroundContainerViewController *)self isDisplayingLookAroundFullScreen])
  {
    objc_storeStrong((id *)&self->_trayContaineeViewController, a3);
    [(LookAroundTrayContaineeViewController *)self->_trayContaineeViewController updateLocation];
    [(LookAroundTrayContaineeViewController *)self->_trayContaineeViewController setDelegate:self];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11[4] = self;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1008114B8;
      v12[3] = &unk_1012E5D08;
      v12[4] = self;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100811518;
      v11[3] = &unk_1012E7D28;
      +[UIView _animateUsingDefaultDampedSpringWithDelay:2 initialSpringVelocity:v12 options:v11 animations:0.0 completion:0.0];
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)LookAroundContainerViewController;
  [(ContainerViewController *)&v10 presentController:v9 animated:v6 useDefaultContaineeLayout:v5];
}

- (BOOL)_pipHugsLeading
{
  id v4 = [(LookAroundContainerViewController *)self view];
  uint64_t v5 = sub_1000BBB44(v4);
  if (v5 == 5)
  {
    v2 = [(LookAroundContainerViewController *)self view];
    if (![v2 effectiveUserInterfaceLayoutDirection])
    {
      BOOL v7 = 1;
LABEL_9:

      goto LABEL_10;
    }
  }
  BOOL v6 = [(LookAroundContainerViewController *)self view];
  if (sub_1000BBB44(v6) == 5)
  {
    BOOL v7 = 0;
  }
  else
  {
    objc_super v8 = [(LookAroundContainerViewController *)self view];
    BOOL v7 = [v8 effectiveUserInterfaceLayoutDirection] == (id)1;
  }
  if (v5 == 5) {
    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

- (double)topEdgeInset
{
  unsigned int v3 = [(LookAroundContainerViewController *)self isDisplayingLookAroundPIP];
  double result = 0.0;
  if (v3)
  {
    double v5 = 8.0;
    if (sub_1000BBB44(self) == 5) {
      double v5 = sub_1000BBAF8();
    }
    if ([(LookAroundContainerViewController *)self _shouldTakePIPViewHeightIntoAccount]&& [(LookAroundContainerViewController *)self isDisplayingLookAroundPIP])
    {
      BOOL v6 = [(LookAroundContainerViewController *)self pipViewController];
      BOOL v7 = [v6 view];
      [v7 frame];
      double v8 = v5 + CGRectGetMaxY(v15);
      [(ContainerViewController *)self statusBarHeight];
      if (v8 <= v9)
      {
        [(ContainerViewController *)self statusBarHeight];
        double v12 = v14;
      }
      else
      {
        objc_super v10 = [(LookAroundContainerViewController *)self pipViewController];
        double v11 = [v10 view];
        [v11 frame];
        double v12 = v5 + CGRectGetMaxY(v16);
      }
    }
    else
    {
      [(ContainerViewController *)self statusBarHeight];
      double v12 = v13;
    }
    return v12 + 0.0;
  }
  return result;
}

- (double)pipViewWidthIfNeeded
{
  double v3 = 0.0;
  if ([(LookAroundContainerViewController *)self isDisplayingLookAroundPIP])
  {
    id v4 = [(LookAroundPIPViewController *)self->_pipViewController view];
    double v5 = 8.0;
    if (sub_1000BBB44(self) == 5) {
      double v5 = sub_1000BBAF8();
    }
    unint64_t v6 = [(ContainerViewController *)self containerStyle];
    unsigned int v7 = (v6 < 8) & (0xE3u >> v6);
    unsigned __int8 v8 = [(LookAroundContainerViewController *)self _shouldTakeSidebarIntoAccount];
    unsigned __int8 v9 = [(LookAroundContainerViewController *)self _shouldTakePIPViewHeightIntoAccount];
    if ((v7 & 1) == 0 && (v8 & 1) == 0 && (v9 & 1) == 0)
    {
      if ([(LookAroundContainerViewController *)self _pipHugsLeading])
      {
        [v4 frame];
        double v3 = v5 + CGRectGetMaxX(v13);
      }
      else
      {
        objc_super v10 = [(LookAroundContainerViewController *)self view];
        [v10 bounds];
        double MaxX = CGRectGetMaxX(v14);
        [v4 frame];
        double v3 = MaxX - (CGRectGetMinX(v15) - v5);
      }
    }
  }
  return v3;
}

- (double)sidebarWidthIfNeeded
{
  double v3 = 0.0;
  if ([(LookAroundContainerViewController *)self _shouldTakeSidebarIntoAccount])
  {
    id v4 = [(LookAroundContainerViewController *)self view];
    id v5 = [v4 effectiveUserInterfaceLayoutDirection];

    if (v5 == (id)1)
    {
      unint64_t v6 = [(LookAroundContainerViewController *)self view];
      [v6 bounds];
      double MaxX = CGRectGetMaxX(v10);
      unsigned __int8 v8 = [(ContainerViewController *)self containerView];
      [v8 frame];
      double v3 = MaxX - CGRectGetMinX(v11);
    }
    else
    {
      unint64_t v6 = [(ContainerViewController *)self containerView];
      [v6 frame];
      double v3 = CGRectGetMaxX(v12);
    }
  }
  return v3;
}

- (void)updateMapEdgeInsets
{
  if (!self->_modeTransition)
  {
    uint64_t v3 = [(LookAroundContainerViewController *)self viewIfLoaded];
    if (v3)
    {
      id v25 = (id)v3;
      id v4 = [(LookAroundContainerViewController *)self view];
      id v5 = [v4 superview];
      if (v5 && ![(ContainerViewController *)self preventEdgeInsetsUpdate])
      {
        BOOL isRespondingToPanGesture = self->_isRespondingToPanGesture;

        if (isRespondingToPanGesture) {
          return;
        }
        [(LookAroundContainerViewController *)self topEdgeInset];
        double top = v7;
        [(ContainerViewController *)self bottomEdgeInset];
        double bottom = v9;
        [(ContainerViewController *)self leftSafeOffset];
        double left = v11;
        [(ContainerViewController *)self rightSafeOffset];
        double right = v13;
        [(LookAroundContainerViewController *)self pipViewWidthIfNeeded];
        double v16 = v15;
        [(LookAroundContainerViewController *)self sidebarWidthIfNeeded];
        double v18 = v17;
        if ([(ContainerViewController *)self chromeHidden])
        {
          double top = UIEdgeInsetsZero.top;
          double left = UIEdgeInsetsZero.left;
          double bottom = UIEdgeInsetsZero.bottom;
          double right = UIEdgeInsetsZero.right;
        }
        else
        {
          if (fabs(v16) > 2.22044605e-16)
          {
            if ([(LookAroundContainerViewController *)self _pipHugsLeading]) {
              double left = v16;
            }
            else {
              double right = v16;
            }
          }
          if (fabs(v18) > 2.22044605e-16)
          {
            uint64_t v19 = [(LookAroundContainerViewController *)self view];
            id v20 = [v19 effectiveUserInterfaceLayoutDirection];

            if (v20 == (id)1) {
              double right = v18;
            }
            else {
              double left = v18;
            }
          }
        }
        uint64_t v21 = [(ContainerViewController *)self chromeViewController];
        [(ContainerViewController *)self statusBarHeight];
        [v21 setLabelEdgeInsets:];

        uint64_t v22 = [(ContainerViewController *)self chromeViewController];
        [(ContainerViewController *)self statusBarHeight];
        [v22 setLabelEdgeWidths:];

        uint64_t v23 = [(ContainerViewController *)self chromeViewController];
        id v24 = [(ContainerViewController *)self chromeContext];
        [v23 setMapEdgeInsets:0 animated:v24 forContext:top, left, bottom, right];

        id v25 = [(LookAroundContainerViewController *)self dataCoordinator];
        [v25 synchronizeMapViewIfNeeded];
      }
      else
      {
      }
    }
  }
}

- (int64_t)preferredUserInterfaceStyle
{
  uint64_t v3 = [(LookAroundContainerViewController *)self view];
  id v4 = [v3 window];
  id v5 = [v4 traitCollection];
  id v6 = [v5 copy];

  int64_t v7 = (int64_t)[v6 userInterfaceStyle];
  if (v7 == 1)
  {
    if ([(LookAroundContainerViewController *)self isDisplayingLookAroundFullScreen]) {
      int64_t v7 = 2;
    }
    else {
      int64_t v7 = 1;
    }
  }

  return v7;
}

- (void)lookAroundPIPDataCoordinatorDidStartPanningMapView:(id)a3
{
  id v7 = a3;
  if (self->_selectingLabelMarker)
  {
    [(MKLookAroundView *)self->_lookAroundView recordTriggerAction:1010];
  }
  else
  {
    self->_locationState = 2;
    id v4 = [(ContainerViewController *)self currentViewController];
    actionCoordinator = self->_actionCoordinator;
    id v6 = [v7 mapView];
    [(LookAroundActionCoordinator *)actionCoordinator viewControllerGoPreviousState:v4 withSender:v6];

    [(MKLookAroundView *)self->_lookAroundView recordTriggerAction:1001];
  }
  self->_selectingLabelMarker = 0;
}

- (void)lookAroundPIPDataCoordinatorDidEndMovingLookAroundView:(id)a3
{
  id v4 = [a3 lookAroundView];
  id v8 = [v4 mapItem];

  if (v8)
  {
    id v5 = [(LookAroundContainerViewController *)self _createPlaceCardItemFromMapItem:v8 isMarkedLocation:[(MKLookAroundEntryPoint *)self->_entryPoint isMarkedLocation]];
    id v6 = [(LookAroundContainerViewController *)self actionCoordinator];
    id v7 = [(ContainerViewController *)self currentViewController];
    [v6 viewController:v7 presentPlaceCardForItem:v5];
  }
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  if ([(LookAroundContainerViewController *)self isDisplayingLookAroundPIP])
  {
    self->_BOOL isRespondingToPanGesture = a4 == 0;
    id v8 = [(LookAroundContainerViewController *)self dataCoordinator];
    [v8 coordinateMapView:v9 willStartRespondingToGesture:a4 animated:v5];
  }
}

- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  BOOL v9 = a7;
  id v15 = a3;
  if ([(LookAroundContainerViewController *)self isDisplayingLookAroundPIP])
  {
    CGRect v14 = [(LookAroundContainerViewController *)self dataCoordinator];
    [v14 coordinateMapView:v15 didStopRespondingToGesture:a4 zoomDirection:a5 zoomGestureType:a6 didDecelerate:v9 tiltDirection:a8];
  }
}

- (void)mapViewDidStartUserInteraction:(id)a3
{
  id v5 = a3;
  if ([(LookAroundContainerViewController *)self isDisplayingLookAroundPIP])
  {
    id v4 = [(LookAroundContainerViewController *)self dataCoordinator];
    [v4 coordinateMapViewDidStartUserInteraction:v5];
  }
}

- (void)mapViewDidStopUserInteraction:(id)a3
{
  id v5 = a3;
  if ([(LookAroundContainerViewController *)self isDisplayingLookAroundPIP])
  {
    id v4 = [(LookAroundContainerViewController *)self dataCoordinator];
    [v4 coordinateMapViewDidStopUserInteraction:v5];

    self->_BOOL isRespondingToPanGesture = 0;
  }
}

- (void)mapView:(id)a3 willSelectLabelMarker:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    if ([(LookAroundContainerViewController *)self isDisplayingLookAroundPIP]) {
      self->_selectingLabelMarker = 1;
    }
    id v8 = [(LookAroundContainerViewController *)self dataCoordinator];
    [v8 coordinateMapView:v7 willSelectLabelMarker:v6];
  }
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v6 = a3;
  if ([(LookAroundContainerViewController *)self isDisplayingLookAroundPIP])
  {
    id v5 = [(LookAroundContainerViewController *)self dataCoordinator];
    [v5 coordinateMapViewRegionDidChange:v6];
  }
}

- (void)mapViewDidChangeVisibleRegion:(id)a3
{
  id v8 = a3;
  if ([(LookAroundContainerViewController *)self isDisplayingLookAroundPIP])
  {
    id v4 = [(LookAroundContainerViewController *)self dataCoordinator];
    [v4 coordinateMapViewDidChangeVisibleRegion:v8];
  }
  id v5 = [v8 _mapLayer];
  [v5 pitch];
  double v7 = v6;

  [(LookAroundPuckViewController *)self->_puckViewController setPitch:v7];
}

- (void)mapView:(id)a3 didChangeLookAroundAvailability:(int64_t)a4
{
  id v7 = a3;
  if ([(LookAroundContainerViewController *)self isDisplayingLookAroundPIP])
  {
    double v6 = [(LookAroundContainerViewController *)self dataCoordinator];
    [v6 coordinateMapView:v7 didChangeLookAroundAvailability:a4];
  }
}

- (void)lookAroundTTRButtonView:(id)a3 didTapTTRButton:(id)a4
{
  id v6 = [(LookAroundContainerViewController *)self actionCoordinator];
  id v5 = [(ContainerViewController *)self currentViewController];
  [v6 viewControllerPresentTTR:v5];
}

- (void)lookAroundTrayContaineeViewController:(id)a3 didTapToggleLabelsButton:(id)a4
{
  if ([(MKLookAroundView *)self->_lookAroundView showsPointLabels]) {
    uint64_t v5 = [(MKLookAroundView *)self->_lookAroundView showsRoadLabels] ^ 1;
  }
  else {
    uint64_t v5 = 1;
  }

  [(LookAroundContainerViewController *)self _toggleShowingLabels:v5];
}

- (void)lookAroundTrayContaineeViewController:(id)a3 didTapShareButton:(id)a4
{
}

- (void)lookAroundTrayContaineeViewController:(id)a3 didTapReportAnIssueButton:(id)a4
{
}

- (UIView)passThroughView
{
  uint64_t v3 = [(ContainerViewController *)self chromeViewController];
  id v4 = [v3 passThroughView];

  if ([(LookAroundContainerViewController *)self isDisplayingLookAroundFullScreen])
  {
    uint64_t v5 = self->_lookAroundView;

    id v4 = v5;
  }

  return (UIView *)v4;
}

- (void)lookAroundViewDidStartUserInteraction:(id)a3
{
  id v5 = a3;
  if ([(LookAroundContainerViewController *)self isDisplayingLookAroundPIP])
  {
    id v4 = [(LookAroundContainerViewController *)self dataCoordinator];
    [v4 coordinateLookAroundViewDidStartUserInteraction:v5];
  }
}

- (void)lookAroundViewDidStopUserInteraction:(id)a3
{
  id v5 = a3;
  if ([(LookAroundContainerViewController *)self isDisplayingLookAroundPIP])
  {
    id v4 = [(LookAroundContainerViewController *)self dataCoordinator];
    [v4 coordinateLookAroundViewDidStopUserInteraction:v5];
  }
}

- (void)lookAroundView:(id)a3 didTapLabelMarker:(id)a4
{
  uint64_t v5 = [(LookAroundContainerViewController *)self _targetForAnalytics];

  [(LookAroundContainerViewController *)self _captureUserAction:6072 onTarget:v5 eventValue:0];
}

- (void)lookAroundView:(id)a3 didTapAtPoint:(CGPoint)a4 areaAvailable:(BOOL)a5
{
  id v7 = a3;
  if (a5)
  {
    uint64_t v8 = 6072;
  }
  else
  {
    BOOL v9 = [(ContainerViewController *)self currentViewController];
    dispatch_time_t v10 = dispatch_time(0, 250000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100812550;
    block[3] = &unk_1012E66E0;
    block[4] = self;
    id v13 = v9;
    id v14 = v7;
    id v11 = v9;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);

    uint64_t v8 = 1061;
  }
  [(LookAroundContainerViewController *)self _captureUserAction:v8 onTarget:[(LookAroundContainerViewController *)self _targetForAnalytics] eventValue:0];
}

- (void)lookAroundView:(id)a3 didZoomWithDirection:(int64_t)a4 type:(int64_t)a5
{
  if (a4 == 1) {
    uint64_t v6 = 1043;
  }
  else {
    uint64_t v6 = 1044;
  }
  uint64_t v7 = [(LookAroundContainerViewController *)self _targetForAnalytics];

  [(LookAroundContainerViewController *)self _captureUserAction:v6 onTarget:v7 eventValue:0];
}

- (void)lookAroundViewDidPan:(id)a3
{
  uint64_t v4 = [(LookAroundContainerViewController *)self _targetForAnalytics];

  [(LookAroundContainerViewController *)self _captureUserAction:6069 onTarget:v4 eventValue:0];
}

- (void)lookAroundView:(id)a3 didChangeCameraFrame:(id)a4
{
  id v6 = a3;
  if ([(LookAroundContainerViewController *)self isDisplayingLookAroundPIP])
  {
    uint64_t v5 = [(LookAroundContainerViewController *)self dataCoordinator];
    [v5 coordinateLookAroundViewDidChangeVisibleRegion:v6];
  }
}

- (void)lookAroundView:(id)a3 didChangeLocationInfo:(id)a4
{
  unint64_t locationState = self->_locationState;
  if (locationState == 2)
  {
    self->_unint64_t locationState = 3;
    id v6 = [(LookAroundContainerViewController *)self _maps_mapsSceneDelegate];
    [v6 refreshTitle];
  }
  else if (!locationState)
  {
    self->_unint64_t locationState = 1;
  }
  trayContaineeViewController = self->_trayContaineeViewController;

  [(LookAroundTrayContaineeViewController *)trayContaineeViewController updateLocation];
}

- (void)lookAroundView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_1005764AC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    BOOL v9 = (objc_class *)objc_opt_class();
    dispatch_time_t v10 = NSStringFromClass(v9);
    id v11 = (objc_class *)objc_opt_class();
    CGRect v12 = NSStringFromClass(v11);
    int v23 = 134219010;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2048;
    id v28 = v6;
    __int16 v29 = 2112;
    double v30 = v12;
    __int16 v31 = 2048;
    id v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "<LookAroundContainerViewController: %p> -lookAroundView:<%@: %p> didSelectLabelMarker:<%@: %p>", (uint8_t *)&v23, 0x34u);
  }
  self->_unint64_t locationState = 3;
  id v13 = [objc_alloc((Class)MKMapItem) _initWithLabelMarker:v7];
  id v14 = [(LookAroundContainerViewController *)self _createPlaceCardItemFromMapItem:v13 isMarkedLocation:[(MKLookAroundEntryPoint *)self->_entryPoint isMarkedLocation]];
  [v7 calloutAnchorPointWithSnapToPixels:0];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  [v7 lateralCalloutAnchorRect];
  CGRect v34 = CGRectOffset(v33, v16, v18);
  [v14 setCalloutAnchorRect:v34.origin.x, v34.origin.y, v34.size.width, v34.size.height];
  actionCoordinator = self->_actionCoordinator;
  id v20 = [(ContainerViewController *)self currentViewController];
  [(LookAroundActionCoordinator *)actionCoordinator viewController:v20 presentPlaceCardForItem:v14];

  uint64_t v21 = [v7 styleAttributes];
  if ([v21 isLandmarkPOI]) {
    uint64_t v22 = 6071;
  }
  else {
    uint64_t v22 = 1010;
  }

  [(LookAroundContainerViewController *)self _captureActivityCardAnalyticsForUserAction:v22 onTarget:1702];
}

- (void)lookAroundView:(id)a3 didDeselectLabelMarker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_1005764AC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    BOOL v9 = (objc_class *)objc_opt_class();
    dispatch_time_t v10 = NSStringFromClass(v9);
    id v11 = (objc_class *)objc_opt_class();
    CGRect v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 134219010;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2048;
    id v28 = v6;
    __int16 v29 = 2112;
    double v30 = v12;
    __int16 v31 = 2048;
    id v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "<LookAroundContainerViewController: %p> -lookAroundView:<%@: %p> didDeselectLabelMarker:<%@: %p>", buf, 0x34u);
  }
  id v13 = [(ContainerViewController *)self currentViewController];
  dispatch_time_t v14 = dispatch_time(0, 250000000);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100812AF0;
  v18[3] = &unk_1012E85E0;
  id v19 = v6;
  id v20 = v7;
  uint64_t v21 = self;
  id v22 = v13;
  id v15 = v13;
  id v16 = v7;
  id v17 = v6;
  dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, v18);
}

- (void)lookAroundViewWillChangeLocationInfo:(id)a3
{
  self->_unint64_t locationState = 2;
  id v4 = a3;
  id v5 = [(ContainerViewController *)self currentViewController];
  [(LookAroundActionCoordinator *)self->_actionCoordinator viewControllerGoPreviousState:v5 withSender:v4];
}

- (id)urlForMapActivity:(id)a3
{
  return [(MKLookAroundView *)self->_lookAroundView sharingURL];
}

- (id)titleForMapActivity:(id)a3
{
  id v4 = [(MKLookAroundView *)self->_lookAroundView mapItem];

  lookAroundView = self->_lookAroundView;
  if (v4)
  {
    id v6 = [(MKLookAroundView *)lookAroundView mapItem];
    id v7 = [v6 name];
  }
  else
  {
    id v7 = [(MKLookAroundView *)lookAroundView locationTitle];
  }

  return v7;
}

- (void)_captureActivityCardAnalyticsForUserAction:(int)a3 onTarget:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = [(LookAroundContainerViewController *)self lookAroundView];
  uint64_t v8 = [v7 mapItem];
  unsigned int v9 = [v8 _hasMUID];

  id v25 = 0;
  if (v5 != 4 && v9)
  {
    dispatch_time_t v10 = [(LookAroundContainerViewController *)self lookAroundView];
    id v11 = [v10 mapItem];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", [v11 _muid]);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  CGRect v12 = [(LookAroundContainerViewController *)self lookAroundView];
  [v12 centerCoordinate];
  id v15 = [objc_alloc((Class)GEOLocation) initWithLatitude:v13 longitude:v14];
  [v12 presentationYaw];
  double v17 = v16;
  CGFloat v18 = [v12 lookAroundView];
  [v18 trackingZoomScale];
  double v20 = v19;
  uint64_t v21 = [v12 visiblePlaceMUIDs];
  id v22 = [v21 count];
  if ([v12 showsRoadLabels]) {
    unsigned __int8 v23 = 1;
  }
  else {
    unsigned __int8 v23 = [v12 showsPointLabels];
  }
  LOBYTE(v24) = v23;
  +[GEOAPPortal captureLookAroundUserAction:v5 onTarget:v4 eventValue:v25 location:v15 heading:v17 zoom:v22 numberPoisInView:v20 labelingShown:v24];
}

- (void)_toggleShowingLabels:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    uint64_t v5 = 6067;
  }
  else {
    uint64_t v5 = 6066;
  }
  [(LookAroundContainerViewController *)self _captureActivityCardAnalyticsForUserAction:v5 onTarget:1701];
  id v6 = [(LookAroundContainerViewController *)self lookAroundView];
  [v6 setShowsPointLabels:v3];

  id v7 = [(LookAroundContainerViewController *)self lookAroundView];
  [v7 setShowsRoadLabels:v3];
}

- (void)_reportAnIssue
{
  [(LookAroundContainerViewController *)self _captureActivityCardAnalyticsForUserAction:5013 onTarget:1701];
  BOOL v3 = [RAPLookAroundContextImpl alloc];
  uint64_t v4 = [(LookAroundContainerViewController *)self lookAroundView];
  id v7 = [(RAPLookAroundContextImpl *)v3 initWithLookAroundView:v4];

  uint64_t v5 = [(LookAroundContainerViewController *)self _maps_mapsSceneDelegate];
  id v6 = [v5 rapPresenter];
  [v6 presentLookAroundRAPWithContext:v7 completion:0];
}

- (CGRect)_sanitizedOriginFrame
{
  if (sub_1000BBB44(self) == 5)
  {
    [(LookAroundContainerViewController *)self frameForPIPView];
    double x = v3;
    double y = v5;
    double width = v7;
    double height = v9;
  }
  else
  {
    p_originFrame = &self->_originFrame;
    double x = self->_originFrame.origin.x;
    double y = self->_originFrame.origin.y;
    double width = self->_originFrame.size.width;
    double height = self->_originFrame.size.height;
    v35.origin.double x = x;
    v35.origin.double y = y;
    v35.size.double width = width;
    v35.size.double height = height;
    if (CGRectIsEmpty(v35))
    {
      CGRect v12 = [(LookAroundContainerViewController *)self view];
      [v12 bounds];
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      double v18 = v17;
      double v20 = v19;

      double v21 = v18 / v20;
      double height = 1.0;
      if (v18 / v20 <= 1.0)
      {
        double width = 1.0;
        if (v21 > 0.0) {
          double height = 1.0 / v21;
        }
      }
      else
      {
        double width = v18 / v20;
      }
      v36.origin.double x = v14;
      v36.origin.double y = v16;
      v36.size.double width = v18;
      v36.size.double height = v20;
      CGFloat MidX = CGRectGetMidX(v36);
      double v23 = v20;
      double y = 0.0;
      double x = 0.0;
      if (MidX - width * 0.5 > 0.0)
      {
        CGFloat v24 = v14;
        CGFloat v25 = v16;
        double v26 = v18;
        CGFloat v27 = CGRectGetMidX(*(CGRect *)(&v23 - 3));
        double v23 = v20;
        double x = v27 - width * 0.5;
      }
      CGFloat v28 = v14;
      CGFloat v29 = v16;
      double v30 = v18;
      if (CGRectGetMidY(*(CGRect *)(&v23 - 3)) - height * 0.5 > 0.0)
      {
        v37.origin.double x = v14;
        v37.origin.double y = v16;
        v37.size.double width = v18;
        v37.size.double height = v20;
        double y = CGRectGetMidY(v37) - height * 0.5;
      }
      p_originFrame->origin.double x = x;
      p_originFrame->origin.double y = y;
      p_originFrame->size.double width = width;
      p_originFrame->size.double height = height;
    }
  }
  double v31 = x;
  double v32 = y;
  double v33 = width;
  double v34 = height;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (void)_shareCurrentLocation:(id)a3
{
  id v10 = a3;
  [(LookAroundContainerViewController *)self _captureActivityCardAnalyticsForUserAction:6013 onTarget:1701];
  uint64_t v4 = [(LookAroundContainerViewController *)self createActivityViewControllerForCurrentContext];
  if (v4)
  {
    double v5 = +[MKSystemController sharedInstance];
    unsigned int v6 = [v5 userInterfaceIdiom];

    if (v6)
    {
      double v7 = [(LookAroundContainerViewController *)self _popoverController];
      if (v7)
      {

        uint64_t v8 = 3;
      }
      else if ([(LookAroundContainerViewController *)self _isInPopoverPresentation])
      {
        uint64_t v8 = 3;
      }
      else
      {
        uint64_t v8 = 7;
      }
      [v4 setModalPresentationStyle:v8];
    }
    double v9 = [v4 popoverPresentationController];
    [v9 setPermittedArrowDirections:15];
    [v9 setSourceView:v10];
    [v10 bounds];
    [v9 setSourceRect:];
    [(LookAroundContainerViewController *)self _maps_topMostPresentViewController:v4 animated:1 completion:0];
  }
}

- (BOOL)_shouldTakePIPViewHeightIntoAccount
{
  unint64_t v3 = [(ContainerViewController *)self containerStyle];
  unsigned int v4 = (v3 > 7) | (0x1Cu >> v3);
  unint64_t v5 = [(ContainerViewController *)self containerStyle];
  unint64_t v6 = [(ContainerViewController *)self containerStyle];
  char v7 = v6;
  BOOL v8 = v6 < 8;
  unsigned __int8 v9 = [(LookAroundContainerViewController *)self _shouldTakeSidebarIntoAccount];
  unsigned __int8 v10 = v9;
  unsigned int v11 = v8 & (0xA3u >> v7);
  if (v5 == 1) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v9;
  }
  BOOL result = (v4 | v11) & v12;
  if ((v4 & 1) != 0 && (v10 & 1) == 0)
  {
    CGFloat v14 = [(LookAroundContainerViewController *)self view];
    [v14 bounds];
    double v16 = v15;
    double v18 = v17;

    if (sub_1000BBB44(self) == 5)
    {
      double v19 = sub_1000BBAF8();
      double v20 = -2.0;
    }
    double v21 = [(LookAroundPIPViewController *)self->_pipViewController view];
    [v21 bounds];
    UIRectInset();
    double v23 = v22;
    double v25 = v24;

    BOOL result = v12;
    if (v18 * (v16 - v23) * 1.20000005 > v16 * (v18 - v25)) {
      return 0;
    }
  }
  return result;
}

- (BOOL)_shouldTakeSidebarIntoAccount
{
  unint64_t v3 = [(ContainerViewController *)self containerStyle];
  unsigned int v4 = (v3 < 8) & (0xE3u >> v3);
  unint64_t v5 = [(ContainerViewController *)self containerStyle];
  unsigned int v6 = ((v5 > 7) | (0x5Cu >> v5)) & ![(ContainerViewController *)self chromeHidden];
  if ((v4 & 1) == 0 && v6)
  {
    char v7 = [(ContainerViewController *)self currentViewController];
    objc_opt_class();
    v6 &= objc_opt_isKindOfClass();
  }
  return v6;
}

- (void)_insertPuckViewIntoMapView:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(LookAroundContainerViewController *)self puckViewController];
  unsigned int v6 = [(ContainerViewController *)self chromeViewController];
  [v6 addChildViewController:v5];

  char v7 = [v5 view];
  [v4 _insertSubviewBelowAnnotationContainerView:v7];

  BOOL v8 = [(ContainerViewController *)self chromeViewController];
  [v5 didMoveToParentViewController:v8];

  unsigned __int8 v9 = [v5 view];
  double v18 = [v9 centerXAnchor];
  unsigned __int8 v10 = [(OverlayContainerViewController *)self overlayView];
  unsigned int v11 = [v10 centerXAnchor];
  BOOL v12 = [v18 constraintEqualToAnchor:v11];
  v19[0] = v12;
  double v13 = [v9 centerYAnchor];
  CGFloat v14 = [(OverlayContainerViewController *)self overlayView];
  double v15 = [v14 centerYAnchor];
  double v16 = [v13 constraintEqualToAnchor:v15];
  v19[1] = v16;
  double v17 = +[NSArray arrayWithObjects:v19 count:2];
  +[NSLayoutConstraint activateConstraints:v17];
}

- (void)_removePuckViewFromMapView
{
  id v3 = [(LookAroundContainerViewController *)self puckViewController];
  [v3 willMoveToParentViewController:0];
  v2 = [v3 view];
  [v2 removeFromSuperview];

  [v3 removeFromParentViewController];
}

- (void)_setModeDidBecomeCurrent
{
  self->_modeIsCurrent = 1;
  if (self->_containerIsVisible)
  {
    id v4 = [(ContainerViewController *)self chromeViewController];
    id v3 = [v4 mapView];
    [(LookAroundContainerViewController *)self _insertPuckViewIntoMapView:v3];
  }
}

- (void)_setModeDidResignCurrent
{
  self->_modeIsCurrent = 0;
  if (!self->_containerIsVisible) {
    [(LookAroundContainerViewController *)self _removePuckViewFromMapView];
  }
}

- (id)_createPlaceCardItemFromMapItem:(id)a3 isMarkedLocation:(BOOL)a4
{
  if (a4)
  {
    id v4 = a3;
    unint64_t v5 = [[SearchResult alloc] initWithMapItem:v4 searchResultType:3 resultIndex:0];

    unsigned int v6 = [[PlaceCardItem alloc] initWithSearchResult:v5];
  }
  else
  {
    unint64_t v5 = (SearchResult *)a3;
    unsigned int v6 = [[PlaceCardItem alloc] initWithMapItem:v5];
  }
  char v7 = v6;

  return v7;
}

- (void)_updateTTRButtonState
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 BOOLForKey:@"__internal__HideTapToRadarInMunin"];

  ttrButtonView = self->_ttrButtonView;

  [(LookAroundTTRButtonView *)ttrButtonView setHidden:v4];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1015EC638 == a6) {
    [(LookAroundContainerViewController *)self _updateTTRButtonState];
  }
}

- (void)_captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v23 = a5;
  BOOL v8 = [(LookAroundContainerViewController *)self dataCoordinator];
  unsigned __int8 v9 = [v8 mapView];

  unsigned __int8 v10 = [(LookAroundContainerViewController *)self lookAroundView];
  [v9 centerCoordinate];
  id v13 = [objc_alloc((Class)GEOLocation) initWithLatitude:v11 longitude:v12];
  CGFloat v14 = [v9 camera];
  [v14 heading];
  double v16 = v15;
  [v9 _zoomLevel];
  double v18 = v17;
  double v19 = [v10 visiblePlaceMUIDs];
  id v20 = [v19 count];
  if ([v10 showsRoadLabels]) {
    unsigned __int8 v21 = 1;
  }
  else {
    unsigned __int8 v21 = [v10 showsPointLabels];
  }
  LOBYTE(v22) = v21;
  +[GEOAPPortal captureLookAroundUserAction:v6 onTarget:v5 eventValue:v23 location:v13 heading:v16 zoom:v20 numberPoisInView:v18 labelingShown:v22];
}

- (int)_targetForAnalytics
{
  id v3 = [(ContainerViewController *)self currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  unsigned int v5 = [(LookAroundContainerViewController *)self isDisplayingLookAroundFullScreen];
  if (isKindOfClass) {
    int v6 = 1706;
  }
  else {
    int v6 = 1702;
  }
  if (isKindOfClass) {
    int v7 = 1707;
  }
  else {
    int v7 = 1700;
  }
  if (v5) {
    return v6;
  }
  else {
    return v7;
  }
}

- (ShareItemSource)currentShareItemSource
{
  id v3 = [(MKLookAroundView *)self->_lookAroundView muninViewState];
  id v4 = [v3 cameraFrame];
  unsigned int v5 = [(LookAroundContainerViewController *)self lookAroundView];
  uint64_t v6 = [v5 mapItem];
  if (v6)
  {
    id v7 = (id)v6;

LABEL_4:
    unsigned __int8 v9 = [LookAroundShareItemSource alloc];
    unsigned __int8 v10 = [(MKLookAroundView *)self->_lookAroundView muninViewState];
    double v11 = [(LookAroundShareItemSource *)v9 initWithMapItem:v7 muninViewState:v10];

    [(LookAroundShareItemSource *)v11 setActivityProviderDelegate:self];
    goto LABEL_5;
  }
  BOOL v8 = [(LookAroundContainerViewController *)self lookAroundView];
  id v7 = [v8 revGeoMapItem];

  if (v7) {
    goto LABEL_4;
  }
  [v4 latitude];
  CLLocationDegrees v14 = v13;
  [v4 longitude];
  CLLocationCoordinate2D v20 = CLLocationCoordinate2DMake(v14, v15);
  double latitude = v20.latitude;
  double longitude = v20.longitude;
  if (CLLocationCoordinate2DIsValid(v20))
  {
    id v18 = [objc_alloc((Class)MKPlacemark) initWithCoordinate:&__NSDictionary0__struct addressDictionary:latitude longitude];
    id v7 = [objc_alloc((Class)MKMapItem) initWithPlacemark:v18];

    if (v7) {
      goto LABEL_4;
    }
  }
  else
  {
    id v7 = 0;
  }
  double v11 = 0;
LABEL_5:

  return (ShareItemSource *)v11;
}

- (id)createActivityViewControllerForCurrentContext
{
  id v3 = [(LookAroundContainerViewController *)self currentShareItemSource];
  if (v3)
  {
    id v4 = [objc_alloc((Class)MUActivityViewController) initWithShareItem:v3];
    [v4 setActivityControllerDelegate:self];
    if ([(LookAroundContainerViewController *)self isDisplayingLookAroundFullScreen]) {
      [v4 setOverrideUserInterfaceStyle:2];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (LookAroundContainerViewControllerAnimationDelegate)animationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);

  return (LookAroundContainerViewControllerAnimationDelegate *)WeakRetained;
}

- (void)setAnimationDelegate:(id)a3
{
}

- (LookAroundActionCoordinator)actionCoordinator
{
  return self->_actionCoordinator;
}

- (MKLookAroundView)lookAroundView
{
  return self->_lookAroundView;
}

- (CGRect)lookAroundButtonFrame
{
  double x = self->_lookAroundButtonFrame.origin.x;
  double y = self->_lookAroundButtonFrame.origin.y;
  double width = self->_lookAroundButtonFrame.size.width;
  double height = self->_lookAroundButtonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLookAroundButtonFrame:(CGRect)a3
{
  self->_lookAroundButtonFrame = a3;
}

- (CGRect)originFrame
{
  double x = self->_originFrame.origin.x;
  double y = self->_originFrame.origin.y;
  double width = self->_originFrame.size.width;
  double height = self->_originFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOriginFrame:(CGRect)a3
{
  self->_originFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookAroundView, 0);
  objc_storeStrong((id *)&self->_actionCoordinator, 0);
  objc_destroyWeak((id *)&self->_animationDelegate);
  objc_storeStrong(&self->_chromeDeactivationToken, 0);
  objc_storeStrong((id *)&self->_pipViewTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_ttrButtonView, 0);
  objc_storeStrong((id *)&self->_trayContaineeViewController, 0);
  objc_storeStrong((id *)&self->_puckViewController, 0);
  objc_storeStrong((id *)&self->_pipViewController, 0);
  objc_storeStrong((id *)&self->_lookAroundViewOriginalSuperview, 0);

  objc_storeStrong((id *)&self->_entryPoint, 0);
}

@end