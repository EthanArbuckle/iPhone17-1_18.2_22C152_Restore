@interface MapsCustomRouteCardView
- (GEOComposedRoute)route;
- (MapsCustomRouteCardView)initWithCoder:(id)a3;
- (MapsCustomRouteCardView)initWithFrame:(CGRect)a3;
- (MapsCustomRouteCardViewDelegate)delegate;
- (void)_commonInit;
- (void)_pressedNav;
- (void)_pressedOfflineDownloadButton;
- (void)_pressedRoutePlanning;
- (void)_pressedSaveToLibrary;
- (void)_pressedStepping;
- (void)_unitsDidChange;
- (void)_updateDirectionsButtonWithSuggestedMode:(unint64_t)a3;
- (void)_updateDisclaimerLabel;
- (void)_updateGraphView;
- (void)_updateOfflineButtonIfNecessary;
- (void)_updateOfflineSubscription;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setButtonEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setRoute:(id)a3;
- (void)updateButtons;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation MapsCustomRouteCardView

- (MapsCustomRouteCardView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MapsCustomRouteCardView;
  v3 = [(MapsCustomRouteCardView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(MapsCustomRouteCardView *)v3 _commonInit];
  }
  return v4;
}

- (MapsCustomRouteCardView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MapsCustomRouteCardView;
  v3 = -[MapsCustomRouteCardView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MapsCustomRouteCardView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v3 = +[NSLocale currentLocale];
  self->_isMetric = [v3 _navigation_distanceUsesMetricSystem];

  v4 = +[NSNotificationCenter defaultCenter];
  v5 = MNLocaleDidChangeNotification();
  [v4 addObserver:self selector:"_unitsDidChange" name:v5 object:0];

  id v6 = objc_alloc((Class)NSMeasurement);
  v7 = +[NSUnitLength meters];
  v8 = (NSMeasurement *)[v6 initWithDoubleValue:v7 unit:0.0];
  zeroMeters = self->_zeroMeters;
  self->_zeroMeters = v8;

  v10 = (UIView *)objc_opt_new();
  summaryContainer = self->_summaryContainer;
  self->_summaryContainer = v10;

  [(UIView *)self->_summaryContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = +[UIColor colorWithDynamicProvider:&stru_101316E68];
  [(UIView *)self->_summaryContainer setBackgroundColor:v12];

  [(UIView *)self->_summaryContainer _setContinuousCornerRadius:12.0];
  v13 = (UILabel *)objc_opt_new();
  distanceLabel = self->_distanceLabel;
  self->_distanceLabel = v13;

  [(UILabel *)self->_distanceLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v15 = (MapsThemeMultiPartLabel *)objc_opt_new();
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v15;

  [(MapsThemeMultiPartLabel *)self->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsThemeMultiPartLabel *)self->_descriptionLabel setNumberOfLines:1];
  v17 = (UITextView *)objc_opt_new();
  disclaimerLabel = self->_disclaimerLabel;
  self->_disclaimerLabel = v17;

  [(UITextView *)self->_disclaimerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextView *)self->_disclaimerLabel setEditable:0];
  [(UITextView *)self->_disclaimerLabel setScrollEnabled:0];
  v19 = +[UIColor clearColor];
  [(UITextView *)self->_disclaimerLabel setBackgroundColor:v19];

  v20 = [[MultilineStackView alloc] initWithHorizontalArrangement:3 verticalArrangement:0];
  buttonStackView = self->_buttonStackView;
  self->_buttonStackView = v20;

  [(MultilineStackView *)self->_buttonStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  double v22 = kMUPlaceHorizontalStackSpacing;
  [(MultilineStackView *)self->_buttonStackView setInterItemHorizontalPadding:kMUPlaceHorizontalStackSpacing];
  [(MultilineStackView *)self->_buttonStackView setInterItemVerticalPadding:v22];
  LODWORD(v23) = 1148846080;
  [(MultilineStackView *)self->_buttonStackView setContentHuggingPriority:1 forAxis:v23];
  LODWORD(v24) = 1148846080;
  [(MultilineStackView *)self->_buttonStackView setContentCompressionResistancePriority:1 forAxis:v24];
  [(MultilineStackView *)self->_buttonStackView setAccessibilityIdentifier:@"ButtonStackView"];
  [(MultilineStackView *)self->_buttonStackView setRowHeightBlock:&stru_101316E88];
  v25 = [(GEOComposedRoute *)self->_route origin];
  if ([v25 isCurrentLocation])
  {
    v26 = +[GEOCountryConfiguration sharedConfiguration];
    unsigned int v27 = [v26 currentCountrySupportsNavigation];
    uint64_t v28 = 1;
    if (!v27) {
      uint64_t v28 = 2;
    }
    uint64_t v86 = v28;
  }
  else
  {
    uint64_t v86 = 2;
  }

  v29 = +[UIButtonConfiguration _maps_primaryCardFooterActionButtonConfiguration];
  v30 = +[UIButton buttonWithConfiguration:v29 primaryAction:0];
  directionsButton = self->_directionsButton;
  self->_directionsButton = v30;

  [(UIButton *)self->_directionsButton setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v32) = 1148846080;
  [(UIButton *)self->_directionsButton setContentCompressionResistancePriority:1 forAxis:v32];
  [(UIButton *)self->_directionsButton setAccessibilityIdentifier:@"DirectionsButton"];
  v33 = +[UIButtonConfiguration _maps_secondaryCardFooterActionButtonConfiguration];
  v34 = +[UIButton buttonWithConfiguration:v33 primaryAction:0];
  saveToLibraryButton = self->_saveToLibraryButton;
  self->_saveToLibraryButton = v34;

  [(UIButton *)self->_saveToLibraryButton addTarget:self action:"_pressedSaveToLibrary" forControlEvents:64];
  [(MapsCustomRouteCardView *)self _updateDirectionsButtonWithSuggestedMode:v86];
  [(UIView *)self->_summaryContainer addSubview:self->_distanceLabel];
  [(UIView *)self->_summaryContainer addSubview:self->_descriptionLabel];
  [(UIView *)self->_summaryContainer addSubview:self->_disclaimerLabel];
  [(MapsCustomRouteCardView *)self addSubview:self->_summaryContainer];
  [(MapsCustomRouteCardView *)self addSubview:self->_buttonStackView];
  v87 = [(UIView *)self->_summaryContainer topAnchor];
  v85 = [(MapsCustomRouteCardView *)self topAnchor];
  v84 = [v87 constraintEqualToAnchor:v85];
  v88[0] = v84;
  v83 = [(UIView *)self->_summaryContainer leadingAnchor];
  v82 = [(MapsCustomRouteCardView *)self leadingAnchor];
  v81 = [v83 constraintEqualToAnchor:v82 constant:16.0];
  v88[1] = v81;
  v80 = [(UIView *)self->_summaryContainer trailingAnchor];
  v79 = [(MapsCustomRouteCardView *)self trailingAnchor];
  v78 = [v80 constraintEqualToAnchor:v79 constant:-16.0];
  v88[2] = v78;
  v77 = [(UILabel *)self->_distanceLabel leadingAnchor];
  v76 = [(UIView *)self->_summaryContainer leadingAnchor];
  v75 = [v77 constraintEqualToAnchor:v76 constant:14.0];
  v88[3] = v75;
  v74 = [(UILabel *)self->_distanceLabel trailingAnchor];
  v73 = [(UIView *)self->_summaryContainer trailingAnchor];
  v72 = [v74 constraintEqualToAnchor:v73 constant:-14.0];
  v88[4] = v72;
  v71 = [(UILabel *)self->_distanceLabel topAnchor];
  v70 = [(UIView *)self->_summaryContainer topAnchor];
  v69 = [v71 constraintEqualToAnchor:v70 constant:12.0];
  v88[5] = v69;
  v68 = [(MapsThemeMultiPartLabel *)self->_descriptionLabel leadingAnchor];
  v67 = [(UILabel *)self->_distanceLabel leadingAnchor];
  v66 = [v68 constraintEqualToAnchor:v67];
  v88[6] = v66;
  v65 = [(MapsThemeMultiPartLabel *)self->_descriptionLabel trailingAnchor];
  v64 = [(UILabel *)self->_distanceLabel trailingAnchor];
  v63 = [v65 constraintEqualToAnchor:v64];
  v88[7] = v63;
  v62 = [(MapsThemeMultiPartLabel *)self->_descriptionLabel topAnchor];
  v61 = [(UILabel *)self->_distanceLabel bottomAnchor];
  v60 = [v62 constraintEqualToAnchor:v61 constant:-7.0];
  v88[8] = v60;
  v59 = [(UITextView *)self->_disclaimerLabel leadingAnchor];
  v58 = [(UIView *)self->_summaryContainer leadingAnchor];
  v57 = [v59 constraintEqualToAnchor:v58 constant:8.0];
  v88[9] = v57;
  v56 = [(UITextView *)self->_disclaimerLabel trailingAnchor];
  v55 = [(UIView *)self->_summaryContainer trailingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55 constant:-10.0];
  v88[10] = v54;
  v53 = [(MultilineStackView *)self->_buttonStackView leadingAnchor];
  v52 = [(MapsCustomRouteCardView *)self leadingAnchor];
  v51 = [v53 constraintEqualToAnchor:v52 constant:16.0];
  v88[11] = v51;
  v50 = [(MultilineStackView *)self->_buttonStackView trailingAnchor];
  v36 = [(MapsCustomRouteCardView *)self trailingAnchor];
  v37 = [v50 constraintEqualToAnchor:v36 constant:-16.0];
  v88[12] = v37;
  v38 = [(MultilineStackView *)self->_buttonStackView topAnchor];
  v39 = [(UIView *)self->_summaryContainer bottomAnchor];
  v40 = [v38 constraintEqualToAnchor:v39 constant:16.0];
  v88[13] = v40;
  v41 = [(MultilineStackView *)self->_buttonStackView bottomAnchor];
  v42 = [(MapsCustomRouteCardView *)self bottomAnchor];
  v43 = [v41 constraintEqualToAnchor:v42];
  v88[14] = v43;
  v44 = +[NSArray arrayWithObjects:v88 count:15];
  +[NSLayoutConstraint activateConstraints:v44];

  v45 = [(UITextView *)self->_disclaimerLabel bottomAnchor];
  v46 = [(UIView *)self->_summaryContainer bottomAnchor];
  v47 = [v45 constraintEqualToAnchor:v46];
  disclaimerLabelBottomConstraint = self->_disclaimerLabelBottomConstraint;
  self->_disclaimerLabelBottomConstraint = v47;

  v49 = +[NSNotificationCenter defaultCenter];
  [v49 addObserver:self selector:"_updateOfflineSubscription" name:@"OfflineMapsSubscriptionsDidChangeNotification" object:0];

  _GEOConfigAddDelegateListenerForKey();
}

- (void)dealloc
{
  if (self->_offlineSubscription)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = [&off_1013AE5F8 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        id v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(&off_1013AE5F8);
          }
          [(MapDataSubscriptionInfo *)self->_offlineSubscription addObserver:self forKeyPath:*(void *)(*((void *)&v8 + 1) + 8 * (void)v6) options:0 context:off_1015F3ED0];
          id v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [&off_1013AE5F8 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
  GEOConfigRemoveDelegateListenerForAllKeys();
  v7.receiver = self;
  v7.super_class = (Class)MapsCustomRouteCardView;
  [(MapsCustomRouteCardView *)&v7 dealloc];
}

- (void)_pressedNav
{
  id v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "pressed go", v5, 2u);
  }

  id v4 = [(MapsCustomRouteCardView *)self delegate];
  [v4 pressedNavigation];
}

- (void)_pressedStepping
{
  id v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "pressed stepping", v5, 2u);
  }

  id v4 = [(MapsCustomRouteCardView *)self delegate];
  [v4 pressedStepping];
}

