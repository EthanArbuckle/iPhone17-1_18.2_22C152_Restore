@interface SharedTripContaineeViewController
- (BOOL)_senderIsContact;
- (BOOL)_shouldShowDirectionsButton;
- (BOOL)forceCurrentWidthForHeaderHeightCalculations;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (GEOSharedNavState)sharedTrip;
- (SharedTripContaineeViewController)initWithSharedTrip:(id)a3;
- (SharedTripsActionCoordination)actionDelegate;
- (id)_refetchedContact:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addContact;
- (void)_addToContact;
- (void)_loadActions;
- (void)_presentPlaceCardForMapItem:(id)a3;
- (void)_refreshSubscriptionToken;
- (void)_reloadWithContact:(id)a3;
- (void)_updateButtons;
- (void)_updateButtonsForLocationUpdate;
- (void)_updateFonts;
- (void)_updateWithTrip:(id)a3;
- (void)applyAlphaToContent:(double)a3;
- (void)blockSender;
- (void)blockSenderAction;
- (void)blockTrip;
- (void)contactButtonTapped;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)directionsButtonTapped;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)registerActionsTableViewCellClasses;
- (void)setActionDelegate:(id)a3;
- (void)setSharedTrip:(id)a3;
- (void)setupSubviews;
- (void)sharedTripService:(id)a3 didReceiveSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didRemoveSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateClosedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateDestinationForSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateETAForSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateReachedDestinationForSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateRouteForSharedTrip:(id)a4;
- (void)sharedTripServiceDidUpdateReceivingAvailability:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tapToRadarButtonTapped;
- (void)updateContent;
- (void)updateTheme;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SharedTripContaineeViewController

- (SharedTripContaineeViewController)initWithSharedTrip:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SharedTripContaineeViewController;
  v6 = [(SharedTripContaineeViewController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sharedTrip, a3);
    v8 = +[MSPSharedTripService sharedInstance];
    [v8 addReceivingObserver:v7];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SharedTripContaineeViewController;
  [(SimpleContaineeViewController *)&v4 dealloc];
}

- (void)registerActionsTableViewCellClasses
{
  v4.receiver = self;
  v4.super_class = (Class)SharedTripContaineeViewController;
  [(SimpleContaineeViewController *)&v4 registerActionsTableViewCellClasses];
  v3 = [(SimpleContaineeViewController *)self actionsTableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"StopCell"];
}

