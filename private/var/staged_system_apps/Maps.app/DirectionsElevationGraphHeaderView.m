@interface DirectionsElevationGraphHeaderView
- (BOOL)isRecalatingHeights;
- (BOOL)styleForNavigation;
- (DirectionsElevationGraphHeaderView)initWithFrame:(CGRect)a3;
- (DirectionsElevationGraphHeaderViewDelegate)delegate;
- (GEOComposedRoute)route;
- (double)maximumHeight;
- (double)minimumHeight;
- (float)_calculateTransitionProgress;
- (void)_scheduleUpdateMinimumMaximumHeights;
- (void)_updateLabels;
- (void)_updateMinimumMaximumHeights;
- (void)_updateTransition;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setNavigationProgress:(double)a3;
- (void)setRoute:(id)a3;
- (void)setStyleForNavigation:(BOOL)a3;
- (void)setTransitionProgress:(float)a3;
@end

@implementation DirectionsElevationGraphHeaderView

- (DirectionsElevationGraphHeaderView)initWithFrame:(CGRect)a3
{
  v120.receiver = self;
  v120.super_class = (Class)DirectionsElevationGraphHeaderView;
  v3 = -[DirectionsElevationGraphHeaderView initWithFrame:](&v120, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(DirectionsElevationGraphHeaderView *)v3 setAccessibilityIdentifier:v5];

    [(DirectionsElevationGraphHeaderView *)v3 setClipsToBounds:1];
    id v6 = objc_alloc_init((Class)NSMutableArray);
    id v7 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v11 = [v7 initWithFrame:CGRectZero.origin.x, y, width, height];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v11 setClipsToBounds:1];
    v12 = +[UIColor colorNamed:@"RoutePlanningPlatterBackground"];
    [v11 setBackgroundColor:v12];

    [v11 _setContinuousCornerRadius:14.0];
    id v13 = +[UIColor lightGrayColor];
    id v14 = [v13 CGColor];
    v15 = [v11 layer];
    [v15 setShadowColor:v14];

    v16 = [v11 layer];
    LODWORD(v17) = 1045220557;
    [v16 setShadowOpacity:v17];

    v18 = [v11 layer];
    [v18 setShadowRadius:3.0];

    v19 = [v11 layer];
    [v19 setShadowOffset:0.0, 0.0];

    [v11 setAccessibilityIdentifier:@"InnerContentView"];
    [(DirectionsElevationGraphHeaderView *)v3 addSubview:v11];
    LODWORD(v20) = 1148846080;
    v21 = [v11 _maps_constraintsEqualToEdgesOfView:v3 insets:0.0, 16.0, 16.0, 16.0 priority:v20];
    uint64_t v22 = [v21 bottomConstraint];
    innerContentBottomConstraint = v3->_innerContentBottomConstraint;
    v3->_innerContentBottomConstraint = (NSLayoutConstraint *)v22;

    v115 = v21;
    v24 = [v21 allConstraints];
    v119 = v6;
    [v6 addObjectsFromArray:v24];

    v25 = [DirectionsElevationGraphConfiguration alloc];
    v26 = [(DirectionsElevationGraphHeaderView *)v3 traitCollection];
    v27 = -[DirectionsElevationGraphConfiguration initWithUseType:userInterfaceIdiom:](v25, "initWithUseType:userInterfaceIdiom:", 0, [v26 userInterfaceIdiom]);

    v114 = v27;
    v28 = [[DirectionsElevationGraphView alloc] initWithConfiguration:v27];
    [(DirectionsElevationGraphView *)v28 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v11 addSubview:v28];
    p_chartView = (id *)&v3->_chartView;
    v113 = v28;
    objc_storeStrong((id *)&v3->_chartView, v28);
    v29 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
    textContainerView = v3->_textContainerView;
    v3->_textContainerView = v29;

    [(UIView *)v3->_textContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v31) = 1148846080;
    [(UIView *)v3->_textContainerView setContentCompressionResistancePriority:1 forAxis:v31];
    LODWORD(v32) = 1148846080;
    [(UIView *)v3->_textContainerView setContentHuggingPriority:1 forAxis:v32];
    [(UIView *)v3->_textContainerView setAccessibilityIdentifier:@"TextContainer"];
    [v11 addSubview:v3->_textContainerView];
    v33 = -[DirectionsElevationLabelSummaryView initWithFrame:]([DirectionsElevationLabelSummaryView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    labelSummaryView = v3->_labelSummaryView;
    v3->_labelSummaryView = v33;

    [(DirectionsElevationLabelSummaryView *)v3->_labelSummaryView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v35) = 1148846080;
    [(DirectionsElevationLabelSummaryView *)v3->_labelSummaryView setContentCompressionResistancePriority:1 forAxis:v35];
    LODWORD(v36) = 1148846080;
    [(DirectionsElevationLabelSummaryView *)v3->_labelSummaryView setContentHuggingPriority:1 forAxis:v36];
    [(DirectionsElevationLabelSummaryView *)v3->_labelSummaryView setAccessibilityIdentifier:@"LabelSummary"];
    [(UIView *)v3->_textContainerView addSubview:v3->_labelSummaryView];
    id v37 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    [v37 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v37 setLineBreakMode:0];
    [v37 setAdjustsFontForContentSizeCategory:1];
    [v37 setAccessibilityIdentifier:@"TitleLabel"];
    if (sub_1000BBB44(v3) == 5)
    {
      v38 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
      v39 = [v38 fontDescriptorWithSymbolicTraits:2];

      v40 = +[UIFont fontWithDescriptor:v39 size:0.0];
      v41 = v3->_labelSummaryView;
      v42 = +[UIColor labelColor];
      [(DirectionsElevationLabelSummaryView *)v41 setFont:v40 color:v42];

      v43 = &stru_1012F5ED0;
    }
    else
    {
      v43 = &stru_1012F5EF0;
    }
    v98 = v43;
    v44 = v43->invoke(v43);
    [v37 setFont:v44];

    v45 = +[NSBundle mainBundle];
    v46 = [v45 localizedStringForKey:@"Total Elevation [Chart Header]" value:@"localized string not found" table:0];
    [v37 setText:v46];

    v47 = +[UIColor secondaryLabelColor];
    [v37 setTextColor:v47];

    LODWORD(v48) = 1148846080;
    [v37 setContentHuggingPriority:1 forAxis:v48];
    LODWORD(v49) = 1148846080;
    [v37 setContentCompressionResistancePriority:1 forAxis:v49];
    LODWORD(v50) = 1148829696;
    [v37 setContentCompressionResistancePriority:0 forAxis:v50];
    [(UIView *)v3->_textContainerView addSubview:v37];
    uint64_t v51 = sub_1000BBB44(v3);
    double v52 = 12.0;
    if (v51 == 5) {
      double v53 = 16.0;
    }
    else {
      double v53 = 12.0;
    }
    if (v51 == 5) {
      double v54 = 10.0;
    }
    else {
      double v54 = 12.0;
    }
    v117 = v37;
    if (v51 == 5) {
      double v52 = 14.0;
    }
    v3->_contentInsets.top = v52;
    v3->_contentInsets.left = v53;
    v3->_contentInsets.bottom = v54;
    v3->_contentInsets.right = v53;
    v3->_textContainerMaxTopMargin = v52;
    v55 = [(UIView *)v3->_textContainerView topAnchor];
    v56 = [v11 topAnchor];
    uint64_t v57 = [v55 constraintEqualToAnchor:v56 constant:v3->_textContainerMaxTopMargin];
    textContainerTopConstraint = v3->_textContainerTopConstraint;
    v3->_textContainerTopConstraint = (NSLayoutConstraint *)v57;

    v59 = [*p_chartView heightAnchor];
    v60 = [v59 constraintGreaterThanOrEqualToConstant:0.0];
    double v61 = 50.0;
    if (v3->_styleForNavigation) {
      double v61 = 80.0;
    }
    uint64_t v62 = +[DynamicTypeWizard autoscaledConstraint:v60 constant:&stru_1012F5F10 withFontProvider:v61];
    v116 = v11;
    graphMinimumHeightConstraint = v3->_graphMinimumHeightConstraint;
    v3->_graphMinimumHeightConstraint = (NSLayoutConstraint *)v62;

    v64 = [*p_chartView heightAnchor];
    v65 = [v64 constraintLessThanOrEqualToConstant:0.0];
    uint64_t v66 = +[DynamicTypeWizard autoscaledConstraint:v65 constant:&stru_1012F5F10 withFontProvider:80.0];
    graphMaximumHeightConstraint = v3->_graphMaximumHeightConstraint;
    v3->_graphMaximumHeightConstraint = (NSLayoutConstraint *)v66;

    v112 = [(DirectionsElevationLabelSummaryView *)v3->_labelSummaryView topAnchor];
    v111 = [(UIView *)v3->_textContainerView topAnchor];
    v110 = [v112 constraintEqualToAnchor:v111];
    v122[0] = v110;
    v109 = [(DirectionsElevationLabelSummaryView *)v3->_labelSummaryView leadingAnchor];
    v108 = [(UIView *)v3->_textContainerView leadingAnchor];
    v107 = [v109 constraintEqualToAnchor:v108];
    v122[1] = v107;
    v106 = [(UIView *)v3->_textContainerView trailingAnchor];
    v105 = [(DirectionsElevationLabelSummaryView *)v3->_labelSummaryView trailingAnchor];
    v104 = [v106 constraintGreaterThanOrEqualToAnchor:v105];
    v122[2] = v104;
    v103 = [v37 firstBaselineAnchor];
    v102 = [(DirectionsElevationLabelSummaryView *)v3->_labelSummaryView lastBaselineAnchor];
    v101 = [v103 constraintEqualToAnchor:v102];
    v100 = +[DynamicTypeWizard autoscaledConstraint:v101 constant:v98 withFontProvider:17.0];
    v122[3] = v100;
    v97 = [v37 leadingAnchor];
    v96 = [(UIView *)v3->_textContainerView leadingAnchor];
    v95 = [v97 constraintEqualToAnchor:v96];
    v122[4] = v95;
    v94 = [(UIView *)v3->_textContainerView trailingAnchor];
    v93 = [v37 trailingAnchor];
    v92 = [v94 constraintEqualToAnchor:v93];
    v122[5] = v92;
    v91 = [(UIView *)v3->_textContainerView bottomAnchor];
    v90 = [v37 bottomAnchor];
    v88 = [v91 constraintEqualToAnchor:v90];
    v122[6] = v88;
    v122[7] = v3->_textContainerTopConstraint;
    v89 = [(UIView *)v3->_textContainerView leadingAnchor];
    v87 = [v11 leadingAnchor];
    v86 = [v89 constraintEqualToAnchor:v87 constant:v53];
    v122[8] = v86;
    v85 = [v11 trailingAnchor];
    v84 = [(UIView *)v3->_textContainerView trailingAnchor];
    v83 = [v85 constraintEqualToAnchor:v84 constant:v53];
    v122[9] = v83;
    v122[10] = v3->_graphMinimumHeightConstraint;
    v122[11] = v3->_graphMaximumHeightConstraint;
    v82 = [*p_chartView topAnchor];
    v81 = [(UIView *)v3->_textContainerView lastBaselineAnchor];
    v80 = [v82 constraintEqualToAnchor:v81];
    v99 = +[DynamicTypeWizard autoscaledConstraint:v80 constant:v98 withFontProvider:15.0];
    v122[12] = v99;
    v79 = [*p_chartView leadingAnchor];
    v68 = [v11 leadingAnchor];
    v69 = [v79 constraintEqualToAnchor:v68 constant:v53];
    v122[13] = v69;
    v70 = [v11 trailingAnchor];
    v71 = [*p_chartView trailingAnchor];
    v72 = [v70 constraintEqualToAnchor:v71 constant:v53];
    v122[14] = v72;
    v73 = [v11 bottomAnchor];
    v74 = [*p_chartView bottomAnchor];
    v75 = [v73 constraintEqualToAnchor:v74 constant:v54];
    v122[15] = v75;
    v76 = +[NSArray arrayWithObjects:v122 count:16];
    [v119 addObjectsFromArray:v76];

    +[NSLayoutConstraint activateConstraints:v119];
    v121[0] = v3->_labelSummaryView;
    v121[1] = v117;
    v121[2] = *p_chartView;
    v77 = +[NSArray arrayWithObjects:v121 count:3];
    [(DirectionsElevationGraphHeaderView *)v3 setAccessibilityElements:v77];

    [(DirectionsElevationGraphHeaderView *)v3 _updateMinimumMaximumHeights];
    +[DynamicTypeWizard makeObject:v3 performSelector:"_scheduleUpdateMinimumMaximumHeights" whenSizeCategoryChangesWithOrder:2];
  }
  return v3;
}

