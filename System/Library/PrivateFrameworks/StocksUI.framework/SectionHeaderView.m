@interface SectionHeaderView
- (_TtC8StocksUI17SectionHeaderView)initWithCoder:(id)a3;
- (_TtC8StocksUI17SectionHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation SectionHeaderView

- (_TtC8StocksUI17SectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI17SectionHeaderView *)sub_20A43A194(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI17SectionHeaderView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8StocksUI17SectionHeaderView_backgroundView;
  id v6 = objc_allocWithZone(MEMORY[0x263F82E00]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC8StocksUI17SectionHeaderView_titleLabel;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8StocksUI17SectionHeaderView *)sub_20A8CF520();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI17SectionHeaderView_titleLabel);
}

@end