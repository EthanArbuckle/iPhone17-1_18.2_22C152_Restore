@interface StockListSectionHeaderView
- (BOOL)canBecomeFirstResponder;
- (_TtC8StocksUI26StockListSectionHeaderView)initWithCoder:(id)a3;
- (_TtC8StocksUI26StockListSectionHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation StockListSectionHeaderView

- (_TtC8StocksUI26StockListSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI26StockListSectionHeaderView *)sub_20A4D83F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI26StockListSectionHeaderView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8StocksUI26StockListSectionHeaderView_switcherButton;
  id v6 = objc_allocWithZone((Class)sub_20A8C81C0());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC8StocksUI26StockListSectionHeaderView_onWatchlistSwitcherMenuPresentation;
  sub_20A45A1DC();
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(v9), sel_init);

  result = (_TtC8StocksUI26StockListSectionHeaderView *)sub_20A8CF520();
  __break(1u);
  return result;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI26StockListSectionHeaderView_switcherButton));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8StocksUI26StockListSectionHeaderView_onWatchlistSwitcherMenuPresentation);
}

@end