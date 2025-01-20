@interface CarETAArrivedSign
+ (BOOL)requiresConstraintBasedLayout;
+ (id)_buttonFont;
+ (id)_subtitleFont;
- (CarETAArrivedSign)initWithDelegate:(id)a3 dataSource:(id)a4;
- (CarETACardSignDelegate)delegate;
- (GuidanceETA)latestETA;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (int64_t)state;
- (void)_onEndPressed:(id)a3;
- (void)_onNextStopPressed:(id)a3;
- (void)_setupConstraints;
- (void)_setupStyling;
- (void)_updateContents;
- (void)setDelegate:(id)a3;
- (void)setLatestETA:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation CarETAArrivedSign

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarETAArrivedSign)initWithDelegate:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)CarETAArrivedSign;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v11 = -[CarETAArrivedSign initWithFrame:](&v33, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v12 = v11;
  if (v11)
  {
    [(CarETAArrivedSign *)v11 setAccessibilityIdentifier:@"CarETAArrivedSign"];
    objc_storeWeak((id *)&v12->_delegate, v6);
    objc_storeWeak((id *)&v12->_dataSource, v7);
    v12->_state = 0;
    v13 = -[MapsFadingLabel initWithFrame:]([MapsFadingLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v12->_titleLabel;
    v12->_titleLabel = v13;

    [(MapsFadingLabel *)v12->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
    [(MapsFadingLabel *)v12->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MapsFadingLabel *)v12->_titleLabel setNumberOfLines:1];
    [(MapsFadingLabel *)v12->_titleLabel setTextAlignment:1];
    v15 = [(id)objc_opt_class() _buttonFont];
    [(MapsFadingLabel *)v12->_titleLabel setFont:v15];

    id WeakRetained = objc_loadWeakRetained((id *)&v12->_dataSource);
    v17 = [WeakRetained arrivalTitle];
    [(MapsFadingLabel *)v12->_titleLabel setText:v17];

    [(CarETAArrivedSign *)v12 addSubview:v12->_titleLabel];
    v18 = -[MapsFadingLabel initWithFrame:]([MapsFadingLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    subtitleLabel = v12->_subtitleLabel;
    v12->_subtitleLabel = v18;

    [(MapsFadingLabel *)v12->_subtitleLabel setAccessibilityIdentifier:@"SubtitleLabel"];
    [(MapsFadingLabel *)v12->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MapsFadingLabel *)v12->_subtitleLabel setNumberOfLines:2];
    [(MapsFadingLabel *)v12->_subtitleLabel setTextAlignment:1];
    v20 = [(id)objc_opt_class() _subtitleFont];
    [(MapsFadingLabel *)v12->_subtitleLabel setFont:v20];

    v21 = +[UIColor secondaryLabelColor];
    [(MapsFadingLabel *)v12->_subtitleLabel setTextColor:v21];

    id v22 = objc_loadWeakRetained((id *)&v12->_dataSource);
    v23 = [v22 arrivalSubtitle];
    [(MapsFadingLabel *)v12->_subtitleLabel setText:v23];

    [(CarETAArrivedSign *)v12 addSubview:v12->_subtitleLabel];
    v24 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    endNavigationButton = v12->_endNavigationButton;
    v12->_endNavigationButton = v24;

    [(CarCardRoundedButton *)v12->_endNavigationButton setAccessibilityIdentifier:@"EndNavigationButton"];
    [(CarCardRoundedButton *)v12->_endNavigationButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarCardRoundedButton *)v12->_endNavigationButton addTarget:v12 action:"_onEndPressed:" forControlEvents:64];
    v26 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    alternativeActionButton = v12->_alternativeActionButton;
    v12->_alternativeActionButton = v26;

    [(CarCardRoundedButton *)v12->_alternativeActionButton setAccessibilityIdentifier:@"AlternativeActionButton"];
    [(CarCardRoundedButton *)v12->_alternativeActionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarCardRoundedButton *)v12->_alternativeActionButton addTarget:v12 action:"_onNextStopPressed:" forControlEvents:64];
    id v28 = objc_alloc((Class)UIStackView);
    v34 = v12->_endNavigationButton;
    v29 = +[NSArray arrayWithObjects:&v34 count:1];
    v30 = (UIStackView *)[v28 initWithArrangedSubviews:v29];
    buttonsStackView = v12->_buttonsStackView;
    v12->_buttonsStackView = v30;

    [(UIStackView *)v12->_buttonsStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v12->_buttonsStackView setAxis:1];
    [(UIStackView *)v12->_buttonsStackView setSpacing:2.0];
    [(CarETAArrivedSign *)v12 addSubview:v12->_buttonsStackView];
    [(CarETAArrivedSign *)v12 _setupConstraints];
    [(CarETAArrivedSign *)v12 _setupStyling];
    [(CarETAArrivedSign *)v12 _updateContents];
  }

  return v12;
}

- (void)_setupConstraints
{
  v3 = +[NSMutableArray arrayWithCapacity:6];
  v4 = [(CarCardRoundedButton *)self->_endNavigationButton heightAnchor];
  v5 = [v4 constraintEqualToConstant:44.0];
  [v3 addObject:v5];

  id v6 = [(CarCardRoundedButton *)self->_alternativeActionButton heightAnchor];
  id v7 = [v6 constraintEqualToConstant:44.0];
  v41 = v3;
  [v3 addObject:v7];

  v37 = [(MapsFadingLabel *)self->_titleLabel leadingAnchor];
  v34 = [(CarETAArrivedSign *)self leadingAnchor];
  v8 = [v37 constraintEqualToAnchor:v34 constant:10.0];
  v44[0] = v8;
  v9 = [(MapsFadingLabel *)self->_titleLabel trailingAnchor];
  v10 = [(CarETAArrivedSign *)self trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:-10.0];
  v44[1] = v11;
  v12 = [(MapsFadingLabel *)self->_titleLabel topAnchor];
  v13 = [(CarETAArrivedSign *)self topAnchor];
  v14 = [v12 constraintEqualToAnchor:v13 constant:10.0];
  v44[2] = v14;
  v15 = +[NSArray arrayWithObjects:v44 count:3];
  [v3 addObjectsFromArray:v15];

  v38 = [(MapsFadingLabel *)self->_subtitleLabel leadingAnchor];
  v35 = [(CarETAArrivedSign *)self leadingAnchor];
  v16 = [v38 constraintEqualToAnchor:v35 constant:10.0];
  v43[0] = v16;
  v17 = [(MapsFadingLabel *)self->_subtitleLabel trailingAnchor];
  v18 = [(CarETAArrivedSign *)self trailingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18 constant:-10.0];
  v43[1] = v19;
  v20 = [(MapsFadingLabel *)self->_subtitleLabel topAnchor];
  v21 = [(MapsFadingLabel *)self->_titleLabel bottomAnchor];
  id v22 = [v20 constraintEqualToAnchor:v21];
  v43[2] = v22;
  v23 = +[NSArray arrayWithObjects:v43 count:3];
  [v3 addObjectsFromArray:v23];

  v40 = [(UIStackView *)self->_buttonsStackView leadingAnchor];
  v39 = [(CarETAArrivedSign *)self leadingAnchor];
  v36 = [v40 constraintEqualToAnchor:v39 constant:10.0];
  v42[0] = v36;
  objc_super v33 = [(UIStackView *)self->_buttonsStackView trailingAnchor];
  v24 = [(CarETAArrivedSign *)self trailingAnchor];
  v25 = [v33 constraintEqualToAnchor:v24 constant:-10.0];
  v42[1] = v25;
  v26 = [(UIStackView *)self->_buttonsStackView topAnchor];
  v27 = [(MapsFadingLabel *)self->_subtitleLabel bottomAnchor];
  id v28 = [v26 constraintEqualToAnchor:v27 constant:10.0];
  v42[2] = v28;
  v29 = [(UIStackView *)self->_buttonsStackView bottomAnchor];
  v30 = [(CarETAArrivedSign *)self bottomAnchor];
  v31 = [v29 constraintEqualToAnchor:v30 constant:-10.0];
  v42[3] = v31;
  v32 = +[NSArray arrayWithObjects:v42 count:4];
  [v41 addObjectsFromArray:v32];

  +[NSLayoutConstraint activateConstraints:v41];
}

- (void)_setupStyling
{
  v3 = [(CarCardRoundedButton *)self->_endNavigationButton titleLabel];
  v4 = +[CarETAArrivedSign _buttonFont];
  [v3 setFont:v4];

  [(CarCardRoundedButton *)self->_endNavigationButton setContentHorizontalAlignment:0];
  v5 = [(CarCardRoundedButton *)self->_endNavigationButton titleLabel];
  [v5 setMinimumScaleFactor:0.699999988];

  id v6 = [(CarCardRoundedButton *)self->_endNavigationButton titleLabel];
  [v6 setAdjustsFontSizeToFitWidth:1];

  id v7 = [(CarCardRoundedButton *)self->_endNavigationButton titleLabel];
  [v7 setNumberOfLines:2];

  v8 = +[UIColor systemWhiteColor];
  [(CarFocusableButton *)self->_endNavigationButton setNonFocusedTintColor:v8];

  v9 = +[UIColor _carSystemFocusLabelColor];
  [(CarFocusableButton *)self->_endNavigationButton setFocusedTintColor:v9];

  v10 = +[UIColor systemRedColor];
  [(CarFocusableButton *)self->_endNavigationButton setNonFocusedBackgroundColor:v10];

  v11 = +[UIColor _carSystemFocusColor];
  [(CarFocusableButton *)self->_endNavigationButton setFocusedBackgroundColor:v11];

  v12 = [(CarCardRoundedButton *)self->_alternativeActionButton titleLabel];
  v13 = +[CarETAArrivedSign _buttonFont];
  [v12 setFont:v13];

  [(CarCardRoundedButton *)self->_alternativeActionButton setContentHorizontalAlignment:0];
  v14 = [(CarCardRoundedButton *)self->_alternativeActionButton titleLabel];
  [v14 setMinimumScaleFactor:0.699999988];

  v15 = [(CarCardRoundedButton *)self->_alternativeActionButton titleLabel];
  [v15 setAdjustsFontSizeToFitWidth:1];

  v16 = [(CarCardRoundedButton *)self->_alternativeActionButton titleLabel];
  [v16 setNumberOfLines:2];

  v17 = +[UIColor systemWhiteColor];
  [(CarFocusableButton *)self->_alternativeActionButton setNonFocusedTintColor:v17];

  v18 = +[UIColor _carSystemFocusLabelColor];
  [(CarFocusableButton *)self->_alternativeActionButton setFocusedTintColor:v18];

  v19 = +[UIColor tertiarySystemFillColor];
  [(CarFocusableButton *)self->_alternativeActionButton setNonFocusedBackgroundColor:v19];

  id v20 = +[UIColor _carSystemFocusColor];
  [(CarFocusableButton *)self->_alternativeActionButton setFocusedBackgroundColor:v20];
}

+ (id)_buttonFont
{
  return +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCallout weight:UIFontWeightBold];
}

