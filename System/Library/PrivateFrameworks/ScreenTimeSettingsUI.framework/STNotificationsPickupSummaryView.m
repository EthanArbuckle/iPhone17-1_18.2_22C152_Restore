@interface STNotificationsPickupSummaryView
- (STNotificationsPickupSummaryView)initWithUsageReport:(id)a3;
- (STUsageReport)usageReport;
- (UIStackView)stackView;
- (id)_attributedString:(id)a3 withFont:(id)a4;
- (id)_attributedStringForNotificationsDetailText;
- (id)_attributedStringForNotificationsTitle;
- (id)_attributedStringForPickUpDetailText;
- (id)_attributedStringForPickUpTitle;
- (void)setStackView:(id)a3;
- (void)setUsageReport:(id)a3;
@end

@implementation STNotificationsPickupSummaryView

- (STNotificationsPickupSummaryView)initWithUsageReport:(id)a3
{
  v40[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v39.receiver = self;
  v39.super_class = (Class)STNotificationsPickupSummaryView;
  v6 = -[STNotificationsPickupSummaryView initWithFrame:](&v39, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_usageReport, a3);
    uint64_t v8 = objc_opt_new();
    stackView = v7->_stackView;
    v7->_stackView = (UIStackView *)v8;

    v10 = [MEMORY[0x263F825C8] tableSeparatorLightColor];
    [(STNotificationsPickupSummaryView *)v7 setBackgroundColor:v10];

    [(UIStackView *)v7->_stackView setAxis:0];
    [(UIStackView *)v7->_stackView setAlignment:0];
    [(UIStackView *)v7->_stackView setDistribution:1];
    [(UIStackView *)v7->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [STSummationView alloc];
    [(STNotificationsPickupSummaryView *)v7 _attributedStringForNotificationsTitle];
    v12 = id v38 = v5;
    v13 = [(STNotificationsPickupSummaryView *)v7 _attributedStringForNotificationsDetailText];
    uint64_t v14 = [(STSummationView *)v11 initWithTitle:v12 detailText:v13];

    v15 = [STSummationView alloc];
    v16 = [(STNotificationsPickupSummaryView *)v7 _attributedStringForPickUpTitle];
    v17 = [(STNotificationsPickupSummaryView *)v7 _attributedStringForPickUpDetailText];
    v36 = [(STSummationView *)v15 initWithTitle:v16 detailText:v17];

    v37 = (void *)v14;
    [(UIStackView *)v7->_stackView addArrangedSubview:v14];
    v18 = v7->_stackView;
    v19 = [MEMORY[0x263F82B60] mainScreen];
    [v19 scale];
    [(UIStackView *)v18 setCustomSpacing:v14 afterView:1.0 / v20];

    [(UIStackView *)v7->_stackView addArrangedSubview:v36];
    [(STNotificationsPickupSummaryView *)v7 addSubview:v7->_stackView];
    v31 = (void *)MEMORY[0x263F08938];
    v35 = [(STNotificationsPickupSummaryView *)v7 topAnchor];
    v34 = [(UIStackView *)v7->_stackView topAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v40[0] = v33;
    v32 = [(STNotificationsPickupSummaryView *)v7 bottomAnchor];
    v21 = [(UIStackView *)v7->_stackView bottomAnchor];
    v22 = [v32 constraintEqualToAnchor:v21];
    v40[1] = v22;
    v23 = [(STNotificationsPickupSummaryView *)v7 leadingAnchor];
    v24 = [(UIStackView *)v7->_stackView leadingAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v40[2] = v25;
    v26 = [(STNotificationsPickupSummaryView *)v7 trailingAnchor];
    v27 = [(UIStackView *)v7->_stackView trailingAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v40[3] = v28;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:4];
    [v31 activateConstraints:v29];

    id v5 = v38;
  }

  return v7;
}

- (id)_attributedStringForNotificationsTitle
{
  v3 = +[STScreenTimeSettingsUIBundle bundle];
  v4 = [v3 localizedStringForKey:@"DailyNotificationsLabel" value:&stru_26D9391A8 table:0];
  id v5 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  v6 = [(STNotificationsPickupSummaryView *)self _attributedString:v4 withFont:v5];

  return v6;
}

- (id)_attributedStringForNotificationsDetailText
{
  v34[1] = *MEMORY[0x263EF8340];
  unint64_t v2 = [(STUsageReport *)self->_usageReport totalNotifications];
  v3 = (void *)MEMORY[0x263F08A30];
  v4 = [NSNumber numberWithInt:llround((double)v2 / 7.0)];
  id v5 = [v3 localizedStringFromNumber:v4 numberStyle:0];

  v6 = NSString;
  v7 = +[STScreenTimeSettingsUIBundle bundle];
  uint64_t v8 = [v7 localizedStringForKey:@"WeeklyReportDailyNotificationCount" value:&stru_26D9391A8 table:0];
  v9 = objc_msgSend(v6, "localizedStringWithFormat:", v8, v5);

  uint64_t v10 = *MEMORY[0x263F83628];
  v11 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83628]];
  uint64_t v33 = *MEMORY[0x263F81748];
  uint64_t v12 = *MEMORY[0x263F817B0];
  v30[0] = *MEMORY[0x263F817B8];
  v30[1] = v12;
  v31[0] = &unk_26D9670A8;
  v31[1] = &unk_26D9670C0;
  v13 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
  v32 = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
  v34[0] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];

  v16 = [v11 fontDescriptor];
  v17 = [v16 fontDescriptorByAddingAttributes:v15];

  v18 = [MEMORY[0x263F81708] fontWithDescriptor:v17 size:0.0];

  v19 = [MEMORY[0x263F81708] preferredFontForTextStyle:v10];
  double v20 = (objc_class *)MEMORY[0x263F089B8];
  id v21 = v18;
  id v22 = v5;
  id v23 = v9;
  v24 = (void *)[[v20 alloc] initWithString:v23];
  [v24 beginEditing];
  uint64_t v25 = *MEMORY[0x263F814F0];
  objc_msgSend(v24, "addAttribute:value:range:", *MEMORY[0x263F814F0], v21, 0, objc_msgSend(v23, "length"));

  uint64_t v26 = [v23 rangeOfString:v22];
  uint64_t v28 = v27;

  objc_msgSend(v24, "addAttribute:value:range:", v25, v19, v26, v28);
  [v24 endEditing];

  return v24;
}

