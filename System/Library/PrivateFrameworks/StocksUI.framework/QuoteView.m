@interface QuoteView
- (_TtC8StocksUI9QuoteView)initWithCoder:(id)a3;
- (_TtC8StocksUI9QuoteView)initWithFrame:(CGRect)a3;
@end

@implementation QuoteView

- (_TtC8StocksUI9QuoteView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI9QuoteView *)sub_20A63BFB4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI9QuoteView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A63C1FC();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI9QuoteView_timeRangeLabel);
}

@end