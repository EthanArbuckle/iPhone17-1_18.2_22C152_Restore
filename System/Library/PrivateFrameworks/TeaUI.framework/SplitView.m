@interface SplitView
- (_TtC5TeaUI9SplitView)initWithCoder:(id)a3;
- (_TtC5TeaUI9SplitView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation SplitView

- (_TtC5TeaUI9SplitView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI9SplitView *)SplitView.init(frame:)();
}

- (_TtC5TeaUI9SplitView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B60AE330();
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  SplitView.draw(_:)(v9);
}

- (void).cxx_destruct
{
  sub_1B60ADC88((uint64_t)self + OBJC_IVAR____TtC5TeaUI9SplitView_model, (uint64_t)v2);
  sub_1B60ADEB4((uint64_t)v2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char))sub_1B603EE80);
}

@end