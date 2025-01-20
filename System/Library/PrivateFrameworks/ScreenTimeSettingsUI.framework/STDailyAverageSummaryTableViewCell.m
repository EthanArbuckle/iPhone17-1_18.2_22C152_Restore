@interface STDailyAverageSummaryTableViewCell
- (STDailyAverageSummaryTableViewCell)initWithUsageReport:(id)a3;
- (STDailyAverageView)dailyAverageView;
- (STHorizontallySegmentedView)topItemsView;
- (STUsageGraphViewController)usageGraphViewController;
- (STUsageSummaryTitleView)titleView;
- (void)_layoutDidChangeFrom:(BOOL)a3 to:(BOOL)a4;
- (void)_numberOfLinesDidChangeFrom:(unint64_t)a3 to:(unint64_t)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation STDailyAverageSummaryTableViewCell

- (STDailyAverageSummaryTableViewCell)initWithUsageReport:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)STDailyAverageSummaryTableViewCell;
  v5 = [(STTableCell *)&v49 initWithStyle:0 reuseIdentifier:0 specifier:0];
  v6 = [[STUsageSummaryTitleView alloc] initWithVibrancy:0 usageItemType:1 truncateAverageLabel:0];
  titleView = v5->_titleView;
  v5->_titleView = v6;

  [(STUsageSummaryTitleView *)v5->_titleView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(STUsageSummaryTitleView *)v5->_titleView setUsageReport:v4];
  v8 = [[STUsageGraphViewController alloc] initWithTitleView:v5->_titleView graphHeight:0 includePaddle:0 useVibrancy:90.0];
  usageGraphViewController = v5->_usageGraphViewController;
  v5->_usageGraphViewController = v8;

  v10 = [v4 categoryUsageDataSet];
  [(STUsageGraphViewController *)v5->_usageGraphViewController setDataSet:v10];

  v11 = [(STTableCell *)v5 childViewControllers];
  [v11 addObject:v5->_usageGraphViewController];

  v12 = [(STUsageGraphViewController *)v5->_usageGraphViewController view];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = [(STDailyAverageSummaryTableViewCell *)v5 contentView];
  id firstValue = v12;
  [v13 addSubview:v12];
  uint64_t v14 = objc_opt_new();
  topItemsView = v5->_topItemsView;
  v5->_topItemsView = (STHorizontallySegmentedView *)v14;

  [(STHorizontallySegmentedView *)v5->_topItemsView setTranslatesAutoresizingMaskIntoConstraints:0];
  v42 = v5;
  v40 = v13;
  [v13 addSubview:v5->_topItemsView];
  v16 = [v4 topUsageItemsWithMaxCount:3 type:3 includeAggregateItem:0 nonAggregateItems:0 darkColors:0];
  v43 = v4;
  if (![v16 count])
  {
    uint64_t v17 = [v4 topUsageItemsWithMaxCount:3 type:2 includeAggregateItem:0 nonAggregateItems:0 darkColors:0];

    v16 = (void *)v17;
  }
  v18 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v16, "count"));
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v16;
  uint64_t v19 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v46 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v24 = [STSegmentItem alloc];
        v25 = [v23 displayName];
        v26 = [v23 totalUsage];
        [v26 doubleValue];
        double v28 = v27;
        if (v27 >= 60.0)
        {
          v29 = objc_opt_new();
          [v29 setAllowedUnits:96];
          [v29 setUnitsStyle:1];
        }
        else
        {
          v29 = objc_msgSend(MEMORY[0x263F08780], "st_sharedAbbreviatedSecondsDateFormatter");
        }
        v30 = [v29 stringFromTimeInterval:v28];

        v31 = [v23 color];
        v32 = [(STSegmentItem *)v24 initWithTitleText:v25 detailText:v30 titleColor:v31 detailImage:0 detailImageTintColor:0];

        [v18 addObject:v32];
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v20);
  }

  v33 = v42;
  [(STHorizontallySegmentedView *)v42->_topItemsView setSegmentItems:v18];
  v34 = _NSDictionaryOfVariableBindings(&cfstr_GraphviewTopit.isa, firstValue, v42->_topItemsView, 0);
  v35 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-[graphView]-|" options:0 metrics:0 views:v34];
  v36 = (void *)[v35 mutableCopy];

  v37 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-[_topItemsView]-|" options:0 metrics:0 views:v34];
  [v36 addObjectsFromArray:v37];

  v38 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-14.0-[graphView]-9.0-[_topItemsView]-11.0-|" options:0 metrics:0 views:v34];
  [v36 addObjectsFromArray:v38];

  [MEMORY[0x263F08938] activateConstraints:v36];
  [(STUsageSummaryTitleView *)v33->_titleView addObserver:v33 forKeyPath:@"hasMultilineLayout" options:3 context:"KVOContextDailyAverageSummaryTableViewCell"];
  [(STHorizontallySegmentedView *)v33->_topItemsView addObserver:v33 forKeyPath:@"numberOfLines" options:3 context:"KVOContextDailyAverageSummaryTableViewCell"];

  return v42;
}

