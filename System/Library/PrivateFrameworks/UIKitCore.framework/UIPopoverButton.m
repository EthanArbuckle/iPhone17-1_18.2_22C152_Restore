@interface UIPopoverButton
+ (Class)_visualProviderClassForIdiom:(int64_t)a3;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (UIPopoverButton)initWithFrame:(CGRect)a3 buttonType:(int64_t)a4;
- (void)setEnabled:(BOOL)a3;
@end

@implementation UIPopoverButton

+ (Class)_visualProviderClassForIdiom:(int64_t)a3
{
  return (Class)objc_opt_class();
}

- (UIPopoverButton)initWithFrame:(CGRect)a3 buttonType:(int64_t)a4
{
  v14.receiver = self;
  v14.super_class = (Class)UIPopoverButton;
  v4 = -[UIButton initWithFrame:](&v14, sel_initWithFrame_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = +[UIColor whiteColor];
    [(UIButton *)v4 setTitleColor:v5 forStates:0];

    v6 = +[UIColor colorWithWhite:0.0 alpha:0.5];
    [(UIButton *)v4 setTitleShadowColor:v6 forState:0];

    [(UIButton *)v4 setAdjustsImageWhenDisabled:0];
    [(UIButton *)v4 setAdjustsImageWhenHighlighted:0];
    v7 = [(UIButton *)v4 titleLabel];
    objc_msgSend(v7, "setShadowOffset:", 0.0, -1.0);

    v8 = [(UIView *)v4 traitCollection];
    uint64_t v9 = [v8 userInterfaceIdiom];

    double v10 = 19.0;
    if (v9 == 5) {
      double v10 = 15.0;
    }
    v11 = [off_1E52D39B8 boldSystemFontOfSize:v10];
    v12 = [(UIButton *)v4 titleLabel];
    [v12 setFont:v11];
  }
  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIPopoverButton;
  -[UIButton setEnabled:](&v8, sel_setEnabled_);
  if (![(UIButton *)self _isModernButton])
  {
    v5 = [(UIButton *)self titleLabel];
    v6 = v5;
    double v7 = 0.5;
    if (v3) {
      double v7 = 1.0;
    }
    [v5 setAlpha:v7];
  }
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(UIView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  v12.receiver = self;
  v12.super_class = (Class)UIPopoverButton;
  -[UIButton _intrinsicSizeWithinSize:](&v12, sel__intrinsicSizeWithinSize_, width, height);
  double v9 = 22.0;
  if (v7 == 5) {
    double v9 = 16.0;
  }
  double v10 = v9 + v8;
  double v11 = 44.0;
  if (v7 == 5) {
    double v11 = 34.0;
  }
  result.double height = v11;
  result.double width = v10;
  return result;
}

@end