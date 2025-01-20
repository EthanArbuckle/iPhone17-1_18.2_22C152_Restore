@interface SBFloatyFolderScrollView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation SBFloatyFolderScrollView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v6 = self;
  v7 = [(SBFloatyFolderScrollView *)self superview];
  -[SBFloatyFolderScrollView convertPoint:toView:](v6, "convertPoint:toView:", v7, x, y);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v7 bounds];
  v13.double x = v9;
  v13.double y = v11;
  LOBYTE(v6) = CGRectContainsPoint(v14, v13);

  return (char)v6;
}

@end