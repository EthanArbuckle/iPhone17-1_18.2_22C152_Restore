@interface TransportContainer
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation TransportContainer

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_1003D8AD0((uint64_t)a4, x, y);

  return v10;
}

@end