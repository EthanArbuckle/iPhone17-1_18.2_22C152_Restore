@interface PoofAnimationView
- (_TtC10StickersUI17PoofAnimationView)initWithCoder:(id)a3;
- (_TtC10StickersUI17PoofAnimationView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PoofAnimationView

- (_TtC10StickersUI17PoofAnimationView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickersUI17PoofAnimationView_puffs) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickersUI17PoofAnimationView_count) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickersUI17PoofAnimationView_completionHandler);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC10StickersUI17PoofAnimationView *)sub_25E4A2EA0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_25E497CAC();
}

- (_TtC10StickersUI17PoofAnimationView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC10StickersUI17PoofAnimationView_completionHandler);

  sub_25E4426B0(v3);
}

@end