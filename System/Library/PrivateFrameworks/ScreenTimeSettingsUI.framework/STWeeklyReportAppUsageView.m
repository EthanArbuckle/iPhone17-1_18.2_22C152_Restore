@interface STWeeklyReportAppUsageView
- (NSMutableArray)topEightImageItems;
- (NSMutableDictionary)dimensionByUsageItem;
- (STUsageReport)report;
- (STWeeklyReportAppUsageView)initWithUsageReport:(id)a3 useVibrancy:(BOOL)a4;
- (UILabel)titleLabel;
- (UIStackView)appImageStackView;
- (id)_appImageSubviewWithImage:(id)a3 dimension:(double)a4;
- (void)_didFetchIcon:(id)a3;
- (void)setAppImageStackView:(id)a3;
- (void)setDimensionByUsageItem:(id)a3;
- (void)setReport:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTopEightImageItems:(id)a3;
@end

@implementation STWeeklyReportAppUsageView

- (STWeeklyReportAppUsageView)initWithUsageReport:(id)a3 useVibrancy:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v83.receiver = self;
  v83.super_class = (Class)STWeeklyReportAppUsageView;
  v8 = -[STWeeklyReportAppUsageView initWithFrame:](&v83, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v9 = v8;
  if (v8)
  {
    id v77 = v7;
    objc_storeStrong((id *)&v8->_report, a3);
    uint64_t v10 = objc_opt_new();
    titleLabel = v9->_titleLabel;
    v9->_titleLabel = (UILabel *)v10;

    v12 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
    [(UILabel *)v9->_titleLabel setFont:v12];

    v13 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v9->_titleLabel setTextColor:v13];

    v14 = NSString;
    v15 = +[STScreenTimeSettingsUIBundle bundle];
    v16 = [v15 localizedStringForKey:@"AppUsageLabel" value:&stru_26D9391A8 table:0];
    v17 = [v14 localizedStringWithFormat:v16];
    [(UILabel *)v9->_titleLabel setText:v17];

    [(UILabel *)v9->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v9->_titleLabel sizeToFit];
    [(STWeeklyReportAppUsageView *)v9 addSubview:v9->_titleLabel];
    v18 = objc_opt_new();
    if (v4)
    {
      v19 = [MEMORY[0x263F82DF0] widgetEffectForVibrancyStyle:102];
      v20 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v19];
      [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(STWeeklyReportAppUsageView *)v9 addSubview:v20];
      v21 = [v20 contentView];
      [v21 addSubview:v9->_titleLabel];
      v22 = [v20 topAnchor];
      v23 = [(STWeeklyReportAppUsageView *)v9 topAnchor];
      v24 = [v22 constraintEqualToAnchor:v23];
      [v18 addObject:v24];

      v25 = [v20 leadingAnchor];
      v26 = [(STWeeklyReportAppUsageView *)v9 leadingAnchor];
      v27 = [v25 constraintEqualToAnchor:v26];
      [v18 addObject:v27];

      v28 = [v20 bottomAnchor];
      v29 = [(STWeeklyReportAppUsageView *)v9 bottomAnchor];
      v30 = [v28 constraintEqualToAnchor:v29];
      [v18 addObject:v30];

      v31 = [v20 trailingAnchor];
      v32 = [(STWeeklyReportAppUsageView *)v9 trailingAnchor];
      v33 = [v31 constraintEqualToAnchor:v32];
      [v18 addObject:v33];

      double v34 = 0.0;
      double v35 = 0.0;
    }
    else
    {
      double v35 = 16.0;
      double v34 = -16.0;
    }
    v36 = [(UILabel *)v9->_titleLabel leadingAnchor];
    v37 = [(STWeeklyReportAppUsageView *)v9 leadingAnchor];
    v38 = [v36 constraintEqualToAnchor:v37 constant:v35];
    [v18 addObject:v38];

    v39 = [(UILabel *)v9->_titleLabel topAnchor];
    v40 = [(STWeeklyReportAppUsageView *)v9 topAnchor];
    v41 = [v39 constraintEqualToAnchor:v40 constant:10.0];
    [v18 addObject:v41];

    uint64_t v42 = objc_opt_new();
    appImageStackView = v9->_appImageStackView;
    v9->_appImageStackView = (UIStackView *)v42;

    [(UIStackView *)v9->_appImageStackView setAlignment:4];
    [(UIStackView *)v9->_appImageStackView setAxis:0];
    [(UIStackView *)v9->_appImageStackView setDistribution:3];
    [(UIStackView *)v9->_appImageStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(STWeeklyReportAppUsageView *)v9 addSubview:v9->_appImageStackView];
    v44 = [(UIStackView *)v9->_appImageStackView topAnchor];
    v45 = [(UILabel *)v9->_titleLabel bottomAnchor];
    v46 = [v44 constraintEqualToAnchor:v45 constant:7.0];
    [v18 addObject:v46];

    v47 = [(UIStackView *)v9->_appImageStackView leadingAnchor];
    v48 = [(STWeeklyReportAppUsageView *)v9 leadingAnchor];
    v49 = [v47 constraintEqualToAnchor:v48 constant:v35];
    [v18 addObject:v49];

    v50 = [(UIStackView *)v9->_appImageStackView trailingAnchor];
    v51 = [(STWeeklyReportAppUsageView *)v9 trailingAnchor];
    v52 = [v50 constraintEqualToAnchor:v51 constant:v34];
    [v18 addObject:v52];

    v53 = [(STWeeklyReportAppUsageView *)v9 bottomAnchor];
    v54 = [(UIStackView *)v9->_appImageStackView bottomAnchor];
    v55 = [v53 constraintEqualToAnchor:v54 constant:16.0];
    [v18 addObject:v55];

    [MEMORY[0x263F08938] activateConstraints:v18];
    v56 = [(STUsageReport *)v9->_report topUsageItemsWithMaxCount:8 type:2 includeAggregateItem:0 nonAggregateItems:0 darkColors:0];
    v76 = v18;
    if ([v56 count])
    {
      v57 = objc_msgSend(MEMORY[0x263F67408], "sharedCache", v18);
    }
    else
    {
      v57 = 0;
    }
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id obj = v56;
    uint64_t v58 = [obj countByEnumeratingWithState:&v79 objects:v84 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v80;
      double v61 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v59; ++i)
        {
          if (*(void *)v80 != v60) {
            objc_enumerationMutation(obj);
          }
          v63 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          if (v61 == 0.0)
          {
            v64 = [*(id *)(*((void *)&v79 + 1) + 8 * i) totalUsage];
            [v64 doubleValue];
            double v61 = v65;
          }
          v66 = objc_msgSend(v63, "totalUsage", v76);
          [v66 doubleValue];
          double v68 = v67;

          if (v61 <= 0.0 || (double v69 = v68 / v61 * 40.0, v70 = 15.0, v69 >= 15.0) && (v70 = v69, v69 > 40.0)) {
            double v70 = 40.0;
          }
          v71 = [v63 image];
          if (v71)
          {
            v72 = [(STWeeklyReportAppUsageView *)v9 _appImageSubviewWithImage:v71 dimension:v70];
            [(UIStackView *)v9->_appImageStackView addArrangedSubview:v72];
            [(NSMutableArray *)v9->_topEightImageItems addObject:v63];
            v73 = [NSNumber numberWithDouble:v70];
            [(NSMutableDictionary *)v9->_dimensionByUsageItem setObject:v73 forKeyedSubscript:v63];
          }
          v74 = [v63 budgetItemIdentifier];
          [v57 addObserver:v9 selector:sel__didFetchIcon_ bundleIdentifier:v74];
        }
        uint64_t v59 = [obj countByEnumeratingWithState:&v79 objects:v84 count:16];
      }
      while (v59);
    }

    id v7 = v77;
  }

  return v9;
}

