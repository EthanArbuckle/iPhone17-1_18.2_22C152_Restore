@interface StartWorkoutIntentHandler
- (_TtC12SeymourMedia25StartWorkoutIntentHandler)init;
- (void)handleStartWorkout:(id)a3 completion:(id)a4;
@end

@implementation StartWorkoutIntentHandler

- (_TtC12SeymourMedia25StartWorkoutIntentHandler)init
{
  result = (_TtC12SeymourMedia25StartWorkoutIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)handleStartWorkout:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_22625B7BC(v8, (uint64_t)sub_226208CE4, v7);

  swift_release();
}

@end