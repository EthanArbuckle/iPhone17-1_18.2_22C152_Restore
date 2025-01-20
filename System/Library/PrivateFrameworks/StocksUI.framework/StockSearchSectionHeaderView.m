@interface StockSearchSectionHeaderView
- (BOOL)canBecomeFirstResponder;
- (_TtC8StocksUI28StockSearchSectionHeaderView)initWithCoder:(id)a3;
- (_TtC8StocksUI28StockSearchSectionHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation StockSearchSectionHeaderView

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (_TtC8StocksUI28StockSearchSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI28StockSearchSectionHeaderView *)sub_20A4BB55C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI28StockSearchSectionHeaderView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8StocksUI28StockSearchSectionHeaderView_watchlistSwitcherButton;
  id v6 = objc_allocWithZone((Class)sub_20A8C81C0());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC8StocksUI28StockSearchSectionHeaderView_onWatchlistSwitcherMenuPresentation;
  sub_20A45A1DC();
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(v9), sel_init);

  result = (_TtC8StocksUI28StockSearchSectionHeaderView *)sub_20A8CF520();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI28StockSearchSectionHeaderView_watchlistSwitcherButton));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8StocksUI28StockSearchSectionHeaderView_onWatchlistSwitcherMenuPresentation);
}

@end