- (void)_pressedRoutePlanning
{
  id v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "pressed route planning", buf, 2u);
  }

  [(UIButton *)self->_directionsButton setEnabled:0];
  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100AD91A4;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  uint64_t v5 = [(MapsCustomRouteCardView *)self delegate];
  [v5 pressedRoutePlanning];
}

- (void)_pressedSaveToLibrary
{
  id v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "pressed save to library", v5, 2u);
  }

  dispatch_time_t v4 = [(MapsCustomRouteCardView *)self delegate];
  [v4 pressedSaveToLibrary];
}

- (void)_unitsDidChange
{
  id v3 = +[NSLocale currentLocale];
  self->_isMetric = [v3 _navigation_distanceUsesMetricSystem];

  [(MapsCustomRouteCardView *)self _updateGraphView];
}

- (void)_updateGraphView
{
  id v3 = [(UIViewController *)self->_graphViewController view];
  [v3 removeFromSuperview];

  graphViewController = self->_graphViewController;
  self->_graphViewController = 0;

  [(MapsCustomRouteCardView *)self frame];
  double v5 = CGRectGetWidth(v53) + -32.0;
  if (v5 >= 2.22044605e-16)
  {
    id v6 = +[NSNumber numberWithDouble:v5];
    renderedGraphWidth = self->_renderedGraphWidth;
    self->_renderedGraphWidth = v6;

    long long v8 = +[MapsElevationChartStyle navigationLineStyle];
    long long v9 = [(GEOComposedRoute *)self->_route elevationProfile];
    BOOL isMetric = self->_isMetric;
    long long v11 = [(MapsCustomRouteCardView *)self traitCollection];
    v12 = +[MapsElevationGraphViewController makeHostingControllerFor:v9 width:isMetric isMetric:v11 traitCollection:0 shouldHighlight:v8 chartStyle:self->_zeroMeters currentPosition:v5];
    v13 = self->_graphViewController;
    self->_graphViewController = v12;

    v14 = self->_graphViewController;
    if (v14)
    {
      v43 = v8;
      v15 = [(UIViewController *)v14 view];
      [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v15 setUserInteractionEnabled:0];
      v16 = +[UIColor clearColor];
      [v15 setBackgroundColor:v16];

      [(UIView *)self->_summaryContainer addSubview:v15];
      v17 = [(GEOComposedRoute *)self->_route elevationProfile];
      unsigned int v38 = [v17 isValid];

      v18 = [(GEOComposedRoute *)self->_route elevationProfile];
      double v19 = 0.0;
      if ([v18 isValid]) {
        double v20 = 82.0;
      }
      else {
        double v20 = 0.0;
      }

      v21 = [(GEOComposedRoute *)self->_route elevationProfile];
      if ([v21 isValid]) {
        double v19 = 10.0;
      }

      v42 = [v15 leadingAnchor];
      v41 = [(UIView *)self->_summaryContainer leadingAnchor];
      v40 = [v42 constraintEqualToAnchor:v41];
      v46[0] = v40;
      v39 = [v15 trailingAnchor];
      double v22 = [(UIView *)self->_summaryContainer trailingAnchor];
      double v23 = [v39 constraintEqualToAnchor:v22];
      v46[1] = v23;
      double v24 = [v15 heightAnchor];
      v25 = [v24 constraintEqualToConstant:v20];
      v46[2] = v25;
      v26 = [v15 topAnchor];
      unsigned int v27 = [(MapsThemeMultiPartLabel *)self->_descriptionLabel bottomAnchor];
      uint64_t v28 = [v26 constraintEqualToAnchor:v27 constant:v19];
      v46[3] = v28;
      v29 = +[NSArray arrayWithObjects:v46 count:4];
      +[NSLayoutConstraint activateConstraints:v29];

      if ([(GEOComposedRoute *)self->_route source] == (id)2)
      {
        v30 = [v15 bottomAnchor];
        v31 = [(UITextView *)self->_disclaimerLabel topAnchor];
        double v32 = [v30 constraintEqualToAnchor:v31];
        v44 = v32;
        v33 = &v44;
      }
      else
      {
        if (v38) {
          double v36 = -8.0;
        }
        else {
          double v36 = -3.0;
        }
        v30 = [v15 bottomAnchor];
        v31 = [(UIView *)self->_summaryContainer bottomAnchor];
        double v32 = [v30 constraintEqualToAnchor:v31 constant:v36];
        v45 = v32;
        v33 = &v45;
      }
      v37 = +[NSArray arrayWithObjects:v33 count:1];
      +[NSLayoutConstraint activateConstraints:v37];

      long long v8 = v43;
    }
    else
    {
      v34 = sub_1005762E4();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v48 = "-[MapsCustomRouteCardView _updateGraphView]";
        __int16 v49 = 2080;
        v50 = "MapsCustomRouteCardView.m";
        __int16 v51 = 1024;
        int v52 = 288;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
      }

      if (!sub_100BB36BC()) {
        goto LABEL_21;
      }
      v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v35 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v48 = v35;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }

LABEL_21:
  }
}

