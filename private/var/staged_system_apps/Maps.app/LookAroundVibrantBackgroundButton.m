@interface LookAroundVibrantBackgroundButton
+ (id)customButtonWithImage:(id)a3 title:(id)a4 target:(id)a5 action:(SEL)a6;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (LookAroundVibrantBackgroundButton)init;
- (LookAroundVibrantBackgroundButton)initWithFrame:(CGRect)a3;
- (MKVibrantView)vibrantView;
- (void)_commonInit;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3 title:(id)a4;
- (void)setVibrantView:(id)a3;
- (void)updateTheme;
@end

@implementation LookAroundVibrantBackgroundButton

+ (id)customButtonWithImage:(id)a3 title:(id)a4 target:(id)a5 action:(SEL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [a1 buttonWithType:0];
  v14 = v13;
  if (v10) {
    [v13 setImage:v10 forState:0];
  }
  if (v11) {
    [v14 setTitle:v11 forState:0];
  }
  [v14 addTarget:v12 action:a6 forControlEvents:64];

  return v14;
}

- (void)_commonInit
{
  [(LookAroundVibrantBackgroundButton *)self setAdjustsImageWhenHighlighted:0];
  [(LookAroundVibrantBackgroundButton *)self _setCornerRadius:8.0];
  [(LookAroundVibrantBackgroundButton *)self setContentVerticalAlignment:0];
  v3 = +[UIImageSymbolConfiguration configurationWithScale:3];
  [(LookAroundVibrantBackgroundButton *)self setPreferredSymbolConfiguration:v3 forImageInState:0];

  v4 = [(LookAroundVibrantBackgroundButton *)self titleLabel];
  [v4 setNumberOfLines:2];

  v5 = [(LookAroundVibrantBackgroundButton *)self titleLabel];
  [v5 setTextAlignment:4];

  v6 = [(LookAroundVibrantBackgroundButton *)self titleLabel];
  +[DynamicTypeWizard autorefreshLabel:v6 withFontProvider:&stru_101303608];

  v7 = objc_opt_new();
  [(LookAroundVibrantBackgroundButton *)self setBackgroundImage:v7 forState:0];

  v8 = [objc_alloc((Class)MKVibrantView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  vibrantView = self->_vibrantView;
  self->_vibrantView = v8;

  [(MKVibrantView *)self->_vibrantView _setCornerRadius:8.0];
  [(MKVibrantView *)self->_vibrantView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKVibrantView *)self->_vibrantView setUserInteractionEnabled:0];
  [(LookAroundVibrantBackgroundButton *)self addSubview:self->_vibrantView];
  v22 = [(MKVibrantView *)self->_vibrantView topAnchor];
  v21 = [(LookAroundVibrantBackgroundButton *)self topAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v23[0] = v20;
  v19 = [(MKVibrantView *)self->_vibrantView bottomAnchor];
  id v10 = [(LookAroundVibrantBackgroundButton *)self bottomAnchor];
  id v11 = [v19 constraintEqualToAnchor:v10];
  v23[1] = v11;
  id v12 = [(MKVibrantView *)self->_vibrantView leadingAnchor];
  v13 = [(LookAroundVibrantBackgroundButton *)self leadingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v23[2] = v14;
  v15 = [(MKVibrantView *)self->_vibrantView trailingAnchor];
  v16 = [(LookAroundVibrantBackgroundButton *)self trailingAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v23[3] = v17;
  v18 = +[NSArray arrayWithObjects:v23 count:4];
  +[NSLayoutConstraint activateConstraints:v18];

  [(LookAroundVibrantBackgroundButton *)self updateTheme];
}

- (LookAroundVibrantBackgroundButton)init
{
  v5.receiver = self;
  v5.super_class = (Class)LookAroundVibrantBackgroundButton;
  v2 = [(LookAroundVibrantBackgroundButton *)&v5 init];
  v3 = v2;
  if (v2) {
    [(LookAroundVibrantBackgroundButton *)v2 _commonInit];
  }
  return v3;
}

- (LookAroundVibrantBackgroundButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LookAroundVibrantBackgroundButton;
  v3 = -[LookAroundVibrantBackgroundButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(LookAroundVibrantBackgroundButton *)v3 _commonInit];
  }
  return v4;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v33.receiver = self;
  v33.super_class = (Class)LookAroundVibrantBackgroundButton;
  -[LookAroundVibrantBackgroundButton imageRectForContentRect:](&v33, "imageRectForContentRect:");
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v34.origin.double x = x;
  v34.origin.double y = y;
  v34.size.double width = width;
  v34.size.double height = height;
  if (!CGRectIsEmpty(v34))
  {
    v32.receiver = self;
    v32.super_class = (Class)LookAroundVibrantBackgroundButton;
    -[LookAroundVibrantBackgroundButton titleRectForContentRect:](&v32, "titleRectForContentRect:", x, y, width, height);
    double v17 = width + -34.0 - v13;
    if (v16 >= v17) {
      double v18 = width + -34.0 - v13;
    }
    else {
      double v18 = v16;
    }
    double v19 = fmax(v16 - v17, 0.0);
    double v20 = width * -0.5 + v18 * -0.5 + 34.0;
    v21 = +[UIApplication sharedApplication];
    id v22 = [v21 userInterfaceLayoutDirection];

    double v23 = -v20;
    double v24 = -v19;
    if (v22 != (id)1)
    {
      double v24 = v19;
      double v23 = v20;
    }
    double v25 = v24 * 0.5;
    BOOL v26 = v24 == 0.0;
    double v27 = -0.0;
    if (!v26) {
      double v27 = v25;
    }
    double v9 = v9 + v27 - v23;
  }
  double v28 = v9;
  double v29 = v11;
  double v30 = v13;
  double v31 = v15;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v33.receiver = self;
  v33.super_class = (Class)LookAroundVibrantBackgroundButton;
  -[LookAroundVibrantBackgroundButton titleRectForContentRect:](&v33, "titleRectForContentRect:");
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v34.origin.double x = x;
  v34.origin.double y = y;
  v34.size.double width = width;
  v34.size.double height = height;
  if (!CGRectIsEmpty(v34))
  {
    v32.receiver = self;
    v32.super_class = (Class)LookAroundVibrantBackgroundButton;
    -[LookAroundVibrantBackgroundButton imageRectForContentRect:](&v32, "imageRectForContentRect:", x, y, width, height);
    double v17 = width + -34.0 - v16;
    if (v13 >= v17) {
      double v18 = width + -34.0 - v16;
    }
    else {
      double v18 = v13;
    }
    double v19 = fmax(v13 - v17, 0.0);
    double v20 = v18 * 0.5 - width * 0.5 - v16 * 0.5 + 17.0;
    v21 = +[UIApplication sharedApplication];
    id v22 = [v21 userInterfaceLayoutDirection];

    double v23 = -v20;
    double v24 = -v19;
    if (v22 != (id)1)
    {
      double v24 = v19;
      double v23 = v20;
    }
    double v25 = v24 * 0.5;
    BOOL v26 = v24 == 0.0;
    if (v24 != 0.0) {
      double v13 = v18;
    }
    double v27 = -0.0;
    if (!v26) {
      double v27 = v25;
    }
    double v9 = v9 + v27 + v23;
    double v15 = height;
    double v11 = y;
  }
  double v28 = v9;
  double v29 = v11;
  double v30 = v13;
  double v31 = v15;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LookAroundVibrantBackgroundButton;
  [(LookAroundVibrantBackgroundButton *)&v4 setHighlighted:a3];
  [(LookAroundVibrantBackgroundButton *)self updateTheme];
}

- (void)setImage:(id)a3 title:(id)a4
{
  id v6 = a4;
  [(LookAroundVibrantBackgroundButton *)self setImage:a3 forState:0];
  [(LookAroundVibrantBackgroundButton *)self setTitle:v6 forState:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)LookAroundVibrantBackgroundButton;
  [(LookAroundVibrantBackgroundButton *)&v3 layoutSubviews];
  [(LookAroundVibrantBackgroundButton *)self sendSubviewToBack:self->_vibrantView];
}

- (void)updateTheme
{
  id v3 = [(LookAroundVibrantBackgroundButton *)self tintAdjustmentMode];
  objc_super v4 = [(LookAroundVibrantBackgroundButton *)self mk_theme];
  objc_super v5 = v4;
  if (v3 == (id)2) {
    [v4 disabledActionRowTextColor];
  }
  else {
  id v11 = [v4 tintColor];
  }

  [(LookAroundVibrantBackgroundButton *)self setTitleColor:v11 forState:0];
  unsigned int v6 = [(LookAroundVibrantBackgroundButton *)self isHighlighted];
  v7 = [(LookAroundVibrantBackgroundButton *)self mk_theme];
  double v8 = v7;
  if (v6) {
    [v7 buttonHighlightedColor];
  }
  else {
  double v9 = [v7 buttonNormalColor];
  }
  double v10 = [(MKVibrantView *)self->_vibrantView contentView];
  [v10 setBackgroundColor:v9];
}

- (MKVibrantView)vibrantView
{
  return self->_vibrantView;
}

- (void)setVibrantView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end