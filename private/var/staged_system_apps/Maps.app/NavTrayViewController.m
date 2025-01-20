@interface NavTrayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isEligibleToShowFindMyButton;
- (BOOL)_isEligibleToShowWalkingButton;
- (BOOL)_isSharingTrip;
- (BOOL)_isWaypointRemovable:(id)a3;
- (BOOL)_shouldEnableAddStop;
- (BOOL)_shouldEnableShareETAForRoute:(id)a3 disabledForReasons:(id *)a4;
- (BOOL)_shouldEnableTrafficIncidentsForRoute:(id)a3 disabledForReasons:(id *)a4;
- (BOOL)_shouldEnableVoiceVolumeControl;
- (BOOL)enableShareETA;
- (BOOL)enableTrafficIncidents;
- (BOOL)forceCurrentWidthForHeaderHeightCalculations;
- (BOOL)isConnectedToCarPlay;
- (BOOL)isInArrivalState;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (ContentSizedTableView)shareETADisclosureTableView;
- (GEOComposedRoute)route;
- (NSArray)receivingContacts;
- (NSArray)waypointRows;
- (NavSARAPIController)categoriesAPIController;
- (NavShareETAFooterView)shareETADisclosureFooterView;
- (PlatformController)platformController;
- (UIButton)shareETADisclosureButton;
- (UITableView)tableView;
- (UIView)contentView;
- (UIView)headerView;
- (UIView)shareETADisclosureView;
- (_TtC4Maps28NavigationWaypointController)waypointController;
- (double)_shareETADisclosureHeight;
- (double)_shareETADisclosureTopPosition;
- (double)heightForLayout:(unint64_t)a3;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_backgroundImageTintColorForAction:(unint64_t)a3;
- (id)_delegate;
- (id)_foregroundColorForButtonType:(unint64_t)a3;
- (id)_imageForAction:(unint64_t)a3;
- (id)_imageTintColorForAction:(unint64_t)a3;
- (id)_titleTextForAction:(unint64_t)a3;
- (id)_traySectionsDescription;
- (id)initForNavigationWithDelegate:(id)a3 guidanceObserver:(id)a4 platformController:(id)a5;
- (id)initForSteppingWithDelegate:(id)a3 platformController:(id)a4;
- (id)mapItemMuid;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_commonInit;
- (void)_computeSections;
- (void)_handleArrivalAtEndOfLegIndex:(unint64_t)a3 forced:(BOOL)a4 service:(id)a5;
- (void)_handleArrivalAtEndOfLegIndex:(unint64_t)a3 service:(id)a4;
- (void)_maneuverBannerViewEVStationsNotification:(id)a3;
- (void)_pressedCustomRoute;
- (void)_pressedDetails;
- (void)_pressedEndRoute;
- (void)_pressedFindMy;
- (void)_pressedOtherStations;
- (void)_pressedPauseRoute;
- (void)_pressedReport;
- (void)_pressedResumeRoute;
- (void)_pressedSAR;
- (void)_pressedShareETADisclosureButton;
- (void)_pressedShareETAInTray;
- (void)_pressedVoiceVolume;
- (void)_pressedWalkingRoute;
- (void)_resumeNavigation;
- (void)_resumedFromSAR;
- (void)_sceneConnectionsDidChange:(id)a3;
- (void)_startTimerToDismissInitialBanner;
- (void)_startTimerToDisplayInitialBanner;
- (void)_updateArrivalState;
- (void)_updateShareETADisclosure;
- (void)_updateWithRoute:(id)a3;
- (void)applyAlphaToContent:(double)a3;
- (void)cellDidFinishRingAnimation:(id)a3;
- (void)didChangeLayout:(unint64_t)a3;
- (void)feedbackViewDidSelectThumbsDown;
- (void)feedbackViewDidSelectThumbsUp;
- (void)handleDismissAction:(id)a3;
- (void)incidentsReportingEnablementDidUpdate;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6;
- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6;
- (void)navigationService:(id)a3 didUpdateAlternateWalkingRoute:(id)a4;
- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4;
- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6;
- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)navigationService:(id)a3 didUpdateNavTrayGuidance:(id)a4;
- (void)navigationService:(id)a3 didUpdateTargetLegIndex:(unint64_t)a4;
- (void)navigationService:(id)a3 didUpdateVehicleParkingInfo:(id)a4;
- (void)navigationWaypointController:(id)a3 didUpdateDisplayedWaypoints:(id)a4;
- (void)offlineMapsStateChanged;
- (void)pressedDeleteOnCell:(id)a3;
- (void)pressedHeaderView;
- (void)pressedPhoneCallOnCell:(id)a3;
- (void)setCategoriesAPIController:(id)a3;
- (void)setConnectedToCarPlay:(BOOL)a3;
- (void)setCurrentStepIndex:(unint64_t)a3;
- (void)setIsInArrivalState:(BOOL)a3;
- (void)setPlatformController:(id)a3;
- (void)setReceivingContacts:(id)a3;
- (void)sharedTripService:(id)a3 didUpdateReceivers:(id)a4;
- (void)sharedTripService:(id)a3 sharingDidInvalidateWithError:(id)a4;
- (void)sharedTripServiceDidUpdateSendingAvailability:(id)a3;
- (void)styleButton:(id)a3 ofType:(unint64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatedHeight;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willChangeContainerStyle:(unint64_t)a3;
- (void)willChangeLayout:(unint64_t)a3;
@end

@implementation NavTrayViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)initForSteppingWithDelegate:(id)a3 platformController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NavTrayViewController;
  v8 = [(NavTrayViewController *)&v13 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    [(NavTrayViewController *)v8 _commonInit];
    objc_storeWeak((id *)&v9->_steppingDelegate, v6);
    v9->_isSteppingMode = 1;
    uint64_t v10 = +[NavTrayMetrics defaultMetrics];
    metrics = v9->_metrics;
    v9->_metrics = (NavTrayMetrics *)v10;

    objc_storeWeak((id *)&v9->_platformController, v7);
  }

  return v9;
}

- (id)initForNavigationWithDelegate:(id)a3 guidanceObserver:(id)a4 platformController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)NavTrayViewController;
  v11 = [(NavTrayViewController *)&v18 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    [(NavTrayViewController *)v11 _commonInit];
    objc_storeWeak((id *)&v12->_navigationDelegate, v8);
    objc_storeStrong((id *)&v12->_guidanceObserver, a4);
    objc_storeWeak((id *)&v12->_platformController, v10);
    uint64_t v13 = +[NavTrayMetrics defaultMetrics];
    metrics = v12->_metrics;
    v12->_metrics = (NavTrayMetrics *)v13;

    v15 = +[MNNavigationService sharedService];
    [v15 registerObserver:v12];

    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v12 selector:"_resumedFromSAR" name:@"NavModeControllerResumeOriginalDestinationNotification" object:0];
  }
  return v12;
}

- (void)_commonInit
{
  v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 setBlurInCardView:0];

  v4 = +[UIColor colorNamed:@"NavigationMaterialColor"];
  v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 setCardColor:v4];

  id v6 = [(ContaineeViewController *)self cardPresentationController];
  [v6 setAllowsSwipeToDismiss:0];

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"offlineMapsStateChanged" name:@"UsingOfflineMapsStateChangedNotification" object:0];

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"_sceneConnectionsDidChange:" name:UISceneWillConnectNotification object:0];

  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"_sceneConnectionsDidChange:" name:UISceneDidDisconnectNotification object:0];

  [(NavTrayViewController *)self setConnectedToCarPlay:+[UIApplication _maps_isAnySceneConnectedForRole:_UIWindowSceneSessionRoleCarPlay]];
  id v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"_maneuverBannerViewEVStationsNotification:" name:off_1015E2B10 object:0];
}

- (void)viewDidLoad
{
  v3 = [(NavTrayViewController *)self view];
  [v3 setAccessibilityIdentifier:@"NavTray"];

  v4 = (UIView *)objc_opt_new();
  contentView = self->_contentView;
  self->_contentView = v4;

  [(UIView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_contentView setAlpha:0.0];
  [(UIView *)self->_contentView setAccessibilityIdentifier:@"NavTrayContent"];
  id v6 = [(NavTrayViewController *)self view];
  [v6 addSubview:self->_contentView];

  v149.receiver = self;
  v149.super_class = (Class)NavTrayViewController;
  [(ContaineeViewController *)&v149 viewDidLoad];
  if (!self->_isSteppingMode)
  {
    id v7 = +[MSPSharedTripService sharedInstance];
    [v7 addSendingObserver:self];
  }
  id v8 = [(ContaineeViewController *)self cardPresentationController];
  [v8 setFirstCard:1];

  id v9 = [(ContaineeViewController *)self cardPresentationController];
  [v9 setEdgeAttachedRegularHeightDimmingBehavior:2];

  if (self->_isSteppingMode)
  {
    id v10 = +[MNNavigationService sharedService];
    v11 = [v10 route];
    route = self->_route;
    self->_route = v11;

    uint64_t v13 = [[StepTrayHeaderView alloc] initWithDelegate:self metrics:self->_metrics];
    stepHeaderView = self->_stepHeaderView;
    self->_stepHeaderView = v13;

    objc_storeStrong((id *)&self->_headerView, self->_stepHeaderView);
    [(NavTrayViewController *)self _computeSections];
  }
  else
  {
    v15 = [[NavTrayHeaderView alloc] initWithDelegate:self metrics:self->_metrics];
    navHeaderView = self->_navHeaderView;
    self->_navHeaderView = v15;

    [(GuidanceObserver *)self->_guidanceObserver addOutlet:self->_navHeaderView forOwner:self];
    v17 = +[MNNavigationService sharedService];
    objc_super v18 = [GuidanceETA alloc];
    v19 = [v17 displayEtaInfo];
    v20 = [v17 remainingDistanceInfo];
    v21 = [v17 batteryChargeInfo];
    v22 = [v17 upcomingStop];
    v23 = [v22 timezone];
    v24 = -[GuidanceETA initWithDisplayETA:remainingDistance:batteryChargeInfo:destinationTimeZone:transportType:](v18, "initWithDisplayETA:remainingDistance:batteryChargeInfo:destinationTimeZone:transportType:", v19, v20, v21, v23, [v17 navigationTransportType]);
    [(NavTrayHeaderView *)self->_navHeaderView setETA:v24];

    objc_storeStrong((id *)&self->_headerView, self->_navHeaderView);
  }
  [(UIView *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v25) = 1148846080;
  [(UIView *)self->_headerView setContentCompressionResistancePriority:0 forAxis:v25];
  LODWORD(v26) = 1148846080;
  [(UIView *)self->_headerView setContentCompressionResistancePriority:1 forAxis:v26];
  v27 = [(NavTrayViewController *)self view];
  [v27 addSubview:self->_headerView];

  [(GuidanceObserver *)self->_guidanceObserver repeatAllUpdatesForOutlet:self->_navHeaderView];
  id v28 = objc_alloc((Class)UITableView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v32 = [v28 initWithFrame:CGRectZero.origin.x, y, width, height];
  tableView = self->_tableView;
  self->_tableView = v32;

  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", 0.0, 76.0, 0.0, 0.0);
  [(UITableView *)self->_tableView _setTopPadding:0.0];
  [(UITableView *)self->_tableView _setBottomPadding:0.0];
  [(UITableView *)self->_tableView setSectionHeaderHeight:0.0];
  [(UITableView *)self->_tableView setSectionFooterHeight:0.0];
  [(UITableView *)self->_tableView setAlwaysBounceVertical:0];
  v34 = +[UIColor clearColor];
  [(UITableView *)self->_tableView setBackgroundColor:v34];

  [(NavTrayMetrics *)self->_metrics defaultHorizontalPadding];
  double v36 = v35;
  [(NavTrayMetrics *)self->_metrics defaultHorizontalPadding];
  -[UITableView setLayoutMargins:](self->_tableView, "setLayoutMargins:", 0.0, v36, 0.0, v37);
  v38 = self->_tableView;
  uint64_t v39 = objc_opt_class();
  v40 = (objc_class *)objc_opt_class();
  v41 = NSStringFromClass(v40);
  [(UITableView *)v38 registerClass:v39 forCellReuseIdentifier:v41];

  v42 = self->_tableView;
  uint64_t v43 = objc_opt_class();
  v44 = (objc_class *)objc_opt_class();
  v45 = NSStringFromClass(v44);
  [(UITableView *)v42 registerClass:v43 forCellReuseIdentifier:v45];

  v46 = self->_tableView;
  uint64_t v47 = objc_opt_class();
  v48 = (objc_class *)objc_opt_class();
  v49 = NSStringFromClass(v48);
  [(UITableView *)v46 registerClass:v47 forCellReuseIdentifier:v49];

  v50 = +[UIColor colorNamed:@"NavTraySeparatorColor"];
  [(UITableView *)self->_tableView setSeparatorColor:v50];

  [(UITableView *)self->_tableView setAccessibilityIdentifier:@"NavTrayTableView"];
  v51 = [(NavTrayViewController *)self contentView];
  [v51 addSubview:self->_tableView];

  v52 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  shareETADisclosureView = self->_shareETADisclosureView;
  self->_shareETADisclosureView = v52;

  [(UIView *)self->_shareETADisclosureView setTranslatesAutoresizingMaskIntoConstraints:0];
  v54 = [(NavTrayViewController *)self view];
  [v54 addSubview:self->_shareETADisclosureView];

  v55 = -[ContentSizedTableView initWithFrame:style:]([ContentSizedTableView alloc], "initWithFrame:style:", 2, CGRectZero.origin.x, y, width, height);
  shareETADisclosureTableView = self->_shareETADisclosureTableView;
  self->_shareETADisclosureTableView = v55;

  [(ContentSizedTableView *)self->_shareETADisclosureTableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ContentSizedTableView *)self->_shareETADisclosureTableView setDelegate:self];
  [(ContentSizedTableView *)self->_shareETADisclosureTableView setDataSource:self];
  -[ContentSizedTableView setSeparatorInset:](self->_shareETADisclosureTableView, "setSeparatorInset:", 0.0, 76.0, 0.0, 0.0);
  [(ContentSizedTableView *)self->_shareETADisclosureTableView _setTopPadding:0.0];
  [(ContentSizedTableView *)self->_shareETADisclosureTableView _setBottomPadding:0.0];
  [(ContentSizedTableView *)self->_shareETADisclosureTableView setSectionHeaderHeight:0.0];
  [(ContentSizedTableView *)self->_shareETADisclosureTableView setSectionFooterHeight:0.0];
  v57 = +[UIColor clearColor];
  [(ContentSizedTableView *)self->_shareETADisclosureTableView setBackgroundColor:v57];

  [(NavTrayMetrics *)self->_metrics defaultHorizontalPadding];
  double v59 = v58;
  [(NavTrayMetrics *)self->_metrics defaultHorizontalPadding];
  -[ContentSizedTableView setLayoutMargins:](self->_shareETADisclosureTableView, "setLayoutMargins:", 0.0, v59, 0.0, v60);
  v61 = self->_shareETADisclosureTableView;
  uint64_t v62 = objc_opt_class();
  v63 = (objc_class *)objc_opt_class();
  v64 = NSStringFromClass(v63);
  [(ContentSizedTableView *)v61 registerClass:v62 forCellReuseIdentifier:v64];

  [(ContentSizedTableView *)self->_shareETADisclosureTableView setAccessibilityIdentifier:@"ShareETADisclosureTableView"];
  v65 = [NavShareETAFooterView alloc];
  v66 = +[UIColor secondaryLabelColor];
  v67 = [(NavShareETAFooterView *)v65 initWithTextColor:v66];
  shareETADisclosureFooterView = self->_shareETADisclosureFooterView;
  self->_shareETADisclosureFooterView = v67;

  v69 = (UIButton *)objc_opt_new();
  shareETADisclosureButton = self->_shareETADisclosureButton;
  self->_shareETADisclosureButton = v69;

  [(UIButton *)self->_shareETADisclosureButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_shareETADisclosureButton setUserInteractionEnabled:0];
  v71 = [(UIButton *)self->_shareETADisclosureButton titleLabel];
  [v71 setTextAlignment:1];

  v72 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle3];
  v73 = [(UIButton *)self->_shareETADisclosureButton titleLabel];
  [v73 setFont:v72];

  [(UIButton *)self->_shareETADisclosureButton setAccessibilityIdentifier:@"ShareETADisclosureButton"];
  v74 = self->_shareETADisclosureButton;
  v75 = +[UIColor _systemInteractionTintColor];
  [(UIButton *)v74 setTitleColor:v75 forState:0];

  [(UIButton *)self->_shareETADisclosureButton addTarget:self action:"_pressedShareETADisclosureButton" forControlEvents:64];
  v76 = [(NavTrayViewController *)self view];
  v77 = [(NavTrayViewController *)self contentView];
  [v76 bringSubviewToFront:v77];

  v78 = [(UIView *)self->_shareETADisclosureView topAnchor];
  v79 = [(NavTrayViewController *)self headerView];
  v80 = [v79 bottomAnchor];
  v81 = [v78 constraintEqualToAnchor:v80];
  shareETADisclosureTopConstraint = self->_shareETADisclosureTopConstraint;
  self->_shareETADisclosureTopConstraint = v81;

  v148 = [(NavTrayViewController *)self headerView];
  v146 = [v148 topAnchor];
  v147 = [(NavTrayViewController *)self view];
  v145 = [v147 topAnchor];
  v144 = [v146 constraintEqualToAnchor:v145];
  v150[0] = v144;
  v143 = [(NavTrayViewController *)self headerView];
  v141 = [v143 leadingAnchor];
  v142 = [(NavTrayViewController *)self view];
  v140 = [v142 leadingAnchor];
  v139 = [v141 constraintEqualToAnchor:v140];
  v150[1] = v139;
  v138 = [(NavTrayViewController *)self headerView];
  v136 = [v138 trailingAnchor];
  v137 = [(NavTrayViewController *)self view];
  v135 = [v137 trailingAnchor];
  v134 = [v136 constraintEqualToAnchor:v135];
  v150[2] = v134;
  v133 = [(NavTrayViewController *)self contentView];
  v131 = [v133 leadingAnchor];
  v132 = [(NavTrayViewController *)self view];
  v130 = [v132 leadingAnchor];
  v129 = [v131 constraintEqualToAnchor:v130];
  v150[3] = v129;
  v128 = [(NavTrayViewController *)self contentView];
  v126 = [v128 trailingAnchor];
  v127 = [(NavTrayViewController *)self view];
  v125 = [v127 trailingAnchor];
  v124 = [v126 constraintEqualToAnchor:v125];
  v150[4] = v124;
  v123 = [(NavTrayViewController *)self contentView];
  v121 = [v123 topAnchor];
  v122 = [(NavTrayViewController *)self headerView];
  v120 = [v122 bottomAnchor];
  v119 = [v121 constraintEqualToAnchor:v120];
  v150[5] = v119;
  v118 = [(NavTrayViewController *)self contentView];
  v116 = [v118 bottomAnchor];
  v117 = [(NavTrayViewController *)self view];
  v115 = [v117 bottomAnchor];
  v114 = [v116 constraintEqualToAnchor:v115];
  v150[6] = v114;
  v113 = [(NavTrayViewController *)self tableView];
  v111 = [v113 leadingAnchor];
  v112 = [(NavTrayViewController *)self contentView];
  v110 = [v112 leadingAnchor];
  v109 = [v111 constraintEqualToAnchor:v110];
  v150[7] = v109;
  v108 = [(NavTrayViewController *)self tableView];
  v106 = [v108 trailingAnchor];
  v107 = [(NavTrayViewController *)self contentView];
  v105 = [v107 trailingAnchor];
  v104 = [v106 constraintEqualToAnchor:v105];
  v150[8] = v104;
  v103 = [(NavTrayViewController *)self tableView];
  v101 = [v103 topAnchor];
  v102 = [(NavTrayViewController *)self contentView];
  v100 = [v102 topAnchor];
  v99 = [v101 constraintEqualToAnchor:v100];
  v150[9] = v99;
  v98 = [(NavTrayViewController *)self tableView];
  v96 = [v98 bottomAnchor];
  v97 = [(NavTrayViewController *)self contentView];
  v95 = [v97 bottomAnchor];
  v94 = [v96 constraintEqualToAnchor:v95];
  v83 = self->_shareETADisclosureTopConstraint;
  v150[10] = v94;
  v150[11] = v83;
  v84 = [(UIView *)self->_shareETADisclosureView leadingAnchor];
  v85 = [(NavTrayViewController *)self contentView];
  v86 = [v85 leadingAnchor];
  v87 = [v84 constraintEqualToAnchor:v86];
  v150[12] = v87;
  v88 = [(UIView *)self->_shareETADisclosureView trailingAnchor];
  v89 = [(NavTrayViewController *)self contentView];
  v90 = [v89 trailingAnchor];
  v91 = [v88 constraintEqualToAnchor:v90];
  v150[13] = v91;
  v92 = +[NSArray arrayWithObjects:v150 count:14];
  +[NSLayoutConstraint activateConstraints:v92];

  [(NavTrayViewController *)self _updateShareETADisclosure];
  if (self->_isSteppingMode) {
    [(NavTrayViewController *)self setCurrentStepIndex:0];
  }
  v93 = [(NavTrayViewController *)self waypointController];
  [v93 registerObserver:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v24.receiver = self;
  v24.super_class = (Class)NavTrayViewController;
  [(ContaineeViewController *)&v24 viewWillAppear:a3];
  v4 = +[MNNavigationService sharedService];
  v5 = [v4 route];
  [(NavTrayViewController *)self _updateWithRoute:v5];

  id v6 = +[TrafficIncidentLayoutManager sharedInstance];
  [v6 addObserver:self];

  id v7 = [(ContaineeViewController *)self cardPresentationController];
  [v7 setHideGrabber:1];

  id v8 = +[MSPSharedTripService sharedInstance];
  id v9 = [v8 receivers];
  [(NavTrayViewController *)self setReceivingContacts:v9];

  id v10 = [(NavTrayViewController *)self view];
  v11 = [v10 window];

  if (v11)
  {
    v12 = [(ContaineeViewController *)self cardPresentationController];
    [v12 wantsLayout:1];
  }
  if (self->_enableShareETA)
  {
    if (!self->_didDisplayInitialBanner)
    {
      uint64_t v13 = sub_100943248();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        double v26 = self;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Starting timer to show Share ETA initial banner", buf, 0xCu);
      }

      [(NavTrayViewController *)self _startTimerToDisplayInitialBanner];
    }
  }
  else if (!self->_didDisplayInitialBanner)
  {
    v14 = sub_100943248();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      double v26 = self;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}p] Not presenting Share ETA initial banner as it's not available", buf, 0xCu);
    }

    self->_didDisplayInitialBanner = 1;
  }
  v15 = +[MNNavigationService sharedService];
  v16 = [v15 arrivalInfo];
  v17 = (char *)[v16 arrivalState];

  if (v17 != (char *)-1)
  {
    if (v17)
    {
      objc_super v18 = [v15 route];
      id v19 = [v18 legIndexForStepIndex:[v15 stepIndex]];

      if ((unint64_t)(v17 - 1) > 5) {
        uint64_t v20 = 0;
      }
      else {
        uint64_t v20 = qword_100F72A68[(void)(v17 - 1)];
      }
      [(NavTrayHeaderView *)self->_navHeaderView setArrivalState:v20];
      [(NavTrayViewController *)self _handleArrivalAtEndOfLegIndex:v19 service:v15];
    }
    else
    {
      [(NavTrayViewController *)self _resumeNavigation];
    }
  }
  objc_initWeak((id *)buf, self);
  v21 = +[MSPSharedTripService sharedInstance];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10094329C;
  v22[3] = &unk_1012EC650;
  objc_copyWeak(&v23, (id *)buf);
  [v21 refreshSharingIdentityWithCompletion:v22];

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavTrayViewController;
  [(NavTrayViewController *)&v5 viewDidAppear:a3];
  self->_viewDidAppear = 1;
  v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 updateHeightForCurrentLayout];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NavTrayViewController;
  [(NavTrayViewController *)&v6 viewDidDisappear:a3];
  v4 = +[TrafficIncidentLayoutManager sharedInstance];
  [v4 removeObserver:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_phoneNumberPickerAlertController);
  [WeakRetained dismissViewControllerAnimated:0 completion:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NavTrayViewController;
  [(MapsThemeViewController *)&v19 traitCollectionDidChange:v4];
  objc_super v5 = [(NavTrayViewController *)self traitCollection];
  objc_super v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];
  if (sub_1000E93B0(v6, v7))
  {
  }
  else
  {
    id v8 = [(NavTrayViewController *)self traitCollection];
    id v9 = [v8 accessibilityContrast];
    id v10 = [v4 accessibilityContrast];

    if (v9 == v10) {
      goto LABEL_5;
    }
  }
  v11 = [(NavTrayViewController *)self tableView];
  [v11 reloadData];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100943758;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
