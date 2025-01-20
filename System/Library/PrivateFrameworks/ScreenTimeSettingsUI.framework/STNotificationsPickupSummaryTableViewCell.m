@interface STNotificationsPickupSummaryTableViewCell
- (STNotificationsPickupSummaryTableViewCell)initWithUsageReport:(id)a3;
@end

@implementation STNotificationsPickupSummaryTableViewCell

- (STNotificationsPickupSummaryTableViewCell)initWithUsageReport:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STNotificationsPickupSummaryTableViewCell;
  v5 = [(STNotificationsPickupSummaryTableViewCell *)&v13 initWithStyle:0 reuseIdentifier:0];
  if (v5)
  {
    v6 = [[STNotificationsPickupSummaryView alloc] initWithUsageReport:v4];
    [(STNotificationsPickupSummaryView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(STNotificationsPickupSummaryTableViewCell *)v5 contentView];
    [v7 addSubview:v6];

    v8 = [(STNotificationsPickupSummaryTableViewCell *)v5 contentView];
    [v8 sizeToFit];

    v9 = (void *)MEMORY[0x263F08938];
    v10 = [(STNotificationsPickupSummaryTableViewCell *)v5 contentView];
    v11 = objc_msgSend(v9, "st_constraintsForView:equalToView:", v10, v6);
    [v9 activateConstraints:v11];
  }
  return v5;
}

@end