- (void)setupSubviews
{
  v74.receiver = self;
  v74.super_class = (Class)SharedTripContaineeViewController;
  [(SimpleContaineeViewController *)&v74 setupSubviews];
  id v68 = objc_alloc_init((Class)NSMutableArray);
  v3 = objc_alloc_init(MapsThemeLabel);
  headerTitleLabel = self->_headerTitleLabel;
  self->_headerTitleLabel = &v3->super;

  [(UILabel *)self->_headerTitleLabel setAccessibilityIdentifier:@"HeaderTitleLabel"];
  LODWORD(v5) = 1132068864;
  [(UILabel *)self->_headerTitleLabel setContentCompressionResistancePriority:0 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [(UILabel *)self->_headerTitleLabel setContentCompressionResistancePriority:1 forAxis:v6];
  [(UILabel *)self->_headerTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = +[UIColor clearColor];
  [(UILabel *)self->_headerTitleLabel setBackgroundColor:v7];

  v8 = +[UIColor labelColor];
  [(UILabel *)self->_headerTitleLabel setTextColor:v8];

  [(UILabel *)self->_headerTitleLabel setNumberOfLines:0];
  v9 = objc_alloc_init(MapsThemeLabel);
  headerSubtitleLabel = self->_headerSubtitleLabel;
  self->_headerSubtitleLabel = &v9->super;

  [(UILabel *)self->_headerSubtitleLabel setAccessibilityIdentifier:@"HeaderSubtitleLabel"];
  LODWORD(v11) = 1132068864;
  [(UILabel *)self->_headerSubtitleLabel setContentCompressionResistancePriority:0 forAxis:v11];
  LODWORD(v12) = 1148846080;
  [(UILabel *)self->_headerSubtitleLabel setContentCompressionResistancePriority:1 forAxis:v12];
  [(UILabel *)self->_headerSubtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = +[UIColor clearColor];
  [(UILabel *)self->_headerSubtitleLabel setBackgroundColor:v13];

  v14 = +[UIColor labelColor];
  [(UILabel *)self->_headerSubtitleLabel setTextColor:v14];

  [(UILabel *)self->_headerSubtitleLabel setNumberOfLines:0];
  v15 = objc_alloc_init(MapsThemeLabel);
  handleLabel = self->_handleLabel;
  self->_handleLabel = &v15->super;

  [(UILabel *)self->_handleLabel setAccessibilityIdentifier:@"HandleLabel"];
  LODWORD(v17) = 1132068864;
  [(UILabel *)self->_handleLabel setContentCompressionResistancePriority:0 forAxis:v17];
  LODWORD(v18) = 1148846080;
  [(UILabel *)self->_handleLabel setContentCompressionResistancePriority:1 forAxis:v18];
  [(UILabel *)self->_handleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v19 = +[UIColor clearColor];
  [(UILabel *)self->_handleLabel setBackgroundColor:v19];

  v20 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_handleLabel setTextColor:v20];

  [(UILabel *)self->_handleLabel setNumberOfLines:0];
  id v21 = objc_alloc((Class)UIStackView);
  v22 = self->_handleLabel;
  v76[0] = self->_headerSubtitleLabel;
  v76[1] = v22;
  v23 = +[NSArray arrayWithObjects:v76 count:2];
  id v70 = [v21 initWithArrangedSubviews:v23];

  [v70 setAccessibilityIdentifier:@"TitleStackView"];
  [v70 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v70 setAlignment:0];
  [v70 setDistribution:0];
  [v70 setAxis:1];
  [v70 setSpacing:0.0];
  v24 = [(SimpleContaineeViewController *)self titleHeaderView];
  [v24 setTitleView:self->_headerTitleLabel subtitleView:v70 verticalSpaceBetweenViews:0.0 padding:16.0, 16.0, 6.0, 16.0];

  BOOL v25 = sub_1000BBB44(self) == 5;
  v26 = [(SimpleContaineeViewController *)self titleHeaderView];
  [v26 setButtonHidden:v25];

  v27 = [(SimpleContaineeViewController *)self actionsTableView];
  [v27 _setTopPadding:12.0];

  v28 = [(SimpleContaineeViewController *)self actionsTableView];
  [v28 _setBottomPadding:10.0];

  v29 = +[UIButton buttonWithType:0];
  directionsButton = self->_directionsButton;
  self->_directionsButton = v29;

  v31 = +[UIButtonConfiguration _mapsui_primaryHeaderActionConfiguration];
  v32 = +[UIImage systemImageNamed:@"arrow.triangle.turn.up.right.diamond.fill"];
  [v31 setImage:v32];

  v33 = +[NSBundle mainBundle];
  v34 = [v33 localizedStringForKey:@"Directions [SharedETA]" value:@"localized string not found" table:0];
  [v31 setTitle:v34];

  [v31 setContentInsets:15.0, 10.0, 15.0, 10.0];
  [v31 setTitleAlignment:2];
  [(UIButton *)self->_directionsButton setConfiguration:v31];
  [(UIButton *)self->_directionsButton setAccessibilityIdentifier:@"DirectionsButton"];
  [(UIButton *)self->_directionsButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v35 = [(UIButton *)self->_directionsButton subtitleLabel];
  [v35 setNumberOfLines:1];

  [(UIButton *)self->_directionsButton addTarget:self action:"directionsButtonTapped" forControlEvents:0x2000];
  v36 = [(SimpleContaineeViewController *)self topActionsContainerView];
  [v36 addArrangedSubview:self->_directionsButton];

  v37 = +[UIButton buttonWithType:0];
  contactButton = self->_contactButton;
  self->_contactButton = v37;

  [(UIButton *)self->_contactButton setAccessibilityIdentifier:@"ContactButton"];
  [(UIButton *)self->_contactButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v69 = +[UIButtonConfiguration _mapsui_secondaryHeaderActionConfiguration];

  v39 = +[UIImage systemImageNamed:@"phone.fill"];
  [v69 setImage:v39];

  v40 = +[NSBundle mainBundle];
  v41 = [v40 localizedStringForKey:@"Contact [SharedETA]" value:@"localized string not found" table:0];
  [v69 setTitle:v41];

  [v69 setContentInsets:15.0, 10.0, 15.0, 10.0];
  [v69 setTitleAlignment:2];
  [(UIButton *)self->_contactButton setConfiguration:v69];
  [(UIButton *)self->_contactButton addTarget:self action:"contactButtonTapped" forControlEvents:0x2000];
  v42 = [(SimpleContaineeViewController *)self topActionsContainerView];
  [v42 addArrangedSubview:self->_contactButton];

  v43 = objc_alloc_init(MapsThemeLabel);
  destinationHeaderLabel = self->_destinationHeaderLabel;
  self->_destinationHeaderLabel = v43;

  [(MapsThemeLabel *)self->_destinationHeaderLabel setAccessibilityIdentifier:@"DestinationHeaderLabel"];
  [(MapsThemeLabel *)self->_destinationHeaderLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v45 = [(SimpleContaineeViewController *)self metadataContainerView];
  [v45 addSubview:self->_destinationHeaderLabel];

  v66 = [(MapsThemeLabel *)self->_destinationHeaderLabel topAnchor];
  v67 = [(SimpleContaineeViewController *)self metadataContainerView];
  v65 = [v67 topAnchor];
  v64 = [v66 constraintEqualToAnchor:v65 constant:20.0];
  v75[0] = v64;
  v62 = [(MapsThemeLabel *)self->_destinationHeaderLabel leadingAnchor];
  v63 = [(SimpleContaineeViewController *)self metadataContainerView];
  v61 = [v63 leadingAnchor];
  v60 = [v62 constraintEqualToAnchor:v61 constant:16.0];
  v75[1] = v60;
  v46 = [(SimpleContaineeViewController *)self metadataContainerView];
  v47 = [v46 trailingAnchor];
  v48 = [(MapsThemeLabel *)self->_destinationHeaderLabel trailingAnchor];
  v49 = [v47 constraintEqualToAnchor:v48 constant:16.0];
  v75[2] = v49;
  v50 = [(SimpleContaineeViewController *)self metadataContainerView];
  v51 = [v50 bottomAnchor];
  v52 = [(MapsThemeLabel *)self->_destinationHeaderLabel bottomAnchor];
  v53 = [v51 constraintEqualToAnchor:v52 constant:0.0];
  v75[3] = v53;
  v54 = +[NSArray arrayWithObjects:v75 count:4];
  [v68 addObjectsFromArray:v54];

  +[NSLayoutConstraint activateConstraints:v68];
  v55 = +[NSNotificationCenter defaultCenter];
  [v55 addObserver:self selector:"_contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

  [(SharedTripContaineeViewController *)self updateContent];
  [(SharedTripContaineeViewController *)self _updateFonts];
  [(SharedTripContaineeViewController *)self _loadActions];
  objc_initWeak(&location, self);
  v56 = [MapsThrottler alloc];
  id v57 = &_dispatch_main_q;
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_1006B4B30;
  v71[3] = &unk_1012ED3A8;
  objc_copyWeak(&v72, &location);
  v58 = [(MapsThrottler *)v56 initWithInitialValue:0 throttlingInterval:&_dispatch_main_q queue:v71 updateHandler:30.0];
  buttonUpdateThrottler = self->_buttonUpdateThrottler;
  self->_buttonUpdateThrottler = v58;

  objc_destroyWeak(&v72);
  objc_destroyWeak(&location);
}

- (BOOL)forceCurrentWidthForHeaderHeightCalculations
{
  return 1;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)SharedTripContaineeViewController;
  [(SimpleContaineeViewController *)&v4 viewDidLoad];
  v3 = [(SharedTripContaineeViewController *)self view];
  [v3 setAccessibilityIdentifier:@"SharedTripView"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SharedTripContaineeViewController;
  [(SimpleContaineeViewController *)&v5 viewWillAppear:a3];
  self->_isVisible = 1;
  objc_super v4 = +[MKLocationManager sharedLocationManager];
  [v4 listenForLocationUpdates:self];

  [(SharedTripContaineeViewController *)self _refreshSubscriptionToken];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SharedTripContaineeViewController;
  [(SharedTripContaineeViewController *)&v10 viewDidAppear:a3];
  refreshTimestampTimer = self->_refreshTimestampTimer;
  if (refreshTimestampTimer)
  {
    [(NSTimer *)refreshTimestampTimer invalidate];
    objc_super v5 = self->_refreshTimestampTimer;
    self->_refreshTimestampTimer = 0;
  }
  double v6 = +[NSTimer scheduledTimerWithTimeInterval:self target:"updateContent" selector:0 userInfo:1 repeats:60.0];
  v7 = self->_refreshTimestampTimer;
  self->_refreshTimestampTimer = v6;

  v8 = [(SharedTripContaineeViewController *)self sharedTrip];
  v9 = [v8 _transportTypeStringForAnalytics];
  +[GEOAPPortal captureUserAction:21 target:650 value:v9];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SharedTripContaineeViewController;
  [(SimpleContaineeViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = +[MKLocationManager sharedLocationManager];
  [v4 stopListeningForLocationUpdates:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SharedTripContaineeViewController;
  [(SharedTripContaineeViewController *)&v6 viewDidDisappear:a3];
  self->_isVisible = 0;
  id subscriptionToken = self->_subscriptionToken;
  self->_id subscriptionToken = 0;

  [(NSTimer *)self->_refreshTimestampTimer invalidate];
  refreshTimestampTimer = self->_refreshTimestampTimer;
  self->_refreshTimestampTimer = 0;
}

- (void)_loadActions
{
  objc_initWeak(&location, self);
  v3 = objc_alloc_init(SimpleContaineeAction);
  objc_super v4 = +[NSBundle mainBundle];
  objc_super v5 = [v4 localizedStringForKey:@"Stop Receiving Updates [Shared ETA]" value:@"localized string not found" table:0];
  [(SimpleContaineeAction *)v3 setTitle:v5];

  [(SimpleContaineeAction *)v3 setGlyph:@"trash.circle.fill"];
  [(SimpleContaineeAction *)v3 setGlyphStyle:3];
  [(SimpleContaineeAction *)v3 setAccessibilityIdentifier:@"StopReceivingUpdatesAction"];
  [(SimpleContaineeAction *)v3 setStyle:1];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1006B55A8;
  v35[3] = &unk_1012E6708;
  objc_copyWeak(&v36, &location);
  [(SimpleContaineeAction *)v3 setAction:v35];
  if ([(SharedTripContaineeViewController *)self _senderIsContact])
  {
    objc_super v6 = +[NSBundle mainBundle];
    [v6 localizedStringForKey:@"Block this Contact [Shared ETA]" value:@"localized string not found" table:0];
  }
  else
  {
    objc_super v6 = +[NSBundle mainBundle];
    [v6 localizedStringForKey:@"Block this Sender [Shared ETA]" value:@"localized string not found" table:0];
  v7 = };

  v8 = objc_alloc_init(SimpleContaineeAction);
  [(SimpleContaineeAction *)v8 setTitle:v7];
  if (sub_1000BBB44(self) == 5)
  {
    v9 = +[NSBundle mainBundle];
    objc_super v10 = [v9 localizedStringForKey:@"Share ETA Blocked Contacts explanation" value:@"localized string not found" table:0];

    [(SimpleContaineeAction *)v8 setFooter:v10];
  }
  [(SimpleContaineeAction *)v8 setGlyph:@"hand.raised.circle.fill"];
  [(SimpleContaineeAction *)v8 setGlyphStyle:2];
  [(SimpleContaineeAction *)v8 setAccessibilityIdentifier:@"BlockContactAction"];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1006B55EC;
  v33[3] = &unk_1012E6708;
  objc_copyWeak(&v34, &location);
  [(SimpleContaineeAction *)v8 setAction:v33];
  v38[0] = v3;
  v38[1] = v8;
  double v11 = +[NSArray arrayWithObjects:v38 count:2];
  if (sub_1000BBB44(self) != 5
    && ![(SharedTripContaineeViewController *)self _senderIsContact]
    && +[AddressBookManager addressBookAllowed])
  {
    v26 = objc_alloc_init(SimpleContaineeAction);
    double v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"Create New Contact [Shared ETA]" value:@"localized string not found" table:0];
    [(SimpleContaineeAction *)v26 setTitle:v13];

    [(SimpleContaineeAction *)v26 setGlyph:@"person.crop.circle"];
    [(SimpleContaineeAction *)v26 setAccessibilityIdentifier:@"CreateNewContactAction"];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1006B5630;
    v31[3] = &unk_1012E6708;
    objc_copyWeak(&v32, &location);
    [(SimpleContaineeAction *)v26 setAction:v31];
    v14 = objc_alloc_init(SimpleContaineeAction);
    v15 = +[NSBundle mainBundle];
    v16 = [v15 localizedStringForKey:@"Add to Existing Contact [Shared ETA]" value:@"localized string not found" table:0];
    [(SimpleContaineeAction *)v14 setTitle:v16];

    [(SimpleContaineeAction *)v14 setGlyph:@"person.crop.circle.badge.plus"];
    [(SimpleContaineeAction *)v14 setAccessibilityIdentifier:@"AddToExistingContactAction"];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1006B5674;
    v29[3] = &unk_1012E6708;
    objc_copyWeak(&v30, &location);
    [(SimpleContaineeAction *)v14 setAction:v29];
    id v17 = [v11 mutableCopy];
    [v17 insertObject:v26 atIndex:0];
    [v17 insertObject:v14 atIndex:1];
    id v18 = [v17 copy];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);

    double v11 = v18;
  }
  v19 = +[GEOPlatform sharedPlatform];
  unsigned int v20 = [v19 isInternalInstall];

  if (v20)
  {
    id v21 = objc_alloc_init(SimpleContaineeAction);
    v22 = +[NSBundle mainBundle];
    v23 = [v22 localizedStringForKey:@"File a Radar [Shared ETA]" value:@"localized string not found" table:0];
    [(SimpleContaineeAction *)v21 setTitle:v23];

    v24 = +[UIImage _maps_radar_symbolCircleFilled];
    [(SimpleContaineeAction *)v21 setSymbol:v24];

    [(SimpleContaineeAction *)v21 setGlyphStyle:2];
    [(SimpleContaineeAction *)v21 setAccessibilityIdentifier:@"TapToRadarAction"];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1006B56B8;
    v27[3] = &unk_1012E6708;
    objc_copyWeak(&v28, &location);
    [(SimpleContaineeAction *)v21 setAction:v27];
    uint64_t v25 = [v11 arrayByAddingObject:v21];

    objc_destroyWeak(&v28);
    double v11 = (void *)v25;
  }
  [(SimpleContaineeViewController *)self setActions:v11];

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&location);
}

- (void)updateContent
{
  if (![(SharedTripContaineeViewController *)self isViewLoaded]) {
    return;
  }
  v3 = [(SharedTripContaineeViewController *)self sharedTrip];
  id v43 = [v3 destinationName];

  id v4 = [v43 length];
  objc_super v5 = +[NSBundle mainBundle];
  objc_super v6 = v5;
  if (v4)
  {
    v7 = [v5 localizedStringForKey:@"(person)'s route to (location) [shared eta]" value:@"localized string not found" table:0];
    v8 = [(SharedTripContaineeViewController *)self sharedTrip];
    v9 = [v8 senderName];
    objc_super v10 = [(SharedTripContaineeViewController *)self sharedTrip];
    double v11 = [v10 destinationName];
    double v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9, v11);
    [(UILabel *)self->_headerTitleLabel setText:v12];
  }
  else
  {
    v7 = [v5 localizedStringForKey:@"(person)'s route [shared eta]" value:@"localized string not found" table:0];
    v8 = [(SharedTripContaineeViewController *)self sharedTrip];
    v9 = [v8 senderName];
    objc_super v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9);
    [(UILabel *)self->_headerTitleLabel setText:v10];
  }

  v13 = [(SharedTripContaineeViewController *)self sharedTrip];
  v14 = [v13 homeCellSubtitle];
  [(UILabel *)self->_headerSubtitleLabel setText:v14];

  v15 = [(SharedTripContaineeViewController *)self sharedTrip];
  v16 = [v15 senderInfo];
  id v17 = [v16 hasLocalContactIdentifier];

  if (v17)
  {
    p_handleLabel = &self->_handleLabel;
    [(UILabel *)self->_handleLabel setText:&stru_101324E70];
  }
  else
  {
    v19 = [(SharedTripContaineeViewController *)self sharedTrip];
    unsigned int v20 = [v19 senderInfo];
    id v21 = [v20 fromIdentifier];
    p_handleLabel = &self->_handleLabel;
    [(UILabel *)self->_handleLabel setText:v21];
  }
  [(UILabel *)*p_handleLabel setHidden:v17];
  v22 = [(SharedTripContaineeViewController *)self sharedTrip];
  v23 = [v22 waypointInfos];
  remainingWaypoints = self->_remainingWaypoints;
  self->_remainingWaypoints = v23;

  uint64_t v25 = [(SharedTripContaineeViewController *)self sharedTrip];
  v26 = [v25 etaInfos];
  remainingETAs = self->_remainingETAs;
  self->_remainingETAs = v26;

  id v28 = [(SharedTripContaineeViewController *)self sharedTrip];
  if ([v28 hasCurrentWaypointIndex])
  {
    v29 = [(SharedTripContaineeViewController *)self sharedTrip];
    unint64_t v30 = [v29 currentWaypointIndex];
  }
  else
  {
    unint64_t v30 = 0;
  }

  v31 = [(SharedTripContaineeViewController *)self sharedTrip];
  if (![v31 hasCurrentWaypointIndex]
    || [(NSArray *)self->_remainingWaypoints count] <= v30)
  {
    goto LABEL_16;
  }
  NSUInteger v32 = [(NSArray *)self->_remainingETAs count];

  if (v32 > v30)
  {
    -[NSArray subarrayWithRange:](self->_remainingWaypoints, "subarrayWithRange:", v30, (char *)[(NSArray *)self->_remainingWaypoints count] - v30);
    v33 = (NSArray *)objc_claimAutoreleasedReturnValue();
    id v34 = self->_remainingWaypoints;
    self->_remainingWaypoints = v33;

    -[NSArray subarrayWithRange:](self->_remainingETAs, "subarrayWithRange:", v30, (char *)[(NSArray *)self->_remainingETAs count] - v30);
    v35 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v31 = self->_remainingETAs;
    self->_remainingETAs = v35;
LABEL_16:
  }
  id v36 = [(SharedTripContaineeViewController *)self sharedTrip];
  id v37 = [v36 waypointInfosCount];

  v38 = +[NSBundle mainBundle];
  v39 = v38;
  if ((unint64_t)v37 >= 2) {
    CFStringRef v40 = @"Stops [Shared ETA]";
  }
  else {
    CFStringRef v40 = @"Destination [Shared ETA]";
  }
  v41 = [v38 localizedStringForKey:v40 value:@"localized string not found" table:0];
  [(MapsThemeLabel *)self->_destinationHeaderLabel setText:v41];

  v42 = [(SimpleContaineeViewController *)self actionsTableView];
  [v42 reloadData];

  [(SharedTripContaineeViewController *)self _updateButtons];
  [(SharedTripContaineeViewController *)self updateTheme];
}

- (BOOL)_shouldShowDirectionsButton
{
  v2 = [(SharedTripContaineeViewController *)self sharedTrip];
  v3 = [v2 destinationWaypointMapItem];

  id v4 = objc_alloc((Class)CLLocation);
  [v3 coordinate];
  double v6 = v5;
  [v3 coordinate];
  id v7 = [v4 initWithLatitude:v6];
  v8 = +[MKLocationManager sharedLocationManager];
  v9 = [v8 lastLocation];

  [v9 distanceFromLocation:v7];
  BOOL v12 = v10 >= 500.0 || v9 == 0;

  return v12;
}

- (void)_updateButtonsForLocationUpdate
{
  unsigned int v3 = [(SharedTripContaineeViewController *)self _shouldShowDirectionsButton];
  id v4 = [(UIButton *)self->_directionsButton superview];
  if (v3)
  {
    if (v4)
    {

      return;
    }
  }
  else
  {
    double v5 = v4;

    if (!v5) {
      return;
    }
  }

  [(SharedTripContaineeViewController *)self _updateButtons];
}

- (void)_updateButtons
{
  unsigned int v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"To (destination)[SharedETA]" value:@"localized string not found" table:0];

  double v5 = [(SharedTripContaineeViewController *)self sharedTrip];
  double v6 = [v5 destinationName];

  uint64_t v7 = 0;
  if ([(NSArray *)self->_remainingWaypoints count] >= 2)
  {
    if ([v6 length])
    {
      uint64_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6);
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  v8 = [(UIButton *)self->_directionsButton configuration];
  id v37 = (void *)v7;
  [v8 setSubtitle:v7];
  [(UIButton *)self->_directionsButton setConfiguration:v8];
  id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  double v10 = [(SharedTripContaineeViewController *)self sharedTrip];
  double v11 = [v10 destinationWaypointMapItem];

  id v12 = objc_alloc((Class)CLLocation);
  [v11 coordinate];
  double v14 = v13;
  [v11 coordinate];
  id v15 = [v12 initWithLatitude:v14];
  v16 = +[MKLocationManager sharedLocationManager];
  id v17 = [v16 lastLocation];
  id v36 = v15;
  [v17 distanceFromLocation:v15];
  v19 = v18;

  LODWORD(v16) = [(SharedTripContaineeViewController *)self _shouldShowDirectionsButton];
  unsigned int v20 = sub_100576A9C();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
  if (v16)
  {
    if (v21)
    {
      *(_DWORD *)buf = 134283521;
      v39 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Will display Directions for button distance: %{private}lfm", buf, 0xCu);
    }

    [v9 addObject:self->_directionsButton];
  }
  else
  {
    if (v21)
    {
      *(_DWORD *)buf = 134283521;
      v39 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Will NOT display Directions button for distance: %{private}lfm", buf, 0xCu);
    }
  }
  v22 = [(SharedTripContaineeViewController *)self sharedTrip];
  v23 = [v22 senderInfo];
  v24 = [v23 localContactIdentifier];

  id v25 = [v24 length];
  unsigned int v26 = +[AddressBookManager addressBookAllowed];
  v27 = sub_100576A9C();
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
  if (v25 && v26)
  {
    if (v28)
    {
      *(_DWORD *)buf = 138477827;
      v39 = v24;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Will display Contact button for sender:%{private}@", buf, 0xCu);
    }

    v29 = [(UIButton *)self->_contactButton configuration];

    unint64_t v30 = [(SharedTripContaineeViewController *)self sharedTrip];
    v31 = [v30 senderInfo];
    NSUInteger v32 = [v31 localName];
    [v29 setSubtitle:v32];

    [(UIButton *)self->_contactButton setConfiguration:v29];
    [v9 addObject:self->_contactButton];
    v8 = v29;
  }
  else
  {
    if (v28)
    {
      v33 = @"NO";
      if (v26) {
        v33 = @"YES";
      }
      id v34 = v33;
      *(_DWORD *)buf = 138478083;
      v39 = v24;
      __int16 v40 = 2112;
      v41 = v34;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Will NOT display Contact button for sender: %{private}@ (Contacts access authorized: %@)", buf, 0x16u);
    }
  }
  v35 = [(SimpleContaineeViewController *)self topActionsContainerView];
  [v35 _maps_setArrangedSubviews:v9];
}

- (void)updateTheme
{
  v6.receiver = self;
  v6.super_class = (Class)SharedTripContaineeViewController;
  [(SimpleContaineeViewController *)&v6 updateTheme];
  if (sub_1000BBB44(self) == 5)
  {
    directionsButton = self->_directionsButton;
    id v4 = [(SharedTripContaineeViewController *)self theme];
    double v5 = [v4 keyColor];
    [(UIButton *)directionsButton setTitleColor:v5 forState:0];
  }
}

- (void)_updateFonts
{
  unsigned int v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle1];
  id v4 = [v3 fontDescriptor];
  double v5 = [v4 fontDescriptorWithSymbolicTraits:2];
  objc_super v6 = +[UIFont fontWithDescriptor:v5 size:0.0];
  [(UILabel *)self->_headerTitleLabel setFont:v6];

  id v17 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle3];
  uint64_t v7 = [v17 fontDescriptorWithSymbolicTraits:2];
  v8 = +[UIFont fontWithDescriptor:v7 size:0.0];
  [(MapsThemeLabel *)self->_destinationHeaderLabel setFont:v8];

  id v9 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubhead addingSymbolicTraits:2 options:0];
  double v10 = +[UIFont fontWithDescriptor:v9 size:0.0];
  double v11 = [(UIButton *)self->_directionsButton titleLabel];
  [v11 setFont:v10];

  id v12 = [(UIButton *)self->_directionsButton titleLabel];
  double v13 = [v12 font];
  double v14 = [(UIButton *)self->_contactButton titleLabel];
  [v14 setFont:v13];

  if (sub_1000BBB44(self) == 5) {
    +[UIFont system17];
  }
  else {
  id v15 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  }
  [(UILabel *)self->_headerSubtitleLabel setFont:v15];

  v16 = [(UILabel *)self->_headerSubtitleLabel font];
  [(UILabel *)self->_handleLabel setFont:v16];
}

- (void)didMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SharedTripContaineeViewController;
  [(SharedTripContaineeViewController *)&v4 didMoveToParentViewController:a3];
  [(SharedTripContaineeViewController *)self _refreshSubscriptionToken];
}

- (void)setSharedTrip:(id)a3
{
  double v5 = (GEOSharedNavState *)a3;
  if (self->_sharedTrip != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_sharedTrip, a3);
    [(SharedTripContaineeViewController *)self updateContent];
    double v5 = v6;
  }
}

