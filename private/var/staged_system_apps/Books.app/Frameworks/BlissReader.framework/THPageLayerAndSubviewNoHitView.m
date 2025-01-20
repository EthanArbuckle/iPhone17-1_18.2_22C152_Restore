@interface THPageLayerAndSubviewNoHitView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation THPageLayerAndSubviewNoHitView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)THPageLayerAndSubviewNoHitView;
  id result = -[THPageLayerAndSubviewNoHitView hitTest:withEvent:](&v6, "hitTest:withEvent:", a4, a3.x, a3.y);
  if (result == self) {
    return 0;
  }
  return result;
}

@end