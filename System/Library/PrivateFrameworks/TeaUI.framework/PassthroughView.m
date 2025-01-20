@interface PassthroughView
- (_TtC5TeaUI15PassthroughView)initWithCoder:(id)a3;
- (_TtC5TeaUI15PassthroughView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PassthroughView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_1B5FB1624((uint64_t)a4, x, y);

  return v10;
}

- (_TtC5TeaUI15PassthroughView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI15PassthroughView *)PassthroughView.init(frame:)();
}

- (_TtC5TeaUI15PassthroughView)initWithCoder:(id)a3
{
  return (_TtC5TeaUI15PassthroughView *)PassthroughView.init(coder:)(a3);
}

@end