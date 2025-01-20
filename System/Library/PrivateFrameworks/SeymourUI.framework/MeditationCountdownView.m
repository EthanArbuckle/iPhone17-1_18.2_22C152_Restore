@interface MeditationCountdownView
- (_TtC9SeymourUI23MeditationCountdownView)initWithCoder:(id)a3;
- (_TtC9SeymourUI23MeditationCountdownView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MeditationCountdownView

- (_TtC9SeymourUI23MeditationCountdownView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI23MeditationCountdownView_onCountdownStep);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI23MeditationCountdownView_onCountdownWindUp);
  void *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI23MeditationCountdownView_onCountdownFadeOut);
  void *v6 = 0;
  v6[1] = 0;
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI23MeditationCountdownView_onCountdownCompleted);
  void *v7 = 0;
  v7[1] = 0;
  id v8 = a3;

  result = (_TtC9SeymourUI23MeditationCountdownView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for MeditationCountdownView();
  [(MeditationCountdownView *)&v2 layoutSubviews];
}

- (_TtC9SeymourUI23MeditationCountdownView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI23MeditationCountdownView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI23MeditationCountdownView_onCountdownStep));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI23MeditationCountdownView_onCountdownWindUp));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI23MeditationCountdownView_onCountdownFadeOut));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI23MeditationCountdownView_onCountdownCompleted));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23MeditationCountdownView_countdownRingView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI23MeditationCountdownView_centerAnimationView);
}

@end