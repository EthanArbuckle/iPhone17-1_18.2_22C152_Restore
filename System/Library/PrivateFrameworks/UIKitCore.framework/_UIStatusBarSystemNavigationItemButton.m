@interface _UIStatusBarSystemNavigationItemButton
+ (BOOL)_buttonTypeIsModernUI:(int64_t)a3;
- (BOOL)shouldLayoutImageOnRight;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
@end

@implementation _UIStatusBarSystemNavigationItemButton

+ (BOOL)_buttonTypeIsModernUI:(int64_t)a3
{
  return 1;
}

- (BOOL)shouldLayoutImageOnRight
{
  v2 = [(UIView *)self superview];
  char v3 = [v2 _shouldLayoutImageOnRight];

  return v3;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)_UIStatusBarSystemNavigationItemButton;
  -[UIButton imageRectForContentRect:](&v18, sel_imageRectForContentRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = v4;
  double v7 = v6;
  if ([(_UIStatusBarSystemNavigationItemButton *)self shouldLayoutImageOnRight]) {
    [(UIView *)self bounds];
  }
  v8 = +[UIScreen mainScreen];
  UIRoundToScreenScale(v8);
  double v10 = v9;

  v11 = +[UIScreen mainScreen];
  UIRoundToScreenScale(v11);
  double v13 = v12;

  double v14 = v10;
  double v15 = v13;
  double v16 = v5;
  double v17 = v7;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v23.receiver = self;
  v23.super_class = (Class)_UIStatusBarSystemNavigationItemButton;
  -[UIButton titleRectForContentRect:](&v23, sel_titleRectForContentRect_);
  double v9 = v8;
  double v11 = v10;
  -[_UIStatusBarSystemNavigationItemButton imageRectForContentRect:](self, "imageRectForContentRect:", x, y, width, height);
  double v13 = v12;
  if ([(_UIStatusBarSystemNavigationItemButton *)self shouldLayoutImageOnRight]) {
    double v15 = width - v13 + -4.0;
  }
  else {
    double v15 = v9;
  }
  double v16 = +[UIScreen mainScreen];
  UIRoundToScreenScale(v16);
  double v18 = v17;

  double v19 = 0.0;
  double v20 = v18;
  double v21 = v15;
  double v22 = v11;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v19;
  result.origin.double x = v20;
  return result;
}

@end