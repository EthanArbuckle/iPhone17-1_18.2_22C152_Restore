@interface CarETAExpandedSign
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)_shouldEnableShareTripButton;
- (CarCardRoundedButton)reportIncidentButton;
- (CarCardRoundedButton)shareTripButton;
- (CarETACardSignDelegate)delegate;
- (CarETAExpandedSign)initWithDataSource:(id)a3 delegate:(id)a4;
- (CarETAExpandedSignDataSource)dataSource;
- (GuidanceETA)latestETA;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (NSArray)stackedButtons;
- (void)_buttonTapped:(id)a3;
- (void)_rebuildButtons;
- (void)_setupConstraints;
- (void)_updateContent;
- (void)_updateSharingButtonDisabledTitle;
- (void)_updateStyling;
- (void)dealloc;
- (void)incidentsReportingEnablementDidUpdate;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLatestETA:(id)a3;
- (void)setReportIncidentButton:(id)a3;
- (void)setShareTripButton:(id)a3;
- (void)suggestionsDataSourceDidUpdateContactsForDisplay:(id)a3;
@end

@implementation CarETAExpandedSign

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarETAExpandedSign)initWithDataSource:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)CarETAExpandedSign;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v11 = -[CarETAExpandedSign initWithFrame:](&v42, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v12 = v11;
  if (v11)
  {
    [(CarETAExpandedSign *)v11 setAccessibilityIdentifier:@"CarETAExpandedSign"];
    objc_storeWeak((id *)&v12->_delegate, v7);
    objc_storeWeak((id *)&v12->_dataSource, v6);
    v13 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    etaLabel = v12->_etaLabel;
    v12->_etaLabel = v13;

    [(UILabel *)v12->_etaLabel setAccessibilityIdentifier:@"EtaLabel"];
    [(UILabel *)v12->_etaLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v15) = 1132068864;
    [(UILabel *)v12->_etaLabel setContentHuggingPriority:0 forAxis:v15];
    LODWORD(v16) = 1148846080;
    [(UILabel *)v12->_etaLabel setContentHuggingPriority:1 forAxis:v16];
    LODWORD(v17) = 1144750080;
    [(UILabel *)v12->_etaLabel setContentCompressionResistancePriority:0 forAxis:v17];
    LODWORD(v18) = 1148846080;
    [(UILabel *)v12->_etaLabel setContentCompressionResistancePriority:1 forAxis:v18];
    [(CarETAExpandedSign *)v12 addSubview:v12->_etaLabel];
    v19 = -[CarFocusableButton initWithFrame:]([CarFocusableButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    expandButton = v12->_expandButton;
    v12->_expandButton = v19;

    [(CarFocusableButton *)v12->_expandButton setAccessibilityIdentifier:@"ExpandButton"];
    [(CarFocusableButton *)v12->_expandButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v21) = 1144750080;
    [(CarFocusableButton *)v12->_expandButton setContentHuggingPriority:0 forAxis:v21];
    LODWORD(v22) = 1148846080;
    [(CarFocusableButton *)v12->_expandButton setContentCompressionResistancePriority:0 forAxis:v22];
    LODWORD(v23) = 1148846080;
    [(CarFocusableButton *)v12->_expandButton setContentCompressionResistancePriority:1 forAxis:v23];
    -[MapsLargerHitTargetButton setTouchInsets:](v12->_expandButton, "setTouchInsets:", -10.0, -120.0, -10.0, -10.0);
    [(CarFocusableButton *)v12->_expandButton addTarget:v12 action:"_buttonTapped:" forControlEvents:64];
    v24 = +[NSBundle mainBundle];
    v25 = [v24 localizedStringForKey:@"CarPlay_Expand" value:@"localized string not found" table:0];
    v43[0] = v25;
    v26 = +[NSBundle mainBundle];
    v27 = [v26 localizedStringForKey:@"CarPlay_Up" value:@"localized string not found" table:0];
    v43[1] = v27;
    v28 = +[NSArray arrayWithObjects:v43 count:2];
    [(CarFocusableButton *)v12->_expandButton setAccessibilityUserInputLabels:v28];

    [(CarETAExpandedSign *)v12 addSubview:v12->_expandButton];
    v29 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    stopsButton = v12->_stopsButton;
    v12->_stopsButton = v29;

    [(CarCardRoundedButton *)v12->_stopsButton setAccessibilityIdentifier:@"StopsButton"];
    [(CarCardRoundedButton *)v12->_stopsButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarCardRoundedButton *)v12->_stopsButton setContentHorizontalAlignment:1];
    [(CarCardRoundedButton *)v12->_stopsButton addTarget:v12 action:"_buttonTapped:" forControlEvents:64];
    if (MSPSharedTripSharingAvailable())
    {
      v31 = [[SharedTripSuggestionsDataSource alloc] initWithSoftCellCap:GEOConfigGetUInteger() includeActiveContacts:1];
      suggestionDataSource = v12->_suggestionDataSource;
      v12->_suggestionDataSource = v31;

      [(SharedTripSuggestionsDataSource *)v12->_suggestionDataSource setDelegate:v12];
    }
    v33 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    endButton = v12->_endButton;
    v12->_endButton = v33;

    [(CarCardRoundedButton *)v12->_endButton setAccessibilityIdentifier:@"EndButton"];
    [(CarCardRoundedButton *)v12->_endButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v35) = 1148846080;
    [(CarCardRoundedButton *)v12->_endButton setContentCompressionResistancePriority:1 forAxis:v35];
    [(CarCardRoundedButton *)v12->_endButton addTarget:v12 action:"_buttonTapped:" forControlEvents:64];
    v36 = (UIStackView *)objc_alloc_init((Class)UIStackView);
    buttonsStackView = v12->_buttonsStackView;
    v12->_buttonsStackView = v36;

    [(UIStackView *)v12->_buttonsStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v38) = 1144766464;
    [(UIStackView *)v12->_buttonsStackView setContentCompressionResistancePriority:1 forAxis:v38];
    LODWORD(v39) = 1148846080;
    [(UIStackView *)v12->_buttonsStackView setContentCompressionResistancePriority:0 forAxis:v39];
    [(UIStackView *)v12->_buttonsStackView setAxis:1];
    [(UIStackView *)v12->_buttonsStackView setDistribution:1];
    [(UIStackView *)v12->_buttonsStackView setSpacing:2.0];
    [(CarETAExpandedSign *)v12 addSubview:v12->_buttonsStackView];
    v40 = +[TrafficIncidentLayoutManager sharedInstance];
    [v40 addObserver:v12];

    [(CarETAExpandedSign *)v12 _rebuildButtons];
    [(CarETAExpandedSign *)v12 _setupConstraints];
    [(CarETAExpandedSign *)v12 _updateSharingButtonDisabledTitle];
    [(CarETAExpandedSign *)v12 _updateStyling];
    [(CarETAExpandedSign *)v12 _updateContent];
  }

  return v12;
}

- (void)dealloc
{
  v3 = +[TrafficIncidentLayoutManager sharedInstance];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CarETAExpandedSign;
  [(CarETAExpandedSign *)&v4 dealloc];
}

- (CarCardRoundedButton)shareTripButton
{
  shareTripButton = self->_shareTripButton;
  if (!shareTripButton)
  {
    objc_super v4 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_shareTripButton;
    self->_shareTripButton = v4;

    [(CarCardRoundedButton *)self->_shareTripButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarCardRoundedButton *)self->_shareTripButton setContentHorizontalAlignment:1];
    [(CarCardRoundedButton *)self->_shareTripButton addTarget:self action:"_buttonTapped:" forControlEvents:64];
    id v6 = self->_shareTripButton;
    id v7 = +[UIColor _carSystemSecondaryColor];
    [(CarFocusableButton *)v6 setTitleColor:v7 forState:2];

    shareTripButton = self->_shareTripButton;
  }

  return shareTripButton;
}

