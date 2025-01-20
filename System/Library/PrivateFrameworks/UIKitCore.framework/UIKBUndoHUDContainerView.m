@interface UIKBUndoHUDContainerView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation UIKBUndoHUDContainerView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIView *)self bounds];
  double v7 = v6 + -20.0;
  double v9 = v8 + 40.0;
  double v11 = v10 + -20.0;
  double v13 = v12 + 40.0;
  CGFloat v14 = x;
  CGFloat v15 = y;
  return CGRectContainsPoint(*(CGRect *)&v7, *(CGPoint *)&v14);
}

@end