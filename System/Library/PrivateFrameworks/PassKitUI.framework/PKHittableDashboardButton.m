@interface PKHittableDashboardButton
- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PKHittableDashboardButton

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(PKHittableDashboardButton *)self hitRect];
  v10.CGFloat x = x;
  v10.CGFloat y = y;
  if (CGRectContainsPoint(v11, v10)) {
    v7 = self;
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(PKHittableDashboardButton *)self hitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

@end