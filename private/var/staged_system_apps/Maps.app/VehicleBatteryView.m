@interface VehicleBatteryView
+ (id)colorForBatteryLevel:(unint64_t)a3;
- (BOOL)isReloading;
- (VGVehicle)vehicle;
- (VehicleBatteryView)initWithVehicle:(id)a3 configuration:(int64_t)a4 batteryChargeTextAtEdge:(unint64_t)a5;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)_setupConstraints;
- (void)_setupStyling;
- (void)refreshState;
- (void)setReloading:(BOOL)a3;
- (void)setVehicle:(id)a3;
@end

@implementation VehicleBatteryView

- (VehicleBatteryView)initWithVehicle:(id)a3 configuration:(int64_t)a4 batteryChargeTextAtEdge:(unint64_t)a5
{
  v29.receiver = self;
  v29.super_class = (Class)VehicleBatteryView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v10 = -[VehicleBatteryView initWithFrame:](&v29, "initWithFrame:", a3, CGRectZero.origin.x, y, width, height);
  if (v10)
  {
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [(VehicleBatteryView *)v10 setAccessibilityIdentifier:v12];

    v10->_int64_t configuration = a4;
    v10->_batteryChargeTextAtEdge = a5;
    v13 = -[BatteryIconView initWithFrame:]([BatteryIconView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    batteryView = v10->_batteryView;
    v10->_batteryView = v13;

    [(BatteryIconView *)v10->_batteryView setAccessibilityIdentifier:@"BatteryIconView"];
    [(BatteryIconView *)v10->_batteryView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v15) = 1148846080;
    [(BatteryIconView *)v10->_batteryView setContentCompressionResistancePriority:0 forAxis:v15];
    LODWORD(v16) = 1148846080;
    [(BatteryIconView *)v10->_batteryView setContentCompressionResistancePriority:1 forAxis:v16];
    [(VehicleBatteryView *)v10 addSubview:v10->_batteryView];
    v17 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    percentLabel = v10->_percentLabel;
    v10->_percentLabel = v17;

    [(UILabel *)v10->_percentLabel setAccessibilityIdentifier:@"PercentLabel"];
    [(UILabel *)v10->_percentLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v10->_percentLabel setAdjustsFontForContentSizeCategory:1];
    LODWORD(v19) = 1148829696;
    [(UILabel *)v10->_percentLabel setContentCompressionResistancePriority:0 forAxis:v19];
    LODWORD(v20) = 1148846080;
    [(UILabel *)v10->_percentLabel setContentHuggingPriority:0 forAxis:v20];
    LODWORD(v21) = 1144750080;
    [(UILabel *)v10->_percentLabel setContentHuggingPriority:1 forAxis:v21];
    [(VehicleBatteryView *)v10 addSubview:v10->_percentLabel];
    int64_t configuration = v10->_configuration;
    if ((unint64_t)(configuration - 1) <= 1)
    {
      v23 = [[BatteryStateAgeView alloc] initWithConfiguration:configuration == 2];
      batteryStateAgeView = v10->_batteryStateAgeView;
      v10->_batteryStateAgeView = v23;

      [(BatteryStateAgeView *)v10->_batteryStateAgeView setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v25) = 1144750080;
      [(BatteryStateAgeView *)v10->_batteryStateAgeView setContentHuggingPriority:0 forAxis:v25];
      LODWORD(v26) = 1144750080;
      [(BatteryStateAgeView *)v10->_batteryStateAgeView setContentHuggingPriority:1 forAxis:v26];
      LODWORD(v27) = 1148846080;
      [(BatteryStateAgeView *)v10->_batteryStateAgeView setContentCompressionResistancePriority:1 forAxis:v27];
      [(VehicleBatteryView *)v10 addSubview:v10->_batteryStateAgeView];
    }
    [(VehicleBatteryView *)v10 _setupStyling];
    [(VehicleBatteryView *)v10 _setupConstraints];
  }
  return v10;
}

+ (id)colorForBatteryLevel:(unint64_t)a3
{
  if (GEOConfigGetUInteger() >= a3)
  {
    v4 = +[UIColor systemRedColor];
  }
  else
  {
    if (GEOConfigGetUInteger() >= a3) {
      +[UIColor systemYellowColor];
    }
    else {
    v4 = +[UIColor systemGreenColor];
    }
  }

  return v4;
}

- (void)_setupStyling
{
  v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)self->_percentLabel setFont:v3];

  id v4 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_percentLabel setTextColor:v4];
}

