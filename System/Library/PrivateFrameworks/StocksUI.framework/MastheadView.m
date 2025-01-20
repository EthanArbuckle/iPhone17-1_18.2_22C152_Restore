@interface MastheadView
- (_TtC8StocksUI12MastheadView)initWithCoder:(id)a3;
- (_TtC8StocksUI12MastheadView)initWithFrame:(CGRect)a3;
@end

@implementation MastheadView

- (_TtC8StocksUI12MastheadView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI12MastheadView *)sub_20A73B628(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI12MastheadView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8StocksUI12MastheadView_appNameLabel;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC8StocksUI12MastheadView_dateLabel;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8StocksUI12MastheadView *)sub_20A8CF520();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8StocksUI12MastheadView_dateLabel);
}

@end