LABEL_5:
  v12 = [(NavTrayViewController *)self traitCollection];
  int v13 = sub_100045060(v4, v12);

  if (v13)
  {
    v14 = [(NavTrayViewController *)self traitCollection];
    id v15 = [v14 isLuminanceReduced];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10094379C;
    v16[3] = &unk_1012E6300;
    char v17 = (char)v15;
    v16[4] = self;
    +[UIView _maps_animateForAndromeda:v15 animations:v16];
  }
}

- (void)setReceivingContacts:(id)a3
{
  id v4 = a3;
  objc_super v5 = (NSArray *)[v4 copy];
  receivingContacts = self->_receivingContacts;
  self->_receivingContacts = v5;

  id v7 = sub_100943248();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v15 = 134349314;
    v16 = self;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Updated receiving contacts: %@", (uint8_t *)&v15, 0x16u);
  }

  [(NavTrayViewController *)self _updateShareETADisclosure];
  usedSections = self->_usedSections;
  if (usedSections)
  {
    id v9 = [(NSArray *)usedSections indexOfObject:&off_1013A9550];
    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = v9;
      v11 = [(NavTrayViewController *)self tableView];
      id v12 = [v11 numberOfSections];

      if ((uint64_t)v10 < (uint64_t)v12)
      {
        int v13 = [(NavTrayViewController *)self tableView];
        v14 = +[NSIndexSet indexSetWithIndex:v10];
        [v13 reloadSections:v14 withRowAnimation:5];
      }
    }
  }
}

- (void)_updateShareETADisclosure
{
  [(NavTrayViewController *)self loadViewIfNeeded];
  v3 = [(NavTrayViewController *)self route];
  id v4 = [v3 shareETAWaypointContacts];

  id v5 = [v4 count];
  unsigned int v6 = [(NavTrayViewController *)self isInArrivalState];
  id v7 = [(NavTrayViewController *)self shareETADisclosureTableView];
  id v8 = [v7 superview];

  id v9 = [(NavTrayViewController *)self shareETADisclosureButton];
  [v9 removeFromSuperview];

  id v10 = [(NavTrayViewController *)self shareETADisclosureTableView];
  [v10 removeFromSuperview];

  v11 = [(NavTrayViewController *)self receivingContacts];
  id v12 = [v11 count];

  v94 = v8;
  v95 = v4;
  if (!v12 || (v6 & 1) != 0)
  {
    if (!self->_displayingInitialBanner
      || (+[MSPSharedTripService sharedInstance],
          v31 = objc_claimAutoreleasedReturnValue(),
          unsigned int v32 = [v31 canAddReceivers],
          v31,
          ((v32 ^ 1 | v6) & 1) != 0))
    {
      v33 = [(NavTrayViewController *)self shareETADisclosureButton];
      [v33 setTitle:0 forState:0];

      v34 = [(NavTrayViewController *)self shareETADisclosureButton];
      [v34 setUserInteractionEnabled:0];

      double v35 = [(NavTrayViewController *)self shareETADisclosureView];
      uint64_t v36 = 1;
      [v35 setHidden:1];

      goto LABEL_14;
    }
    if (v5 == (id)1)
    {
      double v37 = sub_100943248();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = [v4 lastObject];
        uint64_t v39 = [v38 contact];
        v40 = +[AddressBookManager sharedManager];
        v41 = [v40 meCard];
        v42 = [v41 identifier];
        *(_DWORD *)buf = 134349571;
        v100 = self;
        __int16 v101 = 2113;
        v102 = v39;
        __int16 v103 = 2113;
        v104 = v42;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "[%{public}p] Will show share ETA disclosure for contact: %{private}@, with meIdentifier: %{private}@", buf, 0x20u);
      }
      uint64_t v43 = [(NavTrayViewController *)self shareETADisclosureView];
      v44 = [(NavTrayViewController *)self shareETADisclosureTableView];
      [v43 addSubview:v44];

      v92 = [(ContentSizedTableView *)self->_shareETADisclosureTableView leadingAnchor];
      v89 = [(UIView *)self->_shareETADisclosureView leadingAnchor];
      v86 = [v92 constraintEqualToAnchor:v89];
      v98[0] = v86;
      v83 = [(ContentSizedTableView *)self->_shareETADisclosureTableView trailingAnchor];
      v45 = [(UIView *)self->_shareETADisclosureView trailingAnchor];
      v46 = [v83 constraintEqualToAnchor:v45];
      v98[1] = v46;
      uint64_t v47 = [(ContentSizedTableView *)self->_shareETADisclosureTableView topAnchor];
      v48 = [(UIView *)self->_shareETADisclosureView topAnchor];
      v49 = [v47 constraintEqualToAnchor:v48];
      v98[2] = v49;
      v50 = [(ContentSizedTableView *)self->_shareETADisclosureTableView bottomAnchor];
      v51 = [(UIView *)self->_shareETADisclosureView bottomAnchor];
      v52 = [v50 constraintEqualToAnchor:v51];
      v98[3] = v52;
      v53 = +[NSArray arrayWithObjects:v98 count:4];
      +[NSLayoutConstraint activateConstraints:v53];

      v54 = [(NavTrayViewController *)self shareETADisclosureTableView];
      [v54 reloadData];
    }
    else
    {
      v55 = +[NSBundle mainBundle];
      uint64_t v93 = [v55 localizedStringForKey:@"[NavTray] Share ETA Hint" value:@"localized string not found" table:0];

      v56 = [(NavTrayViewController *)self shareETADisclosureButton];
      [v56 setTitle:v93 forState:0];

      v57 = [(NavTrayViewController *)self shareETADisclosureButton];
      [v57 setUserInteractionEnabled:1];

      double v58 = [(NavTrayViewController *)self shareETADisclosureView];
      double v59 = [(NavTrayViewController *)self shareETADisclosureButton];
      [v58 addSubview:v59];

      v90 = [(UIButton *)self->_shareETADisclosureButton leadingAnchor];
      v87 = [(UIView *)self->_shareETADisclosureView leadingAnchor];
      [(NavTrayMetrics *)self->_metrics defaultHorizontalPadding];
      v84 = [v90 constraintEqualToAnchor:v87];
      v97[0] = v84;
      v81 = [(UIButton *)self->_shareETADisclosureButton trailingAnchor];
      double v60 = [(UIView *)self->_shareETADisclosureView trailingAnchor];
      [(NavTrayMetrics *)self->_metrics defaultHorizontalPadding];
      uint64_t v62 = [v81 constraintEqualToAnchor:v60 constant:-v61];
      v97[1] = v62;
      v63 = [(UIButton *)self->_shareETADisclosureButton topAnchor];
      v64 = [(UIView *)self->_shareETADisclosureView topAnchor];
      v65 = [v63 constraintEqualToAnchor:v64];
      v97[2] = v65;
      v66 = [(UIButton *)self->_shareETADisclosureButton bottomAnchor];
      v67 = [(UIView *)self->_shareETADisclosureView bottomAnchor];
      v68 = [v66 constraintEqualToAnchor:v67];
      v97[3] = v68;
      v69 = +[NSArray arrayWithObjects:v97 count:4];
      +[NSLayoutConstraint activateConstraints:v69];

      v54 = (void *)v93;
    }

    v70 = [(NavTrayViewController *)self shareETADisclosureView];
    [v70 setHidden:0];
  }
  else
  {
    int v13 = +[NSBundle mainBundle];
    v14 = [v13 localizedStringForKey:@"[NavTray] Sharing with %lu" value:@"localized string not found" table:0];
    int v15 = [(NavTrayViewController *)self receivingContacts];
    v91 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, [v15 count]);

    v16 = [(NavTrayViewController *)self shareETADisclosureButton];
    [v16 setTitle:v91 forState:0];

    __int16 v17 = [(NavTrayViewController *)self shareETADisclosureButton];
    [v17 setUserInteractionEnabled:1];

    id v18 = [(NavTrayViewController *)self shareETADisclosureView];
    [v18 setHidden:0];

    objc_super v19 = [(NavTrayViewController *)self shareETADisclosureView];
    uint64_t v20 = [(NavTrayViewController *)self shareETADisclosureButton];
    [v19 addSubview:v20];

    v88 = [(UIButton *)self->_shareETADisclosureButton leadingAnchor];
    v85 = [(UIView *)self->_shareETADisclosureView leadingAnchor];
    [(NavTrayMetrics *)self->_metrics defaultHorizontalPadding];
    v82 = [v88 constraintEqualToAnchor:v85];
    v105[0] = v82;
    v80 = [(UIButton *)self->_shareETADisclosureButton trailingAnchor];
    v21 = [(UIView *)self->_shareETADisclosureView trailingAnchor];
    [(NavTrayMetrics *)self->_metrics defaultHorizontalPadding];
    id v23 = [v80 constraintEqualToAnchor:v21 constant:-v22];
    v105[1] = v23;
    objc_super v24 = [(UIButton *)self->_shareETADisclosureButton topAnchor];
    double v25 = [(UIView *)self->_shareETADisclosureView topAnchor];
    double v26 = [v24 constraintEqualToAnchor:v25];
    v105[2] = v26;
    v27 = [(UIButton *)self->_shareETADisclosureButton bottomAnchor];
    id v28 = [(UIView *)self->_shareETADisclosureView bottomAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    v105[3] = v29;
    v30 = +[NSArray arrayWithObjects:v105 count:4];
    +[NSLayoutConstraint activateConstraints:v30];
  }
  uint64_t v36 = 0;