- (void)_updateDisclaimerLabel
{
  id v3 = [(GEOComposedRoute *)self->_route source];
  disclaimerLabelBottomConstraint = self->_disclaimerLabelBottomConstraint;
  if (v3 == (id)2)
  {
    [(NSLayoutConstraint *)disclaimerLabelBottomConstraint setActive:1];
    [(UITextView *)self->_disclaimerLabel setAlpha:1.0];
    double v5 = [(GEOComposedRoute *)self->_route disclaimerText];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      long long v9 = +[NSBundle mainBundle];
      id v7 = [v9 localizedStringForKey:@"[Curated route viewing] Safety disclaimer text" value:@"localized string not found" table:0];
    }
    long long v10 = [(GEOComposedRoute *)self->_route disclaimerURL];
    long long v11 = [v10 displayTitle];
    v12 = [v11 stringValue];
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      v15 = +[NSBundle mainBundle];
      id v14 = [v15 localizedStringForKey:@"[Curated route viewing] Learn more tappable link" value:@"localized string not found" table:0];
    }
    v16 = +[NSBundle mainBundle];
    v17 = [v16 localizedStringForKey:@"[Curated route viewing] Safety disclaimer concatination" value:@"localized string not found" table:0];
    double v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v7, v14);

    v18 = v7;
    v39[0] = NSFontAttributeName;
    double v19 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleFootnote weight:UIFontWeightMedium];
    v40[0] = v19;
    v39[1] = NSForegroundColorAttributeName;
    double v20 = +[UIColor secondaryLabelColor];
    v40[1] = v20;
    v21 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];

    double v22 = [(GEOComposedRoute *)self->_route storageID];

    id v23 = objc_alloc((Class)NSMutableAttributedString);
    if (v22)
    {
      id v24 = [v23 initWithString:v7 attributes:v21];
    }
    else
    {
      id v24 = [v23 initWithString:v36 attributes:v21];
      id v25 = [v36 rangeOfString:v14];
      uint64_t v34 = v26;
      id v35 = v25;
      v37[0] = NSForegroundColorAttributeName;
      unsigned int v27 = +[UIColor systemBlueColor];
      v38[0] = v27;
      v37[1] = NSFontAttributeName;
      uint64_t v28 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleFootnote weight:UIFontWeightSemibold];
      v38[1] = v28;
      v37[2] = NSLinkAttributeName;
      v29 = [(GEOComposedRoute *)self->_route disclaimerURL];
      uint64_t v30 = [v29 url];
      v31 = (void *)v30;
      CFStringRef v32 = @"https://nps.gov";
      if (v30) {
        CFStringRef v32 = (const __CFString *)v30;
      }
      v38[2] = v32;
      v33 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];

      [v24 setAttributes:v33 range:v35];
    }
    [(UITextView *)self->_disclaimerLabel setAttributedText:v24];
  }
  else
  {
    [(NSLayoutConstraint *)disclaimerLabelBottomConstraint setActive:0];
    disclaimerLabel = self->_disclaimerLabel;
    [(UITextView *)disclaimerLabel setAlpha:0.0];
  }
}

