@interface SeekTimeIntentHandler
- (_TtC26SiriPlaybackControlIntents21SeekTimeIntentHandler)init;
- (void)confirmSeekTime:(id)a3 completion:(id)a4;
- (void)handleSeekTime:(id)a3 completion:(id)a4;
- (void)resolveDevicesForSeekTime:(id)a3 withCompletion:(id)a4;
- (void)resolvePlayheadPositionForSeekTime:(id)a3 withCompletion:(id)a4;
@end

@implementation SeekTimeIntentHandler

- (_TtC26SiriPlaybackControlIntents21SeekTimeIntentHandler)init
{
  return (_TtC26SiriPlaybackControlIntents21SeekTimeIntentHandler *)SeekTimeIntentHandler.init()();
}

- (void)handleSeekTime:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_232A44A60((uint64_t)v8, (uint64_t)sub_2328202AC, v7);

  swift_release();
}

- (void)resolveDevicesForSeekTime:(id)a3 withCompletion:(id)a4
{
}

- (void)resolvePlayheadPositionForSeekTime:(id)a3 withCompletion:(id)a4
{
}

- (void)confirmSeekTime:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents21SeekTimeIntentHandler_playbackController);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents21SeekTimeIntentHandler_analyticsService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents21SeekTimeIntentHandler_deviceState);
  swift_release();
}

@end