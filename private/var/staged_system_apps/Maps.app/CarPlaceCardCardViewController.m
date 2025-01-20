@interface CarPlaceCardCardViewController
- (BOOL)_canSafelyRequestFocusUpdate;
- (BOOL)_isGoButtonFocusable;
- (BOOL)_shouldHideNavigationRelatedInfo;
- (BOOL)_shouldShowEVViewsInline;
- (BOOL)hasCardFinishedTransitioning;
- (BOOL)isGoButtonEnabled;
- (BOOL)isGoButtonHidden;
- (BOOL)isHandoffEnabled;
- (BOOL)isLoading;
- (BOOL)isNavigationAidedDrivingEnabled;
- (BOOL)shouldDisplayMoreButton;
- (CarPlaceCardCardViewController)initWithSearchResult:(id)a3 style:(int64_t)a4 dataSource:(id)a5 delegate:(id)a6;
- (CarPlaceCardCardViewControllerDataSource)dataSource;
- (CarPlaceCardCardViewControllerDelegate)delegate;
- (MKMapItem)mapItem;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (SearchResult)searchResult;
- (_MKLocalizedHoursBuilder)localizedHoursBuilder;
- (_TtC4Maps31CarPlaceCardEVChargingViewModel)evChargingViewModel;
- (_TtC4Maps39CarEVChargingAvailabilityViewController)evChargingAvailabilityVC;
- (id)_attributesForPlainSubtitleString;
- (id)_createAutohidingTextlabelWithVerticalCompressionResistancePriority:(float)a3;
- (id)_createEVChargingViewModel;
- (id)_createEtaLabelTrailingConstraint;
- (id)_localizedHours;
- (id)_sharingETAString;
- (id)_subtitleString;
- (id)_visibleButtons;
- (int64_t)style;
- (int64_t)titleNumberOfLines;
- (void)ETAProviderUpdated:(id)a3;
- (void)_callDestination;
- (void)_cancelScheduleETAUpdate;
- (void)_captureAnalytics;
- (void)_evChargingMoreButtonPressed:(id)a3;
- (void)_externalDeviceUpdated:(id)a3;
- (void)_goButtonPressed:(id)a3;
- (void)_initializeGoButtonState;
- (void)_moreButtonPressed:(id)a3;
- (void)_presentMoreOptions;
- (void)_scheduleETAUpdate;
- (void)_scheduleOpeningHoursUpdate;
- (void)_setupConstraints;
- (void)_setupStyling;
- (void)_startETAProviderIfNeeded;
- (void)_updateConstraints;
- (void)_updateContents;
- (void)_updateETA;
- (void)_updateETARelatedContents;
- (void)_updateMoreButton;
- (void)_updateOpeningHours;
- (void)_updateRouteAdvisoriesStack;
- (void)dealloc;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEvChargingAvailabilityVC:(id)a3;
- (void)setEvChargingViewModel:(id)a3;
- (void)setGoButtonEnabled:(BOOL)a3;
- (void)setGoButtonHidden:(BOOL)a3;
- (void)setHandoffEnabled:(BOOL)a3;
- (void)setHasCardFinishedTransitioning:(BOOL)a3;
- (void)setLoading:(BOOL)a3;
- (void)setLocalizedHoursBuilder:(id)a3;
- (void)setNavigationAidedDrivingEnabled:(BOOL)a3;
- (void)setSearchResult:(id)a3;
- (void)setShouldDisplayMoreButton:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)startNavigation;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CarPlaceCardCardViewController

- (CarPlaceCardCardViewController)initWithSearchResult:(id)a3 style:(int64_t)a4 dataSource:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)CarPlaceCardCardViewController;
  v14 = [(CarPlaceCardCardViewController *)&v27 initWithNibName:0 bundle:0];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_searchResult, a3);
    objc_storeWeak((id *)&v15->_dataSource, v12);
    objc_storeWeak((id *)&v15->_delegate, v13);
    v15->_style = a4;
    v16 = sub_100015DB4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = [(CarPlaceCardCardViewController *)v15 mapItem];
      v18 = [v17 name];
      v19 = [(CarPlaceCardCardViewController *)v15 mapItem];
      id v20 = [v19 _muid];
      *(_DWORD *)buf = 138543875;
      v29 = v15;
      __int16 v30 = 2113;
      v31 = v18;
      __int16 v32 = 2049;
      id v33 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "CarPlaceCard: placecard initialized (%{public}@) with mapItem: (name: %{private}@, muid: %{private}llu)", buf, 0x20u);
    }
    [(CarPlaceCardCardViewController *)v15 _initializeGoButtonState];
    v21 = +[MapsExternalDevice sharedInstance];
    v15->_navigationAidedDrivingEnabled = [v21 isNavigationAidedDrivingEnabled];

    v22 = +[MapsExternalDevice sharedInstance];
    v15->_handoffEnabled = [v22 destinationHandoffEnabled];

    v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v15 selector:"_externalDeviceUpdated:" name:@"MapsExternalDeviceUpdated" object:0];
  }
  uint64_t v24 = [(CarPlaceCardCardViewController *)v15 _createEVChargingViewModel];
  evChargingViewModel = v15->_evChargingViewModel;
  v15->_evChargingViewModel = (_TtC4Maps31CarPlaceCardEVChargingViewModel *)v24;

  return v15;
}

- (void)dealloc
{
  [(NSTimer *)self->_etaUpdateTimer invalidate];
  etaUpdateTimer = self->_etaUpdateTimer;
  self->_etaUpdateTimer = 0;

  [(NSTimer *)self->_openingHoursUpdateTimer invalidate];
  openingHoursUpdateTimer = self->_openingHoursUpdateTimer;
  self->_openingHoursUpdateTimer = 0;

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  [(MKETAProvider *)self->_etaProvider cancel];
  etaProvider = self->_etaProvider;
  self->_etaProvider = 0;

  v7.receiver = self;
  v7.super_class = (Class)CarPlaceCardCardViewController;
  [(CarPlaceCardCardViewController *)&v7 dealloc];
}

- (void)_initializeGoButtonState
{
  if (self->_style == 1)
  {
    v3 = [(SearchResult *)self->_searchResult mapItem];
    v4 = [v3 _detourInfo];

    if (v4)
    {
      v5 = sub_100015DB4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CarPlaceCard: initializing with enabled go button due to having detourInfo", buf, 2u);
      }

      self->_goButtonEnabled = 1;
      self->_goButtonHidden = 0;
    }
    else
    {
      [(MKETAProvider *)self->_etaProvider removeObserver:self];
      [(MKETAProvider *)self->_etaProvider cancel];
      v6 = (MKETAProvider *)[objc_alloc((Class)MKETAProvider) initWithMapItem:v3];
      etaProvider = self->_etaProvider;
      self->_etaProvider = v6;

      [(MKETAProvider *)self->_etaProvider setAllowsDistantETA:1];
      [(MKETAProvider *)self->_etaProvider addObserver:self];
      v8 = sub_100015DB4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CarPlaceCard: disabling go button while waiting for ETA", v9, 2u);
      }

      self->_goButtonEnabled = 0;
      self->_goButtonHidden = [(MKETAProvider *)self->_etaProvider isLikelyToReturnETA] ^ 1;
      [(CarPlaceCardCardViewController *)self _startETAProviderIfNeeded];
    }
  }
}

- (void)_startETAProviderIfNeeded
{
  if ([(CarPlaceCardCardViewController *)self isViewLoaded])
  {
    v3 = sub_100015DB4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      etaProvider = self->_etaProvider;
      int v5 = 138543362;
      v6 = etaProvider;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CarPlaceCard: starting ETA provider: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    [(MKETAProvider *)self->_etaProvider start];
  }
}

