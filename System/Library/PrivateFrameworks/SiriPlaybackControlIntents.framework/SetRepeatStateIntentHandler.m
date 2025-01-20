@interface SetRepeatStateIntentHandler
- (_TtC26SiriPlaybackControlIntents27SetRepeatStateIntentHandler)init;
- (void)confirmSetRepeatState:(id)a3 completion:(id)a4;
- (void)handleSetRepeatState:(id)a3 completion:(id)a4;
- (void)resolveDevicesForSetRepeatState:(id)a3 withCompletion:(id)a4;
@end

@implementation SetRepeatStateIntentHandler

- (_TtC26SiriPlaybackControlIntents27SetRepeatStateIntentHandler)init
{
  return (_TtC26SiriPlaybackControlIntents27SetRepeatStateIntentHandler *)SetRepeatStateIntentHandler.init()();
}

- (void)handleSetRepeatState:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_2328D48C8((uint64_t)v8, (uint64_t)sub_2328202AC, v7);

  swift_release();
}

- (void)resolveDevicesForSetRepeatState:(id)a3 withCompletion:(id)a4
{
}

- (void)confirmSetRepeatState:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents27SetRepeatStateIntentHandler_playbackController);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents27SetRepeatStateIntentHandler_analyticsService);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents27SetRepeatStateIntentHandler_deviceState;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end