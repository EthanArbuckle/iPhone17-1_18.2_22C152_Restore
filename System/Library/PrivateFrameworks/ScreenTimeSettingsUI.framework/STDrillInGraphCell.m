@interface STDrillInGraphCell
- (STDrillInGraphCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (STUsageGraphViewController)usageGraphViewController;
- (STUsageItem)usageItem;
- (UILabel)usageLabel;
- (void)setValue:(id)a3;
@end

@implementation STDrillInGraphCell

- (STDrillInGraphCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v51[6] = *MEMORY[0x263EF8340];
  id v9 = a5;
  v50.receiver = self;
  v50.super_class = (Class)STDrillInGraphCell;
  v10 = [(STTableCell *)&v50 initWithStyle:a3 reuseIdentifier:a4 specifier:v9];
  if (v10)
  {
    id v49 = v9;
    uint64_t v11 = [v9 objectForKeyedSubscript:@"SpecifierKeyDrillInItem"];
    usageItem = v10->_usageItem;
    v10->_usageItem = (STUsageItem *)v11;

    if (!v10->_usageItem)
    {
      v33 = [MEMORY[0x263F08690] currentHandler];
      [v33 handleFailureInMethod:a2, v10, @"STDrillInGraphCell.m", 31, @"Invalid parameter not satisfying: %@", @"_usageItem" object file lineNumber description];
    }
    v13 = objc_opt_new();
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v14 = objc_opt_new();
    usageLabel = v10->_usageLabel;
    v10->_usageLabel = (UILabel *)v14;

    [(UILabel *)v10->_usageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835E0]];
    [(UILabel *)v10->_usageLabel setFont:v16];

    [v13 addSubview:v10->_usageLabel];
    v17 = v13;
    v18 = [[STUsageGraphViewController alloc] initWithTitleView:v13 graphHeight:1 includePaddle:0 useVibrancy:90.0];
    usageGraphViewController = v10->_usageGraphViewController;
    v10->_usageGraphViewController = v18;

    v20 = [(STUsageGraphViewController *)v10->_usageGraphViewController view];
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

    v21 = [(STTableCell *)v10 childViewControllers];
    [v21 addObject:v10->_usageGraphViewController];

    v22 = [(STUsageGraphViewController *)v10->_usageGraphViewController view];
    v23 = [(STDrillInGraphCell *)v10 contentView];
    [v23 addSubview:v22];
    v42 = [(STTableCell *)v10 contentLayoutGuide];
    v38 = (void *)MEMORY[0x263F08938];
    v47 = [(UILabel *)v10->_usageLabel leadingAnchor];
    v48 = v17;
    v46 = [v17 leadingAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v51[0] = v45;
    v44 = [(UILabel *)v10->_usageLabel bottomAnchor];
    v43 = [v17 bottomAnchor];
    v41 = [v44 constraintEqualToAnchor:v43];
    v51[1] = v41;
    v40 = [v22 centerXAnchor];
    v37 = v23;
    v39 = [v23 centerXAnchor];
    v36 = [v40 constraintEqualToAnchor:v39];
    v51[2] = v36;
    v35 = [v22 widthAnchor];
    v34 = [v42 widthAnchor];
    v24 = [v35 constraintEqualToAnchor:v34];
    v51[3] = v24;
    v25 = [v22 topAnchor];
    v26 = [v23 topAnchor];
    v27 = [v25 constraintEqualToAnchor:v26 constant:18.0];
    v51[4] = v27;
    v28 = [v23 bottomAnchor];
    v29 = [v22 bottomAnchor];
    v30 = [v28 constraintEqualToSystemSpacingBelowAnchor:v29 multiplier:2.0];
    v51[5] = v30;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:6];
    [v38 activateConstraints:v31];

    id v9 = v49;
  }

  return v10;
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  v5 = [(PSTableCell *)self value];

  v43.receiver = self;
  v43.super_class = (Class)STDrillInGraphCell;
  [(PSTableCell *)&v43 setValue:v4];
  v6 = [(STDrillInGraphCell *)self usageItem];
  v7 = [v4 dataSetWithUsageItem:v6];
  uint64_t v8 = [v7 itemType];
  if ((unint64_t)(v8 - 1) < 4)
  {
    id v9 = [(STDrillInGraphCell *)self usageLabel];
    [v9 setAttributedText:0];
    id v10 = [v7 total];
    [v10 doubleValue];
    double v12 = v11;
    if (v11 >= 60.0)
    {
      v13 = objc_opt_new();
      [v13 setAllowedUnits:96];
      [v13 setUnitsStyle:1];
    }
    else
    {
      v13 = objc_msgSend(MEMORY[0x263F08780], "st_sharedAbbreviatedSecondsDateFormatter");
    }
    v25 = [v13 stringFromTimeInterval:v12];

    [v9 setText:v25];
LABEL_13:

    goto LABEL_14;
  }
  if (v8 == 6)
  {
    uint64_t v14 = [v4 dateIntervals];
    unint64_t v15 = [v14 count];

    v16 = [v6 totalUsage];
    [v16 doubleValue];
    double v18 = (double)v15;
    if (!v15) {
      double v18 = 1.0;
    }
    double v19 = v17 / v18;

    v40 = v5;
    unint64_t v20 = (unint64_t)fmin(round(v19), 1.84467441e19);
    id v9 = +[STScreenTimeSettingsUIBundle bundle];
    v41 = v6;
    v21 = NSString;
    v22 = [v9 localizedStringForKey:@"PickupsCount" value:&stru_26D9391A8 table:0];
    v23 = objc_msgSend(v21, "localizedStringWithFormat:", v22, v20);

    if ([v4 type] == 1) {
      v24 = @"HourlyPickupsFormat";
    }
    else {
      v24 = @"DailyPickupsFormat";
    }
    v25 = [v9 localizedStringForKey:v24 value:&stru_26D9391A8 table:0];
    v26 = objc_msgSend(NSString, "localizedStringWithFormat:", v25, v20, v23);
    v39 = [(STDrillInGraphCell *)self usageLabel];
    [v39 setText:0];
    v27 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835E0]];
    v38 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    v28 = (objc_class *)MEMORY[0x263F089B8];
    id v42 = v27;
    id v10 = v23;
    id v29 = v26;
    v30 = (void *)[[v28 alloc] initWithString:v29];
    [v30 beginEditing];
    uint64_t v31 = *MEMORY[0x263F814F0];
    objc_msgSend(v30, "addAttribute:value:range:", *MEMORY[0x263F814F0], v38, 0, objc_msgSend(v29, "length"));
    uint64_t v32 = [v29 rangeOfString:v10];
    uint64_t v37 = v33;

    uint64_t v34 = v31;
    v6 = v41;
    uint64_t v35 = v32;
    v5 = v40;
    objc_msgSend(v30, "addAttribute:value:range:", v34, v42, v35, v37);

    [v30 endEditing];
    [v39 setAttributedText:v30];

    goto LABEL_13;
  }
LABEL_14:
  v36 = [(STDrillInGraphCell *)self usageGraphViewController];
  [v36 setDataSet:v7 animated:v5 != 0];
}

- (UILabel)usageLabel
{
  return self->_usageLabel;
}

- (STUsageGraphViewController)usageGraphViewController
{
  return self->_usageGraphViewController;
}

- (STUsageItem)usageItem
{
  return self->_usageItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageItem, 0);
  objc_storeStrong((id *)&self->_usageGraphViewController, 0);

  objc_storeStrong((id *)&self->_usageLabel, 0);
}

@end