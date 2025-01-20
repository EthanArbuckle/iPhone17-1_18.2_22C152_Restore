@interface VehicleCell
+ (id)reuseIdentifier;
- (VehicleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_setupConstraints;
- (void)_setupStyling;
- (void)setupWithVehicle:(id)a3 cellStyle:(int64_t)a4 isSelected:(BOOL)a5;
@end

@implementation VehicleCell

+ (id)reuseIdentifier
{
  return @"VehicleCell";
}

- (VehicleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v34.receiver = self;
  v34.super_class = (Class)VehicleCell;
  v4 = [(VehicleCell *)&v34 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(VehicleCell *)v4 setAccessibilityIdentifier:v6];

    [(VehicleCell *)v4 setSelectionStyle:0];
    id v7 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v11 = [v7 initWithFrame:CGRectZero.origin.x, y, width, height];
    iconImageContainerView = v4->_iconImageContainerView;
    v4->_iconImageContainerView = v11;

    [(UIView *)v4->_iconImageContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [(VehicleCell *)v4 contentView];
    [v13 addSubview:v4->_iconImageContainerView];

    v14 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectMake(0, 0, width, height)];
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = v14;

    [(UIImageView *)v4->_iconImageView setAccessibilityIdentifier:@"IconImageView"];
    [(UIImageView *)v4->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_iconImageView setContentMode:1];
    LODWORD(v16) = 1144750080;
    [(UIImageView *)v4->_iconImageView setContentCompressionResistancePriority:1 forAxis:v16];
    LODWORD(v17) = 1144750080;
    [(UIImageView *)v4->_iconImageView setContentCompressionResistancePriority:0 forAxis:v17];
    [(UIView *)v4->_iconImageContainerView addSubview:v4->_iconImageView];
    v18 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, y, width, height];
    stackView = v4->_stackView;
    v4->_stackView = v18;

    [(UIStackView *)v4->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_stackView setAxis:1];
    v20 = [(VehicleCell *)v4 contentView];
    [v20 addSubview:v4->_stackView];

    v21 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v21;

    [(UILabel *)v4->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v23) = 1148846080;
    [(UILabel *)v4->_titleLabel setContentCompressionResistancePriority:1 forAxis:v23];
    LODWORD(v24) = 1144750080;
    [(UILabel *)v4->_titleLabel setContentCompressionResistancePriority:0 forAxis:v24];
    LODWORD(v25) = 1148846080;
    [(UILabel *)v4->_titleLabel setContentHuggingPriority:1 forAxis:v25];
    v26 = [[VehicleBatteryView alloc] initWithVehicle:0 configuration:1 batteryChargeTextAtEdge:8];
    batteryChargeView = v4->_batteryChargeView;
    v4->_batteryChargeView = v26;

    [(VehicleBatteryView *)v4->_batteryChargeView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v28) = 1148846080;
    [(VehicleBatteryView *)v4->_batteryChargeView setContentCompressionResistancePriority:1 forAxis:v28];
    LODWORD(v29) = 1144750080;
    [(VehicleBatteryView *)v4->_batteryChargeView setContentCompressionResistancePriority:0 forAxis:v29];
    LODWORD(v30) = 1148846080;
    [(VehicleBatteryView *)v4->_batteryChargeView setContentHuggingPriority:1 forAxis:v30];
    v31 = v4->_stackView;
    v35[0] = v4->_titleLabel;
    v35[1] = v4->_batteryChargeView;
    v32 = +[NSArray arrayWithObjects:v35 count:2];
    [(UIStackView *)v31 _maps_setArrangedSubviews:v32];

    [(VehicleCell *)v4 _setupConstraints];
    [(VehicleCell *)v4 _setupStyling];
  }
  return v4;
}

