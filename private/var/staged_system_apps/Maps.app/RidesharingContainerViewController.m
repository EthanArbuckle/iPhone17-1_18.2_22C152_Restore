@interface RidesharingContainerViewController
- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4;
- (ButtonsContainerViewController)recenterButtonContainer;
- (CGPoint)mapView:(id)a3 focusPointForPoint:(CGPoint)a4 gesture:(int64_t)a5;
- (RideBookingRequestRideOptionProxy)requestRideOptionProxy;
- (RideBookingRequestRideStatus)requestRideStatus;
- (RidesharingConfirmedRideViewController)confirmedRideViewController;
- (RidesharingDetailsPickingViewController)detailsPickingViewController;
- (id)_topBannerViewHorizontalConstraints;
- (unint64_t)originalLayoutForViewController:(id)a3;
- (void)_moveMapToNewStartWaypointIfNeededAnimated:(BOOL)a3;
- (void)_moveToCenterCoordinate:(CLLocationCoordinate2D)a3;
- (void)_recenterTapped:(id)a3;
- (void)_setupRecenterButton;
- (void)_updateETACalloutFromDetailsPickingProviderAndMapMoving;
- (void)_updateForShowingDetailsPickingAnimated:(BOOL)a3;
- (void)contentHeightUpdatedWithValue:(double)a3;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5;
- (void)requestRideStatusDidChange:(id)a3;
- (void)setConfirmedRideViewController:(id)a3;
- (void)setDetailsPickingViewController:(id)a3;
- (void)setNeedsUpdateForShowingDetailsPickingAnimated;
- (void)setRecenterButtonContainer:(id)a3;
- (void)setRequestRideOptionProxy:(id)a3;
- (void)setRequestRideStatus:(id)a3;
- (void)setRequestingRide:(BOOL)a3;
- (void)updateForDismissingDetailsPickingAnimated:(BOOL)a3;
- (void)updateTopBannerViewWithTopBannerItems:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation RidesharingContainerViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)RidesharingContainerViewController;
  [(OverlayContainerViewController *)&v3 viewDidLoad];
  [(RidesharingContainerViewController *)self _setupRecenterButton];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RidesharingContainerViewController;
  -[OverlayContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = [(ContainerViewController *)self currentViewController];
  v9 = [(RidesharingContainerViewController *)self detailsPickingViewController];
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10072DC48;
    v11[3] = &unk_1012E81F8;
    v11[4] = self;
    [v7 animateAlongsideTransition:v11 completion:0];
  }
}

- (void)viewDidLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)RidesharingContainerViewController;
  [(OverlayContainerViewController *)&v17 viewDidLayoutSubviews];
  objc_super v3 = [(ContainerViewController *)self chromeViewController];
  v4 = [v3 mapView];

  [v4 _edgeInsets];
  double v6 = v5;
  id v7 = [(ButtonsContainerViewController *)self->_recenterButtonContainer view];
  [v7 frame];
  double v9 = v6 + v8;
  [(ContainerViewController *)self edgePadding];
  double v11 = v10 + v9;
  [(ContainerViewController *)self edgePadding];
  double v13 = v12 + v11;
  [(ContainerViewController *)self edgePadding];
  [v4 _setCompassInsets:v13, 0.0, 0.0, v14];

  if (self->_needsUpdateForShowingDetailsPicking)
  {
    if ([(ContainerViewController *)self containerStyle])
    {
      self->_needsUpdateForShowingDetailsPicking = 0;
      v15 = [(ContainerViewController *)self currentViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        [(RidesharingContainerViewController *)self _updateForShowingDetailsPickingAnimated:1];
      }
    }
  }
}

- (unint64_t)originalLayoutForViewController:(id)a3
{
  return 2;
}

