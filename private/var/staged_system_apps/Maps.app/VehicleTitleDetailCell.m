@interface VehicleTitleDetailCell
- (UILabel)detailLabel;
- (UILabel)titleLabel;
- (VehicleTitleDetailCell)init;
- (VehicleTitleDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)cellHeightWithWidth:(double)a3;
- (void)_commonInit;
@end

@implementation VehicleTitleDetailCell

- (VehicleTitleDetailCell)init
{
  return [(VehicleTitleDetailCell *)self initWithStyle:0 reuseIdentifier:0];
}

- (VehicleTitleDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)VehicleTitleDetailCell;
  v4 = [(VehicleTitleDetailCell *)&v7 initWithStyle:0 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(VehicleTitleDetailCell *)v4 _commonInit];
    [(VehicleTitleDetailCell *)v5 setAccessibilityIdentifier:@"VehicleTitleDetailCell"];
  }
  return v5;
}

- (void)_commonInit
{
  v3 = (UILabel *)objc_opt_new();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
  v5 = +[UIColor labelColor];
  [(UILabel *)self->_titleLabel setTextColor:v5];

  v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)self->_titleLabel setFont:v6];

  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  objc_super v7 = (UILabel *)objc_opt_new();
  detailLabel = self->_detailLabel;
  self->_detailLabel = v7;

  [(UILabel *)self->_detailLabel setAccessibilityIdentifier:@"DetailLabel"];
  [(UILabel *)self->_detailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_detailLabel setAccessibilityIdentifier:@"DetailLabel"];
  v9 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_detailLabel setTextColor:v9];

  v10 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)self->_detailLabel setFont:v10];

  [(UILabel *)self->_detailLabel setNumberOfLines:0];
  [(UILabel *)self->_detailLabel setTextAlignment:2* ([(VehicleTitleDetailCell *)self effectiveUserInterfaceLayoutDirection] != (id)1)];
  v11 = [(VehicleTitleDetailCell *)self contentView];
  [v11 addSubview:self->_titleLabel];

  v12 = [(VehicleTitleDetailCell *)self contentView];
  [v12 addSubview:self->_detailLabel];

  v35 = [(UILabel *)self->_titleLabel leadingAnchor];
  v36 = [(VehicleTitleDetailCell *)self contentView];
  v34 = [v36 leadingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34 constant:20.0];
  v37[0] = v33;
  v32 = [(UILabel *)self->_titleLabel trailingAnchor];
  v31 = [(UILabel *)self->_detailLabel leadingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31 constant:-10.0];
  v37[1] = v30;
  v28 = [(UILabel *)self->_titleLabel centerYAnchor];
  v29 = [(VehicleTitleDetailCell *)self contentView];
  v27 = [v29 centerYAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v37[2] = v26;
  v24 = [(UILabel *)self->_detailLabel trailingAnchor];
  v25 = [(VehicleTitleDetailCell *)self contentView];
  v23 = [v25 trailingAnchor];
  v13 = [v24 constraintEqualToAnchor:v23 constant:-20.0];
  v37[3] = v13;
  v14 = [(UILabel *)self->_detailLabel widthAnchor];
  v15 = [(VehicleTitleDetailCell *)self contentView];
  v16 = [v15 widthAnchor];
  v17 = [v14 constraintEqualToAnchor:v16 multiplier:0.449999988];
  v37[4] = v17;
  v18 = [(UILabel *)self->_detailLabel centerYAnchor];
  v19 = [(VehicleTitleDetailCell *)self contentView];
  v20 = [v19 centerYAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  v37[5] = v21;
  v22 = +[NSArray arrayWithObjects:v37 count:6];
  +[NSLayoutConstraint activateConstraints:v22];
}

- (double)cellHeightWithWidth:(double)a3
{
  double v4 = a3 * 0.449999988;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3 - a3 * 0.449999988 + -50.0, 1.79769313e308);
  double v6 = v5;
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v4, 1.79769313e308);
  if (v6 <= v7) {
    double v8 = v7;
  }
  else {
    double v8 = v6;
  }
  double result = v8 + 20.0;
  if (result < 44.0) {
    return 44.0;
  }
  return result;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end