- (CarCardRoundedButton)reportIncidentButton
{
  v3 = +[TrafficIncidentLayoutManager sharedInstance];
  unsigned int v4 = [v3 isIncidentReportingEnabled];

  if (v4)
  {
    reportIncidentButton = self->_reportIncidentButton;
    if (!reportIncidentButton)
    {
      id v6 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      id v7 = self->_reportIncidentButton;
      self->_reportIncidentButton = v6;

      [(CarCardRoundedButton *)self->_reportIncidentButton setTranslatesAutoresizingMaskIntoConstraints:0];
      [(CarCardRoundedButton *)self->_reportIncidentButton setContentHorizontalAlignment:1];
      [(CarCardRoundedButton *)self->_reportIncidentButton addTarget:self action:"_buttonTapped:" forControlEvents:64];
      reportIncidentButton = self->_reportIncidentButton;
    }
    v8 = reportIncidentButton;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSArray)stackedButtons
{
  v3 = objc_opt_new();
  [v3 addObject:self->_stopsButton];
  unsigned int v4 = [(CarETAExpandedSign *)self shareTripButton];

  if (v4) {
    [v3 addObject:self->_shareTripButton];
  }
  v5 = [(CarETAExpandedSign *)self reportIncidentButton];

  if (v5) {
    [v3 addObject:self->_reportIncidentButton];
  }
  [v3 addObject:self->_endButton];
  id v6 = [v3 copy];

  return (NSArray *)v6;
}

- (void)_setupConstraints
{
  v32 = objc_opt_new();
  v30 = [(UILabel *)self->_etaLabel firstBaselineAnchor];
  v28 = [(CarETAExpandedSign *)self topAnchor];
  v26 = [v30 constraintEqualToAnchor:v28 constant:28.0];
  v34[0] = v26;
  v24 = [(UILabel *)self->_etaLabel leadingAnchor];
  double v23 = [(CarETAExpandedSign *)self leadingAnchor];
  double v22 = [v24 constraintEqualToAnchor:v23 constant:10.0];
  v34[1] = v22;
  double v21 = [(UILabel *)self->_etaLabel trailingAnchor];
  v3 = [(CarFocusableButton *)self->_expandButton leadingAnchor];
  unsigned int v4 = [v21 constraintEqualToAnchor:v3 constant:-10.0];
  v34[2] = v4;
  v5 = [(CarFocusableButton *)self->_expandButton firstBaselineAnchor];
  id v6 = [(CarETAExpandedSign *)self topAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6 constant:29.0];
  v34[3] = v7;
  v8 = [(CarFocusableButton *)self->_expandButton trailingAnchor];
  v9 = [(CarETAExpandedSign *)self trailingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9 constant:-8.5];
  v34[4] = v10;
  v11 = +[NSArray arrayWithObjects:v34 count:5];
  [v32 addObjectsFromArray:v11];

  v31 = [(UIStackView *)self->_buttonsStackView topAnchor];
  v29 = [(UILabel *)self->_etaLabel lastBaselineAnchor];
  v27 = [v31 constraintEqualToAnchor:v29 constant:14.0];
  v33[0] = v27;
  v25 = [(UIStackView *)self->_buttonsStackView leadingAnchor];
  v12 = [(CarETAExpandedSign *)self leadingAnchor];
  v13 = [v25 constraintEqualToAnchor:v12 constant:10.0];
  v33[1] = v13;
  v14 = [(UIStackView *)self->_buttonsStackView trailingAnchor];
  double v15 = [(CarETAExpandedSign *)self trailingAnchor];
  double v16 = [v14 constraintEqualToAnchor:v15 constant:-10.0];
  v33[2] = v16;
  double v17 = [(UIStackView *)self->_buttonsStackView bottomAnchor];
  double v18 = [(CarETAExpandedSign *)self bottomAnchor];
  v19 = [v17 constraintEqualToAnchor:v18 constant:-10.0];
  v33[3] = v19;
  v20 = +[NSArray arrayWithObjects:v33 count:4];
  [v32 addObjectsFromArray:v20];

  +[NSLayoutConstraint activateConstraints:v32];
}

- (void)_rebuildButtons
{
  v3 = [(UIStackView *)self->_buttonsStackView arrangedSubviews];
  unsigned int v4 = [(CarETAExpandedSign *)self stackedButtons];
  if (([v3 isEqualToArray:v4] & 1) == 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = [(UIStackView *)self->_buttonsStackView arrangedSubviews];
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          [(UIStackView *)self->_buttonsStackView _maps_removeArrangedSubview:*(void *)(*((void *)&v12 + 1) + 8 * (void)v9)];
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [(UIStackView *)self->_buttonsStackView _maps_setArrangedSubviews:v4];
    v10 = +[NSMutableArray array];
    v11 = sub_100099700(v4, &stru_1012E89B0);
    [v10 addObjectsFromArray:v11];

    +[NSLayoutConstraint activateConstraints:v10];
  }
}

- (void)_updateContent
{
  v3 = [(CarETAExpandedSign *)self dataSource];
  unsigned int v4 = [v3 isSharingTrip];

  [(CarFocusableButton *)self->_shareTripButton setEnabled:[(CarETAExpandedSign *)self _shouldEnableShareTripButton]];
  v5 = +[MSPSharedTripService sharedInstance];
  if ([v5 canAddReceivers])
  {
    [(CarCardRoundedButton *)self->_shareTripButton setHidden:0];
  }
  else
  {
    id v6 = +[MSPSharedTripService sharedInstance];
    id v7 = [v6 receivers];
    -[CarCardRoundedButton setHidden:](self->_shareTripButton, "setHidden:", [v7 count] == 0);
  }
  uint64_t v8 = +[NSBundle mainBundle];
  v9 = v8;
  if (v4) {
    CFStringRef v10 = @"CarPlay_ShareTripButton_Sharing";
  }
  else {
    CFStringRef v10 = @"CarPlay_ShareTripButton_NotSharing";
  }
  if (v4) {
    CFStringRef v11 = @"person.crop.circle.badge.checkmark";
  }
  else {
    CFStringRef v11 = @"person.crop.circle.badge.plus";
  }
  id v35 = [v8 localizedStringForKey:v10 value:@"localized string not found" table:0];

  [(CarCardRoundedButton *)self->_shareTripButton setTitle:v35 forState:0];
  shareTripButton = self->_shareTripButton;
  long long v13 = +[UIImage _mapsCar_systemImageNamed:v11 textStyle:UIFontTextStyleTitle3];
  [(CarCardRoundedButton *)shareTripButton setImage:v13 forState:0];

  long long v14 = +[TrafficIncidentLayoutManager sharedInstance];
  id v15 = [v14 isIncidentReportingEnabled];

  [(CarFocusableButton *)self->_reportIncidentButton setEnabled:v15];
  reportIncidentButton = self->_reportIncidentButton;
  double v17 = +[NSBundle mainBundle];
  double v18 = [v17 localizedStringForKey:@"Report [Nav Tray, Incident Report]", @"localized string not found", 0 value table];
  [(CarCardRoundedButton *)reportIncidentButton setTitle:v18 forState:0];

  v19 = self->_reportIncidentButton;
  v20 = +[UIImage _mapsCar_systemImageNamed:@"exclamationmark.bubble.fill" textStyle:UIFontTextStyleTitle3];
  [(CarCardRoundedButton *)v19 setImage:v20 forState:0];

  double v21 = [(CarETAExpandedSign *)self dataSource];
  double v22 = [v21 upcomingWaypoints];
  double v23 = sub_1000AC254(v22, &stru_1012E89D0);
  id v24 = [v23 count];

  stopsButton = self->_stopsButton;
  v26 = +[NSBundle mainBundle];
  v27 = v26;
  if ((unint64_t)v24 < 2)
  {
    v33 = [v26 localizedStringForKey:@"CarPlay_AddStop" value:@"localized string not found" table:0];
    [(CarCardRoundedButton *)stopsButton setTitle:v33 forState:0];

    v34 = self->_stopsButton;
    v29 = +[UIImage _mapsCar_systemImageNamed:@"plus.circle.fill" textStyle:UIFontTextStyleTitle3 weight:6];
    [(CarCardRoundedButton *)v34 setImage:v29 forState:0];
  }
  else
  {
    v28 = [v26 localizedStringForKey:@"CarPlay_EditStops" value:@"localized string not found" table:0];
    [(CarCardRoundedButton *)stopsButton setTitle:v28 forState:0];

    v29 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleTitle3 weight:UIFontWeightForImageSymbolWeight(UIImageSymbolWeightSemibold)];
    v30 = +[UIImageSymbolConfiguration configurationWithFont:v29];
    v31 = self->_stopsButton;
    v32 = +[UIImage _systemImageNamed:@"pin.point.of.interest.2.fill" withConfiguration:v30];
    [(CarCardRoundedButton *)v31 setImage:v32 forState:0];
  }
}

