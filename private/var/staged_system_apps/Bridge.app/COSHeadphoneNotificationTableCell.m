@interface COSHeadphoneNotificationTableCell
- (COSHeadphoneNotificationTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)accessibilityConstraintsWithVariableBindings:(id)a3 metrics:(id)a4 hideChart:(BOOL)a5;
- (id)accessibilityHorizontalConstraintsWithVariableBindings:(id)a3 metrics:(id)a4 hideChart:(BOOL)a5;
- (id)accessibilityVerticalConstraintsWithVariableBindings:(id)a3 metrics:(id)a4 hideChart:(BOOL)a5;
- (id)regularConstraintsWithVariableBindings:(id)a3 metrics:(id)a4 hideChart:(BOOL)a5;
- (id)regularHorizontalConstraintsWithVariableBindings:(id)a3 metrics:(id)a4 hideChart:(BOOL)a5;
- (id)regularVerticalConstraintsWithVariableBindings:(id)a3 metrics:(id)a4 hideChart:(BOOL)a5;
- (void)layoutSubviews;
- (void)updateConstraints;
@end

@implementation COSHeadphoneNotificationTableCell

- (COSHeadphoneNotificationTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v30.receiver = self;
  v30.super_class = (Class)COSHeadphoneNotificationTableCell;
  v9 = [(COSHeadphoneNotificationTableCell *)&v30 initWithStyle:a3 reuseIdentifier:a4];
  v10 = v9;
  if (v9)
  {
    v11 = [(COSHeadphoneNotificationTableCell *)v9 titleLabel];
    [v11 setHidden:1];

    v12 = [(COSHeadphoneNotificationTableCell *)v10 valueLabel];
    [v12 setHidden:1];

    uint64_t v13 = sub_1000247EC();
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = (UILabel *)v13;

    uint64_t v15 = sub_1000248DC();
    countLabel = v10->_countLabel;
    v10->_countLabel = (UILabel *)v15;

    v17 = [(COSHeadphoneNotificationTableCell *)v10 contentView];
    [v17 addSubview:v10->_titleLabel];
    [v17 addSubview:v10->_countLabel];
    uint64_t v18 = [v8 propertyForKey:@"NotificationDataKey"];
    notificationData = v10->_notificationData;
    v10->_notificationData = (NSArray *)v18;

    v20 = v10->_notificationData;
    if (v20
      && [(NSArray *)v20 count]
      && ([(NSArray *)v10->_notificationData valueForKeyPath:@"@sum.count"],
          v21 = objc_claimAutoreleasedReturnValue(),
          unsigned int v22 = [v21 isEqual:&off_10025BE60],
          v21,
          !v22))
    {
      v10->_shouldHideChart = 0;
      v24 = +[HeadphoneAudioNotificationModel shared];
      [v24 setData:v10->_notificationData];

      uint64_t v25 = +[HeadphoneNotificationChartFactory create];
      hostingController = v10->_hostingController;
      v10->_hostingController = (UIViewController *)v25;

      uint64_t v27 = [(UIViewController *)v10->_hostingController view];
      notificationChart = v10->_notificationChart;
      v10->_notificationChart = (UIView *)v27;

      v29 = [(COSHeadphoneNotificationTableCell *)v10 backgroundColor];
      [(UIView *)v10->_notificationChart setBackgroundColor:v29];

      [v17 addSubview:v10->_notificationChart];
      [(UIView *)v10->_notificationChart setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    else
    {
      v10->_shouldHideChart = 1;
    }
    [(COSHeadphoneNotificationTableCell *)v10 layoutSubviews];
  }
  return v10;
}

- (void)layoutSubviews
{
  v3 = [(COSHeadphoneNotificationTableCell *)self textLabel];
  v4 = [v3 text];
  v5 = +[NSString stringWithFormat:@"%@", v4];
  [(UILabel *)self->_titleLabel setText:v5];

  v6 = [(COSHeadphoneNotificationTableCell *)self valueLabel];
  v7 = [v6 text];
  id v8 = +[NSString stringWithFormat:@"%@", v7];
  [(UILabel *)self->_countLabel setText:v8];

  v9.receiver = self;
  v9.super_class = (Class)COSHeadphoneNotificationTableCell;
  [(COSHeadphoneNotificationTableCell *)&v9 layoutSubviews];
  [(COSHeadphoneNotificationTableCell *)self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  +[NSLayoutConstraint deactivateConstraints:self->_constraints];
  id v3 = objc_alloc_init((Class)NSDictionary);
  id v4 = objc_alloc_init((Class)NSDictionary);
  if (self->_shouldHideChart)
  {
    v5 = _NSDictionaryOfVariableBindings(@"_titleLabel, _countLabel", self->_titleLabel, self->_countLabel, 0);

    v6 = _NSDictionaryOfVariableBindings(@"minimumLabelMargin", &off_10025C370, 0);
  }
  else
  {
    [(UILabel *)self->_titleLabel textSize];
    uint64_t v8 = +[NSNumber numberWithDouble:v7 * 5.0];
    v5 = _NSDictionaryOfVariableBindings(@"_titleLabel, _countLabel, _notificationChart", self->_titleLabel, self->_countLabel, self->_notificationChart, 0);

    v6 = _NSDictionaryOfVariableBindings(@"minimumLabelMargin, chartMargin, minimumChartHeight", &off_10025C370, &off_10025C380, v8, 0);

    id v4 = (id)v8;
  }

  objc_super v9 = [(COSHeadphoneNotificationTableCell *)self traitCollection];
  v10 = [v9 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

  BOOL shouldHideChart = self->_shouldHideChart;
  if (IsAccessibilityCategory) {
    [(COSHeadphoneNotificationTableCell *)self accessibilityConstraintsWithVariableBindings:v5 metrics:v6 hideChart:shouldHideChart];
  }
  else {
  uint64_t v13 = [(COSHeadphoneNotificationTableCell *)self regularConstraintsWithVariableBindings:v5 metrics:v6 hideChart:shouldHideChart];
  }
  constraints = self->_constraints;
  self->_constraints = v13;

  +[NSLayoutConstraint activateConstraints:self->_constraints];
  v15.receiver = self;
  v15.super_class = (Class)COSHeadphoneNotificationTableCell;
  [(COSHeadphoneNotificationTableCell *)&v15 updateConstraints];
}

- (id)regularConstraintsWithVariableBindings:(id)a3 metrics:(id)a4 hideChart:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(COSHeadphoneNotificationTableCell *)self regularHorizontalConstraintsWithVariableBindings:v9 metrics:v8 hideChart:v5];
  v11 = [(COSHeadphoneNotificationTableCell *)self regularVerticalConstraintsWithVariableBindings:v9 metrics:v8 hideChart:v5];

  v12 = [v10 arrayByAddingObjectsFromArray:v11];

  return v12;
}

- (id)regularHorizontalConstraintsWithVariableBindings:(id)a3 metrics:(id)a4 hideChart:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[_titleLabel]-(>=minimumLabelMargin)-[_countLabel]-|", 0, v8, v7);
  if (!a5)
  {
    v10 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-chartMargin-[_notificationChart]-chartMargin-|", 0, v8, v7);
    uint64_t v11 = [v9 arrayByAddingObjectsFromArray:v10];

    id v9 = (void *)v11;
  }

  return v9;
}

- (id)regularVerticalConstraintsWithVariableBindings:(id)a3 metrics:(id)a4 hideChart:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init((Class)NSArray);
  id v10 = objc_alloc_init((Class)NSArray);
  id v11 = objc_alloc_init((Class)NSArray);
  if (v5)
  {
    v12 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-[_titleLabel]-|", 0, v7, v8);

    CFStringRef v13 = @"V:|-[_countLabel]-|";
  }
  else
  {
    v12 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-[_titleLabel]-(>=minimumLabelMargin)-[_notificationChart(>=minimumChartHeight)]-|", 0, v7, v8);

    CFStringRef v13 = @"V:|-[_countLabel]-(>=minimumLabelMargin)-[_notificationChart(>=minimumChartHeight)]-|";
  }
  v14 = +[NSLayoutConstraint constraintsWithVisualFormat:v13 options:0 metrics:v7 views:v8];

  objc_super v15 = [v12 arrayByAddingObjectsFromArray:v14];

  return v15;
}

