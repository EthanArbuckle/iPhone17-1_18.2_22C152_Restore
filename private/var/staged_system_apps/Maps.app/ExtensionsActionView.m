@interface ExtensionsActionView
- (CGSize)intrinsicContentSize;
- (ExtensionsActionView)initWithCoder:(id)a3;
- (ExtensionsActionView)initWithFrame:(CGRect)a3;
- (NSString)buttonTitle;
- (id)didTapButton;
- (void)_commonInit;
- (void)_didTap;
- (void)setButtonTitle:(id)a3;
- (void)setDidTapButton:(id)a3;
- (void)updateTheme;
@end

@implementation ExtensionsActionView

- (ExtensionsActionView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ExtensionsActionView;
  v3 = -[ExtensionsActionView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(ExtensionsActionView *)v3 _commonInit];
  }
  return v4;
}

- (ExtensionsActionView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ExtensionsActionView;
  v3 = [(ExtensionsActionView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ExtensionsActionView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  [(ExtensionsActionView *)self setLeftHairlineInset:16.0];
  [(ExtensionsActionView *)self setRightHairlineInset:0.0];
  [(ExtensionsActionView *)self setTopHairlineHidden:0];
  [(ExtensionsActionView *)self setBottomHairlineHidden:1];
  v3 = +[UIButton buttonWithType:1];
  button = self->_button;
  self->_button = v3;

  [(ExtensionsActionView *)self addSubview:self->_button];
  v5 = [(UIButton *)self->_button titleLabel];
  +[DynamicTypeWizard autorefreshLabel:v5 withFontProvider:&stru_101321340];

  [(UIButton *)self->_button setTranslatesAutoresizingMaskIntoConstraints:0];
  v15 = [(UIButton *)self->_button leadingAnchor];
  v14 = [(ExtensionsActionView *)self leadingAnchor];
  objc_super v6 = [v15 constraintEqualToAnchor:v14 constant:16.0];
  v16[0] = v6;
  v7 = [(ExtensionsActionView *)self centerYAnchor];
  v8 = [(UIButton *)self->_button centerYAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v16[1] = v9;
  v10 = [(ExtensionsActionView *)self trailingAnchor];
  v11 = [(UIButton *)self->_button trailingAnchor];
  v12 = [v10 constraintGreaterThanOrEqualToAnchor:v11 constant:16.0];
  v16[2] = v12;
  v13 = +[NSArray arrayWithObjects:v16 count:3];
  +[NSLayoutConstraint activateConstraints:v13];

  [(UIButton *)self->_button addTarget:self action:"_didTap" forControlEvents:0x2000];
}

- (void)updateTheme
{
  id v4 = [(ExtensionsActionView *)self theme];
  v3 = [v4 hairlineColor];
  [(ExtensionsActionView *)self setHairlineColor:v3];
}

- (CGSize)intrinsicContentSize
{
  double v2 = UIViewNoIntrinsicMetric;
  double v3 = 60.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_didTap
{
  double v3 = [(ExtensionsActionView *)self didTapButton];

  if (v3)
  {
    id v4 = [(ExtensionsActionView *)self didTapButton];
    v4[2]();
  }
}

- (NSString)buttonTitle
{
  return [(UIButton *)self->_button titleForState:0];
}

- (void)setButtonTitle:(id)a3
{
}

- (id)didTapButton
{
  return self->_didTapButton;
}

- (void)setDidTapButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didTapButton, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end