@interface RoutePlanningWaypointPillView
- (RoutePlanningWaypointPillView)initWithWaypointIndex:(unint64_t)a3 waypointInfoProvider:(id)a4;
- (double)boundsHeight;
- (id)_attributedBatteryChargeStringForBatteryPercentage:(unsigned int)a3;
- (id)_attributedTitleTextForWaypointAtIndex:(unint64_t)a3 withInfoProvider:(id)a4;
- (void)layoutSubviews;
- (void)setBoundsHeight:(double)a3;
@end

@implementation RoutePlanningWaypointPillView

- (RoutePlanningWaypointPillView)initWithWaypointIndex:(unint64_t)a3 waypointInfoProvider:(id)a4
{
  id v6 = a4;
  v34.receiver = self;
  v34.super_class = (Class)RoutePlanningWaypointPillView;
  v7 = [(RoutePlanningWaypointPillView *)&v34 init];
  if (v7)
  {
    v8 = +[UIColor quaternarySystemFillColor];
    [(RoutePlanningWaypointPillView *)v7 setBackgroundColor:v8];

    uint64_t v9 = objc_opt_new();
    textLabel = v7->_textLabel;
    v7->_textLabel = (UILabel *)v9;

    [(UILabel *)v7->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v11) = 1148846080;
    [(UILabel *)v7->_textLabel setContentCompressionResistancePriority:0 forAxis:v11];
    LODWORD(v12) = 1148846080;
    [(UILabel *)v7->_textLabel setContentCompressionResistancePriority:1 forAxis:v12];
    v13 = +[UIColor secondaryLabelColor];
    [(UILabel *)v7->_textLabel setTextColor:v13];

    v14 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleCaption1 weight:UIFontWeightBold];
    [(UILabel *)v7->_textLabel setFont:v14];

    [(RoutePlanningWaypointPillView *)v7 addSubview:v7->_textLabel];
    v15 = [(RoutePlanningWaypointPillView *)v7 _attributedTitleTextForWaypointAtIndex:a3 withInfoProvider:v6];
    [(UILabel *)v7->_textLabel setAttributedText:v15];

    v32 = [(UILabel *)v7->_textLabel leadingAnchor];
    v31 = [(RoutePlanningWaypointPillView *)v7 leadingAnchor];
    v30 = [v32 constraintEqualToAnchor:v31 constant:8.0];
    v35[0] = v30;
    v29 = [(UILabel *)v7->_textLabel trailingAnchor];
    v28 = [(RoutePlanningWaypointPillView *)v7 trailingAnchor];
    v27 = [v29 constraintEqualToAnchor:v28 constant:-8.0];
    v35[1] = v27;
    v26 = [(UILabel *)v7->_textLabel topAnchor];
    v16 = [(RoutePlanningWaypointPillView *)v7 topAnchor];
    v17 = [v26 constraintEqualToAnchor:v16 constant:5.5];
    v35[2] = v17;
    v18 = [(UILabel *)v7->_textLabel centerYAnchor];
    v19 = [(RoutePlanningWaypointPillView *)v7 centerYAnchor];
    [v18 constraintEqualToAnchor:v19];
    v20 = id v33 = v6;
    v35[3] = v20;
    v21 = [(UILabel *)v7->_textLabel bottomAnchor];
    v22 = [(RoutePlanningWaypointPillView *)v7 bottomAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:-5.5];
    v35[4] = v23;
    v24 = +[NSArray arrayWithObjects:v35 count:5];
    +[NSLayoutConstraint activateConstraints:v24];

    id v6 = v33;
  }

  return v7;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RoutePlanningWaypointPillView;
  [(RoutePlanningWaypointPillView *)&v3 layoutSubviews];
  [(RoutePlanningWaypointPillView *)self bounds];
  [(RoutePlanningWaypointPillView *)self setBoundsHeight:CGRectGetHeight(v4)];
}

- (void)setBoundsHeight:(double)a3
{
  if (vabdd_f64(a3, self->_boundsHeight) > 2.22044605e-16)
  {
    self->_boundsHeight = a3;
    [(RoutePlanningWaypointPillView *)self _setContinuousCornerRadius:a3 * 0.5];
  }
}

- (id)_attributedTitleTextForWaypointAtIndex:(unint64_t)a3 withInfoProvider:(id)a4
{
  id v6 = a4;
  v7 = [v6 chargingInfoForWaypointAtIndex:a3];
  v8 = v7;
  if (v7)
  {
    [v7 chargingTime];
    v10 = +[NSString _navigation_stringWithSeconds:(unint64_t)v9 andAbbreviationType:1];
    id v11 = [objc_alloc((Class)NSAttributedString) initWithString:v10];
LABEL_5:
    v13 = v11;
    goto LABEL_6;
  }
  double v12 = [v6 evStepInfoForWaypointAtIndex:a3];
  v10 = v12;
  if (v12)
  {
    -[RoutePlanningWaypointPillView _attributedBatteryChargeStringForBatteryPercentage:](self, "_attributedBatteryChargeStringForBatteryPercentage:", [v12 remainingBatteryPercentage]);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v15 = sub_1005762E4();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v19 = 136315650;
    v20 = "-[RoutePlanningWaypointPillView _attributedTitleTextForWaypointAtIndex:withInfoProvider:]";
    __int16 v21 = 2080;
    v22 = "RoutePlanningWaypointPillView.m";
    __int16 v23 = 1024;
    int v24 = 92;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v19, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    v16 = sub_1005762E4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = +[NSThread callStackSymbols];
      int v19 = 138412290;
      v20 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);
    }
  }
  v18 = sub_1005768D4();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    int v19 = 134217984;
    v20 = (const char *)a3;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Didn't get evInfo for waypoint at index: %lu", (uint8_t *)&v19, 0xCu);
  }

  v13 = 0;
LABEL_6:

  return v13;
}

- (id)_attributedBatteryChargeStringForBatteryPercentage:(unsigned int)a3
{
  CGRect v4 = [(UILabel *)self->_textLabel font];
  v5 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleCaption1 scale:1];
  id v6 = +[UIImage systemImageNamed:@"bolt.fill"];
  v7 = [v6 imageWithConfiguration:v5];
  v8 = [v7 imageWithRenderingMode:2];

  uint64_t v9 = a3;
  v10 = +[VehicleBatteryView colorForBatteryLevel:a3];
  id v11 = [v8 _flatImageWithColor:v10];
  double v12 = [v11 imageWithRenderingMode:1];

  v13 = objc_opt_new();
  [v13 setImage:v12];
  [v4 capHeight];
  double v15 = v14;
  [v12 size];
  double v17 = (v15 - v16) * 0.5;
  [v12 size];
  double v19 = v18;
  [v12 size];
  [v13 setBounds:0.0, v17, v19, v20];
  __int16 v21 = +[NSAttributedString attributedStringWithAttachment:v13];
  v22 = +[NSString stringWithFormat:@" %lu%%", v9];
  id v23 = [objc_alloc((Class)NSMutableAttributedString) initWithAttributedString:v21];
  id v24 = [objc_alloc((Class)NSAttributedString) initWithString:v22];
  [v23 appendAttributedString:v24];

  id v25 = [v23 copy];

  return v25;
}

- (double)boundsHeight
{
  return self->_boundsHeight;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_waypointInfoProvider);

  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end