LABEL_14:
  v71 = sub_100943248();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
  {
    v72 = [(NavTrayViewController *)self shareETADisclosureButton];
    v73 = [v72 titleForState:0];
    *(_DWORD *)buf = 134349314;
    v100 = self;
    __int16 v101 = 2112;
    v102 = v73;
    _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "[%{public}p] Share ETA disclosure is now: %@", buf, 0x16u);
  }
  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472;
  v96[2] = sub_10094455C;
  v96[3] = &unk_1012E5D08;
  v96[4] = self;
  +[UIView performWithoutAnimation:v96];
  [(UIView *)self->_shareETADisclosureView setHidden:v36];
  v74 = [(NavTrayViewController *)self shareETADisclosureButton];
  v75 = [v74 superview];
  if (v75) {
    BOOL v76 = [(NavTrayViewController *)self isInArrivalState];
  }
  else {
    BOOL v76 = 1;
  }
  v77 = [(NavTrayHeaderView *)self->_navHeaderView hairlineView];
  [v77 setHidden:v76];

  [(NavTrayViewController *)self _shareETADisclosureTopPosition];
  -[NSLayoutConstraint setConstant:](self->_shareETADisclosureTopConstraint, "setConstant:");
  if (!v94)
  {
    v78 = [(NavTrayViewController *)self shareETADisclosureTableView];
    v79 = [v78 superview];

    if (v79) {
      +[GEOAPPortal captureUserAction:45 target:91 value:0];
    }
  }
}

- (void)_updateWithRoute:(id)a3
{
  id v5 = (GEOComposedRoute *)a3;
  id v36 = 0;
  BOOL v6 = [(NavTrayViewController *)self _shouldEnableShareETAForRoute:v5 disabledForReasons:&v36];
  unsigned int v32 = (char *)v36;
  id v35 = 0;
  BOOL v7 = [(NavTrayViewController *)self _shouldEnableTrafficIncidentsForRoute:v5 disabledForReasons:&v35];
  id v8 = v35;
  route = self->_route;
  if (route != v5)
  {
    id v10 = sub_100943248();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = [(GEOComposedRoute *)v5 uniqueRouteID];
      *(_DWORD *)buf = 134349314;
      v38 = self;
      __int16 v39 = 2114;
      v40 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Updating route: %{public}@", buf, 0x16u);
    }
    objc_storeStrong((id *)&self->_route, a3);
    id v12 = [(NavTrayViewController *)self route];
    BOOL v13 = [v12 transportType] == 2;

    if (v13)
    {
      [(NavTrayViewController *)self setCategoriesAPIController:0];
    }
    else
    {
      v14 = [(NavTrayViewController *)self categoriesAPIController];
      BOOL v15 = v14 == 0;

      if (v15)
      {
        v16 = objc_alloc_init(NavSARAPIController);
        [(NavTrayViewController *)self setCategoriesAPIController:v16];
      }
      objc_initWeak((id *)buf, self);
      __int16 v17 = [(NavTrayViewController *)self categoriesAPIController];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100944CE4;
      v33[3] = &unk_1012E6708;
      objc_copyWeak(&v34, (id *)buf);
      [v17 fetchSARCategoriesOnCompletionHandler:v33];

      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)buf);
    }
    self->_analyticsTarget = [(NavTrayViewController *)self currentUITargetForAnalytics];
    id v18 = [(GEOComposedRoute *)self->_route destination];
    objc_super v19 = [v18 navDisplayName];

    if ([v19 length])
    {
      [(NavTrayHeaderView *)self->_navHeaderView setDestinationName:v19];
    }
    else
    {
      uint64_t v20 = +[NSBundle mainBundle];
      v21 = [v20 localizedStringForKey:@"[NavTray] Default Rerouting Title" value:@"localized string not found" table:0];
      [(NavTrayHeaderView *)self->_navHeaderView setDestinationName:v21];
    }
    if (self->_isSteppingMode) {
      [(NavTrayViewController *)self setCurrentStepIndex:0];
    }
  }
  if (self->_enableTrafficIncidents == v7 && self->_enableShareETA == v6)
  {
    if (route == v5) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  self->_enableShareETA = v6;
  double v22 = sub_100943248();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
  if (!v6)
  {
    if (v23)
    {
      *(_DWORD *)buf = 134349314;
      v38 = self;
      __int16 v39 = 2114;
      v40 = v32;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%{public}p] Share ETA action is now disabled for reasons: %{public}@", buf, 0x16u);
    }
    goto LABEL_30;
  }
  if (v23)
  {
    *(_DWORD *)buf = 134349056;
    v38 = self;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%{public}p] Share ETA action is now enabled", buf, 0xCu);
  }

  if ([v32 count])
  {
    objc_super v24 = sub_1005762E4();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v38 = (NavTrayViewController *)"-[NavTrayViewController _updateWithRoute:]";
      __int16 v39 = 2080;
      v40 = "NavTrayViewController.m";
      __int16 v41 = 1024;
      int v42 = 646;
      __int16 v43 = 2080;
      v44 = "sharingDisabledReasons.count == 0";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      double v22 = sub_1005762E4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        double v25 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v38 = v25;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
LABEL_30:
    }
  }
  self->_enableTrafficIncidents = v7;
  double v26 = sub_100943248();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v27)
    {
      *(_DWORD *)buf = 134349056;
      v38 = self;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "[%{public}p] Report Incident action is now enabled", buf, 0xCu);
    }

    if (![v8 count]) {
      goto LABEL_43;
    }
    id v28 = sub_1005762E4();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v38 = (NavTrayViewController *)"-[NavTrayViewController _updateWithRoute:]";
      __int16 v39 = 2080;
      v40 = "NavTrayViewController.m";
      __int16 v41 = 1024;
      int v42 = 654;
      __int16 v43 = 2080;
      v44 = "reportingDisabledReasons.count == 0";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (!sub_100BB36BC()) {
      goto LABEL_43;
    }
    double v26 = sub_1005762E4();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v29 = +[NSThread callStackSymbols];
      *(_DWORD *)buf = 138412290;
      v38 = v29;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  else if (v27)
  {
    *(_DWORD *)buf = 134349314;
    v38 = self;
    __int16 v39 = 2114;
    v40 = (const char *)v8;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "[%{public}p] Report Incident action is now disabled for reasons: %{public}@", buf, 0x16u);
  }

LABEL_43:
  [(NavTrayViewController *)self _computeSections];
  v30 = [(NavTrayViewController *)self tableView];
  [v30 reloadData];

  v31 = [(ContaineeViewController *)self cardPresentationController];
  [v31 updateHeightForCurrentLayout];

LABEL_44:
}

- (void)setConnectedToCarPlay:(BOOL)a3
{
  if (self->_connectedToCarPlay != a3)
  {
    self->_connectedToCarPladouble y = a3;
    if ([(NavTrayViewController *)self isInArrivalState])
    {
      id v6 = +[MNNavigationService sharedService];
      id v4 = [v6 route];
      id v5 = [v4 legIndexForStepIndex:[v6 stepIndex]];

      [(NavTrayViewController *)self _handleArrivalAtEndOfLegIndex:v5 forced:1 service:v6];
    }
  }
}

- (id)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                            + OBJC_IVAR___NavTrayViewController__steppingDelegate[4
                                                                                                * !self->_isSteppingMode]));

  return WeakRetained;
}

- (_TtC4Maps28NavigationWaypointController)waypointController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);
  id v4 = [WeakRetained currentNavigationSession];
  id v5 = [v4 waypointController];

  if (!v5)
  {
    id v6 = sub_100943248();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v8 = 134349056;
      id v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "[%{public}p] Couldn't find a navigation waypoint controller within NavTrayViewController.", (uint8_t *)&v8, 0xCu);
    }
  }

  return (_TtC4Maps28NavigationWaypointController *)v5;
}

- (NSArray)waypointRows
{
  waypointRows = self->_waypointRows;
  if (!waypointRows)
  {
    id v4 = +[MNNavigationService sharedService];
    id v5 = [(NavTrayViewController *)self waypointController];
    id v6 = [v5 displayedWaypoints];
    BOOL v7 = +[NavTrayWaypointRow waypointRowsFromNavigationService:v4 withWaypoints:v6];
    int v8 = self->_waypointRows;
    self->_waypointRows = v7;

    waypointRows = self->_waypointRows;
  }

  return waypointRows;
}

- (void)_computeSections
{
  v3 = (NSDictionary *)objc_opt_new();
  id v4 = (NSArray *)objc_opt_new();
  id v5 = [(NavTrayViewController *)self waypointRows];
  [(NSDictionary *)v3 setObject:v5 forKeyedSubscript:&off_1013A9538];

  [(NSArray *)v4 addObject:&off_1013A9538];
  id v6 = objc_opt_new();
  if (self->_isSteppingMode)
  {
    BOOL v7 = &off_1013A9580;
LABEL_11:
    [v6 addObject:v7];
    goto LABEL_12;
  }
  if ([(NavTrayViewController *)self _shouldEnableAddStop]) {
    [v6 addObject:&off_1013A9598];
  }
  if ([(NavTrayViewController *)self enableShareETA]) {
    [v6 addObject:&off_1013A95B0];
  }
  if ([(NavTrayViewController *)self enableTrafficIncidents]) {
    [v6 addObject:&off_1013A95C8];
  }
  if ([(NavTrayViewController *)self _shouldEnableVoiceVolumeControl])
  {
    BOOL v7 = &off_1013A95E0;
    goto LABEL_11;
  }
LABEL_12:
  [(NSDictionary *)v3 setObject:v6 forKeyedSubscript:&off_1013A9550];
  [(NSArray *)v4 addObject:&off_1013A9550];
  [(NSDictionary *)v3 setObject:&off_1013AE2F8 forKeyedSubscript:&off_1013A9568];
  [(NSArray *)v4 addObject:&off_1013A9568];
  traySections = self->_traySections;
  self->_traySections = v3;
  id v9 = v3;

  usedSections = self->_usedSections;
  self->_usedSections = v4;

  v11 = sub_100943248();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [(NavTrayViewController *)self _traySectionsDescription];
    int v13 = 134349314;
    v14 = self;
    __int16 v15 = 2114;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Tray sections are now: %{public}@", (uint8_t *)&v13, 0x16u);
  }
}

- (id)_traySectionsDescription
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithString:@"["];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v4 = self->_usedSections;
  id v45 = [(NSArray *)v4 countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v45)
  {
    uint64_t v5 = *(void *)v58;
    __int16 v43 = self;
    uint64_t v44 = *(void *)v58;
    int v42 = v4;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v58 != v5) {
          objc_enumerationMutation(v4);
        }
        uint64_t v46 = v6;
        BOOL v7 = *(void **)(*((void *)&v57 + 1) + 8 * v6);
        id v8 = [v7 unsignedIntegerValue];
        if (v8 == (id)2)
        {
          CFStringRef v36 = @"End";
LABEL_54:
          [v3 appendFormat:@"\n\t%@ {", v36];
          goto LABEL_55;
        }
        if (v8 != (id)1)
        {
          if (!v8)
          {
            [v3 appendFormat:@"\n\t%@ {", @"Waypoints"];
            id v9 = [(NSDictionary *)self->_traySections objectForKeyedSubscript:v7];
            long long v53 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            id obj = v9;
            id v10 = [v9 countByEnumeratingWithState:&v53 objects:v62 count:16];
            if (!v10) {
              goto LABEL_29;
            }
            id v11 = v10;
            uint64_t v48 = *(void *)v54;
            while (1)
            {
              id v12 = 0;
              do
              {
                int v13 = v3;
                if (*(void *)v54 != v48) {
                  objc_enumerationMutation(obj);
                }
                v14 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v12);
                id v15 = [v14 waypointIndex];
                v16 = [v14 waypoint];
                if ([v16 isServerProvidedWaypoint]) {
                  __int16 v17 = " (server-provided)";
                }
                else {
                  __int16 v17 = "";
                }
                id v18 = v14;
                if (v18)
                {
                  objc_super v19 = (objc_class *)objc_opt_class();
                  uint64_t v20 = NSStringFromClass(v19);
                  if ((objc_opt_respondsToSelector() & 1) == 0) {
                    goto LABEL_22;
                  }
                  v21 = [v18 performSelector:"accessibilityIdentifier"];
                  double v22 = v21;
                  if (v21 && ![v21 isEqualToString:v20])
                  {
                    BOOL v23 = +[NSString stringWithFormat:@"%@<%p, %@>", v20, v18, v22];
                  }
                  else
                  {

LABEL_22:
                    BOOL v23 = +[NSString stringWithFormat:@"%@<%p>", v20, v18];
                  }

                  goto LABEL_25;
                }
                BOOL v23 = @"<nil>";
LABEL_25:

                id v3 = v13;
                [v13 appendFormat:@"\n\t\tWaypoint %lu%s (%@)", v15, v17, v23];

                id v12 = (char *)v12 + 1;
              }
              while (v11 != v12);
              id v24 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
              id v11 = v24;
              if (!v24)
              {
LABEL_29:

                id v4 = v42;
                self = v43;
                uint64_t v5 = v44;
                goto LABEL_55;
              }
            }
          }
          double v37 = sub_1005762E4();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v65 = "NSString *NavTrayViewControllerSectionToString(NavTrayViewControllerSection)";
            __int16 v66 = 2080;
            v67 = "NavTrayViewController.m";
            __int16 v68 = 1024;
            int v69 = 124;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
          }

          if (sub_100BB36BC())
          {
            v38 = sub_1005762E4();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              __int16 v39 = +[NSThread callStackSymbols];
              *(_DWORD *)buf = 138412290;
              v65 = v39;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
            }
          }
          CFStringRef v36 = @"(Unknown)";
          goto LABEL_54;
        }
        [v3 appendFormat:@"\n\t%@ {", @"Actions"];
        double v25 = [(NSDictionary *)self->_traySections objectForKeyedSubscript:v7];
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v26 = [v25 countByEnumeratingWithState:&v49 objects:v61 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v50;
          do
          {
            for (i = 0; i != v27; i = (char *)i + 1)
            {
              if (*(void *)v50 != v28) {
                objc_enumerationMutation(v25);
              }
              unint64_t v30 = (unint64_t)[*(id *)(*((void *)&v49 + 1) + 8 * i) unsignedIntegerValue];
              if (v30 >= 5)
              {
                unsigned int v32 = sub_1005762E4();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v65 = "NSString *NavTrayViewControllerActionToString(NavTrayViewControllerAction)";
                  __int16 v66 = 2080;
                  v67 = "NavTrayViewController.m";
                  __int16 v68 = 1024;
                  int v69 = 104;
                  _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
                }

                unsigned int v33 = sub_100BB36BC();
                CFStringRef v31 = @"(Unknown)";
                if (v33)
                {
                  id v34 = sub_1005762E4();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                  {
                    id v35 = +[NSThread callStackSymbols];
                    *(_DWORD *)buf = 138412290;
                    v65 = v35;
                    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
                  }
                  CFStringRef v31 = @"(Unknown)";
                }
              }
              else
              {
                CFStringRef v31 = off_101302E40[v30];
              }
              [v3 appendFormat:@"\n\t\t%@", v31];
            }
            id v27 = [v25 countByEnumeratingWithState:&v49 objects:v61 count:16];
          }
          while (v27);
        }

        uint64_t v5 = v44;
LABEL_55:
        [v3 appendString:@"\n\t}"];
        uint64_t v6 = v46 + 1;
      }
      while ((id)(v46 + 1) != v45);
      id v45 = [(NSArray *)v4 countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v45);
  }

  [v3 appendString:@"\n]"];
  id v40 = [v3 copy];

  return v40;
}

