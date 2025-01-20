@interface BKUploadErrorHeaderView
- (BKUploadErrorHeaderViewDelegate)delegate;
- (NSLayoutConstraint)underlineHeightConstraint;
- (UIButton)upgradeButton;
- (UILabel)errorLabel;
- (UIView)underlineView;
- (UIVisualEffectView)visualEffectView;
- (void)awakeFromNib;
- (void)setDelegate:(id)a3;
- (void)setErrorLabel:(id)a3;
- (void)setUnderlineHeightConstraint:(id)a3;
- (void)setUnderlineView:(id)a3;
- (void)setUpgradeButton:(id)a3;
- (void)setVisualEffectView:(id)a3;
- (void)upgradeButtonTouched:(id)a3;
@end

@implementation BKUploadErrorHeaderView

- (void)awakeFromNib
{
  v14.receiver = self;
  v14.super_class = (Class)BKUploadErrorHeaderView;
  [(BKUploadErrorHeaderView *)&v14 awakeFromNib];
  [(BKUploadErrorHeaderView *)self bounds];
  double v4 = v3;
  [(BKUploadErrorHeaderView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = +[NSLayoutConstraint constraintWithItem:self attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:v4];
  [(BKUploadErrorHeaderView *)self addConstraint:v5];

  id v6 = [(BKUploadErrorHeaderView *)self tintColor];
  id v7 = [v6 CGColor];
  v8 = [(BKUploadErrorHeaderView *)self upgradeButton];
  v9 = [v8 layer];
  [v9 setBorderColor:v7];

  v10 = +[UIScreen mainScreen];
  [v10 scale];
  double v12 = 1.0 / v11;
  v13 = [(BKUploadErrorHeaderView *)self underlineHeightConstraint];
  [v13 setConstant:v12];
}

- (void)upgradeButtonTouched:(id)a3
{
  double v4 = [(BKUploadErrorHeaderView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(BKUploadErrorHeaderView *)self delegate];
    [v6 uploadErrorHeaderViewUpgradeButtonPressed:self];
  }
}

- (BKUploadErrorHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKUploadErrorHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)upgradeButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_upgradeButton);

  return (UIButton *)WeakRetained;
}

- (void)setUpgradeButton:(id)a3
{
}

- (UILabel)errorLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_errorLabel);

  return (UILabel *)WeakRetained;
}

- (void)setErrorLabel:(id)a3
{
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
}

- (UIView)underlineView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_underlineView);

  return (UIView *)WeakRetained;
}

- (void)setUnderlineView:(id)a3
{
}

- (NSLayoutConstraint)underlineHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_underlineHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setUnderlineHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_underlineHeightConstraint);
  objc_destroyWeak((id *)&self->_underlineView);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_destroyWeak((id *)&self->_errorLabel);
  objc_destroyWeak((id *)&self->_upgradeButton);

  objc_destroyWeak((id *)&self->_delegate);
}

@end