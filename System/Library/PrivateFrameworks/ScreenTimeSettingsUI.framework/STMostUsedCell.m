@interface STMostUsedCell
- (STMostUsedCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIImageView)allowanceIconView;
- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4;
- (void)setValue:(id)a3;
@end

@implementation STMostUsedCell

- (STMostUsedCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v35.receiver = self;
  v35.super_class = (Class)STMostUsedCell;
  v9 = [(STUsageCell *)&v35 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    v11 = [(STMostUsedCell *)v9 contentView];
    uint64_t v12 = objc_opt_new();
    allowanceIconView = v10->_allowanceIconView;
    v10->_allowanceIconView = (UIImageView *)v12;

    [(UIImageView *)v10->_allowanceIconView setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [v8 objectForKeyedSubscript:@"STAllowanceIconKey"];
    [(UIImageView *)v10->_allowanceIconView setImage:v14];

    [v11 addSubview:v10->_allowanceIconView];
    v15 = objc_opt_new();
    v16 = [(STUsageCell *)v10 usageLabel];
    v17 = [v16 trailingAnchor];
    v18 = [(UIImageView *)v10->_allowanceIconView leadingAnchor];
    v19 = [v17 constraintEqualToAnchor:v18 constant:-8.0];
    [v15 addObject:v19];

    v20 = [(UIImageView *)v10->_allowanceIconView centerYAnchor];
    v21 = [v11 centerYAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    [v15 addObject:v22];

    v23 = [(UIImageView *)v10->_allowanceIconView heightAnchor];
    v24 = [v23 constraintEqualToConstant:15.0];
    [v15 addObject:v24];

    v25 = [(UIImageView *)v10->_allowanceIconView widthAnchor];
    v26 = [v25 constraintEqualToConstant:9.0];
    [v15 addObject:v26];

    v27 = [(UIImageView *)v10->_allowanceIconView trailingAnchor];
    v28 = [v11 trailingAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    [v15 addObject:v29];

    v30 = [(UIImageView *)v10->_allowanceIconView leadingAnchor];
    v31 = [(STUsageCell *)v10 itemNameLabel];
    v32 = [v31 trailingAnchor];
    v33 = [v30 constraintGreaterThanOrEqualToAnchor:v32 constant:8.0];
    [v15 addObject:v33];

    [MEMORY[0x263F08938] activateConstraints:v15];
  }

  return v10;
}

- (void)setValue:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)STMostUsedCell;
  id v4 = a3;
  [(STUsageCell *)&v11 setValue:v4];
  v5 = objc_msgSend(v4, "totalUsage", v11.receiver, v11.super_class);

  [v5 doubleValue];
  double v7 = v6;
  if (v6 >= 60.0)
  {
    id v8 = objc_opt_new();
    [v8 setAllowedUnits:96];
    [v8 setUnitsStyle:1];
  }
  else
  {
    id v8 = objc_msgSend(MEMORY[0x263F08780], "st_sharedAbbreviatedSecondsDateFormatter");
  }
  v9 = [v8 stringFromTimeInterval:v7];

  v10 = [(STUsageCell *)self usageLabel];
  [v10 setText:v9];
}

- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)STMostUsedCell;
  id v6 = a3;
  [(PSTableCell *)&v9 reloadWithSpecifier:v6 animated:v4];
  double v7 = objc_msgSend(v6, "objectForKeyedSubscript:", @"STAllowanceIconKey", v9.receiver, v9.super_class);

  id v8 = [(STMostUsedCell *)self allowanceIconView];
  [v8 setImage:v7];
}

- (UIImageView)allowanceIconView
{
  return self->_allowanceIconView;
}

- (void).cxx_destruct
{
}

@end