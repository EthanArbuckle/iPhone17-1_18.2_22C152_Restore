@interface FMBadge
- (CGSize)intrinsicContentSize;
- (_TtC6FindMy7FMBadge)initWithCoder:(id)a3;
- (_TtC6FindMy7FMBadge)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation FMBadge

- (_TtC6FindMy7FMBadge)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy7FMBadge_color) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy7FMBadge_strokeColor) = 0;
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC6FindMy7FMBadge_insets);
  _OWORD *v4 = xmmword_100560BC0;
  v4[1] = xmmword_100560BC0;
  id v5 = a3;

  result = (_TtC6FindMy7FMBadge *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  v3 = self;
  sub_1002296F8();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_1002295A4();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC6FindMy7FMBadge)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC6FindMy7FMBadge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy7FMBadge_strokeColor);
}

@end