- (void)setStyleForNavigation:(BOOL)a3
{
  if (self->_styleForNavigation != a3)
  {
    BOOL v3 = a3;
    self->_styleForNavigation = a3;
    graphMinimumHeightConstraint = self->_graphMinimumHeightConstraint;
    v5 = +[NSArray arrayWithObjects:&graphMinimumHeightConstraint count:1];
    +[NSLayoutConstraint deactivateConstraints:v5];

    id v6 = [(DirectionsElevationGraphView *)self->_chartView heightAnchor];
    id v7 = [v6 constraintGreaterThanOrEqualToConstant:0.0];
    double v8 = 50.0;
    if (v3)
    {
      double v8 = 80.0;
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v9 = 0;
    }
    v10 = +[DynamicTypeWizard autoscaledConstraint:v7 constant:&stru_1012F5F30 withFontProvider:v8];
    id v11 = self->_graphMinimumHeightConstraint;
    self->_graphMinimumHeightConstraint = v10;

    double v17 = self->_graphMinimumHeightConstraint;
    v12 = +[NSArray arrayWithObjects:&v17 count:1];
    +[NSLayoutConstraint activateConstraints:v12];

    chartView = self->_chartView;
    id v14 = [DirectionsElevationGraphConfiguration alloc];
    v15 = [(DirectionsElevationGraphHeaderView *)self traitCollection];
    v16 = -[DirectionsElevationGraphConfiguration initWithUseType:userInterfaceIdiom:](v14, "initWithUseType:userInterfaceIdiom:", v9, [v15 userInterfaceIdiom]);
    [(DirectionsElevationGraphView *)chartView setConfiguration:v16];

    [(DirectionsElevationGraphHeaderView *)self _updateMinimumMaximumHeights];
  }
}