- (void)contentHeightUpdatedWithValue:(double)a3
{
  unint64_t v5 = [(ContainerViewController *)self containerStyle];
  v20.receiver = self;
  v20.super_class = (Class)RidesharingContainerViewController;
  [(OverlayContainerViewController *)&v20 contentHeightUpdatedWithValue:a3];
  if ((v5 | 4) != 5) {
    goto LABEL_13;
  }
  if (v5 == 5) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  id v7 = [(ContainerViewController *)self currentViewController];
  [v7 heightForLayout:v6];
  double v9 = v8;

  double v10 = [(ContainerViewController *)self currentViewController];
  [v10 heightForLayout:3];
  double v12 = v11;

  if (v12 != v9)
  {
    if (v9 < a3)
    {
      double v13 = (a3 - v9) / (v9 * 1.10000002 - v9);
      if (v13 < 0.0) {
        double v13 = 0.0;
      }
      if (v13 <= 1.0) {
        double v14 = 1.0 - v13;
      }
      else {
        double v14 = 0.0;
      }
      v15 = [(ButtonsContainerViewController *)self->_recenterButtonContainer view];
      [v15 setAlpha:v14];

      v16 = [(OverlayContainerViewController *)self topBannerView];
      objc_super v17 = v16;
      double v18 = v14;
      goto LABEL_14;
    }
LABEL_13:
    v19 = [(ButtonsContainerViewController *)self->_recenterButtonContainer view];
    [v19 setAlpha:1.0];

    v16 = [(OverlayContainerViewController *)self topBannerView];
    objc_super v17 = v16;
    double v18 = 1.0;
LABEL_14:
    [v16 setAlpha:v18];
  }
}

- (void)updateTopBannerViewWithTopBannerItems:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RidesharingContainerViewController;
  [(OverlayContainerViewController *)&v5 updateTopBannerViewWithTopBannerItems:a3];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10072DFF0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setNeedsUpdateForShowingDetailsPickingAnimated
{
  self->_needsUpdateForShowingDetailsPicking = 1;
  id v2 = [(RidesharingContainerViewController *)self view];
  [v2 setNeedsLayout];
}

- (void)_updateForShowingDetailsPickingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_ETACalloutView)
  {
    objc_super v5 = (MKMarkerAnnotationView *)[objc_alloc((Class)MKMarkerAnnotationView) initWithAnnotation:0 reuseIdentifier:0];
    ETACalloutView = self->_ETACalloutView;
    self->_ETACalloutView = v5;

    id v7 = objc_opt_new();
    [(MKMarkerAnnotationView *)self->_ETACalloutView setGlyphImage:v7];

    double v8 = +[RidesharingBalloonETAView balloonStrokeColor];
    [(MKMarkerAnnotationView *)self->_ETACalloutView setMarkerStrokeTintColor:v8];

    double v9 = +[RidesharingBalloonETAView balloonFillColor];
    [(MKMarkerAnnotationView *)self->_ETACalloutView setMarkerTintColor:v9];

    double v10 = objc_alloc_init(RidesharingBalloonETAView);
    ETAView = self->_ETAView;
    self->_ETAView = v10;

    [(MKMarkerAnnotationView *)self->_ETACalloutView setSelectedContentView:self->_ETAView];
  }
  if (!self->_requestRideOptionProxy)
  {
    double v12 = [[RideBookingRequestRideOptionProxy alloc] initWithDelegate:self];
    requestRideOptionProxy = self->_requestRideOptionProxy;
    self->_requestRideOptionProxy = v12;
  }
  double v14 = self->_ETACalloutView;

  [(MKMarkerAnnotationView *)v14 setSelected:1 animated:v3];
}

- (void)updateForDismissingDetailsPickingAnimated:(BOOL)a3
{
  [(MKMarkerAnnotationView *)self->_ETACalloutView setSelected:0 animated:a3];
  [(MKMarkerAnnotationView *)self->_ETACalloutView removeFromSuperview];
  requestRideOptionProxy = self->_requestRideOptionProxy;
  self->_requestRideOptionProxy = 0;
}

- (void)setRequestingRide:(BOOL)a3
{
  self->_requestingRide = a3;
}

- (void)requestRideStatusDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5 && ![v5 requestRideStatusError] && !self->_isUserInitiatedMapChange)
  {
    objc_storeStrong((id *)&self->_requestRideStatus, a3);
    [(RideBookingRequestRideStatus *)self->_requestRideStatus startWaypointCoordinate];
    objc_initWeak(&location, self);
    if (self->_loadedFirstRequestRide)
    {
      [(RidesharingContainerViewController *)self _updateETACalloutFromDetailsPickingProviderAndMapMoving];
    }
    else
    {
      GEOConfigGetDouble();
      MKMapRectMakeWithRadialDistance();
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      v15 = [(ContainerViewController *)self chromeViewController];
      v16 = [v15 mapView];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10072E42C;
      v17[3] = &unk_1012E5D30;
      objc_copyWeak(&v18, &location);
      v17[4] = self;
      [v16 _setVisibleMapRect:1 animated:v17 completionHandler:v8, v10, v12, v14];

      objc_destroyWeak(&v18);
    }
    objc_destroyWeak(&location);
  }
}

