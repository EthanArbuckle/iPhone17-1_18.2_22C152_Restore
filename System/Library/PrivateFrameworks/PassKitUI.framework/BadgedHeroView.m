@interface BadgedHeroView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC9PassKitUI14BadgedHeroView)initWithCoder:(id)a3;
- (_TtC9PassKitUI14BadgedHeroView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BadgedHeroView

- (_TtC9PassKitUI14BadgedHeroView)initWithCoder:(id)a3
{
  result = (_TtC9PassKitUI14BadgedHeroView *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_19FC9EC90();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9PassKitUI14BadgedHeroView_heroView), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC9PassKitUI14BadgedHeroView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC9PassKitUI14BadgedHeroView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9PassKitUI14BadgedHeroView_badgeView);
}

@end