- (BOOL)_shouldEnableShareETAForRoute:(id)a3 disabledForReasons:(id *)a4
{
  id v6 = a3;
  int v7 = MSPSharedTripSharingAvailable();
  [v6 transportType];

  char v8 = MSPSharedTripSharingSupportedForTransportType();
  id v9 = +[MSPSharedTripService sharedInstance];
  unsigned __int8 v10 = [v9 canAddReceivers];

  id v11 = +[MSPSharedTripService sharedInstance];
  id v12 = [v11 receivers];
  id v13 = [v12 count];

  if (self->_isSteppingMode) {
    int v14 = 0;
  }
  else {
    int v14 = v7;
  }
  if (v14 != 1)
  {
    char v16 = 0;
    if (!a4) {
      return v16;
    }
LABEL_11:
    if (v16) {
      return v16;
    }
    id v17 = [objc_alloc((Class)NSMutableArray) initWithCapacity:5];
    id v18 = v17;
    if (self->_isSteppingMode) {
      [v17 addObject:@"stepping navigation"];
    }
    if (v7)
    {
      if (v8) {
        goto LABEL_16;
      }
    }
    else
    {
      [v18 addObject:@"sharing not available"];
      if (v8)
      {
LABEL_16:
        if (v10) {
          goto LABEL_17;
        }
        goto LABEL_23;
      }
    }
    [v18 addObject:@"incompatible transport type"];
    if (v10)
    {
LABEL_17:
      if (!v13)
      {
LABEL_19:
        *a4 = [v18 copy];

        return v16;
      }
LABEL_18:
      [v18 addObject:@"no current receivers"];
      goto LABEL_19;
    }
LABEL_23:
    [v18 addObject:@"cannot add receivers"];
    if (!v13) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v13) {
    char v15 = 1;
  }
  else {
    char v15 = v10;
  }
  char v16 = v8 & v15;
  if (a4) {
    goto LABEL_11;
  }
  return v16;
}

- (BOOL)_isSharingTrip
{
  return [(NSArray *)self->_receivingContacts count] != 0;
}

- (BOOL)_shouldEnableTrafficIncidentsForRoute:(id)a3 disabledForReasons:(id *)a4
{
  unsigned int v5 = [a3 transportType];
  id v6 = +[TrafficIncidentLayoutManager sharedInstance];
  unsigned __int8 v7 = [v6 isIncidentReportingEnabled];

  if (v5) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v7;
  }
  if (a4 && !v8)
  {
    id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:5];
    unsigned __int8 v10 = v9;
    if (v5) {
      [v9 addObject:@"incompatible transport type"];
    }
    if ((v7 & 1) == 0) {
      [v10 addObject:@"incident reporting disabled"];
    }
    *a4 = [v10 copy];
  }
  return v8;
}

- (BOOL)_shouldEnableAddStop
{
  uint64_t UInteger = GEOConfigGetUInteger();
  if (!UInteger) {
    goto LABEL_15;
  }
  unint64_t v4 = UInteger;
  unsigned int v5 = [(NavTrayViewController *)self route];
  id v6 = [v5 userRequestedWaypoints];
  id v7 = [v6 count];

  if ((unint64_t)v7 >= v4) {
    return 0;
  }
LABEL_15:
  BOOL v8 = [(NavTrayViewController *)self route];
  switch([v8 transportType])
  {
    case 1u:
    case 6u:

      goto LABEL_11;
    case 2u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
      break;
    case 3u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420();
      break;
    default:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
      break;
  }
  char v11 = IsEnabled_Maps182;

  if (v11) {
    return 1;
  }
LABEL_11:
  id v12 = [(NavTrayViewController *)self categoriesAPIController];
  id v13 = [v12 categories];
  BOOL v9 = [v13 count] != 0;

  return v9;
}

- (BOOL)_shouldEnableVoiceVolumeControl
{
  return GEOConfigGetBOOL();
}

- (void)_resumedFromSAR
{
  id v3 = sub_100943248();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 134349056;
    unsigned int v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Resuming navigation to original destination", (uint8_t *)&v4, 0xCu);
  }

  [(NavTrayViewController *)self _resumeNavigation];
}

- (void)_startTimerToDisplayInitialBanner
{
  objc_initWeak(&location, self);
  id v3 = &_dispatch_main_q;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100945F2C;
  v6[3] = &unk_1012E7638;
  objc_copyWeak(&v7, &location);
  int v4 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v6 block:2.0];
  sharedTripAnimationTimer = self->_sharedTripAnimationTimer;
  self->_sharedTripAnimationTimer = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_startTimerToDismissInitialBanner
{
  objc_initWeak(&location, self);
  GEOConfigGetDouble();
  double v4 = v3;
  id v5 = &_dispatch_main_q;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1009461EC;
  v8[3] = &unk_1012E7638;
  objc_copyWeak(&v9, &location);
  id v6 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v8 block:v4];
  sharedTripAnimationTimer = self->_sharedTripAnimationTimer;
  self->_sharedTripAnimationTimer = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)navigationWaypointController:(id)a3 didUpdateDisplayedWaypoints:(id)a4
{
  waypointRows = self->_waypointRows;
  self->_waypointRows = 0;

  [(NavTrayViewController *)self _computeSections];
  id v6 = [(NavTrayViewController *)self tableView];
  [v6 reloadData];

  id v7 = [(ContaineeViewController *)self cardPresentationController];
  [v7 updateHeightForCurrentLayout];
}

- (void)pressedHeaderView
{
  double v3 = [(ContaineeViewController *)self cardPresentationController];
  id v4 = [v3 containeeLayout];

  id v5 = [(ContaineeViewController *)self cardPresentationController];
  id v7 = v5;
  if (v4 == (id)1) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  [v5 wantsLayout:v6];
}

- (void)updatedHeight
{
  id v2 = [(ContaineeViewController *)self cardPresentationController];
  [v2 updateHeightForCurrentLayout];
}

