@interface MTASleepAlarmTableViewCell
+ (id)_clockLabelTextFont;
- (BOOL)_shouldUseRegularLayout;
- (MTASleepAlarmTableViewCell)init;
- (MTASleepAlarmTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MTASleepAlarmTableViewCellDelegate)delegate;
- (MTUIDigitalClockLabel)digitalClockLabel;
- (NSArray)accessibilitySizeLayoutConstraints;
- (NSArray)currentConstraints;
- (NSArray)regularLayoutConstraints;
- (NSLayoutConstraint)clockLabelBaselineToTopConstraint;
- (NSLayoutConstraint)clockLabelDetailLabelSpaceConstraint;
- (NSLayoutConstraint)clockLabelHeightConstraint;
- (UIButton)changeButton;
- (UILabel)detailLabel;
- (double)_changeButtonWidth;
- (double)_viewAvailabelWidth;
- (void)_changeButtonPressed:(id)a3;
- (void)internalSetBackgroundColor:(id)a3;
- (void)refreshWithSleepMetadata:(id)a3;
- (void)setAccessibilitySizeLayoutConstraints:(id)a3;
- (void)setChangeButton:(id)a3;
- (void)setClockLabelBaselineToTopConstraint:(id)a3;
- (void)setClockLabelDetailLabelSpaceConstraint:(id)a3;
- (void)setClockLabelHeightConstraint:(id)a3;
- (void)setCurrentConstraints:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailLabel:(id)a3;
- (void)setDigitalClockLabel:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setMainLabelWithAlarm:(id)a3;
- (void)setRegularLayoutConstraints:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setupChangeButton;
- (void)setupConstraints;
- (void)setupSharedLayoutConstraint;
- (void)traitCollectionDidChange:(id)a3;
- (void)willTransitionToState:(unint64_t)a3;
@end

@implementation MTASleepAlarmTableViewCell

- (MTASleepAlarmTableViewCell)init
{
  return [(MTASleepAlarmTableViewCell *)self initWithStyle:0 reuseIdentifier:off_1000C7000];
}

