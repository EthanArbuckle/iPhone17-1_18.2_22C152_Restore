@interface MTAAlarmTableViewCell
- (BOOL)_shouldUseRegularLayout;
- (BOOL)isSleepAlarm;
- (MTAAlarmTableViewCell)init;
- (MTAAlarmTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MTAAlarmTableViewCellDelegate)delegate;
- (MTUIDigitalClockLabel)digitalClockLabel;
- (NSArray)accessibilitySizeLayoutConstraints;
- (NSArray)currentConstraints;
- (NSArray)regularLayoutConstraints;
- (UILabel)detailLabel;
- (UISwitch)enabledSwitch;
- (UITapGestureRecognizer)recognizer;
- (UIView)deadZone;
- (void)_alarmActiveChanged:(id)a3;
- (void)internalSetBackgroundColor:(id)a3;
- (void)refreshUI:(id)a3 animated:(BOOL)a4;
- (void)setAccessibilitySizeLayoutConstraints:(id)a3;
- (void)setCurrentConstraints:(id)a3;
- (void)setDeadZone:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailLabel:(id)a3;
- (void)setDigitalClockLabel:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEnabledSwitch:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setIsSleepAlarm:(BOOL)a3;
- (void)setRecognizer:(id)a3;
- (void)setRegularLayoutConstraints:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setupConstraints;
- (void)setupSharedLayoutConstraint;
- (void)willTransitionToState:(unint64_t)a3;
@end

@implementation MTAAlarmTableViewCell

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTAAlarmTableViewCell;
  [(MTAAlarmTableViewCell *)&v5 setHighlighted:a3 animated:a4];
  [(MTAAlarmTableViewCell *)self setNeedsLayout];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTAAlarmTableViewCell;
  [(MTAAlarmTableViewCell *)&v5 setSelected:a3 animated:a4];
  [(MTAAlarmTableViewCell *)self setNeedsLayout];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (![(MTAAlarmTableViewCell *)self isSleepAlarm])
  {
    if (v4) {
      +[UIView beginAnimations:@"EditingAlarmTableViewCell" context:0];
    }
    v7 = [(MTAAlarmTableViewCell *)self enabledSwitch];
    v8 = v7;
    double v9 = 1.0;
    if (v5)
    {
      double v9 = 0.0;
      v10 = (double *)&MTUIAlarmTableViewInsetEdit;
    }
    else
    {
      v10 = (double *)&MTUIAlarmTableViewInsetRegular;
    }
    [v7 setAlpha:v9];

    v11 = [(MTAAlarmTableViewCell *)self recognizer];
    [v11 setEnabled:v5 ^ 1];

    -[MTAAlarmTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, *v10, 0.0, 0.0);
    if (v4) {
      +[UIView commitAnimations];
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)MTAAlarmTableViewCell;
  [(MTAAlarmTableViewCell *)&v12 setEditing:v5 animated:v4];
}

- (BOOL)isSleepAlarm
{
  return self->_isSleepAlarm;
}

- (void)setDelegate:(id)a3
{
}

- (void)refreshUI:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v29 = a3;
  unsigned __int8 v6 = [v29 isSleepAlarm];
  [v29 repeatSchedule];
  if (v6) {
    DateMaskToString();
  }
  else {
  v7 = DetailDateMaskToString();
  }
  v8 = [(MTAAlarmTableViewCell *)self digitalClockLabel];
  [v8 setHour:[v29 hour] minute:[v29 minute]];

  if ([v29 isSleepAlarm])
  {
    double v9 = 0;
  }
  else
  {
    double v9 = [v29 displayTitle];
  }
  id v10 = v9;
  if ([v10 length])
  {
    id v11 = v10;
    if (![v7 length]) {
      goto LABEL_12;
    }
    objc_super v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"ALARM_DETAIL_FORMAT" value:&stru_1000A2560 table:@"Localizable"];

    id v11 = [objc_alloc((Class)NSString) initWithFormat:v13, v10, v7];
  }
  else
  {
    id v11 = v7;
    v13 = v10;
  }

