@interface COSAppInstallButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (COSAppInstallButton)initWithFrame:(CGRect)a3;
- (UILabel)installLabel;
- (UILabel)installedLabel;
- (UILabel)installingLabel;
- (UILabel)unavailableLabel;
- (UIView)outline;
- (unint64_t)mode;
- (void)_updateButtonOutline;
- (void)layoutSubviews;
- (void)setInstallLabel:(id)a3;
- (void)setInstalledLabel:(id)a3;
- (void)setInstallingLabel:(id)a3;
- (void)setMode:(unint64_t)a3 animated:(BOOL)a4;
- (void)setOutline:(id)a3;
- (void)setUnavailableLabel:(id)a3;
- (void)tintColorDidChange;
- (void)updateOutlineEnabled:(BOOL)a3 forMode:(unint64_t)a4;
@end

@implementation COSAppInstallButton

- (COSAppInstallButton)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)COSAppInstallButton;
  v3 = -[COSAppInstallButton initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init((Class)UIView);
    outline = v3->_outline;
    v3->_outline = v4;

    v6 = [(UIView *)v3->_outline layer];
    [v6 setBorderWidth:1.0];

    v7 = [(UIView *)v3->_outline layer];
    [v7 setCornerRadius:3.0];

    v8 = v3->_outline;
    v9 = +[UIColor clearColor];
    [(UIView *)v8 setBackgroundColor:v9];

    [(UIView *)v3->_outline setUserInteractionEnabled:0];
    [(COSAppInstallButton *)v3 addSubview:v3->_outline];
    uint64_t v10 = sub_10007E5A0(@"INSTALL", 0);
    installLabel = v3->_installLabel;
    v3->_installLabel = (UILabel *)v10;

    [(COSAppInstallButton *)v3 addSubview:v3->_installLabel];
    uint64_t v12 = sub_10007E5A0(@"INSTALLED", 1);
    installedLabel = v3->_installedLabel;
    v3->_installedLabel = (UILabel *)v12;

    [(COSAppInstallButton *)v3 addSubview:v3->_installedLabel];
    uint64_t v14 = sub_10007E5A0(@"UNAVAILABLE", 1);
    unavailableLabel = v3->_unavailableLabel;
    v3->_unavailableLabel = (UILabel *)v14;

    [(COSAppInstallButton *)v3 addSubview:v3->_unavailableLabel];
    uint64_t v16 = sub_10007E5A0(@"INSTALLING", 1);
    installingLabel = v3->_installingLabel;
    v3->_installingLabel = (UILabel *)v16;

    [(COSAppInstallButton *)v3 addSubview:v3->_installingLabel];
    [(COSAppInstallButton *)v3 setMode:1 animated:0];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UILabel sizeThatFits:](self->_installLabel, "sizeThatFits:");
  double v8 = v7 + 20.0;
  if (v8 >= CGSizeZero.width) {
    double v9 = v8;
  }
  else {
    double v9 = CGSizeZero.width;
  }
  if (v6 + 7.0 >= CGSizeZero.height) {
    double v10 = v6 + 7.0;
  }
  else {
    double v10 = CGSizeZero.height;
  }
  -[UILabel sizeThatFits:](self->_installedLabel, "sizeThatFits:", width, height);
  double v13 = v12 + 20.0;
  if (v13 >= v9) {
    double v9 = v13;
  }
  if (v11 + 7.0 >= v10) {
    double v10 = v11 + 7.0;
  }
  -[UILabel sizeThatFits:](self->_unavailableLabel, "sizeThatFits:", width, height);
  double v16 = v15 + 20.0;
  if (v16 >= v9) {
    double v9 = v16;
  }
  if (v14 + 7.0 >= v10) {
    double v10 = v14 + 7.0;
  }
  -[UILabel sizeThatFits:](self->_installingLabel, "sizeThatFits:", width, height);
  double v19 = v18 + 20.0;
  if (v19 < v9) {
    double v19 = v9;
  }
  double v20 = v17 + 7.0;
  if (v20 < v10) {
    double v20 = v10;
  }
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)COSAppInstallButton;
  [(COSAppInstallButton *)&v11 layoutSubviews];
  [(COSAppInstallButton *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  sub_10007E8C0(self->_installLabel, v3, v5, v7, v9);
  sub_10007E8C0(self->_installedLabel, v4, v6, v8, v10);
  sub_10007E8C0(self->_unavailableLabel, v4, v6, v8, v10);
  sub_10007E8C0(self->_installingLabel, v4, v6, v8, v10);
  [(COSAppInstallButton *)self setMode:self->_mode animated:0];
}

- (void)updateOutlineEnabled:(BOOL)a3 forMode:(unint64_t)a4
{
  switch(a4)
  {
    case 1uLL:
      uint64_t v5 = 32;
      goto LABEL_7;
    case 2uLL:
      uint64_t v5 = 24;
      goto LABEL_7;
    case 3uLL:
      uint64_t v5 = 40;
      goto LABEL_7;
    case 4uLL:
      uint64_t v5 = 48;
LABEL_7:
      [*(id *)((char *)&self->super.super.super.super.super.isa + v5) frame:a3];
      CGFloat x = v10;
      CGFloat y = v11;
      CGFloat width = v12;
      CGFloat height = v13;
      break;
    default:
      CGFloat x = CGRectZero.origin.x;
      CGFloat y = CGRectZero.origin.y;
      CGFloat width = CGRectZero.size.width;
      CGFloat height = CGRectZero.size.height;
      break;
  }
  [(COSAppInstallButton *)self _updateButtonOutline];
  outline = self->_outline;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double v15 = CGRectGetMinX(v20) + -10.0 + -1.0;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double v16 = CGRectGetMinY(v21) + -3.5;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double v17 = CGRectGetWidth(v22) + 20.0;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double v18 = CGRectGetHeight(v23) + 7.0;

  -[UIView setFrame:](outline, "setFrame:", v15, v16, v17, v18);
}

- (void)setMode:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_mode = a3;
  BOOL v7 = a3 == 1;
  [(COSAppInstallButton *)self setEnabled:a3 == 1];
  double v8 = 0.0;
  v9[1] = 3221225472;
  v9[0] = _NSConcreteStackBlock;
  v9[2] = sub_10007EC00;
  v9[3] = &unk_100245388;
  if (v4) {
    double v8 = 0.5;
  }
  v9[4] = self;
  v9[5] = a3;
  BOOL v10 = v7;
  +[UIView animateWithDuration:4 delay:v9 options:&stru_1002453A8 animations:v8 completion:0.0];
}