- (void)_updateDirectionsButtonWithSuggestedMode:(unint64_t)a3
{
  double v5 = +[UIButtonConfiguration _maps_primaryCardFooterActionButtonConfiguration];
  if (!a3)
  {
LABEL_12:
    unsigned int v27 = sub_10057683C();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_INFO)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    uint64_t v28 = "Hiding stepping button because it is not supported";
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, v28, buf, 2u);
    goto LABEL_20;
  }
  if (a3 != 1)
  {
    if (a3 == 4)
    {
      if (GEOConfigGetBOOL())
      {
        directionsButton = self->_directionsButton;
        id v7 = +[NSBundle mainBundle];
        long long v8 = [v7 localizedStringForKey:@"[Route Creation] Directions" value:@"localized string not found" table:0];
        [(UIButton *)directionsButton setTitle:v8 forState:0];

        [(UIButton *)self->_directionsButton removeTarget:self action:0 forControlEvents:64];
        long long v9 = self->_directionsButton;
        long long v10 = "_pressedRoutePlanning";
LABEL_11:
        [(UIButton *)v9 addTarget:self action:v10 forControlEvents:64];
        [(MultilineStackView *)self->_buttonStackView addArrangedSubview:self->_directionsButton];
        goto LABEL_21;
      }
      unsigned int v27 = sub_10057683C();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v28 = "Hiding route planning button because it is not supported";
        goto LABEL_19;
      }
LABEL_20:

      [(MultilineStackView *)self->_buttonStackView removeArrangedSubview:self->_directionsButton];
      goto LABEL_21;
    }
    if (GEOConfigGetBOOL())
    {
      id v24 = self->_directionsButton;
      id v25 = +[NSBundle mainBundle];
      uint64_t v26 = [v25 localizedStringForKey:@"[Route Creation] Directions" value:@"localized string not found" table:0];
      [(UIButton *)v24 setTitle:v26 forState:0];

      [(UIButton *)self->_directionsButton removeTarget:self action:0 forControlEvents:64];
      long long v9 = self->_directionsButton;
      long long v10 = "_pressedStepping";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  long long v11 = +[GEOPlatform sharedPlatform];
  if (![v11 supportsNavigation])
  {

    goto LABEL_15;
  }
  char BOOL = GEOConfigGetBOOL();

  if ((BOOL & 1) == 0)
  {
LABEL_15:
    unsigned int v27 = sub_10057683C();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_INFO)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    uint64_t v28 = "Hiding GO button because it is not supported";
    goto LABEL_19;
  }
  v13 = +[UIColor systemGreenColor];
  id v14 = [v5 background];
  [v14 setBackgroundColor:v13];

  v15 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleTitle3 weight:UIFontWeightBold];
  v16 = +[UIFont _maps_cappedFont:v15 withMaxPoint:34.0];

  v17 = [v16 fontDescriptor];
  v18 = [v17 fontDescriptorWithDesign:UIFontDescriptorSystemDesignRounded];
  double v19 = +[UIFont fontWithDescriptor:v18 size:0.0];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100ADA114;
  v29[3] = &unk_1012E90F0;
  id v30 = v19;
  id v20 = v19;
  [v5 setTitleTextAttributesTransformer:v29];
  v21 = self->_directionsButton;
  double v22 = +[NSBundle mainBundle];
  id v23 = [v22 localizedStringForKey:@"[Route Creation] GO" value:@"localized string not found" table:0];
  [(UIButton *)v21 setTitle:v23 forState:0];

  [(UIButton *)self->_directionsButton removeTarget:self action:0 forControlEvents:64];
  [(UIButton *)self->_directionsButton addTarget:self action:"_pressedNav" forControlEvents:64];
  [(MultilineStackView *)self->_buttonStackView addArrangedSubview:self->_directionsButton];

