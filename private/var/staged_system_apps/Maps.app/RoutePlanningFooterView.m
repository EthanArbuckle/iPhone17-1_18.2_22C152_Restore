@interface RoutePlanningFooterView
- (BOOL)shouldStackButtonsForWidth:(double)a3;
- (MKViewWithHairline)trailingHairlineView;
- (MapsThemeButton)leadingButton;
- (MapsThemeButton)trailingButton;
- (NSArray)constraints;
- (NSLayoutConstraint)stackViewFlexibleTrailingConstraint;
- (NSLayoutConstraint)stackViewTrailingConstraint;
- (RoutePlanningFooterView)initWithCoder:(id)a3;
- (RoutePlanningFooterView)initWithFrame:(CGRect)a3;
- (RoutePlanningFooterViewDelegate)delegate;
- (UIStackView)stackView;
- (id)_getTicketsMenuProvider;
- (int64_t)visibleCommandSet;
- (void)_didTapButton:(id)a3;
- (void)_didTapTicketingSegmentInfo:(id)a3;
- (void)_setupConstraints;
- (void)_updateVisibleCommandsForCommandSet;
- (void)customInit;
- (void)layoutSubviews;
- (void)setConstraints:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLeadingButton:(id)a3;
- (void)setStackView:(id)a3;
- (void)setStackViewFlexibleTrailingConstraint:(id)a3;
- (void)setStackViewTrailingConstraint:(id)a3;
- (void)setTrailingButton:(id)a3;
- (void)setTrailingHairlineView:(id)a3;
- (void)setVisibleCommandSet:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTheme;
@end

@implementation RoutePlanningFooterView

- (RoutePlanningFooterView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RoutePlanningFooterView;
  v3 = [(RoutePlanningFooterView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(RoutePlanningFooterView *)v3 customInit];
  }
  return v4;
}

- (RoutePlanningFooterView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RoutePlanningFooterView;
  v3 = -[RoutePlanningFooterView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(RoutePlanningFooterView *)v3 customInit];
  }
  return v4;
}

