@interface QuoteSummaryView
- (_TtC8StocksUI16QuoteSummaryView)initWithCoder:(id)a3;
- (_TtC8StocksUI16QuoteSummaryView)initWithFrame:(CGRect)a3;
@end

@implementation QuoteSummaryView

- (_TtC8StocksUI16QuoteSummaryView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI16QuoteSummaryView *)sub_20A807D28(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI16QuoteSummaryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A807F78();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI16QuoteSummaryView_separatorBarView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI16QuoteSummaryView_offHoursQuoteView);
}

@end