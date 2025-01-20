@interface EndWorkoutIntentHandler
- (_TtC12SeymourMedia23EndWorkoutIntentHandler)init;
- (void)handleEndWorkout:(id)a3 completion:(id)a4;
@end

@implementation EndWorkoutIntentHandler

- (_TtC12SeymourMedia23EndWorkoutIntentHandler)init
{
  result = (_TtC12SeymourMedia23EndWorkoutIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)handleEndWorkout:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_226208CF8((uint64_t)sub_226208CE4, v7);

  swift_release();
}

@end