- (void)setRoute:(id)a3
{
  id v7 = (GEOComposedRoute *)a3;
  if (self->_route != v7)
  {
    objc_storeStrong((id *)&self->_route, a3);
    [(DirectionsElevationGraphHeaderView *)self _updateLabels];
    chartView = self->_chartView;
    id v6 = [(GEOComposedRoute *)v7 elevationProfile];
    [(GEOComposedRoute *)v7 distance];
    -[DirectionsElevationGraphView setElevationProfile:routeLength:](chartView, "setElevationProfile:routeLength:", v6);
  }
}

- (void)_updateLabels
{
  BOOL v3 = [(GEOComposedRoute *)self->_route elevationProfile];

  if (v3)
  {
    v4 = [(GEOComposedRoute *)self->_route elevationProfile];
    double v5 = (double)[v4 sumElevationGainCm] / 100.0;

    id v6 = [(GEOComposedRoute *)self->_route elevationProfile];
    double v7 = (double)[v6 sumElevationLossCm] / 100.0;
  }
  else
  {
    double v7 = 0.0;
    double v5 = 0.0;
  }
  double v8 = sub_100577384();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = self;
    v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      v12 = [(DirectionsElevationGraphHeaderView *)v9 performSelector:"accessibilityIdentifier"];
      id v13 = v12;
      if (v12 && ![v12 isEqualToString:v11])
      {
        id v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_10;
      }
    }
    id v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_10:

    *(_DWORD *)buf = 138412290;
    v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@ | Will update labels for gain/loss", buf, 0xCu);
  }
  labelSummaryView = self->_labelSummaryView;
  id v16 = objc_alloc((Class)NSMeasurement);
  double v17 = +[NSUnitLength meters];
  id v18 = [v16 initWithDoubleValue:v17 unit:v5];
  id v19 = objc_alloc((Class)NSMeasurement);
  double v20 = +[NSUnitLength meters];
  id v21 = [v19 initWithDoubleValue:v20 unit:v7];
  [(DirectionsElevationLabelSummaryView *)labelSummaryView setAscent:v18 descent:v21];
}

