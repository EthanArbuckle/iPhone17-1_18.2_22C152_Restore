@interface BKContentLoadingView
- (BKContentLoadingView)initWithFrame:(CGRect)a3 theme:(id)a4;
- (IMThemePage)theme;
- (UIActivityIndicatorView)spinner;
- (UILabel)label;
- (void)_updateColors;
- (void)setLabel:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setTheme:(id)a3;
@end

@implementation BKContentLoadingView

- (BKContentLoadingView)initWithFrame:(CGRect)a3 theme:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)BKContentLoadingView;
  v10 = -[BKContentLoadingView initWithFrame:](&v29, "initWithFrame:", x, y, width, height);
  if (v10)
  {
    CGFloat v11 = CGRectZero.origin.y;
    v30.origin.double x = CGRectZero.origin.x;
    v30.origin.double y = v11;
    v30.size.double width = 142.0;
    v30.size.double height = 97.0;
    double v12 = CGRectGetWidth(v30);
    v31.origin.double x = CGRectZero.origin.x;
    v31.origin.double y = v11;
    v31.size.double width = 142.0;
    v31.size.double height = 97.0;
    double v13 = CGRectGetHeight(v31);
    id v14 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
    [v14 frame];
    CGFloat v15 = v32.origin.x;
    CGFloat v16 = v32.origin.y;
    double v17 = v32.size.width;
    double v18 = v32.size.height;
    double v19 = CGRectGetWidth(v32);
    v33.origin.double x = v15;
    v33.origin.double y = v16;
    v33.size.double width = v17;
    v33.size.double height = v18;
    [v14 setFrame:floor((v12 - v19) * 0.5), floor((v13 - CGRectGetHeight(v33)) * 0.5) + -13.0, v17, v18];
    [(BKContentLoadingView *)v10 addSubview:v14];
    objc_storeStrong((id *)&v10->_spinner, v14);
    [v14 startAnimating];
    id v20 = objc_alloc_init((Class)UILabel);
    v21 = AEBundle();
    v22 = [v21 localizedStringForKey:@"Loading…" value:&stru_1DF0D8 table:0];
    [v20 setText:v22];

    v23 = +[UIFont boldSystemFontOfSize:14.0];
    [v20 setFont:v23];

    [v20 setFrame:CGRectMake(0.0, 60.0, 142.0, 25.0)];
    [v20 setTextAlignment:1];
    v24 = +[UIColor clearColor];
    [v20 setBackgroundColor:v24];

    [v20 setOpaque:0];
    objc_storeStrong((id *)&v10->_label, v20);
    [(BKContentLoadingView *)v10 addSubview:v20];
    [(BKContentLoadingView *)v10 setTheme:v9];
    v25 = [(BKContentLoadingView *)v10 layer];
    [v25 setCornerRadius:7.0];

    v26 = +[UITraitCollection bc_allAPITraits];
    id v27 = [(BKContentLoadingView *)v10 registerForTraitChanges:v26 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v10;
}

- (void)setTheme:(id)a3
{
  objc_storeStrong((id *)&self->_theme, a3);

  [(BKContentLoadingView *)self _updateColors];
}

- (void)_updateColors
{
  id v7 = [(BKContentLoadingView *)self theme];
  v3 = [(BKContentLoadingView *)self traitCollection];
  v4 = [v7 backgroundColorForTraitCollection:v3];
  [(BKContentLoadingView *)self setBackgroundColor:v4];

  v5 = [v7 contentTextColor];
  v6 = [(BKContentLoadingView *)self label];
  [v6 setTextColor:v5];
}

- (IMThemePage)theme
{
  return self->_theme;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_theme, 0);
}

@end