- (void)_updateStyling
{
  v3 = +[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontWeightSemibold);
  [(UILabel *)self->_etaLabel setFont:v3];

  [(UILabel *)self->_etaLabel setMinimumScaleFactor:0.800000012];
  [(UILabel *)self->_etaLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_etaLabel setNumberOfLines:2];
  unsigned int v4 = +[UIColor labelColor];
  [(UILabel *)self->_etaLabel setTextColor:v4];

  v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"00:00 ETA [CarPlay]" value:@"localized string not found" table:0];

  v41 = v6;
  id v7 = [v6 substringToIndex:2];
  unsigned int v8 = [v7 isEqualToString:@"%@"];

  if (v8) {
    uint64_t v9 = 4;
  }
  else {
    uint64_t v9 = 3;
  }
  [(UILabel *)self->_etaLabel setLineBreakMode:v9];
  expandButton = self->_expandButton;
  CFStringRef v11 = +[UIImage _mapsCar_systemImageNamed:@"chevron.down.circle.fill" textStyle:UIFontTextStyleTitle3 weight:6];
  [(CarFocusableButton *)expandButton setImage:v11 forState:0];

  long long v12 = +[UIColor _carSystemFocusColor];
  [(CarFocusableButton *)self->_expandButton setFocusedTintColor:v12];

  long long v13 = +[UIColor _carSystemTertiaryColor];
  [(CarFocusableButton *)self->_expandButton setNonFocusedTintColor:v13];

  long long v14 = +[NSBundle mainBundle];
  id v15 = [v14 localizedStringForKey:@"CarPlay_Collapse" value:@"localized string not found" table:0];
  v47[0] = v15;
  double v16 = +[NSBundle mainBundle];
  double v17 = [v16 localizedStringForKey:@"CarPlay_Close" value:@"localized string not found" table:0];
  v47[1] = v17;
  double v18 = +[NSBundle mainBundle];
  v19 = [v18 localizedStringForKey:@"CarPlay_Down" value:@"localized string not found" table:0];
  v47[2] = v19;
  v20 = +[NSArray arrayWithObjects:v47 count:3];
  [(CarFocusableButton *)self->_expandButton setAccessibilityUserInputLabels:v20];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  double v21 = [(CarETAExpandedSign *)self stackedButtons];
  id v22 = [v21 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v43;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v43 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(CarCardRoundedButton **)(*((void *)&v42 + 1) + 8 * i);
        v27 = [(CarCardRoundedButton *)v26 titleLabel];
        [v27 setMinimumScaleFactor:0.800000012];

        v28 = [(CarCardRoundedButton *)v26 titleLabel];
        [v28 setAdjustsFontSizeToFitWidth:1];

        v29 = [(CarCardRoundedButton *)v26 titleLabel];
        [v29 setNumberOfLines:2];

        if (v26 != self->_endButton)
        {
          v30 = +[UIColor labelColor];
          [(CarFocusableButton *)v26 setNonFocusedTintColor:v30];

          v31 = +[UIColor _carSystemQuaternaryColor];
          [(CarFocusableButton *)v26 setNonFocusedBackgroundColor:v31];
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v23);
  }

  endButton = self->_endButton;
  v33 = +[NSBundle mainBundle];
  v34 = [v33 localizedStringForKey:@"CarPlay_EndRoute" value:@"localized string not found" table:0];
  [(CarCardRoundedButton *)endButton setTitle:v34 forState:0];

  [(CarCardRoundedButton *)self->_endButton setContentHorizontalAlignment:0];
  id v35 = [(CarCardRoundedButton *)self->_endButton titleLabel];
  v36 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCallout weight:UIFontWeightBold];
  [v35 setFont:v36];

  v37 = +[UIColor systemWhiteColor];
  [(CarFocusableButton *)self->_endButton setNonFocusedTintColor:v37];

  double v38 = +[UIColor _carSystemFocusLabelColor];
  [(CarFocusableButton *)self->_endButton setFocusedTintColor:v38];

  double v39 = +[UIColor systemRedColor];
  [(CarFocusableButton *)self->_endButton setNonFocusedBackgroundColor:v39];

  v40 = +[UIColor _carSystemFocusColor];
  [(CarFocusableButton *)self->_endButton setFocusedBackgroundColor:v40];
}