LABEL_21:
  [(UIButton *)self->_directionsButton setConfiguration:v5];
  [(MultilineStackView *)self->_buttonStackView invalidateLayout];
}

- (void)updateButtons
{
  id v3 = +[NSMutableArray array];
  if (self->_route)
  {
    objc_initWeak(&location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100ADA550;
    v18[3] = &unk_1012E6690;
    objc_copyWeak(&v20, &location);
    id v4 = v3;
    id v19 = v4;
    double v5 = objc_retainBlock(v18);
    char BOOL = GEOConfigGetBOOL();
    route = self->_route;
    if (BOOL)
    {
      long long v8 = [(GEOComposedRoute *)route storageID];
      BOOL v9 = v8 == 0;

      if (v9)
      {
        ((void (*)(void *))v5[2])(v5);
      }
      else
      {
        unint64_t v10 = self->_offlineDownloadButtonMode - 2;
        if (v10 <= 2) {
          [v4 addObject:*(Class *)((char *)&self->super.super.super.isa + *off_101316EC8[v10])];
        }
      }
      [v4 addObject:self->_directionsButton];
      [(MultilineStackView *)self->_buttonStackView setArrangedSubviews:v4];
      v17 = sub_10057683C();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = (const char *)v4;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Setting buttons list to %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v15 = [(GEOComposedRoute *)route storageID];
      BOOL v16 = v15 == 0;

      if (v16)
      {
        ((void (*)(void *))v5[2])(v5);
        [(MultilineStackView *)self->_buttonStackView setArrangedSubviews:v4];
      }
      else
      {
        [(MultilineStackView *)self->_buttonStackView setArrangedSubviews:&__NSArray0__struct];
      }
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    long long v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = +[NSString stringWithFormat:@"A route is required before we can show buttons in MapsCustomRouteCardView."];
      *(_DWORD *)buf = 136316162;
      id v23 = "-[MapsCustomRouteCardView updateButtons]";
      __int16 v24 = 2080;
      id v25 = "MapsCustomRouteCardView.m";
      __int16 v26 = 1024;
      int v27 = 426;
      __int16 v28 = 2080;
      v29 = "_route != nil";
      __int16 v30 = 2112;
      v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
    }
    if (sub_100BB36BC())
    {
      v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        id v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    [(MultilineStackView *)self->_buttonStackView setArrangedSubviews:&__NSArray0__struct];
  }
}

- (void)setButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = sub_10057683C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Setting buttons enabled %d", (uint8_t *)v6, 8u);
  }

  [(UIButton *)self->_saveToLibraryButton setEnabled:v3];
  [(UIButton *)self->_directionsButton setEnabled:v3];
}

