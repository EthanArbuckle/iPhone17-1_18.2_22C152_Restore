@interface TickerView
- (BOOL)ts_accessibilityIsSpeakThisElement;
- (_TtC8StocksUI10TickerView)initWithCoder:(id)a3;
- (_TtC8StocksUI10TickerView)initWithFrame:(CGRect)a3;
@end

@implementation TickerView

- (_TtC8StocksUI10TickerView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI10TickerView *)sub_20A86B6A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI10TickerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A86BB30();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI10TickerView_sparklineView);
}

- (BOOL)ts_accessibilityIsSpeakThisElement
{
  return 0;
}

@end