- (void)_updateButtonOutline
{
  id v5 = [(UIView *)self->_outline layer];
  if ([(COSAppInstallButton *)self isEnabled]) {
    BPSSetupTintColor();
  }
  else {
  CGFloat v3 = +[UIColor darkGrayColor];
  }
  BOOL v4 = [(COSAppInstallButton *)self _accessibilityHigherContrastTintColorForColor:v3];
  [v5 setBorderColor:[v4 cgColor]];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)COSAppInstallButton;
  [(COSAppInstallButton *)&v3 tintColorDidChange];
  [(COSAppInstallButton *)self _updateButtonOutline];
}

- (unint64_t)mode
{
  return self->_mode;
}

- (UIView)outline
{
  return self->_outline;
}

- (void)setOutline:(id)a3
{
}

- (UILabel)installedLabel
{
  return self->_installedLabel;
}

- (void)setInstalledLabel:(id)a3
{
}

- (UILabel)installLabel
{
  return self->_installLabel;
}

- (void)setInstallLabel:(id)a3
{
}

- (UILabel)unavailableLabel
{
  return self->_unavailableLabel;
}

- (void)setUnavailableLabel:(id)a3
{
}

- (UILabel)installingLabel
{
  return self->_installingLabel;
}

- (void)setInstallingLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installingLabel, 0);
  objc_storeStrong((id *)&self->_unavailableLabel, 0);
  objc_storeStrong((id *)&self->_installLabel, 0);
  objc_storeStrong((id *)&self->_installedLabel, 0);

  objc_storeStrong((id *)&self->_outline, 0);
}

@end