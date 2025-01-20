@interface STNoUsageDataView
- (BOOL)isLocalDevice;
- (STNoUsageDataView)initWithPreferredFontTextStyle:(id)a3;
- (UILabel)noDataDetailTextLabel;
- (void)setLocalDevice:(BOOL)a3;
@end

@implementation STNoUsageDataView

- (STNoUsageDataView)initWithPreferredFontTextStyle:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)STNoUsageDataView;
  v5 = -[STNoUsageDataView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    noDataDetailTextLabel = v5->_noDataDetailTextLabel;
    v5->_noDataDetailTextLabel = (UILabel *)v6;

    [(UILabel *)v5->_noDataDetailTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:v4];
    [(UILabel *)v5->_noDataDetailTextLabel setFont:v8];

    v9 = [MEMORY[0x263F825C8] systemGrayColor];
    [(UILabel *)v5->_noDataDetailTextLabel setTextColor:v9];

    [(UILabel *)v5->_noDataDetailTextLabel setLineBreakMode:0];
    [(UILabel *)v5->_noDataDetailTextLabel setTextAlignment:1];
    [(UILabel *)v5->_noDataDetailTextLabel setNumberOfLines:0];
    [(STNoUsageDataView *)v5 addSubview:v5->_noDataDetailTextLabel];
    v10 = [(UILabel *)v5->_noDataDetailTextLabel topAnchor];
    v11 = [(STNoUsageDataView *)v5 topAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    [v12 setActive:1];

    v13 = [(UILabel *)v5->_noDataDetailTextLabel leadingAnchor];
    v14 = [(STNoUsageDataView *)v5 leadingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    [v15 setActive:1];

    v16 = [(UILabel *)v5->_noDataDetailTextLabel bottomAnchor];
    v17 = [(STNoUsageDataView *)v5 bottomAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    [v18 setActive:1];

    v19 = [(UILabel *)v5->_noDataDetailTextLabel trailingAnchor];
    v20 = [(STNoUsageDataView *)v5 trailingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    [v21 setActive:1];
  }
  return v5;
}

- (void)setLocalDevice:(BOOL)a3
{
  BOOL v3 = a3;
  self->_localDevice = a3;
  id v8 = +[STScreenTimeSettingsUIBundle bundle];
  if (v3)
  {
    v5 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"NoDataDetailTextLabel"];
    uint64_t v6 = [v8 localizedStringForKey:v5 value:&stru_26D9391A8 table:0];
    v7 = [(STNoUsageDataView *)self noDataDetailTextLabel];
    [v7 setText:v6];
  }
  else
  {
    v5 = [v8 localizedStringForKey:@"NoDataDetailTextLabel" value:&stru_26D9391A8 table:0];
    uint64_t v6 = [(STNoUsageDataView *)self noDataDetailTextLabel];
    [v6 setText:v5];
  }
}

- (BOOL)isLocalDevice
{
  return self->_localDevice;
}

- (UILabel)noDataDetailTextLabel
{
  return self->_noDataDetailTextLabel;
}

- (void).cxx_destruct
{
}

@end