- (void)_updateETACalloutFromDetailsPickingProviderAndMapMoving
{
  BOOL v3 = [(ContainerViewController *)self currentViewController];
  [v3 heightForLayout:2];
  double v5 = v4;

  uint64_t v6 = [(ContainerViewController *)self currentViewController];
  [v6 heightForLayout:3];
  double v8 = v7;

  double v9 = [(ContainerViewController *)self chromeViewController];
  double v10 = [v9 mapView];
  [v10 _edgeInsets];
  double v12 = v11;

  unint64_t v13 = [(ContainerViewController *)self containerStyle];
  if (v13 <= 7 && ((1 << v13) & 0xA3) != 0) {
    double v12 = v12 - v5;
  }
  ETACalloutView = self->_ETACalloutView;
  if (ETACalloutView)
  {
    v15 = [(MKMarkerAnnotationView *)ETACalloutView superview];
    if (v15)
    {
    }
    else
    {
      v16 = [(ContainerViewController *)self chromeViewController];
      objc_super v17 = [v16 mapView];

      if (v17)
      {
        id v18 = [(RidesharingContainerViewController *)self view];
        v19 = self->_ETACalloutView;
        objc_super v20 = [(OverlayContainerViewController *)self overlayView];
        [v18 insertSubview:v19 belowSubview:v20];

        [(MKMarkerAnnotationView *)self->_ETACalloutView setTranslatesAutoresizingMaskIntoConstraints:0];
        v21 = [(MKMarkerAnnotationView *)self->_ETACalloutView centerXAnchor];
        v22 = [(ContainerViewController *)self chromeViewController];
        v23 = [v22 mapView];
        v24 = [v23 _edgeInsetsLayoutGuide];
        v25 = [v24 centerXAnchor];
        v26 = [v21 constraintEqualToAnchor:v25];

        v27 = [(MKMarkerAnnotationView *)self->_ETACalloutView selectedContentView];
        v28 = [v27 bottomAnchor];
        v29 = [(RidesharingContainerViewController *)self view];
        v30 = [v29 bottomAnchor];
        v31 = [v28 constraintEqualToAnchor:v30 constant:(v12 - v8) * 0.5];
        ETACalloutVerticalConstraint = self->_ETACalloutVerticalConstraint;
        self->_ETACalloutVerticalConstraint = v31;

        v33 = self->_ETACalloutVerticalConstraint;
        v48[0] = v26;
        v48[1] = v33;
        v34 = +[NSArray arrayWithObjects:v48 count:2];
        +[NSLayoutConstraint activateConstraints:v34];
      }
    }
  }
  [(NSLayoutConstraint *)self->_ETACalloutVerticalConstraint setConstant:(v12 - v8) * 0.5];
  v35 = [(RidesharingContainerViewController *)self requestRideStatus];
  v36 = [v35 etaMinutesAtStartWaypoint];
  unsigned int v37 = [v35 loadingRequest];
  v38 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v39 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingContainerViewController.m");
    id v40 = [objc_alloc((Class)NSString) initWithFormat:@"Updating ETA callout with minutes: %@, loading?:%d", v36, v37];
    *(_DWORD *)buf = 136315394;
    v45 = v39;
    __int16 v46 = 2112;
    id v47 = v40;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  if (v37)
  {
    ETAView = self->_ETAView;
    v42 = 0;
    uint64_t v43 = 2;
LABEL_17:
    [(RidesharingBalloonETAView *)ETAView setMinutes:v42 withState:v43];
    goto LABEL_18;
  }
  if (self->_isUserInitiatedMapChange)
  {
    ETAView = self->_ETAView;
    v42 = 0;
    uint64_t v43 = 1;
    goto LABEL_17;
  }
  if (v36)
  {
    ETAView = self->_ETAView;
    v42 = v36;
    uint64_t v43 = 0;
    goto LABEL_17;
  }
LABEL_18:
}

- (void)_moveMapToNewStartWaypointIfNeededAnimated:(BOOL)a3
{
  if (!self->_isUserInitiatedMapChange)
  {
    BOOL v3 = a3;
    id v7 = [(RidesharingContainerViewController *)self requestRideStatus];
    double v5 = [(ContainerViewController *)self chromeViewController];
    uint64_t v6 = [v5 mapView];
    [v7 startWaypointCoordinate];
    [v6 setCenterCoordinate:v3 animated:YES];
  }
}

