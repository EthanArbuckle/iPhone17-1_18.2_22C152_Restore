@interface STHistoricalScreenTimeCell
- (STHistoricalScreenTimeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (STHistoricalUsageViewController)historicalUsageViewController;
- (STHorizontallySegmentedView)topItemsView;
- (id)value;
- (void)_currentViewModeDidChangeFrom:(int64_t)a3 to:(int64_t)a4;
- (void)_handleEffectiveChangeForViewMode:(int64_t)a3 hasMultilineLayout:(BOOL)a4 numberOfLines:(unint64_t)a5;
- (void)_hasMulitlineLayoutDidChangeFrom:(BOOL)a3 to:(BOOL)a4;
- (void)_numberOfLinesDidChangeFrom:(unint64_t)a3 to:(unint64_t)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setValue:(id)a3;
@end

@implementation STHistoricalScreenTimeCell

- (STHistoricalScreenTimeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v30.receiver = self;
  v30.super_class = (Class)STHistoricalScreenTimeCell;
  v5 = [(STTableCell *)&v30 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  uint64_t v6 = +[STHistoricalUsageViewController historicalUsageViewControllerOfType:1 graphHeight:90.0];
  historicalUsageViewController = v5->_historicalUsageViewController;
  v5->_historicalUsageViewController = (STHistoricalUsageViewController *)v6;

  v8 = [(STTableCell *)v5 childViewControllers];
  [v8 addObject:v5->_historicalUsageViewController];

  uint64_t v9 = objc_opt_new();
  topItemsView = v5->_topItemsView;
  v5->_topItemsView = (STHorizontallySegmentedView *)v9;

  [(STHorizontallySegmentedView *)v5->_topItemsView setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = [(STHistoricalScreenTimeCell *)v5 contentView];
  v12 = [(STHistoricalUsageViewController *)v5->_historicalUsageViewController view];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v11 addSubview:v12];
  [v11 addSubview:v5->_topItemsView];
  v29 = _NSDictionaryOfVariableBindings(&cfstr_Historicalusag_1.isa, v12, v5->_topItemsView, 0);
  v13 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[historicalUsageView][_topItemsView]-11.0-|" options:0 metrics:0 views:v29];
  v14 = (void *)[v13 mutableCopy];

  v15 = [(STTableCell *)v5 contentLayoutGuide];
  v16 = [v15 leadingAnchor];
  v17 = [v12 leadingAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  [v14 addObject:v18];

  v19 = [v15 trailingAnchor];
  v20 = [v12 trailingAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  [v14 addObject:v21];

  v22 = [v15 leadingAnchor];
  v23 = [(STHorizontallySegmentedView *)v5->_topItemsView leadingAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  [v14 addObject:v24];

  v25 = [v15 trailingAnchor];
  v26 = [(STHorizontallySegmentedView *)v5->_topItemsView trailingAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  [v14 addObject:v27];

  [MEMORY[0x263F08938] activateConstraints:v14];
  [(STHistoricalUsageViewController *)v5->_historicalUsageViewController addObserver:v5 forKeyPath:@"titleView.hasMultilineLayout" options:3 context:"KVOContextHistoricalScreenTimeCell"];
  [(STHistoricalUsageViewController *)v5->_historicalUsageViewController addObserver:v5 forKeyPath:@"currentViewMode" options:3 context:"KVOContextHistoricalScreenTimeCell"];
  [(STHorizontallySegmentedView *)v5->_topItemsView addObserver:v5 forKeyPath:@"numberOfLines" options:3 context:"KVOContextHistoricalScreenTimeCell"];

  return v5;
}

- (void)dealloc
{
  [(STHistoricalUsageViewController *)self->_historicalUsageViewController removeObserver:self forKeyPath:@"titleView.hasMultilineLayout" context:"KVOContextHistoricalScreenTimeCell"];
  [(STHistoricalUsageViewController *)self->_historicalUsageViewController removeObserver:self forKeyPath:@"currentViewMode" context:"KVOContextHistoricalScreenTimeCell"];
  [(STHorizontallySegmentedView *)self->_topItemsView removeObserver:self forKeyPath:@"numberOfLines" context:"KVOContextHistoricalScreenTimeCell"];
  v3.receiver = self;
  v3.super_class = (Class)STHistoricalScreenTimeCell;
  [(PSTableCell *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a6 == "KVOContextHistoricalScreenTimeCell")
  {
    [(STHistoricalScreenTimeCell *)self historicalUsageViewController];

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
      -[STHistoricalScreenTimeCell _currentViewModeDidChangeFrom:to:](self, "_currentViewModeDidChangeFrom:to:", [v12 integerValue], objc_msgSend(v14, "integerValue"));
    }
    else
    {
      [(STHistoricalScreenTimeCell *)self historicalUsageViewController];

      if ([v10 isEqualToString:@"titleView.hasMultilineLayout"])
      {
        v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
        v16 = [MEMORY[0x263EFF9D0] null];

        if (v12 == v16)
        {

          v12 = 0;
        }
        v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
        v17 = [MEMORY[0x263EFF9D0] null];

        if (v14 == v17)
        {

          v14 = 0;
        }
        -[STHistoricalScreenTimeCell _hasMulitlineLayoutDidChangeFrom:to:](self, "_hasMulitlineLayoutDidChangeFrom:to:", [v12 BOOLValue], objc_msgSend(v14, "BOOLValue"));
      }
      else
      {
        [(STHistoricalScreenTimeCell *)self topItemsView];

        if (![v10 isEqualToString:@"numberOfLines"]) {
          goto LABEL_22;
        }
        v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
        v18 = [MEMORY[0x263EFF9D0] null];

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
        -[STHistoricalScreenTimeCell _numberOfLinesDidChangeFrom:to:](self, "_numberOfLinesDidChangeFrom:to:", [v12 unsignedIntegerValue], objc_msgSend(v14, "unsignedIntegerValue"));
      }
    }

    goto LABEL_22;
  }
  v20.receiver = self;
  v20.super_class = (Class)STHistoricalScreenTimeCell;
  [(STHistoricalScreenTimeCell *)&v20 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
LABEL_22:
}

- (void)_currentViewModeDidChangeFrom:(int64_t)a3 to:(int64_t)a4
{
  if (a3 != a4)
  {
    v7 = [(STHistoricalScreenTimeCell *)self historicalUsageViewController];
    v8 = [v7 titleView];
    uint64_t v9 = [v8 hasMultilineLayout];

    id v10 = [(STHistoricalScreenTimeCell *)self topItemsView];
    id v11 = [v10 numberOfLines];
    uint64_t v12 = [v11 unsignedIntegerValue];

    [(STHistoricalScreenTimeCell *)self _handleEffectiveChangeForViewMode:a4 hasMultilineLayout:v9 numberOfLines:v12];
  }
}

- (void)_hasMulitlineLayoutDidChangeFrom:(BOOL)a3 to:(BOOL)a4
{
  if (a3 != a4)
  {
    BOOL v5 = a4;
    v7 = [(STHistoricalScreenTimeCell *)self historicalUsageViewController];
    uint64_t v8 = [v7 currentViewMode];

    uint64_t v9 = [(STHistoricalScreenTimeCell *)self topItemsView];
    id v10 = [v9 numberOfLines];
    uint64_t v11 = [v10 unsignedIntegerValue];

    [(STHistoricalScreenTimeCell *)self _handleEffectiveChangeForViewMode:v8 hasMultilineLayout:v5 numberOfLines:v11];
  }
}

- (void)_numberOfLinesDidChangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  if (a3 != a4)
  {
    id v10 = [(STHistoricalScreenTimeCell *)self historicalUsageViewController];
    uint64_t v7 = [v10 currentViewMode];
    uint64_t v8 = [v10 titleView];
    uint64_t v9 = [v8 hasMultilineLayout];

    [(STHistoricalScreenTimeCell *)self _handleEffectiveChangeForViewMode:v7 hasMultilineLayout:v9 numberOfLines:a4];
  }
}

- (void)_handleEffectiveChangeForViewMode:(int64_t)a3 hasMultilineLayout:(BOOL)a4 numberOfLines:(unint64_t)a5
{
  BOOL v6 = a4;
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
  id v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"SpecifierIdentifierHistoricalScreenTimeCell-%lu-%d-%lu", a3, v6, a5);
  uint64_t v12 = @"HistoricalScreenTimeSpecifierIdentifier";
  v13[0] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v9 postNotificationName:@"HistoricalScreenTimeSpecifierIdentifierDidChange" object:self userInfo:v11];

  [(STHistoricalScreenTimeCell *)self setNeedsUpdateConstraints];
  [v9 postNotificationName:0x26D941B88 object:self];
}

- (id)value
{
  v4.receiver = self;
  v4.super_class = (Class)STHistoricalScreenTimeCell;
  v2 = [(PSTableCell *)&v4 value];

  return v2;
}

- (void)setValue:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = v5;
  if (v5 && ([v5 conformsToProtocol:&unk_26D9A2F30] & 1) == 0)
  {
    objc_super v30 = [MEMORY[0x263F08690] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"STHistoricalScreenTimeCell.m", 155, @"Invalid parameter not satisfying: %@", @"(coordinator == nil) || [coordinator conformsToProtocol:@protocol(STUsageDetailsViewModelCoordinator)]" object file lineNumber description];
  }
  v40.receiver = self;
  v40.super_class = (Class)STHistoricalScreenTimeCell;
  [(PSTableCell *)&v40 setValue:v6];
  v32 = self;
  uint64_t v7 = [(STHistoricalScreenTimeCell *)self historicalUsageViewController];
  [v7 setCoordinator:v6];

  uint64_t v8 = [v6 viewModel];
  uint64_t v9 = [v8 selectedUsageReport];

  id v10 = [v9 topUsageItemsWithMaxCount:3 type:3 includeAggregateItem:0 nonAggregateItems:0 darkColors:0];
  v33 = v6;
  if (![v10 count])
  {
    uint64_t v11 = [v9 topUsageItemsWithMaxCount:3 type:2 includeAggregateItem:0 nonAggregateItems:0 darkColors:0];

    id v10 = (void *)v11;
  }
  v31 = v9;
  v35 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v17 = [v16 totalUsage];
        [v17 doubleValue];
        double v19 = v18;

        objc_super v20 = [STSegmentItem alloc];
        v21 = [v16 displayName];
        if (v19 >= 60.0)
        {
          v22 = objc_opt_new();
          [v22 setAllowedUnits:96];
          [v22 setUnitsStyle:1];
          uint64_t v23 = 96;
        }
        else
        {
          v22 = objc_msgSend(MEMORY[0x263F08780], "st_sharedAbbreviatedSecondsDateFormatter");
          uint64_t v23 = 128;
        }
        v24 = [v22 stringFromTimeInterval:v19];

        v25 = [v16 color];
        v26 = [(STSegmentItem *)v20 initWithTitleText:v21 detailText:v24 titleColor:v25 detailImage:0 detailImageTintColor:0];

        v27 = objc_opt_new();
        [v27 setAllowedUnits:v23];
        [v27 setUnitsStyle:3];
        v28 = [v27 stringFromTimeInterval:v19];

        [(STSegmentItem *)v26 setAccessibilityText:v28];
        [v35 addObject:v26];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v13);
  }

  v29 = [(STHistoricalScreenTimeCell *)v32 topItemsView];
  [v29 setSegmentItems:v35];
}

- (STHistoricalUsageViewController)historicalUsageViewController
{
  return (STHistoricalUsageViewController *)objc_getProperty(self, a2, 1224, 1);
}

- (STHorizontallySegmentedView)topItemsView
{
  return (STHorizontallySegmentedView *)objc_getProperty(self, a2, 1232, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topItemsView, 0);

  objc_storeStrong((id *)&self->_historicalUsageViewController, 0);
}

@end