- (void)_didFetchIcon:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v27 = [a3 userInfo];
  BOOL v4 = [v27 objectForKeyedSubscript:*MEMORY[0x263F67420]];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [(STWeeklyReportAppUsageView *)self topEightImageItems];
  uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      uint64_t v8 = 0;
      uint64_t v28 = v6;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
        uint64_t v10 = [v9 budgetItemIdentifier];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          v12 = [v9 image];
          if (v12)
          {
            v13 = [(STWeeklyReportAppUsageView *)self topEightImageItems];
            uint64_t v14 = [v13 indexOfObject:v9];

            v15 = [(STWeeklyReportAppUsageView *)self appImageStackView];
            [v15 arrangedSubviews];
            uint64_t v16 = v7;
            v18 = v17 = v4;
            v19 = [v18 objectAtIndexedSubscript:v14];

            v20 = [(STWeeklyReportAppUsageView *)self appImageStackView];
            [v20 removeArrangedSubview:v19];

            [v19 removeFromSuperview];
            v21 = [(STWeeklyReportAppUsageView *)self dimensionByUsageItem];
            v22 = [v21 objectForKeyedSubscript:v9];
            [v22 doubleValue];
            double v24 = v23;

            v25 = [(STWeeklyReportAppUsageView *)self _appImageSubviewWithImage:v12 dimension:v24];
            v26 = [(STWeeklyReportAppUsageView *)self appImageStackView];
            [v26 insertArrangedSubview:v25 atIndex:v14];

            BOOL v4 = v17;
            uint64_t v7 = v16;
            uint64_t v6 = v28;
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v6);
  }
}

- (id)_appImageSubviewWithImage:(id)a3 dimension:(double)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v5];

  objc_msgSend(v7, "setSize:", a4, a4);
  [v6 addSubview:v7];
  uint64_t v8 = (void *)MEMORY[0x263F08938];
  v9 = [v7 centerXAnchor];
  uint64_t v10 = [v6 centerXAnchor];
  int v11 = [v9 constraintEqualToAnchor:v10];
  v17[0] = v11;
  v12 = [v7 bottomAnchor];
  v13 = [v6 bottomAnchor];
  uint64_t v14 = [v12 constraintEqualToAnchor:v13];
  v17[1] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  [v8 activateConstraints:v15];

  return v6;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIStackView)appImageStackView
{
  return self->_appImageStackView;
}

- (void)setAppImageStackView:(id)a3
{
}

- (STUsageReport)report
{
  return self->_report;
}

- (void)setReport:(id)a3
{
}

- (NSMutableArray)topEightImageItems
{
  return self->_topEightImageItems;
}

- (void)setTopEightImageItems:(id)a3
{
}

- (NSMutableDictionary)dimensionByUsageItem
{
  return self->_dimensionByUsageItem;
}

- (void)setDimensionByUsageItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimensionByUsageItem, 0);
  objc_storeStrong((id *)&self->_topEightImageItems, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_appImageStackView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end