- (void)setNavigationProgress:(double)a3
{
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)DirectionsElevationGraphHeaderView;
  [(DirectionsElevationGraphHeaderView *)&v4 layoutSubviews];
  if (self->_recalculatingHeights
    || (double widthForLastMinMaxCalculation = self->_widthForLastMinMaxCalculation,
        [(DirectionsElevationGraphHeaderView *)self bounds],
        vabdd_f64(widthForLastMinMaxCalculation, CGRectGetWidth(v5)) <= 2.22044605e-16))
  {
    if (self->_minimumHeight > 0.0 && self->_maximumHeight > 0.0)
    {
      [(DirectionsElevationGraphHeaderView *)self _calculateTransitionProgress];
      -[DirectionsElevationGraphHeaderView setTransitionProgress:](self, "setTransitionProgress:");
    }
  }
  else
  {
    [(DirectionsElevationGraphHeaderView *)self _updateMinimumMaximumHeights];
  }
}

- (float)_calculateTransitionProgress
{
  [(DirectionsElevationGraphHeaderView *)self bounds];
  double Height = CGRectGetHeight(v9);
  minimumdouble Height = self->_minimumHeight;
  float v5 = 1.0;
  if (Height > minimumHeight)
  {
    maximumdouble Height = self->_maximumHeight;
    float v5 = 0.0;
    if (Height < maximumHeight)
    {
      float v7 = (Height - minimumHeight) / (maximumHeight - minimumHeight);
      return 1.0 - v7;
    }
  }
  return v5;
}