- (void)setRoute:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_route, a3);
  [v5 distance];
  v33[0] = NSFontAttributeName;
  id v6 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleTitle2 weight:UIFontWeightSemibold];
  v34[0] = v6;
  v33[1] = NSForegroundColorAttributeName;
  id v7 = +[UIColor labelColor];
  v34[1] = v7;
  long long v8 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
  BOOL v9 = sub_100A45784(v8);
  [(UILabel *)self->_distanceLabel setAttributedText:v9];

  unint64_t v10 = [v5 previewDurationString];
  [v5 travelAndChargingDuration];
  double v12 = v11;
  v13 = [v5 elevationProfile];
  v31[0] = NSFontAttributeName;
  id v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  v31[1] = NSForegroundColorAttributeName;
  v32[0] = v14;
  v15 = +[UIColor secondaryLabelColor];
  v32[1] = v15;
  BOOL v16 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
  v17 = sub_100A45808(v10, v13, v16, v12);
  [(MapsThemeMultiPartLabel *)self->_descriptionLabel setMultiPartString:v17];

  [(MapsCustomRouteCardView *)self _updateGraphView];
  [(MapsCustomRouteCardView *)self _updateDisclaimerLabel];
  objc_initWeak(&location, self);
  __int16 v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  __int16 v26 = sub_100ADAA88;
  int v27 = &unk_101316780;
  objc_copyWeak(&v29, &location);
  id v18 = v5;
  id v28 = v18;
  id v19 = objc_retainBlock(&v24);
  id v20 = +[MKLocationManager sharedLocationManager];
  v21 = [v20 lastLocation];
  ((void (*)(void ***, void *, void))v19[2])(v19, v21, 0);

  double v22 = +[MKLocationManager sharedLocationManager];
  id v23 = [v22 singleLocationUpdateWithHandler:v19];

  [v23 start];
  [(MapsCustomRouteCardView *)self _updateOfflineSubscription];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)MapsCustomRouteCardView;
  [(MapsCustomRouteCardView *)&v10 layoutSubviews];
  renderedGraphWidth = self->_renderedGraphWidth;
  if (!renderedGraphWidth
    || ([(NSNumber *)renderedGraphWidth cgFloatValue],
        double v5 = v4,
        [(MapsCustomRouteCardView *)self frame],
        vabdd_f64(v5, CGRectGetWidth(v11)) >= 1.0))
  {
    [(MapsCustomRouteCardView *)self _updateGraphView];
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)p_delegate);
      [v9 didUpdateLayout];
    }
  }
}