- (void)_updateSharingButtonDisabledTitle
{
  v3 = +[NSBundle mainBundle];
  unsigned int v4 = [v3 localizedStringForKey:@"CarPlay_ShareTripButton_NotSharing" value:@"localized string not found" table:0];

  LODWORD(v3) = [(SharedTripSuggestionsDataSource *)self->_suggestionDataSource isRefreshing];
  v5 = +[NSBundle mainBundle];
  id v6 = v5;
  if (v3) {
    CFStringRef v7 = @"CarPlay_ShareTripButton_LoadingContacts";
  }
  else {
    CFStringRef v7 = @"CarPlay_ShareTripButton_NoContacts";
  }
  unsigned int v8 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];

  id v9 = objc_alloc((Class)NSMutableAttributedString);
  NSAttributedStringKey v22 = NSForegroundColorAttributeName;
  CFStringRef v10 = +[UIColor _carSystemSecondaryColor];
  id v23 = v10;
  CFStringRef v11 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  id v12 = [v9 initWithString:v4 attributes:v11];

  id v13 = objc_alloc((Class)NSAttributedString);
  long long v14 = +[NSString stringWithFormat:@"\n%@", v8];
  v20[0] = NSForegroundColorAttributeName;
  id v15 = +[UIColor _carSystemSecondaryColor];
  v21[0] = v15;
  v20[1] = NSFontAttributeName;
  +[CarCardRoundedButton buttonMetrics];
  double v16 = +[UIFont systemFontOfSize:v19 weight:UIFontWeightMedium];
  v21[1] = v16;
  double v17 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  id v18 = [v13 initWithString:v14 attributes:v17];
  [v12 appendAttributedString:v18];

  [(CarCardRoundedButton *)self->_shareTripButton setAttributedTitle:v12 forState:2];
}

