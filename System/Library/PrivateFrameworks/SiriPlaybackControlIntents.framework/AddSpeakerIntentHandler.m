@interface AddSpeakerIntentHandler
- (_TtC26SiriPlaybackControlIntents23AddSpeakerIntentHandler)init;
- (void)confirmAddSpeaker:(id)a3 completion:(id)a4;
- (void)handleAddSpeaker:(id)a3 completion:(id)a4;
- (void)resolveDestinationsForAddSpeaker:(id)a3 withCompletion:(id)a4;
- (void)resolveSourceForAddSpeaker:(id)a3 withCompletion:(id)a4;
@end

@implementation AddSpeakerIntentHandler

- (_TtC26SiriPlaybackControlIntents23AddSpeakerIntentHandler)init
{
  return (_TtC26SiriPlaybackControlIntents23AddSpeakerIntentHandler *)AddSpeakerIntentHandler.init()();
}

- (void)handleAddSpeaker:(id)a3 completion:(id)a4
{
}

- (void)resolveSourceForAddSpeaker:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveDestinationsForAddSpeaker:(id)a3 withCompletion:(id)a4
{
}

- (void)confirmAddSpeaker:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_2328FA444((uint64_t)v7, (uint64_t)v8, (void (**)(void, void))v6);
  _Block_release(v6);
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents23AddSpeakerIntentHandler_playbackController);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents23AddSpeakerIntentHandler_deviceState);
  swift_release();
}

@end