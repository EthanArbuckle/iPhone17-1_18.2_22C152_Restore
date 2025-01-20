@interface TodayView
- (NSString)accessibilityLabel;
- (_TtC8StocksUI9TodayView)initWithCoder:(id)a3;
- (_TtC8StocksUI9TodayView)initWithFrame:(CGRect)a3;
@end

@implementation TodayView

- (_TtC8StocksUI9TodayView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI9TodayView *)sub_20A434F50(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI9TodayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A4357E0();
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_20A43528C();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_20A8CE240();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (void).cxx_destruct
{
  swift_release();
}

@end