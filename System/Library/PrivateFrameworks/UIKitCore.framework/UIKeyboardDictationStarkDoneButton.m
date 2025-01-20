@interface UIKeyboardDictationStarkDoneButton
- (UIKeyboardDictationStarkDoneButton)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation UIKeyboardDictationStarkDoneButton

- (UIKeyboardDictationStarkDoneButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardDictationStarkDoneButton;
  v3 = -[UIButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(UIView *)v3 setBackgroundColor:v4];

    v5 = v3;
  }

  return v3;
}

- (void)drawRect:(CGRect)a3
{
  [(UIView *)self bounds];
  CGRect v7 = CGRectInset(v6, 4.0, 4.0);
  +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, v7.origin.x, v7.origin.y, v7.size.width, v7.size.height, v7.size.height * 0.5, v7.size.height * 0.5);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = +[UIColor blackColor];
  [v3 set];

  [v4 fill];
}

@end