- (void)_buttonTapped:(id)a3
{
  unsigned int v4 = (CarCardRoundedButton *)a3;
  if ((CarCardRoundedButton *)self->_expandButton == v4)
  {
    id v9 = v4;
    v5 = [(CarETAExpandedSign *)self delegate];
    id v6 = v5;
    CFStringRef v7 = self;
    uint64_t v8 = 0;
  }
  else if (self->_stopsButton == v4)
  {
    id v9 = v4;
    v5 = [(CarETAExpandedSign *)self delegate];
    id v6 = v5;
    CFStringRef v7 = self;
    uint64_t v8 = 4;
  }
  else if (self->_reportIncidentButton == v4)
  {
    id v9 = v4;
    v5 = [(CarETAExpandedSign *)self delegate];
    id v6 = v5;
    CFStringRef v7 = self;
    uint64_t v8 = 5;
  }
  else if (self->_shareTripButton == v4)
  {
    id v9 = v4;
    v5 = [(CarETAExpandedSign *)self delegate];
    id v6 = v5;
    CFStringRef v7 = self;
    uint64_t v8 = 6;
  }
  else
  {
    if (self->_endButton != v4) {
      goto LABEL_12;
    }
    id v9 = v4;
    v5 = [(CarETAExpandedSign *)self delegate];
    id v6 = v5;
    CFStringRef v7 = self;
    uint64_t v8 = 1;
  }
  [v5 etaCardSign:v7 didSelectAction:v8];

  unsigned int v4 = v9;
LABEL_12:
}

