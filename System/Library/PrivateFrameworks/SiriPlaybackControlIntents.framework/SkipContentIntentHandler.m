@interface SkipContentIntentHandler
- (_TtC26SiriPlaybackControlIntents24SkipContentIntentHandler)init;
- (void)confirmSkipContent:(id)a3 completion:(id)a4;
- (void)handleSkipContent:(id)a3 completion:(id)a4;
- (void)resolveDevicesForSkipContent:(id)a3 withCompletion:(id)a4;
@end

@implementation SkipContentIntentHandler

- (_TtC26SiriPlaybackControlIntents24SkipContentIntentHandler)init
{
  return (_TtC26SiriPlaybackControlIntents24SkipContentIntentHandler *)SkipContentIntentHandler.init()();
}

- (void)handleSkipContent:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_2328C5C34((uint64_t)v8, (uint64_t)sub_2328202AC, v7);

  swift_release();
}

- (void)resolveDevicesForSkipContent:(id)a3 withCompletion:(id)a4
{
}

- (void)confirmSkipContent:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents24SkipContentIntentHandler_playbackController);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents24SkipContentIntentHandler_analyticsService);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents24SkipContentIntentHandler_deviceState);
  v3 = (char *)self
     + OBJC_IVAR____TtC26SiriPlaybackControlIntents24SkipContentIntentHandler_aceBlockClearAudioQueueForSkip;
  sub_232A683B8();
  OUTLINED_FUNCTION_20();
  v6 = *(void (**)(char *, uint64_t))(v5 + 8);
  v6(v3, v4);
}

@end