- (void)_setupConstraints
{
  v46 = [(VehicleCell *)self contentView];
  v45 = [v46 heightAnchor];
  v44 = [v45 constraintGreaterThanOrEqualToConstant:80.0];
  v47[0] = v44;
  v43 = [(UIView *)self->_iconImageContainerView heightAnchor];
  v42 = [v43 constraintEqualToConstant:40.0];
  v47[1] = v42;
  v41 = [(UIView *)self->_iconImageContainerView widthAnchor];
  v40 = [v41 constraintEqualToConstant:40.0];
  v47[2] = v40;
  v38 = [(UIView *)self->_iconImageContainerView leadingAnchor];
  v39 = [(VehicleCell *)self contentView];
  v37 = [v39 leadingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37 constant:16.0];
  v47[3] = v36;
  objc_super v34 = [(UIView *)self->_iconImageContainerView centerYAnchor];
  v35 = [(VehicleCell *)self contentView];
  v33 = [v35 centerYAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v47[4] = v32;
  v31 = [(UIImageView *)self->_iconImageView centerXAnchor];
  double v30 = [(UIView *)self->_iconImageContainerView centerXAnchor];
  double v29 = [v31 constraintEqualToAnchor:v30];
  v47[5] = v29;
  double v28 = [(UIImageView *)self->_iconImageView centerYAnchor];
  v27 = [(UIView *)self->_iconImageContainerView centerYAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v47[6] = v26;
  double v25 = [(UIImageView *)self->_iconImageView widthAnchor];
  double v24 = [v25 constraintLessThanOrEqualToConstant:28.0];
  v47[7] = v24;
  double v23 = [(UIImageView *)self->_iconImageView heightAnchor];
  v22 = [v23 constraintLessThanOrEqualToConstant:28.0];
  v47[8] = v22;
  v21 = [(UIStackView *)self->_stackView centerYAnchor];
  v20 = [(UIImageView *)self->_iconImageView centerYAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v47[9] = v19;
  v18 = [(UIStackView *)self->_stackView leadingAnchor];
  double v17 = [(UIView *)self->_iconImageContainerView trailingAnchor];
  double v16 = [v18 constraintEqualToAnchor:v17 constant:12.0];
  v47[10] = v16;
  v15 = [(VehicleCell *)self contentView];
  v14 = [v15 trailingAnchor];
  v13 = [(UIStackView *)self->_stackView trailingAnchor];
  v3 = [v14 constraintEqualToAnchor:v13 constant:16.0];
  v47[11] = v3;
  v4 = [(UIStackView *)self->_stackView topAnchor];
  v5 = [(VehicleCell *)self contentView];
  v6 = [v5 topAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6 constant:20.0];
  v47[12] = v7;
  v8 = [(VehicleCell *)self contentView];
  v9 = [v8 bottomAnchor];
  v10 = [(UIStackView *)self->_stackView bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:20.0];
  v47[13] = v11;
  v12 = +[NSArray arrayWithObjects:v47 count:14];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_setupStyling
{
  v3 = [(UIView *)self->_iconImageContainerView layer];
  [v3 setCornerRadius:20.0];

  v4 = [(UIView *)self->_iconImageContainerView layer];
  [v4 setCornerCurve:kCACornerCurveCircular];

  v5 = [(UIView *)self->_iconImageContainerView layer];
  [v5 setMaskedCorners:15];

  v6 = +[UIColor labelColor];
  [(UILabel *)self->_titleLabel setTextColor:v6];

  [(UILabel *)self->_titleLabel setAllowsDefaultTighteningForTruncation:1];
  id v7 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleBody weight:UIFontWeightMedium];
  [(UILabel *)self->_titleLabel setFont:v7];
}

- (void)setupWithVehicle:(id)a3 cellStyle:(int64_t)a4 isSelected:(BOOL)a5
{
  BOOL v5 = a5;
  id v35 = a3;
  v8 = sub_1004BE408((int)[v35 isPureElectricVehicle]);
  v9 = [v8 imageWithRenderingMode:2];
  [(UIImageView *)self->_iconImageView setImage:v9];

  v10 = [v35 colorHex];
  v11 = +[UIColor _maps_colorFromHexRepresentation:v10];
  if (v11)
  {
    p_iconImageContainerView = &self->_iconImageContainerView;
    [(UIView *)self->_iconImageContainerView setBackgroundColor:v11];
  }
  else
  {
    v13 = +[UIColor systemBlueColor];
    p_iconImageContainerView = &self->_iconImageContainerView;
    [(UIView *)self->_iconImageContainerView setBackgroundColor:v13];
  }
  v14 = [(UIView *)*p_iconImageContainerView backgroundColor];
  v15 = +[UIColor whiteColor];
  [v14 _maps_euclideanDistanceFromColor:v15];
  double v17 = v16;

  if (v17 >= 0.1)
  {
    v18 = +[UIColor systemWhiteColor];
    [(UIImageView *)self->_iconImageView setTintColor:v18];
  }
  else
  {
    v18 = +[NSBundle bundleForClass:objc_opt_class()];
    v19 = [(VehicleCell *)self traitCollection];
    v20 = +[UIColor colorNamed:@"TertiaryVehicleTint" inBundle:v18 compatibleWithTraitCollection:v19];
    [(UIImageView *)self->_iconImageView setTintColor:v20];
  }
  v21 = [v35 combinedDisplayName];
  if (v21)
  {
    [(UILabel *)self->_titleLabel setText:v21];
  }
  else
  {
    v22 = +[NSBundle mainBundle];
    double v23 = [v22 localizedStringForKey:@"[Vehicle Selection] My Vehicle" value:@"localized string not found" table:0];
    [(UILabel *)self->_titleLabel setText:v23];
  }
  unsigned int v24 = [v35 isPureElectricVehicle];
  batteryChargeView = self->_batteryChargeView;
  if (v24)
  {
    [(VehicleBatteryView *)batteryChargeView setVehicle:v35];
    [(VehicleBatteryView *)self->_batteryChargeView setHidden:0];
    uint64_t v26 = [v35 applicationRecord];
    if (v26)
    {
      v27 = (void *)v26;
      double v28 = [v35 currentVehicleState];
      double v29 = [v28 dateOfUpdate];
      [v29 timeIntervalSinceNow];
      double v31 = v30;

      if (v31 < -60.0) {
        [(VehicleBatteryView *)self->_batteryChargeView refreshState];
      }
    }
  }
  else
  {
    [(VehicleBatteryView *)batteryChargeView setHidden:1];
  }
  if (a4 == 1)
  {
    [(VehicleCell *)self setAccessoryType:1];
    uint64_t v33 = +[UIColor tableCellGroupedBackgroundColor];
  }
  else
  {
    if (a4) {
      goto LABEL_23;
    }
    if (v5) {
      uint64_t v32 = 3;
    }
    else {
      uint64_t v32 = 0;
    }
    [(VehicleCell *)self setAccessoryType:v32];
    uint64_t v33 = +[UIColor tertiarySystemFillColor];
  }
  objc_super v34 = (void *)v33;
  [(VehicleCell *)self setBackgroundColor:v33];

LABEL_23:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryChargeView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageContainerView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);

  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end