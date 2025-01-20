@interface StockTitleView
- (_TtC8StocksUI14StockTitleView)initWithCoder:(id)a3;
- (_TtC8StocksUI14StockTitleView)initWithFrame:(CGRect)a3;
@end

@implementation StockTitleView

- (_TtC8StocksUI14StockTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI14StockTitleView *)sub_20A7D1C5C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI14StockTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A7D1FC8();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI14StockTitleView_quoteSummaryView);
}

@end