- (void)_refreshSubscriptionToken
{
  id v9 = [(SharedTripContaineeViewController *)self _maps_uiScene];
  unsigned int v3 = [(SharedTripContaineeViewController *)self sharedTrip];
  if (v3 && self->_isVisible)
  {

    if (v9)
    {
      objc_super v4 = [SharedTripSceneAwareSubscription alloc];
      double v5 = [(SharedTripContaineeViewController *)self sharedTrip];
      objc_super v6 = [v5 groupIdentifier];
      uint64_t v7 = [(SharedTripSceneAwareSubscription *)v4 initWithTripIdentifier:v6 scene:v9];
      id subscriptionToken = self->_subscriptionToken;
      self->_id subscriptionToken = v7;

      goto LABEL_7;
    }
  }
  else
  {
  }
  double v5 = self->_subscriptionToken;
  self->_id subscriptionToken = 0;
LABEL_7:
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SharedTripContaineeViewController;
  return [(SimpleContaineeViewController *)&v4 numberOfSectionsInTableView:a3] + 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
  {
    v6.receiver = self;
    v6.super_class = (Class)SharedTripContaineeViewController;
    return -[SimpleContaineeViewController tableView:numberOfRowsInSection:](&v6, "tableView:numberOfRowsInSection:", a3);
  }
  else
  {
    remainingWaypoints = self->_remainingWaypoints;
    return [(NSArray *)remainingWaypoints count];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 section])
  {
    v48.receiver = self;
    v48.super_class = (Class)SharedTripContaineeViewController;
    v8 = [(SimpleContaineeViewController *)&v48 tableView:v7 cellForRowAtIndexPath:v6];
    goto LABEL_25;
  }
  v8 = [v7 dequeueReusableCellWithIdentifier:@"StopCell" forIndexPath:v6];

  [v8 setAccessibilityIdentifier:@"SharedTripStopCell"];
  id v9 = [v6 row];
  id v7 = [(NSArray *)self->_remainingWaypoints objectAtIndexedSubscript:v9];
  double v10 = +[UIListContentConfiguration subtitleCellConfiguration];
  double v11 = 16.0;
  if (sub_1000BBB44(self) == 5)
  {
    [v10 directionalLayoutMargins];
    double v11 = v12;
  }
  uint64_t v13 = sub_1000BBB44(self);
  double v14 = 4.0;
  if (v13 != 5) {
    double v14 = 16.0;
  }
  [v10 setDirectionalLayoutMargins:v14, v11, v14, v11];
  id v15 = [v7 name];
  [v10 setText:v15];

  if (v9 >= (id)[(NSArray *)self->_remainingETAs count])
  {
    v16 = 0;
  }
  else
  {
    v16 = [(NSArray *)self->_remainingETAs objectAtIndexedSubscript:v9];
  }
  v44 = v16;
  if ([v16 hasEtaTimestamp])
  {
    [v16 etaTimestamp];
    +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = +[NSTimeZone localTimeZone];
    v19 = +[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:v17 inTimeZone:v18 canIncludeDate:0];

    unsigned int v20 = +[NSBundle mainBundle];
    BOOL v21 = [v20 localizedStringForKey:@"[Shared Trip, Details] Waypoint ETA", @"localized string not found", 0 value table];
    v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v19, v44);

    [v10 setSecondaryText:v22];
