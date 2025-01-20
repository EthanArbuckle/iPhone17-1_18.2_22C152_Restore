@interface GymKitConnectedView
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI19GymKitConnectedView)initWithCoder:(id)a3;
- (_TtC9SeymourUI19GymKitConnectedView)initWithFrame:(CGRect)a3;
@end

@implementation GymKitConnectedView

- (_TtC9SeymourUI19GymKitConnectedView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI19GymKitConnectedView *)sub_23A32682C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI19GymKitConnectedView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A326C6C();
}

- (CGSize)intrinsicContentSize
{
  double v2 = 78.0;
  double v3 = 49.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
}

@end