- (MTASleepAlarmTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v24.receiver = self;
  v24.super_class = (Class)MTASleepAlarmTableViewCell;
  v4 = [(MTASleepAlarmTableViewCell *)&v24 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc((Class)MTUIDigitalClockLabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v9 = [v5 initWithFrame:CGRectZero.origin.x, y, width, height];
    digitalClockLabel = v4->_digitalClockLabel;
    v4->_digitalClockLabel = v9;

    v11 = +[UIFont mtui_thinTimeFont];
    [(MTUIDigitalClockLabel *)v4->_digitalClockLabel setFont:v11];

    v12 = +[UIFont mtui_defaultTimeDesignatorFont];
    [(MTUIDigitalClockLabel *)v4->_digitalClockLabel setTimeDesignatorFont:v12];

    v13 = +[UIColor clearColor];
    [(MTUIDigitalClockLabel *)v4->_digitalClockLabel setBackgroundColor:v13];

    v14 = [(MTUIDigitalClockLabel *)v4->_digitalClockLabel dateLabel];
    [v14 setLineBreakMode:0];

    v15 = [(MTUIDigitalClockLabel *)v4->_digitalClockLabel dateLabel];
    [v15 setNumberOfLines:0];

    [(MTUIDigitalClockLabel *)v4->_digitalClockLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [(MTASleepAlarmTableViewCell *)v4 contentView];
    [v16 addSubview:v4->_digitalClockLabel];

    v17 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    detailLabel = v4->_detailLabel;
    v4->_detailLabel = v17;

    v19 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleSubheadline maximumContentSizeCategory:UIContentSizeCategoryAccessibilityLarge];
    [(UILabel *)v4->_detailLabel setFont:v19];

    [(UILabel *)v4->_detailLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v4->_detailLabel setNumberOfLines:0];
    [(UILabel *)v4->_detailLabel setLineBreakMode:0];
    [(UILabel *)v4->_detailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v20 = [(MTASleepAlarmTableViewCell *)v4 contentView];
    [v20 addSubview:v4->_detailLabel];

    [(MTASleepAlarmTableViewCell *)v4 setupChangeButton];
    v21 = +[UIColor mtui_cellHighlightColor];
    [(MTASleepAlarmTableViewCell *)v4 setSelectedBackgroundColor:v21];

    [(MTASleepAlarmTableViewCell *)v4 setupSharedLayoutConstraint];
    v22 = v4;
  }

  return v4;
}

- (void)setupSharedLayoutConstraint
{
  id v50 = (id)objc_opt_new();
  v3 = [(MTASleepAlarmTableViewCell *)self digitalClockLabel];
  v4 = [v3 leadingAnchor];
  id v5 = [(MTASleepAlarmTableViewCell *)self contentView];
  v6 = [v5 layoutMarginsGuide];
  v7 = [v6 leadingAnchor];
  v8 = [v4 constraintEqualToAnchor:v7];
  [v50 addObject:v8];

  v9 = [(MTASleepAlarmTableViewCell *)self digitalClockLabel];
  v10 = [v9 firstBaselineAnchor];
  v11 = [(MTASleepAlarmTableViewCell *)self contentView];
  v12 = [v11 topAnchor];
  v13 = [v10 constraintEqualToAnchor:v12 constant:60.0];
  [(MTASleepAlarmTableViewCell *)self setClockLabelBaselineToTopConstraint:v13];

  v14 = [(MTASleepAlarmTableViewCell *)self clockLabelBaselineToTopConstraint];
  [v50 addObject:v14];

  v15 = [(MTASleepAlarmTableViewCell *)self digitalClockLabel];
  v16 = [v15 heightAnchor];
  v17 = [v16 constraintEqualToConstant:0.0];
  [(MTASleepAlarmTableViewCell *)self setClockLabelHeightConstraint:v17];

  v18 = [(MTASleepAlarmTableViewCell *)self clockLabelHeightConstraint];
  [v50 addObject:v18];

  v19 = [(MTASleepAlarmTableViewCell *)self detailLabel];
  v20 = [v19 leadingAnchor];
  v21 = [(MTASleepAlarmTableViewCell *)self digitalClockLabel];
  v22 = [v21 leadingAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  [v50 addObject:v23];

  objc_super v24 = [(MTASleepAlarmTableViewCell *)self detailLabel];
  v25 = [v24 topAnchor];
  v26 = [(MTASleepAlarmTableViewCell *)self digitalClockLabel];
  v27 = [v26 bottomAnchor];
  v28 = [v25 constraintEqualToAnchor:v27 constant:0.0];
  [(MTASleepAlarmTableViewCell *)self setClockLabelDetailLabelSpaceConstraint:v28];

  v29 = [(MTASleepAlarmTableViewCell *)self clockLabelDetailLabelSpaceConstraint];
  [v50 addObject:v29];

  v30 = [(MTASleepAlarmTableViewCell *)self detailLabel];
  v31 = [v30 trailingAnchor];
  v32 = [(MTASleepAlarmTableViewCell *)self digitalClockLabel];
  v33 = [v32 trailingAnchor];
  v34 = [v31 constraintEqualToAnchor:v33];
  [v50 addObject:v34];

  v35 = [(MTASleepAlarmTableViewCell *)self changeButton];
  [v35 bounds];
  double v37 = v36;

  LODWORD(v35) = _os_feature_enabled_impl();
  v38 = [(MTASleepAlarmTableViewCell *)self changeButton];
  v39 = [v38 widthAnchor];
  v40 = v39;
  double v41 = v37 + 24.0;
  if (v35) {
    double v41 = v37;
  }
  v42 = [v39 constraintEqualToConstant:v41];
  [v50 addObject:v42];

  v43 = [(MTASleepAlarmTableViewCell *)self changeButton];
  v44 = [v43 heightAnchor];
  v45 = [(MTASleepAlarmTableViewCell *)self changeButton];
  v46 = [v45 titleLabel];
  v47 = [v46 font];
  [v47 lineHeight];
  v49 = [v44 constraintEqualToConstant:ceil(v48) + 12.0];
  [v50 addObject:v49];

  +[NSLayoutConstraint activateConstraints:v50];
}

- (void)setupChangeButton
{
  if (_os_feature_enabled_impl())
  {
    v3 = +[NSBundle bundleWithIdentifier:@"com.apple.MobileTimerUI"];
    v4 = [v3 localizedStringForKey:@"SLEEP_ALARM_CHANGE" value:&stru_1000A2560 table:@"MobileTimerUI_Burrito"];
    id v5 = +[MTAUtilities pillButtonWithTitle:v4];
    [(MTASleepAlarmTableViewCell *)self setChangeButton:v5];
  }
  else
  {
    v6 = objc_opt_new();
    [(MTASleepAlarmTableViewCell *)self setChangeButton:v6];

    v7 = [(MTASleepAlarmTableViewCell *)self changeButton];
    v8 = +[NSBundle bundleWithIdentifier:@"com.apple.MobileTimerUI"];
    v9 = [v8 localizedStringForKey:@"SLEEP_ALARM_CHANGE" value:&stru_1000A2560 table:@"MobileTimerUI_Burrito"];
    [v7 setTitle:v9 forState:0];

    v10 = +[UIColor mtui_buttonBackgroundColor];
    v11 = [(MTASleepAlarmTableViewCell *)self changeButton];
    [v11 setTintColor:v10];

    v12 = +[UIColor mtui_buttonBackgroundColor];
    v13 = [(MTASleepAlarmTableViewCell *)self changeButton];
    [v13 setBackgroundColor:v12];

    v14 = [(MTASleepAlarmTableViewCell *)self changeButton];
    v15 = [v14 titleLabel];
    v16 = [v15 font];
    [v16 lineHeight];
    double v18 = ceil(v17) * 0.5 + 6.0;
    v19 = [(MTASleepAlarmTableViewCell *)self changeButton];
    v20 = [v19 layer];
    [v20 setCornerRadius:v18];

    v3 = [(MTASleepAlarmTableViewCell *)self changeButton];
    v4 = +[UIColor mtui_tintColor];
    [v3 setTitleColor:v4 forState:0];
  }

  v21 = [(MTASleepAlarmTableViewCell *)self changeButton];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

  v22 = [(MTASleepAlarmTableViewCell *)self changeButton];
  [v22 addTarget:self action:"_changeButtonPressed:" forControlEvents:64];

  id v29 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleSubheadline maximumContentSizeCategory:UIContentSizeCategoryAccessibilityLarge];
  v23 = [v29 familyName];
  [v29 pointSize];
  objc_super v24 = +[UIFont fontWithFamilyName:traits:size:](UIFont, "fontWithFamilyName:traits:size:", v23, 2);
  v25 = [(MTASleepAlarmTableViewCell *)self changeButton];
  v26 = [v25 titleLabel];
  [v26 setFont:v24];

  v27 = [(MTASleepAlarmTableViewCell *)self changeButton];
  [v27 sizeToFit];

  v28 = [(MTASleepAlarmTableViewCell *)self contentView];
  [v28 addSubview:self->_changeButton];
}

- (void)setupConstraints
{
  if ([(MTASleepAlarmTableViewCell *)self _shouldUseRegularLayout]) {
    [(MTASleepAlarmTableViewCell *)self regularLayoutConstraints];
  }
  else {
  id obj = [(MTASleepAlarmTableViewCell *)self accessibilitySizeLayoutConstraints];
  }
  unsigned int v3 = [(MTASleepAlarmTableViewCell *)self _shouldUseRegularLayout];
  [(MTASleepAlarmTableViewCell *)self _viewAvailabelWidth];
  double v5 = v4;
  if (v3)
  {
    [(MTASleepAlarmTableViewCell *)self _changeButtonWidth];
    double v5 = v5 - v6 + -16.0;
  }
  v7 = [(MTASleepAlarmTableViewCell *)self digitalClockLabel];
  [v7 sizeThatFits:v5];
  double v9 = ceil(v8);
  v10 = [(MTASleepAlarmTableViewCell *)self clockLabelHeightConstraint];
  [v10 setConstant:v9];

  id v11 = [(MTASleepAlarmTableViewCell *)self currentConstraints];

  v12 = obj;
  if (v11 != obj)
  {
    v13 = [(MTASleepAlarmTableViewCell *)self currentConstraints];

    if (v13)
    {
      v14 = [(MTASleepAlarmTableViewCell *)self currentConstraints];
      +[NSLayoutConstraint deactivateConstraints:v14];
    }
    objc_storeStrong((id *)&self->_currentConstraints, obj);
    v15 = [(MTASleepAlarmTableViewCell *)self currentConstraints];
    +[NSLayoutConstraint activateConstraints:v15];

    v12 = obj;
  }
}

- (double)_changeButtonWidth
{
  v2 = [(MTASleepAlarmTableViewCell *)self changeButton];
  [v2 sizeThatFits:CGSizeZero.width, CGSizeZero.height];
  double v4 = v3 + 24.0;

  return v4;
}

- (double)_viewAvailabelWidth
{
  v2 = [(MTASleepAlarmTableViewCell *)self contentView];
  [v2 frame];
  double v3 = CGRectGetWidth(v5) + -32.0;

  return v3;
}

- (BOOL)_shouldUseRegularLayout
{
  double v3 = [(MTASleepAlarmTableViewCell *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];
  NSComparisonResult v5 = UIContentSizeCategoryCompareToCategory(v4, UIContentSizeCategoryExtraExtraLarge);

  if (v5 == NSOrderedAscending) {
    return 1;
  }
  double v6 = [(MTASleepAlarmTableViewCell *)self digitalClockLabel];
  double height = CGSizeZero.height;
  [v6 sizeThatFits:CGSizeZero.width, height];
  double v9 = v8;

  v10 = [(MTASleepAlarmTableViewCell *)self detailLabel];
  [v10 sizeThatFits:CGSizeZero.width, height];
  double v12 = v11;

  [(MTASleepAlarmTableViewCell *)self _viewAvailabelWidth];
  double v14 = v13;
  [(MTASleepAlarmTableViewCell *)self _changeButtonWidth];
  double v16 = v14 - v15;
  return v16 - v12 > 16.0 && v16 - v9 > 16.0;
}

- (NSArray)regularLayoutConstraints
{
  regularLayoutConstraints = self->_regularLayoutConstraints;
  if (!regularLayoutConstraints)
  {
    double v4 = (NSArray *)objc_opt_new();
    NSComparisonResult v5 = [(MTASleepAlarmTableViewCell *)self changeButton];
    double v6 = [v5 leadingAnchor];
    v7 = [(MTASleepAlarmTableViewCell *)self digitalClockLabel];
    double v8 = [v7 trailingAnchor];
    double v9 = [v6 constraintEqualToAnchor:v8 constant:16.0];
    [(NSArray *)v4 addObject:v9];

    v10 = [(MTASleepAlarmTableViewCell *)self contentView];
    double v11 = [v10 bottomAnchor];
    double v12 = [(MTASleepAlarmTableViewCell *)self detailLabel];
    double v13 = [v12 lastBaselineAnchor];
    double v14 = [v11 constraintEqualToAnchor:v13 constant:16.0];
    [(NSArray *)v4 addObject:v14];

    double v15 = [(MTASleepAlarmTableViewCell *)self changeButton];
    double v16 = [v15 trailingAnchor];
    double v17 = [(MTASleepAlarmTableViewCell *)self contentView];
    double v18 = [v17 layoutMarginsGuide];
    v19 = [v18 trailingAnchor];
    v20 = [v16 constraintEqualToAnchor:v19];
    [(NSArray *)v4 addObject:v20];

    v21 = [(MTASleepAlarmTableViewCell *)self changeButton];
    v22 = [v21 centerYAnchor];
    v23 = [(MTASleepAlarmTableViewCell *)self contentView];
    objc_super v24 = [v23 centerYAnchor];
    v25 = [v22 constraintEqualToAnchor:v24];
    [(NSArray *)v4 addObject:v25];

    v26 = self->_regularLayoutConstraints;
    self->_regularLayoutConstraints = v4;

    regularLayoutConstraints = self->_regularLayoutConstraints;
  }

  return regularLayoutConstraints;
}

- (NSArray)accessibilitySizeLayoutConstraints
{
  accessibilitySizeLayoutConstraints = self->_accessibilitySizeLayoutConstraints;
  if (!accessibilitySizeLayoutConstraints)
  {
    double v4 = (NSArray *)objc_opt_new();
    NSComparisonResult v5 = [(MTASleepAlarmTableViewCell *)self digitalClockLabel];
    double v6 = [v5 trailingAnchor];
    v7 = [(MTASleepAlarmTableViewCell *)self contentView];
    double v8 = [v7 layoutMarginsGuide];
    double v9 = [v8 trailingAnchor];
    v10 = [v6 constraintEqualToAnchor:v9];
    [(NSArray *)v4 addObject:v10];

    double v11 = [(MTASleepAlarmTableViewCell *)self changeButton];
    double v12 = [v11 topAnchor];
    double v13 = [(MTASleepAlarmTableViewCell *)self detailLabel];
    double v14 = [v13 bottomAnchor];
    double v15 = [v12 constraintEqualToAnchor:v14 constant:6.0];
    [(NSArray *)v4 addObject:v15];

    double v16 = [(MTASleepAlarmTableViewCell *)self changeButton];
    double v17 = [v16 leadingAnchor];
    double v18 = [(MTASleepAlarmTableViewCell *)self contentView];
    v19 = [v18 layoutMarginsGuide];
    v20 = [v19 leadingAnchor];
    v21 = [v17 constraintEqualToAnchor:v20];
    [(NSArray *)v4 addObject:v21];

    v22 = [(MTASleepAlarmTableViewCell *)self contentView];
    v23 = [v22 bottomAnchor];
    objc_super v24 = [(MTASleepAlarmTableViewCell *)self changeButton];
    v25 = [v24 bottomAnchor];
    v26 = [v23 constraintEqualToAnchor:v25 constant:16.0];
    [(NSArray *)v4 addObject:v26];

    v27 = self->_accessibilitySizeLayoutConstraints;
    self->_accessibilitySizeLayoutConstraints = v4;

    accessibilitySizeLayoutConstraints = self->_accessibilitySizeLayoutConstraints;
  }

  return accessibilitySizeLayoutConstraints;
}

- (void)internalSetBackgroundColor:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MTASleepAlarmTableViewCell;
  [(MTASleepAlarmTableViewCell *)&v3 setBackgroundColor:a3];
}

- (void)refreshWithSleepMetadata:(id)a3
{
  id v21 = a3;
  unsigned int v4 = [v21 displaysTime];
  NSComparisonResult v5 = [(MTASleepAlarmTableViewCell *)self clockLabelBaselineToTopConstraint];
  double v6 = v5;
  if (v4)
  {
    [v5 setConstant:60.0];

    v7 = [(MTASleepAlarmTableViewCell *)self clockLabelDetailLabelSpaceConstraint];
    [v7 setConstant:-3.0];

    double v8 = +[UIFont mtui_thinTimeFont];
    [(MTUIDigitalClockLabel *)self->_digitalClockLabel setFont:v8];

    double v9 = [(MTASleepAlarmTableViewCell *)self digitalClockLabel];
    v10 = [v21 alarmComponents];
    id v11 = [v10 hour];
    double v12 = [v21 alarmComponents];
    [v9 setHour:v11 minute:[v12 minute]];
  }
  else
  {
    [v5 setConstant:48.0];

    double v13 = [(MTASleepAlarmTableViewCell *)self clockLabelDetailLabelSpaceConstraint];
    [v13 setConstant:0.0];

    double v14 = +[MTASleepAlarmTableViewCell _clockLabelTextFont];
    [(MTUIDigitalClockLabel *)self->_digitalClockLabel setFont:v14];

    double v9 = [(MTASleepAlarmTableViewCell *)self digitalClockLabel];
    v10 = [v21 mainDescription];
    [v9 setTimeLabelText:v10];
  }

  if ([v21 displaysTime]) {
    +[UIColor mtui_primaryTextColor];
  }
  else {
  double v15 = +[UIColor mtui_disabledTextColor];
  }
  double v16 = [(MTASleepAlarmTableViewCell *)self digitalClockLabel];
  [v16 setTextColor:v15];

  double v17 = [v21 detailedDescription];
  double v18 = [(MTASleepAlarmTableViewCell *)self detailLabel];
  [v18 setText:v17];

  v19 = [(MTASleepAlarmTableViewCell *)self detailLabel];
  [v19 setTextColor:v15];

  v20 = [(MTASleepAlarmTableViewCell *)self detailLabel];
  [v20 sizeToFit];

  [(MTASleepAlarmTableViewCell *)self setupConstraints];
}

- (void)traitCollectionDidChange:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MTASleepAlarmTableViewCell;
  [(MTASleepAlarmTableViewCell *)&v3 traitCollectionDidChange:a3];
}

- (void)setMainLabelWithAlarm:(id)a3
{
  id v4 = a3;
  id v7 = [(MTASleepAlarmTableViewCell *)self digitalClockLabel];
  id v5 = [v4 hour];
  id v6 = [v4 minute];

  [v7 setHour:v5 minute:v6];
}

- (void)_changeButtonPressed:(id)a3
{
  id v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Change button pressed %{public}@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [(MTASleepAlarmTableViewCell *)self delegate];
  [v5 changeButtonPressed];
}

- (void)willTransitionToState:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTASleepAlarmTableViewCell;
  [(MTASleepAlarmTableViewCell *)&v4 willTransitionToState:a3];
  [(MTASleepAlarmTableViewCell *)self setNeedsLayout];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTASleepAlarmTableViewCell;
  [(MTASleepAlarmTableViewCell *)&v5 setSelected:a3 animated:a4];
  [(MTASleepAlarmTableViewCell *)self setNeedsLayout];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTASleepAlarmTableViewCell;
  [(MTASleepAlarmTableViewCell *)&v5 setHighlighted:a3 animated:a4];
  [(MTASleepAlarmTableViewCell *)self setNeedsLayout];
}

