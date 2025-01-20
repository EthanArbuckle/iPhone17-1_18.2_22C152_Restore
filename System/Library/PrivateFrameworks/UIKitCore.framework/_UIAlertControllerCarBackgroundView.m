@interface _UIAlertControllerCarBackgroundView
- (_UIAlertControllerCarBackgroundView)initWithFrame:(CGRect)a3;
- (id)_colorForInterfaceStyle:(int64_t)a3;
- (void)layoutSubviews;
- (void)setCornerRadius:(double)a3;
- (void)setRoundedCornerPosition:(unint64_t)a3;
@end

@implementation _UIAlertControllerCarBackgroundView

- (_UIAlertControllerCarBackgroundView)initWithFrame:(CGRect)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)_UIAlertControllerCarBackgroundView;
  v3 = -[UIView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(UIVisualEffectView);
    [(UIView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = +[UIColorEffect colorEffectSaturate:1.5];
    v21 = +[UIBlurEffect effectWithBlurRadius:10.0];
    v25[0] = v22;
    v25[1] = v21;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    [(UIVisualEffectView *)v4 setBackgroundEffects:v5];

    [(UIView *)v3 addSubview:v4];
    v15 = (void *)MEMORY[0x1E4F5B268];
    v20 = [(UIView *)v4 topAnchor];
    v19 = [(UIView *)v3 topAnchor];
    v18 = [v20 constraintEqualToAnchor:v19];
    v24[0] = v18;
    v17 = [(UIView *)v4 leftAnchor];
    v16 = [(UIView *)v3 leftAnchor];
    v6 = [v17 constraintEqualToAnchor:v16];
    v24[1] = v6;
    v7 = [(UIView *)v4 rightAnchor];
    v8 = [(UIView *)v3 rightAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    v24[2] = v9;
    v10 = [(UIView *)v4 bottomAnchor];
    v11 = [(UIView *)v3 bottomAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v24[3] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
    [v15 activateConstraints:v13];
  }
  return v3;
}

- (void)setCornerRadius:(double)a3
{
  id v4 = [(UIView *)self layer];
  [v4 setCornerRadius:a3];
}

- (void)setRoundedCornerPosition:(unint64_t)a3
{
  id v4 = [(UIView *)self layer];
  [v4 setMaskedCorners:a3];
}

- (id)_colorForInterfaceStyle:(int64_t)a3
{
  if (a3 == 1) {
    double v3 = 0.964705882;
  }
  else {
    double v3 = 0.250980392;
  }
  id v4 = +[UIColor colorWithRed:v3 green:v3 blue:v3 alpha:0.9];
  return v4;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_UIAlertControllerCarBackgroundView;
  [(UIView *)&v5 layoutSubviews];
  double v3 = [(UIView *)self traitCollection];
  id v4 = -[_UIAlertControllerCarBackgroundView _colorForInterfaceStyle:](self, "_colorForInterfaceStyle:", [v3 userInterfaceStyle]);
  [(UIView *)self setBackgroundColor:v4];
}

@end