- (void)_updateOfflineSubscription
{
  route = self->_route;
  if (route)
  {
    double v4 = [(GEOComposedRoute *)route boundingMapRegion];
    double v5 = +[GEOMapRegion _maps_offlineCoverageRegionForRouteBounds:v4];

    id v6 = +[MapsOfflineUIHelper sharedHelper];
    id v7 = [v6 subscriptionInfoForRegion:v5];
  }
  else
  {
    id v7 = 0;
  }
  p_offlineSubscription = &self->_offlineSubscription;
  offlineSubscription = self->_offlineSubscription;
  if (v7 != offlineSubscription)
  {
    if (offlineSubscription)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v10 = [&off_1013AE610 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v23;
        do
        {
          v13 = 0;
          do
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(&off_1013AE610);
            }
            [(MapDataSubscriptionInfo *)*p_offlineSubscription removeObserver:self forKeyPath:*(void *)(*((void *)&v22 + 1) + 8 * (void)v13) context:off_1015F3ED0];
            v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v11 = [&off_1013AE610 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v11);
      }
    }
    objc_storeStrong((id *)&self->_offlineSubscription, v7);
    if (*p_offlineSubscription)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v14 = [&off_1013AE628 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v19;
        do
        {
          v17 = 0;
          do
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(&off_1013AE628);
            }
            [(MapDataSubscriptionInfo *)*p_offlineSubscription addObserver:self forKeyPath:*(void *)(*((void *)&v18 + 1) + 8 * (void)v17) options:0 context:off_1015F3ED0];
            v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          id v15 = [&off_1013AE628 countByEnumeratingWithState:&v18 objects:v26 count:16];
        }
        while (v15);
      }
    }
  }
  [(MapsCustomRouteCardView *)self _updateOfflineButtonIfNecessary];
}