+ (id)_subtitleFont
{
  return +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption1 weight:UIFontWeightRegular];
}

- (void)_updateContents
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v5 = [WeakRetained arrivalTitle];
  [(MapsFadingLabel *)self->_titleLabel setText:v5];

  id v6 = objc_loadWeakRetained((id *)p_dataSource);
  id v7 = [v6 arrivalSubtitle];
  [(MapsFadingLabel *)self->_subtitleLabel setText:v7];

  int64_t state = self->_state;
  if (state)
  {
    if (state == 1)
    {
      endNavigationButton = self->_endNavigationButton;
      objc_super v33 = +[NSBundle mainBundle];
      v34 = [v33 localizedStringForKey:@"CarPlay_PauseRoute" value:@"localized string not found" table:0];
      [(CarCardRoundedButton *)endNavigationButton setTitle:v34 forState:0];

      v35 = +[UIColor systemWhiteColor];
      [(CarFocusableButton *)self->_endNavigationButton setNonFocusedTintColor:v35];

      v36 = +[UIColor systemRedColor];
      [(CarFocusableButton *)self->_endNavigationButton setNonFocusedBackgroundColor:v36];

      alternativeActionButton = self->_alternativeActionButton;
      v38 = +[NSBundle mainBundle];
      v39 = [v38 localizedStringForKey:@"CarPlay_NextStop" value:@"localized string not found" table:0];
      [(CarCardRoundedButton *)alternativeActionButton setTitle:v39 forState:0];

      v40 = +[UIColor _carSystemFocusColor];
      [(CarFocusableButton *)self->_alternativeActionButton setNonFocusedTintColor:v40];

      v41 = +[UIColor tertiarySystemFillColor];
      [(CarFocusableButton *)self->_alternativeActionButton setNonFocusedBackgroundColor:v41];

      [(CarCardRoundedButton *)self->_alternativeActionButton setImage:0 forState:0];
      buttonsStackView = self->_buttonsStackView;
      v42 = self->_endNavigationButton;
      v44 = self->_alternativeActionButton;
      v45 = v42;
      v25 = &v44;
    }
    else
    {
      if (state != 2) {
        return;
      }
      v9 = self->_alternativeActionButton;
      v10 = +[NSBundle mainBundle];
      v11 = [v10 localizedStringForKey:@"CarPlay_OtherStations" value:@"localized string not found" table:0];
      [(CarCardRoundedButton *)v9 setTitle:v11 forState:0];

      v12 = self->_alternativeActionButton;
      v13 = +[CarETAArrivedSign _buttonFont];
      v14 = +[UIImageSymbolConfiguration configurationWithFont:v13];
      v15 = +[UIImage _systemImageNamed:@"magnifyingglass" withConfiguration:v14];
      [(CarCardRoundedButton *)v12 setImage:v15 forState:0];

      v16 = +[UIColor _carSystemFocusColor];
      [(CarFocusableButton *)self->_alternativeActionButton setNonFocusedTintColor:v16];

      v17 = +[UIColor tertiarySystemFillColor];
      [(CarFocusableButton *)self->_alternativeActionButton setNonFocusedBackgroundColor:v17];

      v18 = self->_endNavigationButton;
      v19 = +[NSBundle mainBundle];
      id v20 = [v19 localizedStringForKey:@"CarPlay_PauseRoute" value:@"localized string not found" table:0];
      [(CarCardRoundedButton *)v18 setTitle:v20 forState:0];

      v21 = +[UIColor systemWhiteColor];
      [(CarFocusableButton *)self->_endNavigationButton setNonFocusedTintColor:v21];

      id v22 = +[UIColor systemRedColor];
      [(CarFocusableButton *)self->_endNavigationButton setNonFocusedBackgroundColor:v22];

      buttonsStackView = self->_buttonsStackView;
      v24 = self->_endNavigationButton;
      v47 = self->_alternativeActionButton;
      v48 = v24;
      v25 = &v47;
    }
    uint64_t v31 = 2;
  }
  else
  {
    [(CarCardRoundedButton *)self->_alternativeActionButton setImage:0 forState:0];
    v26 = self->_endNavigationButton;
    v27 = +[NSBundle mainBundle];
    id v28 = [v27 localizedStringForKey:@"CarPlay_EndRoute" value:@"localized string not found" table:0];
    [(CarCardRoundedButton *)v26 setTitle:v28 forState:0];

    v29 = +[UIColor systemWhiteColor];
    [(CarFocusableButton *)self->_endNavigationButton setNonFocusedTintColor:v29];

    v30 = +[UIColor systemRedColor];
    [(CarFocusableButton *)self->_endNavigationButton setNonFocusedBackgroundColor:v30];

    buttonsStackView = self->_buttonsStackView;
    v46 = self->_endNavigationButton;
    v25 = &v46;
    uint64_t v31 = 1;
  }
  v43 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, v31, v44, v45, v46, v47, v48);
  [(UIStackView *)buttonsStackView _maps_setArrangedSubviews:v43];
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_int64_t state = a3;
    [(CarETAArrivedSign *)self _updateContents];
  }
}

