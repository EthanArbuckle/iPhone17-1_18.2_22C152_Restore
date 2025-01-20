@interface RidesharingConfirmedRideViewController
- (CGSize)maximumSizeForRemoteViewController:(id)a3;
- (CGSize)minimumSizeForRemoteViewController:(id)a3;
- (INUIRemoteViewController)_remoteViewController;
- (NSString)applicationIdentifier;
- (ProminentActionButton)cancelButton;
- (ProminentActionButton)completedButton;
- (ProminentActionButton)contactButton;
- (RideBookingRequestRideOptionProxy)requestRideOptionProxy;
- (RideBookingRideStatus)rideStatus;
- (RideBookingRideStatusObserverProxy)rideStatusObserverProxy;
- (RidesharingAnalyticsBookedSession)analyticsBookedSession;
- (RidesharingConfirmedRideViewController)init;
- (RidesharingConfirmedRideViewController)initWithApplicationIdentifier:(id)a3;
- (RidesharingCoordinator)coordinator;
- (_MXExtension)extensionForUI;
- (_MXExtensionManager)extensionManager;
- (double)headerAndRouteFromToViewHeight;
- (double)heightForLayout:(unint64_t)a3;
- (id)_cancelConfirmationAlertControllerForApp:(id)a3 withFee:(id)a4 threshold:(id)a5 continueBlock:(id)a6;
- (id)currentRefinementsForFieldsView:(id)a3;
- (id)stackedViews;
- (id)waypointsForFieldsView:(id)a3;
- (int)_currentAnalyticsTarget;
- (int64_t)transportTypeForFieldsView:(id)a3;
- (void)_bannerViewTapped:(id)a3;
- (void)_cancelTapped:(id)a3;
- (void)_cleanupWithRideStatus:(id)a3;
- (void)_completedButtonTapped:(id)a3;
- (void)_openAppTapped;
- (void)_setBannerViewContainerContentView:(id)a3;
- (void)_updateFromRideStatus:(id)a3;
- (void)contactTapped:(id)a3;
- (void)dealloc;
- (void)didChangeLayout:(unint64_t)a3;
- (void)extensionManager:(id)a3 didUpdateAvailableExtensions:(id)a4;
- (void)getCanCallPhoneNumber:(id)a3 completion:(id)a4;
- (void)getRemoteViewControllerWithDelegate:(id)a3 completion:(id)a4;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)presentCustomTipAlert:(id)a3;
- (void)remoteViewControllerServiceDidTerminate:(id)a3;
- (void)rideStatusMapDidChange:(id)a3;
- (void)setAnalyticsBookedSession:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setCompletedButton:(id)a3;
- (void)setContactButton:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setExtensionForUI:(id)a3;
- (void)setExtensionManager:(id)a3;
- (void)setRequestRideOptionProxy:(id)a3;
- (void)setRideStatus:(id)a3;
- (void)setRideStatusObserverProxy:(id)a3;
- (void)set_remoteViewController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation RidesharingConfirmedRideViewController

- (RidesharingConfirmedRideViewController)initWithApplicationIdentifier:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RidesharingConfirmedRideViewController;
  v5 = [(RidesharingConfirmedRideViewController *)&v16 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = v6;

    v8 = [[RideBookingRideStatusObserverProxy alloc] initWithDelegate:v5];
    rideStatusObserverProxy = v5->_rideStatusObserverProxy;
    v5->_rideStatusObserverProxy = v8;

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1007284FC;
    v14[3] = &unk_1012F6A48;
    id v15 = v4;
    v10 = +[_MXExtensionManager _lookupPolicyWithBlock:v14];
    uint64_t v11 = +[_MXExtensionManager managerWithLookupPolicy:v10 delegate:v5];
    extensionManager = v5->_extensionManager;
    v5->_extensionManager = (_MXExtensionManager *)v11;
  }
  return v5;
}

- (RidesharingConfirmedRideViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)RidesharingConfirmedRideViewController;
  return [(RidesharingConfirmedRideViewController *)&v3 initWithNibName:0 bundle:0];
}

