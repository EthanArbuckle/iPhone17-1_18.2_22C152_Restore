@interface MTASleepAlarmSetupTableViewCell
- (BOOL)_shouldStackViews;
- (MTASleepAlarmSetupTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MTASleepAlarmSetupTableViewCellDelegate)delegate;
- (UIButton)setupButton;
- (UILabel)titleLabel;
- (void)configureSetupButtonWithTitle:(id)a3 action:(SEL)a4;
- (void)setDelegate:(id)a3;
- (void)setSetupButton:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupCell;
- (void)setupConstraints;
@end

@implementation MTASleepAlarmSetupTableViewCell

- (MTASleepAlarmSetupTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTASleepAlarmSetupTableViewCell;
  v4 = [(MTASleepAlarmSetupTableViewCell *)&v7 initWithStyle:0 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(MTASleepAlarmSetupTableViewCell *)v4 setupCell];
  }
  return v5;
}

- (BOOL)_shouldStackViews
{
  v3 = [(MTASleepAlarmSetupTableViewCell *)self titleLabel];
  double height = CGSizeZero.height;
  [v3 sizeThatFits:CGSizeZero.width, height];
  double v6 = v5;

  objc_super v7 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
  [v7 sizeThatFits:CGSizeZero.width, height];
  double v9 = v8 + 24.0;

  v10 = [(MTASleepAlarmSetupTableViewCell *)self contentView];
  [v10 bounds];
  CGFloat v11 = CGRectGetWidth(v17) - v9;
  [(MTASleepAlarmSetupTableViewCell *)self layoutMargins];
  CGFloat v13 = v11 - v12;
  [(MTASleepAlarmSetupTableViewCell *)self layoutMargins];
  CGFloat v15 = v13 - v14;

  return v15 - v6 <= 16.0;
}

- (void)configureSetupButtonWithTitle:(id)a3 action:(SEL)a4
{
  id v33 = a3;
  double v6 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];

  if (!v6)
  {
    if (_os_feature_enabled_impl())
    {
      objc_super v7 = +[MTAUtilities pillButtonWithTitle:v33];
      [(MTASleepAlarmSetupTableViewCell *)self setSetupButton:v7];
    }
    else
    {
      double v8 = objc_opt_new();
      [(MTASleepAlarmSetupTableViewCell *)self setSetupButton:v8];

      double v9 = +[UIColor mtui_tintColor];
      v10 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
      [v10 setTintColor:v9];

      CGFloat v11 = +[UIColor mtui_buttonBackgroundColor];
      double v12 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
      [v12 setBackgroundColor:v11];

      CGFloat v13 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
      [v13 setTitle:v33 forState:0];

      double v14 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
      CGFloat v15 = +[UIColor mtui_tintColor];
      [v14 setTitleColor:v15 forState:0];

      objc_super v7 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
      v16 = [v7 titleLabel];
      CGRect v17 = [v16 font];
      [v17 lineHeight];
      double v19 = ceil(v18) * 0.5 + 6.0;
      v20 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
      v21 = [v20 layer];
      [v21 setCornerRadius:v19];
    }
    v22 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

    v23 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
    v24 = [(MTASleepAlarmSetupTableViewCell *)self delegate];
    [v23 addTarget:v24 action:a4 forControlEvents:64];

    v25 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    v26 = [v25 familyName];
    [v25 pointSize];
    v27 = +[UIFont fontWithFamilyName:traits:size:](UIFont, "fontWithFamilyName:traits:size:", v26, 2);
    v28 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
    v29 = [v28 titleLabel];
    [v29 setFont:v27];

    v30 = [(MTASleepAlarmSetupTableViewCell *)self contentView];
    v31 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
    [v30 addSubview:v31];
  }
  v32 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
  [v32 sizeToFit];

  [(MTASleepAlarmSetupTableViewCell *)self setupConstraints];
}