LABEL_14:

    goto LABEL_15;
  }
  if ([v7 hasMapItemStorage])
  {
    id v23 = objc_alloc((Class)MKMapItem);
    v24 = [v7 mapItemStorage];
    id v17 = [v23 initWithGeoMapItem:v24 isPlaceHolderPlace:0];

    id v25 = [v17 _addressFormattedAsMultilineAddress];
    [v10 setSecondaryText:v25];

    v19 = [v10 secondaryTextProperties];
    [v19 setNumberOfLines:0];
    goto LABEL_14;
  }
LABEL_15:
  unsigned int v26 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleHeadline];
  v27 = [v26 fontDescriptorWithSymbolicTraits:2];
  BOOL v28 = +[UIFont fontWithDescriptor:v27 size:0.0];
  v29 = [v10 textProperties];
  [v29 setFont:v28];

  unint64_t v30 = [v10 textProperties];
  [v30 setNumberOfLines:0];

  v31 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  NSUInteger v32 = [v10 secondaryTextProperties];
  [v32 setFont:v31];

  v33 = +[UIColor secondaryLabelColor];
  id v34 = [v10 secondaryTextProperties];
  [v34 setColor:v33];

  [v8 setContentConfiguration:v10];
  if ([v7 hasMapItemStorage])
  {
    v35 = objc_alloc_init(MapsUIImageGEOFeatureSpec);
    [(MapsUIImageGEOFeatureSpec *)v35 setTransparent:0];
    [(MapsUIImageGEOFeatureSpec *)v35 setInverted:0];
    if (sub_1000BBB44(self) == 5) {
      uint64_t v36 = 1;
    }
    else {
      uint64_t v36 = 2;
    }
    [(MapsUIImageGEOFeatureSpec *)v35 setSize:v36];
    id v37 = [v7 mapItemStorage];
    v38 = [v37 _styleAttributes];
    [(MapsUIImageGEOFeatureSpec *)v35 setStyle:v38];

    v39 = +[MapsUIImageCache sharedCache];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1006B6CB0;
    v45[3] = &unk_1012F4C10;
    id v46 = v10;
    id v47 = v8;
    [v39 getImageForSpec:v35 loadImageOnBackgroundQueue:0 completion:v45];
  }
  else
  {
    if ([v7 hasChargingStationInfo]) {
      +[GEOFeatureStyleAttributes evChargerStyleAttributes];
    }
    else {
    __int16 v40 = +[GEOFeatureStyleAttributes addressMarkerStyleAttributes];
    }
    v41 = [(SharedTripContaineeViewController *)self traitCollection];
    [v41 displayScale];
    v42 = +[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v40, 2, 0);
    [v10 setImage:v42];

    [v8 setContentConfiguration:v10];
  }

