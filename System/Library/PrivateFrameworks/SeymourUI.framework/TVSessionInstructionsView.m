@interface TVSessionInstructionsView
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI25TVSessionInstructionsView)initWithCoder:(id)a3;
- (_TtC9SeymourUI25TVSessionInstructionsView)initWithFrame:(CGRect)a3;
- (void)startButtonTapped;
@end

@implementation TVSessionInstructionsView

- (_TtC9SeymourUI25TVSessionInstructionsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A0FA2E0();
}

- (void)startButtonTapped
{
  v2 = self;
  sub_23A0F944C();
}

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI25TVSessionInstructionsView_startWorkoutView);
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  v5 = *(void **)(v4 + OBJC_IVAR____TtC9SeymourUI16StartWorkoutView_playButton);
  *(void *)(v3 + 32) = v5;
  sub_23A7FFC98();
  id v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v7 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v7;
}

- (_TtC9SeymourUI25TVSessionInstructionsView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI25TVSessionInstructionsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25TVSessionInstructionsView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25TVSessionInstructionsView_workoutTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25TVSessionInstructionsView_workoutDetailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25TVSessionInstructionsView_gymKitLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25TVSessionInstructionsView_gymKitConnectingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25TVSessionInstructionsView_gymKitConnectedView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25TVSessionInstructionsView_startWorkoutView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI25TVSessionInstructionsView_stackView);
}

@end