- (void)viewDidLoad
{
  v51.receiver = self;
  v51.super_class = (Class)RidesharingConfirmedRideViewController;
  [(ExtensionsStackViewController *)&v51 viewDidLoad];
  objc_super v3 = objc_alloc_init(ContainerHeaderView);
  containerHeaderView = self->_containerHeaderView;
  self->_containerHeaderView = v3;

  [(ContainerHeaderView *)self->_containerHeaderView setHairLineAlpha:0.0];
  [(ContainerHeaderView *)self->_containerHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ContainerHeaderView *)self->_containerHeaderView setDelegate:self];
  v5 = [(ExtensionsStackViewController *)self headerView];
  [v5 addSubview:self->_containerHeaderView];

  v6 = self->_containerHeaderView;
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
  v14 = objc_alloc_init(FeedbackHeaderView);
  feedbackHeaderView = self->_feedbackHeaderView;
  self->_feedbackHeaderView = v14;

  [(FeedbackHeaderView *)self->_feedbackHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(FeedbackHeaderView *)self->_feedbackHeaderView setTitle:&stru_101324E70];
  [(FeedbackHeaderView *)self->_feedbackHeaderView setSubtitle:&stru_101324E70];
  objc_super v16 = (UIView *)objc_alloc_init((Class)UIView);
  bannerViewContainerView = self->_bannerViewContainerView;
  self->_bannerViewContainerView = v16;

  [(UIView *)self->_bannerViewContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v18 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_bannerViewTapped:"];
  [(UIView *)self->_bannerViewContainerView addGestureRecognizer:v18];
  v19 = (UIView *)objc_opt_new();
  roundedRectView = self->_roundedRectView;
  self->_roundedRectView = v19;

  v21 = [(UIView *)self->_roundedRectView layer];
  [v21 setCornerRadius:6.0];

  [(UIView *)self->_roundedRectView setClipsToBounds:1];
  v22 = [(UIView *)self->_roundedRectView layer];
  v23 = +[UIColor blackColor];
  id v24 = [v23 colorWithAlphaComponent:0.200000003];
  objc_msgSend(v22, "setBorderColor:", objc_msgSend(v24, "CGColor"));

  v25 = [(UIView *)self->_roundedRectView layer];
  [v25 setBorderWidth:1.0];

  [(UIView *)self->_roundedRectView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v26) = 1148846080;
  [(UIView *)self->_roundedRectView setContentCompressionResistancePriority:1 forAxis:v26];
  v27 = objc_alloc_init(ExtensionsBannerView);
  bannerView = self->_bannerView;
  self->_bannerView = v27;

  [(ExtensionsBannerView *)self->_bannerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v29 = objc_alloc_init(ExtensionsRidesharingTemplatedBannerView);
  templatedBannerView = self->_templatedBannerView;
  self->_templatedBannerView = v29;

  [(ExtensionsRidesharingTemplatedBannerView *)self->_templatedBannerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v31 = objc_alloc_init(ExtensionsBannerAttributionView);
  bannerAttributionView = self->_bannerAttributionView;
  self->_bannerAttributionView = v31;

  [(ExtensionsBannerAttributionView *)self->_bannerAttributionView setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_initWeak(&location, self);
  v33 = [ExtensionsFeedbackView alloc];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100728CFC;
  v48[3] = &unk_1012F6A90;
  objc_copyWeak(&v49, &location);
  v34 = [(ExtensionsFeedbackView *)v33 initWithSubmitHandler:v48];
  feedbackView = self->_feedbackView;
  self->_feedbackView = v34;

  [(ExtensionsFeedbackView *)self->_feedbackView setTranslatesAutoresizingMaskIntoConstraints:0];
  v36 = objc_alloc_init(ExtensionsPrimaryDetailsView);
  primaryDetailsView = self->_primaryDetailsView;
  self->_primaryDetailsView = v36;

  [(ExtensionsPrimaryDetailsView *)self->_primaryDetailsView setTranslatesAutoresizingMaskIntoConstraints:0];
  v38 = objc_alloc_init(ExtensionsSecondaryDetailsView);
  secondaryDetailsView = self->_secondaryDetailsView;
  self->_secondaryDetailsView = v38;

  [(ExtensionsSecondaryDetailsView *)self->_secondaryDetailsView setTranslatesAutoresizingMaskIntoConstraints:0];
  v40 = objc_alloc_init(ExtensionsActionsFooterView);
  openAppView = self->_openAppView;
  self->_openAppView = v40;

  [(ExtensionsActionsFooterView *)self->_openAppView setTranslatesAutoresizingMaskIntoConstraints:0];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100729144;
  v46[3] = &unk_1012E6708;
  objc_copyWeak(&v47, &location);
  [(ExtensionsActionsFooterView *)self->_openAppView setDidTapOpenAppButton:v46];
  v42 = [(ExtensionsStackViewController *)self stackView];
  v43 = [(RidesharingConfirmedRideViewController *)self stackedViews];
  [v42 _maps_setArrangedSubviews:v43];

  v44 = [(ExtensionsStackViewController *)self stackView];
  [v44 setCustomSpacing:self->_routeFromToView afterView:16.0];

  v45 = [(RidesharingConfirmedRideViewController *)self rideStatus];
  [(RidesharingConfirmedRideViewController *)self _updateFromRideStatus:v45];

  objc_destroyWeak(&v47);
  objc_destroyWeak(&v49);
  objc_destroyWeak(&location);
}

- (void)extensionManager:(id)a3 didUpdateAvailableExtensions:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10072931C;
  v7[3] = &unk_1012E9340;
  objc_copyWeak(&v10, &location);
  id v8 = v5;
  v9 = self;
  id v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)getRemoteViewControllerWithDelegate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(RidesharingConfirmedRideViewController *)self extensionForUI];
    v9 = [v8 extension];
    id v10 = +[NSMutableArray arrayWithObject:v9];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100729644;
    v11[3] = &unk_1012F6AB8;
    id v12 = v7;
    +[INUIRemoteViewController attemptToConnectToRemoteViewControllerForRemainingExtensions:v10 delegate:v6 connectionHandler:v11];
  }
  else
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingConfirmedRideViewController.m";
      __int16 v15 = 1024;
      int v16 = 252;
      __int16 v17 = 2082;
      id v18 = "-[RidesharingConfirmedRideViewController getRemoteViewControllerWithDelegate:completion:]";
      __int16 v19 = 2082;
      v20 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)RidesharingConfirmedRideViewController;
  id v7 = a4;
  -[ContaineeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100729808;
  v8[3] = &unk_1012E81F8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:&stru_1012F6AD8];
}

