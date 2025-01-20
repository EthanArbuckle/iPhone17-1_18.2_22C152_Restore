@interface BatteryStateAgeView
- (BOOL)shouldShowSeparator;
- (BatteryStateAgeView)initWithConfiguration:(int64_t)a3;
- (NSDate)dateOfLastSync;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)_setupConstraints;
- (void)_setupStyling;
- (void)_updateContents;
- (void)setDateOfLastSync:(id)a3;
- (void)setShouldShowSeparator:(BOOL)a3;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation BatteryStateAgeView

- (BatteryStateAgeView)initWithConfiguration:(int64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)BatteryStateAgeView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = -[BatteryStateAgeView initWithFrame:](&v17, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v7)
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [(BatteryStateAgeView *)v7 setAccessibilityIdentifier:v9];

    v7->_configuration = a3;
    v10 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    stateUpdatedLabel = v7->_stateUpdatedLabel;
    v7->_stateUpdatedLabel = v10;

    [(UILabel *)v7->_stateUpdatedLabel setAccessibilityIdentifier:@"StateUpdatedLabel"];
    [(UILabel *)v7->_stateUpdatedLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v7->_stateUpdatedLabel setAdjustsFontForContentSizeCategory:1];
    LODWORD(v12) = 1148846080;
    [(UILabel *)v7->_stateUpdatedLabel setContentCompressionResistancePriority:1 forAxis:v12];
    [(BatteryStateAgeView *)v7 addSubview:v7->_stateUpdatedLabel];
    v13 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    activityIndicator = v7->_activityIndicator;
    v7->_activityIndicator = v13;

    [(UIActivityIndicatorView *)v7->_activityIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v7->_activityIndicator setAccessibilityIdentifier:@"BatteryStateActivityIndicator"];
    LODWORD(v15) = 1148846080;
    [(UIActivityIndicatorView *)v7->_activityIndicator setContentCompressionResistancePriority:1 forAxis:v15];
    [(BatteryStateAgeView *)v7 addSubview:v7->_activityIndicator];
    [(BatteryStateAgeView *)v7 _setupConstraints];
    [(BatteryStateAgeView *)v7 _setupStyling];
  }
  return v7;
}

- (void)_setupConstraints
{
  v34 = +[NSMutableArray array];
  v33 = [(UILabel *)self->_stateUpdatedLabel topAnchor];
  v32 = [(BatteryStateAgeView *)self topAnchor];
  v31 = [v33 constraintGreaterThanOrEqualToAnchor:v32];
  v35[0] = v31;
  v30 = [(UILabel *)self->_stateUpdatedLabel leadingAnchor];
  v29 = [(BatteryStateAgeView *)self leadingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v35[1] = v28;
  v27 = [(UILabel *)self->_stateUpdatedLabel centerYAnchor];
  v26 = [(BatteryStateAgeView *)self centerYAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v35[2] = v25;
  v24 = [(BatteryStateAgeView *)self trailingAnchor];
  v23 = [(UILabel *)self->_stateUpdatedLabel trailingAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v35[3] = v22;
  v21 = [(BatteryStateAgeView *)self bottomAnchor];
  v20 = [(UILabel *)self->_stateUpdatedLabel bottomAnchor];
  v19 = [v21 constraintGreaterThanOrEqualToAnchor:v20];
  v35[4] = v19;
  v18 = [(UIActivityIndicatorView *)self->_activityIndicator topAnchor];
  objc_super v17 = [(BatteryStateAgeView *)self topAnchor];
  v16 = [v18 constraintGreaterThanOrEqualToAnchor:v17];
  v35[5] = v16;
  double v15 = [(UIActivityIndicatorView *)self->_activityIndicator leadingAnchor];
  v14 = [(BatteryStateAgeView *)self leadingAnchor];
  v13 = [v15 constraintEqualToAnchor:v14 constant:8.0];
  v35[6] = v13;
  v3 = [(UIActivityIndicatorView *)self->_activityIndicator centerYAnchor];
  v4 = [(BatteryStateAgeView *)self centerYAnchor];
  v5 = [v3 constraintEqualToAnchor:v4];
  v35[7] = v5;
  v6 = [(BatteryStateAgeView *)self trailingAnchor];
  v7 = [(UIActivityIndicatorView *)self->_activityIndicator trailingAnchor];
  v8 = [v6 constraintGreaterThanOrEqualToAnchor:v7];
  v35[8] = v8;
  v9 = [(BatteryStateAgeView *)self bottomAnchor];
  v10 = [(UIActivityIndicatorView *)self->_activityIndicator bottomAnchor];
  v11 = [v9 constraintGreaterThanOrEqualToAnchor:v10];
  v35[9] = v11;
  double v12 = +[NSArray arrayWithObjects:v35 count:10];
  [v34 addObjectsFromArray:v12];

  +[NSLayoutConstraint activateConstraints:v34];
}

- (void)_setupStyling
{
  v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)self->_stateUpdatedLabel setFont:v3];

  v4 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_stateUpdatedLabel setTextColor:v4];

  stateUpdatedLabel = self->_stateUpdatedLabel;

  [(UILabel *)stateUpdatedLabel setNumberOfLines:2];
}