- (void)customInit
{
  self->_previousLayoutWidth = -1.0;
  v3 = +[UIColor clearColor];
  [(RoutePlanningFooterView *)self setBackgroundColor:v3];

  v4 = [MapsThemeButton alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v8 = -[MapsThemeButton initWithFrame:](v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(RoutePlanningFooterView *)self setLeadingButton:v8];

  v9 = [(RoutePlanningFooterView *)self leadingButton];
  [v9 setTitleColorProvider:&stru_1012F7D28];

  v10 = [(RoutePlanningFooterView *)self leadingButton];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(RoutePlanningFooterView *)self leadingButton];
  [v11 setContentHorizontalAlignment:4];

  v12 = [(RoutePlanningFooterView *)self leadingButton];
  v13 = [v12 titleLabel];
  [v13 setLineBreakMode:4];

  v14 = [(RoutePlanningFooterView *)self leadingButton];
  LODWORD(v15) = 1148846080;
  [v14 setContentCompressionResistancePriority:1 forAxis:v15];

  v16 = [(RoutePlanningFooterView *)self leadingButton];
  [v16 setAccessibilityIdentifier:@"LeadingButton"];

  v17 = -[MapsThemeButton initWithFrame:]([MapsThemeButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(RoutePlanningFooterView *)self setTrailingButton:v17];

  v18 = [(RoutePlanningFooterView *)self trailingButton];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  v19 = [(RoutePlanningFooterView *)self trailingButton];
  v20 = [v19 titleLabel];
  [v20 setLineBreakMode:4];

  v21 = [(RoutePlanningFooterView *)self trailingButton];
  [v21 setContentHorizontalAlignment:5];

  v22 = [(RoutePlanningFooterView *)self trailingButton];
  LODWORD(v23) = 1148846080;
  [v22 setContentCompressionResistancePriority:1 forAxis:v23];

  v24 = [(RoutePlanningFooterView *)self trailingButton];
  [v24 setAccessibilityIdentifier:@"TrailingButton"];

  v25 = [objc_alloc((Class)MKViewWithHairline) initWithFrame:CGRectZero.origin.x, y, width, height];
  trailingHairlineView = self->_trailingHairlineView;
  self->_trailingHairlineView = v25;

  [(MKViewWithHairline *)self->_trailingHairlineView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKViewWithHairline *)self->_trailingHairlineView setTopHairlineHidden:1];
  [(MKViewWithHairline *)self->_trailingHairlineView setBottomHairlineHidden:1];
  [(RoutePlanningFooterView *)self addSubview:self->_trailingHairlineView];
  uint64_t v27 = sub_1000BBB44(self);
  v28 = [(RoutePlanningFooterView *)self leadingButton];
  v29 = [v28 titleLabel];
  if (v27 == 5) {
    v30 = &stru_101321300;
  }
  else {
    v30 = &stru_101321340;
  }
  +[DynamicTypeWizard autorefreshLabel:v29 withFontProvider:v30];

  v31 = [(RoutePlanningFooterView *)self trailingButton];
  v32 = [v31 titleLabel];
  +[DynamicTypeWizard autorefreshLabel:v32 withFontProvider:v30];

  v33 = [(RoutePlanningFooterView *)self leadingButton];
  [v33 addTarget:self action:"_didTapButton:" forControlEvents:64];

  v34 = [(RoutePlanningFooterView *)self trailingButton];
  [v34 addTarget:self action:"_didTapButton:" forControlEvents:64];

  id v35 = objc_alloc((Class)UIStackView);
  v36 = [(RoutePlanningFooterView *)self leadingButton];
  v48[0] = v36;
  v37 = [(RoutePlanningFooterView *)self trailingButton];
  v48[1] = v37;
  v38 = +[NSArray arrayWithObjects:v48 count:2];
  id v39 = [v35 initWithArrangedSubviews:v38];
  [(RoutePlanningFooterView *)self setStackView:v39];

  v40 = [(RoutePlanningFooterView *)self stackView];
  [v40 setTranslatesAutoresizingMaskIntoConstraints:0];

  v41 = [(RoutePlanningFooterView *)self stackView];
  [v41 setAxis:0];

  v42 = [(RoutePlanningFooterView *)self stackView];
  [v42 setDistribution:3];

  v43 = [(RoutePlanningFooterView *)self stackView];
  [v43 setAlignment:2];

  v44 = [(RoutePlanningFooterView *)self stackView];
  [v44 setBaselineRelativeArrangement:1];

  v45 = [(RoutePlanningFooterView *)self stackView];
  [v45 setSpacing:16.0];

  v46 = [(RoutePlanningFooterView *)self stackView];
  [v46 setAccessibilityIdentifier:@"RoutePlanningFooterStack"];

  v47 = [(RoutePlanningFooterView *)self stackView];
  [(RoutePlanningFooterView *)self addSubview:v47];

  [(RoutePlanningFooterView *)self _updateVisibleCommandsForCommandSet];
  [(RoutePlanningFooterView *)self _setupConstraints];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RoutePlanningFooterView;
  [(RoutePlanningFooterView *)&v9 traitCollectionDidChange:v5];
  if (v5
    && (id v6 = [v5 userInterfaceStyle],
        [(RoutePlanningFooterView *)self traitCollection],
        v3 = objc_claimAutoreleasedReturnValue(),
        v6 == [v3 userInterfaceStyle]))
  {
  }
  else
  {
    v7 = [(RoutePlanningFooterView *)self traitCollection];
    id v8 = [v7 userInterfaceStyle];

    if (v5) {
    if (v8)
    }
      [(RoutePlanningFooterView *)self updateTheme];
  }
}

- (void)updateTheme
{
  id v4 = [(RoutePlanningFooterView *)self theme];
  v3 = [v4 hairlineColor];
  [(MKViewWithHairline *)self->_trailingHairlineView setHairlineColor:v3];
}

