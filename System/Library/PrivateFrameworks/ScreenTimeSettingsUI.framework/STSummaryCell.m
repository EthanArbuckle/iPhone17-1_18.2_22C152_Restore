@interface STSummaryCell
- (STNoUsageDataView)noUsageDataView;
- (STSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (_TtC20ScreenTimeSettingsUI27STSummaryCellViewController)summaryCellViewController;
- (id)value;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setValue:(id)a3;
@end

@implementation STSummaryCell

- (STSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v59[11] = *MEMORY[0x263EF8340];
  v58.receiver = self;
  v58.super_class = (Class)STSummaryCell;
  v5 = [(STTableCell *)&v58 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = [[_TtC20ScreenTimeSettingsUI27STSummaryCellViewController alloc] initWithUserAltDSID:0 deviceIdentifier:0];
  summaryCellViewController = v5->_summaryCellViewController;
  v5->_summaryCellViewController = v6;

  v8 = [(STTableCell *)v5 childViewControllers];
  [v8 addObject:v5->_summaryCellViewController];

  v9 = [(STSummaryCellViewController *)v5->_summaryCellViewController view];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = [(STSummaryCell *)v5 contentView];
  [v10 addSubview:v9];
  v11 = [STNoUsageDataView alloc];
  uint64_t v12 = [(STNoUsageDataView *)v11 initWithPreferredFontTextStyle:*MEMORY[0x263F835F0]];
  noUsageDataView = v5->_noUsageDataView;
  v5->_noUsageDataView = (STNoUsageDataView *)v12;

  [(STNoUsageDataView *)v5->_noUsageDataView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(STNoUsageDataView *)v5->_noUsageDataView setHidden:1];
  [v10 addSubview:v5->_noUsageDataView];
  v14 = [(STSummaryCellViewController *)v5->_summaryCellViewController traitCollection];
  v15 = [v14 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v15);

  v17 = [(STTableCell *)v5 contentLayoutGuide];
  v44 = (void *)MEMORY[0x263F08938];
  v18 = [v9 heightAnchor];
  v57 = v18;
  double v19 = 182.0;
  if (IsAccessibilityCategory) {
    double v19 = 300.0;
  }
  v56 = [v18 constraintEqualToConstant:v19];
  v59[0] = v56;
  v55 = [v9 topAnchor];
  v54 = [v10 topAnchor];
  v53 = [v55 constraintEqualToSystemSpacingBelowAnchor:v54 multiplier:2.0];
  v59[1] = v53;
  v51 = [v9 leadingAnchor];
  v50 = [v17 leadingAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v59[2] = v49;
  v52 = v9;
  v48 = [v9 trailingAnchor];
  v47 = [v17 trailingAnchor];
  v46 = [v48 constraintEqualToAnchor:v47];
  v59[3] = v46;
  v45 = [v10 bottomAnchor];
  v43 = [v9 bottomAnchor];
  v42 = [v45 constraintEqualToSystemSpacingBelowAnchor:v43 multiplier:2.0];
  v59[4] = v42;
  v40 = [(STNoUsageDataView *)v5->_noUsageDataView topAnchor];
  v39 = [v10 topAnchor];
  v38 = [v40 constraintGreaterThanOrEqualToAnchor:v39];
  v59[5] = v38;
  v36 = [(STNoUsageDataView *)v5->_noUsageDataView leadingAnchor];
  v41 = v17;
  v35 = [v17 leadingAnchor];
  v34 = [v36 constraintGreaterThanOrEqualToAnchor:v35];
  v59[6] = v34;
  v33 = [(STNoUsageDataView *)v5->_noUsageDataView bottomAnchor];
  v37 = v10;
  v32 = [v10 bottomAnchor];
  v31 = [v33 constraintLessThanOrEqualToAnchor:v32];
  v59[7] = v31;
  v30 = [(STNoUsageDataView *)v5->_noUsageDataView trailingAnchor];
  v20 = [v17 trailingAnchor];
  v21 = [v30 constraintLessThanOrEqualToAnchor:v20];
  v59[8] = v21;
  v22 = [(STNoUsageDataView *)v5->_noUsageDataView centerXAnchor];
  v23 = [v10 centerXAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v59[9] = v24;
  v25 = [(STNoUsageDataView *)v5->_noUsageDataView centerYAnchor];
  v26 = [v10 centerYAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  v59[10] = v27;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:11];
  [v44 activateConstraints:v28];

  return v5;
}

- (id)value
{
  v4.receiver = self;
  v4.super_class = (Class)STSummaryCell;
  v2 = [(PSTableCell *)&v4 value];

  return v2;
}

- (void)setValue:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)STSummaryCell;
  v6 = [(PSTableCell *)&v16 value];
  [v6 removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedWeekUsageReport" context:"KVOContextSTSummaryCell"];
  if (v5 && ([v5 conformsToProtocol:&unk_26D9A24E8] & 1) == 0)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"STSummaryCell.m", 77, @"Invalid parameter not satisfying: %@", @"(coordinator == nil) || [coordinator conformsToProtocol:@protocol(STRootViewModelCoordinator)]" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)STSummaryCell;
  [(PSTableCell *)&v15 setValue:v5];
  v7 = [v5 viewModel];
  v8 = [v7 me];
  v9 = [v8 altDSID];

  v10 = [(STSummaryCell *)self summaryCellViewController];
  v11 = v10;
  if (v9)
  {
    uint64_t v12 = [v5 usageDetailsCoordinator];
    v13 = [v12 selectedDeviceIdentifier];
    [v11 updateWithUserAltDSID:v9 deviceIdentifier:v13];
  }
  else
  {
    [v10 updateWithUserAltDSID:0 deviceIdentifier:0];
  }

  [v5 addObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedWeekUsageReport" options:5 context:"KVOContextSTSummaryCell"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  if (a6 == "KVOContextSTSummaryCell")
  {
    id v12 = a3;
    [(STSummaryCell *)self value];

    int v13 = [v12 isEqualToString:@"usageDetailsCoordinator.viewModel.selectedWeekUsageReport"];
    if (v13)
    {
      v14 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      objc_super v15 = [MEMORY[0x263EFF9D0] null];

      if (v14 == v15)
      {

        v14 = 0;
      }
      [(STSummaryCell *)self _selectedUsageReportDidChange:v14];
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)STSummaryCell;
    id v11 = a3;
    [(STSummaryCell *)&v16 observeValueForKeyPath:v11 ofObject:a4 change:v10 context:a6];
  }
}

- (void)dealloc
{
  v3 = [(STSummaryCell *)self value];
  [(STSummaryCell *)self value];

  [v3 removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedWeekUsageReport" context:"KVOContextSTSummaryCell"];
  v4.receiver = self;
  v4.super_class = (Class)STSummaryCell;
  [(PSTableCell *)&v4 dealloc];
}

- (_TtC20ScreenTimeSettingsUI27STSummaryCellViewController)summaryCellViewController
{
  return (_TtC20ScreenTimeSettingsUI27STSummaryCellViewController *)objc_getProperty(self, a2, 1224, 1);
}

- (STNoUsageDataView)noUsageDataView
{
  return (STNoUsageDataView *)objc_getProperty(self, a2, 1232, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noUsageDataView, 0);

  objc_storeStrong((id *)&self->_summaryCellViewController, 0);
}

@end