@interface RouteCreationCardView
- (GEOComposedRoute)route;
- (RouteCreationCardView)initWithCoder:(id)a3;
- (RouteCreationCardView)initWithFrame:(CGRect)a3;
- (RouteCreationEditingDelegate)editingDelegate;
- (UIButton)saveButton;
- (void)_commonInit;
- (void)_drawChart;
- (void)_pressedCloseLoop;
- (void)_pressedNav;
- (void)_pressedOutAndBack;
- (void)_pressedReverse;
- (void)_pressedRoutePlanning;
- (void)_pressedSave;
- (void)_pressedStepping;
- (void)_pressedUndo;
- (void)_unitsDidChange;
- (void)_updateButtons;
- (void)_updateDirectionsButtonWithSuggestedMode:(unint64_t)a3;
- (void)_updateGraphView;
- (void)layoutSubviews;
- (void)setEditingDelegate:(id)a3;
- (void)setRoute:(id)a3;
@end

@implementation RouteCreationCardView

- (RouteCreationCardView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RouteCreationCardView;
  v3 = [(RouteCreationCardView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(RouteCreationCardView *)v3 _commonInit];
  }
  return v4;
}

- (RouteCreationCardView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RouteCreationCardView;
  v3 = -[RouteCreationCardView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(RouteCreationCardView *)v3 _commonInit];
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

  v10 = +[UIFont systemFontOfSize:17.0 weight:UIFontWeightSemibold];
  uint64_t v11 = +[UIImageSymbolConfiguration configurationWithFont:v10];

  v12 = [RouteCreationIconButton alloc];
  v13 = +[UIImage systemImageNamed:@"arrow.up.arrow.down" withConfiguration:v11];
  v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"[Route Creation] Reverse Button" value:@"localized string not found" table:0];
  v16 = [(RouteCreationIconButton *)v12 initWithImage:v13 title:v15];

  [(RouteCreationIconButton *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(RouteCreationIconButton *)v16 setAccessibilityIdentifier:@"CreateARouteReverseButton"];
  [(RouteCreationIconButton *)v16 addTarget:self action:"_pressedReverse" forControlEvents:64];
  reverseButton = self->_reverseButton;
  self->_reverseButton = v16;
  v150 = v16;

  v18 = [RouteCreationIconButton alloc];
  v151 = (void *)v11;
  v19 = +[UIImage systemImageNamed:@"point.bottomleft.forward.to.arrowtriangle.uturn.scurvepath.fill" withConfiguration:v11];
  v20 = +[NSBundle mainBundle];
  v21 = [v20 localizedStringForKey:@"[Route Creation] Out-n-Back Button" value:@"localized string not found" table:0];
  v22 = [(RouteCreationIconButton *)v18 initWithImage:v19 title:v21];

  [(RouteCreationIconButton *)v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(RouteCreationIconButton *)v22 setAccessibilityIdentifier:@"CreateARouteOutBackButton"];
  [(RouteCreationIconButton *)v22 addTarget:self action:"_pressedOutAndBack" forControlEvents:64];
  outAndBackButton = self->_outAndBackButton;
  self->_outAndBackButton = v22;
  v149 = v22;

  v24 = [RouteCreationIconButton alloc];
  v25 = +[UIImage systemImageNamed:@"point.forward.to.point.capsulepath.fill" withConfiguration:v11];
  v26 = +[NSBundle mainBundle];
  v27 = [v26 localizedStringForKey:@"[Route Creation] Close Loop Button" value:@"localized string not found" table:0];
  v28 = [(RouteCreationIconButton *)v24 initWithImage:v25 title:v27];

  [(RouteCreationIconButton *)v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(RouteCreationIconButton *)v28 setAccessibilityIdentifier:@"CreateARouteCloseLoopButton"];
  [(RouteCreationIconButton *)v28 addTarget:self action:"_pressedCloseLoop" forControlEvents:64];
  closeLoopButton = self->_closeLoopButton;
  self->_closeLoopButton = v28;
  v147 = v28;

  v30 = objc_opt_new();
  [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v30 setClipsToBounds:1];
  v31 = (UIView *)objc_opt_new();
  cardContentView = self->_cardContentView;
  self->_cardContentView = v31;

  [(UIView *)self->_cardContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  v33 = +[UIColor colorWithDynamicProvider:&stru_1013166F8];
  [(UIView *)self->_cardContentView setBackgroundColor:v33];

  [(UIView *)self->_cardContentView _setContinuousCornerRadius:12.0];
  v34 = (UILabel *)objc_opt_new();
  distanceLabel = self->_distanceLabel;
  self->_distanceLabel = v34;

  [(UILabel *)self->_distanceLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v36) = 1148846080;
  [(UILabel *)self->_distanceLabel setContentHuggingPriority:1 forAxis:v36];
  v37 = (MapsThemeMultiPartLabel *)objc_opt_new();
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v37;

  [(MapsThemeMultiPartLabel *)self->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v39 = +[UIColor secondaryLabelColor];
  [(MapsThemeMultiPartLabel *)self->_descriptionLabel setTextColor:v39];

  [(MapsThemeMultiPartLabel *)self->_descriptionLabel setNumberOfLines:1];
  LODWORD(v40) = 1148846080;
  [(MapsThemeMultiPartLabel *)self->_descriptionLabel setContentHuggingPriority:1 forAxis:v40];
  v41 = [[MultilineStackView alloc] initWithHorizontalArrangement:3 verticalArrangement:0];
  buttonStackView = self->_buttonStackView;
  self->_buttonStackView = v41;

  [(MultilineStackView *)self->_buttonStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  double v43 = kMUPlaceHorizontalStackSpacing;
  [(MultilineStackView *)self->_buttonStackView setInterItemHorizontalPadding:kMUPlaceHorizontalStackSpacing];
  [(MultilineStackView *)self->_buttonStackView setInterItemVerticalPadding:v43];
  LODWORD(v44) = 1148846080;
  [(MultilineStackView *)self->_buttonStackView setContentHuggingPriority:1 forAxis:v44];
  LODWORD(v45) = 1148846080;
  [(MultilineStackView *)self->_buttonStackView setContentCompressionResistancePriority:1 forAxis:v45];
  [(MultilineStackView *)self->_buttonStackView setAccessibilityIdentifier:@"ButtonStackView"];
  [(MultilineStackView *)self->_buttonStackView setRowHeightBlock:&stru_101316738];
  v46 = +[UIButtonConfiguration _maps_primaryCardFooterActionButtonConfiguration];
  v47 = +[UIButton buttonWithConfiguration:v46 primaryAction:0];
  directionsButton = self->_directionsButton;
  self->_directionsButton = v47;

  [(UIButton *)self->_directionsButton setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v49) = 1148846080;
  [(UIButton *)self->_directionsButton setContentCompressionResistancePriority:1 forAxis:v49];
  [(UIButton *)self->_directionsButton setAccessibilityIdentifier:@"DirectionsButton"];
  v50 = +[UIButtonConfiguration _maps_secondaryCardFooterActionButtonConfiguration];
  v51 = +[UIButton buttonWithConfiguration:v50 primaryAction:0];
  saveButton = self->_saveButton;
  self->_saveButton = v51;

  [(UIButton *)self->_saveButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_saveButton setAccessibilityIdentifier:@"SaveButton"];
  [(UIButton *)self->_saveButton addTarget:self action:"_pressedSave" forControlEvents:64];
  v53 = +[NSBundle mainBundle];
  v148 = [v53 localizedStringForKey:@"[Route Creation] Save" value:@"localized string not found" table:0];

  [(UIButton *)self->_saveButton setTitle:v148 forState:0];
  v54 = self->_saveButton;
  v55 = +[UIColor colorWithDynamicProvider:&stru_101316758];
  [(UIButton *)v54 setTitleColor:v55 forState:0];

  [(RouteCreationCardView *)self _updateDirectionsButtonWithSuggestedMode:2];
  [(RouteCreationCardView *)self addSubview:v30];
  [v30 addSubview:self->_reverseButton];
  [v30 addSubview:self->_outAndBackButton];
  [v30 addSubview:self->_closeLoopButton];
  [(RouteCreationCardView *)self addSubview:self->_cardContentView];
  [(UIView *)self->_cardContentView addSubview:self->_distanceLabel];
  [(UIView *)self->_cardContentView addSubview:self->_descriptionLabel];
  [(RouteCreationCardView *)self addSubview:self->_buttonStackView];
  v56 = self->_directionsButton;
  v155[0] = self->_saveButton;
  v155[1] = v56;
  v57 = +[NSArray arrayWithObjects:v155 count:2];
  [(MultilineStackView *)self->_buttonStackView setArrangedSubviews:v57];

  v146 = [v30 leadingAnchor];
  v145 = [(RouteCreationCardView *)self leadingAnchor];
  v144 = [v146 constraintEqualToAnchor:v145 constant:16.0];
  v154[0] = v144;
  v143 = [v30 trailingAnchor];
  v142 = [(RouteCreationCardView *)self trailingAnchor];
  v141 = [v143 constraintEqualToAnchor:v142 constant:-16.0];
  v154[1] = v141;
  v140 = [v30 topAnchor];
  v139 = [(RouteCreationCardView *)self topAnchor];
  v138 = [v140 constraintEqualToAnchor:v139];
  v154[2] = v138;
  v137 = [v30 heightAnchor];
  v136 = [v137 constraintEqualToConstant:48.0];
  v154[3] = v136;
  v135 = [(RouteCreationIconButton *)self->_reverseButton leadingAnchor];
  v134 = [v30 leadingAnchor];
  v133 = [v135 constraintEqualToAnchor:v134];
  v154[4] = v133;
  v132 = [(RouteCreationIconButton *)self->_outAndBackButton leadingAnchor];
  v131 = [(RouteCreationIconButton *)self->_reverseButton trailingAnchor];
  v130 = [v132 constraintEqualToAnchor:v131 constant:8.0];
  v154[5] = v130;
  v129 = [(RouteCreationIconButton *)self->_closeLoopButton leadingAnchor];
  v128 = [(RouteCreationIconButton *)self->_outAndBackButton trailingAnchor];
  v127 = [v129 constraintEqualToAnchor:v128 constant:8.0];
  v154[6] = v127;
  v126 = [(RouteCreationIconButton *)self->_closeLoopButton trailingAnchor];
  v125 = [v30 trailingAnchor];
  v124 = [v126 constraintEqualToAnchor:v125];
  v154[7] = v124;
  v123 = [(RouteCreationIconButton *)self->_reverseButton widthAnchor];
  v122 = [(RouteCreationIconButton *)self->_outAndBackButton widthAnchor];
  v121 = [v123 constraintEqualToAnchor:v122];
  v154[8] = v121;
  v120 = [(RouteCreationIconButton *)self->_reverseButton widthAnchor];
  v119 = [(RouteCreationIconButton *)self->_closeLoopButton widthAnchor];
  v118 = [v120 constraintEqualToAnchor:v119];
  v154[9] = v118;
  v117 = [(RouteCreationIconButton *)self->_reverseButton topAnchor];
  v116 = [v30 topAnchor];
  v115 = [v117 constraintEqualToAnchor:v116];
  v154[10] = v115;
  v113 = [(RouteCreationIconButton *)self->_reverseButton bottomAnchor];
  v112 = [v30 bottomAnchor];
  v111 = [v113 constraintEqualToAnchor:v112];
  v154[11] = v111;
  v110 = [(RouteCreationIconButton *)self->_outAndBackButton topAnchor];
  v109 = [v30 topAnchor];
  v108 = [v110 constraintEqualToAnchor:v109];
  v154[12] = v108;
  v107 = [(RouteCreationIconButton *)self->_outAndBackButton bottomAnchor];
  v106 = [v30 bottomAnchor];
  v105 = [v107 constraintEqualToAnchor:v106];
  v154[13] = v105;
  v104 = [(RouteCreationIconButton *)self->_closeLoopButton topAnchor];
  v103 = [v30 topAnchor];
  v102 = [v104 constraintEqualToAnchor:v103];
  v154[14] = v102;
  v101 = [(RouteCreationIconButton *)self->_closeLoopButton bottomAnchor];
  v114 = v30;
  v100 = [v30 bottomAnchor];
  v99 = [v101 constraintEqualToAnchor:v100];
  v154[15] = v99;
  v98 = [(UIView *)self->_cardContentView leadingAnchor];
  v97 = [(RouteCreationCardView *)self leadingAnchor];
  v96 = [v98 constraintEqualToAnchor:v97 constant:16.0];
  v154[16] = v96;
  v95 = [(UIView *)self->_cardContentView trailingAnchor];
  v94 = [(RouteCreationCardView *)self trailingAnchor];
  v93 = [v95 constraintEqualToAnchor:v94 constant:-16.0];
  v154[17] = v93;
  v92 = [(UIView *)self->_cardContentView topAnchor];
  v91 = [v30 bottomAnchor];
  v90 = [v92 constraintEqualToAnchor:v91 constant:16.0];
  v154[18] = v90;
  v89 = [(UIView *)self->_cardContentView bottomAnchor];
  v88 = [(RouteCreationCardView *)self bottomAnchor];
  v87 = [v89 constraintLessThanOrEqualToAnchor:v88 constant:-16.0];
  v154[19] = v87;
  v86 = [(UILabel *)self->_distanceLabel leadingAnchor];
  v85 = [(UIView *)self->_cardContentView leadingAnchor];
  v84 = [v86 constraintEqualToAnchor:v85 constant:14.0];
  v154[20] = v84;
  v83 = [(UILabel *)self->_distanceLabel trailingAnchor];
  v82 = [(UIView *)self->_cardContentView trailingAnchor];
  v81 = [v83 constraintEqualToAnchor:v82 constant:-14.0];
  v154[21] = v81;
  v80 = [(UILabel *)self->_distanceLabel topAnchor];
  v79 = [(UIView *)self->_cardContentView topAnchor];
  v78 = [v80 constraintEqualToAnchor:v79 constant:12.0];
  v154[22] = v78;
  v77 = [(MapsThemeMultiPartLabel *)self->_descriptionLabel leadingAnchor];
  v76 = [(UILabel *)self->_distanceLabel leadingAnchor];
  v75 = [v77 constraintEqualToAnchor:v76];
  v154[23] = v75;
  v74 = [(MapsThemeMultiPartLabel *)self->_descriptionLabel trailingAnchor];
  v73 = [(UILabel *)self->_distanceLabel trailingAnchor];
  v72 = [v74 constraintEqualToAnchor:v73];
  v154[24] = v72;
  v153 = [(MapsThemeMultiPartLabel *)self->_descriptionLabel topAnchor];
  v152 = [(UILabel *)self->_distanceLabel bottomAnchor];
  v71 = [v153 constraintEqualToAnchor:v152 constant:-7.0];
  v154[25] = v71;
  v70 = [(MultilineStackView *)self->_buttonStackView leadingAnchor];
  v69 = [(RouteCreationCardView *)self leadingAnchor];
  v68 = [v70 constraintEqualToAnchor:v69 constant:16.0];
  v154[26] = v68;
  v58 = [(MultilineStackView *)self->_buttonStackView trailingAnchor];
  v59 = [(RouteCreationCardView *)self trailingAnchor];
  v60 = [v58 constraintEqualToAnchor:v59 constant:-16.0];
  v154[27] = v60;
  v61 = [(MultilineStackView *)self->_buttonStackView topAnchor];
  v62 = [(UIView *)self->_cardContentView bottomAnchor];
  v63 = [v61 constraintEqualToAnchor:v62 constant:16.0];
  v154[28] = v63;
  v64 = [(MultilineStackView *)self->_buttonStackView bottomAnchor];
  v65 = [(RouteCreationCardView *)self bottomAnchor];
  v66 = [v64 constraintEqualToAnchor:v65];
  v154[29] = v66;
  v67 = +[NSArray arrayWithObjects:v154 count:30];
  +[NSLayoutConstraint activateConstraints:v67];
}

- (void)_pressedUndo
{
  v3 = [(RouteCreationCardView *)self editingDelegate];
  [v3 pressedUndo];

  [(RouteCreationCardView *)self _updateButtons];
}

- (void)_pressedReverse
{
  v3 = [(RouteCreationCardView *)self editingDelegate];
  [v3 pressedReverse];

  [(RouteCreationCardView *)self _updateButtons];
}

- (void)_pressedOutAndBack
{
  v3 = [(RouteCreationCardView *)self editingDelegate];
  [v3 pressedOutAndBack];

  [(RouteCreationCardView *)self _updateButtons];
}

- (void)_pressedCloseLoop
{
  v3 = [(RouteCreationCardView *)self editingDelegate];
  [v3 pressedCloseLoop];

  [(RouteCreationCardView *)self _updateButtons];
}

- (void)_pressedStepping
{
  [(UIButton *)self->_directionsButton setEnabled:0];
  objc_initWeak(&location, self);
  v3 = [(RouteCreationCardView *)self editingDelegate];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AB6FFC;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  [v3 pressedStartSteppingWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_pressedNav
{
  [(UIButton *)self->_directionsButton setEnabled:0];
  objc_initWeak(&location, self);
  v3 = [(RouteCreationCardView *)self editingDelegate];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AB71F4;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  [v3 pressedStartNavigationWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_pressedRoutePlanning
{
  id v2 = [(RouteCreationCardView *)self editingDelegate];
  [v2 pressedRoutePlanning];
}

- (void)_pressedSave
{
  id v2 = [(RouteCreationCardView *)self editingDelegate];
  [v2 pressedSave];
}

- (void)_unitsDidChange
{
  v3 = +[NSLocale currentLocale];
  self->_isMetric = [v3 _navigation_distanceUsesMetricSystem];

  [(RouteCreationCardView *)self _drawChart];
}

- (void)_updateGraphView
{
  v3 = [(UIViewController *)self->_graphViewController view];
  [v3 removeFromSuperview];

  graphViewController = self->_graphViewController;
  self->_graphViewController = 0;

  [(RouteCreationCardView *)self frame];
  double v5 = CGRectGetWidth(v48) + -32.0;
  if (v5 >= 2.22044605e-16)
  {
    id v6 = +[NSNumber numberWithDouble:v5];
    renderedGraphWidth = self->_renderedGraphWidth;
    self->_renderedGraphWidth = v6;

    v8 = +[MapsElevationChartStyle navigationLineStyle];
    v9 = [(GEOComposedRoute *)self->_route elevationProfile];
    BOOL isMetric = self->_isMetric;
    uint64_t v11 = [(RouteCreationCardView *)self traitCollection];
    v12 = +[MapsElevationGraphViewController makeHostingControllerFor:v9 width:isMetric isMetric:v11 traitCollection:0 shouldHighlight:v8 chartStyle:self->_zeroMeters currentPosition:v5];
    v13 = self->_graphViewController;
    self->_graphViewController = v12;

    v14 = self->_graphViewController;
    if (v14)
    {
      v15 = [(UIViewController *)v14 view];
      [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v15 setUserInteractionEnabled:0];
      v16 = +[UIColor clearColor];
      [v15 setBackgroundColor:v16];

      v17 = [(GEOComposedRoute *)self->_route elevationProfile];
      if ([v17 isValid]) {
        double v18 = -8.0;
      }
      else {
        double v18 = -3.0;
      }

      v19 = [(GEOComposedRoute *)self->_route elevationProfile];
      double v20 = 0.0;
      if ([v19 isValid]) {
        double v21 = 82.0;
      }
      else {
        double v21 = 0.0;
      }

      v22 = [(GEOComposedRoute *)self->_route elevationProfile];
      if ([v22 isValid]) {
        double v20 = 10.0;
      }

      [(UIView *)self->_cardContentView addSubview:v15];
      double v40 = [v15 leadingAnchor];
      v39 = [(UIView *)self->_cardContentView leadingAnchor];
      v38 = [v40 constraintEqualToAnchor:v39];
      v41[0] = v38;
      v37 = [v15 trailingAnchor];
      double v36 = [(UIView *)self->_cardContentView trailingAnchor];
      v35 = [v37 constraintEqualToAnchor:v36];
      v41[1] = v35;
      v34 = [v15 bottomAnchor];
      v23 = [(UIView *)self->_cardContentView bottomAnchor];
      v24 = [v34 constraintEqualToAnchor:v23 constant:v18];
      v41[2] = v24;
      v25 = [v15 heightAnchor];
      v26 = [v25 constraintEqualToConstant:v21];
      v41[3] = v26;
      v27 = [v15 topAnchor];
      v28 = [(MapsThemeMultiPartLabel *)self->_descriptionLabel bottomAnchor];
      v29 = [v27 constraintEqualToAnchor:v28 constant:v20];
      v41[4] = v29;
      +[NSArray arrayWithObjects:v41 count:5];
      v31 = v30 = v8;
      +[NSLayoutConstraint activateConstraints:v31];

      v8 = v30;
    }
    else
    {
      v32 = sub_1005762E4();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        double v43 = "-[RouteCreationCardView _updateGraphView]";
        __int16 v44 = 2080;
        double v45 = "RouteCreationCardView.m";
        __int16 v46 = 1024;
        int v47 = 317;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
      }

      if (!sub_100BB36BC()) {
        goto LABEL_13;
      }
      v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v33 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        double v43 = v33;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }

LABEL_13:
  }
}

- (void)_drawChart
{
  if (self->_graphViewController)
  {
    v3 = [(GEOComposedRoute *)self->_route elevationProfile];

    if (v3)
    {
      [(RouteCreationCardView *)self _updateGraphView];
    }
  }
}

- (void)_updateButtons
{
  v3 = [(RouteCreationCardView *)self editingDelegate];
  -[RouteCreationIconButton setEnabled:](self->_reverseButton, "setEnabled:", [v3 reverseEnabled]);

  v4 = [(RouteCreationCardView *)self editingDelegate];
  -[RouteCreationIconButton setEnabled:](self->_outAndBackButton, "setEnabled:", [v4 outAndBackEnabled]);

  id v5 = [(RouteCreationCardView *)self editingDelegate];
  -[RouteCreationIconButton setEnabled:](self->_closeLoopButton, "setEnabled:", [v5 closeLoopEnabled]);
}

- (void)_updateDirectionsButtonWithSuggestedMode:(unint64_t)a3
{
  id v5 = +[UIButtonConfiguration _maps_primaryCardFooterActionButtonConfiguration];
  if (a3 == 4)
  {
    directionsButton = self->_directionsButton;
    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"[Route Creation] Directions" value:@"localized string not found" table:0];
    [(UIButton *)directionsButton setTitle:v10 forState:0];

    [(UIButton *)self->_directionsButton removeTarget:self action:0 forControlEvents:64];
    [(UIButton *)self->_directionsButton addTarget:self action:"_pressedRoutePlanning" forControlEvents:64];
    uint64_t v11 = self->_directionsButton;
    v36[0] = self->_saveButton;
    v36[1] = v11;
    v12 = v36;
    goto LABEL_11;
  }
  if (a3 != 1)
  {
    if (!a3)
    {
      id v6 = sub_10057683C();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Hiding stepping button because it is not supported on this platform", buf, 2u);
      }

      saveButton = self->_saveButton;
      p_saveButton = &saveButton;
LABEL_15:
      double v18 = +[NSArray arrayWithObjects:p_saveButton count:1];
      goto LABEL_16;
    }
    v28 = self->_directionsButton;
    v29 = +[NSBundle mainBundle];
    v30 = [v29 localizedStringForKey:@"[Route Creation] Directions" value:@"localized string not found" table:0];
    [(UIButton *)v28 setTitle:v30 forState:0];

    [(UIButton *)self->_directionsButton removeTarget:self action:0 forControlEvents:64];
    [(UIButton *)self->_directionsButton addTarget:self action:"_pressedStepping" forControlEvents:64];
    v31 = self->_directionsButton;
    v39[0] = self->_saveButton;
    v39[1] = v31;
    v12 = v39;
LABEL_11:
    double v18 = +[NSArray arrayWithObjects:v12 count:2];
LABEL_16:
    [(MultilineStackView *)self->_buttonStackView setArrangedSubviews:v18];
    goto LABEL_17;
  }
  v13 = +[GEOPlatform sharedPlatform];
  unsigned __int8 v14 = [v13 supportsNavigation];

  if ((v14 & 1) == 0)
  {
    v32 = sub_10057683C();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Hiding GO button because it is not supported on this platform", buf, 2u);
    }

    v38 = self->_saveButton;
    p_saveButton = &v38;
    goto LABEL_15;
  }
  v15 = +[UIColor systemGreenColor];
  v16 = [v5 background];
  [v16 setBackgroundColor:v15];

  v17 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleTitle3 weight:UIFontWeightBold];
  double v18 = +[UIFont _maps_cappedFont:v17 withMaxPoint:34.0];

  v19 = [v18 fontDescriptor];
  double v20 = [v19 fontDescriptorWithDesign:UIFontDescriptorSystemDesignRounded];
  double v21 = +[UIFont fontWithDescriptor:v20 size:0.0];

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100AB7F4C;
  v33[3] = &unk_1012E90F0;
  id v34 = v21;
  id v22 = v21;
  [v5 setTitleTextAttributesTransformer:v33];
  v23 = self->_directionsButton;
  v24 = +[NSBundle mainBundle];
  v25 = [v24 localizedStringForKey:@"[Route Creation] GO" value:@"localized string not found" table:0];
  [(UIButton *)v23 setTitle:v25 forState:0];

  [(UIButton *)self->_directionsButton removeTarget:self action:0 forControlEvents:64];
  [(UIButton *)self->_directionsButton addTarget:self action:"_pressedNav" forControlEvents:64];
  v26 = self->_directionsButton;
  v37[0] = self->_saveButton;
  v37[1] = v26;
  v27 = +[NSArray arrayWithObjects:v37 count:2];
  [(MultilineStackView *)self->_buttonStackView setArrangedSubviews:v27];

LABEL_17:
  [(UIButton *)self->_directionsButton setConfiguration:v5];
  [(MultilineStackView *)self->_buttonStackView invalidateLayout];
}

- (void)setRoute:(id)a3
{
  id v21 = a3;
  objc_storeStrong((id *)&self->_route, a3);
  id v5 = [v21 persistentData];
  routeData = self->_routeData;
  self->_routeData = v5;

  v7 = self->_routeData;
  v28[0] = NSFontAttributeName;
  v8 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleTitle2 weight:UIFontWeightSemibold];
  v29[0] = v8;
  v28[1] = NSForegroundColorAttributeName;
  v9 = +[UIColor labelColor];
  v29[1] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  uint64_t v11 = [(GEOComposedGeometryRoutePersistentData *)v7 distanceStringWithAttributes:v10];
  [(UILabel *)self->_distanceLabel setAttributedText:v11];

  v26[0] = NSFontAttributeName;
  v12 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  v26[1] = NSForegroundColorAttributeName;
  v27[0] = v12;
  v13 = +[UIColor secondaryLabelColor];
  v27[1] = v13;
  unsigned __int8 v14 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  v15 = [v21 timeAndElevationDescriptionStringWithAttributes:v14];
  [(MapsThemeMultiPartLabel *)self->_descriptionLabel setMultiPartString:v15];

  [(RouteCreationCardView *)self _updateGraphView];
  [(RouteCreationCardView *)self _updateButtons];
  if (self->_route)
  {
    objc_initWeak(&location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100AB8320;
    v22[3] = &unk_101316780;
    objc_copyWeak(&v24, &location);
    id v23 = v21;
    v16 = objc_retainBlock(v22);
    v17 = +[MKLocationManager sharedLocationManager];
    double v18 = [v17 lastLocation];
    ((void (*)(void *, void *, void))v16[2])(v16, v18, 0);

    v19 = +[MKLocationManager sharedLocationManager];
    double v20 = [v19 singleLocationUpdateWithHandler:v16];

    [v20 start];
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    [(RouteCreationCardView *)self _updateDirectionsButtonWithSuggestedMode:2];
  }
}

- (void)setEditingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_editingDelegate, a3);

  [(RouteCreationCardView *)self _updateButtons];
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)RouteCreationCardView;
  [(RouteCreationCardView *)&v9 layoutSubviews];
  uint64_t v3 = [(GEOComposedRoute *)self->_route elevationProfile];
  if (v3)
  {
    v4 = (void *)v3;
    renderedGraphWidth = self->_renderedGraphWidth;
    if (renderedGraphWidth)
    {
      [(NSNumber *)renderedGraphWidth cgFloatValue];
      double v7 = v6;
      [(RouteCreationCardView *)self frame];
      double v8 = vabdd_f64(v7, CGRectGetWidth(v10));

      if (v8 < 1.0) {
        return;
      }
    }
    else
    {
    }
    [(RouteCreationCardView *)self _updateGraphView];
  }
}

- (UIButton)saveButton
{
  return self->_saveButton;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (RouteCreationEditingDelegate)editingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editingDelegate);

  return (RouteCreationEditingDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_editingDelegate);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_directionsButton, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_closeLoopButton, 0);
  objc_storeStrong((id *)&self->_outAndBackButton, 0);
  objc_storeStrong((id *)&self->_reverseButton, 0);
  objc_storeStrong((id *)&self->_graphViewController, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_distanceLabel, 0);
  objc_storeStrong((id *)&self->_cardContentView, 0);
  objc_storeStrong((id *)&self->_renderedGraphWidth, 0);
  objc_storeStrong((id *)&self->_routeData, 0);
  objc_storeStrong((id *)&self->_route, 0);

  objc_storeStrong((id *)&self->_zeroMeters, 0);
}

@end