- (NSArray)focusOrderSubItems
{
  v3 = +[NSMutableArray arrayWithObject:self->_expandButton];
  unsigned int v4 = [(CarETAExpandedSign *)self stackedButtons];
  [v3 addObjectsFromArray:v4];

  id v5 = [v3 copy];

  return (NSArray *)v5;
}

- (NSArray)preferredFocusEnvironments
{
  stopsButton = self->_stopsButton;
  v2 = +[NSArray arrayWithObjects:&stopsButton count:1];

  return (NSArray *)v2;
}

- (void)setLatestETA:(id)a3
{
  id v5 = (GuidanceETA *)a3;
  if (self->_latestETA != v5)
  {
    CFStringRef v7 = v5;
    objc_storeStrong((id *)&self->_latestETA, a3);
    if (v7) {
      [(GuidanceETA *)v7 arrivalTimeExpandedStringIncludingAMPMSymbols:0];
    }
    else {
    id v6 = +[GuidanceETA invalidValueString];
    }
    [(UILabel *)self->_etaLabel setText:v6];

    id v5 = v7;
  }
}

- (void)incidentsReportingEnablementDidUpdate
{
  v3 = +[TrafficIncidentLayoutManager sharedInstance];
  unsigned __int8 v4 = [v3 isIncidentReportingEnabled];

  if ((v4 & 1) == 0)
  {
    reportIncidentButton = self->_reportIncidentButton;
    self->_reportIncidentButton = 0;
  }
  [(CarETAExpandedSign *)self _rebuildButtons];

  [(CarETAExpandedSign *)self _updateContent];
}

