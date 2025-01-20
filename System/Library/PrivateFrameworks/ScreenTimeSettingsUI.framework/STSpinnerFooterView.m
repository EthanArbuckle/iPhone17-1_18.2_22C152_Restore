@interface STSpinnerFooterView
- (NSLayoutConstraint)spinnerViewVerticalPositionConstraint;
- (PSSpecifier)specifier;
- (STSpinnerFooterView)initWithSpecifier:(id)a3;
- (UIActivityIndicatorView)spinnerView;
- (double)preferredHeightForWidth:(double)a3;
- (void)layoutSubviews;
- (void)reloadFromSpecifier;
- (void)setSpinnerViewVerticalPositionConstraint:(id)a3;
- (void)startAnimatingSpinner;
- (void)stopAnimatingSpinner;
@end

@implementation STSpinnerFooterView

- (STSpinnerFooterView)initWithSpecifier:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STSpinnerFooterView;
  id v3 = a3;
  v4 = [(STSpinnerFooterView *)&v10 initWithReuseIdentifier:0];
  objc_storeWeak((id *)&v4->_specifier, v3);

  id v5 = objc_alloc(MEMORY[0x263F823E8]);
  uint64_t v6 = objc_msgSend(v5, "initWithActivityIndicatorStyle:", 100, v10.receiver, v10.super_class);
  spinnerView = v4->_spinnerView;
  v4->_spinnerView = (UIActivityIndicatorView *)v6;

  [(UIActivityIndicatorView *)v4->_spinnerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [(STSpinnerFooterView *)v4 contentView];
  [v8 addSubview:v4->_spinnerView];

  return v4;
}

- (void)reloadFromSpecifier
{
  id v3 = [(STSpinnerFooterView *)self specifier];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F600F8]];
  id v5 = [(STSpinnerFooterView *)self textLabel];
  [v5 setText:v4];

  [(STSpinnerFooterView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v20[2] = *MEMORY[0x263EF8340];
  id v3 = [(STSpinnerFooterView *)self textLabel];
  v4 = [(STSpinnerFooterView *)self specifier];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F600F8]];
  [v3 setText:v5];

  v19.receiver = self;
  v19.super_class = (Class)STSpinnerFooterView;
  [(STSpinnerFooterView *)&v19 layoutSubviews];
  uint64_t v6 = [v3 font];
  [v6 ascender];
  double v8 = v7 * 0.5;

  v9 = [(STSpinnerFooterView *)self spinnerViewVerticalPositionConstraint];
  if (v9)
  {
    objc_super v10 = v9;
    [v9 setConstant:v8];
  }
  else
  {
    v11 = [(STSpinnerFooterView *)self spinnerView];
    v12 = [v3 firstBaselineAnchor];
    v13 = [v11 centerYAnchor];
    objc_super v10 = [v12 constraintEqualToAnchor:v13 constant:v8];

    [(STSpinnerFooterView *)self setSpinnerViewVerticalPositionConstraint:v10];
    v14 = (void *)MEMORY[0x263F08938];
    v20[0] = v10;
    v15 = [v11 leadingAnchor];
    v16 = [v3 trailingAnchor];
    v17 = [v15 constraintEqualToSystemSpacingAfterAnchor:v16 multiplier:1.0];
    v20[1] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    [v14 activateConstraints:v18];
  }
}

- (double)preferredHeightForWidth:(double)a3
{
  -[STSpinnerFooterView sizeThatFits:](self, "sizeThatFits:", a3, 1.79769313e308);
  double v6 = v5;
  double v7 = [(STSpinnerFooterView *)self textLabel];
  objc_msgSend(v7, "sizeThatFits:", a3, 1.79769313e308);
  double v9 = v8 + 12.0;

  if (v6 >= v9) {
    return v6;
  }
  else {
    return v9;
  }
}

- (void)startAnimatingSpinner
{
  id v2 = [(STSpinnerFooterView *)self spinnerView];
  [v2 startAnimating];
}

- (void)stopAnimatingSpinner
{
  id v2 = [(STSpinnerFooterView *)self spinnerView];
  [v2 stopAnimating];
}

- (PSSpecifier)specifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_specifier);

  return (PSSpecifier *)WeakRetained;
}

- (UIActivityIndicatorView)spinnerView
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 600, 1);
}

- (NSLayoutConstraint)spinnerViewVerticalPositionConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 608, 1);
}

- (void)setSpinnerViewVerticalPositionConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerViewVerticalPositionConstraint, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);

  objc_destroyWeak((id *)&self->_specifier);
}

@end