- (id)_attributedStringForPickUpTitle
{
  v3 = +[STScreenTimeSettingsUIBundle bundle];
  v4 = [v3 localizedStringForKey:@"LookedAtPhoneLabel" value:&stru_26D9391A8 table:0];
  id v5 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  v6 = [(STNotificationsPickupSummaryView *)self _attributedString:v4 withFont:v5];

  return v6;
}

- (id)_attributedStringForPickUpDetailText
{
  unint64_t v3 = [(STUsageReport *)self->_usageReport totalPickups];
  v4 = objc_opt_new();
  [v4 setAllowedUnits:96];
  [v4 setUnitsStyle:1];
  if (v3) {
    double v5 = 604800.0 / (double)v3;
  }
  else {
    double v5 = 604800.0;
  }
  v6 = NSString;
  v7 = +[STScreenTimeSettingsUIBundle bundle];
  uint64_t v8 = [v7 localizedStringForKey:@"WeeklyReportPickupInterval" value:&stru_26D9391A8 table:0];
  v9 = [v4 stringFromTimeInterval:v5];
  uint64_t v10 = objc_msgSend(v6, "localizedStringWithFormat:", v8, v9);

  v11 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83628]];
  uint64_t v12 = [(STNotificationsPickupSummaryView *)self _attributedString:v10 withFont:v11];

  return v12;
}

- (id)_attributedString:(id)a3 withFont:(id)a4
{
  double v5 = (objc_class *)MEMORY[0x263F089B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[[v5 alloc] initWithString:v7];
  [v8 beginEditing];
  uint64_t v9 = [v7 length];

  objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x263F814F0], v6, 0, v9);
  [v8 endEditing];

  return v8;
}

- (STUsageReport)usageReport
{
  return self->_usageReport;
}

- (void)setUsageReport:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);

  objc_storeStrong((id *)&self->_usageReport, 0);
}

@end