LABEL_12:
  -[MTAAlarmTableViewCell setIsSleepAlarm:](self, "setIsSleepAlarm:", [v29 isSleepAlarm]);
  unsigned int v14 = [v29 isSleepAlarm];
  id v15 = [v29 isEnabled];
  id v16 = v15;
  if (v14)
  {
    if (!v15)
    {
      v20 = [(MTAAlarmTableViewCell *)self enabledSwitch];
      [v20 setOn:0 animated:0];

      goto LABEL_18;
    }
    id v16 = [v29 sleepSchedule];
  }
  v17 = [(MTAAlarmTableViewCell *)self enabledSwitch];
  [v17 setOn:v16 animated:0];

  if (v16)
  {
    v18 = +[UIColor mtui_primaryTextColor];
    uint64_t v19 = +[UIColor mtui_primaryTextColor];
    goto LABEL_19;
  }
LABEL_18:
  v18 = +[UIColor mtui_disabledTextColor];
  uint64_t v19 = +[UIColor mtui_disabledTextColor];
LABEL_19:
  v21 = (void *)v19;
  v22 = +[UIColor mtui_backgroundColor];
  if (v4)
  {
    +[UIView beginAnimations:@"RefreshAlarmTableViewCell" context:0];
    v23 = [(MTAAlarmTableViewCell *)self digitalClockLabel];
    [v23 setTextColor:v18];

    v24 = [(MTAAlarmTableViewCell *)self detailLabel];
    [v24 setText:v11];

    v25 = [(MTAAlarmTableViewCell *)self detailLabel];
    [v25 setTextColor:v21];

    [(MTAAlarmTableViewCell *)self internalSetBackgroundColor:v22];
    +[UIView commitAnimations];
  }
  else
  {
    v26 = [(MTAAlarmTableViewCell *)self digitalClockLabel];
    [v26 setTextColor:v18];

    v27 = [(MTAAlarmTableViewCell *)self detailLabel];
    [v27 setText:v11];

    v28 = [(MTAAlarmTableViewCell *)self detailLabel];
    [v28 setTextColor:v21];

    [(MTAAlarmTableViewCell *)self internalSetBackgroundColor:v22];
  }
  [(MTAAlarmTableViewCell *)self setupConstraints];
}

- (void)setupConstraints
{
  if ([(MTAAlarmTableViewCell *)self _shouldUseRegularLayout]) {
    [(MTAAlarmTableViewCell *)self regularLayoutConstraints];
  }
  else {
  id obj = [(MTAAlarmTableViewCell *)self accessibilitySizeLayoutConstraints];
  }
  id v3 = [(MTAAlarmTableViewCell *)self currentConstraints];

  BOOL v4 = obj;
  if (v3 != obj)
  {
    BOOL v5 = [(MTAAlarmTableViewCell *)self currentConstraints];

    if (v5)
    {
      unsigned __int8 v6 = [(MTAAlarmTableViewCell *)self currentConstraints];
      +[NSLayoutConstraint deactivateConstraints:v6];
    }
    objc_storeStrong((id *)&self->_currentConstraints, obj);
    v7 = [(MTAAlarmTableViewCell *)self currentConstraints];
    +[NSLayoutConstraint activateConstraints:v7];

    BOOL v4 = obj;
  }
}

- (NSArray)currentConstraints
{
  return self->_currentConstraints;
}

- (void)setIsSleepAlarm:(BOOL)a3
{
  self->_isSleepAlarm = a3;
}

- (void)internalSetBackgroundColor:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MTAAlarmTableViewCell;
  [(MTAAlarmTableViewCell *)&v3 setBackgroundColor:a3];
}