LABEL_25:

  return v8;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section])
  {
    v13.receiver = self;
    v13.super_class = (Class)SharedTripContaineeViewController;
    unsigned __int8 v8 = [(SimpleContaineeViewController *)&v13 tableView:v6 shouldHighlightRowAtIndexPath:v7];
  }
  else
  {
    id v9 = [v7 row];

    double v10 = [(SharedTripContaineeViewController *)self sharedTrip];
    double v11 = [v10 waypointInfoAtIndex:v9];

    unsigned __int8 v8 = [v11 hasMapItemStorage];
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section])
  {
    v12.receiver = self;
    v12.super_class = (Class)SharedTripContaineeViewController;
    [(SimpleContaineeViewController *)&v12 tableView:v6 didSelectRowAtIndexPath:v7];
  }
  else
  {
    id v8 = [v7 row];
    id v9 = [(SharedTripContaineeViewController *)self sharedTrip];
    double v10 = [v9 waypointInfoAtIndex:v8];

    if ([v10 hasMapItemStorage])
    {
      double v11 = [v10 mapItemStorage];
      [(SharedTripContaineeViewController *)self _presentPlaceCardForMapItem:v11];

      [v6 deselectRowAtIndexPath:v7 animated:1];
    }
  }
}

- (void)_presentPlaceCardForMapItem:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    id v4 = [objc_alloc((Class)MKMapItem) initWithGeoMapItem:v7 isPlaceHolderPlace:0];
    if (v4)
    {
      double v5 = v4;
      id v6 = [(SharedTripContaineeViewController *)self actionDelegate];
      [v6 didSelectStopWithMapItem:v5];
    }
  }
}