- (void)viewDidLoad
{
  v87.receiver = self;
  v87.super_class = (Class)CarPlaceCardCardViewController;
  [(CarPlaceCardCardViewController *)&v87 viewDidLoad];
  v3 = [(CarPlaceCardCardViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CarPlaceCard"];

  LODWORD(v4) = 1144635392;
  int v5 = [(CarPlaceCardCardViewController *)self _createAutohidingTextlabelWithVerticalCompressionResistancePriority:v4];
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v5;

  [(CarAutohidingLabel *)self->_subtitleLabel setAccessibilityIdentifier:@"SubtitleLabel"];
  objc_super v7 = objc_alloc_init(CarStarRatingView);
  ratingView = self->_ratingView;
  self->_ratingView = v7;

  [(CarStarRatingView *)self->_ratingView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v9) = 1148846080;
  [(CarStarRatingView *)self->_ratingView setContentHuggingPriority:1 forAxis:v9];
  LODWORD(v10) = 1144684544;
  [(CarStarRatingView *)self->_ratingView setContentCompressionResistancePriority:1 forAxis:v10];
  LODWORD(v11) = 1144717312;
  id v12 = [(CarPlaceCardCardViewController *)self _createAutohidingTextlabelWithVerticalCompressionResistancePriority:v11];
  sharingETALabel = self->_sharingETALabel;
  self->_sharingETALabel = v12;

  [(CarAutohidingLabel *)self->_sharingETALabel setAccessibilityIdentifier:@"SharingETALabel"];
  id v14 = objc_alloc((Class)UIStackView);
  v15 = self->_ratingView;
  v88[0] = self->_subtitleLabel;
  v88[1] = v15;
  v88[2] = self->_sharingETALabel;
  v16 = +[NSArray arrayWithObjects:v88 count:3];
  v17 = (UIStackView *)[v14 initWithArrangedSubviews:v16];
  textStackView = self->_textStackView;
  self->_textStackView = v17;

  [(UIStackView *)self->_textStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_textStackView setAxis:1];
  [(UIStackView *)self->_textStackView setAlignment:1];
  [(UIStackView *)self->_textStackView setDistribution:0];
  [(UIStackView *)self->_textStackView setBaselineRelativeArrangement:1];
  [(UIStackView *)self->_textStackView setSpacing:15.0];
  LODWORD(v19) = 1144750080;
  [(UIStackView *)self->_textStackView setContentHuggingPriority:1 forAxis:v19];
  id v20 = [(CarPlaceCardCardViewController *)self view];
  [v20 addSubview:self->_textStackView];

  LODWORD(v21) = 1144619008;
  v22 = [(CarPlaceCardCardViewController *)self _createAutohidingTextlabelWithVerticalCompressionResistancePriority:v21];
  addressLabel = self->_addressLabel;
  self->_addressLabel = v22;

  [(CarAutohidingLabel *)self->_addressLabel setAccessibilityIdentifier:@"AddressLabel"];
  uint64_t v24 = [(CarPlaceCardCardViewController *)self view];
  [v24 addSubview:self->_addressLabel];

  v25 = [(CarPlaceCardCardViewController *)self evChargingViewModel];

  if (v25)
  {
    if ([(CarPlaceCardCardViewController *)self _shouldShowEVViewsInline])
    {
      v26 = [_TtC4Maps39CarEVChargingAvailabilityViewController alloc];
      objc_super v27 = [(CarPlaceCardCardViewController *)self evChargingViewModel];
      v28 = [(CarEVChargingAvailabilityViewController *)v26 initWithViewModal:v27];
      [(CarPlaceCardCardViewController *)self setEvChargingAvailabilityVC:v28];

      v29 = [(CarPlaceCardCardViewController *)self evChargingAvailabilityVC];
      [(CarPlaceCardCardViewController *)self addChildViewController:v29];

      __int16 v30 = [(CarPlaceCardCardViewController *)self view];
      v31 = [(CarPlaceCardCardViewController *)self evChargingAvailabilityVC];
      __int16 v32 = [v31 view];
      [v30 addSubview:v32];

      id v33 = [(CarPlaceCardCardViewController *)self evChargingAvailabilityVC];
      v34 = [v33 view];
      [v34 setTranslatesAutoresizingMaskIntoConstraints:0];

      v35 = [(CarPlaceCardCardViewController *)self evChargingAvailabilityVC];
      [v35 didMoveToParentViewController:self];
    }
    else
    {
      id v36 = objc_alloc((Class)UILabel);
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      v40 = [v36 initWithFrame:CGRectZero.origin.x, y, width, height];
      evChargingTitleLabel = self->_evChargingTitleLabel;
      self->_evChargingTitleLabel = v40;

      [(UILabel *)self->_evChargingTitleLabel setAccessibilityIdentifier:@"EVChargingTitleLabel"];
      [(UILabel *)self->_evChargingTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v42) = 1148846080;
      [(UILabel *)self->_evChargingTitleLabel setContentHuggingPriority:1 forAxis:v42];
      LODWORD(v43) = 1144700928;
      [(UILabel *)self->_evChargingTitleLabel setContentCompressionResistancePriority:0 forAxis:v43];
      v44 = [(CarPlaceCardCardViewController *)self view];
      [v44 addSubview:self->_evChargingTitleLabel];

      v45 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
      evChargingAvailabilityLabel = self->_evChargingAvailabilityLabel;
      self->_evChargingAvailabilityLabel = v45;

      [(UILabel *)self->_evChargingAvailabilityLabel setAccessibilityIdentifier:@"EVChargingAvailabilityLabel"];
      [(UILabel *)self->_evChargingAvailabilityLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v47) = 1148846080;
      [(UILabel *)self->_evChargingAvailabilityLabel setContentHuggingPriority:1 forAxis:v47];
      LODWORD(v48) = 1144700928;
      [(UILabel *)self->_evChargingAvailabilityLabel setContentCompressionResistancePriority:0 forAxis:v48];
      v49 = [(CarPlaceCardCardViewController *)self view];
      [v49 addSubview:self->_evChargingAvailabilityLabel];

      v50 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
      evChargingMoreButton = self->_evChargingMoreButton;
      self->_evChargingMoreButton = v50;

      [(CarCardRoundedButton *)self->_evChargingMoreButton setAccessibilityIdentifier:@"EVChargingMoreButton"];
      [(CarCardRoundedButton *)self->_evChargingMoreButton setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v52) = 1132068864;
      [(CarCardRoundedButton *)self->_evChargingMoreButton setContentHuggingPriority:1 forAxis:v52];
      LODWORD(v53) = 1148846080;
      [(CarCardRoundedButton *)self->_evChargingMoreButton setContentCompressionResistancePriority:0 forAxis:v53];
      LODWORD(v54) = 1148846080;
      [(CarCardRoundedButton *)self->_evChargingMoreButton setContentCompressionResistancePriority:1 forAxis:v54];
      [(CarCardRoundedButton *)self->_evChargingMoreButton addTarget:self action:"_evChargingMoreButtonPressed:" forControlEvents:64];
      v35 = [(CarPlaceCardCardViewController *)self view];
      [v35 addSubview:self->_evChargingMoreButton];
    }
  }
  id v55 = objc_alloc((Class)UILabel);
  double v56 = CGRectZero.origin.y;
  double v57 = CGRectZero.size.width;
  double v58 = CGRectZero.size.height;
  v59 = [v55 initWithFrame:CGRectZero.origin.x, v56, v57, v58];
  etaLabel = self->_etaLabel;
  self->_etaLabel = v59;

  [(UILabel *)self->_etaLabel setAccessibilityIdentifier:@"ETALabel"];
  [(UILabel *)self->_etaLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v61) = 1144733696;
  [(UILabel *)self->_etaLabel setContentHuggingPriority:1 forAxis:v61];
  LODWORD(v62) = 1144733696;
  [(UILabel *)self->_etaLabel setContentCompressionResistancePriority:0 forAxis:v62];
  v63 = [(CarPlaceCardCardViewController *)self view];
  [v63 addSubview:self->_etaLabel];

  v64 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, v56, v57, v58];
  mainDescriptionLabel = self->_mainDescriptionLabel;
  self->_mainDescriptionLabel = v64;

  [(UILabel *)self->_mainDescriptionLabel setAccessibilityIdentifier:@"MainDescriptionLabel"];
  [(UILabel *)self->_mainDescriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v66) = 1148846080;
  [(UILabel *)self->_mainDescriptionLabel setContentHuggingPriority:1 forAxis:v66];
  LODWORD(v67) = 1148829696;
  [(UILabel *)self->_mainDescriptionLabel setContentCompressionResistancePriority:0 forAxis:v67];
  LODWORD(v68) = 1144668160;
  [(UILabel *)self->_mainDescriptionLabel setContentCompressionResistancePriority:1 forAxis:v68];
  v69 = [(CarPlaceCardCardViewController *)self view];
  [v69 addSubview:self->_mainDescriptionLabel];

  v70 = -[CarAdvisoriesView initWithFrame:]([CarAdvisoriesView alloc], "initWithFrame:", CGRectZero.origin.x, v56, v57, v58);
  routeAdvisoriesView = self->_routeAdvisoriesView;
  self->_routeAdvisoriesView = v70;

  [(CarAdvisoriesView *)self->_routeAdvisoriesView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v72) = 1148846080;
  [(CarAdvisoriesView *)self->_routeAdvisoriesView setContentHuggingPriority:1 forAxis:v72];
  LODWORD(v73) = 1144651776;
  [(CarAdvisoriesView *)self->_routeAdvisoriesView setContentCompressionResistancePriority:1 forAxis:v73];
  v74 = [(CarPlaceCardCardViewController *)self view];
  [v74 addSubview:self->_routeAdvisoriesView];

  v75 = -[CarCardRoundedButton initWithFrame:]([CarMoreButton alloc], "initWithFrame:", CGRectZero.origin.x, v56, v57, v58);
  moreButton = self->_moreButton;
  self->_moreButton = v75;

  [(CarMoreButton *)self->_moreButton setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v77) = 1132068864;
  [(CarMoreButton *)self->_moreButton setContentHuggingPriority:1 forAxis:v77];
  LODWORD(v78) = 1148846080;
  [(CarMoreButton *)self->_moreButton setContentCompressionResistancePriority:0 forAxis:v78];
  LODWORD(v79) = 1148846080;
  [(CarMoreButton *)self->_moreButton setContentCompressionResistancePriority:1 forAxis:v79];
  [(CarMoreButton *)self->_moreButton addTarget:self action:"_moreButtonPressed:" forControlEvents:64];
  v80 = [(CarPlaceCardCardViewController *)self view];
  [v80 addSubview:self->_moreButton];

  v81 = -[CarCardRoundedButton initWithFrame:]([CarLoadingButton alloc], "initWithFrame:", CGRectZero.origin.x, v56, v57, v58);
  goButton = self->_goButton;
  self->_goButton = v81;

  [(CarLoadingButton *)self->_goButton setAccessibilityIdentifier:@"GoButton"];
  [(CarLoadingButton *)self->_goButton setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v83) = 1148846080;
  [(CarLoadingButton *)self->_goButton setContentHuggingPriority:1 forAxis:v83];
  LODWORD(v84) = 1148846080;
  [(CarLoadingButton *)self->_goButton setContentCompressionResistancePriority:1 forAxis:v84];
  [(CarLoadingButton *)self->_goButton addTarget:self action:"_goButtonPressed:" forControlEvents:64];
  v85 = [(CarPlaceCardCardViewController *)self view];
  [v85 addSubview:self->_goButton];

  [(CarPlaceCardCardViewController *)self _setupConstraints];
  [(CarPlaceCardCardViewController *)self _setupStyling];
  [(CarPlaceCardCardViewController *)self _updateContents];
  [(CarPlaceCardCardViewController *)self _captureAnalytics];
  [(CarPlaceCardCardViewController *)self _startETAProviderIfNeeded];
  evChargingViewModel = self->_evChargingViewModel;
  if (evChargingViewModel) {
    [(CarPlaceCardEVChargingViewModel *)evChargingViewModel setObserver:self];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarPlaceCardCardViewController;
  [(CarPlaceCardCardViewController *)&v4 viewDidAppear:a3];
  self->_goButtonIsFocusable = 0;
  [(CarPlaceCardCardViewController *)self _updateContents];
  +[PPTNotificationCenter postNotificationIfNeededWithName:@"CarPlaceCardCardViewControllerDidAppearNotification" object:self userInfo:0];
  [(CarPlaceCardEVChargingViewModel *)self->_evChargingViewModel setIsActive:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarPlaceCardCardViewController;
  [(CarPlaceCardCardViewController *)&v4 viewDidDisappear:a3];
  [(CarPlaceCardEVChargingViewModel *)self->_evChargingViewModel setIsActive:0];
}

- (void)_setupConstraints
{
  v155 = +[NSMutableArray array];
  v145 = [(UIStackView *)self->_textStackView firstBaselineAnchor];
  v151 = [(CarPlaceCardCardViewController *)self view];
  v139 = [v151 topAnchor];
  v133 = [v145 constraintEqualToAnchor:v139 constant:-1.0];
  v162[0] = v133;
  v122 = [(UIStackView *)self->_textStackView leadingAnchor];
  v127 = [(CarPlaceCardCardViewController *)self view];
  v117 = [v127 leadingAnchor];
  v112 = [v122 constraintEqualToAnchor:v117 constant:10.0];
  v162[1] = v112;
  v107 = [(UIStackView *)self->_textStackView trailingAnchor];
  v3 = [(CarPlaceCardCardViewController *)self view];
  objc_super v4 = [v3 trailingAnchor];
  int v5 = [v107 constraintEqualToAnchor:v4 constant:-10.0];
  v162[2] = v5;
  v6 = [(UIStackView *)self->_textStackView bottomAnchor];
  objc_super v7 = [(CarPlaceCardCardViewController *)self view];
  v8 = [v7 bottomAnchor];
  double v9 = [v6 constraintLessThanOrEqualToAnchor:v8];
  v162[3] = v9;
  double v10 = +[NSArray arrayWithObjects:v162 count:4];
  [v155 addObjectsFromArray:v10];

  addressLabel = self->_addressLabel;
  id v12 = self->_textStackView;
  [(CarAutohidingLabel *)addressLabel firstBaselineAnchor];
  v152 = v146 = v12;
  v140 = [(UIStackView *)v12 lastBaselineAnchor];
  LODWORD(v13) = 1144602624;
  v134 = [v152 constraintEqualToAnchor:v140 constant:20.0 priority:v13];
  v161[0] = v134;
  v128 = [(CarAutohidingLabel *)self->_addressLabel firstBaselineAnchor];
  v123 = [(UIStackView *)v12 lastBaselineAnchor];
  v118 = [v128 constraintGreaterThanOrEqualToAnchor:v123 constant:14.0];
  v161[1] = v118;
  v113 = [(CarAutohidingLabel *)self->_addressLabel heightAnchor];
  v108 = [v113 constraintGreaterThanOrEqualToConstant:20.0];
  v161[2] = v108;
  v104 = [(CarAutohidingLabel *)self->_addressLabel leadingAnchor];
  id v14 = [(CarPlaceCardCardViewController *)self view];
  v15 = [v14 leadingAnchor];
  v16 = [v104 constraintEqualToAnchor:v15 constant:10.0];
  v161[3] = v16;
  v17 = [(CarAutohidingLabel *)self->_addressLabel trailingAnchor];
  v18 = [(CarPlaceCardCardViewController *)self view];
  double v19 = [v18 trailingAnchor];
  id v20 = [v17 constraintEqualToAnchor:v19 constant:-10.0];
  v161[4] = v20;
  double v21 = +[NSArray arrayWithObjects:v161 count:5];
  [v155 addObjectsFromArray:v21];

  v22 = self->_addressLabel;
  v23 = [(CarPlaceCardCardViewController *)self evChargingViewModel];

  if (v23)
  {
    v153 = v22;
    if ([(CarPlaceCardCardViewController *)self _shouldShowEVViewsInline])
    {
      uint64_t v24 = [(CarPlaceCardCardViewController *)self evChargingAvailabilityVC];
      v25 = [v24 view];

      v147 = [(UILabel *)v25 topAnchor];
      v141 = [(CarAutohidingLabel *)v22 lastBaselineAnchor];
      v135 = [v147 constraintEqualToAnchor:v141 constant:12.0];
      v160[0] = v135;
      v129 = [(UILabel *)v25 leadingAnchor];
      v26 = [(CarPlaceCardCardViewController *)self view];
      objc_super v27 = [v26 leadingAnchor];
      v28 = [v129 constraintEqualToAnchor:v27 constant:10.0];
      v160[1] = v28;
      v29 = [(UILabel *)v25 trailingAnchor];
      __int16 v30 = [(CarPlaceCardCardViewController *)self view];
      v31 = [v30 trailingAnchor];
      __int16 v32 = [v29 constraintEqualToAnchor:v31 constant:-10.0];
      v160[2] = v32;
      id v33 = +[NSArray arrayWithObjects:v160 count:3];
      [v155 addObjectsFromArray:v33];
    }
    else
    {
      v148 = [(CarCardRoundedButton *)self->_evChargingMoreButton topAnchor];
      v142 = [(CarAutohidingLabel *)v22 lastBaselineAnchor];
      v136 = [v148 constraintEqualToAnchor:v142 constant:6.0];
      v159[0] = v136;
      v130 = [(CarCardRoundedButton *)self->_evChargingMoreButton heightAnchor];
      v124 = [v130 constraintEqualToConstant:30.0];
      v159[1] = v124;
      v119 = [(CarCardRoundedButton *)self->_evChargingMoreButton widthAnchor];
      v114 = [v119 constraintEqualToConstant:30.0];
      v159[2] = v114;
      v105 = [(CarCardRoundedButton *)self->_evChargingMoreButton trailingAnchor];
      v109 = [(CarPlaceCardCardViewController *)self view];
      v101 = [v109 trailingAnchor];
      v98 = [v105 constraintEqualToAnchor:v101 constant:-10.0];
      v159[3] = v98;
      v96 = [(UILabel *)self->_evChargingTitleLabel bottomAnchor];
      v93 = [(UILabel *)self->_evChargingAvailabilityLabel topAnchor];
      v91 = [v96 constraintEqualToAnchor:v93 constant:2.0];
      v159[4] = v91;
      objc_super v87 = [(UILabel *)self->_evChargingTitleLabel leadingAnchor];
      v89 = [(CarPlaceCardCardViewController *)self view];
      double v84 = [v89 leadingAnchor];
      v82 = [v87 constraintEqualToAnchor:v84 constant:10.0];
      v159[5] = v82;
      v80 = [(UILabel *)self->_evChargingTitleLabel trailingAnchor];
      double v78 = [(CarCardRoundedButton *)self->_evChargingMoreButton leadingAnchor];
      v76 = [v80 constraintLessThanOrEqualToAnchor:v78 constant:-10.0];
      v159[6] = v76;
      v74 = [(UILabel *)self->_evChargingAvailabilityLabel bottomAnchor];
      double v72 = [(CarCardRoundedButton *)self->_evChargingMoreButton bottomAnchor];
      v34 = [v74 constraintEqualToAnchor:v72];
      v159[7] = v34;
      v35 = [(UILabel *)self->_evChargingAvailabilityLabel leadingAnchor];
      id v36 = [(CarPlaceCardCardViewController *)self view];
      v37 = [v36 leadingAnchor];
      v38 = [v35 constraintEqualToAnchor:v37 constant:10.0];
      v159[8] = v38;
      v39 = [(UILabel *)self->_evChargingAvailabilityLabel trailingAnchor];
      v40 = [(CarCardRoundedButton *)self->_evChargingMoreButton leadingAnchor];
      v41 = [v39 constraintLessThanOrEqualToAnchor:v40 constant:-10.0];
      v159[9] = v41;
      double v42 = +[NSArray arrayWithObjects:v159 count:10];
      evChargingSummaryViewConstraints = self->_evChargingSummaryViewConstraints;
      self->_evChargingSummaryViewConstraints = v42;

      [v155 addObjectsFromArray:self->_evChargingSummaryViewConstraints];
      v25 = self->_evChargingAvailabilityLabel;
    }

    v22 = (CarAutohidingLabel *)v25;
  }
  v154 = v22;
  v149 = [(CarMoreButton *)self->_moreButton topAnchor];
  v143 = [(CarAutohidingLabel *)v22 lastBaselineAnchor];
  v137 = [v149 constraintGreaterThanOrEqualToAnchor:v143 constant:6.0];
  v158[0] = v137;
  v131 = [(UILabel *)self->_etaLabel bottomAnchor];
  v125 = [(UILabel *)self->_mainDescriptionLabel topAnchor];
  v120 = [v131 constraintEqualToAnchor:v125 constant:2.0];
  v158[1] = v120;
  v110 = [(UILabel *)self->_etaLabel leadingAnchor];
  v115 = [(CarPlaceCardCardViewController *)self view];
  v102 = [v115 leadingAnchor];
  v99 = [v110 constraintEqualToAnchor:v102 constant:10.0];
  v158[2] = v99;
  v97 = [(UILabel *)self->_mainDescriptionLabel bottomAnchor];
  v94 = [(CarMoreButton *)self->_moreButton bottomAnchor];
  v44 = [v97 constraintEqualToAnchor:v94];
  v158[3] = v44;
  v45 = [(UILabel *)self->_mainDescriptionLabel leadingAnchor];
  v46 = [(CarPlaceCardCardViewController *)self view];
  double v47 = [v46 leadingAnchor];
  double v48 = [v45 constraintEqualToAnchor:v47 constant:10.0];
  v158[4] = v48;
  v49 = [(UILabel *)self->_mainDescriptionLabel trailingAnchor];
  v50 = [(UILabel *)self->_etaLabel trailingAnchor];
  v51 = [v49 constraintEqualToAnchor:v50];
  v158[5] = v51;
  double v52 = +[NSArray arrayWithObjects:v158 count:6];
  [v155 addObjectsFromArray:v52];

  double v53 = [(CarPlaceCardCardViewController *)self _createEtaLabelTrailingConstraint];
  etaLabelTrailingConstraint = self->_etaLabelTrailingConstraint;
  self->_etaLabelTrailingConstraint = v53;

  [v155 addObject:self->_etaLabelTrailingConstraint];
  v150 = [(CarMoreButton *)self->_moreButton heightAnchor];
  v144 = [v150 constraintEqualToConstant:30.0];
  v157[0] = v144;
  v138 = [(CarMoreButton *)self->_moreButton widthAnchor];
  v132 = [v138 constraintEqualToConstant:30.0];
  v157[1] = v132;
  v121 = [(CarMoreButton *)self->_moreButton trailingAnchor];
  v126 = [(CarPlaceCardCardViewController *)self view];
  v116 = [v126 trailingAnchor];
  v111 = [v121 constraintEqualToAnchor:v116 constant:-10.0];
  v157[2] = v111;
  v106 = [(CarMoreButton *)self->_moreButton bottomAnchor];
  v103 = [(CarAdvisoriesView *)self->_routeAdvisoriesView topAnchor];
  v100 = [v106 constraintLessThanOrEqualToAnchor:v103 constant:-6.0];
  v157[3] = v100;
  v92 = [(CarAdvisoriesView *)self->_routeAdvisoriesView leadingAnchor];
  v95 = [(CarPlaceCardCardViewController *)self view];
  v90 = [v95 leadingAnchor];
  v88 = [v92 constraintEqualToAnchor:v90 constant:10.0];
  v157[4] = v88;
  v85 = [(CarAdvisoriesView *)self->_routeAdvisoriesView trailingAnchor];
  v86 = [(CarPlaceCardCardViewController *)self view];
  double v83 = [v86 trailingAnchor];
  v81 = [v85 constraintEqualToAnchor:v83 constant:-10.0];
  v157[5] = v81;
  double v79 = [(CarAdvisoriesView *)self->_routeAdvisoriesView bottomAnchor];
  double v77 = [(CarLoadingButton *)self->_goButton topAnchor];
  v75 = [v79 constraintLessThanOrEqualToAnchor:v77 constant:-6.0];
  v157[6] = v75;
  v71 = [(CarLoadingButton *)self->_goButton leadingAnchor];
  double v73 = [(CarPlaceCardCardViewController *)self view];
  v70 = [v73 leadingAnchor];
  v69 = [v71 constraintEqualToAnchor:v70 constant:10.0];
  v157[7] = v69;
  double v67 = [(CarLoadingButton *)self->_goButton trailingAnchor];
  double v68 = [(CarPlaceCardCardViewController *)self view];
  id v55 = [v68 trailingAnchor];
  double v56 = [v67 constraintEqualToAnchor:v55 constant:-10.0];
  v157[8] = v56;
  double v57 = [(CarLoadingButton *)self->_goButton heightAnchor];
  +[CarCardRoundedButton buttonMetrics];
  double v58 = [v57 constraintEqualToConstant:v156];
  v157[9] = v58;
  v59 = [(CarLoadingButton *)self->_goButton bottomAnchor];
  v60 = [(CarPlaceCardCardViewController *)self view];
  double v61 = [v60 bottomAnchor];
  double v62 = [v59 constraintEqualToAnchor:v61 constant:-10.0];
  v157[10] = v62;
  v63 = +[NSArray arrayWithObjects:v157 count:11];
  [v155 addObjectsFromArray:v63];

  v64 = [(CarAdvisoriesView *)self->_routeAdvisoriesView heightAnchor];
  v65 = [v64 constraintEqualToConstant:0.0];
  routeAdvisoriesHeightConstraint = self->_routeAdvisoriesHeightConstraint;
  self->_routeAdvisoriesHeightConstraint = v65;

  +[NSLayoutConstraint activateConstraints:v155];
}

- (void)_setupStyling
{
  v3 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption2 weight:UIFontWeightRegular];
  [(CarAutohidingLabel *)self->_subtitleLabel setFont:v3];

  objc_super v4 = +[UIColor _carSystemPrimaryColor];
  [(CarAutohidingLabel *)self->_subtitleLabel setTextColor:v4];

  [(CarAutohidingLabel *)self->_subtitleLabel setLineBreakMode:4];
  [(CarAutohidingLabel *)self->_subtitleLabel setNumberOfLines:1];
  int v5 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption1 traits:0x8000];
  [(CarAutohidingLabel *)self->_addressLabel setFont:v5];

  v6 = +[UIColor _carSystemPrimaryColor];
  [(CarAutohidingLabel *)self->_addressLabel setTextColor:v6];

  [(CarAutohidingLabel *)self->_addressLabel setLineBreakMode:4];
  [(CarAutohidingLabel *)self->_addressLabel setNumberOfLines:3];
  objc_super v7 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleFootnote weight:UIFontWeightMedium];
  [(UILabel *)self->_evChargingTitleLabel setFont:v7];

  v8 = +[UIColor labelColor];
  [(UILabel *)self->_evChargingTitleLabel setTextColor:v8];

  [(UILabel *)self->_evChargingTitleLabel setLineBreakMode:4];
  [(UILabel *)self->_evChargingTitleLabel setNumberOfLines:1];
  double v9 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption1 weight:UIFontWeightRegular];
  [(UILabel *)self->_evChargingAvailabilityLabel setFont:v9];

  double v10 = +[UIColor labelColor];
  [(UILabel *)self->_evChargingAvailabilityLabel setTextColor:v10];

  [(UILabel *)self->_evChargingAvailabilityLabel setLineBreakMode:4];
  [(UILabel *)self->_evChargingAvailabilityLabel setNumberOfLines:1];
  double v11 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption2 weight:UIFontWeightRegular];
  [(CarAutohidingLabel *)self->_sharingETALabel setFont:v11];

  id v12 = +[UIColor _carSystemSecondaryColor];
  [(CarAutohidingLabel *)self->_sharingETALabel setTextColor:v12];

  [(CarAutohidingLabel *)self->_sharingETALabel setLineBreakMode:4];
  [(CarAutohidingLabel *)self->_sharingETALabel setNumberOfLines:1];
  double v13 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleFootnote weight:UIFontWeightMedium];
  [(UILabel *)self->_etaLabel setFont:v13];

  id v14 = +[UIColor labelColor];
  [(UILabel *)self->_etaLabel setTextColor:v14];

  [(UILabel *)self->_etaLabel setLineBreakMode:4];
  [(UILabel *)self->_etaLabel setNumberOfLines:1];
  v15 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption1 weight:UIFontWeightRegular];
  uint64_t v16 = 88;
  [(UILabel *)self->_mainDescriptionLabel setFont:v15];

  v17 = +[UIColor _carSystemPrimaryColor];
  [(UILabel *)self->_mainDescriptionLabel setTextColor:v17];

  v18 = [(UILabel *)self->_mainDescriptionLabel font];
  [v18 pointSize];
  mainDescriptionLabel = self->_mainDescriptionLabel;
  if (10.0 / v19 > 1.0)
  {
    [(UILabel *)mainDescriptionLabel setMinimumScaleFactor:1.0];
  }
  else
  {
    double v21 = [(UILabel *)mainDescriptionLabel font];
    [v21 pointSize];
    [(UILabel *)self->_mainDescriptionLabel setMinimumScaleFactor:10.0 / v22];
  }
  [(UILabel *)self->_mainDescriptionLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_mainDescriptionLabel setLineBreakMode:4];
  [(UILabel *)self->_mainDescriptionLabel setNumberOfLines:1];
  v23 = +[UIColor systemWhiteColor];
  [(CarFocusableButton *)self->_goButton setNonFocusedTintColor:v23];

  uint64_t v24 = sub_100D899C4([(CarPlaceCardCardViewController *)self isGoButtonEnabled]);
  [(CarFocusableButton *)self->_goButton setNonFocusedBackgroundColor:v24];

  v25 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCallout weight:UIFontWeightBold];
  v26 = [(CarLoadingButton *)self->_goButton titleLabel];
  [v26 setFont:v25];

  objc_super v27 = [(CarLoadingButton *)self->_goButton titleLabel];
  [v27 setAdjustsFontSizeToFitWidth:1];

  id v34 = [(CarLoadingButton *)self->_goButton titleLabel];
  v28 = [v34 font];
  [v28 pointSize];
  double v30 = 10.0 / v29;
  double v31 = 1.0;
  if (10.0 / v29 <= 1.0)
  {
    v26 = [(CarLoadingButton *)self->_goButton titleLabel];
    uint64_t v16 = [v26 font];
    [(id)v16 pointSize];
    double v31 = 10.0 / v32;
  }
  id v33 = [(CarLoadingButton *)self->_goButton titleLabel];
  [v33 setMinimumScaleFactor:v31];

  if (v30 <= 1.0)
  {
  }
}

