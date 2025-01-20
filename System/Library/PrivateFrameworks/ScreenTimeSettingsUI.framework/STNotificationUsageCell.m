@interface STNotificationUsageCell
- (STNotificationUsageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIImageView)notificationDot;
- (void)setValue:(id)a3;
@end

@implementation STNotificationUsageCell

- (STNotificationUsageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v33[4] = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)STNotificationUsageCell;
  v5 = [(STUsageCell *)&v32 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F82828]);
    v7 = [MEMORY[0x263F67408] sharedCache];
    v8 = [MEMORY[0x263F825C8] systemRedColor];
    v9 = [v7 circleImageWithFillColor:v8 fillDiameter:0 outlineColor:9.0 outlineWidth:0.0];
    uint64_t v10 = [v6 initWithImage:v9];
    notificationDot = v5->_notificationDot;
    v5->_notificationDot = (UIImageView *)v10;

    [(UIImageView *)v5->_notificationDot setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v5->_notificationDot setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
    v31 = [(STNotificationUsageCell *)v5 contentView];
    [v31 addSubview:v5->_notificationDot];
    v12 = [(STUsageCell *)v5 usageBarView];
    v23 = (void *)MEMORY[0x263F08938];
    v30 = [(UIImageView *)v5->_notificationDot widthAnchor];
    v29 = [(UIImageView *)v5->_notificationDot heightAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v33[0] = v28;
    v26 = [(UIImageView *)v5->_notificationDot trailingAnchor];
    v27 = v12;
    v25 = [v12 trailingAnchor];
    v24 = [v26 constraintEqualToAnchor:v25 constant:4.0];
    v33[1] = v24;
    v13 = [(UIImageView *)v5->_notificationDot centerYAnchor];
    v14 = [v12 centerYAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v33[2] = v15;
    v16 = [(STUsageCell *)v5 usageLabel];
    v17 = [v16 trailingAnchor];
    v18 = [(STTableCell *)v5 contentLayoutGuide];
    v19 = [v18 trailingAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    v33[3] = v20;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
    [v23 activateConstraints:v21];
  }
  return v5;
}

- (void)setValue:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)STNotificationUsageCell;
  id v4 = a3;
  [(STUsageCell *)&v11 setValue:v4];
  v5 = NSString;
  id v6 = +[STScreenTimeSettingsUIBundle bundle];
  v7 = [v6 localizedStringForKey:@"NotificationsCount" value:&stru_26D9391A8 table:0];
  v8 = [v4 totalUsage];

  v9 = objc_msgSend(v5, "localizedStringWithFormat:", v7, objc_msgSend(v8, "unsignedIntegerValue"));
  uint64_t v10 = [(STUsageCell *)self usageLabel];
  [v10 setText:v9];
}

- (UIImageView)notificationDot
{
  return self->_notificationDot;
}

- (void).cxx_destruct
{
}

@end