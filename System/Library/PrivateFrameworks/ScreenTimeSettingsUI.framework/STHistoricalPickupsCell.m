@interface STHistoricalPickupsCell
- (NSLayoutConstraint)bottomConstraint;
- (STHistoricalPickupsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (STHistoricalUsageViewController)historicalUsageViewController;
- (STHorizontallySegmentedView)pickupMetricsView;
- (UILabel)firstUsedAfterPickupLabel;
- (id)value;
- (void)_currentViewModeDidChangeFrom:(int64_t)a3 to:(int64_t)a4;
- (void)_handleEffectiveChangeForViewMode:(int64_t)a3 hasMultilineLayout:(BOOL)a4 numberOfLines:(unint64_t)a5;
- (void)_hasMulitlineLayoutDidChangeFrom:(BOOL)a3 to:(BOOL)a4;
- (void)_numberOfLinesDidChangeFrom:(unint64_t)a3 to:(unint64_t)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBottomConstraint:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation STHistoricalPickupsCell

- (STHistoricalPickupsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v41.receiver = self;
  v41.super_class = (Class)STHistoricalPickupsCell;
  v5 = [(STTableCell *)&v41 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  uint64_t v6 = +[STHistoricalUsageViewController historicalUsageViewControllerOfType:6 graphHeight:62.0];
  historicalUsageViewController = v5->_historicalUsageViewController;
  v5->_historicalUsageViewController = (STHistoricalUsageViewController *)v6;

  v8 = [(STTableCell *)v5 childViewControllers];
  [v8 addObject:v5->_historicalUsageViewController];

  uint64_t v9 = objc_opt_new();
  pickupMetricsView = v5->_pickupMetricsView;
  v5->_pickupMetricsView = (STHorizontallySegmentedView *)v9;

  [(STHorizontallySegmentedView *)v5->_pickupMetricsView setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v11 = objc_opt_new();
  firstUsedAfterPickupLabel = v5->_firstUsedAfterPickupLabel;
  v5->_firstUsedAfterPickupLabel = (UILabel *)v11;

  [(UILabel *)v5->_firstUsedAfterPickupLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = [MEMORY[0x263F82CA0] _defaultFontForTableViewStyle:1 isSectionHeader:1];
  [(UILabel *)v5->_firstUsedAfterPickupLabel setFont:v13];

  v14 = +[STScreenTimeSettingsUIBundle bundle];
  v15 = [v14 localizedStringForKey:@"FirstUsedAfterPickupTitle" value:&stru_26D9391A8 table:0];
  [(UILabel *)v5->_firstUsedAfterPickupLabel setText:v15];

  v16 = [MEMORY[0x263F82CA0] _defaultTextColorForTableViewStyle:1 isSectionHeader:1];
  [(UILabel *)v5->_firstUsedAfterPickupLabel setTextColor:v16];

  [(UILabel *)v5->_firstUsedAfterPickupLabel setNumberOfLines:0];
  [(UILabel *)v5->_firstUsedAfterPickupLabel setLineBreakMode:0];
  LODWORD(v17) = 1144750080;
  [(UILabel *)v5->_firstUsedAfterPickupLabel setContentHuggingPriority:1 forAxis:v17];
  LODWORD(v18) = 1144766464;
  [(UILabel *)v5->_firstUsedAfterPickupLabel setContentCompressionResistancePriority:1 forAxis:v18];
  v19 = [(STHistoricalPickupsCell *)v5 contentView];
  v20 = [(STHistoricalUsageViewController *)v5->_historicalUsageViewController view];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v19 addSubview:v20];
  [v19 addSubview:v5->_pickupMetricsView];
  v40 = _NSDictionaryOfVariableBindings(&cfstr_Historicalusag_0.isa, v20, v5->_pickupMetricsView, 0);
  v21 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[historicalUsageView][_pickupMetricsView]" options:0 metrics:0 views:v40];
  v22 = (void *)[v21 mutableCopy];

  v23 = [(STTableCell *)v5 contentLayoutGuide];
  v24 = [v23 leadingAnchor];
  v25 = [v20 leadingAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  [v22 addObject:v26];

  v27 = [v23 trailingAnchor];
  v28 = [v20 trailingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  [v22 addObject:v29];

  v30 = [v23 leadingAnchor];
  v31 = [(STHorizontallySegmentedView *)v5->_pickupMetricsView leadingAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  [v22 addObject:v32];

  v33 = [v23 trailingAnchor];
  v34 = [(STHorizontallySegmentedView *)v5->_pickupMetricsView trailingAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  [v22 addObject:v35];

  v36 = [v19 bottomAnchor];
  v37 = [(STHorizontallySegmentedView *)v5->_pickupMetricsView bottomAnchor];
  v38 = [v36 constraintEqualToAnchor:v37 constant:11.0];

  [(STHistoricalPickupsCell *)v5 setBottomConstraint:v38];
  [v22 addObject:v38];
  [MEMORY[0x263F08938] activateConstraints:v22];
  [(STHistoricalUsageViewController *)v5->_historicalUsageViewController addObserver:v5 forKeyPath:@"titleView.hasMultilineLayout" options:3 context:"KVOContextHistoricalPickupsCell"];
  [(STHistoricalUsageViewController *)v5->_historicalUsageViewController addObserver:v5 forKeyPath:@"titleView.hasMultilineLayout" options:3 context:"KVOContextHistoricalPickupsCell"];
  [(STHorizontallySegmentedView *)v5->_pickupMetricsView addObserver:v5 forKeyPath:@"numberOfLines" options:3 context:"KVOContextHistoricalPickupsCell"];

  return v5;
}

- (void)dealloc
{
  [(STHistoricalUsageViewController *)self->_historicalUsageViewController removeObserver:self forKeyPath:@"titleView.hasMultilineLayout" context:"KVOContextHistoricalPickupsCell"];
  [(STHistoricalUsageViewController *)self->_historicalUsageViewController removeObserver:self forKeyPath:@"titleView.hasMultilineLayout" context:"KVOContextHistoricalPickupsCell"];
  [(STHorizontallySegmentedView *)self->_pickupMetricsView removeObserver:self forKeyPath:@"numberOfLines" context:"KVOContextHistoricalPickupsCell"];
  v3.receiver = self;
  v3.super_class = (Class)STHistoricalPickupsCell;
  [(PSTableCell *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a6 == "KVOContextHistoricalPickupsCell")
  {
    [(STHistoricalPickupsCell *)self historicalUsageViewController];

    if ([v10 isEqualToString:@"currentViewMode"])
    {
      v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      v13 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v13)
      {

        v12 = 0;
      }
      v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v15 = [MEMORY[0x263EFF9D0] null];

      if (v14 == v15)
      {

        v14 = 0;
      }
      -[STHistoricalPickupsCell _currentViewModeDidChangeFrom:to:](self, "_currentViewModeDidChangeFrom:to:", [v12 integerValue], objc_msgSend(v14, "integerValue"));
    }
    else
    {
      [(STHistoricalPickupsCell *)self historicalUsageViewController];

      if ([v10 isEqualToString:@"titleView.hasMultilineLayout"])
      {
        v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
        v16 = [MEMORY[0x263EFF9D0] null];

        if (v12 == v16)
        {

          v12 = 0;
        }
        v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
        double v17 = [MEMORY[0x263EFF9D0] null];

        if (v14 == v17)
        {

          v14 = 0;
        }
        -[STHistoricalPickupsCell _hasMulitlineLayoutDidChangeFrom:to:](self, "_hasMulitlineLayoutDidChangeFrom:to:", [v12 BOOLValue], objc_msgSend(v14, "BOOLValue"));
      }
      else
      {
        [(STHistoricalPickupsCell *)self pickupMetricsView];

        if (![v10 isEqualToString:@"numberOfLines"]) {
          goto LABEL_22;
        }
        v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
        double v18 = [MEMORY[0x263EFF9D0] null];

        if (v12 == v18)
        {

          v12 = 0;
        }
        v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
        v19 = [MEMORY[0x263EFF9D0] null];

        if (v14 == v19)
        {

          v14 = 0;
        }
        -[STHistoricalPickupsCell _numberOfLinesDidChangeFrom:to:](self, "_numberOfLinesDidChangeFrom:to:", [v12 unsignedIntegerValue], objc_msgSend(v14, "unsignedIntegerValue"));
      }
    }

    goto LABEL_22;
  }
  v20.receiver = self;
  v20.super_class = (Class)STHistoricalPickupsCell;
  [(STHistoricalPickupsCell *)&v20 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
LABEL_22:
}

- (void)_currentViewModeDidChangeFrom:(int64_t)a3 to:(int64_t)a4
{
  if (a3 != a4)
  {
    v7 = [(STHistoricalPickupsCell *)self historicalUsageViewController];
    v8 = [v7 titleView];
    uint64_t v9 = [v8 hasMultilineLayout];

    id v10 = [(STHistoricalPickupsCell *)self pickupMetricsView];
    id v11 = [v10 numberOfLines];
    uint64_t v12 = [v11 unsignedIntegerValue];

    [(STHistoricalPickupsCell *)self _handleEffectiveChangeForViewMode:a4 hasMultilineLayout:v9 numberOfLines:v12];
  }
}

- (void)_hasMulitlineLayoutDidChangeFrom:(BOOL)a3 to:(BOOL)a4
{
  if (a3 != a4)
  {
    BOOL v5 = a4;
    v7 = [(STHistoricalPickupsCell *)self historicalUsageViewController];
    uint64_t v8 = [v7 currentViewMode];

    uint64_t v9 = [(STHistoricalPickupsCell *)self pickupMetricsView];
    id v10 = [v9 numberOfLines];
    uint64_t v11 = [v10 unsignedIntegerValue];

    [(STHistoricalPickupsCell *)self _handleEffectiveChangeForViewMode:v8 hasMultilineLayout:v5 numberOfLines:v11];
  }
}

- (void)_numberOfLinesDidChangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  if (a3 != a4)
  {
    id v10 = [(STHistoricalPickupsCell *)self historicalUsageViewController];
    uint64_t v7 = [v10 currentViewMode];
    uint64_t v8 = [v10 titleView];
    uint64_t v9 = [v8 hasMultilineLayout];

    [(STHistoricalPickupsCell *)self _handleEffectiveChangeForViewMode:v7 hasMultilineLayout:v9 numberOfLines:a4];
  }
}

- (void)_handleEffectiveChangeForViewMode:(int64_t)a3 hasMultilineLayout:(BOOL)a4 numberOfLines:(unint64_t)a5
{
  BOOL v6 = a4;
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
  id v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"SpecifierIdentifierHistoricalPickupsCell-%lu-%d-%lu", a3, v6, a5);
  uint64_t v12 = @"HistoricalPickupsSpecifierIdentifier";
  v13[0] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v9 postNotificationName:@"HistoricalPickupsSpecifierIdentifierDidChange" object:self userInfo:v11];

  [(STHistoricalPickupsCell *)self setNeedsUpdateConstraints];
  [v9 postNotificationName:0x26D941B88 object:self];
}

- (id)value
{
  v4.receiver = self;
  v4.super_class = (Class)STHistoricalPickupsCell;
  v2 = [(PSTableCell *)&v4 value];

  return v2;
}

- (void)setValue:(id)a3
{
  v88[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = v5;
  if (v5 && ([v5 conformsToProtocol:&unk_26D9A2F30] & 1) == 0)
  {
    v79 = [MEMORY[0x263F08690] currentHandler];
    [v79 handleFailureInMethod:a2, self, @"STHistoricalPickupsCell.m", 177, @"Invalid parameter not satisfying: %@", @"(coordinator == nil) || [coordinator conformsToProtocol:@protocol(STUsageDetailsViewModelCoordinator)]" object file lineNumber description];
  }
  v87.receiver = self;
  v87.super_class = (Class)STHistoricalPickupsCell;
  [(PSTableCell *)&v87 setValue:v6];
  uint64_t v7 = [(STHistoricalPickupsCell *)self historicalUsageViewController];
  [v7 setCoordinator:v6];

  uint64_t v8 = [v6 viewModel];
  uint64_t v9 = [v8 selectedUsageReport];

  uint64_t v10 = [v9 type];
  uint64_t v11 = &off_264766000;
  unint64_t v12 = 0x263F82000;
  v85 = v6;
  if (v10 == 1)
  {
    v83 = v9;
    id v20 = v9;
    uint64_t v21 = [v20 firstPickup];
    v22 = +[STScreenTimeSettingsUIBundle bundle];
    v81 = (void *)v21;
    if (v21)
    {
      v23 = objc_opt_new();
      [v23 setTimeStyle:1];
      [v23 setDateStyle:0];
      [v23 setFormattingContext:1];
      v24 = [v23 stringFromDate:v21];
    }
    else
    {
      v24 = &stru_26D9391A8;
    }
    [v22 localizedStringForKey:@"FirstPickupTime" value:&stru_26D9391A8 table:0];
    uint64_t v39 = v38 = v22;
    id v40 = [NSString alloc];
    objc_super v41 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v42 = [v20 totalPickups];

    v82 = (void *)v39;
    uint64_t v43 = objc_msgSend(v40, "initWithFormat:locale:", v39, v41, v42, v24);
    v37 = v24;
    v26 = (void *)v43;

    v36 = v38;
    v27 = [v38 localizedStringForKey:@"FirstPickupTitle" value:&stru_26D9391A8 table:0];
    v28 = [MEMORY[0x263F827E8] imageNamed:@"PickupArrowBig" inBundle:v36];
    v44 = [STSegmentItem alloc];
    v31 = [MEMORY[0x263F825C8] systemGrayColor];
    v32 = [MEMORY[0x263F825C8] systemGrayColor];
    uint64_t v86 = [(STSegmentItem *)v44 initWithTitleText:v27 detailText:v26 titleColor:v31 detailImage:v28 detailImageTintColor:v32];
    id v13 = v81;
    goto LABEL_15;
  }
  if (!v10)
  {
    v83 = v9;
    id v13 = v9;
    v14 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v15 = [v14 firstWeekday];
    v16 = [v13 dateIntervals];
    double v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v13, "maxPickupDateIntervalIndex"));
    uint64_t v18 = [v17 startDate];

    v80 = (__CFString *)v18;
    if (v13) {
      uint64_t v19 = [v14 component:512 fromDate:v18] - 1;
    }
    else {
      uint64_t v19 = 0;
    }
    uint64_t v25 = v15 + v19;
    v82 = [v14 standaloneWeekdaySymbols];
    v26 = objc_msgSend(v82, "objectAtIndexedSubscript:", (v25 - 1) % (unint64_t)objc_msgSend(v82, "count"));
    v27 = +[STScreenTimeSettingsUIBundle bundle];
    v28 = [v27 localizedStringForKey:@"MostPickupsDetailText" value:&stru_26D9391A8 table:0];
    id v29 = [NSString alloc];
    v30 = [MEMORY[0x263EFF960] currentLocale];
    v31 = objc_msgSend(v29, "initWithFormat:locale:", v28, v30, v26, objc_msgSend(v13, "maxPickups"));

    v32 = [v27 localizedStringForKey:@"MostPickupsTitle" value:&stru_26D9391A8 table:0];
    v33 = [STSegmentItem alloc];
    v34 = [MEMORY[0x263F825C8] systemGrayColor];
    v35 = v33;
    v36 = v14;
    uint64_t v86 = [(STSegmentItem *)v35 initWithTitleText:v32 detailText:v31 titleColor:v34 detailImage:0 detailImageTintColor:0];

    v37 = v80;
LABEL_15:

    unint64_t v12 = 0x263F82000uLL;
    uint64_t v11 = &off_264766000;
    uint64_t v9 = v83;
    goto LABEL_16;
  }
  uint64_t v86 = 0;
LABEL_16:
  id v45 = v9;
  v46 = +[STScreenTimeSettingsUIBundle bundle];
  v47 = [v46 localizedStringForKey:@"PickupsCount" value:&stru_26D9391A8 table:0];
  id v48 = [NSString alloc];
  v49 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v50 = [v45 totalPickups];

  v51 = objc_msgSend(v48, "initWithFormat:locale:", v47, v49, v50);
  v52 = [v46 localizedStringForKey:@"TotalPickups" value:&stru_26D9391A8 table:0];
  id v53 = objc_alloc((Class)v11[276]);
  v54 = [*(id *)(v12 + 1480) systemGrayColor];
  v55 = (void *)[v53 initWithTitleText:v52 detailText:v51 titleColor:v54 detailImage:0 detailImageTintColor:0];

  v56 = [(STHistoricalPickupsCell *)self pickupMetricsView];
  v57 = (void *)v86;
  v88[0] = v86;
  v88[1] = v55;
  v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v88 count:2];
  [v56 setSegmentItems:v58];

  v59 = [(STHistoricalPickupsCell *)self contentView];
  v60 = [(STHistoricalPickupsCell *)self firstUsedAfterPickupLabel];
  v61 = [v45 pickupsByTrustIdentifier];
  uint64_t v62 = [v61 count];

  v63 = [v59 subviews];
  int v64 = [v63 containsObject:v60];

  if (!v62 || (v64 & 1) != 0)
  {
    if (v62) {
      int v77 = 0;
    }
    else {
      int v77 = v64;
    }
    v76 = v85;
    if (v77 == 1)
    {
      [v60 removeFromSuperview];
      v78 = [(STHistoricalPickupsCell *)self bottomConstraint];
      [v78 setActive:1];

      [v59 setNeedsUpdateConstraints];
    }
  }
  else
  {
    [v59 addSubview:v60];
    v65 = [(STHistoricalPickupsCell *)self bottomConstraint];
    [v65 setActive:0];

    v84 = _NSDictionaryOfVariableBindings(&cfstr_Pickupmetricsv.isa, v56, v60, 0);
    v66 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[pickupMetricsView]-14.0-[firstUsedAfterPickupLabel]-2.0-|" options:0 metrics:0 views:v84];
    v67 = (void *)[v66 mutableCopy];

    v68 = [(STTableCell *)self contentLayoutGuide];
    v69 = [v68 leadingAnchor];
    [v60 leadingAnchor];
    v71 = v70 = v55;
    v72 = [v69 constraintEqualToAnchor:v71];
    [v67 addObject:v72];

    v73 = [v68 trailingAnchor];
    v74 = [v60 trailingAnchor];
    v75 = [v73 constraintEqualToAnchor:v74];
    [v67 addObject:v75];

    v55 = v70;
    v57 = (void *)v86;

    [MEMORY[0x263F08938] activateConstraints:v67];
    [v59 setNeedsUpdateConstraints];

    v76 = v85;
  }
}

- (STHistoricalUsageViewController)historicalUsageViewController
{
  return (STHistoricalUsageViewController *)objc_getProperty(self, a2, 1224, 1);
}

- (STHorizontallySegmentedView)pickupMetricsView
{
  return (STHorizontallySegmentedView *)objc_getProperty(self, a2, 1232, 1);
}

- (UILabel)firstUsedAfterPickupLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1240, 1);
}

- (NSLayoutConstraint)bottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1248, 1);
}

- (void)setBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_firstUsedAfterPickupLabel, 0);
  objc_storeStrong((id *)&self->_pickupMetricsView, 0);

  objc_storeStrong((id *)&self->_historicalUsageViewController, 0);
}

@end