- (void)_updateMoreButton
{
  v3 = +[UIApplication sharedApplication];
  objc_super v4 = +[NSURL URLWithString:@"tel:"];
  unsigned __int8 v5 = [v3 canOpenURL:v4];

  v6 = [(SearchResult *)self->_searchResult mapItem];
  objc_super v7 = [v6 phoneNumber];

  if ((v5 & (v7 != 0)) != 0) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 1;
  }
  if ([(CarPlaceCardCardViewController *)self isHandoffEnabled]
    && ![(CarPlaceCardCardViewController *)self _shouldHideNavigationRelatedInfo])
  {
    v8 |= 4uLL;
  }
  [(CarMoreButton *)self->_moreButton setOptions:v8];

  [(CarPlaceCardCardViewController *)self setShouldDisplayMoreButton:v8 != 1];
}

- (void)_updateConstraints
{
  if ([(CarPlaceCardCardViewController *)self isViewLoaded])
  {
    if (self->_etaLabelTrailingConstraint)
    {
      etaLabelTrailingConstraint = self->_etaLabelTrailingConstraint;
      v3 = +[NSArray arrayWithObjects:&etaLabelTrailingConstraint count:1];
      +[NSLayoutConstraint deactivateConstraints:v3];
    }
    objc_super v4 = [(CarPlaceCardCardViewController *)self _createEtaLabelTrailingConstraint];
    unsigned __int8 v5 = self->_etaLabelTrailingConstraint;
    self->_etaLabelTrailingConstraint = v4;

    objc_super v7 = self->_etaLabelTrailingConstraint;
    v6 = +[NSArray arrayWithObjects:&v7 count:1];
    +[NSLayoutConstraint activateConstraints:v6];
  }
}

