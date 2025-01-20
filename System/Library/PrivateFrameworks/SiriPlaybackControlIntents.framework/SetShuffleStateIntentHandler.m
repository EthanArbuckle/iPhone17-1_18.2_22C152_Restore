@interface SetShuffleStateIntentHandler
- (_TtC26SiriPlaybackControlIntents28SetShuffleStateIntentHandler)init;
- (void)confirmSetShuffleState:(id)a3 completion:(id)a4;
- (void)handleSetShuffleState:(id)a3 completion:(id)a4;
- (void)resolveDevicesForSetShuffleState:(id)a3 withCompletion:(id)a4;
@end

@implementation SetShuffleStateIntentHandler

- (_TtC26SiriPlaybackControlIntents28SetShuffleStateIntentHandler)init
{
  return (_TtC26SiriPlaybackControlIntents28SetShuffleStateIntentHandler *)SetShuffleStateIntentHandler.init()();
}

- (void)handleSetShuffleState:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_232947B48((uint64_t)v8, (uint64_t)sub_2328202AC, v7);

  swift_release();
}

- (void)resolveDevicesForSetShuffleState:(id)a3 withCompletion:(id)a4
{
}

- (void)confirmSetShuffleState:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents28SetShuffleStateIntentHandler_playbackController);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents28SetShuffleStateIntentHandler_analyticsService);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents28SetShuffleStateIntentHandler_deviceState;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end