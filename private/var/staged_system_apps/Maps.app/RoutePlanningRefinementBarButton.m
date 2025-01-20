@interface RoutePlanningRefinementBarButton
- (RoutePlanningRefinementBarButton)initWithRefinement:(id)a3;
- (RoutePlanningRefinementModel)refinement;
- (UIImageView)chevronImageView;
- (UIImageView)iconImageView;
- (UILabel)textLabel;
- (void)_drawWithRefinement;
- (void)_updateFonts;
- (void)_updateMenu;
- (void)layoutSubviews;
- (void)setChevronImageView:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setRefinement:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RoutePlanningRefinementBarButton

- (RoutePlanningRefinementBarButton)initWithRefinement:(id)a3
{
  id v35 = a3;
  v36.receiver = self;
  v36.super_class = (Class)RoutePlanningRefinementBarButton;
  v5 = -[RoutePlanningRefinementBarButton initWithFrame:](&v36, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_refinement, a3);
    uint64_t v7 = objc_opt_new();
    iconImageView = v6->_iconImageView;
    v6->_iconImageView = (UIImageView *)v7;

    [(UIImageView *)v6->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v6->_iconImageView setContentMode:1];
    [(UIImageView *)v6->_iconImageView setAccessibilityIdentifier:@"BarButtonIcon"];
    uint64_t v9 = objc_opt_new();
    textLabel = v6->_textLabel;
    v6->_textLabel = (UILabel *)v9;

    [(UILabel *)v6->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(RoutePlanningRefinementBarButton *)v6 _updateFonts];
    [(UILabel *)v6->_textLabel setAccessibilityIdentifier:@"BarButtonText"];
    v11 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:15.0];
    v34 = +[UIImage systemImageNamed:@"chevron.down" withConfiguration:v11];

    v12 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v34];
    chevronImageView = v6->_chevronImageView;
    v6->_chevronImageView = v12;

    [(UIImageView *)v6->_chevronImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v6->_chevronImageView setContentMode:1];
    [(UIImageView *)v6->_chevronImageView setAccessibilityIdentifier:@"BarButtonChevron"];
    id v14 = objc_alloc((Class)UIStackView);
    v38[0] = v6->_iconImageView;
    v38[1] = v6->_textLabel;
    v38[2] = v6->_chevronImageView;
    v15 = +[NSArray arrayWithObjects:v38 count:3];
    id v16 = [v14 initWithArrangedSubviews:v15];

    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v16 setAlignment:3];
    [v16 setAxis:0];
    [v16 setDistribution:0];
    [v16 setSpacing:4.0];
    [v16 setUserInteractionEnabled:0];
    [(RoutePlanningRefinementBarButton *)v6 addSubview:v16];
    v33 = [v16 leadingAnchor];
    v32 = [(RoutePlanningRefinementBarButton *)v6 leadingAnchor];
    v31 = [v33 constraintEqualToAnchor:v32 constant:12.0];
    v37[0] = v31;
    v30 = [(RoutePlanningRefinementBarButton *)v6 trailingAnchor];
    v29 = [v16 trailingAnchor];
    v28 = [v30 constraintEqualToAnchor:v29 constant:12.0];
    v37[1] = v28;
    v27 = [v16 topAnchor];
    v26 = [(RoutePlanningRefinementBarButton *)v6 topAnchor];
    v17 = [v27 constraintEqualToAnchor:v26 constant:6.0];
    v37[2] = v17;
    v18 = [v16 centerYAnchor];
    v19 = [(RoutePlanningRefinementBarButton *)v6 centerYAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v37[3] = v20;
    v21 = [(RoutePlanningRefinementBarButton *)v6 bottomAnchor];
    v22 = [v16 bottomAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:6.0];
    v37[4] = v23;
    v24 = +[NSArray arrayWithObjects:v37 count:5];
    +[NSLayoutConstraint activateConstraints:v24];

    [(RoutePlanningRefinementBarButton *)v6 _updateMenu];
    [(RoutePlanningRefinementBarButton *)v6 _drawWithRefinement];
  }
  return v6;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningRefinementBarButton;
  [(RoutePlanningRefinementBarButton *)&v8 layoutSubviews];
  [(RoutePlanningRefinementBarButton *)self bounds];
  double v3 = CGRectGetHeight(v9) * 0.5;
  v4 = [(RoutePlanningRefinementBarButton *)self layer];
  [v4 cornerRadius];
  double v6 = v5;

  if (v6 != v3)
  {
    uint64_t v7 = [(RoutePlanningRefinementBarButton *)self layer];
    [v7 setCornerRadius:v3];
  }
}