- (void)_updateContents
{
  BOOL v3 = [(CarPlaceCardCardViewController *)self _shouldHideNavigationRelatedInfo];
  objc_super v4 = [(CarPlaceCardCardViewController *)self _subtitleString];
  [(CarAutohidingLabel *)self->_subtitleLabel setAttributedText:v4];

  unsigned __int8 v5 = [(CarAutohidingLabel *)self->_subtitleLabel attributedText];
  -[CarAutohidingLabel setHidden:](self->_subtitleLabel, "setHidden:", [v5 length] == 0);

  if (!self->_openingHoursUpdateTimer)
  {
    v6 = [(CarPlaceCardCardViewController *)self mapItem];
    unsigned int v7 = [v6 _hasBusinessHours];

    if (v7) {
      [(CarPlaceCardCardViewController *)self _scheduleOpeningHoursUpdate];
    }
  }
  ratingView = self->_ratingView;
  double v9 = [(CarPlaceCardCardViewController *)self mapItem];
  [(CarStarRatingView *)ratingView setupWithMapItem:v9];

  double v10 = [(CarPlaceCardCardViewController *)self mapItem];
  -[CarStarRatingView setHidden:](self->_ratingView, "setHidden:", [v10 _hasUserRatingScore] ^ 1);

  double v11 = [(CarPlaceCardCardViewController *)self mapItem];
  id v12 = [v11 _addressFormattedAsShortenedAddress];
  [(CarAutohidingLabel *)self->_addressLabel setText:v12];

  if (![(CarPlaceCardCardViewController *)self _shouldShowEVViewsInline])
  {
    double v13 = [(CarPlaceCardCardViewController *)self evChargingViewModel];
    unsigned int v14 = [v13 hasSummaryInfo];

    if (v14)
    {
      v15 = [(CarPlaceCardCardViewController *)self evChargingViewModel];
      uint64_t v16 = [v15 summaryTitle];
      [(UILabel *)self->_evChargingTitleLabel setText:v16];

      v17 = [(CarPlaceCardCardViewController *)self evChargingViewModel];
      v18 = [v17 summaryDescription];
      [(UILabel *)self->_evChargingAvailabilityLabel setAttributedText:v18];

      double v19 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleFootnote];
      id v20 = +[MUEVChargingHelper evPlugIconWithConfiguration:v19];

      [(CarCardRoundedButton *)self->_evChargingMoreButton setImage:v20 forState:0];
    }
    [(UILabel *)self->_evChargingTitleLabel setHidden:v14 ^ 1];
    [(UILabel *)self->_evChargingAvailabilityLabel setHidden:v14 ^ 1];
    [(CarCardRoundedButton *)self->_evChargingMoreButton setHidden:v14 ^ 1];
    if ([(NSArray *)self->_evChargingSummaryViewConstraints count])
    {
      evChargingSummaryViewConstraints = self->_evChargingSummaryViewConstraints;
      if (v14) {
        +[NSLayoutConstraint activateConstraints:evChargingSummaryViewConstraints];
      }
      else {
        +[NSLayoutConstraint deactivateConstraints:evChargingSummaryViewConstraints];
      }
    }
  }
  double v22 = [(CarPlaceCardCardViewController *)self _sharingETAString];
  [(CarAutohidingLabel *)self->_sharingETALabel setText:v22];

  v23 = [(CarAutohidingLabel *)self->_sharingETALabel attributedText];
  -[CarAutohidingLabel setHidden:](self->_sharingETALabel, "setHidden:", [v23 length] == 0);

  [(CarPlaceCardCardViewController *)self _updateETA];
  if (!self->_etaUpdateTimer && ![(CarPlaceCardCardViewController *)self style]) {
    [(CarPlaceCardCardViewController *)self _scheduleETAUpdate];
  }
  [(CarPlaceCardCardViewController *)self _updateETARelatedContents];
  [(UILabel *)self->_etaLabel setHidden:v3];
  [(UILabel *)self->_mainDescriptionLabel setHidden:v3];
  [(CarPlaceCardCardViewController *)self _updateMoreButton];
  [(CarMoreButton *)self->_moreButton setHidden:[(CarPlaceCardCardViewController *)self shouldDisplayMoreButton] ^ 1];
  if ([(CarPlaceCardCardViewController *)self isLoading])
  {
    [(CarLoadingButton *)self->_goButton setTitle:0 forState:0];
    [(CarLoadingButton *)self->_goButton setImage:0 forState:0];
  }
  else
  {
    if ([(CarPlaceCardCardViewController *)self isNavigationAidedDrivingEnabled])
    {
      uint64_t v24 = +[MapsExternalDevice sharedInstance];
      v25 = [v24 mapsDisplayName];
      v26 = v25;
      if (v25)
      {
        id v27 = v25;
      }
      else
      {
        sub_1008A68F8();
        id v27 = (id)objc_claimAutoreleasedReturnValue();
      }
      double v32 = v27;

      [(CarLoadingButton *)self->_goButton setTitle:v32 forState:0];
      id v33 = +[UIImage _mapsCar_systemImageNamed:@"square.and.arrow.up"];
    }
    else
    {
      int64_t v28 = [(CarPlaceCardCardViewController *)self style];
      double v29 = +[NSBundle mainBundle];
      double v30 = v29;
      if (v28 == 1) {
        CFStringRef v31 = @"Car_ADD_STOP_BUTTON";
      }
      else {
        CFStringRef v31 = @"Car_START_BUTTON";
      }
      double v32 = [v29 localizedStringForKey:v31 value:@"localized string not found" table:0];

      id v33 = 0;
      if ((id)[(CarPlaceCardCardViewController *)self style] == (id)1)
      {
        id v33 = +[UIImage systemImageNamed:@"plus.circle.fill"];
      }
      [(CarLoadingButton *)self->_goButton setTitle:v32 forState:0];
    }
    [(CarLoadingButton *)self->_goButton setImage:v33 forState:0];
  }
  BOOL goButtonIsFocusable = self->_goButtonIsFocusable;
  [(CarLoadingButton *)self->_goButton setLoading:[(CarPlaceCardCardViewController *)self isLoading]];
  [(CarLoadingButton *)self->_goButton setHidden:[(CarPlaceCardCardViewController *)self isGoButtonHidden]];
  [(CarFocusableButton *)self->_goButton setEnabled:[(CarPlaceCardCardViewController *)self isGoButtonEnabled]];
  int64_t style = self->_style;
  char v36 = [(CarLoadingButton *)self->_goButton isEnabled];
  if (style == 1) {
    sub_100D89A30(v36);
  }
  else {
  v37 = sub_100D899C4(v36);
  }
  [(CarFocusableButton *)self->_goButton setNonFocusedBackgroundColor:v37];

  if ([(CarPlaceCardCardViewController *)self _isGoButtonFocusable])
  {
    unsigned int v38 = [(CarPlaceCardCardViewController *)self _canSafelyRequestFocusUpdate];
    if (!goButtonIsFocusable)
    {
      if (v38)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10073B938;
        block[3] = &unk_1012E5D08;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
  BOOL v39 = [(CarPlaceCardCardViewController *)self _isGoButtonFocusable];
  if (v39) {
    LOBYTE(v39) = [(CarPlaceCardCardViewController *)self _canSafelyRequestFocusUpdate];
  }
  self->_BOOL goButtonIsFocusable = v39;
  [(CarPlaceCardCardViewController *)self _updateRouteAdvisoriesStack];
}

- (void)_updateRouteAdvisoriesStack
{
  BOOL v3 = [(CarPlaceCardCardViewController *)self dataSource];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    routeAdvisoriesView = self->_routeAdvisoriesView;
    v6 = [(CarPlaceCardCardViewController *)self dataSource];
    unsigned int v7 = [v6 currentRoute];
    [(CarAdvisoriesView *)routeAdvisoriesView setRoute:v7];

    if ([(CarAdvisoriesView *)self->_routeAdvisoriesView count]) {
      BOOL v8 = [(CarPlaceCardCardViewController *)self _shouldHideNavigationRelatedInfo];
    }
    else {
      BOOL v8 = 1;
    }
    [(NSLayoutConstraint *)self->_routeAdvisoriesHeightConstraint setActive:v8];
    double v9 = self->_routeAdvisoriesView;
    [(CarAdvisoriesView *)v9 setHidden:v8];
  }
}