- (void)_onEndPressed:(id)a3
{
  unint64_t state = self->_state;
  if (state > 2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_100F700F0[state];
  }
  id v6 = [(CarETAArrivedSign *)self delegate];
  [v6 etaCardSign:self didSelectAction:v5];
}

- (void)_onNextStopPressed:(id)a3
{
  id v4 = [(CarETAArrivedSign *)self delegate];
  [v4 etaCardSign:self didSelectAction:3];
}

- (NSArray)focusOrderSubItems
{
  int64_t state = self->_state;
  if ((unint64_t)(state - 1) >= 2)
  {
    if (state) {
      goto LABEL_6;
    }
    endNavigationButton = self->_endNavigationButton;
    p_endNavigationButton = &endNavigationButton;
    uint64_t v5 = 1;
  }
  else
  {
    v3 = self->_endNavigationButton;
    alternativeActionButton = self->_alternativeActionButton;
    v9 = v3;
    p_endNavigationButton = &alternativeActionButton;
    uint64_t v5 = 2;
  }
  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", p_endNavigationButton, v5, endNavigationButton, alternativeActionButton, v9);
  a2 = (SEL)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return (NSArray *)(id)a2;
}

- (NSArray)preferredFocusEnvironments
{
  endNavigationButton = self->_endNavigationButton;
  v2 = +[NSArray arrayWithObjects:&endNavigationButton count:1];

  return (NSArray *)v2;
}

- (GuidanceETA)latestETA
{
  return self->_latestETA;
}

- (void)setLatestETA:(id)a3
{
}

- (CarETACardSignDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarETACardSignDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_latestETA, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_endNavigationButton, 0);
  objc_storeStrong((id *)&self->_alternativeActionButton, 0);
  objc_storeStrong((id *)&self->_buttonsStackView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end