- (void)_setupConstraints
{
  v50 = +[NSMutableArray array];
  if (self->_batteryChargeTextAtEdge == 8)
  {
    v3 = [(BatteryIconView *)self->_batteryView leadingAnchor];
    id v4 = [(VehicleBatteryView *)self leadingAnchor];
    v49 = v3;
    v5 = [v3 constraintEqualToAnchor:v4];
    v55[0] = v5;
    p_percentLabel = (id *)&self->_percentLabel;
    v7 = [(UILabel *)self->_percentLabel leadingAnchor];
    v8 = [(BatteryIconView *)self->_batteryView trailingAnchor];
    v9 = [v7 constraintEqualToAnchor:v8 constant:4.0];
    v55[1] = v9;
    v10 = v55;
  }
  else
  {
    v11 = [(UILabel *)self->_percentLabel leadingAnchor];
    id v4 = [(VehicleBatteryView *)self leadingAnchor];
    v49 = v11;
    v5 = [v11 constraintEqualToAnchor:v4];
    v54[0] = v5;
    p_percentLabel = (id *)&self->_batteryView;
    v7 = [(BatteryIconView *)self->_batteryView leadingAnchor];
    v8 = [(UILabel *)self->_percentLabel trailingAnchor];
    v9 = [v7 constraintEqualToAnchor:v8 constant:4.0];
    v54[1] = v9;
    v10 = v54;
  }
  v12 = +[NSArray arrayWithObjects:v10 count:2];
  [v50 addObjectsFromArray:v12];

  v48 = (BatteryStateAgeView *)*p_percentLabel;
  v47 = [(BatteryIconView *)self->_batteryView centerYAnchor];
  v46 = [(VehicleBatteryView *)self centerYAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v53[0] = v45;
  v44 = [(UILabel *)self->_percentLabel topAnchor];
  v43 = [(VehicleBatteryView *)self topAnchor];
  v42 = [v44 constraintGreaterThanOrEqualToAnchor:v43];
  v53[1] = v42;
  v41 = [(VehicleBatteryView *)self bottomAnchor];
  v40 = [(UILabel *)self->_percentLabel bottomAnchor];
  v39 = [v41 constraintGreaterThanOrEqualToAnchor:v40];
  v53[2] = v39;
  v38 = [(UILabel *)self->_percentLabel centerYAnchor];
  v13 = [(BatteryIconView *)self->_batteryView centerYAnchor];
  v14 = [v38 constraintEqualToAnchor:v13];
  v53[3] = v14;
  double v15 = [(BatteryStateAgeView *)self->_batteryStateAgeView topAnchor];
  double v16 = [(VehicleBatteryView *)self topAnchor];
  v17 = [v15 constraintGreaterThanOrEqualToAnchor:v16];
  v53[4] = v17;
  v18 = [(VehicleBatteryView *)self bottomAnchor];
  double v19 = [(BatteryStateAgeView *)self->_batteryStateAgeView bottomAnchor];
  double v20 = [v18 constraintGreaterThanOrEqualToAnchor:v19];
  v53[5] = v20;
  double v21 = +[NSArray arrayWithObjects:v53 count:6];
  +[NSLayoutConstraint activateConstraints:v21];

  if ((unint64_t)(self->_configuration - 1) > 1)
  {
    v32 = v50;
    v33 = v48;
  }
  else
  {
    id v22 = [(VehicleBatteryView *)self effectiveUserInterfaceLayoutDirection];
    batteryStateAgeView = self->_batteryStateAgeView;
    if (v22 == (id)1)
    {
      v24 = [(BatteryStateAgeView *)batteryStateAgeView rightAnchor];
      double v25 = v48;
      double v26 = [(BatteryStateAgeView *)v48 leftAnchor];
      double v27 = [v24 constraintEqualToAnchor:v26 constant:-4.0];
      v52[0] = v27;
      v28 = [(BatteryStateAgeView *)self->_batteryStateAgeView centerYAnchor];
      objc_super v29 = [(BatteryIconView *)self->_batteryView centerYAnchor];
      v30 = [v28 constraintEqualToAnchor:v29];
      v52[1] = v30;
      v31 = v52;
    }
    else
    {
      v24 = [(BatteryStateAgeView *)batteryStateAgeView leftAnchor];
      double v25 = v48;
      double v26 = [(BatteryStateAgeView *)v48 rightAnchor];
      double v27 = [v24 constraintEqualToAnchor:v26];
      v51[0] = v27;
      v28 = [(BatteryStateAgeView *)self->_batteryStateAgeView centerYAnchor];
      objc_super v29 = [(BatteryIconView *)self->_batteryView centerYAnchor];
      v30 = [v28 constraintEqualToAnchor:v29];
      v51[1] = v30;
      v31 = v51;
    }
    v32 = v50;
    v34 = +[NSArray arrayWithObjects:v31 count:2];
    [v50 addObjectsFromArray:v34];

    v33 = self->_batteryStateAgeView;
  }
  v35 = [(VehicleBatteryView *)self trailingAnchor];
  v36 = [(BatteryStateAgeView *)v33 trailingAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  [v32 addObject:v37];

  +[NSLayoutConstraint activateConstraints:v32];
}

- (void)setVehicle:(id)a3
{
  v5 = (VGVehicle *)a3;
  if (self->_vehicle != v5)
  {
    v14 = v5;
    objc_storeStrong((id *)&self->_vehicle, a3);
    uint64_t BOOL = GEOConfigGetBOOL();
    if (v14)
    {
      id v7 = [(VGVehicle *)v14 displayedBatteryPercentage];
      [(BatteryIconView *)self->_batteryView setLevel:v7];
      if (BOOL)
      {
        v8 = +[NSBundle mainBundle];
        v9 = [v8 localizedStringForKey:@"%lu%%" value:@"localized string not found" table:0];
        v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v7);
        [(UILabel *)self->_percentLabel setText:v10];

        percentLabel = +[VehicleBatteryView colorForBatteryLevel:v7];
        [(UILabel *)self->_percentLabel setTextColor:percentLabel];
      }
      else
      {
        percentLabel = self->_percentLabel;
        self->_percentLabel = 0;
      }

      v12 = [(VGVehicle *)self->_vehicle currentVehicleState];
      v13 = [v12 dateOfUpdate];
      [(BatteryStateAgeView *)self->_batteryStateAgeView setDateOfLastSync:v13];

      [(BatteryStateAgeView *)self->_batteryStateAgeView setShouldShowSeparator:BOOL];
    }
    else
    {
      [(UILabel *)self->_percentLabel setText:0];
      [(BatteryStateAgeView *)self->_batteryStateAgeView setDateOfLastSync:0];
    }
    v5 = v14;
  }
}

- (void)setReloading:(BOOL)a3
{
  if (self->_reloading != a3)
  {
    self->_reloading = a3;
    batteryStateAgeView = self->_batteryStateAgeView;
    if (a3)
    {
      [(BatteryStateAgeView *)batteryStateAgeView startAnimating];
      v5 = [(VGVehicle *)self->_vehicle identifier];
      identifierOfCurrentlyLoadingVehicle = self->_identifierOfCurrentlyLoadingVehicle;
      self->_identifierOfCurrentlyLoadingVehicle = v5;
    }
    else
    {
      [(BatteryStateAgeView *)batteryStateAgeView stopAnimating];
      identifierOfCurrentlyLoadingVehicle = self->_identifierOfCurrentlyLoadingVehicle;
      self->_identifierOfCurrentlyLoadingVehicle = 0;
    }
  }
}

- (void)refreshState
{
  if (![(VehicleBatteryView *)self isReloading]
    || ([(VGVehicle *)self->_vehicle identifier],
        v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqualToString:self->_identifierOfCurrentlyLoadingVehicle],
        v3,
        (v4 & 1) == 0))
  {
    [(VehicleBatteryView *)self setReloading:1];
    objc_initWeak(&location, self);
    v5 = +[VGVirtualGarageService sharedService];
    v6 = [(VGVehicle *)self->_vehicle identifier];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100BFD1FC;
    v7[3] = &unk_10131B468;
    objc_copyWeak(&v8, &location);
    [v5 virtualGarageGetLatestStateOfVehicleWithIdentifier:v6 syncAcrossDevices:1 withReply:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (id)viewForFirstBaselineLayout
{
  return self->_batteryStateAgeView;
}

- (id)viewForLastBaselineLayout
{
  return self->_batteryStateAgeView;
}

- (VGVehicle)vehicle
{
  return self->_vehicle;
}

- (BOOL)isReloading
{
  return self->_reloading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_identifierOfCurrentlyLoadingVehicle, 0);
  objc_storeStrong((id *)&self->_batteryStateAgeView, 0);
  objc_storeStrong((id *)&self->_percentLabel, 0);

  objc_storeStrong((id *)&self->_batteryView, 0);
}

@end