- (id)accessibilityConstraintsWithVariableBindings:(id)a3 metrics:(id)a4 hideChart:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(COSHeadphoneNotificationTableCell *)self accessibilityHorizontalConstraintsWithVariableBindings:v9 metrics:v8 hideChart:v5];
  id v11 = [(COSHeadphoneNotificationTableCell *)self accessibilityVerticalConstraintsWithVariableBindings:v9 metrics:v8 hideChart:v5];

  v12 = [v10 arrayByAddingObjectsFromArray:v11];

  return v12;
}

- (id)accessibilityHorizontalConstraintsWithVariableBindings:(id)a3 metrics:(id)a4 hideChart:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[_titleLabel]-|", 0, v8, v7);
  id v10 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[_countLabel]-|", 0, v8, v7);
  id v11 = [v9 arrayByAddingObjectsFromArray:v10];
  if (!a5)
  {
    v12 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-chartMargin-[_notificationChart]-chartMargin-|", 0, v8, v7);
    uint64_t v13 = [v11 arrayByAddingObjectsFromArray:v12];

    id v11 = (void *)v13;
  }

  return v11;
}

- (id)accessibilityVerticalConstraintsWithVariableBindings:(id)a3 metrics:(id)a4 hideChart:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init((Class)NSArray);
  if (v5) {
    CFStringRef v10 = @"V:|-[_titleLabel]-[_countLabel]-|";
  }
  else {
    CFStringRef v10 = @"V:|-[_titleLabel]-[_countLabel]-[_notificationChart(>=minimumChartHeight)]-|";
  }
  id v11 = +[NSLayoutConstraint constraintsWithVisualFormat:v10 options:0 metrics:v7 views:v8];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_storeStrong((id *)&self->_notificationChart, 0);
  objc_storeStrong((id *)&self->_notificationData, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end