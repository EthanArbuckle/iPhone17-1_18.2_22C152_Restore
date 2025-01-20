@interface AnimatedStrokeView
- (_TtC16ScreenSharingKit18AnimatedStrokeView)initWithCoder:(id)a3;
- (_TtC16ScreenSharingKit18AnimatedStrokeView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AnimatedStrokeView

- (_TtC16ScreenSharingKit18AnimatedStrokeView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16ScreenSharingKit18AnimatedStrokeView_strokeLayer) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC16ScreenSharingKit18AnimatedStrokeView_didAnimate) = 0;
  id v4 = a3;

  result = (_TtC16ScreenSharingKit18AnimatedStrokeView *)sub_25BC08EF8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_25BAD49A0();
}

- (_TtC16ScreenSharingKit18AnimatedStrokeView)initWithFrame:(CGRect)a3
{
  result = (_TtC16ScreenSharingKit18AnimatedStrokeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit18AnimatedStrokeView_strokeLayer));
}

@end