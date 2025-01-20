@interface StockFeedPriceView
- (_TtC8StocksUI18StockFeedPriceView)initWithCoder:(id)a3;
- (_TtC8StocksUI18StockFeedPriceView)initWithFrame:(CGRect)a3;
@end

@implementation StockFeedPriceView

- (_TtC8StocksUI18StockFeedPriceView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI18StockFeedPriceView *)sub_20A566130(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI18StockFeedPriceView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8StocksUI18StockFeedPriceView_quoteSummaryView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for QuoteSummaryView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC8StocksUI18StockFeedPriceView_exchangeLabel;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8StocksUI18StockFeedPriceView *)sub_20A8CF520();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI18StockFeedPriceView_quoteSummaryView));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI18StockFeedPriceView_exchangeLabel);
}

@end