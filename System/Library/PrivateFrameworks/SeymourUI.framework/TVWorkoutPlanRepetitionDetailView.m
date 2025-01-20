@interface TVWorkoutPlanRepetitionDetailView
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI33TVWorkoutPlanRepetitionDetailView)initWithCoder:(id)a3;
- (_TtC9SeymourUI33TVWorkoutPlanRepetitionDetailView)initWithFrame:(CGRect)a3;
@end

@implementation TVWorkoutPlanRepetitionDetailView

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F83818];
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanRepetitionDetailView_stackView), sel_intrinsicContentSize);
  double v4 = v2;
  result.height = v3;
  result.width = v4;
  return result;
}

- (_TtC9SeymourUI33TVWorkoutPlanRepetitionDetailView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanRepetitionDetailView_stackView;
  id v6 = objc_allocWithZone(MEMORY[0x263F82BF8]);
  id v7 = a3;
  id v8 = objc_msgSend(v6, sel_init);
  objc_msgSend(v8, sel_setAxis_, 1);
  objc_msgSend(v8, sel_setSpacing_, 24.0);
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v8;

  CGSize result = (_TtC9SeymourUI33TVWorkoutPlanRepetitionDetailView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI33TVWorkoutPlanRepetitionDetailView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC9SeymourUI33TVWorkoutPlanRepetitionDetailView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanRepetitionDetailView_stackView));
}

@end