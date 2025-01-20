@interface AvatarShowcaseView
- (_TtC8AppStore18AvatarShowcaseView)initWithCoder:(id)a3;
- (_TtC8AppStore18AvatarShowcaseView)initWithFrame:(CGRect)a3;
@end

@implementation AvatarShowcaseView

- (_TtC8AppStore18AvatarShowcaseView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore18AvatarShowcaseView_artworkLoader) = 0;
  id v4 = a3;

  result = (_TtC8AppStore18AvatarShowcaseView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC8AppStore18AvatarShowcaseView)initWithFrame:(CGRect)a3
{
  result = (_TtC8AppStore18AvatarShowcaseView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8AppStore18AvatarShowcaseView_layoutConfiguration;
  uint64_t v3 = type metadata accessor for AvatarShowcaseLayoutConfiguration();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_release();
}

@end