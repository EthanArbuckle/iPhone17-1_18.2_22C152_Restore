@interface BadgeView
- (_TtC16MusicApplication9BadgeView)initWithCoder:(id)a3;
- (_TtC16MusicApplication9BadgeView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BadgeView

- (_TtC16MusicApplication9BadgeView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MusicApplication9BadgeView_badgeSet) = (Class)&_swiftEmptySetSingleton;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MusicApplication9BadgeView_textStyle) = (Class)UIFontTextStyleBody;
  id v4 = a3;
  v5 = UIFontTextStyleBody;

  result = (_TtC16MusicApplication9BadgeView *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_51E47C((uint64_t)a3);
}

- (_TtC16MusicApplication9BadgeView)initWithFrame:(CGRect)a3
{
  result = (_TtC16MusicApplication9BadgeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MusicApplication9BadgeView_textStyle);
}

@end