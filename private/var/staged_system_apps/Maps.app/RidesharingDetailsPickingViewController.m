@interface RidesharingDetailsPickingViewController
- (BOOL)_isPresented;
- (BannerContainerProtocol)bannerContainer;
- (NSArray)topBannerItems;
- (RideBookingRequestRideOptionProxy)requestRideOptionProxy;
- (RideBookingRequestRideStatus)requestRideStatus;
- (RidesharingCoordinator)coordinator;
- (RidesharingDetailsPickingViewController)init;
- (double)headerAndRouteFromToViewHeight;
- (double)heightForLayout:(unint64_t)a3;
- (id)currentRefinementsForFieldsView:(id)a3;
- (id)stackedViews;
- (id)waypointsForFieldsView:(id)a3;
- (int64_t)transportTypeForFieldsView:(id)a3;
- (void)_openApp;
- (void)_request;
- (void)_requestRide;
- (void)_selectPaymentType;
- (void)_showExpirationAlert;
- (void)_updateFromRequestRideStatus:(id)a3;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)requestRideStatusDidChange:(id)a3;
- (void)setBannerContainer:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setRequestRideOptionProxy:(id)a3;
- (void)setRequestRideStatus:(id)a3;
- (void)setRequestingRide:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RidesharingDetailsPickingViewController

- (RidesharingDetailsPickingViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)RidesharingDetailsPickingViewController;
  v2 = [(RidesharingDetailsPickingViewController *)&v6 initWithNibName:0 bundle:0];
  if (v2)
  {
    v3 = [[RideBookingRequestRideOptionProxy alloc] initWithDelegate:v2];
    requestRideOptionProxy = v2->_requestRideOptionProxy;
    v2->_requestRideOptionProxy = v3;
  }
  return v2;
}