- (void)_updateETARelatedContents
{
  int64_t v3 = [(CarPlaceCardCardViewController *)self style];
  if (v3 == 1)
  {
    BOOL v8 = [(CarPlaceCardCardViewController *)self mapItem];
    double v9 = [v8 _maps_detourTextForIdiom:3];
    [(UILabel *)self->_etaLabel setText:v9];

    latestETA = self->_latestETA;
    if (latestETA)
    {
      [(GuidanceETA *)latestETA remainingDistance];
      +[NSString _navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:](NSString, "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:", 0, 1, 0, 0, 0);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      double v11 = +[NSBundle mainBundle];
      id v12 = [v11 localizedStringForKey:@"%@ miles away" value:@"localized string not found" table:0];
      double v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v18);
      [(UILabel *)self->_mainDescriptionLabel setText:v13];

LABEL_11:

      return;
    }
  }
  else
  {
    if (v3) {
      return;
    }
    if (self->_latestETA)
    {
      char v4 = +[NSBundle mainBundle];
      unsigned __int8 v5 = [v4 localizedStringForKey:@"00:00 ETA [CarPlay]" value:@"localized string not found" table:0];
      v6 = [(GuidanceETA *)self->_latestETA etaDateStringWithAMPMSymbol:0 allowTimeZone:0];
      unsigned int v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6);
      [(UILabel *)self->_etaLabel setText:v7];
    }
    else
    {
      [(UILabel *)self->_etaLabel setText:0];
    }
    unsigned int v14 = [(CarPlaceCardCardViewController *)self dataSource];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v18 = [(CarPlaceCardCardViewController *)self dataSource];
      uint64_t v16 = [v18 routeMainDescriptionText];
      [(UILabel *)self->_mainDescriptionLabel setAttributedText:v16];

      goto LABEL_11;
    }
  }
  mainDescriptionLabel = self->_mainDescriptionLabel;

  [(UILabel *)mainDescriptionLabel setText:0];
}

