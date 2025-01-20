@interface PauseWorkoutIntentHandler
- (_TtC12SeymourMedia25PauseWorkoutIntentHandler)init;
- (void)handlePauseWorkout:(id)a3 completion:(id)a4;
@end

@implementation PauseWorkoutIntentHandler

- (_TtC12SeymourMedia25PauseWorkoutIntentHandler)init
{
  result = (_TtC12SeymourMedia25PauseWorkoutIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)handlePauseWorkout:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_2262296BC((uint64_t)sub_226208CE4, v7);

  swift_release();
}

@end