- (void)setRefinement:(id)a3
{
  objc_storeStrong((id *)&self->_refinement, a3);
  [(RoutePlanningRefinementBarButton *)self _updateMenu];

  [(RoutePlanningRefinementBarButton *)self _drawWithRefinement];
}

- (void)_updateMenu
{
  [(RoutePlanningRefinementBarButton *)self setMenu:0];
  [(RoutePlanningRefinementBarButton *)self _setMenuProvider:0];
  double v3 = [(RoutePlanningRefinementBarButton *)self refinement];
  id v7 = [v3 menuProvider];

  if (v7)
  {
    [(RoutePlanningRefinementBarButton *)self _setMenuProvider:v7];
    BOOL v4 = 1;
  }
  else
  {
    double v5 = [(RoutePlanningRefinementBarButton *)self refinement];
    double v6 = [v5 menu];

    BOOL v4 = v6 != 0;
    if (v6) {
      [(RoutePlanningRefinementBarButton *)self setMenu:v6];
    }
  }
  [(RoutePlanningRefinementBarButton *)self setShowsMenuAsPrimaryAction:v4];
}

- (void)_drawWithRefinement
{
  double v3 = [(RoutePlanningRefinementBarButton *)self refinement];
  unsigned __int8 v4 = [v3 shouldShowHighlighted];

  if (v4)
  {
    double v5 = +[UIColor systemBlueColor];
    double v6 = 0.0;
  }
  else
  {
    double v5 = +[UIColor clearColor];
    double v6 = 0.5;
  }
  [(RoutePlanningRefinementBarButton *)self setBackgroundColor:v5];

  id v7 = [(RoutePlanningRefinementBarButton *)self layer];
  [v7 setBorderWidth:v6];

  id v8 = +[UIColor systemGray3Color];
  id v9 = [v8 CGColor];
  v10 = [(RoutePlanningRefinementBarButton *)self layer];
  [v10 setBorderColor:v9];

  v11 = [(RoutePlanningRefinementBarButton *)self refinement];
  v12 = [v11 iconImage];
  v13 = [(RoutePlanningRefinementBarButton *)self iconImageView];
  [v13 setImage:v12];

  id v14 = [(RoutePlanningRefinementBarButton *)self iconImageView];
  v15 = [v14 image];
  id v16 = [(RoutePlanningRefinementBarButton *)self iconImageView];
  [v16 setHidden:v15 == 0];

  v17 = [(RoutePlanningRefinementBarButton *)self refinement];
  v18 = [v17 titleText];
  v19 = [(RoutePlanningRefinementBarButton *)self textLabel];
  [v19 setText:v18];

  v20 = [(RoutePlanningRefinementBarButton *)self refinement];
  uint64_t v21 = [v20 shouldShowChevron] ^ 1;
  v22 = [(RoutePlanningRefinementBarButton *)self chevronImageView];
  [v22 setHidden:v21];

  if (v4) {
    +[UIColor systemWhiteColor];
  }
  else {
  id v26 = +[UIColor labelColor];
  }
  v23 = [(RoutePlanningRefinementBarButton *)self iconImageView];
  [v23 setTintColor:v26];

  v24 = [(RoutePlanningRefinementBarButton *)self textLabel];
  [v24 setTextColor:v26];

  v25 = [(RoutePlanningRefinementBarButton *)self chevronImageView];
  [v25 setTintColor:v26];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningRefinementBarButton;
  id v4 = a3;
  [(RoutePlanningRefinementBarButton *)&v8 traitCollectionDidChange:v4];
  double v5 = [v4 preferredContentSizeCategory];

  double v6 = [(RoutePlanningRefinementBarButton *)self traitCollection];
  id v7 = [v6 preferredContentSizeCategory];

  if (v5 != v7) {
    [(RoutePlanningRefinementBarButton *)self _updateFonts];
  }
}

- (void)_updateFonts
{
  double v3 = [(RoutePlanningRefinementBarButton *)self traitCollection];
  id v4 = [v3 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryAccessibilityLarge];
  double v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:v4];
  double v6 = [(RoutePlanningRefinementBarButton *)self textLabel];
  [v6 setFont:v5];

  id v9 = [(RoutePlanningRefinementBarButton *)self textLabel];
  id v7 = [v9 font];
  objc_super v8 = [(RoutePlanningRefinementBarButton *)self titleLabel];
  [v8 setFont:v7];
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (RoutePlanningRefinementModel)refinement
{
  return self->_refinement;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setChevronImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_refinement, 0);

  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end