- (void)_moveToCenterCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  uint64_t v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingContainerViewController.m");
    id v8 = [objc_alloc((Class)NSString) initWithFormat:@"Centering map to coordinate (%f, %f)", *(void *)&latitude, *(void *)&longitude];
    *(_DWORD *)buf = 136315394;
    double v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  double v9 = [(ContainerViewController *)self chromeViewController];
  double v10 = [v9 mapView];
  [v10 setCenterCoordinate:CGPointMake(latitude, longitude) animated:YES];
}

- (ButtonsContainerViewController)recenterButtonContainer
{
  recenterButtonContainer = self->_recenterButtonContainer;
  if (!recenterButtonContainer)
  {
    double v4 = +[MapsThemeButton buttonWithType:0];
    double v5 = +[NSBundle mainBundle];
    uint64_t v6 = [v5 localizedStringForKey:@"Recenter" value:@"localized string not found" table:0];
    [v4 setAccessibilityLabel:v6];

    [v4 addTarget:self action:"_recenterTapped:" forControlEvents:64];
    id v7 = +[MapsTheme locationImage];
    [v4 setImage:v7 forState:0];

    id v8 = [[FloatingButtonItem alloc] initWithButton:v4 option:1];
    double v9 = [ButtonsContainerViewController alloc];
    v15 = v8;
    double v10 = +[NSArray arrayWithObjects:&v15 count:1];
    double v11 = [(ButtonsContainerViewController *)v9 initWithFloatingButtonItems:v10];
    double v12 = self->_recenterButtonContainer;
    self->_recenterButtonContainer = v11;

    __int16 v13 = [(ContainerViewController *)self blurGroupName];
    [(ButtonsContainerViewController *)self->_recenterButtonContainer setBlurGroupName:v13];

    recenterButtonContainer = self->_recenterButtonContainer;
  }

  return recenterButtonContainer;
}

- (void)_recenterTapped:(id)a3
{
  double v4 = [(ContainerViewController *)self chromeViewController];
  id v14 = [v4 mapView];

  double v5 = [v14 userLocation];
  [v5 coordinate];
  double v7 = v6;
  double v9 = v8;

  v16.double latitude = v7;
  v16.double longitude = v9;
  if (CLLocationCoordinate2DIsValid(v16))
  {
    double v10 = [(ContainerViewController *)self currentViewController];
    double v11 = [(RidesharingContainerViewController *)self detailsPickingViewController];
    unsigned int v12 = [v10 isEqual:v11];

    if (v12)
    {
      __int16 v13 = [(RidesharingContainerViewController *)self requestRideOptionProxy];
      [v13 updateStartingWaypointCoordinate:v7, v9];
    }
    -[RidesharingContainerViewController _moveToCenterCoordinate:](self, "_moveToCenterCoordinate:", v7, v9);
  }
}

- (void)_setupRecenterButton
{
  BOOL v3 = [(RidesharingContainerViewController *)self recenterButtonContainer];
  double v4 = [v3 view];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v5 = [(RidesharingContainerViewController *)self recenterButtonContainer];
  [(ContainerViewController *)self addChildViewController:v5];

  double v6 = [(OverlayContainerViewController *)self overlayView];
  double v7 = [(RidesharingContainerViewController *)self recenterButtonContainer];
  double v8 = [v7 view];
  [v6 addSubview:v8];

  v24 = [(RidesharingContainerViewController *)self recenterButtonContainer];
  v23 = [v24 view];
  v21 = [v23 trailingAnchor];
  v22 = [(OverlayContainerViewController *)self innerLayoutGuide];
  double v9 = [v22 trailingAnchor];
  double v10 = [v21 constraintEqualToAnchor:v9];
  v25[0] = v10;
  double v11 = [(RidesharingContainerViewController *)self recenterButtonContainer];
  unsigned int v12 = [v11 view];
  __int16 v13 = [v12 topAnchor];
  id v14 = [(OverlayContainerViewController *)self innerLayoutGuide];
  v15 = [v14 topAnchor];
  CLLocationCoordinate2D v16 = [v13 constraintEqualToAnchor:v15];
  v25[1] = v16;
  objc_super v17 = +[NSArray arrayWithObjects:v25 count:2];
  +[NSLayoutConstraint activateConstraints:v17];

  id v18 = [(RidesharingContainerViewController *)self recenterButtonContainer];
  [v18 didMoveToParentViewController:self];

  v19 = [(RidesharingContainerViewController *)self recenterButtonContainer];
  objc_super v20 = [v19 view];
  [v20 layoutIfNeeded];
}

