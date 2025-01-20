@interface StockSparklineView
- (_TtC8StocksUI18StockSparklineView)initWithCoder:(id)a3;
- (_TtC8StocksUI18StockSparklineView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation StockSparklineView

- (_TtC8StocksUI18StockSparklineView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A52B5F0();
}

- (_TtC8StocksUI18StockSparklineView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI18StockSparklineView *)sub_20A52B2D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for StockSparklineView();
  v2 = (char *)v4.receiver;
  [(StockSparklineView *)&v4 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC8StocksUI18StockSparklineView_sparklineView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI18StockSparklineView_baselineIndicatorLayer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8StocksUI18StockSparklineView_nonAnimatingDelegate);
}

@end