- (BOOL)_senderIsContact
{
  v2 = [(SharedTripContaineeViewController *)self sharedTrip];
  unsigned int v3 = [v2 senderInfo];
  id v4 = [v3 localContactIdentifier];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)_addContact
{
  unsigned int v3 = [(SharedTripContaineeViewController *)self sharedTrip];
  id v4 = [v3 senderName];
  BOOL v5 = [(SharedTripContaineeViewController *)self sharedTrip];
  id v6 = [v5 senderInfo];
  id v7 = [v6 fromIdentifier];
  id v10 = +[CNContact contactWithDisplayName:v4 emailOrPhoneNumber:v7];

  id v8 = +[CNContactViewController viewControllerForNewContact:v10];
  [v8 setDisplayMode:1];
  [v8 setDelegate:self];
  id v9 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v8];
  [v9 setModalPresentationStyle:-2];
  [(SharedTripContaineeViewController *)self _maps_topMostPresentViewController:v9 animated:1 completion:0];
}

- (void)_addToContact
{
  id v3 = objc_alloc_init((Class)CNContactPickerViewController);
  [v3 setDelegate:self];
  [(SharedTripContaineeViewController *)self _maps_topMostPresentViewController:v3 animated:1 completion:0];
}

- (id)_refetchedContact:(id)a3
{
  id v3 = a3;
  id v4 = +[AddressBookManager sharedManager];
  BOOL v5 = [v4 properties];

  if (([v3 areKeysAvailable:v5] & 1) == 0)
  {
    id v6 = +[AddressBookManager sharedManager];
    id v7 = [v6 contactStore];

    id v8 = [v3 identifier];
    uint64_t v9 = [v7 unifiedContactWithIdentifier:v8 keysToFetch:v5 error:0];

    id v3 = (id)v9;
  }

  return v3;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v7 = a4;
  [a3 dismissViewControllerAnimated:1 completion:0];
  id v6 = v7;
  if (v7)
  {
    [(SharedTripContaineeViewController *)self _reloadWithContact:v7];
    id v6 = v7;
  }
}

