@interface PUICalendarPrivacySettingsInsetView
- (PUICalendarPrivacySettingsInsetView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation PUICalendarPrivacySettingsInsetView

- (PUICalendarPrivacySettingsInsetView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v35[4] = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)PUICalendarPrivacySettingsInsetView;
  v5 = [(PSTableCell *)&v34 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v31 = (void *)[objc_alloc(MEMORY[0x1E4F61518]) initWithBundleIdentifier:0];
    v32 = [(PUICalendarPrivacySettingsInsetView *)v5 contentView];
    [(PUICalendarPrivacySettingsInsetView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    v33 = v5;
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 setAxis:1];
    objc_msgSend(v6, "setLayoutMargins:", 5.0, 0.0, 5.0, 0.0);
    [v6 setLayoutMarginsRelativeArrangement:1];
    [v32 addSubview:v6];
    id v7 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 setAxis:1];
    objc_msgSend(v7, "setLayoutMargins:", 15.0, 15.0, 10.0, 15.0);
    [v7 setLayoutMarginsRelativeArrangement:1];
    v25 = (void *)MEMORY[0x1E4F28DC8];
    v30 = [v6 topAnchor];
    v29 = [v32 topAnchor];
    v28 = [v30 constraintEqualToSystemSpacingBelowAnchor:v29 multiplier:0.5];
    v35[0] = v28;
    v27 = [v6 leadingAnchor];
    v26 = [v32 leadingAnchor];
    v8 = [v27 constraintEqualToSystemSpacingAfterAnchor:v26 multiplier:0.5];
    v35[1] = v8;
    v9 = [v32 trailingAnchor];
    v10 = [v6 trailingAnchor];
    v11 = [v9 constraintEqualToSystemSpacingAfterAnchor:v10 multiplier:0.5];
    v35[2] = v11;
    v12 = [v32 bottomAnchor];
    v13 = [v6 bottomAnchor];
    v14 = [v12 constraintEqualToSystemSpacingBelowAnchor:v13 multiplier:0.5];
    v35[3] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:4];
    [v25 activateConstraints:v15];

    v16 = [v31 previewTableView];
    [v6 addArrangedSubview:v16];

    id v17 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
    [v17 setFont:v18];

    v19 = PUI_LocalizedStringForPrivacy(@"CALENDARS_PREVIEW_TABLE_TITLE");
    [v17 setText:v19];

    [v7 addArrangedSubview:v17];
    id v20 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v21 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [v20 setFont:v21];

    v22 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v20 setTextColor:v22];

    [v20 setNumberOfLines:0];
    v23 = [v31 settingsViewSubtitle];
    [v20 setText:v23];

    [v7 addArrangedSubview:v20];
    [v6 addArrangedSubview:v7];
    [v6 setCustomSpacing:v20 afterView:8.0];

    v5 = v33;
  }
  return v5;
}

@end