- (void)_updateOfflineButtonIfNecessary
{
  BOOL v3 = self->_offlineSubscription;
  if (!GEOSupportsOfflineMaps()) {
    goto LABEL_4;
  }
  if (v3)
  {
    double v4 = [(MapDataSubscriptionInfo *)v3 state];
    id v5 = [v4 loadState];

    if (v5)
    {
LABEL_4:
      int64_t v6 = 1;
      goto LABEL_11;
    }
    id v7 = [(MapDataSubscriptionInfo *)v3 state];
    id v8 = [v7 downloadState];

    int64_t v6 = 2;
    switch((unint64_t)v8)
    {
      case 0uLL:
        break;
      case 1uLL:
      case 5uLL:
        int64_t v6 = 3;
        break;
      case 2uLL:
        id v9 = [(MapDataSubscriptionInfo *)v3 state];
        id v10 = [v9 downloadProgress];
        unsigned int v11 = [v10 isIndeterminate];

        if (v11) {
          int64_t v6 = 3;
        }
        else {
          int64_t v6 = 4;
        }
        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
    int64_t v6 = 2;
  }
LABEL_11:

  if (v6 == self->_offlineDownloadButtonMode) {
    goto LABEL_26;
  }
  self->_int64_t offlineDownloadButtonMode = v6;
  if ((unint64_t)(v6 - 2) >= 2)
  {
    if (v6 == 4)
    {
      offlineDownloadButton = self->_offlineDownloadButton;
      self->_offlineDownloadButton = 0;

      if (!self->_offlineDownloadProgressButton)
      {
        __int16 v26 = +[UIButtonConfiguration _maps_secondaryCardFooterActionButtonConfiguration];
        [v26 setTitleTextAttributesTransformer:&stru_101316EA8];
        [v26 contentInsets];
        [v26 setContentInsets:v27 + -4.0];
        objc_initWeak(&location, self);
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        void v40[2] = sub_100ADB4D8;
        v40[3] = &unk_1012E8CD0;
        objc_copyWeak(&v41, &location);
        id v28 = +[UIAction actionWithHandler:v40];
        id v29 = +[MapsProgressButton buttonWithConfiguration:v26 primaryAction:v28];
        offlineDownloadProgressButton = self->_offlineDownloadProgressButton;
        self->_offlineDownloadProgressButton = v29;

        [(MapsProgressButton *)self->_offlineDownloadProgressButton setProgressStyle:1];
        [(MapsProgressButton *)self->_offlineDownloadProgressButton setFillStyle:2];
        [(MapsProgressButton *)self->_offlineDownloadProgressButton setAccessibilityIdentifier:@"OfflineDownloadButton"];
        objc_destroyWeak(&v41);
        objc_destroyWeak(&location);
      }
    }
    else if (v6 == 1)
    {
      uint64_t v12 = self->_offlineDownloadButton;
      self->_offlineDownloadButton = 0;

      v13 = self->_offlineDownloadProgressButton;
      self->_offlineDownloadProgressButton = 0;
    }
    goto LABEL_25;
  }
  id v14 = self->_offlineDownloadProgressButton;
  self->_offlineDownloadProgressButton = 0;

  if (!self->_offlineDownloadButton)
  {
    objc_initWeak(&location, self);
    id v15 = +[UIButtonConfiguration _maps_secondaryCardFooterActionButtonConfiguration];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100ADB3E8;
    v42[3] = &unk_1012E8CD0;
    objc_copyWeak(&v43, &location);
    uint64_t v16 = +[UIAction actionWithHandler:v42];
    v17 = +[UIButton buttonWithConfiguration:v15 primaryAction:v16];
    long long v18 = self->_offlineDownloadButton;
    self->_offlineDownloadButton = v17;

    [(UIButton *)self->_offlineDownloadButton setAccessibilityIdentifier:@"OfflineDownloadButton"];
    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }
  int64_t offlineDownloadButtonMode = self->_offlineDownloadButtonMode;
  if (offlineDownloadButtonMode == 2)
  {
    v31 = self->_offlineDownloadButton;
    CFStringRef v32 = +[NSBundle mainBundle];
    v33 = [v32 localizedStringForKey:@"ROUTE_CREATION_OFFLINE_DOWNLOAD_MAP" value:@"localized string not found" table:@"Offline"];
    [(UIButton *)v31 setTitle:v33 forState:0];

    long long v23 = self->_offlineDownloadButton;
    uint64_t v24 = 1;
    goto LABEL_24;
  }
  if (offlineDownloadButtonMode == 3)
  {
    long long v20 = self->_offlineDownloadButton;
    long long v21 = +[NSBundle mainBundle];
    long long v22 = [v21 localizedStringForKey:@"ROUTE_CREATION_OFFLINE_DOWNLOAD_WAITING" value:@"localized string not found" table:@"Offline"];
    [(UIButton *)v20 setTitle:v22 forState:0];

    long long v23 = self->_offlineDownloadButton;
    uint64_t v24 = 0;
LABEL_24:
    [(UIButton *)v23 setEnabled:v24];
  }
LABEL_25:
  [(MapsCustomRouteCardView *)self updateButtons];
  int64_t v6 = self->_offlineDownloadButtonMode;
LABEL_26:
  if (v6 == 4)
  {
    uint64_t v34 = [(MapDataSubscriptionInfo *)self->_offlineSubscription state];
    id v35 = [v34 downloadProgress];

    [v35 fractionCompleted];
    -[MapsProgressButton setProgress:](self->_offlineDownloadProgressButton, "setProgress:");
    double v36 = [v35 byteCompletedCount];
    if (v36)
    {
      v37 = [v35 byteCompletedCount];
      id v38 = [v37 longLongValue];
    }
    else
    {
      id v38 = [v35 completedUnitCount];
    }

    v39 = +[MKRoundingByteCountFormatter stringFromByteCountWithRoundingTo1MB:v38];
    [(MapsProgressButton *)self->_offlineDownloadProgressButton setTitle:v39 forState:0];
  }
}

- (void)_pressedOfflineDownloadButton
{
  BOOL v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "pressed offline download button", v7, 2u);
  }

  offlineSubscription = self->_offlineSubscription;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v6 = WeakRetained;
  if (offlineSubscription) {
    [WeakRetained pressedOfflineDataManagement];
  }
  else {
    [WeakRetained pressedOfflineDownload];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1015F3ED0 == a6)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100ADB690;
    block[3] = &unk_1012E6708;
    objc_copyWeak(&v8, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MapsCustomRouteCardView;
    -[MapsCustomRouteCardView observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == MapsConfig_RouteCreationAvailable && a3.var1 == off_1015F1498) {
    [(MapsCustomRouteCardView *)self updateButtons];
  }
}

- (MapsCustomRouteCardViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MapsCustomRouteCardViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_offlineDownloadProgressButton, 0);
  objc_storeStrong((id *)&self->_offlineDownloadButton, 0);
  objc_storeStrong((id *)&self->_offlineSubscription, 0);
  objc_storeStrong((id *)&self->_saveToLibraryButton, 0);
  objc_storeStrong((id *)&self->_directionsButton, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_graphViewController, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_disclaimerLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_disclaimerLabel, 0);
  objc_storeStrong((id *)&self->_distanceLabel, 0);
  objc_storeStrong((id *)&self->_summaryContainer, 0);
  objc_storeStrong((id *)&self->_renderedGraphWidth, 0);
  objc_storeStrong((id *)&self->_route, 0);

  objc_storeStrong((id *)&self->_zeroMeters, 0);
}

@end