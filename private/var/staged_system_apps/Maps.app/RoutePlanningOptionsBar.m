@interface RoutePlanningOptionsBar
- (NSString)summaryText;
- (RoutePlanningOptionsBar)initWithFrame:(CGRect)a3;
- (VGVehicle)vehicle;
- (void)_buttonTapped;
- (void)_updateContent;
- (void)setButtonTitle:(id)a3 actionHandler:(id)a4;
- (void)setSummaryText:(id)a3;
- (void)setVehicle:(id)a3;
@end

@implementation RoutePlanningOptionsBar

- (RoutePlanningOptionsBar)initWithFrame:(CGRect)a3
{
  v58.receiver = self;
  v58.super_class = (Class)RoutePlanningOptionsBar;
  v3 = -[RoutePlanningOptionsBar initWithFrame:](&v58, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(RoutePlanningOptionsBar *)v3 setAccessibilityIdentifier:v5];

    uint64_t v6 = +[UIButton buttonWithType:0];
    button = v3->_button;
    v3->_button = (UIButton *)v6;

    [(UIButton *)v3->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v9 = [(UIButton *)v3->_button titleLabel];
    [v9 setFont:v8];

    [(UIButton *)v3->_button setContentHorizontalAlignment:4];
    v57 = +[UIColor systemBlueColor];
    [(UIButton *)v3->_button setTitleColor:v57 forState:0];
    [(UIButton *)v3->_button addTarget:v3 action:"_buttonTapped" forControlEvents:64];
    LODWORD(v10) = 1148846080;
    [(UIButton *)v3->_button setContentHuggingPriority:0 forAxis:v10];
    LODWORD(v11) = 1144766464;
    [(UIButton *)v3->_button setContentCompressionResistancePriority:0 forAxis:v11];
    LODWORD(v12) = 1148846080;
    [(UIButton *)v3->_button setContentCompressionResistancePriority:1 forAxis:v12];
    [(UIButton *)v3->_button setAccessibilityIdentifier:@"RoutePlanningOptionsBarButton"];
    [(RoutePlanningOptionsBar *)v3 addSubview:v3->_button];
    v13 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    summaryLabel = v3->_summaryLabel;
    v3->_summaryLabel = v13;

    [(UILabel *)v3->_summaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = +[UIColor secondaryLabelColor];
    [(UILabel *)v3->_summaryLabel setTextColor:v15];

    v16 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v3->_summaryLabel setFont:v16];

    LODWORD(v17) = 1148846080;
    [(UILabel *)v3->_summaryLabel setContentHuggingPriority:0 forAxis:v17];
    LODWORD(v18) = 1144733696;
    [(UILabel *)v3->_summaryLabel setContentCompressionResistancePriority:0 forAxis:v18];
    LODWORD(v19) = 1148829696;
    [(UILabel *)v3->_summaryLabel setContentCompressionResistancePriority:1 forAxis:v19];
    [(UILabel *)v3->_summaryLabel setAccessibilityIdentifier:@"RoutePlanningOptionsBarSummaryLabel"];
    [(RoutePlanningOptionsBar *)v3 addSubview:v3->_summaryLabel];
    uint64_t v20 = objc_opt_new();
    batteryView = v3->_batteryView;
    v3->_batteryView = (BatteryIconView *)v20;

    [(BatteryIconView *)v3->_batteryView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(BatteryIconView *)v3->_batteryView setAccessibilityIdentifier:@"RoutePlanningOptionsBarBatteryView"];
    [(RoutePlanningOptionsBar *)v3 addSubview:v3->_batteryView];
    v22 = [(RoutePlanningOptionsBar *)v3 trailingAnchor];
    v23 = [(UILabel *)v3->_summaryLabel trailingAnchor];
    uint64_t v24 = [v22 constraintEqualToAnchor:v23];
    summaryToTrailingConstraint = v3->_summaryToTrailingConstraint;
    v3->_summaryToTrailingConstraint = (NSLayoutConstraint *)v24;

    v26 = [(UILabel *)v3->_summaryLabel trailingAnchor];
    v27 = [(BatteryIconView *)v3->_batteryView leadingAnchor];
    uint64_t v28 = [v26 constraintEqualToAnchor:v27 constant:-4.0];
    summaryToBatteryConstraint = v3->_summaryToBatteryConstraint;
    v3->_summaryToBatteryConstraint = (NSLayoutConstraint *)v28;

    v30 = [(BatteryIconView *)v3->_batteryView trailingAnchor];
    v31 = [(RoutePlanningOptionsBar *)v3 trailingAnchor];
    uint64_t v32 = [v30 constraintEqualToAnchor:v31];
    batteryToTrailingConstraint = v3->_batteryToTrailingConstraint;
    v3->_batteryToTrailingConstraint = (NSLayoutConstraint *)v32;

    v56 = [(UIButton *)v3->_button leadingAnchor];
    v55 = [(RoutePlanningOptionsBar *)v3 leadingAnchor];
    v54 = [v56 constraintEqualToAnchor:v55];
    v59[0] = v54;
    v53 = [(UILabel *)v3->_summaryLabel leadingAnchor];
    v52 = [(UIButton *)v3->_button trailingAnchor];
    v51 = [v53 constraintGreaterThanOrEqualToAnchor:v52 constant:8.0];
    v59[1] = v51;
    v59[2] = v3->_summaryToTrailingConstraint;
    v50 = [(UIButton *)v3->_button topAnchor];
    v49 = [(RoutePlanningOptionsBar *)v3 topAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v59[3] = v48;
    v47 = [(UILabel *)v3->_summaryLabel topAnchor];
    v46 = [(RoutePlanningOptionsBar *)v3 topAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v59[4] = v45;
    v43 = [(RoutePlanningOptionsBar *)v3 bottomAnchor];
    v42 = [(UIButton *)v3->_button bottomAnchor];
    v34 = [v43 constraintEqualToAnchor:v42];
    v59[5] = v34;
    v35 = [(RoutePlanningOptionsBar *)v3 bottomAnchor];
    v36 = [(UILabel *)v3->_summaryLabel bottomAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    v59[6] = v37;
    v38 = [(BatteryIconView *)v3->_batteryView centerYAnchor];
    v39 = [(UILabel *)v3->_summaryLabel centerYAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    v59[7] = v40;
    v44 = +[NSArray arrayWithObjects:v59 count:8];

    +[NSLayoutConstraint activateConstraints:v44];
    [(UIButton *)v3->_button setHidden:1];
    [(UILabel *)v3->_summaryLabel setHidden:1];
  }
  return v3;
}

- (void)setButtonTitle:(id)a3 actionHandler:(id)a4
{
  id v6 = a3;
  id v7 = [a4 copy];
  id actionHandler = self->_actionHandler;
  self->_id actionHandler = v7;

  [(UIButton *)self->_button setTitle:v6 forState:0];
  button = self->_button;

  [(UIButton *)button setHidden:v6 == 0];
}

- (void)setSummaryText:(id)a3
{
  v4 = (NSString *)[a3 copy];
  summaryText = self->_summaryText;
  self->_summaryText = v4;

  [(RoutePlanningOptionsBar *)self _updateContent];
}

- (void)setVehicle:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_vehicle, a3);
  id v5 = [v6 isPureElectricVehicle];
  [(NSLayoutConstraint *)self->_summaryToTrailingConstraint setActive:v5 ^ 1];
  [(NSLayoutConstraint *)self->_summaryToBatteryConstraint setActive:v5];
  [(NSLayoutConstraint *)self->_batteryToTrailingConstraint setActive:v5];
  [(RoutePlanningOptionsBar *)self _updateContent];
}

- (void)_updateContent
{
  v3 = [(RoutePlanningOptionsBar *)self vehicle];

  if (v3)
  {
    v4 = [(RoutePlanningOptionsBar *)self vehicle];
    unsigned int v5 = [v4 isPureElectricVehicle];

    id v6 = [(RoutePlanningOptionsBar *)self vehicle];
    id v7 = v6;
    if (v5)
    {
      id v18 = [v6 displayedBatteryPercentage];

      v8 = [(RoutePlanningOptionsBar *)self vehicle];
      v9 = [v8 combinedDisplayName];
      double v10 = +[NSBundle mainBundle];
      double v11 = [v10 localizedStringForKey:@"%lu%%" value:@"localized string not found" table:0];
      double v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v18);
      v13 = +[NSString stringWithFormat:@"%@: %@", v9, v12];
      uint64_t v14 = 16;
      [(UILabel *)self->_summaryLabel setText:v13];

      p_batteryView = &self->_batteryView;
      [(BatteryIconView *)self->_batteryView setLevel:v18];
    }
    else
    {
      v16 = [v6 combinedDisplayName];
      uint64_t v14 = 16;
      [(UILabel *)self->_summaryLabel setText:v16];

      p_batteryView = &self->_batteryView;
    }
    [(BatteryIconView *)*p_batteryView setHidden:v5 ^ 1];
  }
  else
  {
    [(UILabel *)self->_summaryLabel setText:self->_summaryText];
    [(UILabel *)self->_summaryLabel setHidden:self->_summaryText == 0];
    uint64_t v14 = 24;
  }
  double v17 = *(Class *)((char *)&self->super.super.super.isa + v14);

  [v17 setHidden:v3 == 0];
}

- (void)_buttonTapped
{
  id actionHandler = (void (**)(void))self->_actionHandler;
  if (actionHandler) {
    actionHandler[2]();
  }
}

- (NSString)summaryText
{
  return self->_summaryText;
}

- (VGVehicle)vehicle
{
  return self->_vehicle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_summaryText, 0);
  objc_storeStrong((id *)&self->_batteryToTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_summaryToBatteryConstraint, 0);
  objc_storeStrong((id *)&self->_summaryToTrailingConstraint, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_batteryView, 0);
  objc_storeStrong((id *)&self->_summaryLabel, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end