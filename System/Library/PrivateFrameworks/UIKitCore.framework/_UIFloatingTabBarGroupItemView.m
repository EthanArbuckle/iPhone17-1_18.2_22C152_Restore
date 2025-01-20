@interface _UIFloatingTabBarGroupItemView
- (UIImageView)imageView;
- (UIView)punchOutView;
- (_UIFloatingTabBarGroupItemView)initWithImage:(id)a3 needsPunchOut:(BOOL)a4;
- (void)layoutSubviews;
@end

@implementation _UIFloatingTabBarGroupItemView

- (_UIFloatingTabBarGroupItemView)initWithImage:(id)a3 needsPunchOut:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_UIFloatingTabBarGroupItemView;
  v7 = -[UIView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = v7;
  if (v7)
  {
    v9 = [(UIView *)v7 traitCollection];
    v10 = _UIFloatingTabBarGetPlatformMetrics([v9 userInterfaceIdiom]);

    v11 = [[UIImageView alloc] initWithImage:v6];
    [(UIImageView *)v11 setContentMode:1];
    v12 = [v10 symbolConfiguration];
    [(UIImageView *)v11 setPreferredSymbolConfiguration:v12];

    v13 = +[UIColor systemFillColor];
    [(UIImageView *)v11 setBackgroundColor:v13];

    [(UIView *)v11 setClipsToBounds:1];
    [(UIView *)v8 addSubview:v11];
    objc_storeStrong((id *)&v8->_imageView, v11);
    if (v4)
    {
      v14 = objc_alloc_init(UIView);
      uint64_t v15 = *MEMORY[0x1E4F3A098];
      v16 = [(UIView *)v14 layer];
      [v16 setCompositingFilter:v15];

      v17 = +[UIColor blackColor];
      [(UIView *)v14 setBackgroundColor:v17];

      [(UIView *)v11 addSubview:v14];
      punchOutView = v8->_punchOutView;
      v8->_punchOutView = v14;
    }
  }

  return v8;
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)_UIFloatingTabBarGroupItemView;
  [(UIView *)&v32 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(_UIFloatingTabBarGroupItemView *)self imageView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = [(_UIFloatingTabBarGroupItemView *)self imageView];
  objc_msgSend(v12, "_setContinuousCornerRadius:", fmin(v8, v10) * 0.5);

  v13 = [(_UIFloatingTabBarGroupItemView *)self punchOutView];

  if (v13)
  {
    v14 = [(UIView *)self traitCollection];
    uint64_t v15 = _UIFloatingTabBarGetPlatformMetrics([v14 userInterfaceIdiom]);

    [v15 groupItemSpacing];
    CGFloat v17 = -(v8 * 0.5 + v16);
    v33.origin.CGFloat x = v4;
    v33.origin.CGFloat y = v6;
    v33.size.CGFloat width = v8;
    v33.size.CGFloat height = v10;
    CGRect v34 = CGRectOffset(v33, v17, 0.0);
    CGFloat x = v34.origin.x;
    CGFloat y = v34.origin.y;
    CGFloat width = v34.size.width;
    CGFloat height = v34.size.height;
    [v15 groupItemPunchOutWidth];
    CGFloat v23 = -v22;
    [v15 groupItemPunchOutWidth];
    CGFloat v25 = -v24;
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    CGRect v36 = CGRectInset(v35, v23, v25);
    double v26 = v36.origin.x;
    double v27 = v36.origin.y;
    double v28 = v36.size.width;
    double v29 = v36.size.height;
    v30 = [(_UIFloatingTabBarGroupItemView *)self punchOutView];
    objc_msgSend(v30, "setFrame:", v26, v27, v28, v29);

    v31 = [(_UIFloatingTabBarGroupItemView *)self punchOutView];
    objc_msgSend(v31, "_setContinuousCornerRadius:", fmin(v28, v29) * 0.5);
  }
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIView)punchOutView
{
  return self->_punchOutView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punchOutView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end