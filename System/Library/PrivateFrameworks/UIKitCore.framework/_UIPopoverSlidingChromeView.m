@interface _UIPopoverSlidingChromeView
+ (UIEdgeInsets)contentViewInsets;
+ (double)arrowBase;
+ (double)arrowHeight;
+ (double)cornerRadius;
- (CGSize)_shadowOffset;
- (UIEdgeInsets)_contentViewInsets;
- (UIEdgeInsets)_shadowInsets;
- (double)_shadowOpacity;
- (double)_shadowRadius;
- (double)arrowOffset;
- (id)_shadowPathForRect:(CGRect)a3 arrowDirection:(unint64_t)a4;
- (unint64_t)arrowDirection;
- (void)layoutSubviews;
@end

@implementation _UIPopoverSlidingChromeView

+ (double)arrowHeight
{
  return 0.0;
}

+ (double)arrowBase
{
  return 0.0;
}

+ (double)cornerRadius
{
  return 0.0;
}

+ (UIEdgeInsets)contentViewInsets
{
  +[UISplitViewControllerClassicImpl _defaultGutterWidthInView:0];
  double v3 = v2;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.right = v3;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)_contentViewInsets
{
  +[UISplitViewControllerClassicImpl _defaultGutterWidthInView:self];
  int v4 = *((_DWORD *)&self->super.super._viewFlags + 4);
  double v5 = 0.0;
  if ((v4 & 0x80000) != 0) {
    double v6 = v3;
  }
  else {
    double v6 = 0.0;
  }
  if ((*(void *)&v4 & 0x80000) != 0) {
    double v7 = 0.0;
  }
  else {
    double v7 = v3;
  }
  double v8 = 0.0;
  result.right = v7;
  result.bottom = v5;
  result.left = v6;
  result.top = v8;
  return result;
}

- (UIEdgeInsets)_shadowInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)_shadowOpacity
{
  return 0.0;
}

- (double)_shadowRadius
{
  return 0.0;
}

- (CGSize)_shadowOffset
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_shadowPathForRect:(CGRect)a3 arrowDirection:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(id)objc_opt_class() cornerRadius];
  return +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v8);
}

- (double)arrowOffset
{
  return 0.0;
}

- (unint64_t)arrowDirection
{
  return 0;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPopoverSlidingChromeView;
  [(UIPopoverBackgroundView *)&v6 layoutSubviews];
  double v3 = [(UIView *)self layer];
  id v4 = +[UIColor systemGrayColor];
  objc_msgSend(v3, "setBorderColor:", objc_msgSend(v4, "CGColor"));

  double v5 = [(UIView *)self layer];
  [v5 setBorderWidth:10.0];
}

@end