- (void)viewDidLoad
{
  v39.receiver = self;
  v39.super_class = (Class)RidesharingDetailsPickingViewController;
  [(ExtensionsStackViewController *)&v39 viewDidLoad];
  v3 = objc_alloc_init(ContainerHeaderView);
  containerHeaderView = self->_containerHeaderView;
  self->_containerHeaderView = v3;

  [(ContainerHeaderView *)self->_containerHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ContainerHeaderView *)self->_containerHeaderView setDelegate:self];
  [(ContainerHeaderView *)self->_containerHeaderView setHairLineAlpha:0.0];
  v5 = [(ExtensionsStackViewController *)self headerView];
  [v5 addSubview:self->_containerHeaderView];

  objc_super v6 = self->_containerHeaderView;
  v7 = [(ExtensionsStackViewController *)self headerView];
  v8 = [(ContainerHeaderView *)v6 _maps_constraintsForCenteringInView:v7];
  +[NSLayoutConstraint activateConstraints:v8];

  v9 = [[RouteOverviewFieldsView alloc] initWithDelegate:self waypointInfoProvider:0 editingMode:0];
  routeFromToView = self->_routeFromToView;
  self->_routeFromToView = v9;

  [(RouteOverviewFieldsView *)self->_routeFromToView setHasRefinementsBar:0];
  [(RouteOverviewFieldsView *)self->_routeFromToView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v11 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"[Route Planning] Ride Share Title" value:@"localized string not found" table:0];
  [v11 setText:v13];

  +[DynamicTypeWizard autorefreshLabel:v11 withFontProvider:&stru_1013212A0];
  [(ContainerHeaderView *)self->_containerHeaderView setTitleView:v11];
  -[ContainerHeaderView setTitleViewInsets:](self->_containerHeaderView, "setTitleViewInsets:", 16.0, 16.0, 12.0, 16.0);
  [(ContainerHeaderView *)self->_containerHeaderView setAccessoryView:0];
  -[ContainerHeaderView setAccessoryViewInsets:](self->_containerHeaderView, "setAccessoryViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v14 = objc_alloc_init(ExtensionsPrimaryDetailsView);
  primaryDetailsView = self->_primaryDetailsView;
  self->_primaryDetailsView = v14;

  [(ExtensionsPrimaryDetailsView *)self->_primaryDetailsView setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = +[ProminentActionButton button];
  requestButton = self->_requestButton;
  self->_requestButton = v16;

  [(ProminentActionButton *)self->_requestButton addTarget:self action:"_request" forControlEvents:0x2000];
  v18 = [(RidesharingDetailsPickingViewController *)self theme];
  v19 = [v18 keyColor];
  [(ProminentActionButton *)self->_requestButton setTintColor:v19];

  v20 = [(ProminentActionButton *)self->_requestButton titleLabel];
  [v20 setLineBreakMode:0];

  v21 = [(ProminentActionButton *)self->_requestButton titleLabel];
  [v21 setNumberOfLines:0];

  v22 = [(ProminentActionButton *)self->_requestButton titleLabel];
  [v22 setTextAlignment:1];

  v23 = self->_primaryDetailsView;
  v40 = self->_requestButton;
  v24 = +[NSArray arrayWithObjects:&v40 count:1];
  [(ExtensionsPrimaryDetailsView *)v23 configureWithActionButtons:v24];

  v25 = objc_alloc_init(ExtensionsSecondaryDetailsView);
  secondaryDetailsView = self->_secondaryDetailsView;
  self->_secondaryDetailsView = v25;

  [(ExtensionsSecondaryDetailsView *)self->_secondaryDetailsView setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_initWeak(&location, self);
  v27 = objc_alloc_init(ExtensionsPayView);
  payView = self->_payView;
  self->_payView = v27;

  [(ExtensionsPayView *)self->_payView setTranslatesAutoresizingMaskIntoConstraints:0];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100393D30;
  v36[3] = &unk_1012E6D90;
  objc_copyWeak(&v37, &location);
  [(ExtensionsPayView *)self->_payView setPerformChangeCommand:v36];
  v29 = objc_alloc_init(ExtensionsActionsFooterView);
  openAppView = self->_openAppView;
  self->_openAppView = v29;

  [(ExtensionsActionsFooterView *)self->_openAppView setTranslatesAutoresizingMaskIntoConstraints:0];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100393E50;
  v34[3] = &unk_1012E6708;
  objc_copyWeak(&v35, &location);
  [(ExtensionsActionsFooterView *)self->_openAppView setDidTapOpenAppButton:v34];
  v31 = [(RidesharingDetailsPickingViewController *)self requestRideStatus];
  [(RidesharingDetailsPickingViewController *)self _updateFromRequestRideStatus:v31];

  v32 = [(ExtensionsStackViewController *)self stackView];
  v33 = [(RidesharingDetailsPickingViewController *)self stackedViews];
  [v32 _maps_setArrangedSubviews:v33];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RidesharingDetailsPickingViewController;
  [(RidesharingDetailsPickingViewController *)&v10 viewDidAppear:a3];
  v4 = [(RidesharingDetailsPickingViewController *)self coordinator];
  v5 = [v4 containerViewController];
  [v5 setNeedsUpdateForShowingDetailsPickingAnimated];

  objc_super v6 = [(RidesharingDetailsPickingViewController *)self coordinator];
  v7 = [v6 containerViewController];
  [v7 setRequestingRide:0];

  v8 = [(RidesharingDetailsPickingViewController *)self requestRideOptionProxy];
  v9 = [v8 analyticsBookingSession];
  [v9 captureView:2];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RidesharingDetailsPickingViewController;
  -[ContaineeViewController viewWillDisappear:](&v9, "viewWillDisappear:");
  v5 = [(RidesharingDetailsPickingViewController *)self coordinator];
  objc_super v6 = [v5 containerViewController];
  [v6 updateForDismissingDetailsPickingAnimated:v3];

  v7 = [(RidesharingDetailsPickingViewController *)self coordinator];
  v8 = [v7 containerViewController];
  [v8 setRequestingRide:0];
}

- (NSArray)topBannerItems
{
  topBannerItems = self->_topBannerItems;
  if (!topBannerItems)
  {
    v4 = [TopBannerItem alloc];
    id v5 = objc_alloc((Class)NSAttributedString);
    objc_super v6 = +[NSBundle mainBundle];
    v7 = [v6 localizedStringForKey:@"Move the map to set your pickup location" value:@"localized string not found" table:0];
    id v8 = [v5 initWithString:v7];
    objc_super v9 = [(TopBannerItem *)v4 initWithType:0 layout:0 userInfo:0 attributedString:v8 icon:0 buttonText:0 buttonAction:0];
    moveMapPromptItem = self->_moveMapPromptItem;
    self->_moveMapPromptItem = v9;

    v14 = self->_moveMapPromptItem;
    id v11 = +[NSArray arrayWithObjects:&v14 count:1];
    v12 = self->_topBannerItems;
    self->_topBannerItems = v11;

    topBannerItems = self->_topBannerItems;
  }

  return topBannerItems;
}

- (BannerContainerProtocol)bannerContainer
{
  p_bannerContainer = &self->_bannerContainer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bannerContainer);

  if (WeakRetained) {
    id v4 = objc_loadWeakRetained((id *)p_bannerContainer);
  }
  else {
    id v4 = 0;
  }

  return (BannerContainerProtocol *)v4;
}

- (id)stackedViews
{
  primaryDetailsView = self->_primaryDetailsView;
  v6[0] = self->_routeFromToView;
  v6[1] = primaryDetailsView;
  secondaryDetailsView = self->_secondaryDetailsView;
  v6[2] = self->_payView;
  v6[3] = secondaryDetailsView;
  v6[4] = self->_openAppView;
  id v4 = +[NSArray arrayWithObjects:v6 count:5];

  return v4;
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 - 3 < 2)
  {
    objc_super v9 = [(ContaineeViewController *)self cardPresentationController];
    [v9 availableHeight];
    double v4 = v10;
  }
  else if (a3 == 2)
  {
    [(RidesharingDetailsPickingViewController *)self headerAndRouteFromToViewHeight];
    double v12 = v11;
    -[ExtensionsPrimaryDetailsView systemLayoutSizeFittingSize:](self->_primaryDetailsView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
    return v12 + v13;
  }
  else
  {
    double v4 = -1.0;
    if (a3 == 1)
    {
      id v5 = [(ContaineeViewController *)self cardPresentationController];
      [v5 bottomSafeOffset];
      double v7 = v6;
      [(RidesharingDetailsPickingViewController *)self headerAndRouteFromToViewHeight];
      double v4 = v7 + v8;
    }
  }
  return v4;
}

- (double)headerAndRouteFromToViewHeight
{
  [(ContaineeViewController *)self headerHeight];
  double v4 = v3;
  -[RouteOverviewFieldsView systemLayoutSizeFittingSize:](self->_routeFromToView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  if (v5 == 0.0) {
    [(RouteOverviewFieldsView *)self->_routeFromToView intrinsicContentSize];
  }
  return v4 + v5;
}

- (BOOL)_isPresented
{
  double v3 = [(RidesharingDetailsPickingViewController *)self presentingViewController];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    double v5 = [(RidesharingDetailsPickingViewController *)self parentViewController];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (void)_updateFromRequestRideStatus:(id)a3
{
  id v4 = a3;
  [(RidesharingDetailsPickingViewController *)self loadViewIfNeeded];
  if ([v4 requestRideStatusError])
  {
    double v5 = [RidesharingErrorAlertProvider alloc];
    double v6 = [v4 application];
    double v7 = [v4 userActivity];
    id v8 = [(RidesharingErrorAlertProvider *)v5 _initWithCause:2 application:v6 activity:v7];

    objc_super v9 = [(RidesharingDetailsPickingViewController *)self requestRideOptionProxy];
    double v10 = [v9 analyticsBookingSession];
    double v11 = [v8 title];
    [v10 captureErrorMessage:v11];

    double v12 = [(RidesharingDetailsPickingViewController *)self coordinator];
    [v12 viewController:self presentErrorAlertIfNeeded:v8];
  }
  else if ([(RidesharingDetailsPickingViewController *)self _isPresented] {
         && [v4 requestExpired])
  }
  {
    [(RidesharingDetailsPickingViewController *)self _showExpirationAlert];
  }
  else
  {
    +[ExtensionsViewComposer composeCustomHeaderView:self->_routeFromToView forRideBookingRequestRideStatus:v4];
    +[ExtensionsViewComposer composePrimaryDetailsView:self->_primaryDetailsView forRideBookingRequestRideStatus:v4];
    unsigned int v13 = [v4 loadingRequest];
    if (v13) {
      double v14 = 0.5;
    }
    else {
      double v14 = 1.0;
    }
    [(ProminentActionButton *)self->_requestButton setEnabled:v13 ^ 1];
    [(ProminentActionButton *)self->_requestButton setAlpha:v14];
    requestButton = self->_requestButton;
    v16 = [v4 requestCommandTitle];
    [(ProminentActionButton *)requestButton setTitle:v16 forState:0];

    primaryDetailsView = self->_primaryDetailsView;
    v21 = self->_requestButton;
    v18 = +[NSArray arrayWithObjects:&v21 count:1];
    [(ExtensionsPrimaryDetailsView *)primaryDetailsView configureWithActionButtons:v18];

    v19 = [v4 rideOption];
    v20 = [v19 paymentMethods];
    -[ExtensionsPayView setHidden:](self->_payView, "setHidden:", [v20 count] == 0);

    +[ExtensionsViewComposer composeSecondaryDetailsView:self->_secondaryDetailsView forRideBookingRequestRideStatus:v4];
    +[ExtensionsViewComposer composePayView:self->_payView forRideBookingRequestRideStatus:v4];
    +[ExtensionsViewComposer composeOpenAppView:self->_openAppView forRideBookingRequestRideStatus:v4];
  }
}

- (void)requestRideStatusDidChange:(id)a3
{
  id v4 = a3;
  [(RidesharingDetailsPickingViewController *)self setRequestRideStatus:v4];
  [(RidesharingDetailsPickingViewController *)self _updateFromRequestRideStatus:v4];

  double v5 = [(ContaineeViewController *)self cardPresentationController];
  id v6 = [v5 containeeLayout];

  if (v6 == (id)2)
  {
    id v7 = [(ContaineeViewController *)self cardPresentationController];
    [v7 updateHeightForCurrentLayout];
  }
}

- (id)waypointsForFieldsView:(id)a3
{
  return 0;
}

- (id)currentRefinementsForFieldsView:(id)a3
{
  return 0;
}

- (int64_t)transportTypeForFieldsView:(id)a3
{
  return 4;
}

- (void)_showExpirationAlert
{
  if (!self->_finishedPickingDetails)
  {
    double v3 = [(RidesharingDetailsPickingViewController *)self coordinator];
    id v4 = [(RidesharingDetailsPickingViewController *)self requestRideStatus];
    [v3 presentExpirationAlertControllerWithRequestRideStatus:v4];

    self->_finishedPickingDetails = 1;
  }
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  double v5 = +[MKMapService sharedService];
  [v5 captureUserAction:4 onTarget:1402 eventValue:0];

  if (!self->_finishedPickingDetails)
  {
    [(RidesharingDetailsPickingViewController *)self setRequestRideOptionProxy:0];
    id v6 = [(RidesharingDetailsPickingViewController *)self coordinator];
    id v7 = [v6 appCoordinator];
    [v7 dismissRidesharingSessionAndReturnToRoutePlanning:1];

    self->_finishedPickingDetails = 1;
  }
}

- (void)_selectPaymentType
{
  double v3 = +[MKMapService sharedService];
  [v3 captureUserAction:14006 onTarget:1402 eventValue:0];

  id v4 = [(RidesharingDetailsPickingViewController *)self requestRideStatus];
  double v5 = [(RidesharingDetailsPickingViewController *)self requestRideOptionProxy];
  id v8 = +[RidesharingPaymentSelectionAlertController ridesharingPaymentSelectionAlertControllerWithRequestRideStatus:v4 requestRideOptionProxy:v5];

  id v6 = [(ExtensionsPayView *)self->_payView changePaymentMethodButton];
  id v7 = [v8 popoverPresentationController];
  [v7 setSourceView:v6];

  [(RidesharingDetailsPickingViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)_request
{
  double v3 = +[MKMapService sharedService];
  [v3 captureUserAction:14004 onTarget:1402 eventValue:0];

  self->_finishedPickingDetails = 1;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100394DE0;
  v29[3] = &unk_1012E5D08;
  v29[4] = self;
  id v4 = objc_retainBlock(v29);
  [(RideBookingRequestRideStatus *)self->_requestRideStatus startWaypointCoordinate];
  double v6 = v5;
  double v8 = v7;
  objc_super v9 = +[MKLocationManager sharedLocationManager];
  double v10 = [v9 lastLocation];
  id v11 = [objc_alloc((Class)CLLocation) initWithLatitude:v6 longitude:v8];
  [v10 distanceFromLocation:v11];
  double v13 = v12;

  GEOConfigGetDouble();
  if (v13 <= v14)
  {
    ((void (*)(void *))v4[2])(v4);
  }
  else
  {
    v15 = +[NSBundle mainBundle];
    v25 = [v15 localizedStringForKey:@"[Ridesharing] pickup location distance confirmation title" value:@"localized string not found" table:0];

    v16 = +[NSBundle mainBundle];
    v17 = [v16 localizedStringForKey:@"[Ridesharing] pickup location distance confirmation message" value:@"localized string not found" table:0];

    v18 = +[UIAlertController alertControllerWithTitle:v25 message:v17 preferredStyle:1];
    v19 = +[NSBundle mainBundle];
    v20 = [v19 localizedStringForKey:@"Cancel" value:@"localized string not found" table:0];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1003950F8;
    v28[3] = &unk_1012E6DE0;
    v28[4] = self;
    v21 = +[UIAlertAction actionWithTitle:v20 style:1 handler:v28];

    v22 = +[NSBundle mainBundle];
    v23 = [v22 localizedStringForKey:@"Confirm" value:@"localized string not found" table:0];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10039510C;
    v26[3] = &unk_1012E6E08;
    v27 = v4;
    v24 = +[UIAlertAction actionWithTitle:v23 style:0 handler:v26];

    [v18 addAction:v21];
    [v18 addAction:v24];
    [(RidesharingDetailsPickingViewController *)self presentViewController:v18 animated:1 completion:0];
  }
}

- (void)setRequestingRide:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(RidesharingDetailsPickingViewController *)self coordinator];
  double v6 = [v5 containerViewController];
  [v6 setRequestingRide:v3];

  uint64_t v7 = v3 ^ 1;
  [(ProminentActionButton *)self->_requestButton setSpinnerHidden:v7];
  [(ProminentActionButton *)self->_requestButton setUserInteractionEnabled:v7];
  id v8 = [(ExtensionsPayView *)self->_payView changePaymentMethodButton];
  [v8 setUserInteractionEnabled:v7];
}

- (void)_requestRide
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"RidesharingDidRequestRideNotificationKey" object:0];

  [(RidesharingDetailsPickingViewController *)self setRequestingRide:1];
  id v4 = [(RidesharingDetailsPickingViewController *)self requestRideStatus];
  double v5 = [v4 origin];
  double v6 = [v5 location];
  uint64_t v7 = +[MKLocationManager sharedLocationManager];
  id v8 = [v7 lastLocation];
  [v6 distanceFromLocation:v8];
  double v10 = v9;
  id v11 = [(RidesharingDetailsPickingViewController *)self requestRideOptionProxy];
  double v12 = [v11 analyticsBookingSession];
  [v12 setDistanceToPickup:v10];

  id v13 = objc_alloc_init((Class)NSDate);
  double v14 = [(RidesharingDetailsPickingViewController *)self requestRideOptionProxy];
  v15 = [v14 analyticsBookingSession];
  [v15 setBookingDate:v13];

  v16 = [(RidesharingDetailsPickingViewController *)self requestRideStatus];
  v17 = [v16 destination];
  v18 = [v17 _geoMapItem];

  v19 = [(RidesharingDetailsPickingViewController *)self requestRideStatus];
  v20 = [v19 origin];
  v21 = [v20 _geoMapItem];

  if (v18)
  {
    if (v21) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  v22 = [(RidesharingDetailsPickingViewController *)self requestRideStatus];
  v23 = [v22 destination];
  v24 = [v23 location];
  [v24 coordinate];
  double v26 = v25;
  double v28 = v27;
  v29 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Constructing a minimalMapItem for the BaR destination for analytics", (uint8_t *)buf, 2u);
  }

  id v30 = [objc_alloc((Class)GEOPlace) initWithLatitude:v26 longitude:v28];
  v18 = +[GEOMapItemStorage mapItemStorageForPlace:v30];

  if (!v21)
  {
LABEL_7:
    v31 = [(RidesharingDetailsPickingViewController *)self requestRideStatus];
    v32 = [v31 origin];
    v33 = [v32 location];
    [v33 coordinate];
    double v35 = v34;
    double v37 = v36;
    v38 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "Constructing a minimalMapItem for the BaR destination for analytics", (uint8_t *)buf, 2u);
    }

    id v39 = [objc_alloc((Class)GEOPlace) initWithLatitude:v35 longitude:v37];
    v21 = +[GEOMapItemStorage mapItemStorageForPlace:v39];
  }