- (void)_bannerViewTapped:(id)a3
{
  id v4 = [(ContaineeViewController *)self cardPresentationController];
  id v5 = [v4 containeeLayout];

  if (v5 != (id)3)
  {
    id v6 = [(ContaineeViewController *)self cardPresentationController];
    [v6 wantsLayout:3];
  }
}

- (void)_openAppTapped
{
  objc_super v3 = +[MKMapService sharedService];
  [v3 captureUserAction:6020 onTarget:[self _currentAnalyticsTarget] eventValue:0];

  id v7 = [(RidesharingConfirmedRideViewController *)self rideStatus];
  id v4 = [v7 application];
  id v5 = [(RidesharingConfirmedRideViewController *)self rideStatus];
  id v6 = [v5 userActivity];
  [v4 openWithActivity:v6];
}

- (void)_cancelTapped:(id)a3
{
  id v4 = a3;
  id v5 = +[MKMapService sharedService];
  [v5 captureUserAction:18 onTarget:[self _currentAnalyticsTarget] eventValue:0];

  id v6 = [(RidesharingConfirmedRideViewController *)self cancelButton];
  [v6 setSpinnerHidden:0];

  id v7 = [(RidesharingConfirmedRideViewController *)self rideStatus];
  objc_initWeak(&location, self);
  id v8 = [(RidesharingConfirmedRideViewController *)self rideStatusObserverProxy];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100729B34;
  v10[3] = &unk_1012F6B28;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v8 checkIfCanCancelRideWithRideStatus:v9 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_cleanupWithRideStatus:(id)a3
{
  id v4 = a3;
  id v5 = [(RidesharingConfirmedRideViewController *)self cancelButton];
  [v5 setSpinnerHidden:1];

  id v6 = [(RidesharingConfirmedRideViewController *)self analyticsBookedSession];
  [v6 setCancelled:1];

  id v7 = [(RidesharingConfirmedRideViewController *)self analyticsBookedSession];
  [v7 endSession];

  id v8 = [v4 application];
  id v9 = [v4 userActivityForCanceling];

  [v8 openWithActivity:v9];
  id v10 = [(RidesharingConfirmedRideViewController *)self coordinator];
  id v11 = [v10 containerViewController];
  id v12 = [v11 chromeViewController];
  [v12 popToRootContextAnimated:1 completion:0];

  id v15 = [(RidesharingConfirmedRideViewController *)self coordinator];
  v13 = [v15 appCoordinator];
  v14 = [v13 platformController];
  [v14 clearSessions];
}

- (id)_cancelConfirmationAlertControllerForApp:(id)a3 withFee:(id)a4 threshold:(id)a5 continueBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = v12;
  if (v12)
  {
    id v54 = v12;
    v14 = +[NSBundle mainBundle];
    id v15 = [v14 localizedStringForKey:@"ridesharing cancel ride confirmation default title" value:@"localized string not found" table:0];

    int v16 = +[NSBundle mainBundle];
    __int16 v17 = [v16 localizedStringForKey:@"ridesharing cancel ride confirmation default message" value:@"localized string not found" table:0];

    +[NSBundle mainBundle];
    id v18 = v55 = v11;
    id v49 = [v18 localizedStringForKey:@"ridesharing cancel ride confirmation continue cancel" value:@"localized string not found" table:0];

    __int16 v19 = +[NSBundle mainBundle];
    objc_super v51 = [v19 localizedStringForKey:@"ridesharing cancel ride confirmation dont cancel" value:@"localized string not found" table:0];

    v20 = +[NSBundle mainBundle];
    v21 = [v20 localizedStringForKey:@"ridesharing cancel ride confirmation fee only title" value:@"localized string not found" table:0];
    v22 = [v10 formattedString];
    v53 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, v22);

    v23 = +[NSBundle mainBundle];
    v52 = [v23 localizedStringForKey:@"ridesharing cancel ride confirmation fee message" value:@"localized string not found" table:0];

    id v24 = +[NSBundle mainBundle];
    v25 = [v24 localizedStringForKey:@"ridesharing.cancelRide.confirmation.continue.fee" value:@"localized string not found" table:0];
    double v26 = [v10 formattedString];
    v27 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v25, v26);

    v50 = v27;
    if (v10 && v55)
    {
      v28 = +[NSDate date];
      [v55 timeIntervalSinceDate:v28];
      double v30 = v29;

      if (v30 >= 30.0)
      {
        v31 = v54;
        v32 = v49;
LABEL_12:
        v33 = +[UIAlertController alertControllerWithTitle:v15 message:v17 preferredStyle:1];
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_10072A854;
        v58[3] = &unk_1012E6E08;
        id v38 = v31;
        id v59 = v38;
        v39 = +[UIAlertAction actionWithTitle:v51 style:1 handler:v58];
        [v33 addAction:v39];

        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_10072A868;
        v56[3] = &unk_1012E6E08;
        id v40 = v38;
        v13 = v54;
        id v57 = v40;
        v41 = +[UIAlertAction actionWithTitle:v32 style:2 handler:v56];
        [v33 addAction:v41];

        id v11 = v55;
        goto LABEL_13;
      }
    }
    else if (!v10)
    {
      v32 = v49;
      if (!v55)
      {
        v31 = v54;
        goto LABEL_12;
      }
      v43 = +[NSBundle mainBundle];
      uint64_t v44 = [v43 localizedStringForKey:@"ridesharing cancel ride confirmation threshold only title" value:@"localized string not found" table:0];

      v45 = +[NSBundle mainBundle];
      v46 = [v45 localizedStringForKey:@"ridesharing cancel ride confirmation threshold only message" value:@"localized string not found" table:0];
      uint64_t v47 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v46, v9);

      v48 = +[NSBundle mainBundle];
      id v36 = [v48 localizedStringForKey:@"ridesharing.cancelRide.confirmation.continue.unknownFee" value:@"localized string not found" table:0];

      v37 = v48;
      __int16 v17 = (void *)v47;
      id v15 = v44;
      v31 = v54;
      goto LABEL_11;
    }
    v34 = v53;

    id v35 = v52;
    id v36 = v27;
    __int16 v17 = v35;
    id v15 = v34;
    v31 = v54;
    v37 = v49;