- (void)suggestionsDataSourceDidUpdateContactsForDisplay:(id)a3
{
  [(CarFocusableButton *)self->_shareTripButton setEnabled:[(CarETAExpandedSign *)self _shouldEnableShareTripButton]];

  [(CarETAExpandedSign *)self _updateSharingButtonDisabledTitle];
}

- (BOOL)_shouldEnableShareTripButton
{
  if (GEOConfigGetBOOL()) {
    return 1;
  }
  unsigned __int8 v4 = [(SharedTripSuggestionsDataSource *)self->_suggestionDataSource contactsForDisplay];
  BOOL v3 = [v4 count] != 0;

  return v3;
}

- (GuidanceETA)latestETA
{
  return self->_latestETA;
}

- (CarETACardSignDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarETACardSignDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setShareTripButton:(id)a3
{
}

- (void)setReportIncidentButton:(id)a3
{
}

- (CarETAExpandedSignDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (CarETAExpandedSignDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_reportIncidentButton, 0);
  objc_storeStrong((id *)&self->_shareTripButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_latestETA, 0);
  objc_storeStrong((id *)&self->_suggestionDataSource, 0);
  objc_storeStrong((id *)&self->_endButton, 0);
  objc_storeStrong((id *)&self->_stopsButton, 0);
  objc_storeStrong((id *)&self->_buttonsStackView, 0);
  objc_storeStrong((id *)&self->_expandButton, 0);

  objc_storeStrong((id *)&self->_etaLabel, 0);
}

@end