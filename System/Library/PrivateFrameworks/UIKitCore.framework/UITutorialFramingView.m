@interface UITutorialFramingView
- (UITutorialFramingView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation UITutorialFramingView

- (UITutorialFramingView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UITutorialFramingView;
  v3 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setUserInteractionEnabled:0];
    v5 = +[UIColor clearColor];
    [(UIView *)v4 setBackgroundColor:v5];

    BOOL v6 = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1;
    v7 = [(UIView *)v4 widthAnchor];
    v8 = [(UIView *)v4 heightAnchor];
    v9 = [v7 constraintEqualToAnchor:v8 multiplier:dbl_186B935E0[v6]];
    [v9 setActive:1];
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CGRect v6 = CGRectInset(a3, 5.0, 5.0);
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height, 14.0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = +[UIColor systemWhiteColor];
  [v3 setStroke];

  [v4 setLineWidth:6.0];
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [v4 setLineWidth:10.0];
  }
  [v4 stroke];
}

@end