- (id)_topBannerViewHorizontalConstraints
{
  v15 = [(OverlayContainerViewController *)self topBannerView];
  id v14 = [v15 leadingAnchor];
  BOOL v3 = [(OverlayContainerViewController *)self overlayView];
  double v4 = [v3 leadingAnchor];
  double v5 = [v14 constraintEqualToAnchor:v4 constant:sub_1000BBAF8()];
  v16[0] = v5;
  double v6 = [(OverlayContainerViewController *)self topBannerView];
  double v7 = [v6 trailingAnchor];
  double v8 = [(RidesharingContainerViewController *)self recenterButtonContainer];
  double v9 = [v8 view];
  double v10 = [v9 leadingAnchor];
  double v11 = [v7 constraintEqualToAnchor:v10 constant:-sub_1000BBAF8()];
  v16[1] = v11;
  unsigned int v12 = +[NSArray arrayWithObjects:v16 count:2];

  return v12;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v17 = a3;
  [v17 setScrollEnabled:1];
  double v5 = [(ContainerViewController *)self currentViewController];
  double v6 = [(RidesharingContainerViewController *)self detailsPickingViewController];
  if ([v5 isEqual:v6])
  {
    BOOL isUserInitiatedMapChange = self->_isUserInitiatedMapChange;

    if (!isUserInitiatedMapChange) {
      goto LABEL_6;
    }
    [(MKMarkerAnnotationView *)self->_ETACalloutView center];
    double v9 = v8;
    double v11 = v10;
    unsigned int v12 = [(MKMarkerAnnotationView *)self->_ETACalloutView superview];
    [v17 convertPoint:v12 toCoordinateFromView:v9];
    double v14 = v13;
    double v16 = v15;

    double v5 = [(RidesharingContainerViewController *)self requestRideOptionProxy];
    [v5 updateStartingWaypointCoordinate:v14, v16];
  }
  else
  {
  }
LABEL_6:
  if (self->_loadedFirstRequestRide) {
    [(RidesharingContainerViewController *)self _updateETACalloutFromDetailsPickingProviderAndMapMoving];
  }
  self->_BOOL isUserInitiatedMapChange = 0;
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v11 = v7;
  if (self->_requestingRide || a4 == 1)
  {
    [v7 setScrollEnabled:0];
  }
  else
  {
    self->_BOOL isUserInitiatedMapChange = 1;
    double v8 = [(ContainerViewController *)self currentViewController];
    double v9 = [(RidesharingContainerViewController *)self detailsPickingViewController];
    unsigned int v10 = [v8 isEqual:v9];

    if (v10) {
      [(RidesharingContainerViewController *)self _updateETACalloutFromDetailsPickingProviderAndMapMoving];
    }
  }
}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  return 0;
}

- (CGPoint)mapView:(id)a3 focusPointForPoint:(CGPoint)a4 gesture:(int64_t)a5
{
  if (a5 == 1)
  {
    id v5 = a3;
    [v5 centerCoordinate];
    [v5 convertCoordinate:v5 toPointToView:v5];
    CGFloat x = v6;
    CGFloat y = v8;
  }
  else
  {
    CGFloat y = a4.y;
    CGFloat x = a4.x;
  }
  double v10 = x;
  double v11 = y;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (RidesharingDetailsPickingViewController)detailsPickingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailsPickingViewController);

  return (RidesharingDetailsPickingViewController *)WeakRetained;
}

- (void)setDetailsPickingViewController:(id)a3
{
}

- (RidesharingConfirmedRideViewController)confirmedRideViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_confirmedRideViewController);

  return (RidesharingConfirmedRideViewController *)WeakRetained;
}

- (void)setConfirmedRideViewController:(id)a3
{
}

- (void)setRecenterButtonContainer:(id)a3
{
}

- (RideBookingRequestRideOptionProxy)requestRideOptionProxy
{
  return self->_requestRideOptionProxy;
}

- (void)setRequestRideOptionProxy:(id)a3
{
}

- (RideBookingRequestRideStatus)requestRideStatus
{
  return self->_requestRideStatus;
}

- (void)setRequestRideStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestRideStatus, 0);
  objc_storeStrong((id *)&self->_requestRideOptionProxy, 0);
  objc_storeStrong((id *)&self->_recenterButtonContainer, 0);
  objc_destroyWeak((id *)&self->_confirmedRideViewController);
  objc_destroyWeak((id *)&self->_detailsPickingViewController);
  objc_storeStrong((id *)&self->_ETACalloutVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_ETAView, 0);

  objc_storeStrong((id *)&self->_ETACalloutView, 0);
}

@end