@interface CreateWatchlistView
- (_TtC8StocksUI19CreateWatchlistView)initWithCoder:(id)a3;
- (_TtC8StocksUI19CreateWatchlistView)initWithFrame:(CGRect)a3;
@end

@implementation CreateWatchlistView

- (_TtC8StocksUI19CreateWatchlistView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI19CreateWatchlistView *)sub_20A5D8D18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI19CreateWatchlistView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8StocksUI19CreateWatchlistView_onTap;
  sub_20A45A1DC();
  id v7 = objc_allocWithZone(v6);
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v7, sel_init);
  uint64_t v9 = OBJC_IVAR____TtC8StocksUI19CreateWatchlistView_newWatchlistButton;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(self, sel_buttonWithType_, 1);

  result = (_TtC8StocksUI19CreateWatchlistView *)sub_20A8CF520();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8StocksUI19CreateWatchlistView_newWatchlistButton);
}

@end