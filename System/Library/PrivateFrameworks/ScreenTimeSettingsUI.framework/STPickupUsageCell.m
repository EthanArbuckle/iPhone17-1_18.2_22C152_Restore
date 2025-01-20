@interface STPickupUsageCell
- (STPickupUsageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)setValue:(id)a3;
@end

@implementation STPickupUsageCell

- (STPickupUsageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)STPickupUsageCell;
  v5 = [(STUsageCell *)&v13 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(STPickupUsageCell *)v5 contentView];
    v8 = [v7 trailingAnchor];
    v9 = [(STUsageCell *)v6 usageLabel];
    v10 = [v9 trailingAnchor];
    v11 = [v8 constraintEqualToSystemSpacingAfterAnchor:v10 multiplier:2.0];
    [v11 setActive:1];
  }
  return v6;
}

- (void)setValue:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)STPickupUsageCell;
  id v4 = a3;
  [(STUsageCell *)&v11 setValue:v4];
  v5 = NSString;
  v6 = +[STScreenTimeSettingsUIBundle bundle];
  v7 = [v6 localizedStringForKey:@"PickupsCount" value:&stru_26D9391A8 table:0];
  v8 = [v4 totalUsage];

  v9 = objc_msgSend(v5, "localizedStringWithFormat:", v7, objc_msgSend(v8, "unsignedIntegerValue"));
  v10 = [(STUsageCell *)self usageLabel];
  [v10 setText:v9];
}

@end