- (void)_captureAnalytics
{
  int64_t v3 = sub_100015DB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    char v4 = [(CarPlaceCardCardViewController *)self mapItem];
    unsigned __int8 v5 = [v4 name];
    v6 = [(CarPlaceCardCardViewController *)self mapItem];
    int v9 = 138478083;
    double v10 = v5;
    __int16 v11 = 2049;
    id v12 = [v6 _muid];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CarPlaceCard: placecard loaded and displayed with mapItem: (name: %{private}@, muid: %{private}llu)", (uint8_t *)&v9, 0x16u);
  }
  unsigned int v7 = +[CarDisplayController sharedInstance];
  BOOL v8 = [v7 chromeViewController];
  [v8 captureUserAction:21];
}

- (void)setSearchResult:(id)a3
{
  unsigned __int8 v5 = (SearchResult *)a3;
  if (self->_searchResult != v5)
  {
    objc_storeStrong((id *)&self->_searchResult, a3);
    v6 = sub_100015DB4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      unsigned int v7 = [(CarPlaceCardCardViewController *)self mapItem];
      BOOL v8 = [v7 name];
      int v9 = [(CarPlaceCardCardViewController *)self mapItem];
      int v10 = 138478083;
      __int16 v11 = v8;
      __int16 v12 = 2049;
      id v13 = [v9 _muid];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CarPlaceCard: placecard changed searchResult with mapItem: (name: %{private}@, muid: %{private}llu)", (uint8_t *)&v10, 0x16u);
    }
    [(CarPlaceCardCardViewController *)self _initializeGoButtonState];
    [(CarPlaceCardCardViewController *)self _updateContents];
  }
}

- (MKMapItem)mapItem
{
  v2 = [(CarPlaceCardCardViewController *)self searchResult];
  int64_t v3 = [v2 mapItem];

  return (MKMapItem *)v3;
}

- (_MKLocalizedHoursBuilder)localizedHoursBuilder
{
  localizedHoursBuilder = self->_localizedHoursBuilder;
  if (!localizedHoursBuilder)
  {
    id v4 = objc_alloc((Class)_MKLocalizedHoursBuilder);
    unsigned __int8 v5 = [(CarPlaceCardCardViewController *)self mapItem];
    v6 = (_MKLocalizedHoursBuilder *)[v4 initWithMapItem:v5 localizedHoursStringOptions:41];
    unsigned int v7 = self->_localizedHoursBuilder;
    self->_localizedHoursBuilder = v6;

    localizedHoursBuilder = self->_localizedHoursBuilder;
  }

  return localizedHoursBuilder;
}

- (void)setShouldDisplayMoreButton:(BOOL)a3
{
  if (self->_shouldDisplayMoreButton != a3)
  {
    self->_shouldDisplayMoreButton = a3;
    [(CarPlaceCardCardViewController *)self _updateConstraints];
  }
}

- (void)setHasCardFinishedTransitioning:(BOOL)a3
{
  if (self->_hasCardFinishedTransitioning != a3)
  {
    self->_hasCardFinishedTransitioning = a3;
    if (a3) {
      [(CarPlaceCardCardViewController *)self _updateContents];
    }
  }
}

- (void)setLoading:(BOOL)a3
{
  if (self->_loading != a3)
  {
    self->_loading = a3;
    id v4 = sub_100015DB4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_loading) {
        unsigned __int8 v5 = @"YES";
      }
      else {
        unsigned __int8 v5 = @"NO";
      }
      v6 = v5;
      int v7 = 138412290;
      BOOL v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CarPlaceCard: setLoading: %@", (uint8_t *)&v7, 0xCu);
    }
    [(CarPlaceCardCardViewController *)self _updateContents];
  }
}

- (void)setGoButtonHidden:(BOOL)a3
{
  if (self->_goButtonHidden != a3)
  {
    self->_goButtonHidden = a3;
    id v4 = sub_100015DB4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_goButtonHidden) {
        unsigned __int8 v5 = @"YES";
      }
      else {
        unsigned __int8 v5 = @"NO";
      }
      v6 = v5;
      int v7 = 138412290;
      BOOL v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CarPlaceCard: setGoButtonHidden: %@", (uint8_t *)&v7, 0xCu);
    }
    [(CarPlaceCardCardViewController *)self _updateContents];
  }
}

- (void)setGoButtonEnabled:(BOOL)a3
{
  if (self->_goButtonEnabled != a3)
  {
    self->_goButtonEnabled = a3;
    id v4 = +[CarDisplayController sharedInstance];
    unsigned __int8 v5 = [v4 chromeViewController];
    [v5 setNeedsFocusUpdate];

    v6 = sub_100015DB4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (self->_goButtonEnabled) {
        int v7 = @"YES";
      }
      else {
        int v7 = @"NO";
      }
      BOOL v8 = v7;
      int v9 = 138412290;
      int v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CarPlaceCard: setGoButtonEnabled: %@", (uint8_t *)&v9, 0xCu);
    }
    +[PPTNotificationCenter postNotificationIfNeededWithName:@"CarPlaceCardCardViewControllerDidLoadRouteNotification" object:self userInfo:0];
    [(CarPlaceCardCardViewController *)self _updateContents];
  }
}

- (void)setNavigationAidedDrivingEnabled:(BOOL)a3
{
  if (self->_navigationAidedDrivingEnabled != a3)
  {
    self->_navigationAidedDrivingEnabled = a3;
    id v4 = sub_100015DB4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (self->_navigationAidedDrivingEnabled) {
        unsigned __int8 v5 = @"YES";
      }
      else {
        unsigned __int8 v5 = @"NO";
      }
      v6 = v5;
      int v7 = 138412290;
      BOOL v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "CarPlaceCard: setNavigationAidedDrivingEnabled %@", (uint8_t *)&v7, 0xCu);
    }
    if (self->_navigationAidedDrivingEnabled) {
      [(CarPlaceCardCardViewController *)self setGoButtonHidden:0];
    }
    [(CarPlaceCardCardViewController *)self _updateContents];
  }
}

- (void)setHandoffEnabled:(BOOL)a3
{
  if (self->_handoffEnabled != a3)
  {
    self->_handoffEnabled = a3;
    id v4 = sub_100015DB4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (self->_handoffEnabled) {
        unsigned __int8 v5 = @"YES";
      }
      else {
        unsigned __int8 v5 = @"NO";
      }
      v6 = v5;
      int v7 = 138412290;
      BOOL v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "CarPlaceCard: setHandoffEnabled: %@", (uint8_t *)&v7, 0xCu);
    }
    [(CarPlaceCardCardViewController *)self _updateContents];
  }
}

- (int64_t)titleNumberOfLines
{
  if ([(CarAdvisoriesView *)self->_routeAdvisoriesView count] > 1) {
    return 1;
  }
  else {
    return 3;
  }
}

- (BOOL)_isGoButtonFocusable
{
  if (![(CarPlaceCardCardViewController *)self isViewLoaded]
    || [(CarLoadingButton *)self->_goButton isLoading]
    || ([(CarLoadingButton *)self->_goButton isHidden] & 1) != 0)
  {
    return 0;
  }
  goButton = self->_goButton;

  return [(CarLoadingButton *)goButton isEnabled];
}

- (BOOL)_canSafelyRequestFocusUpdate
{
  if (![(CarPlaceCardCardViewController *)self isViewLoaded]) {
    return 0;
  }
  if (![(CarPlaceCardCardViewController *)self hasCardFinishedTransitioning]) {
    return 0;
  }
  int64_t v3 = [(CarPlaceCardCardViewController *)self view];
  id v4 = [v3 window];
  unsigned __int8 v5 = [v4 rootViewController];

  if (!v5) {
    return 0;
  }
  v6 = [(CarPlaceCardCardViewController *)self view];
  int v7 = [v6 superview];
  if (v7)
  {
    BOOL v8 = [(CarPlaceCardCardViewController *)self traitCollection];
  }
  else
  {
    __int16 v11 = +[UIScreen _carScreen];
    BOOL v8 = [v11 traitCollection];
  }
  BOOL v9 = ((unint64_t)[v8 interactionModel] & 0xA) != 0;

  return v9;
}

- (void)_cancelScheduleETAUpdate
{
  int64_t v3 = sub_100015DB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CarPlaceCard: canceling ETA update timer", v6, 2u);
  }

  etaUpdateTimer = self->_etaUpdateTimer;
  if (etaUpdateTimer)
  {
    [(NSTimer *)etaUpdateTimer invalidate];
    unsigned __int8 v5 = self->_etaUpdateTimer;
    self->_etaUpdateTimer = 0;
  }
}

- (void)_scheduleETAUpdate
{
  int64_t v3 = sub_100015DB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CarPlaceCard: scheduling ETA update timer", v6, 2u);
  }

  if (!self->_etaUpdateTimer)
  {
    id v4 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_updateETA" selector:0 userInfo:1 repeats:15.0];
    etaUpdateTimer = self->_etaUpdateTimer;
    self->_etaUpdateTimer = v4;
  }
}

- (void)_updateETA
{
  int64_t v3 = [(CarPlaceCardCardViewController *)self dataSource];
  id v4 = [v3 etaForCurrentRoute];
  latestETA = self->_latestETA;
  self->_latestETA = v4;

  v6 = sub_100015DB4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unint64_t v7 = [(GuidanceETA *)self->_latestETA remainingMinutes];
    int v8 = 134217984;
    unint64_t v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CarPlaceCard: eta update timer fired. new ETA remainingMinutes: %lu", (uint8_t *)&v8, 0xCu);
  }

  [(CarPlaceCardCardViewController *)self _updateETARelatedContents];
  if (!self->_latestETA) {
    [(CarPlaceCardCardViewController *)self _cancelScheduleETAUpdate];
  }
}

- (void)_scheduleOpeningHoursUpdate
{
  if (!self->_openingHoursUpdateTimer)
  {
    int64_t v3 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_updateOpeningHours" selector:0 userInfo:1 repeats:900.0];
    openingHoursUpdateTimer = self->_openingHoursUpdateTimer;
    self->_openingHoursUpdateTimer = v3;
  }
}

