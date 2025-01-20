@interface StockChartRangeCalloutView
- (_TtC8StocksUI26StockChartRangeCalloutView)initWithCoder:(id)a3;
- (_TtC8StocksUI26StockChartRangeCalloutView)initWithFrame:(CGRect)a3;
@end

@implementation StockChartRangeCalloutView

- (_TtC8StocksUI26StockChartRangeCalloutView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s8StocksUI26StockChartRangeCalloutViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (_TtC8StocksUI26StockChartRangeCalloutView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI26StockChartRangeCalloutView *)StockChartRangeCalloutView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI26StockChartRangeCalloutView_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI26StockChartRangeCalloutView_priceChangeLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8StocksUI26StockChartRangeCalloutView_percentageChangeLabel);
}

@end