- (void)_updateVisibleCommandsForCommandSet
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  unsigned __int8 v4 = [(RoutePlanningFooterView *)self visibleCommandSet];
  if (sub_100522C78() && (v4 & 8) != 0)
  {
    v55[1] = @"title";
    v56[0] = &off_1013A91C0;
    v55[0] = @"command";
    id v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"Report an Issue" value:@"localized string not found" table:0];
    v56[1] = v6;
    v7 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
    [v3 addObject:v7];
  }
  if (v4)
  {
    v54[0] = &off_1013A91D8;
    v53[0] = @"command";
    v53[1] = @"title";
    v17 = +[NSBundle mainBundle];
    v18 = [v17 localizedStringForKey:@"More Rides" value:@"localized string not found" table:0];
    v54[1] = v18;
    v19 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
    [v3 addObject:v19];

    if ((v4 & 2) == 0)
    {
LABEL_6:
      if ((v4 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_6;
  }
  v51[1] = @"title";
  v52[0] = &off_1013A91F0;
  v51[0] = @"command";
  v20 = +[NSBundle mainBundle];
  v21 = [v20 localizedStringForKey:@"Share" value:@"localized string not found" table:0];
  v52[1] = v21;
  v22 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
  [v3 addObject:v22];

  if ((v4 & 4) != 0)
  {
LABEL_7:
    v50[0] = &off_1013A9208;
    v49[0] = @"command";
    v49[1] = @"title";
    id v8 = +[NSBundle mainBundle];
    objc_super v9 = [v8 localizedStringForKey:@"Get Tickets" value:@"localized string not found" table:0];
    v50[1] = v9;
    v49[2] = @"menuProvider";
    v10 = [(RoutePlanningFooterView *)self _getTicketsMenuProvider];
    v50[2] = v10;
    v11 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:3];
    [v3 addObject:v11];
  }
LABEL_8:
  v46 = v3;
  v12 = [v3 firstObject];
  v13 = v12;
  if (v12)
  {
    v45 = [v12 objectForKeyedSubscript:@"title"];
    v14 = [v13 objectForKeyedSubscript:@"command"];
    id v15 = [v14 integerValue];

    v16 = [v13 objectForKeyedSubscript:@"menuProvider"];
  }
  else
  {
    id v15 = 0;
    v16 = 0;
    v45 = &stru_101324E70;
  }
  double v23 = [v46 lastObject];
  id v24 = 0;
  v25 = &stru_101324E70;
  if (v23)
  {
    uint64_t v26 = 0;
    if (v23 != v13)
    {
      v25 = [v23 objectForKeyedSubscript:@"title"];
      uint64_t v27 = [v23 objectForKeyedSubscript:@"command"];
      id v24 = [v27 integerValue];

      uint64_t v26 = [v23 objectForKeyedSubscript:@"menuProvider"];
    }
  }
  else
  {
    uint64_t v26 = 0;
  }
  BOOL v28 = [(__CFString *)v45 length] == 0;
  v29 = [(RoutePlanningFooterView *)self leadingButton];
  [v29 setHidden:v28];

  v30 = [(RoutePlanningFooterView *)self leadingButton];
  [v30 setTitle:v45 forState:0];

  v31 = [(RoutePlanningFooterView *)self leadingButton];
  [v31 setTag:v15];

  if (sub_1000BBB44(self) == 5)
  {
    v32 = [(RoutePlanningFooterView *)self leadingButton];
    [v32 _setMenuProvider:v16];

    v33 = [(RoutePlanningFooterView *)self leadingButton];
    [v33 setContextMenuInteractionEnabled:1];

    v34 = [(RoutePlanningFooterView *)self leadingButton];
    [v34 setShowsMenuAsPrimaryAction:v16 != 0];
  }
  BOOL v35 = [(__CFString *)v25 length] == 0;
  v36 = [(RoutePlanningFooterView *)self trailingButton];
  [v36 setHidden:v35];

  v37 = [(RoutePlanningFooterView *)self trailingButton];
  [v37 setTitle:v25 forState:0];

  v38 = [(RoutePlanningFooterView *)self trailingButton];
  [v38 setTag:v24];

  if (sub_1000BBB44(self) == 5)
  {
    id v39 = [(RoutePlanningFooterView *)self trailingButton];
    [v39 _setMenuProvider:v44];

    v40 = [(RoutePlanningFooterView *)self trailingButton];
    [v40 setContextMenuInteractionEnabled:1];

    v41 = [(RoutePlanningFooterView *)self trailingButton];
    [v41 setShowsMenuAsPrimaryAction:v44 != 0];
  }
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1008CD890;
  v47[3] = &unk_1012FFAA0;
  char v48 = 1;
  v42 = [(RoutePlanningFooterView *)self trailingButton];
  [v42 setTitleColorProvider:v47];

  v43 = [(RoutePlanningFooterView *)self trailingButton];
  [v43 setUserInteractionEnabled:1];
}

- (id)_getTicketsMenuProvider
{
  id v3 = +[MKMapService sharedService];
  [v3 captureUserAction:7014 onTarget:606 eventValue:0];

  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1008CD9D4;
  v7[3] = &unk_1012FFAC8;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  unsigned __int8 v4 = objc_retainBlock(v7);
  id v5 = objc_retainBlock(v4);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

- (void)_didTapTicketingSegmentInfo:(id)a3
{
  id v12 = a3;
  unsigned __int8 v4 = [(RoutePlanningFooterView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  id v6 = v12;
  if (v5)
  {
    v7 = [v12 ticketingUrl];
    id v8 = +[NSCharacterSet URLQueryAllowedCharacterSet];
    objc_super v9 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v8];

    v10 = +[NSURL URLWithString:v9];
    if (v10)
    {
      v11 = [(RoutePlanningFooterView *)self delegate];
      [v11 routePlanningView:self didTapGetTicketsForURL:v10];
    }
    id v6 = v12;
  }
}

- (void)setVisibleCommandSet:(int64_t)a3
{
  if (self->_visibleCommandSet != a3)
  {
    self->_visibleCommandSet = a3;
    [(RoutePlanningFooterView *)self _updateVisibleCommandsForCommandSet];
    [(RoutePlanningFooterView *)self _setupConstraints];
  }
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)RoutePlanningFooterView;
  [(RoutePlanningFooterView *)&v6 layoutSubviews];
  [(RoutePlanningFooterView *)self bounds];
  CGFloat Width = CGRectGetWidth(v7);
  if (Width != self->_previousLayoutWidth)
  {
    unsigned int v4 = -[RoutePlanningFooterView shouldStackButtonsForWidth:](self, "shouldStackButtonsForWidth:");
    unsigned int v5 = [(RoutePlanningFooterView *)self shouldStackButtonsForWidth:Width];
    self->_previousLayoutCGFloat Width = Width;
    if (v4 != v5) {
      [(RoutePlanningFooterView *)self _setupConstraints];
    }
  }
}

- (void)_setupConstraints
{
  id v3 = [(RoutePlanningFooterView *)self trailingButton];
  LODWORD(v4) = 1144750080;
  [v3 setContentCompressionResistancePriority:0 forAxis:v4];

  unsigned int v5 = NSCollectionLayoutEdgeSpacing_ptr;
  +[NSLayoutConstraint deactivateConstraints:self->_constraints];
  [(RoutePlanningFooterView *)self bounds];
  unsigned int v6 = [(RoutePlanningFooterView *)self shouldStackButtonsForWidth:CGRectGetWidth(v83)];
  CGRect v7 = [(RoutePlanningFooterView *)self stackView];
  id v8 = v7;
  p_cache = &OBJC_METACLASS___HomeViewController.cache;
  unsigned int v79 = v6;
  if (v6)
  {
    [v7 setAxis:1];

    v10 = [(RoutePlanningFooterView *)self stackView];
    [v10 setAlignment:1];

    v11 = [(RoutePlanningFooterView *)self stackView];
    +[DynamicTypeWizard autoscaleStackView:v11 spacing:&stru_101321300 withFontProvider:31.0];

    id v12 = [(RoutePlanningFooterView *)self trailingButton];
    [v12 setContentHorizontalAlignment:4];

    v13 = [(RoutePlanningFooterView *)self trailingHairlineView];
    [v13 setTopHairlineHidden:0];

    id v80 = objc_alloc_init((Class)NSMutableArray);
    v14 = [(RoutePlanningFooterView *)self trailingHairlineView];
    id v15 = [v14 topAnchor];
    v16 = [(RoutePlanningFooterView *)self centerYAnchor];
    v17 = [v15 constraintEqualToAnchor:v16 constant:3.0];

    v78 = +[DynamicTypeWizard autoscaledConstraint:v17 constant:&stru_101321300 withFontProvider:3.0];

    v82[0] = v78;
    v77 = [(RoutePlanningFooterView *)self stackView];
    v75 = [v77 leadingAnchor];
    v76 = [(RoutePlanningFooterView *)self trailingHairlineView];
    v74 = [v76 leadingAnchor];
    v73 = [v75 constraintEqualToAnchor:v74];
    v82[1] = v73;
    v72 = [(RoutePlanningFooterView *)self trailingHairlineView];
    v70 = [v72 bottomAnchor];
    v71 = [(RoutePlanningFooterView *)self trailingButton];
    v18 = [v71 lastBaselineAnchor];
    v19 = [v70 constraintEqualToAnchor:v18];
    v82[2] = v19;
    v20 = [(RoutePlanningFooterView *)self trailingHairlineView];
    v21 = [v20 trailingAnchor];
    v22 = [(RoutePlanningFooterView *)self stackView];
    double v23 = [v22 trailingAnchor];
    id v24 = [v21 constraintEqualToAnchor:v23];
    v82[3] = v24;
    v25 = +[NSArray arrayWithObjects:v82 count:4];
    [v80 addObjectsFromArray:v25];

    unsigned int v5 = NSCollectionLayoutEdgeSpacing_ptr;
    p_cache = (void **)(&OBJC_METACLASS___HomeViewController + 16);
  }
  else
  {
    [v7 setSpacing:16.0];

    uint64_t v26 = [(RoutePlanningFooterView *)self stackView];
    [v26 setAxis:0];

    uint64_t v27 = [(RoutePlanningFooterView *)self stackView];
    [v27 setAlignment:2];

    BOOL v28 = [(RoutePlanningFooterView *)self stackView];
    +[DynamicTypeWizard stopAutoscalingStackView:v28];

    v29 = [(RoutePlanningFooterView *)self trailingButton];
    [v29 setContentHorizontalAlignment:5];

    v30 = [(RoutePlanningFooterView *)self trailingHairlineView];
    [v30 setTopHairlineHidden:1];

    id v31 = objc_alloc_init((Class)NSMutableArray);
    v32 = [(RoutePlanningFooterView *)self trailingButton];
    v33 = [(RoutePlanningFooterView *)self trailingHairlineView];
    LODWORD(v34) = 1148846080;
    BOOL v35 = [v32 _maps_constraintsEqualToEdgesOfView:v33 priority:v34];
    v36 = [v35 allConstraints];
    id v80 = v31;
    [v31 addObjectsFromArray:v36];
  }
  v37 = [(RoutePlanningFooterView *)self traitCollection];
  id v38 = [v37 userInterfaceIdiom];

  id v39 = [(RoutePlanningFooterView *)self stackView];
  v41 = v39;
  if (v38 == (id)5)
  {
    LODWORD(v40) = 1148846080;
    v42 = [v39 _maps_constraintsEqualToEdgesOfView:self insets:8.0, 16.0, 8.0, 16.0 priority:v40];
    v43 = [v42 allConstraints];
    v44 = v80;
    [v80 addObjectsFromArray:v43];
  }
  else
  {
    v45 = [v39 firstBaselineAnchor];
    v46 = [(RoutePlanningFooterView *)self topAnchor];
    v47 = [v45 constraintEqualToAnchor:v46 constant:32.0];

    char v48 = [(RoutePlanningFooterView *)self bottomAnchor];
    v49 = [(RoutePlanningFooterView *)self stackView];
    v50 = [v49 lastBaselineAnchor];
    v51 = [v48 constraintEqualToAnchor:v50 constant:15.0];

    v41 = [p_cache + 33 autoscaledConstraint:v47 constant:&stru_101321300 withFontProvider:32.0];

    v42 = [p_cache + 33 autoscaledConstraint:v51 constant:&stru_101321300 withFontProvider:15.0];

    v81[0] = v41;
    v52 = [(RoutePlanningFooterView *)self stackView];
    v53 = [v52 leadingAnchor];
    v54 = [(RoutePlanningFooterView *)self leadingAnchor];
    v55 = [v53 constraintEqualToAnchor:v54 constant:16.0];
    v81[1] = v55;
    v81[2] = v42;
    v56 = +[NSArray arrayWithObjects:v81 count:3];
    [v80 addObjectsFromArray:v56];

    v57 = [(RoutePlanningFooterView *)self trailingAnchor];
    v58 = [(RoutePlanningFooterView *)self stackView];
    v59 = [v58 trailingAnchor];
    v60 = [v57 constraintEqualToAnchor:v59 constant:16.0];
    [(RoutePlanningFooterView *)self setStackViewTrailingConstraint:v60];

    v61 = [(RoutePlanningFooterView *)self trailingAnchor];
    v62 = [(RoutePlanningFooterView *)self stackView];
    v63 = [v62 trailingAnchor];
    v64 = [v61 constraintGreaterThanOrEqualToAnchor:v63 constant:16.0];
    [(RoutePlanningFooterView *)self setStackViewFlexibleTrailingConstraint:v64];

    v65 = [(RoutePlanningFooterView *)self trailingButton];
    LODWORD(v62) = v79 | [v65 isHidden] ^ 1;

    if (v62 == 1)
    {
      v66 = [(RoutePlanningFooterView *)self stackViewFlexibleTrailingConstraint];
      [v66 setActive:0];

      [(RoutePlanningFooterView *)self stackViewTrailingConstraint];
    }
    else
    {
      v67 = [(RoutePlanningFooterView *)self stackViewTrailingConstraint];
      [v67 setActive:0];

      [(RoutePlanningFooterView *)self stackViewFlexibleTrailingConstraint];
    v43 = };
    v44 = v80;
    [v80 addObject:v43];
  }

  v68 = (NSArray *)[v44 copy];
  constraints = self->_constraints;
  self->_constraints = v68;

  [v5[33] activateConstraints:self->_constraints];
}

- (BOOL)shouldStackButtonsForWidth:(double)a3
{
  unsigned int v5 = [(RoutePlanningFooterView *)self traitCollection];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)5) {
    return 0;
  }
  id v8 = [(RoutePlanningFooterView *)self leadingButton];
  [v8 intrinsicContentSize];
  double v10 = v9;

  v11 = [(RoutePlanningFooterView *)self trailingButton];
  [v11 intrinsicContentSize];
  double v13 = v12;

  double v14 = a3 + -48.0;
  if (a3 + -48.0 < 0.0) {
    double v14 = 0.0;
  }
  return v10 + v13 - v14 > 0.0;
}

