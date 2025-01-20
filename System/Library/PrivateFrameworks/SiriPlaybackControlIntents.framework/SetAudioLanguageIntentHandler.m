@interface SetAudioLanguageIntentHandler
- (_TtC26SiriPlaybackControlIntents29SetAudioLanguageIntentHandler)init;
- (void)confirmSetAudioLanguage:(id)a3 completion:(id)a4;
- (void)handleSetAudioLanguage:(id)a3 completion:(id)a4;
- (void)resolveDeviceForSetAudioLanguage:(id)a3 withCompletion:(id)a4;
- (void)resolveLanguageForSetAudioLanguage:(id)a3 withCompletion:(id)a4;
@end

@implementation SetAudioLanguageIntentHandler

- (_TtC26SiriPlaybackControlIntents29SetAudioLanguageIntentHandler)init
{
  return (_TtC26SiriPlaybackControlIntents29SetAudioLanguageIntentHandler *)SetAudioLanguageIntentHandler.init()();
}

- (void)handleSetAudioLanguage:(id)a3 completion:(id)a4
{
}

- (void)resolveDeviceForSetAudioLanguage:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveLanguageForSetAudioLanguage:(id)a3 withCompletion:(id)a4
{
}

- (void)confirmSetAudioLanguage:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents29SetAudioLanguageIntentHandler_playbackController);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents29SetAudioLanguageIntentHandler_analyticsService);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents29SetAudioLanguageIntentHandler_deviceState;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end