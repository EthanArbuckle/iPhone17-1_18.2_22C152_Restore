@interface FMBlurredView
- (_TtC6FindMy13FMBlurredView)initWithCoder:(id)a3;
- (_TtC6FindMy13FMBlurredView)initWithFrame:(CGRect)a3;
@end

@implementation FMBlurredView

- (_TtC6FindMy13FMBlurredView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy13FMBlurredView_blurredBackground;
  id v6 = objc_allocWithZone((Class)UIVisualEffectView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC6FindMy13FMBlurredView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC6FindMy13FMBlurredView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy13FMBlurredView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end