+ (id)_clockLabelTextFont
{
  if (qword_1000C7D10 != -1) {
    dispatch_once(&qword_1000C7D10, &stru_1000A1C18);
  }
  v2 = (void *)qword_1000C7D08;

  return v2;
}

- (MTASleepAlarmTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTASleepAlarmTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)changeButton
{
  return self->_changeButton;
}

- (void)setChangeButton:(id)a3
{
}

- (MTUIDigitalClockLabel)digitalClockLabel
{
  return self->_digitalClockLabel;
}

- (void)setDigitalClockLabel:(id)a3
{
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
}

- (NSLayoutConstraint)clockLabelBaselineToTopConstraint
{
  return self->_clockLabelBaselineToTopConstraint;
}

- (void)setClockLabelBaselineToTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)clockLabelDetailLabelSpaceConstraint
{
  return self->_clockLabelDetailLabelSpaceConstraint;
}

- (void)setClockLabelDetailLabelSpaceConstraint:(id)a3
{
}

- (NSLayoutConstraint)clockLabelHeightConstraint
{
  return self->_clockLabelHeightConstraint;
}

- (void)setClockLabelHeightConstraint:(id)a3
{
}

- (void)setRegularLayoutConstraints:(id)a3
{
}

- (void)setAccessibilitySizeLayoutConstraints:(id)a3
{
}

- (NSArray)currentConstraints
{
  return self->_currentConstraints;
}

- (void)setCurrentConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_accessibilitySizeLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_regularLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_clockLabelHeightConstraint, 0);
  objc_storeStrong((id *)&self->_clockLabelDetailLabelSpaceConstraint, 0);
  objc_storeStrong((id *)&self->_clockLabelBaselineToTopConstraint, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_digitalClockLabel, 0);
  objc_storeStrong((id *)&self->_changeButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end