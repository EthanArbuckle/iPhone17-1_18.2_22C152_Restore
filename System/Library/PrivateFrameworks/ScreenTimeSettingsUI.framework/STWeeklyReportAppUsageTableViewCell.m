@interface STWeeklyReportAppUsageTableViewCell
- (STWeeklyReportAppUsageTableViewCell)initWithUsageReport:(id)a3;
@end

@implementation STWeeklyReportAppUsageTableViewCell

- (STWeeklyReportAppUsageTableViewCell)initWithUsageReport:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STWeeklyReportAppUsageTableViewCell;
  v5 = [(STWeeklyReportAppUsageTableViewCell *)&v13 initWithStyle:0 reuseIdentifier:0];
  if (v5)
  {
    v6 = [[STWeeklyReportAppUsageView alloc] initWithUsageReport:v4 useVibrancy:0];
    [(STWeeklyReportAppUsageView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(STWeeklyReportAppUsageTableViewCell *)v5 contentView];
    [v7 addSubview:v6];

    v8 = [(STWeeklyReportAppUsageTableViewCell *)v5 contentView];
    [v8 sizeToFit];

    v9 = (void *)MEMORY[0x263F08938];
    v10 = [(STWeeklyReportAppUsageTableViewCell *)v5 contentView];
    v11 = objc_msgSend(v9, "st_constraintsForView:equalToView:", v6, v10);
    [v9 activateConstraints:v11];
  }
  return v5;
}

@end