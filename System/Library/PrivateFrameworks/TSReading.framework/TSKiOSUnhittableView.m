@interface TSKiOSUnhittableView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation TSKiOSUnhittableView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TSKiOSUnhittableView;
  id result = -[TSKiOSUnhittableView hitTest:withEvent:](&v6, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  if (result == self) {
    return 0;
  }
  return result;
}

@end