LABEL_10:
  v40 = +[MapsSuggestionsPredictor sharedPredictor];
  [v40 captureActualTransportationMode:6 originMapItem:v21 destinationMapItem:v18];

  objc_initWeak(buf, self);
  v41 = [(RidesharingDetailsPickingViewController *)self requestRideOptionProxy];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100395618;
  v42[3] = &unk_1012E6E30;
  objc_copyWeak(&v43, buf);
  [v41 requestRideWithCompletion:v42];

  objc_destroyWeak(&v43);
  objc_destroyWeak(buf);
}

- (void)_openApp
{
  BOOL v3 = +[MKMapService sharedService];
  [v3 captureUserAction:6020 onTarget:1402 eventValue:0];

  id v4 = [(RidesharingDetailsPickingViewController *)self requestRideOptionProxy];
  double v5 = [v4 analyticsBookingSession];
  [v5 endSessionOnView:2 state:4];

  id v9 = [(RidesharingDetailsPickingViewController *)self requestRideStatus];
  double v6 = [v9 application];
  uint64_t v7 = [(RidesharingDetailsPickingViewController *)self requestRideStatus];
  id v8 = [v7 userActivity];
  [v6 openWithActivity:v8];
}

- (void)setBannerContainer:(id)a3
{
}

- (RidesharingCoordinator)coordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);

  return (RidesharingCoordinator *)WeakRetained;
}

- (void)setCoordinator:(id)a3
{
}

- (RideBookingRequestRideStatus)requestRideStatus
{
  return self->_requestRideStatus;
}

- (void)setRequestRideStatus:(id)a3
{
}

- (RideBookingRequestRideOptionProxy)requestRideOptionProxy
{
  return self->_requestRideOptionProxy;
}

- (void)setRequestRideOptionProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestRideOptionProxy, 0);
  objc_storeStrong((id *)&self->_requestRideStatus, 0);
  objc_destroyWeak((id *)&self->_coordinator);
  objc_destroyWeak((id *)&self->_bannerContainer);
  objc_storeStrong((id *)&self->_topBannerItems, 0);
  objc_storeStrong((id *)&self->_moveMapPromptItem, 0);
  objc_storeStrong((id *)&self->_requestButton, 0);
  objc_storeStrong((id *)&self->_openAppView, 0);
  objc_storeStrong((id *)&self->_secondaryDetailsView, 0);
  objc_storeStrong((id *)&self->_payView, 0);
  objc_storeStrong((id *)&self->_primaryDetailsView, 0);
  objc_storeStrong((id *)&self->_routeFromToView, 0);

  objc_storeStrong((id *)&self->_containerHeaderView, 0);
}

@end