LABEL_11:

    v32 = v36;
    goto LABEL_12;
  }
  id v15 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446978;
    v61 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingConfirmedRideViewController.m";
    __int16 v62 = 1024;
    int v63 = 344;
    __int16 v64 = 2082;
    v65 = "-[RidesharingConfirmedRideViewController _cancelConfirmationAlertControllerForApp:withFee:threshold:continueBlock:]";
    __int16 v66 = 2082;
    v67 = "nil == (continueBlock)";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
  }
  v33 = 0;
LABEL_13:

  return v33;
}

- (void)_completedButtonTapped:(id)a3
{
  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:6020 onTarget:[self _currentAnalyticsTarget] eventValue:0];

  id v5 = [(RidesharingConfirmedRideViewController *)self coordinator];
  [v5 viewControllerRideCompletionAction:self];

  id v9 = [(RidesharingConfirmedRideViewController *)self rideStatus];
  id v6 = [v9 application];
  id v7 = [(RidesharingConfirmedRideViewController *)self rideStatus];
  id v8 = [v7 userActivityForCompletedRide];
  [v6 openWithActivity:v8];
}

- (void)contactTapped:(id)a3
{
  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:14005 onTarget:[self _currentAnalyticsTarget] eventValue:0];

  id v5 = [(RidesharingConfirmedRideViewController *)self analyticsBookedSession];
  [v5 setContactedDriver:1];

  if (self->_cachedContactUrl)
  {
    id v6 = +[MKSystemController sharedInstance];
    [v6 openURL:self->_cachedContactUrl completionHandler:0];
  }
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  -[RidesharingConfirmedRideViewController setRequestRideOptionProxy:](self, "setRequestRideOptionProxy:", 0, a4);
  [(RidesharingConfirmedRideViewController *)self setRideStatus:0];
  [(RidesharingConfirmedRideViewController *)self setExtensionManager:0];
  [(RidesharingConfirmedRideViewController *)self setExtensionForUI:0];
  id v5 = [(RidesharingConfirmedRideViewController *)self coordinator];
  [v5 viewController:self minimizeConfirmation:0];
}

- (int)_currentAnalyticsTarget
{
  v2 = [(RidesharingConfirmedRideViewController *)self rideStatus];
  id v3 = [v2 phase];

  if (v3 == (id)1) {
    return 1403;
  }
  else {
    return 1404;
  }
}

- (ProminentActionButton)cancelButton
{
  cancelButton = self->_cancelButton;
  if (!cancelButton)
  {
    id v4 = +[ProminentActionButton invertedButton];
    id v5 = self->_cancelButton;
    self->_cancelButton = v4;

    id v6 = [(ProminentActionButton *)self->_cancelButton titleLabel];
    +[DynamicTypeWizard autorefreshLabel:v6 withFontProvider:&stru_101321540];

    [(ProminentActionButton *)self->_cancelButton addTarget:self action:"_cancelTapped:" forControlEvents:0x2000];
    id v7 = [(RidesharingConfirmedRideViewController *)self theme];
    id v8 = [v7 controlTintColor];
    [(ProminentActionButton *)self->_cancelButton setTintColor:v8];

    id v9 = self->_cancelButton;
    id v10 = +[NSBundle mainBundle];
    id v11 = [v10 localizedStringForKey:@"Cancel [Ridesharing booked ride cancel button]" value:@"localized string not found" table:0];
    [(ProminentActionButton *)v9 setTitle:v11 forState:0];

    cancelButton = self->_cancelButton;
  }

  return cancelButton;
}

- (ProminentActionButton)contactButton
{
  contactButton = self->_contactButton;
  if (!contactButton)
  {
    id v4 = +[ProminentActionButton button];
    id v5 = self->_contactButton;
    self->_contactButton = v4;

    id v6 = [(ProminentActionButton *)self->_contactButton titleLabel];
    +[DynamicTypeWizard autorefreshLabel:v6 withFontProvider:&stru_101321540];

    [(ProminentActionButton *)self->_contactButton addTarget:self action:"contactTapped:" forControlEvents:0x2000];
    id v7 = [(RidesharingConfirmedRideViewController *)self theme];
    id v8 = [v7 controlTintColor];
    [(ProminentActionButton *)self->_contactButton setTintColor:v8];

    [(ProminentActionButton *)self->_contactButton setEnabled:0];
    id v9 = self->_contactButton;
    id v10 = [(RidesharingConfirmedRideViewController *)self rideStatus];
    id v11 = [v10 contactCommandTitle];
    id v12 = [v11 copy];
    if (v12)
    {
      [(ProminentActionButton *)v9 setTitle:v12 forState:0];
    }
    else
    {
      v13 = +[NSBundle mainBundle];
      v14 = [v13 localizedStringForKey:@"Contact [Ridesharing booked ride]" value:@"localized string not found" table:0];
      [(ProminentActionButton *)v9 setTitle:v14 forState:0];
    }
    contactButton = self->_contactButton;
  }

  return contactButton;
}