- (id)mapItemMuid
{
  id v2 = [(NavTrayViewController *)self route];
  double v3 = [v2 destination];
  id v4 = [v3 route];

  if ([v4 mapItemMuid])
  {
    id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", [v4 mapItemMuid]);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)styleButton:(id)a3 ofType:(unint64_t)a4
{
  id v112 = a3;
  id v5 = +[UIButtonConfiguration plainButtonConfiguration];
  [v5 setTitleLineBreakMode:4];
  [v5 setCornerStyle:-1];
  uint64_t v6 = +[UIBackgroundConfiguration clearConfiguration];
  [(NavTrayMetrics *)self->_metrics cornerRadius];
  [v6 setCornerRadius:];
  [v5 setBackground:v6];
  id v7 = [(NavTrayMetrics *)self->_metrics endButtonTextStyle];
  [(NavTrayMetrics *)self->_metrics endButtonFontWeight];
  double v9 = v8;
  unsigned __int8 v10 = [(NavTrayViewController *)self traitCollection];
  char v11 = [v10 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryAccessibilityLarge];
  id v12 = +[UIFont _maps_fontWithTextStyle:v7 weight:v11 compatibleWithTraitCollection:v9];

  id v13 = [(NavTrayMetrics *)self->_metrics endButtonIconTextStyle];
  [(NavTrayMetrics *)self->_metrics endButtonIconFontWeight];
  double v15 = v14;
  char v16 = [(NavTrayViewController *)self traitCollection];
  id v17 = [v16 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryAccessibilityLarge];
  id v18 = v112;
  objc_super v19 = +[UIFont _maps_fontWithTextStyle:v13 weight:v17 compatibleWithTraitCollection:v15];

  uint64_t v20 = v6;
  v21 = self;
  [v112 removeTarget:self action:0 forControlEvents:64];
  switch(a4)
  {
    case 1uLL:
      id v22 = objc_alloc((Class)NSAttributedString);
      BOOL v23 = +[NSBundle mainBundle];
      [v23 localizedStringForKey:@"[NavTray] End Title" value:@"localized string not found" table:0];
      id v24 = v107 = v19;
      v134[0] = v12;
      v133[0] = NSFontAttributeName;
      v133[1] = NSForegroundColorAttributeName;
      [(NavTrayViewController *)v21 _foregroundColorForButtonType:1];
      v26 = double v25 = v20;
      v134[1] = v26;
      id v27 = +[NSDictionary dictionaryWithObjects:v134 forKeys:v133 count:2];
      id v28 = [v22 initWithString:v24 attributes:v27];
      [v5 setAttributedTitle:v28];

      uint64_t v20 = v25;
      objc_super v19 = v107;

      v29 = +[UIColor systemRedColor];
      [v20 setBackgroundColor:v29];

      unint64_t v30 = "_pressedEndRoute";
      goto LABEL_8;
    case 2uLL:
      id v65 = objc_alloc((Class)NSAttributedString);
      __int16 v66 = +[NSBundle mainBundle];
      [v66 localizedStringForKey:@"[NavTray] Pause Title" value:@"localized string not found" table:0];
      v67 = v109 = v19;
      v132[0] = v12;
      v131[0] = NSFontAttributeName;
      v131[1] = NSForegroundColorAttributeName;
      __int16 v68 = [(NavTrayViewController *)v21 _foregroundColorForButtonType:2];
      v132[1] = v68;
      +[NSDictionary dictionaryWithObjects:v132 forKeys:v131 count:2];
      v70 = int v69 = v20;
      id v71 = [v65 initWithString:v67 attributes:v70];
      [v5 setAttributedTitle:v71];

      uint64_t v20 = v69;
      objc_super v19 = v109;

      v72 = +[UIColor systemRedColor];
      [v20 setBackgroundColor:v72];

      unint64_t v30 = "_pressedPauseRoute";
LABEL_8:
      id v18 = v112;
      long long v52 = v112;
      long long v53 = v21;
      goto LABEL_9;
    case 3uLL:
      [v5 setImagePadding:8.0];
      v108 = v19;
      CFStringRef v31 = self;
      unsigned int v32 = +[UIImageSymbolConfiguration configurationWithFont:v19 scale:[(NavTrayMetrics *)self->_metrics endButtonIconImageSymbolScale]];
      unsigned int v33 = +[UIImage _systemImageNamed:@"magnifyingglass" withConfiguration:v32];
      [v5 setImage:v33];

      id v34 = [(NavTrayViewController *)v21 _foregroundColorForButtonType:3];
      [v5 setBaseForegroundColor:v34];

      id v35 = objc_alloc((Class)NSAttributedString);
      CFStringRef v36 = +[NSBundle mainBundle];
      double v37 = [v36 localizedStringForKey:@"[NavTray] Other Stations Title" value:@"localized string not found" table:0];
      v130[0] = v12;
      v129[0] = NSFontAttributeName;
      v129[1] = NSForegroundColorAttributeName;
      v38 = [(NavTrayViewController *)v31 _foregroundColorForButtonType:3];
      v130[1] = v38;
      +[NSDictionary dictionaryWithObjects:v130 forKeys:v129 count:2];
      v40 = __int16 v39 = v20;
      id v41 = [v35 initWithString:v37 attributes:v40];
      [v5 setAttributedTitle:v41];

      uint64_t v20 = v39;
      int v42 = +[UIColor tertiarySystemFillColor];
      [v39 setBackgroundColor:v42];

      unint64_t v30 = "_pressedOtherStations";
      goto LABEL_6;
    case 4uLL:
      __int16 v43 = self;
      uint64_t v44 = [(NavTrayViewController *)self _foregroundColorForButtonType:4];
      [v5 setBaseForegroundColor:v44];

      id v45 = objc_alloc((Class)NSAttributedString);
      uint64_t v46 = +[NSBundle mainBundle];
      uint64_t v47 = [v46 localizedStringForKey:@"[NavTray] Resume Title" value:@"localized string not found" table:0];
      v128[0] = v12;
      v127[0] = NSFontAttributeName;
      v127[1] = NSForegroundColorAttributeName;
      uint64_t v48 = [(NavTrayViewController *)v43 _foregroundColorForButtonType:4];
      v128[1] = v48;
      long long v49 = +[NSDictionary dictionaryWithObjects:v128 forKeys:v127 count:2];
      id v50 = [v45 initWithString:v47 attributes:v49];
      [v5 setAttributedTitle:v50];

      uint64_t v20 = v6;
      long long v51 = +[UIColor tertiarySystemFillColor];
      [v6 setBackgroundColor:v51];

      unint64_t v30 = "_pressedResumeRoute";
      id v18 = v112;
      long long v52 = v112;
      long long v53 = v43;
      goto LABEL_9;
    case 5uLL:
      [v5 setImagePadding:8.0];
      v108 = v19;
      CFStringRef v31 = self;
      long long v54 = +[UIImageSymbolConfiguration configurationWithFont:v19 scale:[(NavTrayMetrics *)self->_metrics endButtonIconImageSymbolScale]];
      long long v55 = +[UIImage _systemImageNamed:@"findmy" withConfiguration:v54];
      [v5 setImage:v55];

      long long v56 = [(NavTrayViewController *)v21 _foregroundColorForButtonType:5];
      [v5 setBaseForegroundColor:v56];

      id v57 = objc_alloc((Class)NSAttributedString);
      long long v58 = +[NSBundle mainBundle];
      long long v59 = [v58 localizedStringForKey:@"[NavTray] Find My Title" value:@"localized string not found" table:0];
      v126[0] = v12;
      v125[0] = NSFontAttributeName;
      v125[1] = NSForegroundColorAttributeName;
      long long v60 = [(NavTrayViewController *)v31 _foregroundColorForButtonType:5];
      v126[1] = v60;
      +[NSDictionary dictionaryWithObjects:v126 forKeys:v125 count:2];
      uint64_t v62 = v61 = v20;
      id v63 = [v57 initWithString:v59 attributes:v62];
      [v5 setAttributedTitle:v63];

      uint64_t v20 = v61;
      v64 = +[UIColor tertiarySystemFillColor];
      [v61 setBackgroundColor:v64];

      unint64_t v30 = "_pressedFindMy";
LABEL_6:
      objc_super v19 = v108;
      id v18 = v112;
      long long v52 = v112;
      long long v53 = v31;
LABEL_9:
      [v52 addTarget:v53 action:v30 forControlEvents:64];
      break;
    case 6uLL:
      v73 = +[MNNavigationService sharedService];
      v110 = [v73 alternateWalkingRouteDisplayETAInfo];

      [v110 remainingMinutesToEndOfRoute];
      v74 = GEOStringForDuration();
      [v5 setImagePadding:8.0];
      v75 = +[UIImageSymbolConfiguration configurationWithFont:v19 scale:[(NavTrayMetrics *)self->_metrics endButtonIconImageSymbolScale]];
      BOOL v76 = +[UIImage _systemImageNamed:@"figure.walk" withConfiguration:v75];
      [v5 setImage:v76];

      v77 = [(NavTrayViewController *)self _foregroundColorForButtonType:6];
      [v5 setBaseForegroundColor:v77];

      id v78 = objc_alloc((Class)NSAttributedString);
      v124[0] = v12;
      v123[0] = NSFontAttributeName;
      v123[1] = NSForegroundColorAttributeName;
      v79 = [(NavTrayViewController *)self _foregroundColorForButtonType:6];
      v124[1] = v79;
      +[NSDictionary dictionaryWithObjects:v124 forKeys:v123 count:2];
      v81 = v80 = v20;
      id v82 = [v78 initWithString:v74 attributes:v81];
      [v5 setAttributedTitle:v82];

      uint64_t v20 = v80;
      v83 = +[UIColor tertiarySystemFillColor];
      [v80 setBackgroundColor:v83];

      id v18 = v112;
      [v112 addTarget:self action:"_pressedWalkingRoute" forControlEvents:64];

      break;
    case 7uLL:
      v84 = v19;
      v85 = +[MNNavigationService sharedService];
      v86 = [v85 destination];

      v111 = v86;
      v87 = [v86 route];
      v88 = v12;
      if (!v87)
      {
        __int16 v101 = sub_1005762E4();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v116 = "-[NavTrayViewController styleButton:ofType:]";
          __int16 v117 = 2080;
          v118 = "NavTrayViewController.m";
          __int16 v119 = 1024;
          int v120 = 997;
          __int16 v121 = 2080;
          v122 = "customRoute != nil";
          _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100BB36BC())
        {
          v102 = sub_1005762E4();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          {
            __int16 v103 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            v116 = v103;
            _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
          v88 = v12;
        }
      }
      unsigned int v89 = [v87 transportType] - 1;
      v105 = v20;
      if (v89 > 5) {
        CFStringRef v90 = @"car.fill";
      }
      else {
        CFStringRef v90 = off_101302E68[v89];
      }
      [v5 setImagePadding:8.0 v87];
      objc_super v19 = v84;
      v91 = +[UIImageSymbolConfiguration configurationWithFont:v84 scale:[(NavTrayMetrics *)v21->_metrics endButtonIconImageSymbolScale]];
      v92 = +[UIImage _systemImageNamed:v90 withConfiguration:v91];
      [v5 setImage:v92];

      uint64_t v93 = [(NavTrayViewController *)v21 _foregroundColorForButtonType:7];
      [v5 setBaseForegroundColor:v93];

      v94 = +[NSBundle mainBundle];
      v95 = [v94 localizedStringForKey:@"[NavTray] Start" value:@"localized string not found" table:0];

      id v96 = objc_alloc((Class)NSAttributedString);
      v114[0] = v88;
      v113[0] = NSFontAttributeName;
      v113[1] = NSForegroundColorAttributeName;
      v97 = [(NavTrayViewController *)v21 _foregroundColorForButtonType:7];
      v114[1] = v97;
      +[NSDictionary dictionaryWithObjects:v114 forKeys:v113 count:2];
      v98 = id v12 = v88;
      id v99 = [v96 initWithString:v95 attributes:v98];
      [v5 setAttributedTitle:v99];

      v100 = +[UIColor tertiarySystemFillColor];
      uint64_t v20 = v105;
      [v105 setBackgroundColor:v100];

      id v18 = v112;
      [v112 addTarget:v21 action:"_pressedCustomRoute" forControlEvents:64];

      break;
    default:
      break;
  }
  [v18 setConfiguration:v5];
}

- (void)feedbackViewDidSelectThumbsUp
{
  double v3 = [(NavTrayViewController *)self route];
  id v4 = [v3 transportType];
  if (v4 >= 7)
  {
    id v5 = +[NSString stringWithFormat:@"(unknown: %i)", v4];
  }
  else
  {
    id v5 = *(&off_101302E98 + (int)v4);
  }
  +[GEOAPPortal captureUserAction:243 target:31 value:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  [WeakRetained pressedEndWithSender:self feedback:1];
}

- (void)feedbackViewDidSelectThumbsDown
{
  double v3 = [(NavTrayViewController *)self route];
  id v4 = [v3 transportType];
  if (v4 >= 7)
  {
    id v5 = +[NSString stringWithFormat:@"(unknown: %i)", v4];
  }
  else
  {
    id v5 = *(&off_101302E98 + (int)v4);
  }
  +[GEOAPPortal captureUserAction:228 target:31 value:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  [WeakRetained pressedEndWithSender:self feedback:2];
}

- (void)handleDismissAction:(id)a3
{
}

- (void)willChangeLayout:(unint64_t)a3
{
  v20.receiver = self;
  v20.super_class = (Class)NavTrayViewController;
  [(ContaineeViewController *)&v20 willChangeLayout:"willChangeLayout:"];
  id v5 = [(ContaineeViewController *)self cardPresentationController];
  id v6 = [v5 containeeLayout];

  if (v6 && (unint64_t)v6 < a3)
  {
    id v7 = [(NavTrayViewController *)self tableView];
    [v7 reloadData];

    double v8 = [(NavTrayViewController *)self tableView];
    uint64_t v9 = (uint64_t)[v8 numberOfSections];

    if (v9 >= 3)
    {
      unsigned __int8 v10 = [(NavTrayViewController *)self tableView];
      char v11 = +[NSIndexPath indexPathForRow:0 inSection:2];
      [v10 scrollToRowAtIndexPath:v11 atScrollPosition:3 animated:0];
    }
    int analyticsTarget = self->_analyticsTarget;
    id v13 = dispatch_get_global_queue(33, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100947778;
    block[3] = &unk_101302D30;
    int v19 = analyticsTarget;
    dispatch_async(v13, block);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
    [WeakRetained hideJunctionViewIfNeeded];
  }
  double v15 = 0.0;
  v16[1] = 3221225472;
  v16[0] = _NSConcreteStackBlock;
  v16[2] = sub_100947794;
  v16[3] = &unk_1012E8FA8;
  v16[4] = self;
  if (a3 == 2) {
    double v15 = 1.0;
  }
  BOOL v17 = a3 == 2;
  *(double *)&void v16[5] = v15;
  +[UIView animateWithDuration:v16 animations:0.25];
}

- (void)didChangeLayout:(unint64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)NavTrayViewController;
  [(ContaineeViewController *)&v15 didChangeLayout:"didChangeLayout:"];
  id v5 = +[MNNavigationService sharedService];
  if (a3 == 2)
  {
    int analyticsTarget = self->_analyticsTarget;
    id WeakRetained = dispatch_get_global_queue(33, 0);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1009479E0;
    v11[3] = &unk_101302D30;
    int v12 = analyticsTarget;
    dispatch_async(WeakRetained, v11);
    uint64_t v9 = 1;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    int v6 = self->_analyticsTarget;
    id v7 = dispatch_get_global_queue(33, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1009479C4;
    block[3] = &unk_101302D30;
    int v14 = v6;
    dispatch_async(v7, block);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
    [WeakRetained showJunctionViewIfNeeded];
    uint64_t v9 = 0;
LABEL_5:

    [v5 setIsDisplayingNavigationTray:v9];
  }
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NavTrayViewController;
  -[ContaineeViewController willChangeContainerStyle:](&v10, "willChangeContainerStyle:");
  if (a3 <= 7 && ((1 << a3) & 0xE3) != 0)
  {
    id v5 = [(NavTrayViewController *)self tableView];
    uint64_t v6 = (uint64_t)[v5 numberOfSections];

    if (v6 >= 2)
    {
      id v7 = [(NavTrayViewController *)self tableView];
      [v7 reloadData];

      double v8 = [(NavTrayViewController *)self tableView];
      uint64_t v9 = +[NSIndexPath indexPathForRow:0 inSection:2];
      [v8 scrollToRowAtIndexPath:v9 atScrollPosition:3 animated:0];
    }
  }
}

- (void)applyAlphaToContent:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NavTrayViewController;
  -[ContaineeViewController applyAlphaToContent:](&v7, "applyAlphaToContent:");
  id v5 = [(NavTrayHeaderView *)self->_navHeaderView hairlineView];
  [v5 setAlpha:1.0 - a3];

  if ([(NavTrayViewController *)self isInArrivalState] || !self->_viewDidAppear)
  {
    uint64_t v6 = [(NavTrayViewController *)self contentView];
    [v6 setAlpha:0.0];
  }
}

- (double)_shareETADisclosureTopPosition
{
  id v2 = [(NavTrayViewController *)self shareETADisclosureButton];
  double v3 = [v2 superview];

  double result = 10.0;
  if (!v3) {
    return 0.0;
  }
  return result;
}

- (double)_shareETADisclosureHeight
{
  double v3 = [(NavTrayViewController *)self shareETADisclosureView];
  unsigned __int8 v4 = [v3 isHidden];

  double v5 = 0.0;
  if ((v4 & 1) == 0)
  {
    uint64_t v6 = [(NavTrayViewController *)self shareETADisclosureButton];
    objc_super v7 = [v6 superview];

    if (v7)
    {
      [(NavTrayViewController *)self _shareETADisclosureTopPosition];
      double v9 = v8;
      objc_super v10 = [(NavTrayViewController *)self shareETADisclosureButton];
      [v10 intrinsicContentSize];
      double v5 = v11 + v9 * 2.0;
    }
    else
    {
      objc_super v10 = [(NavTrayViewController *)self shareETADisclosureTableView];
      [v10 intrinsicContentSize];
      double v5 = v12;
    }
  }
  return v5;
}

- (BOOL)_isEligibleToShowWalkingButton
{
  id v2 = [(NavTrayViewController *)self route];
  double v3 = [v2 destination];
  [v3 hasFindMyHandleID];

  return GEOConfigGetBOOL();
}

- (BOOL)_isEligibleToShowFindMyButton
{
  return GEOConfigGetBOOL();
}

- (BOOL)forceCurrentWidthForHeaderHeightCalculations
{
  return 1;
}

- (double)heightForLayout:(unint64_t)a3
{
  double v4 = -1.0;
  if (a3 == 2)
  {
    if (![(NavTrayViewController *)self isInArrivalState])
    {
      double v8 = [(NavTrayViewController *)self tableView];
      [v8 setNeedsLayout];

      double v9 = [(NavTrayViewController *)self tableView];
      [v9 layoutIfNeeded];

      [(NavTrayMetrics *)self->_metrics defaultVerticalPadding];
      if (self->_usedSections)
      {
        double v11 = [(NavTrayViewController *)self tableView];
        [v11 contentSize];
        double v6 = v12;
      }
      else
      {
        double v6 = v10;
      }
      [(ContaineeViewController *)self headerHeight];
      goto LABEL_9;
    }
  }
  else if (a3 == 1)
  {
    [(ContaineeViewController *)self headerHeight];
    double v6 = v5;
    [(NavTrayViewController *)self _shareETADisclosureHeight];
LABEL_9:
    double v13 = v6 + v7;
    int v14 = [(ContaineeViewController *)self cardPresentationController];
    [v14 bottomSafeOffset];
    double v4 = v13 + v15;
  }
  return v4;
}

- (void)_pressedSAR
{
  double v3 = sub_100943248();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v7 = 134349056;
    double v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Pressed SAR", (uint8_t *)&v7, 0xCu);
  }

  +[GEOAPPortal captureUserAction:6097 target:self->_analyticsTarget value:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  double v5 = [(NavTrayViewController *)self categoriesAPIController];
  double v6 = [v5 categories];
  [WeakRetained presentAddStopUsingCategories:v6];
}

- (void)_pressedShareETAInTray
{
  double v3 = sub_100943248();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    double v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Pressed share ETA in tray", buf, 0xCu);
  }

  uint64_t analyticsTarget = self->_analyticsTarget;
  double v5 = [(NavTrayViewController *)self route];
  id v6 = [v5 transportType];
  if (v6 >= 7)
  {
    int v7 = +[NSString stringWithFormat:@"(unknown: %i)", v6];
  }
  else
  {
    int v7 = *(&off_101302E98 + (int)v6);
  }
  +[GEOAPPortal captureUserAction:9022 target:analyticsTarget value:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  [WeakRetained senderShareNavigation:self];
}

- (void)_pressedShareETADisclosureButton
{
  double v3 = sub_100943248();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    double v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Pressed share ETA disclosure button", buf, 0xCu);
  }

  NSUInteger v4 = [(NSArray *)self->_receivingContacts count];
  double v5 = [(NavTrayViewController *)self route];
  id v6 = [v5 transportType];
  if (v6 >= 7)
  {
    int v7 = +[NSString stringWithFormat:@"(unknown: %i)", v6];
  }
  else
  {
    int v7 = *(&off_101302E98 + (int)v6);
  }
  if (v4) {
    uint64_t v8 = 102;
  }
  else {
    uint64_t v8 = 9022;
  }
  +[GEOAPPortal captureUserAction:v8 target:505 value:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  [WeakRetained senderShareNavigation:self];
}

- (void)_pressedReport
{
  double v3 = sub_100943248();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 134349056;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Pressed report incident", (uint8_t *)&v5, 0xCu);
  }

  +[GEOAPPortal captureUserAction:115 target:self->_analyticsTarget value:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  [WeakRetained displayIncidentReporting];
}

- (void)_pressedVoiceVolume
{
  double v3 = sub_100943248();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 134349056;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Pressed voice volume", (uint8_t *)&v5, 0xCu);
  }

  +[GEOAPPortal captureUserAction:3003 target:505 value:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  [WeakRetained displayVoiceVolumeControl];
}

- (void)_pressedDetails
{
  double v3 = sub_100943248();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 134349056;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Pressed details", (uint8_t *)&v5, 0xCu);
  }

  +[GEOAPPortal captureUserAction:3004 target:505 value:0];
  NSUInteger v4 = [(NavTrayViewController *)self _delegate];
  [v4 pressedShowDirectionsListWithSender:self];
}

- (void)_pressedEndRoute
{
  double v3 = sub_100943248();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v7 = 134349056;
    uint64_t v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Pressed end route", (uint8_t *)&v7, 0xCu);
  }

  uint64_t analyticsTarget = self->_analyticsTarget;
  if (![(NavTrayHeaderView *)self->_navHeaderView arrivalState]) {
    goto LABEL_10;
  }
  if ((id)[(NavTrayHeaderView *)self->_navHeaderView currentAlternateButtonType] != (id)6)
  {
    if ((id)[(NavTrayHeaderView *)self->_navHeaderView currentAlternateButtonType] == (id)5)
    {
      int v5 = 0;
      uint64_t analyticsTarget = 125;
      goto LABEL_11;
    }
    if ((id)[(NavTrayHeaderView *)self->_navHeaderView currentAlternateButtonType] == (id)7)
    {
      int v5 = [(NavTrayViewController *)self mapItemMuid];
      uint64_t analyticsTarget = 136;
      goto LABEL_11;
    }
LABEL_10:
    int v5 = 0;
    goto LABEL_11;
  }
  int v5 = 0;
  uint64_t analyticsTarget = 124;
LABEL_11:
  +[GEOAPPortal captureUserAction:3002 target:analyticsTarget value:v5];
  id v6 = [(NavTrayViewController *)self _delegate];
  [v6 pressedEndWithSender:self feedback:0];
}

- (void)_pressedPauseRoute
{
  double v3 = sub_100943248();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 134349056;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Pressed pause route", (uint8_t *)&v5, 0xCu);
  }

  +[GEOAPPortal captureUserAction:6096 target:self->_analyticsTarget value:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  [WeakRetained pauseNavigation];
}

- (void)_pressedOtherStations
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  NSUInteger v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      char v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v19 = 136316418;
        objc_super v20 = (NavTrayViewController *)"-[NavTrayViewController _pressedOtherStations]";
        __int16 v21 = 2080;
        id v22 = "NavTrayViewController.m";
        __int16 v23 = 1024;
        int v24 = 1241;
        __int16 v25 = 2080;
        id v26 = "dispatch_get_main_queue()";
        __int16 v27 = 2080;
        id v28 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v29 = 2080;
        unint64_t v30 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v19,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        BOOL v17 = sub_1005762E4();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v18 = +[NSThread callStackSymbols];
          int v19 = 138412290;
          objc_super v20 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);
        }
      }
    }
  }
  id v6 = sub_100943248();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v19 = 134349056;
    objc_super v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Pressed other stations", (uint8_t *)&v19, 0xCu);
  }

  int v7 = +[MNNavigationService sharedService];
  uint64_t v8 = [v7 arrivalInfo];
  if ([v7 isArrivedAtEVCharger])
  {
    double v9 = [v8 destination];
    id v10 = [v9 muid];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
    [WeakRetained sendOtherEVStationsRequest:v10];
  }
  else
  {
    double v12 = sub_1005762E4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315650;
      objc_super v20 = (NavTrayViewController *)"-[NavTrayViewController _pressedOtherStations]";
      __int16 v21 = 2080;
      id v22 = "NavTrayViewController.m";
      __int16 v23 = 1024;
      int v24 = 1250;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v19, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      double v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = +[NSThread callStackSymbols];
        int v19 = 138412290;
        objc_super v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);
      }
    }
    double v15 = sub_100943248();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v19 = 134349056;
      objc_super v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%{public}p] The charging info at this waypoint couldn't be found.", (uint8_t *)&v19, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
    [WeakRetained pauseNavigation];
  }
}

- (void)_pressedResumeRoute
{
  double v3 = sub_100943248();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 134349056;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Pressed resume route", (uint8_t *)&v5, 0xCu);
  }

  +[GEOAPPortal captureUserAction:292 target:self->_analyticsTarget value:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  [WeakRetained resumeNavigation];
}

