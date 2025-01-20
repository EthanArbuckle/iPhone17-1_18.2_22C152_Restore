@interface PauseMediaIntentHandler
- (_TtC26SiriPlaybackControlIntents23PauseMediaIntentHandler)init;
- (void)confirmPauseMedia:(id)a3 completion:(id)a4;
- (void)handlePauseMedia:(id)a3 completion:(id)a4;
- (void)resolveDevicesForPauseMedia:(id)a3 withCompletion:(id)a4;
@end

@implementation PauseMediaIntentHandler

- (void)resolveDevicesForPauseMedia:(id)a3 withCompletion:(id)a4
{
}

- (void)confirmPauseMedia:(id)a3 completion:(id)a4
{
}

- (void)handlePauseMedia:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_23281BC24((uint64_t)v8, (uint64_t)sub_2328202AC, v7);

  swift_release();
}

- (_TtC26SiriPlaybackControlIntents23PauseMediaIntentHandler)init
{
  return (_TtC26SiriPlaybackControlIntents23PauseMediaIntentHandler *)PauseMediaIntentHandler.init()();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents23PauseMediaIntentHandler_playbackController);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents23PauseMediaIntentHandler_analyticsService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents23PauseMediaIntentHandler_deviceState);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents23PauseMediaIntentHandler_aceService;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end