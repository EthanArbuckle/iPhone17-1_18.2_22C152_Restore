@interface CustomCompositionalLayout
- (id)targetIndexPathForInteractivelyMovingItem:(id)a3 withPosition:(CGPoint)a4;
@end

@implementation CustomCompositionalLayout

- (id)targetIndexPathForInteractivelyMovingItem:(id)a3 withPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v8 = -[CustomCompositionalLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", x, y, 1.0, 1.0);
  if ([v8 count])
  {
    v9 = [v8 firstObject];
    v10 = [v9 indexPath];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CustomCompositionalLayout;
    v10 = -[CustomCompositionalLayout targetIndexPathForInteractivelyMovingItem:withPosition:](&v12, "targetIndexPathForInteractivelyMovingItem:withPosition:", v7, x, y);
  }

  return v10;
}

@end