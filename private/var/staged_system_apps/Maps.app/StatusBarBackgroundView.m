@interface StatusBarBackgroundView
- (CGImage)maskImage;
- (NSLayoutYAxisAnchor)safeAreaTopLayoutAnchor;
- (StatusBarBackgroundView)initWithSafeAreaTopLayoutAnchor:(id)a3;
- (StatusBarBackgroundViewStyle)style;
- (UIColor)additionalColor;
- (double)_blurViewBottomPadding;
- (id)_blurView;
- (void)_addBlurView:(id)a3;
- (void)_removeBlurView;
- (void)_updateContent;
- (void)layoutSubviews;
- (void)setAdditionalColor:(id)a3;
- (void)setStyle:(id)a3;
- (void)updateTheme;
@end

@implementation StatusBarBackgroundView

- (StatusBarBackgroundView)initWithSafeAreaTopLayoutAnchor:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)StatusBarBackgroundView;
  v6 = -[StatusBarBackgroundView initWithFrame:](&v13, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_safeAreaTopLayoutAnchor, a3);
    v8 = [StatusBarBackgroundViewStyle alloc];
    v9 = +[UIColor clearColor];
    v10 = [(StatusBarBackgroundViewStyle *)v8 initWithColor:v9];
    style = v7->_style;
    v7->_style = v10;

    v7->_statusBarBackgroundViewAlphaChannelEnabled = GEOConfigGetBOOL();
  }

  return v7;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)StatusBarBackgroundView;
  [(StatusBarBackgroundView *)&v3 layoutSubviews];
  [(StatusBarBackgroundView *)self _blurViewBottomPadding];
  -[NSLayoutConstraint setConstant:](self->_blurViewBottomConstraint, "setConstant:");
}

- (double)_blurViewBottomPadding
{
  uint64_t v3 = sub_1000BBB44(self);
  [(StatusBarBackgroundView *)self bounds];
  double Height = CGRectGetHeight(v10);
  [(StatusBarBackgroundView *)self safeAreaInsets];
  if (Height <= 0.0) {
    return 0.0;
  }
  double v6 = v5;
  BOOL v7 = Height <= v5 && v3 == 1;
  BOOL v8 = v7;
  double result = 8.0;
  if (v6 != 0.0 && !v8) {
    return 0.0;
  }
  return result;
}

- (void)setStyle:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_style;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    id v9 = (id)v7;
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    unint64_t v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_style, a3);
      [(StatusBarBackgroundView *)self _updateContent];
      unint64_t v7 = (unint64_t)v9;
    }
  }
}

- (void)_updateContent
{
  uint64_t v3 = [(StatusBarBackgroundView *)self style];
  v4 = (char *)[v3 type];

  if ((unint64_t)(v4 - 1) >= 3)
  {
    if (!v4)
    {
      [(StatusBarBackgroundView *)self _removeBlurView];
      id v10 = [(StatusBarBackgroundView *)self style];
      id v9 = [v10 color];
      [(StatusBarBackgroundView *)self setBackgroundColor:v9];
    }
  }
  else
  {
    [(StatusBarBackgroundView *)self _removeBlurView];
    id v5 = +[UIColor clearColor];
    [(StatusBarBackgroundView *)self setBackgroundColor:v5];

    unint64_t v6 = [(StatusBarBackgroundView *)self _blurView];
    blurView = self->_blurView;
    self->_blurView = v6;

    unsigned __int8 v8 = self->_blurView;
    [(StatusBarBackgroundView *)self _addBlurView:v8];
  }
}

- (void)_removeBlurView
{
  [(MUBlurView *)self->_blurView removeFromSuperview];
  blurView = self->_blurView;
  self->_blurView = 0;

  blurViewBottomConstraint = self->_blurViewBottomConstraint;
  self->_blurViewBottomConstraint = 0;
}