- (void)dealloc
{
  [(STUsageSummaryTitleView *)self->_titleView removeObserver:self forKeyPath:@"hasMultilineLayout" context:"KVOContextDailyAverageSummaryTableViewCell"];
  [(STHorizontallySegmentedView *)self->_topItemsView removeObserver:self forKeyPath:@"numberOfLines" context:"KVOContextDailyAverageSummaryTableViewCell"];
  v3.receiver = self;
  v3.super_class = (Class)STDailyAverageSummaryTableViewCell;
  [(PSTableCell *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a6 == "KVOContextDailyAverageSummaryTableViewCell")
  {
    if ([v10 isEqualToString:@"numberOfLines"])
    {
      v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      v13 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v13)
      {

        v12 = 0;
      }
      uint64_t v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v15 = [MEMORY[0x263EFF9D0] null];

      if (v14 == v15)
      {

        uint64_t v14 = 0;
      }
      -[STDailyAverageSummaryTableViewCell _numberOfLinesDidChangeFrom:to:](self, "_numberOfLinesDidChangeFrom:to:", [v12 unsignedIntegerValue], objc_msgSend(v14, "unsignedIntegerValue"));
    }
    else
    {
      if (![v10 isEqualToString:@"hasMultilineLayout"]) {
        goto LABEL_16;
      }
      v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      v16 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v16)
      {

        v12 = 0;
      }
      uint64_t v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      uint64_t v17 = [MEMORY[0x263EFF9D0] null];

      if (v14 == v17)
      {

        uint64_t v14 = 0;
      }
      -[STDailyAverageSummaryTableViewCell _layoutDidChangeFrom:to:](self, "_layoutDidChangeFrom:to:", [v12 BOOLValue], objc_msgSend(v14, "BOOLValue"));
    }

    goto LABEL_16;
  }
  v18.receiver = self;
  v18.super_class = (Class)STDailyAverageSummaryTableViewCell;
  [(STDailyAverageSummaryTableViewCell *)&v18 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
LABEL_16:
}

- (void)_numberOfLinesDidChangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  if (a3 != a4)
  {
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"HeightDidChange" object:self];
  }
}

- (void)_layoutDidChangeFrom:(BOOL)a3 to:(BOOL)a4
{
  if (a3 != a4)
  {
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"HeightDidChange" object:self];
  }
}

- (STDailyAverageView)dailyAverageView
{
  return (STDailyAverageView *)objc_getProperty(self, a2, 1224, 1);
}

- (STUsageSummaryTitleView)titleView
{
  return (STUsageSummaryTitleView *)objc_getProperty(self, a2, 1232, 1);
}

- (STUsageGraphViewController)usageGraphViewController
{
  return (STUsageGraphViewController *)objc_getProperty(self, a2, 1240, 1);
}

- (STHorizontallySegmentedView)topItemsView
{
  return (STHorizontallySegmentedView *)objc_getProperty(self, a2, 1248, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topItemsView, 0);
  objc_storeStrong((id *)&self->_usageGraphViewController, 0);
  objc_storeStrong((id *)&self->_titleView, 0);

  objc_storeStrong((id *)&self->_dailyAverageView, 0);
}

@end