- (void)_pressedFindMy
{
  +[GEOAPPortal captureUserAction:457 target:125 value:0];
  double v3 = +[MNNavigationService sharedService];
  NSUInteger v4 = [v3 destination];
  int v5 = [v4 findMyHandleID];

  id v6 = sub_100943248();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    double v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Pressed Find My button. Will prompt to unlock phone if necessary.", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100948D7C;
  v8[3] = &unk_1012EB690;
  objc_copyWeak(&v10, (id *)buf);
  id v7 = v5;
  id v9 = v7;
  +[UIApplication _maps_unlockApplicationWithCompletion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)_pressedWalkingRoute
{
  unsigned int analyticsTarget = self->_analyticsTarget;
  if ([(NavTrayHeaderView *)self->_navHeaderView arrivalState]) {
    uint64_t v4 = 124;
  }
  else {
    uint64_t v4 = analyticsTarget;
  }
  +[GEOAPPortal captureUserAction:456 target:v4 value:0];
  int v5 = +[NavigationFeedbackCollector sharedFeedbackCollector];
  [v5 userAcceptedWalkingRoute];

  id v6 = sub_100943248();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v11 = 134349056;
    double v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Pressed walking button. Will transition to walking transport type.", (uint8_t *)&v11, 0xCu);
  }

  id v7 = +[MNNavigationService sharedService];
  uint64_t v8 = [v7 alternateWalkingRoute];

  if (v8)
  {
    id v9 = +[MNNavigationService sharedService];
    [v9 changeTransportType:2 route:v8];

    id v10 = [(ContaineeViewController *)self cardPresentationController];
    [v10 wantsLayout:1];
  }
  else
  {
    id v10 = sub_100943248();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 134349056;
      double v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{public}p] No alternate walking route found. Cannot transition to walking transport type.", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_pressedCustomRoute
{
  double v3 = [(NavTrayViewController *)self mapItemMuid];
  +[GEOAPPortal captureUserAction:470 target:136 value:v3];

  uint64_t v4 = sub_100943248();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v9 = 134349056;
    id v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Pressed custom route arrival transition button", (uint8_t *)&v9, 0xCu);
  }

  int v5 = +[MNNavigationService sharedService];
  id v6 = [v5 destination];
  id v7 = [v6 route];

  if (v7)
  {
    [v5 switchToDestinationRoute];
  }
  else
  {
    uint64_t v8 = sub_100943248();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 134349056;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%{public}p] No custom route found on the destination. Cannot transition the route.", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (id)_titleTextForAction:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      uint64_t v4 = +[NSBundle mainBundle];
      int v5 = v4;
      CFStringRef v6 = @"[NavTray] Add Stop";
      goto LABEL_10;
    case 1uLL:
      unsigned __int8 v7 = [(NavTrayViewController *)self _isSharingTrip];
      uint64_t v4 = +[NSBundle mainBundle];
      int v5 = v4;
      if (v7) {
        CFStringRef v6 = @"[NavTray] Sharing ETA";
      }
      else {
        CFStringRef v6 = @"[NavTray] Share ETA";
      }
      goto LABEL_10;
    case 2uLL:
      uint64_t v4 = +[NSBundle mainBundle];
      int v5 = v4;
      CFStringRef v6 = @"[NavTray] Report an Incident";
      goto LABEL_10;
    case 3uLL:
      uint64_t v4 = +[NSBundle mainBundle];
      int v5 = v4;
      CFStringRef v6 = @"[NavTray] Voice Volume";
      goto LABEL_10;
    case 4uLL:
      uint64_t v4 = +[NSBundle mainBundle];
      int v5 = v4;
      CFStringRef v6 = @"[NavTray] Details";
LABEL_10:
      double v3 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

      break;
    default:
      break;
  }

  return v3;
}

- (id)_imageForAction:(unint64_t)a3
{
  uint64_t v4 = self;
  if (qword_1016100D8 != -1) {
    dispatch_once(&qword_1016100D8, &stru_101302D50);
  }
  CFStringRef v5 = @"exclamationmark.bubble.fill";
  switch(a3)
  {
    case 0uLL:
      CFStringRef v6 = [(NavTrayViewController *)v4 route];
      switch([v6 transportType])
      {
        case 1u:
        case 6u:

          goto LABEL_16;
        case 2u:
          char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
          break;
        case 3u:
          char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420();
          break;
        default:
          char IsEnabled_Maps182 = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
          break;
      }
      char v8 = IsEnabled_Maps182;

      if (v8) {
        CFStringRef v5 = @"plus";
      }
      else {
LABEL_16:
      }
        CFStringRef v5 = @"magnifyingglass";
      goto LABEL_17;
    case 1uLL:
      if ([(NavTrayViewController *)v4 _isSharingTrip]) {
        CFStringRef v5 = @"person.crop.circle.badge.checkmark";
      }
      else {
        CFStringRef v5 = @"person.crop.circle.badge.plus";
      }
      goto LABEL_17;
    case 2uLL:
      goto LABEL_17;
    case 3uLL:
      CFStringRef v5 = @"speaker.wave.2.fill";
      goto LABEL_17;
    case 4uLL:
      CFStringRef v5 = @"list.bullet";
LABEL_17:
      self = +[UIImage systemImageNamed:v5 withConfiguration:qword_1016100E0];
      break;
    default:
      break;
  }

  return self;
}

- (id)_imageTintColorForAction:(unint64_t)a3
{
  if (a3 >= 4)
  {
    if (a3 == 4)
    {
      self = +[UIColor labelColor];
    }
  }
  else
  {
    self = +[UIColor systemWhiteColor];
  }

  return self;
}

- (id)_backgroundImageTintColorForAction:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      uint64_t v4 = [(NavTrayViewController *)self traitCollection];
      if ([v4 accessibilityContrast] == (id)1) {
        +[UIColor systemDarkBlueColor];
      }
      else {
        +[UIColor systemBlueColor];
      }
      goto LABEL_10;
    case 1uLL:
      uint64_t v4 = [(NavTrayViewController *)self traitCollection];
      if ([v4 accessibilityContrast] == (id)1) {
        +[UIColor systemDarkGreenColor];
      }
      else {
        +[UIColor systemGreenColor];
      }
      goto LABEL_10;
    case 2uLL:
      uint64_t v4 = [(NavTrayViewController *)self traitCollection];
      if ([v4 accessibilityContrast] == (id)1) {
        +[UIColor systemDarkPinkColor];
      }
      else {
        +[UIColor systemPinkColor];
      }
      goto LABEL_10;
    case 3uLL:
      uint64_t v4 = [(NavTrayViewController *)self traitCollection];
      if ([v4 accessibilityContrast] == (id)1) {
        +[UIColor systemDarkGrayColor];
      }
      else {
        +[UIColor systemGrayColor];
      }
      uint64_t v5 = LABEL_10:;
      double v3 = (void *)v5;

      break;
    case 4uLL:
      double v3 = +[UIColor clearColor];
      break;
    default:
      break;
  }

  return v3;
}

- (id)_foregroundColorForButtonType:(unint64_t)a3
{
  if (a3 - 3 >= 5)
  {
    if (a3 <= 2)
    {
      double v3 = +[UIColor systemWhiteColor];
    }
  }
  else
  {
    uint64_t v4 = [(NavTrayViewController *)self traitCollection];
    if ([v4 userInterfaceStyle] == (id)2) {
      +[UIColor systemWhiteColor];
    }
    else {
    double v3 = +[UIColor systemBlueColor];
    }
  }

  return v3;
}

- (void)setCurrentStepIndex:(unint64_t)a3
{
  uint64_t v5 = [(NavTrayViewController *)self route];
  CFStringRef v6 = [v5 steps];
  id v7 = [v6 count];

  if ((unint64_t)v7 > a3)
  {
    char v8 = [v5 steps];
    int v9 = [v8 objectAtIndexedSubscript:a3];

    id v10 = [v5 legIndexForRouteCoordinate:[v9 startRouteCoordinate]];
    int v11 = [v5 legs];
    id v12 = [v11 count];

    if (v10 < v12)
    {
      double v13 = [v5 startRouteStep];
      [v5 remainingTimeToEndOfRouteFrom:[v13 startRouteCoordinate] etaRoute:0];
      double v15 = v14;

      char v16 = [v5 destination];
      BOOL v17 = [v16 navDisplayName];

      if ([v17 length])
      {
        id v18 = +[NSBundle mainBundle];
        int v19 = [v18 localizedStringForKey:@"[NavTray] To Destination" value:@"localized string not found" table:0];
        uint64_t v43 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v17);
      }
      else
      {
        id v18 = +[NSBundle mainBundle];
        uint64_t v43 = [v18 localizedStringForKey:@"[NavTray] Default Title" value:@"localized string not found" table:0];
      }

      if (v15 <= 0.0)
      {
        id v28 = 0;
      }
      else
      {
        id v28 = +[NSString _navigation_stringWithSeconds:(unint64_t)v15 abbreviated:1];
      }
      if ([v17 length])
      {
        [(NavTrayHeaderView *)self->_navHeaderView setDestinationName:v17];
      }
      else
      {
        __int16 v29 = +[NSBundle mainBundle];
        unint64_t v30 = [v29 localizedStringForKey:@"[NavTray] Default Rerouting Title" value:@"localized string not found" table:0];
        [(NavTrayHeaderView *)self->_navHeaderView setDestinationName:v30];
      }
      CFStringRef v31 = [v5 legs];
      unsigned int v32 = (char *)[v31 count] - 1;

      if (v32)
      {
        unsigned int v33 = +[NSBundle mainBundle];
        id v34 = [v33 localizedStringForKey:@" · [Route description delimiter]" value:@"localized string not found" table:0];

        id v35 = +[NSBundle mainBundle];
        CFStringRef v36 = [v35 localizedStringForKey:@"count_of_stops" value:@"localized string not found" table:0];
        double v37 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v36, v32);

        if (v28)
        {
          id v38 = +[NSString stringWithFormat:@"%@%@%@", v28, v34, v37];
        }
        else
        {
          id v38 = v37;
        }
        id v41 = v38;
        stepHeaderView = self->_stepHeaderView;
        id v40 = (void *)v43;
        [(StepTrayHeaderView *)stepHeaderView setDefaultTitle:v43 defaultSubtitle:v41];
      }
      else
      {
        __int16 v39 = self->_stepHeaderView;
        id v40 = (void *)v43;
        [(StepTrayHeaderView *)v39 setDefaultTitle:v43 defaultSubtitle:v28];
      }

      goto LABEL_30;
    }
    int v24 = sub_1005762E4();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      __int16 v25 = [v5 legs];
      id v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Current leg index (%lu) is greater than the number of steps (%lu)", v10, [v25 count]);
      *(_DWORD *)buf = 136315906;
      id v45 = "-[NavTrayViewController setCurrentStepIndex:]";
      __int16 v46 = 2080;
      uint64_t v47 = "NavTrayViewController.m";
      __int16 v48 = 1024;
      int v49 = 1434;
      __int16 v50 = 2112;
      long long v51 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);
    }
    if (!sub_100BB36BC()) {
      goto LABEL_30;
    }
    __int16 v23 = sub_1005762E4();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = +[NSThread callStackSymbols];
      *(_DWORD *)buf = 138412290;
      id v45 = v27;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    goto LABEL_15;
  }
  objc_super v20 = sub_1005762E4();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    __int16 v21 = [v5 steps];
    id v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Current step index (%lu) is greater than the number of steps (%lu)", a3, [v21 count]);
    *(_DWORD *)buf = 136315906;
    id v45 = "-[NavTrayViewController setCurrentStepIndex:]";
    __int16 v46 = 2080;
    uint64_t v47 = "NavTrayViewController.m";
    __int16 v48 = 1024;
    int v49 = 1427;
    __int16 v50 = 2112;
    long long v51 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);
  }
  if (sub_100BB36BC())
  {
    int v9 = sub_1005762E4();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_30:

      goto LABEL_31;
    }
    __int16 v23 = +[NSThread callStackSymbols];
    *(_DWORD *)buf = 138412290;
    id v45 = (const char *)v23;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
LABEL_15:

    goto LABEL_30;
  }
LABEL_31:
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a5;
  int v9 = sub_100943248();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (v6 >= 7)
    {
      id v10 = +[NSString stringWithFormat:@"(unknown: %i)", v6];
    }
    else
    {
      id v10 = *(&off_101302E98 + (int)v6);
    }
    *(_DWORD *)buf = 134349314;
    id v12 = self;
    __int16 v13 = 2112;
    double v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Got new transport type: %@", buf, 0x16u);
  }
  [(NavTrayViewController *)self _updateWithRoute:v8];

  [(NavTrayViewController *)self _resumeNavigation];
}

- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  id v7 = a4;
  NSUInteger v33 = [(NSArray *)self->_usedSections indexOfObject:&off_1013A9538];
  if (v33 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [v7 routeID];
    int v9 = [(GEOComposedRoute *)self->_route uniqueRouteID];
    unsigned int v10 = [v8 isEqual:v9];

    if (v10)
    {
      int v11 = [v7 legInfos];
      id v12 = [v11 count];
      __int16 v13 = [(NavTrayViewController *)self waypointRows];
      id v14 = [v13 count];

      if (v12 != v14)
      {
        double v15 = sub_100943248();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          char v16 = [v7 legInfos];
          unsigned int v17 = [v16 count];
          id v18 = [(NavTrayViewController *)self waypointRows];
          *(_DWORD *)buf = 134349568;
          uint64_t v44 = self;
          __int16 v45 = 1024;
          unsigned int v46 = v17;
          __int16 v47 = 1024;
          unsigned int v48 = [v18 count];
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%{public}p] NavTrayViewController number of legs in MNDisplayETAInfo (%d) does not match number of waypoint rows in table (%d). Attempting to continue but ETA will likely be wrong.", buf, 0x18u);
        }
      }
      int v19 = [(NavTrayViewController *)self tableView];
      objc_super v20 = [v19 indexPathsForVisibleRows];

      id v21 = objc_alloc((Class)NSMutableArray);
      id v22 = [v7 legInfos];
      id v23 = [v21 initWithCapacity:[v22 count]];

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v31 = v7;
      id obj = [v7 legInfos];
      id v24 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v39;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v39 != v26) {
              objc_enumerationMutation(obj);
            }
            uint64_t v28 = *(void *)(*((void *)&v38 + 1) + 8 * i);
            __int16 v29 = [(NavTrayViewController *)self waypointRows];
            v34[0] = _NSConcreteStackBlock;
            v34[1] = 3221225472;
            v34[2] = sub_10094A504;
            v34[3] = &unk_101302D78;
            v34[4] = v28;
            NSUInteger v37 = v33;
            id v35 = v20;
            id v36 = v23;
            [v29 enumerateObjectsUsingBlock:v34];
          }
          id v25 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v25);
      }

      if ([v23 count])
      {
        unint64_t v30 = [(NavTrayViewController *)self tableView];
        [v30 reloadRowsAtIndexPaths:v23 withRowAnimation:5];
      }
      id v7 = v31;
    }
  }
}

- (void)navigationService:(id)a3 didUpdateAlternateWalkingRoute:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100943248();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = [v7 uniqueRouteID];
    int v26 = 134349314;
    __int16 v27 = self;
    __int16 v28 = 2112;
    __int16 v29 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Updating alternate walking route: %@", (uint8_t *)&v26, 0x16u);
  }
  unsigned int v10 = [(NavTrayViewController *)self _isEligibleToShowWalkingButton];
  if (v7) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  [(NavTrayEndCell *)self->_navTrayEndCell setHasWalkingETAInfo:v11];
  [(NavTrayEndCell *)self->_navTrayEndCell updateAlternateWalkingRouteDuration];
  id v12 = [v6 destination];
  uint64_t v13 = [v12 findMyHandleID];
  if (!v13) {
    goto LABEL_14;
  }
  id v14 = (void *)v13;
  double v15 = [v6 arrivalInfo];
  if (([v15 isInArrivalState] & 1) == 0)
  {

LABEL_14:
LABEL_15:
    id v18 = sub_100943248();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v26 = 134349056;
      __int16 v27 = self;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Not eligible to show find my button", (uint8_t *)&v26, 0xCu);
    }

    [(NavTrayHeaderView *)self->_navHeaderView setAlternateButtonTypes:[(NavTrayHeaderView *)self->_navHeaderView alternateButtonTypes] & 0xFFFFFFFFFFFFFFFELL];
    if (!v11) {
      goto LABEL_22;
    }
    goto LABEL_18;
  }
  unsigned int v16 = [(NavTrayViewController *)self _isEligibleToShowFindMyButton];

  if (!v16) {
    goto LABEL_15;
  }
  unsigned int v17 = sub_100943248();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v26 = 134349056;
    __int16 v27 = self;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] Eligible to show find my button", (uint8_t *)&v26, 0xCu);
  }

  [(NavTrayHeaderView *)self->_navHeaderView setAlternateButtonTypes:[(NavTrayHeaderView *)self->_navHeaderView alternateButtonTypes] | 1];
  if (!v11) {
    goto LABEL_22;
  }
LABEL_18:
  int v19 = [v6 arrivalInfo];
  unsigned int v20 = [v19 isInParkingState];

  if (!v20)
  {
LABEL_22:
    id v24 = sub_100943248();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v26 = 134349056;
      __int16 v27 = self;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}p] Not eligible to show walking button", (uint8_t *)&v26, 0xCu);
    }

    navHeaderView = self->_navHeaderView;
    unint64_t v23 = [(NavTrayHeaderView *)navHeaderView alternateButtonTypes] & 0xFFFFFFFFFFFFFFFDLL;
    goto LABEL_25;
  }
  id v21 = sub_100943248();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    int v26 = 134349056;
    __int16 v27 = self;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}p] Eligible to show walking button", (uint8_t *)&v26, 0xCu);
  }

  navHeaderView = self->_navHeaderView;
  unint64_t v23 = [(NavTrayHeaderView *)navHeaderView alternateButtonTypes] | 2;