- (void)_didTapButton:(id)a3
{
  switch((unint64_t)[a3 tag])
  {
    case 1uLL:
      double v4 = [(RoutePlanningFooterView *)self delegate];
      char v5 = objc_opt_respondsToSelector();

      if (v5)
      {
        id v12 = [(RoutePlanningFooterView *)self delegate];
        [v12 didTapMoreRidesharingChoicesButtonOnRoutePlanningFooterView:self];
        goto LABEL_11;
      }
      break;
    case 2uLL:
      id v6 = [(RoutePlanningFooterView *)self delegate];
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v12 = [(RoutePlanningFooterView *)self delegate];
        [v12 didTapShareButtonOnRoutePlanningFooterView:self];
        goto LABEL_11;
      }
      break;
    case 4uLL:
      id v8 = [(RoutePlanningFooterView *)self delegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        id v12 = [(RoutePlanningFooterView *)self delegate];
        [v12 didTapGetTicketsOnRoutePlanningFooterView:self];
        goto LABEL_11;
      }
      break;
    case 8uLL:
      if (sub_100522C78())
      {
        double v10 = [(RoutePlanningFooterView *)self delegate];
        char v11 = objc_opt_respondsToSelector();

        if (v11)
        {
          id v12 = [(RoutePlanningFooterView *)self delegate];
          [v12 didTapReportAProblemButtonOnRoutePlanningFooterView:self];
LABEL_11:
        }
      }
      break;
    default:
      return;
  }
}

- (int64_t)visibleCommandSet
{
  return self->_visibleCommandSet;
}

- (RoutePlanningFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RoutePlanningFooterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (MapsThemeButton)leadingButton
{
  return self->_leadingButton;
}

- (void)setLeadingButton:(id)a3
{
}

- (MapsThemeButton)trailingButton
{
  return self->_trailingButton;
}

- (void)setTrailingButton:(id)a3
{
}

- (MKViewWithHairline)trailingHairlineView
{
  return self->_trailingHairlineView;
}

- (void)setTrailingHairlineView:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (NSLayoutConstraint)stackViewTrailingConstraint
{
  return self->_stackViewTrailingConstraint;
}

- (void)setStackViewTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)stackViewFlexibleTrailingConstraint
{
  return self->_stackViewFlexibleTrailingConstraint;
}

- (void)setStackViewFlexibleTrailingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackViewFlexibleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_trailingHairlineView, 0);
  objc_storeStrong((id *)&self->_trailingButton, 0);
  objc_storeStrong((id *)&self->_leadingButton, 0);
  objc_storeStrong((id *)&self->_stackView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end