- (ProminentActionButton)completedButton
{
  completedButton = self->_completedButton;
  if (!completedButton)
  {
    id v4 = +[ProminentActionButton button];
    id v5 = self->_completedButton;
    self->_completedButton = v4;

    id v6 = [(ProminentActionButton *)self->_completedButton titleLabel];
    +[DynamicTypeWizard autorefreshLabel:v6 withFontProvider:&stru_101321540];

    [(ProminentActionButton *)self->_completedButton addTarget:self action:"_completedButtonTapped:" forControlEvents:0x2000];
    id v7 = [(RidesharingConfirmedRideViewController *)self theme];
    id v8 = [v7 controlTintColor];
    [(ProminentActionButton *)self->_completedButton setTintColor:v8];

    completedButton = self->_completedButton;
  }

  return completedButton;
}

- (void)rideStatusMapDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(RidesharingConfirmedRideViewController *)self applicationIdentifier];
  id v6 = [v4 objectForKey:v5];

  [(RidesharingConfirmedRideViewController *)self _updateFromRideStatus:v6];
}

- (void)_updateFromRideStatus:(id)a3
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_36;
  }
  objc_storeStrong((id *)&self->_rideStatus, a3);
  id v6 = [v5 application];
  id v7 = [v6 identifier];
  id v8 = [v5 identifier];
  id v9 = +[RideBookingAccessProxy rideBookingCurrentBookedSessionForAppIdentifier:v7 rideIdentifier:v8];
  [(RidesharingConfirmedRideViewController *)self setAnalyticsBookedSession:v9];

  if (([v5 isValidRide] & 1) == 0)
  {
    id v12 = [RidesharingErrorAlertProvider alloc];
    v13 = [v5 application];
    v14 = [v5 userActivity];
    id v15 = [(RidesharingErrorAlertProvider *)v12 _initWithCause:1 application:v13 activity:v14];

    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10072B68C;
    block[3] = &unk_1012E6690;
    objc_copyWeak(&v50, &location);
    id v49 = v15;
    id v16 = v15;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v50);
    objc_destroyWeak(&location);
    goto LABEL_36;
  }
  if (!self->_hasEverRequestedRemoteViewController && !self->_remoteViewController)
  {
    self->_hasEverRequestedRemoteViewController = 1;
    p_templatedBannerView = &self->_templatedBannerView;
    +[ExtensionsViewComposer composeBlankTemplatedBannerView:self->_templatedBannerView forRideBookingRideStatus:v5];
    [(ExtensionsBannerAttributionView *)self->_bannerAttributionView setHidden:0];
    id v11 = [(RidesharingConfirmedRideViewController *)self extensionForUI];

    if (v11)
    {
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_10072B758;
      v46[3] = &unk_1012F6B50;
      void v46[4] = self;
      id v47 = v5;
      [(RidesharingConfirmedRideViewController *)self getRemoteViewControllerWithDelegate:self completion:v46];
    }
    else
    {
      +[ExtensionsViewComposer composeTemplatedBannerView:*p_templatedBannerView forRideBookingRideStatus:v5];
      if (self->_remoteViewController) {
        p_templatedBannerView = &self->_bannerView;
      }
      [(RidesharingConfirmedRideViewController *)self _setBannerViewContainerContentView:*p_templatedBannerView];
      __int16 v17 = [(ContaineeViewController *)self cardPresentationController];
      [v17 updateHeightForCurrentLayout];
    }
  }
  if (![v5 isValidRide] || (objc_msgSend(v5, "isActiveRide") & 1) == 0)
  {
    id v18 = [(RidesharingConfirmedRideViewController *)self coordinator];
    __int16 v19 = [v18 containerViewController];
    v20 = [v19 chromeViewController];
    v21 = [v20 ridesharingAnnotationsManager];
    [v21 removeCurrentRide];

    if ([v5 phase] == (id)4)
    {
      v22 = [(ContaineeViewController *)self cardPresentationController];
      if ([v22 containeeLayout] == (id)3)
      {
      }
      else
      {
        BOOL hasShownFullContaineeLayout = self->_hasShownFullContaineeLayout;

        if (!hasShownFullContaineeLayout)
        {
          id v24 = [(ContaineeViewController *)self cardPresentationController];
          [v24 wantsLayout:3];

          self->_BOOL hasShownFullContaineeLayout = 1;
        }
      }
    }
  }
  driverPhoneNumber = self->_driverPhoneNumber;
  id v26 = [v5 driverPhoneNumber];
  if (![(NSString *)driverPhoneNumber isEqualToString:v26])
  {
    v27 = [v5 driverPhoneNumber];

    if (!v27) {
      goto LABEL_22;
    }
    v28 = [v5 driverPhoneNumber];
    double v29 = self->_driverPhoneNumber;
    self->_driverPhoneNumber = v28;

    id v26 = [objc_alloc((Class)CNPhoneNumber) initWithStringValue:self->_driverPhoneNumber];
    double v30 = [(RidesharingConfirmedRideViewController *)self contactButton];
    [v30 setEnabled:0];

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10072B864;
    v45[3] = &unk_1012F6B78;
    v45[4] = self;
    [(RidesharingConfirmedRideViewController *)self getCanCallPhoneNumber:v26 completion:v45];
  }