- (void)_updateOpeningHours
{
  int64_t v3 = [(CarPlaceCardCardViewController *)self mapItem];
  id v4 = [v3 _businessHours];
  unsigned __int8 v5 = [v4 objectAtIndex:0];
  v6 = +[NSDate date];
  unint64_t v7 = [(CarPlaceCardCardViewController *)self mapItem];
  int v8 = [v7 timeZone];
  id v9 = +[GEOMapItemOpenState _geoMapItemOpeningHoursOptionsForBusinessHours:v5 compareDate:v6 timeZone:v8];

  int v10 = [(CarPlaceCardCardViewController *)self localizedHoursBuilder];
  [v10 setGeoMapItemOpeningHourOptions:v9];

  __int16 v11 = [(CarPlaceCardCardViewController *)self _subtitleString];
  [(CarAutohidingLabel *)self->_subtitleLabel setAttributedText:v11];

  __int16 v12 = sub_100015DB4();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [(CarAutohidingLabel *)self->_subtitleLabel attributedText];
    unsigned int v14 = [v13 string];
    int v15 = 138412290;
    uint64_t v16 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "CarPlaceCard: updating opening hours to: %@", (uint8_t *)&v15, 0xCu);
  }
}

- (id)_visibleButtons
{
  if ([(CarPlaceCardCardViewController *)self isViewLoaded])
  {
    int64_t v3 = +[NSMutableArray array];
    if (([(CarMoreButton *)self->_moreButton isHidden] & 1) == 0) {
      [v3 addObject:self->_moreButton];
    }
    if ([(CarPlaceCardCardViewController *)self _isGoButtonFocusable]) {
      [v3 addObject:self->_goButton];
    }
    evChargingMoreButton = self->_evChargingMoreButton;
    if (evChargingMoreButton
      && ([(CarCardRoundedButton *)evChargingMoreButton isHidden] & 1) == 0)
    {
      [v3 addObject:self->_evChargingMoreButton];
    }
    id v5 = [v3 copy];
  }
  else
  {
    id v5 = &__NSArray0__struct;
  }

  return v5;
}

- (id)_attributesForPlainSubtitleString
{
  v6[0] = NSFontAttributeName;
  v2 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption2 weight:UIFontWeightRegular];
  v7[0] = v2;
  v6[1] = NSForegroundColorAttributeName;
  int64_t v3 = +[UIColor labelColor];
  v7[1] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (id)_subtitleString
{
  int64_t v3 = [(CarPlaceCardCardViewController *)self mapItem];
  unsigned int v4 = [v3 _hasChargerNumberString];

  if (v4)
  {
    id v5 = objc_alloc((Class)NSAttributedString);
    id v6 = [(CarPlaceCardCardViewController *)self mapItem];
    unint64_t v7 = [v6 _chargerNumberString];
    int v8 = [(CarPlaceCardCardViewController *)self _attributesForPlainSubtitleString];
    id v9 = [v5 initWithString:v7 attributes:v8];
  }
  else
  {
    int v10 = [(CarPlaceCardCardViewController *)self _localizedHours];
    if (v10)
    {
      id v6 = v10;
      id v9 = v6;
    }
    else
    {
      __int16 v11 = [(CarPlaceCardCardViewController *)self mapItem];
      __int16 v12 = [v11 _firstLocalizedCategoryName];
      id v13 = [v12 length];

      if (v13)
      {
        id v14 = objc_alloc((Class)NSAttributedString);
        int v15 = [(CarPlaceCardCardViewController *)self mapItem];
        uint64_t v16 = [v15 _firstLocalizedCategoryName];
        v17 = [(CarPlaceCardCardViewController *)self _attributesForPlainSubtitleString];
        id v9 = [v14 initWithString:v16 attributes:v17];

        id v6 = 0;
      }
      else
      {
        id v6 = 0;
        id v9 = 0;
      }
    }
  }

  return v9;
}

- (id)_sharingETAString
{
  v2 = [(CarPlaceCardCardViewController *)self dataSource];
  int64_t v3 = [v2 automaticSharingContacts];

  if ([v3 count])
  {
    if ([v3 count] == (id)1)
    {
      unsigned int v4 = [v3 firstObject];
      id v5 = [v4 contact];
      id v6 = [v5 givenName];

      unint64_t v7 = +[NSBundle mainBundle];
      int v8 = [v7 localizedStringForKey:@"CarPlay_PlaceCard_SharingAutomatically_OneContact" value:@"localized string not found" table:0];
      id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v6);
    }
    else
    {
      unsigned int v4 = +[NSBundle mainBundle];
      id v6 = [v4 localizedStringForKey:@"CarPlay_PlaceCard_SharingAutomatically" value:@"localized string not found" table:0];
      id v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, [v3 count]);
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_localizedHours
{
  int64_t v3 = [(CarPlaceCardCardViewController *)self mapItem];
  unsigned int v4 = [v3 _hasBusinessHours];

  if (v4)
  {
    id v5 = [(CarPlaceCardCardViewController *)self localizedHoursBuilder];
    id v6 = (id)((unint64_t)[v5 geoMapItemOpeningHourOptions] & 0x1CC);

    unint64_t v7 = [(CarPlaceCardCardViewController *)self localizedHoursBuilder];
    unsigned __int8 v8 = [v7 geoMapItemOpeningHourOptions];

    if (v6)
    {
      id v9 = objc_alloc((Class)NSAttributedString);
      int v10 = [(CarPlaceCardCardViewController *)self localizedHoursBuilder];
      __int16 v11 = [v10 localizedOperatingHours];
      v16[0] = NSFontAttributeName;
      __int16 v12 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption2 weight:UIFontWeightRegular];
      v17[0] = v12;
      v16[1] = NSForegroundColorAttributeName;
      if ((v8 & 0x40) != 0) {
        +[UIColor systemOrangeColor];
      }
      else {
      id v13 = +[UIColor systemRedColor];
      }
      v17[1] = v13;
      id v14 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      id v6 = [v9 initWithString:v11 attributes:v14];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_createEtaLabelTrailingConstraint
{
  unsigned int v3 = [(CarPlaceCardCardViewController *)self shouldDisplayMoreButton];
  unsigned int v4 = [(UILabel *)self->_etaLabel trailingAnchor];
  if (v3)
  {
    id v5 = [(CarMoreButton *)self->_moreButton leadingAnchor];
    id v6 = [v4 constraintLessThanOrEqualToAnchor:v5 constant:-10.0];
  }
  else
  {
    id v5 = [(CarPlaceCardCardViewController *)self view];
    unint64_t v7 = [v5 trailingAnchor];
    id v6 = [v4 constraintEqualToAnchor:v7 constant:-10.0];
  }

  return v6;
}

- (id)_createAutohidingTextlabelWithVerticalCompressionResistancePriority:(float)a3
{
  unsigned int v4 = -[CarAutohidingLabel initWithFrame:]([CarAutohidingLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(CarAutohidingLabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(float *)&double v5 = a3;
  [(CarAutohidingLabel *)v4 setContentCompressionResistancePriority:1 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [(CarAutohidingLabel *)v4 setContentHuggingPriority:1 forAxis:v6];

  return v4;
}

- (void)_presentMoreOptions
{
  unsigned int v3 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  [v3 setModalPresentationStyle:5];
  objc_initWeak(&location, self);
  id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  if (([(CarMoreButton *)self->_moreButton options] & 2) != 0)
  {
    double v5 = +[NSBundle mainBundle];
    double v6 = [v5 localizedStringForKey:@"Call [CarPlay]" value:@"localized string not found" table:0];
    unint64_t v7 = [(CarPlaceCardCardViewController *)self mapItem];
    unsigned __int8 v8 = [v7 name];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8);

    int v10 = +[UIImage _mapsCar_systemImageNamed:@"phone.fill" textStyle:UIFontTextStyleTitle3];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10073DACC;
    v40[3] = &unk_1012E8EB8;
    objc_copyWeak(&v41, &location);
    __int16 v11 = +[CarAlertAction actionWithTitle:v9 image:v10 handler:v40];

    [v4 addObject:v11];
    objc_destroyWeak(&v41);
  }
  if (([(CarMoreButton *)self->_moreButton options] & 4) != 0)
  {
    __int16 v12 = +[MapsExternalDevice sharedInstance];
    id v13 = [v12 mapsDisplayName];

    id v14 = +[NSBundle mainBundle];
    if (v13)
    {
      int v15 = [v14 localizedStringForKey:@"Share destination [CarPlay]" value:@"localized string not found" table:0];
      uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v13);
    }
    else
    {
      uint64_t v16 = [v14 localizedStringForKey:@"Share destination to unknown headunit [CarPlay]" value:@"localized string not found" table:0];
    }

    v17 = +[UIImage _mapsCar_systemImageNamed:@"square.and.arrow.up" textStyle:UIFontTextStyleTitle3];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10073DB54;
    v38[3] = &unk_1012E8EB8;
    objc_copyWeak(&v39, &location);
    id v18 = +[CarAlertAction actionWithTitle:v16 image:v17 handler:v38];

    [v4 addObject:v18];
    objc_destroyWeak(&v39);
  }
  double v19 = +[NSBundle mainBundle];
  id v20 = [v19 localizedStringForKey:@"Cancel [CarPlay, No Route]", @"localized string not found", 0 value table];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10073DC0C;
  v36[3] = &unk_1012E8EB8;
  objc_copyWeak(&v37, &location);
  double v21 = +[UIAlertAction actionWithTitle:v20 style:1 handler:v36];

  [v4 addObject:v21];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v22 = v4;
  id v23 = [v22 countByEnumeratingWithState:&v32 objects:v45 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v33;
    do
    {
      v25 = 0;
      do
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(v22);
        }
        [v3 addAction:*(void *)(*((void *)&v32 + 1) + 8 * (void)v25)];
        v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v23 = [v22 countByEnumeratingWithState:&v32 objects:v45 count:16];
    }
    while (v23);
  }

  v26 = sub_100015DB4();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    id v27 = [v22 count];
    *(_DWORD *)buf = 134217984;
    id v44 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Presenting actionSheet with %ld options.", buf, 0xCu);
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10073DC80;
  v29[3] = &unk_1012E6690;
  objc_copyWeak(&v31, &location);
  id v28 = v3;
  id v30 = v28;
  [(CarPlaceCardCardViewController *)self presentViewController:v28 animated:1 completion:v29];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v37);

  objc_destroyWeak(&location);
}

- (void)_callDestination
{
  unsigned int v3 = [(SearchResult *)self->_searchResult mapItem];
  id v4 = [v3 phoneNumber];

  if (v4 && [v4 length])
  {
    sub_10073DEC0(v4);
  }
  else if ([(SearchResult *)self->_searchResult isAddressBookResult])
  {
    double v5 = [(SearchResult *)self->_searchResult address];
    double v6 = [v5 contact];

    unint64_t v7 = [v6 phoneNumbers];
    unsigned __int8 v8 = [v7 firstObject];
    id v9 = [v8 value];

    int v10 = [v9 stringValue];
    sub_10073DEC0(v10);
  }
  else
  {
    __int16 v11 = sub_100015DB4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = [(SearchResult *)self->_searchResult mapItem];
      id v13 = [v12 phoneNumber];
      int v15 = 138412290;
      uint64_t v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "CarPlaceCard tried to call POI, but failed. Number: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  id v14 = [(CarPlaceCardCardViewController *)self delegate];
  [v14 placeCardDidSelectCall:self];
}

- (BOOL)_shouldHideNavigationRelatedInfo
{
  if ([(CarPlaceCardCardViewController *)self isNavigationAidedDrivingEnabled]
    || [(CarPlaceCardCardViewController *)self isGoButtonHidden])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    id v4 = +[MKLocationManager sharedLocationManager];
    unsigned int v3 = [v4 isAuthorizedForPreciseLocation] ^ 1;
  }
  return v3;
}

- (id)_createEVChargingViewModel
{
  unsigned int v3 = [(CarPlaceCardCardViewController *)self mapItem];

  if (v3)
  {
    id v4 = [_TtC4Maps31CarPlaceCardEVChargingViewModel alloc];
    double v5 = [(CarPlaceCardCardViewController *)self mapItem];
    double v6 = +[VGVirtualGarageService sharedService];
    unint64_t v7 = [(CarPlaceCardEVChargingViewModel *)v4 initWithMapItem:v5 virtualGarageService:v6];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldShowEVViewsInline
{
  v2 = +[UIScreen _carScreen];
  unsigned int v3 = [v2 currentMode];
  [v3 size];
  BOOL v5 = v4 >= 1000.0;

  return v5;
}

- (void)_moreButtonPressed:(id)a3
{
  double v4 = sub_100015DB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    unint64_t v5 = [(CarMoreButton *)self->_moreButton options];
    int v8 = 134217984;
    unint64_t v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CarPlaceCard 'More' button pressed with options: %lu", (uint8_t *)&v8, 0xCu);
  }

  if ((~[(CarMoreButton *)self->_moreButton options] & 6) != 0)
  {
    if (([(CarMoreButton *)self->_moreButton options] & 2) != 0)
    {
      [(CarPlaceCardCardViewController *)self _callDestination];
    }
    else if (([(CarMoreButton *)self->_moreButton options] & 4) != 0)
    {
      unint64_t v7 = [(CarPlaceCardCardViewController *)self delegate];
      [v7 placeCardDidSelectHandoff:self];
    }
    else
    {
      double v6 = sub_100015DB4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v8) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "CarPlaceCard: pressed _moreButton with invalid options", (uint8_t *)&v8, 2u);
      }
    }
  }
  else
  {
    [(CarPlaceCardCardViewController *)self _presentMoreOptions];
  }
}

- (void)startNavigation
{
}

- (void)_goButtonPressed:(id)a3
{
  unsigned int v4 = [(CarPlaceCardCardViewController *)self isNavigationAidedDrivingEnabled];
  unint64_t v5 = sub_100015DB4();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CarPlaceCard go button pressed, NAD active -> handing off", buf, 2u);
    }

    unint64_t v7 = [(CarPlaceCardCardViewController *)self delegate];
    [v7 placeCardDidSelectHandoff:self];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CarPlaceCard go button pressed, NAD inactive -> starting nav", v8, 2u);
    }

    unint64_t v7 = [(CarPlaceCardCardViewController *)self delegate];
    [v7 placeCardDidSelectGo:self];
  }
}