- (void)setupConstraints
{
  id v74 = (id)objc_opt_new();
  v3 = [(MTASleepAlarmSetupTableViewCell *)self titleLabel];
  v4 = [v3 leadingAnchor];
  double v5 = [(MTASleepAlarmSetupTableViewCell *)self layoutMarginsGuide];
  double v6 = [v5 leadingAnchor];
  objc_super v7 = [v4 constraintEqualToAnchor:v6];
  [v74 addObject:v7];

  double v8 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
  [v8 bounds];
  double v10 = v9;

  LODWORD(v8) = _os_feature_enabled_impl();
  CGFloat v11 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
  double v12 = [v11 widthAnchor];
  CGFloat v13 = v12;
  double v14 = v10 + 24.0;
  if (v8) {
    double v14 = v10;
  }
  CGFloat v15 = [v12 constraintEqualToConstant:v14];
  [v74 addObject:v15];

  v16 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
  CGRect v17 = [v16 heightAnchor];
  double v18 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
  double v19 = [v18 titleLabel];
  v20 = [v19 font];
  [v20 lineHeight];
  v22 = [v17 constraintEqualToConstant:ceil(v21) + 12.0];
  [v74 addObject:v22];

  if ([(MTASleepAlarmSetupTableViewCell *)self _shouldStackViews])
  {
    v23 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
    v24 = [v23 leadingAnchor];
    v25 = [(MTASleepAlarmSetupTableViewCell *)self titleLabel];
    v26 = [v25 leadingAnchor];
    v27 = [v24 constraintEqualToAnchor:v26];
    [v74 addObject:v27];

    v28 = [(MTASleepAlarmSetupTableViewCell *)self titleLabel];
    v29 = [v28 topAnchor];
    v30 = [(MTASleepAlarmSetupTableViewCell *)self contentView];
    v31 = [v30 topAnchor];
    v32 = [v29 constraintEqualToAnchor:v31 constant:16.0];
    [v74 addObject:v32];

    id v33 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
    v34 = [v33 topAnchor];
    v35 = [(MTASleepAlarmSetupTableViewCell *)self titleLabel];
    v36 = [v35 bottomAnchor];
    v37 = [v34 constraintEqualToAnchor:v36 constant:6.0];
    [v74 addObject:v37];

    v38 = [(MTASleepAlarmSetupTableViewCell *)self contentView];
    v39 = [v38 bottomAnchor];
    v40 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
    v41 = [v40 bottomAnchor];
    [v39 constraintEqualToAnchor:v41 constant:16.0];
  }
  else
  {
    v42 = [(MTASleepAlarmSetupTableViewCell *)self titleLabel];
    v43 = [v42 centerYAnchor];
    v44 = [(MTASleepAlarmSetupTableViewCell *)self contentView];
    v45 = [v44 centerYAnchor];
    v46 = [v43 constraintEqualToAnchor:v45];
    [v74 addObject:v46];

    v47 = [(MTASleepAlarmSetupTableViewCell *)self titleLabel];
    v48 = [v47 heightAnchor];
    v49 = [(MTASleepAlarmSetupTableViewCell *)self titleLabel];
    v50 = [v49 font];
    [v50 lineHeight];
    v52 = [v48 constraintEqualToConstant:ceil(v51)];
    [v74 addObject:v52];

    v53 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
    v54 = [v53 leadingAnchor];
    v55 = [(MTASleepAlarmSetupTableViewCell *)self titleLabel];
    v56 = [v55 trailingAnchor];
    v57 = [v54 constraintEqualToAnchor:v56 constant:16.0];
    [v74 addObject:v57];

    v58 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
    v59 = [v58 centerYAnchor];
    v60 = [(MTASleepAlarmSetupTableViewCell *)self contentView];
    v61 = [v60 centerYAnchor];
    v62 = [v59 constraintEqualToAnchor:v61];
    [v74 addObject:v62];

    v63 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
    v64 = [v63 topAnchor];
    v65 = [(MTASleepAlarmSetupTableViewCell *)self contentView];
    v66 = [v65 topAnchor];
    v67 = [v64 constraintGreaterThanOrEqualToAnchor:v66 constant:16.0];
    [v74 addObject:v67];

    v68 = [(MTASleepAlarmSetupTableViewCell *)self contentView];
    v69 = [v68 bottomAnchor];
    v70 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
    v71 = [v70 bottomAnchor];
    v72 = [v69 constraintGreaterThanOrEqualToAnchor:v71 constant:16.0];
    [v74 addObject:v72];

    v38 = [(MTASleepAlarmSetupTableViewCell *)self setupButton];
    v39 = [v38 trailingAnchor];
    v40 = [(MTASleepAlarmSetupTableViewCell *)self layoutMarginsGuide];
    v41 = [v40 trailingAnchor];
    [v39 constraintEqualToAnchor:v41];
  v73 = };
  [v74 addObject:v73];

  +[NSLayoutConstraint activateConstraints:v74];
}

- (UIButton)setupButton
{
  return self->_setupButton;
}

- (void)setupCell
{
  v3 = objc_opt_new();
  [(MTASleepAlarmSetupTableViewCell *)self setTitleLabel:v3];

  v4 = +[NSBundle bundleWithIdentifier:@"com.apple.MobileTimerUI"];
  double v5 = [v4 localizedStringForKey:@"SLEEP_ALARM_NONE" value:&stru_1000A2560 table:@"MobileTimerUI_Burrito"];
  double v6 = [(MTASleepAlarmSetupTableViewCell *)self titleLabel];
  [v6 setText:v5];

  objc_super v7 = +[UIColor mtui_disabledTextColor];
  double v8 = [(MTASleepAlarmSetupTableViewCell *)self titleLabel];
  [v8 setTextColor:v7];

  double v9 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleBody maximumContentSizeCategory:UIContentSizeCategoryAccessibilityLarge];
  double v10 = [(MTASleepAlarmSetupTableViewCell *)self titleLabel];
  [v10 setFont:v9];

  CGFloat v11 = [(MTASleepAlarmSetupTableViewCell *)self titleLabel];
  [v11 setAdjustsFontSizeToFitWidth:1];

  double v12 = [(MTASleepAlarmSetupTableViewCell *)self titleLabel];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v14 = [(MTASleepAlarmSetupTableViewCell *)self contentView];
  CGFloat v13 = [(MTASleepAlarmSetupTableViewCell *)self titleLabel];
  [v14 addSubview:v13];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setSetupButton:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (MTASleepAlarmSetupTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTASleepAlarmSetupTableViewCellDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_setupButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end