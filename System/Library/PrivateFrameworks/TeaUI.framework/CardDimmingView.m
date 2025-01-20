@interface CardDimmingView
- (_TtC5TeaUI15CardDimmingView)initWithCoder:(id)a3;
- (_TtC5TeaUI15CardDimmingView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation CardDimmingView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_1B616EF28((uint64_t)a4, x, y);

  return v10;
}

- (_TtC5TeaUI15CardDimmingView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI15CardDimmingView *)sub_1B616F028(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5TeaUI15CardDimmingView)initWithCoder:(id)a3
{
  return (_TtC5TeaUI15CardDimmingView *)sub_1B616F0C0(a3);
}

@end