- (id)_blurView
{
  uint64_t v3 = [(StatusBarBackgroundView *)self style];
  id v4 = [v3 type];

  if (v4 == (id)1)
  {
    id v5 = objc_alloc((Class)MUBlurView);
    unint64_t v6 = [(StatusBarBackgroundView *)self style];
    id v7 = [v5 initWithBlurEffectStyle:[v6 blurStyle]];
  }
  else
  {
    unsigned __int8 v8 = [(StatusBarBackgroundView *)self style];
    id v9 = [v8 type];

    id v10 = objc_alloc((Class)MUBlurView);
    unint64_t v6 = [(StatusBarBackgroundView *)self style];
    [v6 blurRadius];
    if (v9 == (id)3) {
      id v7 = [v10 initWithVariableBlurWithRadius:[self maskImage] maskImage:v11];
    }
    else {
      id v7 = [v10 initWithGaussianBlurWithRadius:v11];
    }
  }
  v12 = v7;

  objc_super v13 = [(StatusBarBackgroundView *)self additionalColor];
  [v12 setOverlayColor:v13];

  v14 = [(StatusBarBackgroundView *)self style];
  v15 = [v14 defaultColorProvider];
  v16 = [(StatusBarBackgroundView *)self theme];
  v17 = ((void (**)(void, void *))v15)[2](v15, v16);
  [v12 setNonBlurredColor:v17];

  v18 = [(StatusBarBackgroundView *)self style];
  v19 = [v18 groupName];
  [v12 setBlurGroupName:v19];

  v20 = [(StatusBarBackgroundView *)self style];
  if ([v20 disableBlur]) {
    uint64_t v21 = 2;
  }
  else {
    uint64_t v21 = 0;
  }
  [v12 setStyle:v21];

  return v12;
}

- (StatusBarBackgroundViewStyle)style
{
  return self->_style;
}

- (CGImage)maskImage
{
  id v3 = objc_alloc_init((Class)UIGraphicsImageRendererFormat);
  [v3 setScale:1.0];
  if (self->_statusBarBackgroundViewAlphaChannelEnabled) {
    uint64_t v4 = 0x7FFFLL;
  }
  else {
    uint64_t v4 = 2;
  }
  [v3 setPreferredRange:v4];
  id v5 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithBounds:v3 format:0.0, 0.0, 100.0, 100.0];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000799C8;
  v9[3] = &unk_1012E7370;
  v9[4] = 0;
  v9[5] = 0;
  int64x2_t v10 = vdupq_n_s64(0x4059000000000000uLL);
  id v6 = [v5 imageWithActions:v9];
  id v7 = (CGImage *)[v6 CGImage];

  return v7;
}

- (UIColor)additionalColor
{
  return self->_additionalColor;
}

- (void)_addBlurView:(id)a3
{
  id v4 = a3;
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(StatusBarBackgroundView *)self insertSubview:v4 atIndex:0];
  id v5 = [v4 bottomAnchor];
  id v6 = [(StatusBarBackgroundView *)self bottomAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];
  blurViewBottomConstraint = self->_blurViewBottomConstraint;
  self->_blurViewBottomConstraint = v7;

  v19 = [v4 leadingAnchor];
  v18 = [(StatusBarBackgroundView *)self leadingAnchor];
  id v9 = [v19 constraintEqualToAnchor:v18];
  v21[0] = v9;
  int64x2_t v10 = [v4 trailingAnchor];
  double v11 = [(StatusBarBackgroundView *)self trailingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v21[1] = v12;
  objc_super v13 = [v4 topAnchor];

  v14 = [(StatusBarBackgroundView *)self topAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v16 = self->_blurViewBottomConstraint;
  v21[2] = v15;
  v21[3] = v16;
  v17 = +[NSArray arrayWithObjects:v21 count:4];
  +[NSLayoutConstraint activateConstraints:v17];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001057A0;
  v20[3] = &unk_1012E5D08;
  v20[4] = self;
  +[UIView performWithoutAnimation:v20];
}

- (void)updateTheme
{
  v3.receiver = self;
  v3.super_class = (Class)StatusBarBackgroundView;
  [(MapsThemeView *)&v3 updateTheme];
  [(StatusBarBackgroundView *)self _updateContent];
}

- (void)setAdditionalColor:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_additionalColor;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    id v9 = (id)v7;
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    unint64_t v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_additionalColor, a3);
      [(MUBlurView *)self->_blurView setOverlayColor:v9];
      unint64_t v7 = (unint64_t)v9;
    }
  }
}

- (NSLayoutYAxisAnchor)safeAreaTopLayoutAnchor
{
  return self->_safeAreaTopLayoutAnchor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalColor, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_safeAreaTopLayoutAnchor, 0);
  objc_storeStrong((id *)&self->_blurViewBottomConstraint, 0);

  objc_storeStrong((id *)&self->_blurView, 0);
}

@end