- (void)contactPickerDidCancel:(id)a3
{
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v5 = a4;
  id v6 = [(SharedTripContaineeViewController *)self sharedTrip];
  id v7 = [v6 senderInfo];
  id v26 = [v7 fromIdentifier];

  id v8 = [(SharedTripContaineeViewController *)self _refetchedContact:v5];

  id v9 = [v8 mutableCopy];
  id v10 = +[CNContact contactWithDisplayName:0 emailOrPhoneNumber:v26];
  double v11 = [v10 emailAddresses];
  id v12 = [v11 count];

  if (v12)
  {
    objc_super v13 = [v9 emailAddresses];
    if (v13)
    {
      double v14 = [v9 emailAddresses];
      id v15 = [v14 mutableCopy];
    }
    else
    {
      id v15 = [&__NSArray0__struct mutableCopy];
    }

    v16 = [v10 emailAddresses];
    [v15 addObjectsFromArray:v16];

    [v9 setEmailAddresses:v15];
  }
  id v17 = [v10 phoneNumbers];
  id v18 = [v17 count];

  if (v18)
  {
    v19 = [v9 phoneNumbers];
    if (v19)
    {
      unsigned int v20 = [v9 phoneNumbers];
      id v21 = [v20 mutableCopy];
    }
    else
    {
      id v21 = [&__NSArray0__struct mutableCopy];
    }

    v22 = [v10 phoneNumbers];
    [v21 addObjectsFromArray:v22];

    [v9 setPhoneNumbers:v21];
  }
  id v23 = objc_alloc_init((Class)CNSaveRequest);
  v24 = +[AddressBookManager sharedManager];
  id v25 = [v24 contactStore];

  [v23 updateContact:v9];
  [v25 executeSaveRequest:v23 error:0];
  [(SharedTripContaineeViewController *)self _reloadWithContact:v9];
}

- (void)_reloadWithContact:(id)a3
{
  id v4 = a3;
  id v9 = [(SharedTripContaineeViewController *)self sharedTrip];
  id v5 = [v4 identifier];
  id v6 = [v9 senderInfo];
  [v6 setLocalContactIdentifier:v5];

  id v7 = +[CNContactFormatter stringFromContact:v4 style:1000];

  id v8 = [v9 senderInfo];
  [v8 setLocalName:v7];

  [(SharedTripContaineeViewController *)self updateContent];
  [(SharedTripContaineeViewController *)self _loadActions];
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4 = [a3 lastLocation];
  [(MapsThrottler *)self->_buttonUpdateThrottler setValue:v4];
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void)blockSender
{
  objc_initWeak(&location, self);
  if ([(SharedTripContaineeViewController *)self _senderIsContact])
  {
    id v3 = +[NSBundle mainBundle];
    [v3 localizedStringForKey:@"Block this Contact [Shared ETA]" value:@"localized string not found" table:0];
  }
  else
  {
    id v3 = +[NSBundle mainBundle];
    [v3 localizedStringForKey:@"Block this Sender [Shared ETA]" value:@"localized string not found" table:0];
  id v4 = };

  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"[SharedETA] Alert's text confirmation" value:@"localized string not found" table:0];
  id v7 = +[UIAlertController alertControllerWithTitle:0 message:v6 preferredStyle:0];

  [v7 setAccessibilityIdentifier:@"BlockContactAlert"];
  id v8 = [(SimpleContaineeViewController *)self actionsTableView];
  id v9 = [v7 popoverPresentationController];
  [v9 setSourceView:v8];

  id v10 = [(SimpleContaineeViewController *)self actionsTableView];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [v7 popoverPresentationController];
  [v19 setSourceRect:v12, v14, v16, v18];

  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  id v26 = sub_1006B7944;
  v27 = &unk_1012E8EB8;
  objc_copyWeak(&v28, &location);
  unsigned int v20 = +[UIAlertAction actionWithTitle:v4 style:2 handler:&v24];
  [v7 addAction:v20, v24, v25, v26, v27];

  id v21 = +[NSBundle mainBundle];
  v22 = [v21 localizedStringForKey:@"[SharedETA] Alert's cancel button title" value:@"localized string not found" table:0];
  id v23 = +[UIAlertAction actionWithTitle:v22 style:1 handler:&stru_1012F4C30];
  [v7 addAction:v23];

  [(SharedTripContaineeViewController *)self _maps_topMostPresentViewController:v7 animated:1 completion:0];
  objc_destroyWeak(&v28);

  objc_destroyWeak(&location);
}