LABEL_25:
  [(NavTrayHeaderView *)navHeaderView setAlternateButtonTypes:v23];
  [(NavTrayHeaderView *)self->_navHeaderView applyArrivalState];
  id v25 = [(ContaineeViewController *)self cardPresentationController];
  [v25 updateHeightForCurrentLayout];
}

- (void)navigationService:(id)a3 didUpdateVehicleParkingInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100943248();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v18 = 134349314;
    int v19 = self;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Updating vehicle parking info: %@", (uint8_t *)&v18, 0x16u);
  }

  if (![(NavTrayViewController *)self _isEligibleToShowWalkingButton]) {
    goto LABEL_9;
  }
  uint64_t v9 = [v6 alternateWalkingRoute];
  if (!v9) {
    goto LABEL_9;
  }
  unsigned int v10 = (void *)v9;
  uint64_t v11 = [v6 arrivalInfo];
  unsigned int v12 = [v11 isInParkingState];

  if (v12)
  {
    uint64_t v13 = sub_100943248();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v18 = 134349056;
      int v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Will show walking route alongside parking info", (uint8_t *)&v18, 0xCu);
    }

    navHeaderView = self->_navHeaderView;
    unint64_t v15 = [(NavTrayHeaderView *)navHeaderView alternateButtonTypes] | 2;
  }
  else
  {
LABEL_9:
    unsigned int v16 = sub_100943248();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v18 = 134349056;
      int v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Will NOT show walking route alongside parking info", (uint8_t *)&v18, 0xCu);
    }

    navHeaderView = self->_navHeaderView;
    unint64_t v15 = [(NavTrayHeaderView *)navHeaderView alternateButtonTypes] & 0xFFFFFFFFFFFFFFFDLL;
  }
  [(NavTrayHeaderView *)navHeaderView setAlternateButtonTypes:v15];
  [(NavTrayHeaderView *)self->_navHeaderView clearAnimations];
  [(NavTrayHeaderView *)self->_navHeaderView applyArrivalState];
  unsigned int v17 = [(ContaineeViewController *)self cardPresentationController];
  [v17 updateHeightForCurrentLayout];
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  if ((id)[(NavTrayHeaderView *)self->_navHeaderView arrivalState] == (id)3
    || (id)[(NavTrayHeaderView *)self->_navHeaderView arrivalState] == (id)4)
  {
    navHeaderView = self->_navHeaderView;
    [(NavTrayHeaderView *)navHeaderView applyArrivalState];
  }
}

- (void)navigationService:(id)a3 didUpdateTargetLegIndex:(unint64_t)a4
{
  id v6 = sub_100943248();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 134349312;
    id v8 = self;
    __int16 v9 = 2048;
    unint64_t v10 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Updated target leg index: %lu", (uint8_t *)&v7, 0x16u);
  }

  [(NavTrayViewController *)self _updateArrivalState];
}

- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4
{
  id v5 = a4;
  id v6 = sub_100943248();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = [v5 destination];
    int v8 = 134349570;
    __int16 v9 = self;
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Got updated arrival info: %@ for destination: %@", (uint8_t *)&v8, 0x20u);
  }
  [(NavTrayViewController *)self _updateArrivalState];
}

- (void)navigationService:(id)a3 didUpdateNavTrayGuidance:(id)a4
{
  id v5 = a4;
  id v6 = sub_100943248();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 134349314;
    int v8 = self;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Got updated nav tray guidance event: %@", (uint8_t *)&v7, 0x16u);
  }

  [(NavTrayViewController *)self _updateArrivalState];
}

- (void)_updateArrivalState
{
  double v3 = +[MNNavigationService sharedService];
  uint64_t v4 = [v3 arrivalInfo];
  id v5 = v4;
  if (!v4 || ![v4 arrivalState])
  {
    [(NavTrayViewController *)self _resumeNavigation];
    goto LABEL_50;
  }
  id v6 = (char *)[v5 arrivalState];
  if ((unint64_t)(v6 - 1) > 5) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = qword_100F72A68[(void)(v6 - 1)];
  }
  [(NavTrayHeaderView *)self->_navHeaderView setArrivalState:v7];
  id v8 = [v5 legIndex];
  __int16 v9 = [v3 route];
  unsigned __int8 v10 = [v9 isLegIndexOfLastLeg:v8];

  if (v10)
  {
    id v11 = sub_100943248();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v44 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Arrived at end of route", buf, 0xCu);
    }

    [(NavTrayHeaderView *)self->_navHeaderView setAlternateButtonTypes:[(NavTrayHeaderView *)self->_navHeaderView alternateButtonTypes] & 0xFFFFFFFFFFFFFFF7];
    navHeaderView = self->_navHeaderView;
    unint64_t v13 = [(NavTrayHeaderView *)navHeaderView alternateButtonTypes] & 0xFFFFFFFFFFFFFFFBLL;
  }
  else
  {
    unsigned int v14 = [v3 isArrivedAtEVCharger];
    unint64_t v15 = sub_100943248();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v16)
      {
        *(_DWORD *)buf = 134349056;
        uint64_t v44 = self;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Arrived at EV stop", buf, 0xCu);
      }

      navHeaderView = self->_navHeaderView;
      unint64_t v13 = [(NavTrayHeaderView *)navHeaderView alternateButtonTypes] | 8;
    }
    else
    {
      if (v16)
      {
        *(_DWORD *)buf = 134349056;
        uint64_t v44 = self;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Arrived at mid way stop", buf, 0xCu);
      }

      navHeaderView = self->_navHeaderView;
      unint64_t v13 = [(NavTrayHeaderView *)navHeaderView alternateButtonTypes] | 4;
    }
  }
  [(NavTrayHeaderView *)navHeaderView setAlternateButtonTypes:v13];
  unsigned int v17 = [v3 destination];
  uint64_t v18 = [v17 findMyHandleID];
  if (!v18) {
    goto LABEL_25;
  }
  int v19 = (void *)v18;
  __int16 v20 = [v3 arrivalInfo];
  if (([v20 isInArrivalState] & 1) == 0)
  {

LABEL_25:
    goto LABEL_26;
  }
  unsigned int v21 = [(NavTrayViewController *)self _isEligibleToShowFindMyButton];

  if (!v21)
  {
LABEL_26:
    id v25 = sub_100943248();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v44 = self;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[%{public}p] Not eligible to show find my button", buf, 0xCu);
    }

    unint64_t v23 = self->_navHeaderView;
    unint64_t v24 = [(NavTrayHeaderView *)v23 alternateButtonTypes] & 0xFFFFFFFFFFFFFFFELL;
    goto LABEL_29;
  }
  id v22 = sub_100943248();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v44 = self;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%{public}p] Eligible to show find my button", buf, 0xCu);
  }

  unint64_t v23 = self->_navHeaderView;
  unint64_t v24 = [(NavTrayHeaderView *)v23 alternateButtonTypes] | 1;
LABEL_29:
  [(NavTrayHeaderView *)v23 setAlternateButtonTypes:v24];
  if ([(NavTrayViewController *)self _isEligibleToShowWalkingButton]
    && ([v3 alternateWalkingRoute], (uint64_t v26 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v27 = (void *)v26, unsigned int v28 = [v5 isInParkingState], v27, v28))
  {
    __int16 v29 = sub_100943248();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v44 = self;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[%{public}p] Eligible to show walking button", buf, 0xCu);
    }

    unint64_t v30 = self->_navHeaderView;
    unint64_t v31 = [(NavTrayHeaderView *)v30 alternateButtonTypes] | 2;
  }
  else
  {
    unsigned int v32 = sub_100943248();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v44 = self;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[%{public}p] Not eligible to show walking button", buf, 0xCu);
    }

    unint64_t v30 = self->_navHeaderView;
    unint64_t v31 = [(NavTrayHeaderView *)v30 alternateButtonTypes] & 0xFFFFFFFFFFFFFFFDLL;
  }
  [(NavTrayHeaderView *)v30 setAlternateButtonTypes:v31];
  NSUInteger v33 = [v3 destination];
  uint64_t v34 = [v33 route];
  if (v34
    && (id v35 = (void *)v34,
        [v3 arrivalInfo],
        id v36 = objc_claimAutoreleasedReturnValue(),
        unsigned int v37 = [v36 isInArrivalState],
        v36,
        v35,
        v37))
  {
    long long v38 = sub_100943248();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v44 = self;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "[%{public}p] Eligible to show arrival button for custom route", buf, 0xCu);
    }

    long long v39 = self->_navHeaderView;
    unint64_t v40 = [(NavTrayHeaderView *)v39 alternateButtonTypes] | 0x10;
  }
  else
  {
    long long v41 = sub_100943248();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v44 = self;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "[%{public}p] Not eligible to show arrival button for custom route", buf, 0xCu);
    }

    long long v39 = self->_navHeaderView;
    unint64_t v40 = [(NavTrayHeaderView *)v39 alternateButtonTypes] & 0xFFFFFFFFFFFFFFEFLL;
  }
  [(NavTrayHeaderView *)v39 setAlternateButtonTypes:v40];
  if ([(NavTrayViewController *)self isInArrivalState])
  {
    [(NavTrayHeaderView *)self->_navHeaderView clearAnimations];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10094B50C;
    v42[3] = &unk_1012E5D08;
    v42[4] = self;
    +[UIView animateWithDuration:4 delay:v42 options:0 animations:0.25 completion:0.0];
  }
  else
  {
    [(NavTrayViewController *)self _handleArrivalAtEndOfLegIndex:v8 service:v3];
  }

LABEL_50:
}

- (void)_handleArrivalAtEndOfLegIndex:(unint64_t)a3 service:(id)a4
{
}

- (void)_handleArrivalAtEndOfLegIndex:(unint64_t)a3 forced:(BOOL)a4 service:(id)a5
{
  id v8 = a5;
  if (![(NavTrayViewController *)self isInArrivalState] || a4)
  {
    unsigned int v14 = [v8 route];
    unint64_t v15 = [v14 legs];
    if ((unint64_t)[v15 count] <= a3)
    {
    }
    else
    {
      BOOL v16 = [v8 route];
      unsigned int v17 = [v16 legs];
      __int16 v9 = [v17 objectAtIndexedSubscript:a3];

      if (v9)
      {
        uint64_t v18 = sub_100943248();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349312;
          uint64_t v34 = self;
          __int16 v35 = 2048;
          unint64_t v36 = a3;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Handling arrival at end of leg index: %lu", buf, 0x16u);
        }

        int v19 = [v8 route];
        unsigned int v20 = [v19 isLegIndexOfLastLeg:a3];

        unsigned int v21 = [v8 arrivalChargingStationInfo];

        [(NavTrayViewController *)self setIsInArrivalState:1];
        [(NavTrayViewController *)self loadViewIfNeeded];
        [(NavTrayViewController *)self _updateShareETADisclosure];
        id v22 = [(ContaineeViewController *)self cardPresentationController];
        [v22 wantsLayout:1];

        id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
        [WeakRetained presentTray];

        id v24 = objc_loadWeakRetained((id *)&self->_navigationDelegate);
        uint64_t v25 = [v24 canPresentRapFeedbackView] & v20;

        [(NavTrayHeaderView *)self->_navHeaderView setShowFeedbackView:v25];
        [(NavTrayHeaderView *)self->_navHeaderView clearAnimations];
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10094B978;
        v32[3] = &unk_1012E5D08;
        v32[4] = self;
        +[UIView animateWithDuration:4 delay:v32 options:0 animations:0.25 completion:0.0];
        if (v25) {
          +[GEOAPPortal captureUserAction:234 target:self->_analyticsTarget value:0];
        }
        uint64_t analyticsTarget = self->_analyticsTarget;
        __int16 v27 = +[NSString stringWithFormat:@"%ld", a3];
        +[GEOAPPortal captureUserAction:293 target:analyticsTarget value:v27];

        if (v21) {
          char v28 = 0;
        }
        else {
          char v28 = v20;
        }
        if ((v28 & 1) == 0)
        {
          if (v21) {
            uint64_t v29 = 295;
          }
          else {
            uint64_t v29 = 296;
          }
          +[GEOAPPortal captureUserAction:v29 target:self->_analyticsTarget value:0];
        }
        sharedTripAnimationTimer = self->_sharedTripAnimationTimer;
        self->_sharedTripAnimationTimer = 0;

        self->_displayingInitialBanner = 0;
        [(NavTrayViewController *)self _updateShareETADisclosure];
        unint64_t v31 = [(ContaineeViewController *)self cardPresentationController];
        [v31 updateHeightForCurrentLayout];

        goto LABEL_24;
      }
    }
    __int16 v9 = sub_100943248();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349312;
      uint64_t v34 = self;
      __int16 v35 = 2048;
      unint64_t v36 = a3;
      unsigned __int8 v10 = "[%{public}p] _handleDidArriveAtEndOfLegIndex:service: received an invalid legIndex: %lu";
      id v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 22;
      goto LABEL_23;
    }
  }
  else
  {
    __int16 v9 = sub_100943248();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v34 = self;
      unsigned __int8 v10 = "[%{public}p] _handleDidArriveAtEndOfLegIndex:service: already in arrival state";
      id v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      uint32_t v13 = 12;
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, v13);
    }
  }
LABEL_24:
}

- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  if (a6 - 3 <= 1) {
    +[GEOAPPortal captureUserAction:297 target:self->_analyticsTarget value:0];
  }

  [(NavTrayViewController *)self _resumeNavigation];
}

