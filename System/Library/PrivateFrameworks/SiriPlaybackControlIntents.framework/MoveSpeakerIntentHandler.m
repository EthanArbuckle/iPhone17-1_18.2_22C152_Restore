@interface MoveSpeakerIntentHandler
- (_TtC26SiriPlaybackControlIntents24MoveSpeakerIntentHandler)init;
- (void)confirmMoveSpeaker:(id)a3 completion:(id)a4;
- (void)handleMoveSpeaker:(id)a3 completion:(id)a4;
- (void)resolveDestinationsForMoveSpeaker:(id)a3 withCompletion:(id)a4;
- (void)resolveSourceForMoveSpeaker:(id)a3 withCompletion:(id)a4;
@end

@implementation MoveSpeakerIntentHandler

- (_TtC26SiriPlaybackControlIntents24MoveSpeakerIntentHandler)init
{
  return (_TtC26SiriPlaybackControlIntents24MoveSpeakerIntentHandler *)MoveSpeakerIntentHandler.init()();
}

- (void)handleMoveSpeaker:(id)a3 completion:(id)a4
{
}

- (void)resolveSourceForMoveSpeaker:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveDestinationsForMoveSpeaker:(id)a3 withCompletion:(id)a4
{
}

- (void)confirmMoveSpeaker:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_2329E74C8((uint64_t)v7, (uint64_t)v8, (void (**)(void, void))v6);
  _Block_release(v6);
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents24MoveSpeakerIntentHandler_playbackController);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents24MoveSpeakerIntentHandler_deviceState);
  swift_release();
}

@end