- (void)blockSenderAction
{
  id v3 = [(SharedTripContaineeViewController *)self sharedTrip];
  id v4 = [v3 senderInfo];
  id v5 = [v4 fromIdentifier];

  if (v5)
  {
    CMFItemFromString = (const void *)CreateCMFItemFromString();
    id v7 = sub_100576A9C();
    id v8 = v7;
    if (CMFItemFromString)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138477827;
        double v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Blocking sender handle %{private}@", (uint8_t *)&v12, 0xCu);
      }

      CMFBlockListAddItemForAllServices();
      CFRelease(CMFItemFromString);
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unable to create filter item to block sender", (uint8_t *)&v12, 2u);
      }
    }
  }
  id v9 = +[MSPSharedTripService sharedInstance];
  id v10 = [(SharedTripContaineeViewController *)self sharedTrip];
  double v11 = [v10 groupIdentifier];
  [v9 blockSharedTripWithIdentifier:v11];
}

- (void)blockTrip
{
  id v3 = +[MSPSharedTripService sharedInstance];
  id v4 = [(SharedTripContaineeViewController *)self sharedTrip];
  id v5 = [v4 groupIdentifier];
  [v3 blockSharedTripWithIdentifier:v5];

  id v7 = [(SharedTripContaineeViewController *)self sharedTrip];
  id v6 = [v7 _transportTypeStringForAnalytics];
  +[GEOAPPortal captureUserAction:9028 target:650 value:v6];
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5 = [(SharedTripContaineeViewController *)self actionDelegate];
  [v5 closeSharedTripDetail];

  id v7 = [(SharedTripContaineeViewController *)self sharedTrip];
  id v6 = [v7 _transportTypeStringForAnalytics];
  +[GEOAPPortal captureUserAction:4 target:650 value:v6];
}

- (void)contactButtonTapped
{
  id v3 = [(SharedTripContaineeViewController *)self actionDelegate];
  [v3 didRequestContactsCard];

  id v5 = [(SharedTripContaineeViewController *)self sharedTrip];
  id v4 = [v5 _transportTypeStringForAnalytics];
  +[GEOAPPortal captureUserAction:6044 target:650 value:v4];
}

- (void)directionsButtonTapped
{
  id v3 = [(SharedTripContaineeViewController *)self actionDelegate];
  id v4 = [(SharedTripContaineeViewController *)self sharedTrip];
  [v3 didRequestDirectionsForSharedTrip:v4];

  id v6 = [(SharedTripContaineeViewController *)self sharedTrip];
  id v5 = [v6 _transportTypeStringForAnalytics];
  +[GEOAPPortal captureUserAction:6003 target:650 value:v5];
}

- (void)tapToRadarButtonTapped
{
  id v2 = +[MapsRadarController sharedInstance];
  [v2 launchTTR];
}

- (void)applyAlphaToContent:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SharedTripContaineeViewController;
  -[ContaineeViewController applyAlphaToContent:](&v8, "applyAlphaToContent:");
  id v5 = [(SimpleContaineeViewController *)self topActionsContainerView];
  [v5 setAlpha:a3];

  id v6 = [(SimpleContaineeViewController *)self metadataContainerView];
  [v6 setAlpha:a3];

  id v7 = [(SimpleContaineeViewController *)self actionsTableView];
  [v7 setAlpha:a3];
}

- (void)_updateWithTrip:(id)a3
{
  id v9 = a3;
  id v4 = [(SharedTripContaineeViewController *)self sharedTrip];

  if (v4 == v9)
  {
    [(SharedTripContaineeViewController *)self updateContent];
  }
  else
  {
    id v5 = [(SharedTripContaineeViewController *)self sharedTrip];
    id v6 = [v5 groupIdentifier];
    id v7 = [v9 groupIdentifier];
    unsigned int v8 = [v6 isEqualToString:v7];

    if (v8) {
      [(SharedTripContaineeViewController *)self setSharedTrip:v9];
    }
  }
}

- (void)sharedTripServiceDidUpdateReceivingAvailability:(id)a3
{
  [a3 receivedTrips];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [v9 groupIdentifier];
        double v11 = [(SharedTripContaineeViewController *)self sharedTrip];
        int v12 = [v11 groupIdentifier];
        unsigned int v13 = [v10 isEqualToString:v12];

        if (v13)
        {
          [(SharedTripContaineeViewController *)self _updateWithTrip:v9];
          double v14 = v4;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  double v14 = [(SharedTripContaineeViewController *)self actionDelegate];
  [v14 closeSharedTripDetail];
LABEL_11:
}

- (void)sharedTripService:(id)a3 didReceiveSharedTrip:(id)a4
{
}

- (void)sharedTripService:(id)a3 didUpdateETAForSharedTrip:(id)a4
{
}

- (void)sharedTripService:(id)a3 didUpdateDestinationForSharedTrip:(id)a4
{
}

- (void)sharedTripService:(id)a3 didUpdateRouteForSharedTrip:(id)a4
{
}

- (void)sharedTripService:(id)a3 didUpdateReachedDestinationForSharedTrip:(id)a4
{
}

- (void)sharedTripService:(id)a3 didRemoveSharedTrip:(id)a4
{
  id v5 = a4;
  id v6 = [(SharedTripContaineeViewController *)self sharedTrip];
  uint64_t v7 = [v6 groupIdentifier];
  unsigned int v8 = [v5 groupIdentifier];

  LODWORD(v5) = [v7 isEqualToString:v8];
  if (v5)
  {
    id v9 = [(SharedTripContaineeViewController *)self actionDelegate];
    [v9 closeSharedTripDetail];
  }
}

- (void)sharedTripService:(id)a3 didUpdateClosedTrip:(id)a4
{
}

- (SharedTripsActionCoordination)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (SharedTripsActionCoordination *)WeakRetained;
}

- (void)setActionDelegate:(id)a3
{
}

- (GEOSharedNavState)sharedTrip
{
  return self->_sharedTrip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedTrip, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong(&self->_subscriptionToken, 0);
  objc_storeStrong((id *)&self->_refreshTimestampTimer, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_remainingETAs, 0);
  objc_storeStrong((id *)&self->_remainingWaypoints, 0);
  objc_storeStrong((id *)&self->_contactButton, 0);
  objc_storeStrong((id *)&self->_directionsButton, 0);
  objc_storeStrong((id *)&self->_buttonUpdateThrottler, 0);
  objc_storeStrong((id *)&self->_destinationHeaderLabel, 0);
  objc_storeStrong((id *)&self->_handleLabel, 0);
  objc_storeStrong((id *)&self->_headerSubtitleLabel, 0);

  objc_storeStrong((id *)&self->_headerTitleLabel, 0);
}

@end