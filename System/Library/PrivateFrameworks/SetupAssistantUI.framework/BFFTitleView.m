@interface BFFTitleView
- (BFFTitleView)initWithFrame:(CGRect)a3;
- (CGRect)contentBounds;
- (UILabel)titleLabel;
- (void)layoutSubviews;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation BFFTitleView

- (BFFTitleView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BFFTitleView;
  v3 = -[BFFTitleView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F828E0]);
    [(BFFTitleView *)v3 setTitleLabel:v4];

    v5 = +[BFFStyle sharedStyle];
    v6 = [(BFFTitleView *)v3 titleLabel];
    [v5 applyThemeToTitleLabel:v6];

    v7 = [(BFFTitleView *)v3 titleLabel];
    [(BFFTitleView *)v3 addSubview:v7];

    [(BFFTitleView *)v3 setContentInsetAdjustmentBehavior:2];
  }
  return v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  v5 = [(BFFTitleView *)self titleLabel];
  [v5 setText:v4];

  [(BFFTitleView *)self setNeedsLayout];
}

- (CGRect)contentBounds
{
  v3 = +[BFFStyle sharedStyle];
  id v4 = [(BFFTitleView *)self superview];
  v5 = [(BFFTitleView *)self superview];
  [v5 bounds];
  [v3 horizontalInsetsForContainingInView:v4 width:v6];

  [(BFFTitleView *)self frame];
  [(BFFTitleView *)self safeAreaInsets];
  UIRectInset();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(BFFTitleView *)self safeAreaInsets];
  double v16 = v15;
  [(BFFTitleView *)self safeAreaInsets];
  double v18 = v14 - (v16 + v17);
  double v19 = v8;
  double v20 = v10;
  double v21 = v12;
  result.size.height = v18;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)BFFTitleView;
  [(BFFTitleView *)&v21 layoutSubviews];
  [(BFFTitleView *)self contentBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(BFFTitleView *)self titleLabel];
  objc_msgSend(v11, "sizeThatFits:", v8, v10);
  double v13 = v12;

  double v14 = +[BFFStyle sharedStyle];
  objc_msgSend(v14, "headerTitleBaselineOffsetForView:iconSize:", self, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  double v16 = v6 + v15;
  double v17 = [(BFFTitleView *)self titleLabel];
  [v17 _firstBaselineOffsetFromTop];
  double v19 = v16 - v18;

  double v20 = [(BFFTitleView *)self titleLabel];
  objc_msgSend(v20, "setFrame:", v4, v19, v8, v13);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end