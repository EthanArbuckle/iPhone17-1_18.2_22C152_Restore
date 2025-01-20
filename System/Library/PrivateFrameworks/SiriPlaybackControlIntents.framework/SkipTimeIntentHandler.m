@interface SkipTimeIntentHandler
- (_TtC26SiriPlaybackControlIntents21SkipTimeIntentHandler)init;
- (void)confirmSkipTime:(id)a3 completion:(id)a4;
- (void)handleSkipTime:(id)a3 completion:(id)a4;
- (void)resolveDevicesForSkipTime:(id)a3 withCompletion:(id)a4;
- (void)resolveDurationForSkipTime:(id)a3 withCompletion:(id)a4;
@end

@implementation SkipTimeIntentHandler

- (_TtC26SiriPlaybackControlIntents21SkipTimeIntentHandler)init
{
  return (_TtC26SiriPlaybackControlIntents21SkipTimeIntentHandler *)SkipTimeIntentHandler.init()();
}

- (void)handleSkipTime:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_2328F18BC((uint64_t)v8, (uint64_t)sub_2328202AC, v7);

  swift_release();
}

- (void)resolveDurationForSkipTime:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveDevicesForSkipTime:(id)a3 withCompletion:(id)a4
{
}

- (void)confirmSkipTime:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents21SkipTimeIntentHandler_playbackController);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents21SkipTimeIntentHandler_analyticsService);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents21SkipTimeIntentHandler_deviceState;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end