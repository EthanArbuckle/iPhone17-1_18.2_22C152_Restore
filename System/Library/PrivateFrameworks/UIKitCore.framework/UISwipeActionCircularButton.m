@interface UISwipeActionCircularButton
+ (double)defaultButtonWidth;
+ (double)maximumButtonHeight;
+ (id)titleFont;
- (UISwipeActionCircularButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
@end

@implementation UISwipeActionCircularButton

- (UISwipeActionCircularButton)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)UISwipeActionCircularButton;
  v3 = -[UISwipeActionButton initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 48.0, 48.0);
    [(UISwipeActionButton *)v3 setBackgroundView:v4];

    v5 = [(UISwipeActionButton *)v3 visualStyle];
    v6 = [v5 defaultButtonBackgroundColor];
    v7 = [(UISwipeActionButton *)v3 backgroundView];
    [v7 setBackgroundColor:v6];

    v8 = [(UISwipeActionButton *)v3 backgroundView];
    v9 = [v8 layer];
    [v9 setCornerRadius:24.0];

    v10 = [(UISwipeActionButton *)v3 backgroundView];
    v11 = [v10 layer];
    [v11 setAllowsEdgeAntialiasing:1];

    v12 = [(UISwipeActionButton *)v3 backgroundView];
    [(UIView *)v3 addSubview:v12];
  }
  return v3;
}

- (void)layoutSubviews
{
  v56.receiver = self;
  v56.super_class = (Class)UISwipeActionCircularButton;
  [(UIButton *)&v56 layoutSubviews];
  [(UIView *)self bounds];
  -[UISwipeActionButton _allowableContentRectForContentRect:](self, "_allowableContentRectForContentRect:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(UISwipeActionButton *)self backgroundView];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = UIRectCenteredIntegralRectScale(v13, v15, v17, v19, v4, v6, v8, v10, 0.0);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  v27 = [(UISwipeActionButton *)self backgroundView];
  objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

  v28 = [(UISwipeActionButton *)self backgroundView];
  [(UIView *)self sendSubviewToBack:v28];

  v29 = [(UIButton *)self imageView];
  [v29 sizeToFit];

  v30 = [(UIButton *)self imageView];
  [v30 frame];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

  if (v38 >= 33.9411255 || v36 >= 33.9411255)
  {
    if (v38 >= v36) {
      double v47 = v38;
    }
    else {
      double v47 = v36;
    }
    double v48 = UIRectCenteredIntegralRectScale(v32, v34, v36 * (33.9411255 / v47), v38 * (33.9411255 / v47), v4, v6, v8, v10, 0.0);
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;
    v55 = [(UIButton *)self imageView];
    objc_msgSend(v55, "setFrame:", v48, v50, v52, v54);

    v46 = [(UIButton *)self imageView];
    [v46 setContentMode:1];
  }
  else
  {
    double v39 = UIRectCenteredIntegralRectScale(v32, v34, v36, v38, v4, v6, v8, v10, 0.0);
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    v46 = [(UIButton *)self imageView];
    objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);
  }
}

+ (double)defaultButtonWidth
{
  return 69.0;
}

+ (double)maximumButtonHeight
{
  return 100.0;
}

+ (id)titleFont
{
  return (id)[off_1E52D39B8 systemFontOfSize:13.0 weight:*(double *)off_1E52D6BF0];
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UISwipeActionCircularButton;
  id v4 = a3;
  [(UISwipeActionButton *)&v5 setBackgroundColor:v4];
  -[UIButton setTitleColor:forState:](self, "setTitleColor:forState:", v4, 0, v5.receiver, v5.super_class);
}

@end