- (void)_updateContents
{
  [(NSDate *)self->_dateOfLastSync timeIntervalSinceNow];
  double v4 = v3;
  GEOConfigGetDouble();
  double v6 = v5;
  char BOOL = GEOConfigGetBOOL();
  int64_t configuration = self->_configuration;
  BOOL v9 = configuration == 1 || v4 <= -v6;
  if (v9 || (BOOL & 1) != 0)
  {
    if (configuration)
    {
      dateOfLastSync = self->_dateOfLastSync;
      double v12 = +[NSDate date];
      v13 = dateOfLastSync;
      [(NSDate *)v13 timeIntervalSinceDate:v12];
      double v15 = v14;
      [(NSDate *)v13 timeIntervalSinceDate:v12];
      if (v15 >= 0.0) {
        double v17 = v16;
      }
      else {
        double v17 = -v16;
      }
      if (v17 >= 60.0)
      {
        if (v17 >= 3600.0)
        {
          v19 = +[NSBundle mainBundle];
          v20 = v19;
          if (v17 >= 86400.0)
          {
            unint64_t v18 = vcvtmd_u64_f64(v17 / 86400.0);
            CFStringRef v21 = @"VehicleBattery_Date_relative_time_days_ago";
          }
          else
          {
            unint64_t v18 = vcvtmd_u64_f64(v17 / 3600.0);
            CFStringRef v21 = @"VehicleBattery_Date_relative_time_hours_ago";
          }
        }
        else
        {
          unint64_t v18 = vcvtmd_u64_f64(v17 / 60.0);
          v19 = +[NSBundle mainBundle];
          v20 = v19;
          CFStringRef v21 = @"VehicleBattery_Date_relative_time_minutes_ago";
        }
      }
      else
      {
        unint64_t v18 = vcvtmd_u64_f64(v17);
        v19 = +[NSBundle mainBundle];
        v20 = v19;
        CFStringRef v21 = @"VehicleBattery_Date_relative_time_seconds_ago";
      }
      v25 = [v19 localizedStringForKey:v21 value:@"localized string not found" table:0];

      id v31 = 0;
      v24 = +[NSString localizedStringWithValidatedFormat:v25, @"%d", &v31, v18 validFormatSpecifiers error];
      id v26 = v31;
    }
    else
    {
      v22 = self->_dateOfLastSync;
      v23 = +[NSDate date];
      v24 = +[NSDateComponentsFormatter _mapkit_descriptionForTimeSinceDate:v22 referenceDate:v23 smallestUnit:128];
    }
    id v27 = [(BatteryStateAgeView *)self effectiveUserInterfaceLayoutDirection];
    if ([(BatteryStateAgeView *)self shouldShowSeparator])
    {
      v28 = +[NSBundle mainBundle];
      v29 = [v28 localizedStringForKey:@" · [List view details separator]" value:@"localized string not found" table:0];
    }
    else
    {
      v29 = &stru_101324E70;
    }
    if (v27 == (id)1) {
      +[NSString stringWithFormat:@"%@%@", v24, v29];
    }
    else {
    v30 = +[NSString stringWithFormat:@"%@%@", v29, v24];
    }
    [(UILabel *)self->_stateUpdatedLabel setText:v30];
  }
  else
  {
    stateUpdatedLabel = self->_stateUpdatedLabel;
    [(UILabel *)stateUpdatedLabel setText:&stru_101324E70];
  }
}

- (void)setDateOfLastSync:(id)a3
{
  double v5 = (NSDate *)a3;
  if (self->_dateOfLastSync != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_dateOfLastSync, a3);
    [(BatteryStateAgeView *)self _updateContents];
    double v5 = v6;
  }
}

- (void)setShouldShowSeparator:(BOOL)a3
{
  if (self->_shouldShowSeparator != a3)
  {
    self->_shouldShowSeparator = a3;
    [(BatteryStateAgeView *)self _updateContents];
  }
}

- (void)startAnimating
{
  [(UIActivityIndicatorView *)self->_activityIndicator setAlpha:1.0];
  [(UILabel *)self->_stateUpdatedLabel setAlpha:0.0];
  activityIndicator = self->_activityIndicator;

  [(UIActivityIndicatorView *)activityIndicator startAnimating];
}

- (void)stopAnimating
{
  [(UIActivityIndicatorView *)self->_activityIndicator setAlpha:0.0];
  [(UILabel *)self->_stateUpdatedLabel setAlpha:1.0];
  activityIndicator = self->_activityIndicator;

  [(UIActivityIndicatorView *)activityIndicator stopAnimating];
}

- (id)viewForFirstBaselineLayout
{
  return self->_stateUpdatedLabel;
}

- (id)viewForLastBaselineLayout
{
  return self->_stateUpdatedLabel;
}

- (BOOL)shouldShowSeparator
{
  return self->_shouldShowSeparator;
}

- (NSDate)dateOfLastSync
{
  return self->_dateOfLastSync;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastSync, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);

  objc_storeStrong((id *)&self->_stateUpdatedLabel, 0);
}

@end