- (MTAAlarmTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v38.receiver = self;
  v38.super_class = (Class)MTAAlarmTableViewCell;
  BOOL v4 = [(MTAAlarmTableViewCell *)&v38 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    BOOL v5 = objc_opt_new();
    [(MTAAlarmTableViewCell *)v4 setDeadZone:v5];

    unsigned __int8 v6 = [(MTAAlarmTableViewCell *)v4 deadZone];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    v7 = [(MTAAlarmTableViewCell *)v4 contentView];
    v8 = [(MTAAlarmTableViewCell *)v4 deadZone];
    [v7 addSubview:v8];

    id v9 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v4 action:0];
    [(MTAAlarmTableViewCell *)v4 setRecognizer:v9];

    id v10 = [(MTAAlarmTableViewCell *)v4 deadZone];
    id v11 = [(MTAAlarmTableViewCell *)v4 recognizer];
    [v10 addGestureRecognizer:v11];

    [(MTAAlarmTableViewCell *)v4 setEditingAccessoryType:1];
    objc_super v12 = objc_opt_new();
    [(MTAAlarmTableViewCell *)v4 setEnabledSwitch:v12];

    v13 = +[UIColor systemGreenColor];
    unsigned int v14 = [(MTAAlarmTableViewCell *)v4 enabledSwitch];
    [v14 setOnTintColor:v13];

    id v15 = +[UIColor mtui_switchTintColor];
    id v16 = [(MTAAlarmTableViewCell *)v4 enabledSwitch];
    [v16 setTintColor:v15];

    v17 = [(MTAAlarmTableViewCell *)v4 enabledSwitch];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

    v18 = [(MTAAlarmTableViewCell *)v4 enabledSwitch];
    [v18 addTarget:v4 action:"_alarmActiveChanged:" forControlEvents:4096];

    uint64_t v19 = [(MTAAlarmTableViewCell *)v4 contentView];
    v20 = [(MTAAlarmTableViewCell *)v4 enabledSwitch];
    [v19 addSubview:v20];

    id v21 = objc_alloc((Class)MTUIDigitalClockLabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v25 = [v21 initWithFrame:CGRectZero.origin.x, y, width, height];
    digitalClockLabel = v4->_digitalClockLabel;
    v4->_digitalClockLabel = v25;

    v27 = +[UIFont mtui_thinTimeFont];
    [(MTUIDigitalClockLabel *)v4->_digitalClockLabel setFont:v27];

    v28 = +[UIFont mtui_defaultTimeDesignatorFont];
    [(MTUIDigitalClockLabel *)v4->_digitalClockLabel setTimeDesignatorFont:v28];

    id v29 = +[UIColor clearColor];
    [(MTUIDigitalClockLabel *)v4->_digitalClockLabel setBackgroundColor:v29];

    [(MTUIDigitalClockLabel *)v4->_digitalClockLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v30 = [(MTAAlarmTableViewCell *)v4 contentView];
    [v30 addSubview:v4->_digitalClockLabel];

    v31 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    detailLabel = v4->_detailLabel;
    v4->_detailLabel = v31;

    v33 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleSubheadline maximumContentSizeCategory:UIContentSizeCategoryAccessibilityLarge];
    [(UILabel *)v4->_detailLabel setFont:v33];

    [(UILabel *)v4->_detailLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v4->_detailLabel setNumberOfLines:0];
    [(UILabel *)v4->_detailLabel setLineBreakMode:0];
    [(UILabel *)v4->_detailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v34 = [(MTAAlarmTableViewCell *)v4 contentView];
    [v34 addSubview:v4->_detailLabel];

    v35 = +[UIColor mtui_cellHighlightColor];
    [(MTAAlarmTableViewCell *)v4 setSelectedBackgroundColor:v35];

    [(MTAAlarmTableViewCell *)v4 setupSharedLayoutConstraint];
    v36 = v4;
  }

  return v4;
}

- (UISwitch)enabledSwitch
{
  return self->_enabledSwitch;
}

- (UITapGestureRecognizer)recognizer
{
  return self->_recognizer;
}

- (void)setRecognizer:(id)a3
{
}

- (void)setEnabledSwitch:(id)a3
{
}

- (void)setDeadZone:(id)a3
{
}

- (NSArray)regularLayoutConstraints
{
  regularLayoutConstraints = self->_regularLayoutConstraints;
  if (!regularLayoutConstraints)
  {
    BOOL v4 = (NSArray *)objc_opt_new();
    BOOL v5 = [(MTAAlarmTableViewCell *)self deadZone];
    unsigned __int8 v6 = [v5 leadingAnchor];
    v7 = [(MTAAlarmTableViewCell *)self digitalClockLabel];
    v8 = [v7 trailingAnchor];
    id v9 = [v6 constraintEqualToAnchor:v8];
    [(NSArray *)v4 addObject:v9];

    id v10 = [(MTAAlarmTableViewCell *)self deadZone];
    id v11 = [v10 trailingAnchor];
    objc_super v12 = [(MTAAlarmTableViewCell *)self contentView];
    v13 = [v12 trailingAnchor];
    unsigned int v14 = [v11 constraintEqualToAnchor:v13 constant:16.0];
    [(NSArray *)v4 addObject:v14];

    id v15 = [(MTAAlarmTableViewCell *)self deadZone];
    id v16 = [v15 heightAnchor];
    v17 = [(MTAAlarmTableViewCell *)self contentView];
    v18 = [v17 heightAnchor];
    uint64_t v19 = [v16 constraintEqualToAnchor:v18];
    [(NSArray *)v4 addObject:v19];

    v20 = [(MTAAlarmTableViewCell *)self enabledSwitch];
    id v21 = [v20 leadingAnchor];
    v22 = [(MTAAlarmTableViewCell *)self digitalClockLabel];
    v23 = [v22 trailingAnchor];
    v24 = [v21 constraintEqualToAnchor:v23 constant:16.0];
    [(NSArray *)v4 addObject:v24];

    v25 = [(MTAAlarmTableViewCell *)self contentView];
    v26 = [v25 bottomAnchor];
    v27 = [(MTAAlarmTableViewCell *)self detailLabel];
    v28 = [v27 lastBaselineAnchor];
    id v29 = [v26 constraintEqualToAnchor:v28 constant:16.0];
    [(NSArray *)v4 addObject:v29];

    v30 = [(MTAAlarmTableViewCell *)self enabledSwitch];
    v31 = [v30 trailingAnchor];
    v32 = [(MTAAlarmTableViewCell *)self contentView];
    v33 = [v32 layoutMarginsGuide];
    v34 = [v33 trailingAnchor];
    v35 = [v31 constraintEqualToAnchor:v34];
    [(NSArray *)v4 addObject:v35];

    v36 = [(MTAAlarmTableViewCell *)self enabledSwitch];
    v37 = [v36 bottomAnchor];
    objc_super v38 = [(MTAAlarmTableViewCell *)self digitalClockLabel];
    v39 = [v38 firstBaselineAnchor];
    v40 = [v37 constraintEqualToAnchor:v39];
    [(NSArray *)v4 addObject:v40];

    v41 = self->_regularLayoutConstraints;
    self->_regularLayoutConstraints = v4;

    regularLayoutConstraints = self->_regularLayoutConstraints;
  }

  return regularLayoutConstraints;
}

- (UIView)deadZone
{
  return self->_deadZone;
}

- (void)setupSharedLayoutConstraint
{
  id v29 = (id)objc_opt_new();
  objc_super v3 = [(MTAAlarmTableViewCell *)self digitalClockLabel];
  BOOL v4 = [v3 leadingAnchor];
  BOOL v5 = [(MTAAlarmTableViewCell *)self contentView];
  unsigned __int8 v6 = [v5 layoutMarginsGuide];
  v7 = [v6 leadingAnchor];
  v8 = [v4 constraintEqualToAnchor:v7];
  [v29 addObject:v8];

  id v9 = [(MTAAlarmTableViewCell *)self digitalClockLabel];
  id v10 = [v9 firstBaselineAnchor];
  id v11 = [(MTAAlarmTableViewCell *)self contentView];
  objc_super v12 = [v11 topAnchor];
  v13 = [v10 constraintEqualToAnchor:v12 constant:60.0];
  [v29 addObject:v13];

  unsigned int v14 = [(MTAAlarmTableViewCell *)self detailLabel];
  id v15 = [v14 leadingAnchor];
  id v16 = [(MTAAlarmTableViewCell *)self digitalClockLabel];
  v17 = [v16 leadingAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  [v29 addObject:v18];

  uint64_t v19 = [(MTAAlarmTableViewCell *)self detailLabel];
  v20 = [v19 topAnchor];
  id v21 = [(MTAAlarmTableViewCell *)self digitalClockLabel];
  v22 = [v21 bottomAnchor];
  v23 = [v20 constraintEqualToAnchor:v22 constant:-3.0];
  [v29 addObject:v23];

  v24 = [(MTAAlarmTableViewCell *)self detailLabel];
  v25 = [v24 trailingAnchor];
  v26 = [(MTAAlarmTableViewCell *)self digitalClockLabel];
  v27 = [v26 trailingAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  [v29 addObject:v28];

  +[NSLayoutConstraint activateConstraints:v29];
}

- (MTUIDigitalClockLabel)digitalClockLabel
{
  return self->_digitalClockLabel;
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (BOOL)_shouldUseRegularLayout
{
  objc_super v3 = [(MTAAlarmTableViewCell *)self traitCollection];
  BOOL v4 = [v3 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (!IsAccessibilityCategory) {
    return 1;
  }
  unsigned __int8 v6 = [(MTAAlarmTableViewCell *)self detailLabel];
  [v6 sizeThatFits:CGSizeZero.width, CGSizeZero.height];
  double v8 = v7;

  id v9 = [(MTAAlarmTableViewCell *)self enabledSwitch];
  [v9 intrinsicContentSize];
  double v11 = v10;

  objc_super v12 = [(MTAAlarmTableViewCell *)self contentView];
  [v12 bounds];
  CGFloat v13 = CGRectGetWidth(v19) - v11;
  [(MTAAlarmTableViewCell *)self layoutMargins];
  double v15 = v14;
  [(MTAAlarmTableViewCell *)self layoutMargins];
  CGFloat v17 = v13 + (v15 + v16) * -2.0;

  return v17 - v8 > 16.0;
}

- (MTAAlarmTableViewCell)init
{
  return [(MTAAlarmTableViewCell *)self initWithStyle:0 reuseIdentifier:off_1000C6F98];
}

- (NSArray)accessibilitySizeLayoutConstraints
{
  accessibilitySizeLayoutConstraints = self->_accessibilitySizeLayoutConstraints;
  if (!accessibilitySizeLayoutConstraints)
  {
    BOOL v4 = (NSArray *)objc_opt_new();
    BOOL v5 = [(MTAAlarmTableViewCell *)self digitalClockLabel];
    unsigned __int8 v6 = [v5 trailingAnchor];
    double v7 = [(MTAAlarmTableViewCell *)self contentView];
    double v8 = [v7 layoutMarginsGuide];
    id v9 = [v8 trailingAnchor];
    double v10 = [v6 constraintEqualToAnchor:v9];
    [(NSArray *)v4 addObject:v10];

    double v11 = [(MTAAlarmTableViewCell *)self enabledSwitch];
    objc_super v12 = [v11 topAnchor];
    CGFloat v13 = [(MTAAlarmTableViewCell *)self detailLabel];
    double v14 = [v13 bottomAnchor];
    double v15 = [v12 constraintEqualToAnchor:v14 constant:6.0];
    [(NSArray *)v4 addObject:v15];

    double v16 = [(MTAAlarmTableViewCell *)self enabledSwitch];
    CGFloat v17 = [v16 leadingAnchor];
    v18 = [(MTAAlarmTableViewCell *)self contentView];
    CGRect v19 = [v18 layoutMarginsGuide];
    v20 = [v19 leadingAnchor];
    id v21 = [v17 constraintEqualToAnchor:v20];
    [(NSArray *)v4 addObject:v21];

    v22 = [(MTAAlarmTableViewCell *)self contentView];
    v23 = [v22 bottomAnchor];
    v24 = [(MTAAlarmTableViewCell *)self enabledSwitch];
    v25 = [v24 bottomAnchor];
    v26 = [v23 constraintEqualToAnchor:v25 constant:16.0];
    [(NSArray *)v4 addObject:v26];

    v27 = self->_accessibilitySizeLayoutConstraints;
    self->_accessibilitySizeLayoutConstraints = v4;

    accessibilitySizeLayoutConstraints = self->_accessibilitySizeLayoutConstraints;
  }

  return accessibilitySizeLayoutConstraints;
}

- (void)_alarmActiveChanged:(id)a3
{
  id v4 = [a3 isOn];
  BOOL v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "TableViewCell: alarm active toggled to %d", (uint8_t *)v7, 8u);
  }

  unsigned __int8 v6 = [(MTAAlarmTableViewCell *)self delegate];
  [v6 setAlarmEnabled:v4 forCell:self];
}

- (void)willTransitionToState:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTAAlarmTableViewCell;
  [(MTAAlarmTableViewCell *)&v4 willTransitionToState:a3];
  [(MTAAlarmTableViewCell *)self setNeedsLayout];
}

- (MTAAlarmTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTAAlarmTableViewCellDelegate *)WeakRetained;
}

- (void)setDigitalClockLabel:(id)a3
{
}

- (void)setDetailLabel:(id)a3
{
}

- (void)setRegularLayoutConstraints:(id)a3
{
}

- (void)setAccessibilitySizeLayoutConstraints:(id)a3
{
}

- (void)setCurrentConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_accessibilitySizeLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_regularLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
  objc_storeStrong((id *)&self->_deadZone, 0);
  objc_storeStrong((id *)&self->_enabledSwitch, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_digitalClockLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end