@interface CarRouteGeniusDetailCardViewController
- (BOOL)_canSafelyRequestFocusUpdate;
- (BOOL)hasCardFinishedTransitioning;
- (BOOL)isHandoffEnabled;
- (BOOL)isNavigationAidedDrivingEnabled;
- (BOOL)routeIsNavigable;
- (CarRouteGeniusDetailCardViewController)initWithDelegate:(id)a3;
- (CarRouteGeniusDetailCardViewControllerDelegate)delegate;
- (GuidanceETA)currentETA;
- (MapsSuggestionsRouteGeniusEntry)currentSuggestion;
- (NSArray)actionButtons;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (id)_createEtaLabelTrailingConstraint;
- (id)_sharingETAString;
- (void)_alertsOnlyButtonPressed:(id)a3;
- (void)_disableInteraction;
- (void)_externalDeviceUpdated:(id)a3;
- (void)_goButtonPressed:(id)a3;
- (void)_handoffButtonPressed:(id)a3;
- (void)_setupConstraints;
- (void)_setupStyling;
- (void)_updateConstraints;
- (void)_updateContents;
- (void)allowInteraction;
- (void)dealloc;
- (void)setCurrentETA:(id)a3;
- (void)setCurrentSuggestion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHandoffEnabled:(BOOL)a3;
- (void)setHasCardFinishedTransitioning:(BOOL)a3;
- (void)setNavigationAidedDrivingEnabled:(BOOL)a3;
- (void)setRouteIsNavigable:(BOOL)a3;
- (void)updateRouteAdvisories;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CarRouteGeniusDetailCardViewController

- (CarRouteGeniusDetailCardViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CarRouteGeniusDetailCardViewController;
  v5 = [(CarRouteGeniusDetailCardViewController *)&v11 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = +[MapsExternalDevice sharedInstance];
    v6->_navigationAidedDrivingEnabled = [v7 isNavigationAidedDrivingEnabled];

    v8 = +[MapsExternalDevice sharedInstance];
    v6->_handoffEnabled = [v8 destinationHandoffEnabled];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v6 selector:"_externalDeviceUpdated:" name:@"MapsExternalDeviceUpdated" object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CarRouteGeniusDetailCardViewController;
  [(CarRouteGeniusDetailCardViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v36.receiver = self;
  v36.super_class = (Class)CarRouteGeniusDetailCardViewController;
  [(CarRouteGeniusDetailCardViewController *)&v36 viewDidLoad];
  v3 = [(CarRouteGeniusDetailCardViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CarRouteGeniusDetailCard"];

  id v4 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v8 = [v4 initWithFrame:CGRectZero.origin.x, y, width, height];
  etaLabel = self->_etaLabel;
  self->_etaLabel = v8;

  [(UILabel *)self->_etaLabel setAccessibilityIdentifier:@"ETALabel"];
  [(UILabel *)self->_etaLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_etaLabel setNumberOfLines:1];
  [(UILabel *)self->_etaLabel setAdjustsFontSizeToFitWidth:1];
  v10 = [(UILabel *)self->_etaLabel font];
  [v10 pointSize];
  objc_super v11 = self->_etaLabel;
  if (v12 < 12.0)
  {
    [(UILabel *)v11 setMinimumScaleFactor:1.0];
  }
  else
  {
    v13 = [(UILabel *)v11 font];
    [v13 pointSize];
    [(UILabel *)self->_etaLabel setMinimumScaleFactor:12.0 / v14];
  }
  v15 = [(CarRouteGeniusDetailCardViewController *)self view];
  [v15 addSubview:self->_etaLabel];

  v16 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  mainDescriptionLabel = self->_mainDescriptionLabel;
  self->_mainDescriptionLabel = v16;

  [(UILabel *)self->_mainDescriptionLabel setAccessibilityIdentifier:@"MainDescriptionLabel"];
  [(UILabel *)self->_mainDescriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_mainDescriptionLabel setNumberOfLines:1];
  v18 = [(CarRouteGeniusDetailCardViewController *)self view];
  [v18 addSubview:self->_mainDescriptionLabel];

  v19 = -[CarAdvisoriesView initWithFrame:]([CarAdvisoriesView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  routeAdvisoriesView = self->_routeAdvisoriesView;
  self->_routeAdvisoriesView = v19;

  [(CarAdvisoriesView *)self->_routeAdvisoriesView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CarAdvisoriesView *)self->_routeAdvisoriesView setHidden:1];
  v21 = [(CarRouteGeniusDetailCardViewController *)self view];
  [v21 addSubview:self->_routeAdvisoriesView];

  v22 = -[CarCardRoundedButton initWithFrame:]([CarMoreButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  handoffButton = self->_handoffButton;
  self->_handoffButton = v22;

  [(CarMoreButton *)self->_handoffButton setAccessibilityIdentifier:@"HandoffButton"];
  [(CarMoreButton *)self->_handoffButton setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v24) = 1132068864;
  [(CarMoreButton *)self->_handoffButton setContentHuggingPriority:1 forAxis:v24];
  LODWORD(v25) = 1148846080;
  [(CarMoreButton *)self->_handoffButton setContentCompressionResistancePriority:0 forAxis:v25];
  LODWORD(v26) = 1148846080;
  [(CarMoreButton *)self->_handoffButton setContentCompressionResistancePriority:1 forAxis:v26];
  [(CarMoreButton *)self->_handoffButton addTarget:self action:"_handoffButtonPressed:" forControlEvents:64];
  v27 = [(CarRouteGeniusDetailCardViewController *)self view];
  [v27 addSubview:self->_handoffButton];

  v28 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  alertsOnlyButton = self->_alertsOnlyButton;
  self->_alertsOnlyButton = v28;

  [(CarCardRoundedButton *)self->_alertsOnlyButton setAccessibilityIdentifier:@"AlertsOnlyButton"];
  [(CarCardRoundedButton *)self->_alertsOnlyButton setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v30) = 1148846080;
  [(CarCardRoundedButton *)self->_alertsOnlyButton setContentCompressionResistancePriority:1 forAxis:v30];
  [(CarCardRoundedButton *)self->_alertsOnlyButton addTarget:self action:"_alertsOnlyButtonPressed:" forControlEvents:64];
  v31 = [(CarRouteGeniusDetailCardViewController *)self view];
  [v31 addSubview:self->_alertsOnlyButton];

  v32 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  goButton = self->_goButton;
  self->_goButton = v32;

  [(CarCardRoundedButton *)self->_goButton setAccessibilityIdentifier:@"GoButton"];
  [(CarCardRoundedButton *)self->_goButton setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v34) = 1148846080;
  [(CarCardRoundedButton *)self->_goButton setContentCompressionResistancePriority:1 forAxis:v34];
  [(CarCardRoundedButton *)self->_goButton addTarget:self action:"_goButtonPressed:" forControlEvents:64];
  v35 = [(CarRouteGeniusDetailCardViewController *)self view];
  [v35 addSubview:self->_goButton];

  [(CarRouteGeniusDetailCardViewController *)self _setupConstraints];
  [(CarRouteGeniusDetailCardViewController *)self _setupStyling];
  [(CarRouteGeniusDetailCardViewController *)self _updateContents];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarRouteGeniusDetailCardViewController;
  [(CarRouteGeniusDetailCardViewController *)&v4 viewDidAppear:a3];
  self->_goButtonIsFocusable = 0;
  [(CarRouteGeniusDetailCardViewController *)self _updateContents];
}

- (void)_setupConstraints
{
  v82 = +[NSMutableArray array];
  v80 = [(UILabel *)self->_etaLabel topAnchor];
  v81 = [(CarRouteGeniusDetailCardViewController *)self view];
  v79 = [v81 topAnchor];
  v78 = [v80 constraintEqualToAnchor:v79];
  v85[0] = v78;
  v76 = [(UILabel *)self->_etaLabel leadingAnchor];
  v77 = [(CarRouteGeniusDetailCardViewController *)self view];
  v75 = [v77 leadingAnchor];
  v74 = [v76 constraintEqualToAnchor:v75 constant:10.0];
  v85[1] = v74;
  v73 = [(CarMoreButton *)self->_handoffButton trailingAnchor];
  v72 = [(UILabel *)self->_etaLabel trailingAnchor];
  v71 = [v73 constraintGreaterThanOrEqualToAnchor:v72 constant:10.0];
  v85[2] = v71;
  v70 = [(UILabel *)self->_mainDescriptionLabel firstBaselineAnchor];
  v69 = [(UILabel *)self->_etaLabel firstBaselineAnchor];
  v68 = [v70 constraintEqualToAnchor:v69 constant:16.0];
  v85[3] = v68;
  v66 = [(UILabel *)self->_mainDescriptionLabel leadingAnchor];
  v67 = [(CarRouteGeniusDetailCardViewController *)self view];
  v65 = [v67 leadingAnchor];
  v64 = [v66 constraintEqualToAnchor:v65 constant:10.0];
  v85[4] = v64;
  v63 = [(UILabel *)self->_mainDescriptionLabel trailingAnchor];
  v62 = [(UILabel *)self->_etaLabel trailingAnchor];
  v61 = [v63 constraintEqualToAnchor:v62];
  v85[5] = v61;
  v60 = [(CarAdvisoriesView *)self->_routeAdvisoriesView topAnchor];
  v59 = [(UILabel *)self->_mainDescriptionLabel lastBaselineAnchor];
  v58 = [v60 constraintEqualToAnchor:v59 constant:10.0];
  v85[6] = v58;
  v56 = [(CarAdvisoriesView *)self->_routeAdvisoriesView leadingAnchor];
  v57 = [(CarRouteGeniusDetailCardViewController *)self view];
  v55 = [v57 leadingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55 constant:10.0];
  v85[7] = v54;
  v52 = [(CarAdvisoriesView *)self->_routeAdvisoriesView trailingAnchor];
  v53 = [(CarRouteGeniusDetailCardViewController *)self view];
  v51 = [v53 trailingAnchor];
  v50 = [v52 constraintEqualToAnchor:v51 constant:-10.0];
  v85[8] = v50;
  v49 = [(CarAdvisoriesView *)self->_routeAdvisoriesView bottomAnchor];
  v48 = [(CarCardRoundedButton *)self->_alertsOnlyButton topAnchor];
  v47 = [v49 constraintLessThanOrEqualToAnchor:v48 constant:-4.0];
  v85[9] = v47;
  v46 = [(CarMoreButton *)self->_handoffButton heightAnchor];
  v45 = [v46 constraintEqualToConstant:30.0];
  v85[10] = v45;
  v44 = [(CarMoreButton *)self->_handoffButton widthAnchor];
  v43 = [v44 constraintEqualToConstant:30.0];
  v85[11] = v43;
  v42 = [(CarMoreButton *)self->_handoffButton topAnchor];
  v41 = [(UILabel *)self->_etaLabel topAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v85[12] = v40;
  v38 = [(CarMoreButton *)self->_handoffButton trailingAnchor];
  v39 = [(CarRouteGeniusDetailCardViewController *)self view];
  v37 = [v39 trailingAnchor];
  objc_super v36 = [v38 constraintEqualToAnchor:v37 constant:-10.0];
  v85[13] = v36;
  v35 = [(CarCardRoundedButton *)self->_alertsOnlyButton topAnchor];
  double v34 = [(UILabel *)self->_mainDescriptionLabel bottomAnchor];
  v33 = [v35 constraintGreaterThanOrEqualToAnchor:v34 constant:4.0];
  v85[14] = v33;
  v31 = [(CarCardRoundedButton *)self->_alertsOnlyButton leadingAnchor];
  v32 = [(CarRouteGeniusDetailCardViewController *)self view];
  double v30 = [v32 leadingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30 constant:10.0];
  v85[15] = v29;
  v27 = [(CarCardRoundedButton *)self->_alertsOnlyButton trailingAnchor];
  v28 = [(CarRouteGeniusDetailCardViewController *)self view];
  double v26 = [v28 trailingAnchor];
  double v25 = [v27 constraintEqualToAnchor:v26 constant:-10.0];
  v85[16] = v25;
  double v24 = [(CarCardRoundedButton *)self->_alertsOnlyButton heightAnchor];
  +[CarCardRoundedButton buttonMetrics];
  v23 = [v24 constraintEqualToConstant:v84];
  v85[17] = v23;
  v22 = [(CarCardRoundedButton *)self->_goButton topAnchor];
  v21 = [(CarCardRoundedButton *)self->_alertsOnlyButton bottomAnchor];
  v20 = [v22 constraintEqualToAnchor:v21 constant:2.0];
  v85[18] = v20;
  v19 = [(CarCardRoundedButton *)self->_goButton heightAnchor];
  +[CarCardRoundedButton buttonMetrics];
  v18 = [v19 constraintEqualToConstant:v83];
  v85[19] = v18;
  v16 = [(CarCardRoundedButton *)self->_goButton leadingAnchor];
  v17 = [(CarRouteGeniusDetailCardViewController *)self view];
  v15 = [v17 leadingAnchor];
  double v14 = [v16 constraintEqualToAnchor:v15 constant:10.0];
  v85[20] = v14;
  v3 = [(CarCardRoundedButton *)self->_goButton trailingAnchor];
  objc_super v4 = [(CarRouteGeniusDetailCardViewController *)self view];
  v5 = [v4 trailingAnchor];
  v6 = [v3 constraintEqualToAnchor:v5 constant:-10.0];
  v85[21] = v6;
  v7 = [(CarCardRoundedButton *)self->_goButton bottomAnchor];
  v8 = [(CarRouteGeniusDetailCardViewController *)self view];
  v9 = [v8 bottomAnchor];
  v10 = [v7 constraintEqualToAnchor:v9 constant:-10.0];
  v85[22] = v10;
  objc_super v11 = +[NSArray arrayWithObjects:v85 count:23];
  [v82 addObjectsFromArray:v11];

  double v12 = [(CarRouteGeniusDetailCardViewController *)self _createEtaLabelTrailingConstraint];
  etaLabelTrailingConstraint = self->_etaLabelTrailingConstraint;
  self->_etaLabelTrailingConstraint = v12;

  [v82 addObject:self->_etaLabelTrailingConstraint];
  +[NSLayoutConstraint activateConstraints:v82];
}

- (void)_setupStyling
{
  v3 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleFootnote weight:UIFontWeightMedium];
  [(UILabel *)self->_etaLabel setFont:v3];

  objc_super v4 = +[UIColor labelColor];
  [(UILabel *)self->_etaLabel setTextColor:v4];

  v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
  [(UILabel *)self->_mainDescriptionLabel setFont:v5];

  v6 = +[UIColor _carSystemPrimaryColor];
  [(UILabel *)self->_mainDescriptionLabel setTextColor:v6];

  v7 = [(UILabel *)self->_mainDescriptionLabel font];
  [v7 pointSize];
  [(UILabel *)self->_mainDescriptionLabel setMinimumScaleFactor:10.0 / v8];

  [(CarMoreButton *)self->_handoffButton setOptions:4];
  alertsOnlyButton = self->_alertsOnlyButton;
  v10 = +[NSBundle mainBundle];
  objc_super v11 = [v10 localizedStringForKey:@"Car_ALERTS_ONLY" value:@"localized string not found" table:0];
  [(CarCardRoundedButton *)alertsOnlyButton setTitle:v11 forState:0];

  double v12 = [(CarCardRoundedButton *)self->_alertsOnlyButton titleLabel];
  v13 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCallout weight:UIFontWeightRegular];
  [v12 setFont:v13];

  double v14 = +[UIColor _carSystemQuaternaryColor];
  [(CarFocusableButton *)self->_alertsOnlyButton setNonFocusedBackgroundColor:v14];

  v15 = +[UIColor labelColor];
  [(CarFocusableButton *)self->_alertsOnlyButton setNonFocusedTintColor:v15];

  goButton = self->_goButton;
  v17 = +[NSBundle mainBundle];
  v18 = [v17 localizedStringForKey:@"Car_START_BUTTON" value:@"localized string not found" table:0];
  [(CarCardRoundedButton *)goButton setTitle:v18 forState:0];

  v19 = [(CarCardRoundedButton *)self->_goButton titleLabel];
  v20 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCallout weight:UIFontWeightBold];
  [v19 setFont:v20];

  v21 = sub_100D899C4((char)[(CarCardRoundedButton *)self->_goButton isEnabled]);
  [(CarFocusableButton *)self->_goButton setNonFocusedBackgroundColor:v21];

  id v22 = +[UIColor systemWhiteColor];
  [(CarFocusableButton *)self->_goButton setNonFocusedTintColor:v22];
}

- (void)_updateContents
{
  v3 = [(CarRouteGeniusDetailCardViewController *)self currentETA];
  objc_super v4 = [v3 etaDateStringWithAMPMSymbol:0 allowTimeZone:0];

  if (v4)
  {
    v5 = +[NSBundle mainBundle];
    v6 = [v5 localizedStringForKey:@"00:00 ETA [CarPlay]" value:@"localized string not found" table:0];
    v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v4);
    [(UILabel *)self->_etaLabel setText:v7];
  }
  else
  {
    [(UILabel *)self->_etaLabel setText:0];
  }
  id v8 = objc_alloc((Class)MKServerFormattedString);
  v9 = [(MapsSuggestionsRouteGeniusEntry *)self->_currentSuggestion route];
  v10 = [v9 planningDescriptionString];
  id v11 = [v8 initWithComposedString:v10];

  double v12 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption1 weight:UIFontWeightRegular];
  NSAttributedStringKey v42 = NSFontAttributeName;
  v43 = v12;
  v13 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  v40 = v11;
  double v14 = [v11 multiPartAttributedStringWithAttributes:v13];
  v15 = [v14 attributedString];

  [(UILabel *)self->_mainDescriptionLabel setAttributedText:v15];
  v16 = [(CarRouteGeniusDetailCardViewController *)self _sharingETAString];
  id v17 = [v16 length];
  mainDescriptionLabel = self->_mainDescriptionLabel;
  if (v17)
  {
    v19 = [(UILabel *)mainDescriptionLabel text];
    v20 = [v19 stringByAppendingFormat:@"\n%@", v16];
    [(UILabel *)self->_mainDescriptionLabel setText:v20];

    mainDescriptionLabel = self->_mainDescriptionLabel;
    uint64_t v21 = 2;
  }
  else
  {
    uint64_t v21 = 1;
  }
  [(UILabel *)mainDescriptionLabel setNumberOfLines:v21];
  [(UILabel *)self->_mainDescriptionLabel setAdjustsFontSizeToFitWidth:v17 != 0];
  [(CarRouteGeniusDetailCardViewController *)self updateRouteAdvisories];
  if ([(CarRouteGeniusDetailCardViewController *)self isHandoffEnabled]) {
    BOOL v22 = [(CarRouteGeniusDetailCardViewController *)self isNavigationAidedDrivingEnabled];
  }
  else {
    BOOL v22 = 1;
  }
  [(CarMoreButton *)self->_handoffButton setHidden:v22];
  if ([(CarRouteGeniusDetailCardViewController *)self isNavigationAidedDrivingEnabled])
  {
    v23 = +[MapsExternalDevice sharedInstance];
    double v24 = [v23 mapsDisplayName];
    double v25 = v24;
    if (v24)
    {
      id v26 = v24;
    }
    else
    {
      sub_1008A68F8();
      id v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    double v30 = v26;

    [(CarCardRoundedButton *)self->_goButton setTitle:v30 forState:0];
    v31 = +[UIImage _mapsCar_systemImageNamed:@"square.and.arrow.up"];
    [(CarCardRoundedButton *)self->_goButton setImage:v31 forState:0];
  }
  else
  {
    goButton = self->_goButton;
    v28 = +[NSBundle mainBundle];
    v29 = [v28 localizedStringForKey:@"Car_START_BUTTON" value:@"localized string not found" table:0];
    [(CarCardRoundedButton *)goButton setTitle:v29 forState:0];

    [(CarCardRoundedButton *)self->_goButton setImage:0 forState:0];
  }
  BOOL v32 = [(CarRouteGeniusDetailCardViewController *)self routeIsNavigable]
     || [(CarRouteGeniusDetailCardViewController *)self isNavigationAidedDrivingEnabled];
  [(CarFocusableButton *)self->_alertsOnlyButton setEnabled:v32];
  BOOL goButtonIsFocusable = self->_goButtonIsFocusable;
  BOOL v34 = [(CarRouteGeniusDetailCardViewController *)self routeIsNavigable]
     || [(CarRouteGeniusDetailCardViewController *)self isNavigationAidedDrivingEnabled];
  [(CarFocusableButton *)self->_goButton setEnabled:v34];
  v35 = sub_100D899C4((char)[(CarCardRoundedButton *)self->_goButton isEnabled]);
  [(CarFocusableButton *)self->_goButton setNonFocusedBackgroundColor:v35];

  if ([(CarCardRoundedButton *)self->_goButton isEnabled])
  {
    unsigned int v36 = [(CarRouteGeniusDetailCardViewController *)self _canSafelyRequestFocusUpdate];
    if (!goButtonIsFocusable)
    {
      if (v36)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1004CC9F0;
        block[3] = &unk_1012E5D08;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
  unsigned int v37 = [(CarCardRoundedButton *)self->_goButton isEnabled];
  if (v37) {
    LOBYTE(v37) = [(CarRouteGeniusDetailCardViewController *)self _canSafelyRequestFocusUpdate];
  }
  self->_BOOL goButtonIsFocusable = v37;
  v38 = +[CarDisplayController sharedInstance];
  v39 = [v38 chromeViewController];
  [v39 setNeedsFocusUpdate];
}

- (id)_sharingETAString
{
  v2 = [(CarRouteGeniusDetailCardViewController *)self currentSuggestion];
  v3 = [v2 entry];
  objc_super v4 = [v3 sharingContacts];

  if ([v4 count])
  {
    if ([v4 count] == (id)1)
    {
      v5 = [v4 firstObject];
      v6 = [v5 contact];
      v7 = [v6 givenName];

      id v8 = +[NSBundle mainBundle];
      v9 = [v8 localizedStringForKey:@"CarPlay_PlaceCard_SharingAutomatically_OneContact" value:@"localized string not found" table:0];
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v7);
    }
    else
    {
      v5 = +[NSBundle mainBundle];
      v7 = [v5 localizedStringForKey:@"CarPlay_PlaceCard_SharingAutomatically" value:@"localized string not found" table:0];
      v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, [v4 count]);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_updateConstraints
{
  if ([(CarRouteGeniusDetailCardViewController *)self isViewLoaded])
  {
    if (self->_etaLabelTrailingConstraint)
    {
      etaLabelTrailingConstraint = self->_etaLabelTrailingConstraint;
      v3 = +[NSArray arrayWithObjects:&etaLabelTrailingConstraint count:1];
      +[NSLayoutConstraint deactivateConstraints:v3];
    }
    objc_super v4 = [(CarRouteGeniusDetailCardViewController *)self _createEtaLabelTrailingConstraint];
    v5 = self->_etaLabelTrailingConstraint;
    self->_etaLabelTrailingConstraint = v4;

    v7 = self->_etaLabelTrailingConstraint;
    v6 = +[NSArray arrayWithObjects:&v7 count:1];
    +[NSLayoutConstraint activateConstraints:v6];
  }
}

- (NSArray)actionButtons
{
  alertsOnlyButton = self->_alertsOnlyButton;
  v5[0] = self->_handoffButton;
  v5[1] = alertsOnlyButton;
  v5[2] = self->_goButton;
  v3 = +[NSArray arrayWithObjects:v5 count:3];

  return (NSArray *)v3;
}

- (void)setRouteIsNavigable:(BOOL)a3
{
  if (self->_routeIsNavigable != a3)
  {
    self->_routeIsNavigable = a3;
    [(CarRouteGeniusDetailCardViewController *)self _updateContents];
  }
}

- (void)setCurrentSuggestion:(id)a3
{
  v5 = (MapsSuggestionsRouteGeniusEntry *)a3;
  if (self->_currentSuggestion != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_currentSuggestion, a3);
    [(CarRouteGeniusDetailCardViewController *)self _updateContents];
    v5 = v6;
  }
}

- (void)setCurrentETA:(id)a3
{
  v5 = (GuidanceETA *)a3;
  if (self->_currentETA != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_currentETA, a3);
    [(CarRouteGeniusDetailCardViewController *)self _updateContents];
    v5 = v6;
  }
}

- (void)setNavigationAidedDrivingEnabled:(BOOL)a3
{
  if (self->_navigationAidedDrivingEnabled != a3)
  {
    self->_navigationAidedDrivingEnabled = a3;
    [(CarRouteGeniusDetailCardViewController *)self _updateContents];
  }
}

- (void)setHandoffEnabled:(BOOL)a3
{
  if (self->_handoffEnabled != a3)
  {
    self->_handoffEnabled = a3;
    [(CarRouteGeniusDetailCardViewController *)self _updateContents];
    [(CarRouteGeniusDetailCardViewController *)self _updateConstraints];
  }
}

- (void)setHasCardFinishedTransitioning:(BOOL)a3
{
  if (self->_hasCardFinishedTransitioning != a3)
  {
    self->_hasCardFinishedTransitioning = a3;
    if (a3) {
      [(CarRouteGeniusDetailCardViewController *)self _updateContents];
    }
  }
}

- (BOOL)_canSafelyRequestFocusUpdate
{
  if (![(CarRouteGeniusDetailCardViewController *)self isViewLoaded]) {
    return 0;
  }
  if (![(CarRouteGeniusDetailCardViewController *)self hasCardFinishedTransitioning]) {
    return 0;
  }
  v3 = [(CarRouteGeniusDetailCardViewController *)self view];
  objc_super v4 = [v3 window];
  v5 = [v4 rootViewController];

  if (!v5) {
    return 0;
  }
  v6 = [(CarRouteGeniusDetailCardViewController *)self view];
  v7 = [v6 superview];
  if (v7)
  {
    id v8 = [(CarRouteGeniusDetailCardViewController *)self traitCollection];
  }
  else
  {
    id v11 = +[UIScreen _carScreen];
    id v8 = [v11 traitCollection];
  }
  BOOL v9 = ((unint64_t)[v8 interactionModel] & 0xA) != 0;

  return v9;
}

- (void)updateRouteAdvisories
{
  routeAdvisoriesView = self->_routeAdvisoriesView;
  objc_super v4 = [(MapsSuggestionsRouteGeniusEntry *)self->_currentSuggestion route];
  [(CarAdvisoriesView *)routeAdvisoriesView setRoute:v4];

  BOOL v5 = [(CarAdvisoriesView *)self->_routeAdvisoriesView count] == 0;
  v6 = self->_routeAdvisoriesView;

  [(CarAdvisoriesView *)v6 setHidden:v5];
}

- (id)_createEtaLabelTrailingConstraint
{
  unsigned int v3 = [(CarRouteGeniusDetailCardViewController *)self isHandoffEnabled];
  objc_super v4 = [(UILabel *)self->_etaLabel trailingAnchor];
  if (v3)
  {
    BOOL v5 = [(CarMoreButton *)self->_handoffButton leadingAnchor];
    v6 = [v4 constraintEqualToAnchor:v5 constant:-10.0];
  }
  else
  {
    BOOL v5 = [(CarRouteGeniusDetailCardViewController *)self view];
    v7 = [v5 trailingAnchor];
    v6 = [v4 constraintEqualToAnchor:v7 constant:-10.0];
  }

  return v6;
}

- (void)_externalDeviceUpdated:(id)a3
{
  objc_super v4 = +[MapsExternalDevice sharedInstance];
  -[CarRouteGeniusDetailCardViewController setNavigationAidedDrivingEnabled:](self, "setNavigationAidedDrivingEnabled:", [v4 isNavigationAidedDrivingEnabled]);

  id v5 = +[MapsExternalDevice sharedInstance];
  -[CarRouteGeniusDetailCardViewController setHandoffEnabled:](self, "setHandoffEnabled:", [v5 destinationHandoffEnabled]);
}

- (void)_handoffButtonPressed:(id)a3
{
  [(CarRouteGeniusDetailCardViewController *)self _disableInteraction];
  id v4 = [(CarRouteGeniusDetailCardViewController *)self delegate];
  [v4 detailCardDidHandOff:self];
}

- (void)_alertsOnlyButtonPressed:(id)a3
{
  [(CarRouteGeniusDetailCardViewController *)self _disableInteraction];
  id v4 = [(CarRouteGeniusDetailCardViewController *)self delegate];
  [v4 detailCardDidAccept:self navigationType:2];
}

- (void)_goButtonPressed:(id)a3
{
  [(CarRouteGeniusDetailCardViewController *)self _disableInteraction];
  id v4 = [(CarRouteGeniusDetailCardViewController *)self delegate];
  [v4 detailCardDidAccept:self navigationType:0];
}

- (void)_disableInteraction
{
  unsigned int v3 = sub_100577E34();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = self;
    if (!v4)
    {
      BOOL v9 = @"<nil>";
      goto LABEL_10;
    }
    id v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      v7 = [(CarRouteGeniusDetailCardViewController *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        BOOL v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    BOOL v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    uint64_t v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] RG detail: Disabling action buttons.", buf, 0xCu);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = [(CarRouteGeniusDetailCardViewController *)self actionButtons];
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) setEnabled:0];
      }
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)allowInteraction
{
  unsigned int v3 = sub_100577E34();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = self;
    if (!v4)
    {
      BOOL v9 = @"<nil>";
      goto LABEL_10;
    }
    id v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      v7 = [(CarRouteGeniusDetailCardViewController *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        BOOL v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    BOOL v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    uint64_t v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] RG detail: Enabling action buttons.", buf, 0xCu);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = [(CarRouteGeniusDetailCardViewController *)self actionButtons];
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) setEnabled:1];
      }
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (NSArray)focusOrderSubItems
{
  if ([(CarRouteGeniusDetailCardViewController *)self isViewLoaded])
  {
    alertsOnlyButton = self->_alertsOnlyButton;
    v8[0] = self->_handoffButton;
    v8[1] = alertsOnlyButton;
    v8[2] = self->_goButton;
    id v4 = +[NSArray arrayWithObjects:v8 count:3];
    id v5 = +[NSPredicate predicateWithBlock:&stru_1012ECB20];
    v6 = [v4 filteredArrayUsingPredicate:v5];
  }
  else
  {
    v6 = &__NSArray0__struct;
  }

  return (NSArray *)v6;
}

- (NSArray)preferredFocusEnvironments
{
  if ([(CarCardRoundedButton *)self->_goButton isEnabled])
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

- (MapsSuggestionsRouteGeniusEntry)currentSuggestion
{
  return self->_currentSuggestion;
}

- (GuidanceETA)currentETA
{
  return self->_currentETA;
}

- (BOOL)routeIsNavigable
{
  return self->_routeIsNavigable;
}

- (BOOL)hasCardFinishedTransitioning
{
  return self->_hasCardFinishedTransitioning;
}

- (CarRouteGeniusDetailCardViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarRouteGeniusDetailCardViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isNavigationAidedDrivingEnabled
{
  return self->_navigationAidedDrivingEnabled;
}

- (BOOL)isHandoffEnabled
{
  return self->_handoffEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentETA, 0);
  objc_storeStrong((id *)&self->_currentSuggestion, 0);
  objc_storeStrong((id *)&self->_etaLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_goButton, 0);
  objc_storeStrong((id *)&self->_alertsOnlyButton, 0);
  objc_storeStrong((id *)&self->_handoffButton, 0);
  objc_storeStrong((id *)&self->_routeAdvisoriesView, 0);
  objc_storeStrong((id *)&self->_mainDescriptionLabel, 0);

  objc_storeStrong((id *)&self->_etaLabel, 0);
}

@end