- (void)_evChargingMoreButtonPressed:(id)a3
{
  unsigned int v4 = sub_100015DB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int16 v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CarPlaceCard EVCharging More button pressed", v12, 2u);
  }

  if (![(CarPlaceCardCardViewController *)self _shouldShowEVViewsInline])
  {
    unint64_t v5 = [_TtC4Maps39CarEVChargingAvailabilityViewController alloc];
    uint64_t v6 = [(CarPlaceCardCardViewController *)self evChargingViewModel];
    unint64_t v7 = [(CarEVChargingAvailabilityViewController *)v5 initWithViewModal:v6];
    [(CarPlaceCardCardViewController *)self setEvChargingAvailabilityVC:v7];

    int v8 = [(CarPlaceCardCardViewController *)self evChargingAvailabilityVC];
    [v8 configureForModalPresentation];

    unint64_t v9 = [(CarPlaceCardCardViewController *)self delegate];
    LOBYTE(v6) = objc_opt_respondsToSelector();

    if (v6)
    {
      int v10 = [(CarPlaceCardCardViewController *)self delegate];
      __int16 v11 = [(CarPlaceCardCardViewController *)self evChargingAvailabilityVC];
      [v10 placeCard:self wantsToPresentEVAvailability:v11];
    }
  }
}

- (void)_externalDeviceUpdated:(id)a3
{
  unsigned int v4 = sub_100015DB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CarPlaceCard _externalDeviceUpdated", v7, 2u);
  }

  unint64_t v5 = +[MapsExternalDevice sharedInstance];
  -[CarPlaceCardCardViewController setNavigationAidedDrivingEnabled:](self, "setNavigationAidedDrivingEnabled:", [v5 isNavigationAidedDrivingEnabled]);

  uint64_t v6 = +[MapsExternalDevice sharedInstance];
  -[CarPlaceCardCardViewController setHandoffEnabled:](self, "setHandoffEnabled:", [v6 destinationHandoffEnabled]);
}

- (NSArray)preferredFocusEnvironments
{
  if ([(CarPlaceCardCardViewController *)self isViewLoaded]
    && [(CarPlaceCardCardViewController *)self _isGoButtonFocusable])
  {
    goButton = self->_goButton;
    unsigned int v3 = +[NSArray arrayWithObjects:&goButton count:1];
  }
  else
  {
    unsigned int v3 = &__NSArray0__struct;
  }

  return (NSArray *)v3;
}

- (NSArray)focusOrderSubItems
{
  return (NSArray *)[(CarPlaceCardCardViewController *)self _visibleButtons];
}

- (void)ETAProviderUpdated:(id)a3
{
  id v4 = a3;
  unint64_t v5 = sub_100015DB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    [v4 etaTravelTime];
    int v9 = 134217984;
    uint64_t v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CarPlaceCard: ETAProviderUpdated: etaTravelTime: %f", (uint8_t *)&v9, 0xCu);
  }

  if (self->_style == 1 && self->_etaTravelTime == 0.0)
  {
    [v4 etaTravelTime];
    if (v7 > 0.0)
    {
      [v4 etaTravelTime];
      self->_etaTravelTime = v8;
      [(CarPlaceCardCardViewController *)self setGoButtonEnabled:1];
      [(CarPlaceCardCardViewController *)self setGoButtonHidden:0];
      [v4 cancel];
    }
  }
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (BOOL)isGoButtonEnabled
{
  return self->_goButtonEnabled;
}

- (BOOL)isGoButtonHidden
{
  return self->_goButtonHidden;
}

- (BOOL)hasCardFinishedTransitioning
{
  return self->_hasCardFinishedTransitioning;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (CarPlaceCardCardViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (CarPlaceCardCardViewControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (CarPlaceCardCardViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarPlaceCardCardViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_int64_t style = a3;
}

- (BOOL)isNavigationAidedDrivingEnabled
{
  return self->_navigationAidedDrivingEnabled;
}

- (BOOL)isHandoffEnabled
{
  return self->_handoffEnabled;
}

- (BOOL)shouldDisplayMoreButton
{
  return self->_shouldDisplayMoreButton;
}

- (void)setLocalizedHoursBuilder:(id)a3
{
}

- (_TtC4Maps31CarPlaceCardEVChargingViewModel)evChargingViewModel
{
  return self->_evChargingViewModel;
}

- (void)setEvChargingViewModel:(id)a3
{
}

- (_TtC4Maps39CarEVChargingAvailabilityViewController)evChargingAvailabilityVC
{
  return self->_evChargingAvailabilityVC;
}

- (void)setEvChargingAvailabilityVC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evChargingAvailabilityVC, 0);
  objc_storeStrong((id *)&self->_evChargingViewModel, 0);
  objc_storeStrong((id *)&self->_localizedHoursBuilder, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_openingHoursUpdateTimer, 0);
  objc_storeStrong((id *)&self->_etaProvider, 0);
  objc_storeStrong((id *)&self->_latestETA, 0);
  objc_storeStrong((id *)&self->_etaUpdateTimer, 0);
  objc_storeStrong((id *)&self->_routeAdvisoriesHeightConstraint, 0);
  objc_storeStrong((id *)&self->_etaLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_goButton, 0);
  objc_storeStrong((id *)&self->_routeAdvisoriesView, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_sharingETALabel, 0);
  objc_storeStrong((id *)&self->_mainDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_etaLabel, 0);
  objc_storeStrong((id *)&self->_evChargingDetailViewConstraints, 0);
  objc_storeStrong((id *)&self->_evChargingSummaryViewConstraints, 0);
  objc_storeStrong((id *)&self->_evChargingMoreButton, 0);
  objc_storeStrong((id *)&self->_evChargingAvailabilityLabel, 0);
  objc_storeStrong((id *)&self->_evChargingTitleLabel, 0);
  objc_storeStrong((id *)&self->_addressLabel, 0);
  objc_storeStrong((id *)&self->_ratingView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_textStackView, 0);
}

@end