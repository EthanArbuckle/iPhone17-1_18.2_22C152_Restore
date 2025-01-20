@interface EmptyListView
- (_TtC8StocksUI13EmptyListView)initWithCoder:(id)a3;
- (_TtC8StocksUI13EmptyListView)initWithFrame:(CGRect)a3;
@end

@implementation EmptyListView

- (_TtC8StocksUI13EmptyListView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI13EmptyListView *)sub_20A572840(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI13EmptyListView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A572CD4();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI13EmptyListView_button);
}

@end