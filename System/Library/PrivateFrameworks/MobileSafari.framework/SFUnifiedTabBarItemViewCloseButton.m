@interface SFUnifiedTabBarItemViewCloseButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)pointInsideForPointer:(CGPoint)a3;
@end

@implementation SFUnifiedTabBarItemViewCloseButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SFUnifiedTabBarItemViewCloseButton;
  if (-[SFUnifiedTabBarItemViewCloseButton pointInside:withEvent:](&v10, sel_pointInside_withEvent_, v7, x, y))
  {
    if ([v7 buttonMask]) {
      BOOL v8 = -[SFUnifiedTabBarItemViewCloseButton pointInsideForPointer:](self, "pointInsideForPointer:", x, y);
    }
    else {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)pointInsideForPointer:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = self;
  v6 = [(SFUnifiedTabBarItemViewCloseButton *)self _imageView];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  objc_msgSend(v6, "convertPoint:fromView:", v5, x, y);
  v18.double x = v15;
  v18.double y = v16;
  v19.origin.double x = v8;
  v19.origin.double y = v10;
  v19.size.width = v12;
  v19.size.height = v14;
  LOBYTE(v5) = CGRectContainsPoint(v19, v18);

  return (char)v5;
}

@end