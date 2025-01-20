@interface RoutePlanningVehicleSelectionCollectionViewCell
- (RoutePlanningVehicleSelectionCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)_setupConstraints;
- (void)setupWithVehicle:(id)a3;
@end

@implementation RoutePlanningVehicleSelectionCollectionViewCell

- (RoutePlanningVehicleSelectionCollectionViewCell)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)RoutePlanningVehicleSelectionCollectionViewCell;
  v3 = -[MapsDebugCollectionViewCell initWithFrame:](&v16, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor redColor];
    [(RoutePlanningVehicleSelectionCollectionViewCell *)v3 setBackgroundColor:v4];

    v5 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v5;

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    if (sub_1000BBB44(v3) == 5) {
      +[UIFont systemFontOfSize:15.0];
    }
    else {
    v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    }
    [(UILabel *)v3->_titleLabel setFont:v7];

    [(UILabel *)v3->_titleLabel setAdjustsFontForContentSizeCategory:1];
    v8 = [[VehicleBatteryView alloc] initWithVehicle:0 configuration:1 batteryChargeTextAtEdge:8];
    vehicleBatteryView = v3->_vehicleBatteryView;
    v3->_vehicleBatteryView = v8;

    [(VehicleBatteryView *)v3->_vehicleBatteryView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v10 = objc_alloc((Class)UIStackView);
    v17[0] = v3->_titleLabel;
    v17[1] = v3->_vehicleBatteryView;
    v11 = +[NSArray arrayWithObjects:v17 count:2];
    v12 = (UIStackView *)[v10 initWithArrangedSubviews:v11];

    [(UIStackView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v12 setAlignment:0];
    [(UIStackView *)v12 setDistribution:0];
    [(UIStackView *)v12 setAxis:1];
    [(UIStackView *)v12 setSpacing:4.0];
    v13 = [(RoutePlanningVehicleSelectionCollectionViewCell *)v3 contentView];
    [v13 addSubview:v12];

    stackView = v3->_stackView;
    v3->_stackView = v12;

    [(RoutePlanningVehicleSelectionCollectionViewCell *)v3 _setupConstraints];
  }
  return v3;
}

- (void)_setupConstraints
{
  if (sub_1000BBB44(self) == 5) {
    double v3 = 12.0;
  }
  else {
    double v3 = 18.0;
  }
  stackView = self->_stackView;
  id v8 = [(RoutePlanningVehicleSelectionCollectionViewCell *)self contentView];
  LODWORD(v5) = 1148846080;
  v6 = -[UIStackView _maps_constraintsEqualToEdgesOfView:insets:priority:](stackView, "_maps_constraintsEqualToEdgesOfView:insets:priority:", v8, v3, 16.0, v3, 16.0, v5);
  v7 = [v6 allConstraints];
  +[NSLayoutConstraint activateConstraints:v7];
}

- (void)setupWithVehicle:(id)a3
{
  id v9 = a3;
  v4 = [v9 combinedDisplayName];
  [(UILabel *)self->_titleLabel setText:v4];

  unsigned int v5 = [v9 isPureElectricVehicle];
  if (v5) {
    id v6 = v9;
  }
  else {
    id v6 = 0;
  }
  uint64_t v7 = v5 ^ 1;
  if (v5) {
    double v8 = 1.0;
  }
  else {
    double v8 = 0.0;
  }
  [(VehicleBatteryView *)self->_vehicleBatteryView setVehicle:v6];
  [(VehicleBatteryView *)self->_vehicleBatteryView setHidden:v7];
  [(VehicleBatteryView *)self->_vehicleBatteryView setAlpha:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_vehicleBatteryView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end