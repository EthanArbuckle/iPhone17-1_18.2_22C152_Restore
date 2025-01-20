@interface WatchlistCellView
- (_TtC8StocksUI17WatchlistCellView)initWithCoder:(id)a3;
- (_TtC8StocksUI17WatchlistCellView)initWithFrame:(CGRect)a3;
@end

@implementation WatchlistCellView

- (_TtC8StocksUI17WatchlistCellView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI17WatchlistCellView *)sub_20A459080(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI17WatchlistCellView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A459CFC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI17WatchlistCellView_selectionButton));

  sub_20A459CA4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8StocksUI17WatchlistCellView_onEditing));
  sub_20A459CA4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8StocksUI17WatchlistCellView_onSelection));
  id v3 = (char *)self + OBJC_IVAR____TtC8StocksUI17WatchlistCellView_indexPath;

  sub_20A45A238((uint64_t)v3);
}

@end