LABEL_22:
  +[ExtensionsViewComposer composeCustomHeaderView:self->_routeFromToView forRideBookingRideStatus:v5];
  +[ExtensionsViewComposer composeBannerView:self->_bannerView forRidesharingCurrentRideViewController:self rideBookingRideStatus:v5];
  +[ExtensionsViewComposer composeTemplatedBannerView:self->_templatedBannerView forRideBookingRideStatus:v5];
  +[ExtensionsViewComposer composeBannerAttributionView:self->_bannerAttributionView forRideBookingRideStatus:v5];
  +[ExtensionsViewComposer composeSecondaryDetailsView:self->_secondaryDetailsView forRideBookingRideStatus:v5];
  +[ExtensionsViewComposer composeOpenAppView:self->_openAppView forRideBookingRideStatus:v5];
  if (self->_remoteViewController) {
    uint64_t v31 = 176;
  }
  else {
    uint64_t v31 = 184;
  }
  [(RidesharingConfirmedRideViewController *)self _setBannerViewContainerContentView:*(Class *)((char *)&self->super.super.super.super.super.super.isa + v31)];
  [(ExtensionsFeedbackView *)self->_feedbackView setHidden:1];
  [(UIView *)self->_bannerViewContainerView setHidden:0];
  [(ExtensionsSecondaryDetailsView *)self->_secondaryDetailsView setHidden:0];
  id v32 = objc_alloc_init((Class)NSMutableOrderedSet);
  v33 = [(RidesharingConfirmedRideViewController *)self cancelButton];
  v34 = [v5 cancelCommandTitle];
  [v33 setTitle:v34 forState:0];

  id v35 = [(RidesharingConfirmedRideViewController *)self completedButton];
  id v36 = [v5 cardRideCompletedActionButtonTitle];
  [v35 setTitle:v36 forState:0];

  if (![v5 isValidRide] || (objc_msgSend(v5, "isActiveRide") & 1) == 0)
  {
    uint64_t v38 = [(RidesharingConfirmedRideViewController *)self completedButton];
    goto LABEL_30;
  }
  v37 = [(RidesharingConfirmedRideViewController *)self cancelButton];
  [v32 addObject:v37];

  if ([(NSString *)self->_driverPhoneNumber length])
  {
    uint64_t v38 = [(RidesharingConfirmedRideViewController *)self contactButton];
LABEL_30:
    v39 = (void *)v38;
    [v32 addObject:v38];
  }
  if ([v5 shouldShowFeedbackControls])
  {
    +[ExtensionsViewComposer composeFeedbackView:self->_feedbackView forRideBookingRideStatus:v5 tippingViewDelegate:self];
    [(ContainerHeaderView *)self->_containerHeaderView setTitleView:self->_feedbackHeaderView];
    +[ExtensionsViewComposer composeCustomFeedbackHeaderView:self->_feedbackHeaderView forRideBookingRideStatus:v5];
    [(ExtensionsFeedbackView *)self->_feedbackView setHidden:0];
    [(UIView *)self->_bannerViewContainerView setHidden:1];
    id v40 = objc_alloc_init((Class)NSMutableOrderedSet);

    id v32 = v40;
  }
  primaryDetailsView = self->_primaryDetailsView;
  v42 = [v32 objectEnumerator];
  v43 = [v42 allObjects];
  +[ExtensionsViewComposer composePrimaryDetailsView:primaryDetailsView forRideBookingRideStatus:v5 withActionButtons:v43];

  id v44 = [v5 phase];
  if ((v44 == 0) != [(ExtensionsPrimaryDetailsView *)self->_primaryDetailsView isHidden]) {
    [(ExtensionsPrimaryDetailsView *)self->_primaryDetailsView setHidden:v44 == 0];
  }

LABEL_36:
}