- (void)_resumeNavigation
{
  double v3 = sub_100943248();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Resuming navigation", buf, 0xCu);
  }

  [(NavTrayViewController *)self setIsInArrivalState:0];
  [(NavTrayViewController *)self _updateShareETADisclosure];
  [(NavTrayHeaderView *)self->_navHeaderView resetContent];
  [(NavTrayHeaderView *)self->_navHeaderView clearAnimations];
  v4[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10094BBB0;
  v5[3] = &unk_1012E5D08;
  v5[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10094BBC4;
  v4[3] = &unk_1012E7D28;
  +[UIView animateWithDuration:4 delay:v5 options:v4 animations:0.25 completion:0.0];
}

- (int)currentUITargetForAnalytics
{
  id v2 = [(NavTrayViewController *)self route];
  unsigned int v3 = [v2 transportType];

  if (v3 > 3) {
    return 0;
  }
  else {
    return dword_100F72AA0[v3];
  }
}

- (int)currentMapViewTargetForAnalytics
{
  return 505;
}

- (void)incidentsReportingEnablementDidUpdate
{
  id v3 = [(NavTrayViewController *)self route];
  [(NavTrayViewController *)self _updateWithRoute:v3];
}

- (void)sharedTripServiceDidUpdateSendingAvailability:(id)a3
{
  uint64_t v4 = [(NavTrayViewController *)self route];
  [(NavTrayViewController *)self _updateWithRoute:v4];

  [(NavTrayViewController *)self _updateShareETADisclosure];
}

- (void)sharedTripService:(id)a3 didUpdateReceivers:(id)a4
{
  id v5 = a4;
  [(NavTrayViewController *)self setReceivingContacts:v5];
  id v6 = [(ContaineeViewController *)self cardPresentationController];
  [v6 updateHeightForCurrentLayout];

  uint64_t v7 = +[UIApplication _maps_keyMapsSceneDelegate];
  [v7 setNeedsUserActivityUpdate];

  id v8 = [v5 count];
  if (!v8)
  {
    id v9 = [(NavTrayViewController *)self route];
    [(NavTrayViewController *)self _updateWithRoute:v9];
  }
}

- (void)sharedTripService:(id)a3 sharingDidInvalidateWithError:(id)a4
{
}

- (void)offlineMapsStateChanged
{
  id v3 = [(NavTrayViewController *)self route];
  [(NavTrayViewController *)self _updateWithRoute:v3];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_tableView == a3) {
    return [(NSArray *)self->_usedSections count];
  }
  else {
    return 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (self->_tableView != a3) {
    return 1;
  }
  id v6 = [(NSArray *)self->_usedSections objectAtIndexedSubscript:a4];
  uint64_t v7 = [(NSDictionary *)self->_traySections objectForKeyedSubscript:v6];
  id v8 = [v7 count];

  return (int64_t)v8;
}

- (BOOL)_isWaypointRemovable:(id)a3
{
  if (self->_isSteppingMode || ([a3 isServerProvidedWaypoint] & 1) != 0) {
    return 0;
  }
  id v5 = sub_1000AC254(self->_waypointRows, &stru_101302DB8);
  BOOL v4 = (unint64_t)[v5 count] > 1;

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = (UITableView *)a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_tableView != v6)
  {
    id v9 = [(NavTrayViewController *)self route];
    unsigned __int8 v10 = [v9 shareETAWaypointContacts];

    id v11 = [v10 lastObject];
    os_log_type_t v12 = (objc_class *)objc_opt_class();
    uint32_t v13 = NSStringFromClass(v12);
    unsigned int v14 = [(UITableView *)v6 dequeueReusableCellWithIdentifier:v13];

    [v14 setIsStandaloneSharingSuggestion:1];
    [v14 setDelegate:self];
    [v14 setContact:v11];
    [v14 setSharingState:0 animated:0];
    unint64_t v15 = +[MSPSharedTripService sharedInstance];
    id v44 = 0;
    id v16 = [v15 capabilityTypeForContact:v11 serviceName:&v44 isActiveReceiver:0];
    id v17 = v44;

    [v14 setCapabilityType:v16 serviceName:v17];
LABEL_3:

    goto LABEL_4;
  }
  unsigned __int8 v10 = -[NSArray objectAtIndexedSubscript:](self->_usedSections, "objectAtIndexedSubscript:", [v7 section]);
  id v19 = [v10 integerValue];
  id v20 = [v8 row];
  if (v19 == (id)2)
  {
    unint64_t v40 = (objc_class *)objc_opt_class();
    long long v41 = NSStringFromClass(v40);
    unsigned int v14 = [(UITableView *)v6 dequeueReusableCellWithIdentifier:v41];

    [v14 setMetrics:self->_metrics];
    [v14 setButtonStylingDelegate:self];
    if ([(NavTrayViewController *)self _isEligibleToShowWalkingButton])
    {
      int v42 = +[MNNavigationService sharedService];
      uint64_t v43 = [v42 alternateWalkingRouteDisplayETAInfo];

      [v14 setHasWalkingETAInfo:v43 != 0];
    }
    objc_storeStrong((id *)&self->_navTrayEndCell, v14);
  }
  else
  {
    id v21 = v20;
    if (v19 == (id)1)
    {
      char v28 = (objc_class *)objc_opt_class();
      uint64_t v29 = NSStringFromClass(v28);
      unsigned int v14 = [(UITableView *)v6 dequeueReusableCellWithIdentifier:v29];

      unint64_t v30 = [(NSDictionary *)self->_traySections objectForKeyedSubscript:v10];
      id v11 = [v30 objectAtIndexedSubscript:v21];

      id v31 = [v11 unsignedIntegerValue];
      unsigned int v32 = [(NavTrayViewController *)self _imageForAction:v31];
      NSUInteger v33 = [v14 leadingImageView];
      [v33 setImage:v32];

      uint64_t v34 = [(NavTrayViewController *)self _imageTintColorForAction:v31];
      __int16 v35 = [v14 leadingImageView];
      [v35 setTintColor:v34];

      unint64_t v36 = [(NavTrayViewController *)self _backgroundImageTintColorForAction:v31];
      unsigned int v37 = [v14 leadingImageBackgroundView];
      [v37 setBackgroundColor:v36];

      long long v38 = [(NavTrayViewController *)self _titleTextForAction:v31];
      long long v39 = [v14 titleLabel];
      [v39 setText:v38];

      goto LABEL_3;
    }
    if (!v19)
    {
      id v22 = (objc_class *)objc_opt_class();
      unint64_t v23 = NSStringFromClass(v22);
      unsigned int v14 = [(UITableView *)v6 dequeueReusableCellWithIdentifier:v23];

      [v14 setDelegate:self];
      id v24 = [(NSDictionary *)self->_traySections objectForKeyedSubscript:v10];
      id v11 = [v24 objectAtIndexedSubscript:v21];

      uint64_t v25 = [v11 waypoint];
      uint64_t v26 = [v11 etaInfo];
      __int16 v27 = [v11 waypoint];
      [v14 updateWithWaypoint:v25 etaInfo:v26 shouldDisplayDeleteButton:[self _isWaypointRemovable:v27]];

      goto LABEL_3;
    }
    unsigned int v14 = objc_opt_new();
  }
LABEL_4:

  return v14;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  if (self->_tableView == a3)
  {
    usedSections = self->_usedSections;
    id v8 = a4;
    id v9 = a3;
    unsigned __int8 v10 = -[NSArray objectAtIndexedSubscript:](usedSections, "objectAtIndexedSubscript:", [v8 section]);
    id v11 = [v10 integerValue];
    id v12 = [v8 row];

    [v9 frame];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;

    v40.origin.x = v14;
    v40.origin.double y = v16;
    v40.size.double width = v18;
    v40.size.double height = v20;
    double Width = CGRectGetWidth(v40);
    id v22 = [(NavTrayViewController *)self tableView];
    [v22 layoutMargins];
    double v24 = v23;
    uint64_t v25 = [(NavTrayViewController *)self tableView];
    [v25 layoutMargins];
    double v27 = v26;

    if (v11 == (id)2)
    {
      double v4 = UITableViewAutomaticDimension;
    }
    else
    {
      double v28 = Width - v24 - v27;
      if (v11 == (id)1)
      {
        unint64_t v36 = [(NSDictionary *)self->_traySections objectForKeyedSubscript:v10];
        unint64_t v30 = [v36 objectAtIndexedSubscript:v12];

        unsigned int v37 = -[NavTrayViewController _titleTextForAction:](self, "_titleTextForAction:", [v30 unsignedIntegerValue]);
        +[NavTrayActionCell heightForCellWithText:v37 width:v28];
        double v4 = v38;

        goto LABEL_9;
      }
      double v4 = 0.0;
      if (!v11)
      {
        uint64_t v29 = [(NSDictionary *)self->_traySections objectForKeyedSubscript:v10];
        unint64_t v30 = [v29 objectAtIndexedSubscript:v12];

        id v31 = [v30 waypoint];
        BOOL v32 = [(NavTrayViewController *)self _isWaypointRemovable:v31];

        NSUInteger v33 = [v30 waypoint];
        uint64_t v34 = [v30 etaInfo];
        +[NavTrayWaypointCell heightForCellWithWaypoint:v33 etaInfo:v34 shouldDisplayDeleteButton:v32 width:v28];
        double v4 = v35;

LABEL_9:
      }
    }

    return v4;
  }
  return 78.0;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6 = (UITableView *)a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_tableView != v6) {
    goto LABEL_5;
  }
  id v9 = -[NSArray objectAtIndexedSubscript:](self->_usedSections, "objectAtIndexedSubscript:", [v7 section]);
  if ([v9 integerValue] != (id)2)
  {

LABEL_5:
    double v11 = UITableViewAutomaticDimension;
    goto LABEL_6;
  }
  [(NavTrayMetrics *)self->_metrics endButtonHeight];
  double v11 = v10;

LABEL_6:
  return v11;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if (self->_shareETADisclosureTableView == a3) {
    double v4 = self->_shareETADisclosureFooterView;
  }
  else {
    double v4 = (NavShareETAFooterView *)objc_opt_new();
  }

  return v4;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = (ContentSizedTableView *)a3;
  id v7 = v6;
  if (self->_shareETADisclosureTableView == v6)
  {
    [(ContentSizedTableView *)v6 frame];
    double Width = CGRectGetWidth(v16);
    [(ContentSizedTableView *)v7 layoutMargins];
    double v12 = Width - v11;
    [(ContentSizedTableView *)v7 layoutMargins];
    [(NavShareETAFooterView *)self->_shareETADisclosureFooterView heightForWidth:v12 - v13];
  }
  else
  {
    metrics = self->_metrics;
    if (a4 == 2) {
      [(NavTrayMetrics *)metrics actionButtonBottomPadding];
    }
    else {
      [(NavTrayMetrics *)metrics defaultVerticalPadding];
    }
  }
  double v14 = v9;

  return v14;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = (UITableView *)a3;
  id v7 = a4;
  id v8 = v7;
  BOOL v11 = 1;
  if (self->_tableView == v6)
  {
    double v9 = -[NSArray objectAtIndexedSubscript:](self->_usedSections, "objectAtIndexedSubscript:", [v7 section]);
    unint64_t v10 = (unint64_t)[v9 integerValue] & 0xFFFFFFFFFFFFFFFDLL;

    if (!v10) {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  tableView = self->_tableView;
  id v8 = a3;
  double v9 = v8;
  if (tableView == a3)
  {
    BOOL v11 = sub_100943248();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v22 = 134349314;
      double v23 = self;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] NavTrayViewController tableView:didSelectRowAtIndexPath: %@", (uint8_t *)&v22, 0x16u);
    }

    [v9 deselectRowAtIndexPath:v6 animated:1];
    unint64_t v10 = -[NSArray objectAtIndexedSubscript:](self->_usedSections, "objectAtIndexedSubscript:", [v6 section]);
    id v12 = [v10 integerValue];
    id v13 = [v6 row];
    if (v12 == (id)1)
    {
      id v14 = v13;
      double v15 = [(NavTrayViewController *)self _delegate];
      [v15 suppressTransitionsOfContainee:self];

      CGRect v16 = [(ContaineeViewController *)self cardPresentationController];
      [v16 wantsLayout:1];

      double v17 = [(NSDictionary *)self->_traySections objectForKeyedSubscript:v10];
      CGFloat v18 = [v17 objectAtIndexedSubscript:v14];

      switch((unint64_t)[v18 unsignedIntegerValue])
      {
        case 0uLL:
          [(NavTrayViewController *)self _pressedSAR];
          break;
        case 1uLL:
          [(NavTrayViewController *)self _pressedShareETAInTray];
          break;
        case 2uLL:
          [(NavTrayViewController *)self _pressedReport];
          break;
        case 3uLL:
          [(NavTrayViewController *)self _pressedVoiceVolume];
          break;
        case 4uLL:
          [(NavTrayViewController *)self _pressedDetails];
          break;
        default:
          break;
      }
    }
  }
  else
  {
    [v8 deselectRowAtIndexPath:v6 animated:1];
    unint64_t v10 = [v9 cellForRowAtIndexPath:v6];

    if ([v10 sharingState])
    {
      if ([v10 sharingState] == (id)1)
      {
        [v10 setSharingState:0 animated:0];
      }
      else
      {
        CGFloat v20 = +[MSPSharedTripService sharedInstance];
        id v21 = [v10 contact];
        [v20 stopSharingWithContact:v21 completion:&stru_101302DD8];
      }
      +[GEOAPPortal captureUserAction:402 target:91 value:0];
      [(NavTrayViewController *)self _startTimerToDismissInitialBanner];
    }
    else
    {
      [v10 setSharingState:1 animated:1];
      +[GEOAPPortal captureUserAction:400 target:91 value:0];
      sharedTripAnimationTimer = self->_sharedTripAnimationTimer;
      self->_sharedTripAnimationTimer = 0;
    }
  }
}

- (void)pressedDeleteOnCell:(id)a3
{
  id v4 = a3;
  id v5 = sub_100943248();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v13 = 134349056;
    id v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Handle delete waypoint cell tap", (uint8_t *)&v13, 0xCu);
  }

  id v6 = [v4 waypoint];
  if (v6
    && ([(NavTrayViewController *)self waypointController],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 displayedWaypoints],
        id v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v8 indexOfObject:v6],
        v8,
        v7,
        v9 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    +[GEOAPPortal captureUserAction:294 target:self->_analyticsTarget value:0];
    id v12 = sub_100943248();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 134349312;
      id v14 = self;
      __int16 v15 = 2048;
      id v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Deleting waypoint at index %lu", (uint8_t *)&v13, 0x16u);
    }

    unint64_t v10 = [(NavTrayViewController *)self waypointController];
    [v10 removeWaypointAt:v9];
  }
  else
  {
    unint64_t v10 = sub_100943248();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = [v6 shortDescription];
      int v13 = 134349570;
      id v14 = self;
      __int16 v15 = 2112;
      id v16 = v4;
      __int16 v17 = 2112;
      CGFloat v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{public}p] Couldn't delete cell: %@ waypoint: %@", (uint8_t *)&v13, 0x20u);
    }
  }
}

- (void)pressedPhoneCallOnCell:(id)a3
{
  id v4 = a3;
  id v5 = sub_100943248();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    NSUInteger v33 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Handle phone call cell tap", buf, 0xCu);
  }

  id v6 = [v4 destinationPhoneNumbers];
  if ((unint64_t)[v6 count] < 2)
  {
    id v9 = +[UIApplication sharedApplication];
    CGFloat v20 = [v6 anyObject];
    id v21 = [v20 unformattedInternationalStringValue];
    [v9 callPhoneNumber:v21 completion:0];
  }
  else
  {
    __int16 v24 = self;
    id v7 = +[NSBundle mainBundle];
    id v8 = [v7 localizedStringForKey:@"[NavTray] Phone number prompt" value:@"localized string not found" table:0];
    id v9 = +[UIAlertController alertControllerWithTitle:v8 message:0 preferredStyle:0];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v6;
    id v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          __int16 v15 = [v14 stringValue];
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_10094D208;
          v26[3] = &unk_1012E6DE0;
          v26[4] = v14;
          id v16 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v26];
          [v9 addAction:v16];
        }
        id v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);
    }

    __int16 v17 = +[NSBundle mainBundle];
    CGFloat v18 = [v17 localizedStringForKey:@"Cancel" value:@"localized string not found" table:0];
    double v19 = +[UIAlertAction actionWithTitle:v18 style:1 handler:0];
    [v9 addAction:v19];

    CGFloat v20 = +[MapsInternalAlertPresentationController sharedInstance];
    id v21 = [(NavTrayViewController *)v24 view];
    int v22 = [v21 window];
    double v23 = [v22 windowScene];
    [v20 presentAlertController:v9 fromWindowScene:v23];
  }
}

- (void)cellDidFinishRingAnimation:(id)a3
{
  id v4 = a3;
  id v5 = +[MSPSharedTripService sharedInstance];
  id v6 = [v4 contact];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10094D354;
  v8[3] = &unk_101302E00;
  id v9 = v4;
  id v7 = v4;
  [v5 startSharingWithContact:v6 completion:v8];

  [(NavTrayViewController *)self _startTimerToDismissInitialBanner];
}

- (void)_sceneConnectionsDidChange:(id)a3
{
  BOOL v4 = +[UIApplication _maps_isAnySceneConnectedForRole:_UIWindowSceneSessionRoleCarPlay];

  [(NavTrayViewController *)self setConnectedToCarPlay:v4];
}

- (void)_maneuverBannerViewEVStationsNotification:(id)a3
{
  if (![(NavTrayViewController *)self isConnectedToCarPlay])
  {
    objc_initWeak(&location, self);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10094D4B8;
    v4[3] = &unk_1012E6708;
    objc_copyWeak(&v5, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (void)setPlatformController:(id)a3
{
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (BOOL)enableTrafficIncidents
{
  return self->_enableTrafficIncidents;
}

- (BOOL)enableShareETA
{
  return self->_enableShareETA;
}

- (BOOL)isConnectedToCarPlay
{
  return self->_connectedToCarPlay;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (BOOL)isInArrivalState
{
  return self->_isInArrivalState;
}

- (void)setIsInArrivalState:(BOOL)a3
{
  self->_isInArrivalState = a3;
}

- (NSArray)receivingContacts
{
  return self->_receivingContacts;
}

- (UIView)shareETADisclosureView
{
  return self->_shareETADisclosureView;
}

- (ContentSizedTableView)shareETADisclosureTableView
{
  return self->_shareETADisclosureTableView;
}

- (NavShareETAFooterView)shareETADisclosureFooterView
{
  return self->_shareETADisclosureFooterView;
}

- (UIButton)shareETADisclosureButton
{
  return self->_shareETADisclosureButton;
}

- (NavSARAPIController)categoriesAPIController
{
  return self->_categoriesAPIController;
}

- (void)setCategoriesAPIController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoriesAPIController, 0);
  objc_storeStrong((id *)&self->_shareETADisclosureButton, 0);
  objc_storeStrong((id *)&self->_shareETADisclosureFooterView, 0);
  objc_storeStrong((id *)&self->_shareETADisclosureTableView, 0);
  objc_storeStrong((id *)&self->_shareETADisclosureView, 0);
  objc_storeStrong((id *)&self->_receivingContacts, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong((id *)&self->_waypointRows, 0);
  objc_destroyWeak((id *)&self->_phoneNumberPickerAlertController);
  objc_storeStrong((id *)&self->_sharedTripAnimationTimer, 0);
  objc_storeStrong((id *)&self->_shareETADisclosureTopConstraint, 0);
  objc_storeStrong((id *)&self->_navTrayEndCell, 0);
  objc_storeStrong((id *)&self->_stepHeaderView, 0);
  objc_storeStrong((id *)&self->_navHeaderView, 0);
  objc_storeStrong((id *)&self->_usedSections, 0);
  objc_storeStrong((id *)&self->_traySections, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_guidanceObserver, 0);
  objc_destroyWeak((id *)&self->_navigationDelegate);

  objc_destroyWeak((id *)&self->_steppingDelegate);
}

@end