- (void)setTransitionProgress:(float)a3
{
  float v3 = fminf(fmaxf(a3, 0.0), 1.0);
  if (self->_transitionProgress != v3)
  {
    self->_transitionProgress = v3;
    [(DirectionsElevationGraphHeaderView *)self _updateTransition];
  }
}

- (void)_scheduleUpdateMinimumMaximumHeights
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006FDDE0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_updateMinimumMaximumHeights
{
  self->_recalculatingHeights = 1;
  [(DirectionsElevationGraphHeaderView *)self bounds];
  self->_double widthForLastMinMaxCalculation = CGRectGetWidth(v11);
  float v3 = [(DirectionsElevationGraphHeaderView *)self delegate];
  [v3 directionsElevationGraphHeaderViewWillRecalculateHeights:self];

  CGFloat v4 = self->_contentInsets.top + 0.0;
  [(NSLayoutConstraint *)self->_graphMinimumHeightConstraint constant];
  self->_minimumdouble Height = v4 + v5 + self->_contentInsets.bottom + 16.0;
  [(DirectionsElevationGraphHeaderView *)self setTransitionProgress:0.0];
  id v6 = [(DirectionsElevationGraphView *)self->_chartView heightAnchor];
  [(NSLayoutConstraint *)self->_graphMaximumHeightConstraint constant];
  [v6 constraintEqualToConstant:];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v9 setActive:1];
  -[DirectionsElevationGraphHeaderView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  self->_maximumdouble Height = v7;
  [v9 setActive:0];
  [(DirectionsElevationGraphHeaderView *)self setNeedsLayout];
  [(DirectionsElevationGraphHeaderView *)self layoutIfNeeded];
  self->_recalculatingHeights = 0;
  double v8 = [(DirectionsElevationGraphHeaderView *)self delegate];
  [v8 directionsElevationGraphHeaderViewDidRecalculateHeights:self];
}

- (void)_updateTransition
{
  if (self->_minimumHeight == 0.0 || self->_maximumHeight == 0.0)
  {
    [(NSLayoutConstraint *)self->_textContainerTopConstraint setConstant:self->_textContainerMaxTopMargin];
    [(NSLayoutConstraint *)self->_innerContentBottomConstraint setConstant:0.0];
    textContainerView = self->_textContainerView;
    [(UIView *)textContainerView setAlpha:1.0];
  }
  else
  {
    double transitionProgress = self->_transitionProgress;
    [(UIView *)self->_textContainerView bounds];
    [(NSLayoutConstraint *)self->_textContainerTopConstraint setConstant:self->_textContainerMaxTopMargin - (CGRectGetHeight(v8) + self->_textContainerMaxTopMargin) * transitionProgress];
    [(UIView *)self->_textContainerView setAlpha:(float)(1.0 - self->_transitionProgress)];
    double v5 = self->_transitionProgress * 16.0;
    innerContentBottomConstraint = self->_innerContentBottomConstraint;
    [(NSLayoutConstraint *)innerContentBottomConstraint setConstant:v5];
  }
}

- (DirectionsElevationGraphHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DirectionsElevationGraphHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)styleForNavigation
{
  return self->_styleForNavigation;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (double)maximumHeight
{
  return self->_maximumHeight;
}

- (BOOL)isRecalatingHeights
{
  return self->_recalculatingHeights;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_graphMaximumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_graphMinimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_innerContentBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textContainerTopConstraint, 0);
  objc_storeStrong((id *)&self->_labelSummaryView, 0);
  objc_storeStrong((id *)&self->_chartView, 0);

  objc_storeStrong((id *)&self->_textContainerView, 0);
}

@end