- (void)_setBannerViewContainerContentView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 superview];
  roundedRectView = self->_roundedRectView;

  if (v5 != roundedRectView)
  {
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v7 = [(UIView *)self->_roundedRectView subviews];
    id v8 = [v7 copy];

    id v9 = [v8 countByEnumeratingWithState:&v63 objects:v69 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v64;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v64 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v63 + 1) + 8 * (void)v12) removeFromSuperview];
          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v63 objects:v69 count:16];
      }
      while (v10);
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v13 = [(UIView *)self->_bannerViewContainerView subviews];
    id v14 = [v13 copy];

    id v15 = [v14 countByEnumeratingWithState:&v59 objects:v68 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v60;
      do
      {
        id v18 = 0;
        do
        {
          if (*(void *)v60 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v59 + 1) + 8 * (void)v18) removeFromSuperview];
          id v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v59 objects:v68 count:16];
      }
      while (v16);
    }

    [(UIView *)self->_bannerViewContainerView addSubview:self->_roundedRectView];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_roundedRectView addSubview:v4];
    [(UIView *)self->_roundedRectView addSubview:self->_bannerAttributionView];
    LODWORD(v19) = 1148846080;
    [v4 setContentCompressionResistancePriority:1 forAxis:v19];
    LODWORD(v20) = 1148846080;
    [(ExtensionsBannerAttributionView *)self->_bannerAttributionView setContentCompressionResistancePriority:1 forAxis:v20];
    id v57 = [v4 topAnchor];
    v56 = [(UIView *)self->_roundedRectView topAnchor];
    v55 = [v57 constraintEqualToAnchor:v56 constant:1.0];
    v67[0] = v55;
    id v54 = [v4 leadingAnchor];
    v53 = [(UIView *)self->_roundedRectView leadingAnchor];
    v52 = [v54 constraintEqualToAnchor:v53 constant:1.0];
    v67[1] = v52;
    objc_super v51 = [v4 trailingAnchor];
    id v50 = [(UIView *)self->_roundedRectView trailingAnchor];
    id v49 = [v51 constraintEqualToAnchor:v50 constant:-1.0];
    v67[2] = v49;
    v48 = [v4 heightAnchor];
    id v47 = [v48 constraintEqualToConstant:145.0];
    v67[3] = v47;
    v46 = [(ExtensionsBannerAttributionView *)self->_bannerAttributionView topAnchor];
    v45 = [v4 bottomAnchor];
    id v44 = [v46 constraintEqualToAnchor:v45];
    v67[4] = v44;
    v43 = [(ExtensionsBannerAttributionView *)self->_bannerAttributionView leadingAnchor];
    v42 = [(UIView *)self->_roundedRectView leadingAnchor];
    v41 = [v43 constraintEqualToAnchor:v42 constant:1.0];
    v67[5] = v41;
    id v40 = [(ExtensionsBannerAttributionView *)self->_bannerAttributionView trailingAnchor];
    v39 = [(UIView *)self->_roundedRectView trailingAnchor];
    uint64_t v38 = [v40 constraintEqualToAnchor:v39 constant:-1.0];
    v67[6] = v38;
    v37 = [(ExtensionsBannerAttributionView *)self->_bannerAttributionView bottomAnchor];
    id v36 = [(UIView *)self->_roundedRectView bottomAnchor];
    id v35 = [v37 constraintEqualToAnchor:v36 constant:-1.0];
    v67[7] = v35;
    v34 = [(UIView *)self->_roundedRectView topAnchor];
    v33 = [(UIView *)self->_bannerViewContainerView topAnchor];
    id v32 = [v34 constraintEqualToAnchor:v33];
    v67[8] = v32;
    uint64_t v31 = [(UIView *)self->_roundedRectView bottomAnchor];
    v21 = [(UIView *)self->_bannerViewContainerView bottomAnchor];
    v22 = [v31 constraintEqualToAnchor:v21];
    v67[9] = v22;
    [(UIView *)self->_roundedRectView leadingAnchor];
    v23 = id v58 = v4;
    id v24 = [(UIView *)self->_bannerViewContainerView leadingAnchor];
    v25 = [v23 constraintEqualToAnchor:v24 constant:16.0];
    v67[10] = v25;
    id v26 = [(UIView *)self->_roundedRectView trailingAnchor];
    v27 = [(UIView *)self->_bannerViewContainerView trailingAnchor];
    v28 = [v26 constraintEqualToAnchor:v27 constant:-16.0];
    v67[11] = v28;
    double v29 = +[NSArray arrayWithObjects:v67 count:12];
    +[NSLayoutConstraint activateConstraints:v29];

    id v4 = v58;
    double v30 = [(ContaineeViewController *)self cardPresentationController];
    [v30 updateHeightForCurrentLayout];
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

- (void)didChangeLayout:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RidesharingConfirmedRideViewController;
  [(ExtensionsStackViewController *)&v6 didChangeLayout:"didChangeLayout:"];
  if (a3 == 3)
  {
    id v5 = [(RidesharingConfirmedRideViewController *)self analyticsBookedSession];
    [v5 setViewedDetails:1];
  }
}

- (id)stackedViews
{
  bannerViewContainerView = self->_bannerViewContainerView;
  v7[0] = self->_routeFromToView;
  v7[1] = bannerViewContainerView;
  primaryDetailsView = self->_primaryDetailsView;
  v7[2] = self->_feedbackView;
  v7[3] = primaryDetailsView;
  openAppView = self->_openAppView;
  void v7[4] = self->_secondaryDetailsView;
  v7[5] = openAppView;
  id v5 = +[NSArray arrayWithObjects:v7 count:6];

  return v5;
}

- (double)heightForLayout:(unint64_t)a3
{
  remoteViewController = self->_remoteViewController;
  objc_super v6 = [(RidesharingConfirmedRideViewController *)self rideStatus];
  unsigned int v7 = [v6 shouldShowFeedbackControls];

  if (a3 - 3 < 2)
  {
    v13 = [(ContaineeViewController *)self cardPresentationController];
    [v13 availableHeight];
    double v8 = v14;
  }
  else if (a3 == 2)
  {
    [(RidesharingConfirmedRideViewController *)self headerAndRouteFromToViewHeight];
    double v16 = v15;
    double height = UILayoutFittingCompressedSize.height;
    -[UIView systemLayoutSizeFittingSize:](self->_bannerViewContainerView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, height);
    double v19 = v16 + v18;
    double v20 = 0.0;
    double v21 = 0.0;
    if (remoteViewController) {
      -[ExtensionsBannerAttributionView systemLayoutSizeFittingSize:](self->_bannerAttributionView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, height);
    }
    double v22 = v19 + v21;
    if (v7)
    {
      -[ExtensionsFeedbackView systemLayoutSizeFittingSize:](self->_feedbackView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, height);
      double v20 = v23;
    }
    return v22 + v20;
  }
  else
  {
    double v8 = -1.0;
    if (a3 == 1)
    {
      id v9 = [(ContaineeViewController *)self cardPresentationController];
      [v9 bottomSafeOffset];
      double v11 = v10;
      [(RidesharingConfirmedRideViewController *)self headerAndRouteFromToViewHeight];
      double v8 = v11 + v12;
    }
  }
  return v8;
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

- (CGSize)minimumSizeForRemoteViewController:(id)a3
{
  double v3 = [(RidesharingConfirmedRideViewController *)self view];
  [v3 frame];
  double v5 = v4 + -32.0;

  double v6 = 145.0;
  double v7 = v5;
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (CGSize)maximumSizeForRemoteViewController:(id)a3
{
  double v3 = [(RidesharingConfirmedRideViewController *)self view];
  [v3 frame];
  double v5 = v4 + -32.0;

  double v6 = 145.0;
  double v7 = v5;
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (void)remoteViewControllerServiceDidTerminate:(id)a3
{
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = 0;

  self->_hasEverRequestedRemoteViewController = 0;
  id v5 = [(RidesharingConfirmedRideViewController *)self rideStatus];
  [(RidesharingConfirmedRideViewController *)self _updateFromRideStatus:v5];
}

- (void)dealloc
{
  id v3 = [(INUIRemoteViewController *)self->_remoteViewController disconnect];
  v4.receiver = self;
  v4.super_class = (Class)RidesharingConfirmedRideViewController;
  [(RidesharingConfirmedRideViewController *)&v4 dealloc];
}

- (void)presentCustomTipAlert:(id)a3
{
}

- (void)getCanCallPhoneNumber:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    cachedContactUrl = self->_cachedContactUrl;
    self->_cachedContactUrl = 0;

    if (!v6)
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
      goto LABEL_8;
    }
    id v9 = +[UIApplication sharedApplication];
    double v10 = [v6 stringValue];
    [v9 getCanCallPhoneNumber:v10 completion:v7];
  }
  else
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v11 = 136446978;
      double v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingConfirmedRideViewController.m";
      __int16 v13 = 1024;
      int v14 = 760;
      __int16 v15 = 2082;
      double v16 = "-[RidesharingConfirmedRideViewController getCanCallPhoneNumber:completion:]";
      __int16 v17 = 2082;
      double v18 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", (uint8_t *)&v11, 0x26u);
    }
  }

LABEL_8:
}

- (INUIRemoteViewController)_remoteViewController
{
  return self->_remoteViewController;
}

- (void)set_remoteViewController:(id)a3
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

- (RideBookingRideStatus)rideStatus
{
  return self->_rideStatus;
}

- (void)setRideStatus:(id)a3
{
}

- (void)setCancelButton:(id)a3
{
}

- (void)setContactButton:(id)a3
{
}

- (void)setCompletedButton:(id)a3
{
}

- (RideBookingRequestRideOptionProxy)requestRideOptionProxy
{
  return self->_requestRideOptionProxy;
}

- (void)setRequestRideOptionProxy:(id)a3
{
}

- (RideBookingRideStatusObserverProxy)rideStatusObserverProxy
{
  return self->_rideStatusObserverProxy;
}

- (void)setRideStatusObserverProxy:(id)a3
{
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (_MXExtensionManager)extensionManager
{
  return self->_extensionManager;
}

- (void)setExtensionManager:(id)a3
{
}

- (_MXExtension)extensionForUI
{
  return self->_extensionForUI;
}

- (void)setExtensionForUI:(id)a3
{
}

- (RidesharingAnalyticsBookedSession)analyticsBookedSession
{
  return self->_analyticsBookedSession;
}

- (void)setAnalyticsBookedSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsBookedSession, 0);
  objc_storeStrong((id *)&self->_extensionForUI, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_rideStatusObserverProxy, 0);
  objc_storeStrong((id *)&self->_requestRideOptionProxy, 0);
  objc_storeStrong((id *)&self->_completedButton, 0);
  objc_storeStrong((id *)&self->_contactButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_rideStatus, 0);
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_cachedContactUrl, 0);
  objc_storeStrong((id *)&self->_driverPhoneNumber, 0);
  objc_storeStrong((id *)&self->_openAppView, 0);
  objc_storeStrong((id *)&self->_secondaryDetailsView, 0);
  objc_storeStrong((id *)&self->_primaryDetailsView, 0);
  objc_storeStrong((id *)&self->_feedbackView, 0);
  objc_storeStrong((id *)&self->_bannerAttributionView, 0);
  objc_storeStrong((id *)&self->_templatedBannerView, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_bannerViewContainerView, 0);
  objc_storeStrong((id *)&self->_roundedRectView, 0);
  objc_storeStrong((id *)&self->_feedbackHeaderView, 0);
  objc_storeStrong((id *)&self->_routeFromToView, 0);

  objc_storeStrong((id *)&self->_containerHeaderView, 0);
}

@end