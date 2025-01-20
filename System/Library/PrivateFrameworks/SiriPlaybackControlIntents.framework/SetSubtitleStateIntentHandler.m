@interface SetSubtitleStateIntentHandler
- (_TtC26SiriPlaybackControlIntents29SetSubtitleStateIntentHandler)init;
- (void)confirmSetSubtitleState:(id)a3 completion:(id)a4;
- (void)handleSetSubtitleState:(id)a3 completion:(id)a4;
- (void)resolveDeviceForSetSubtitleState:(id)a3 withCompletion:(id)a4;
- (void)resolveLanguageForSetSubtitleState:(id)a3 withCompletion:(id)a4;
@end

@implementation SetSubtitleStateIntentHandler

- (_TtC26SiriPlaybackControlIntents29SetSubtitleStateIntentHandler)init
{
  return (_TtC26SiriPlaybackControlIntents29SetSubtitleStateIntentHandler *)SetSubtitleStateIntentHandler.init()();
}

- (void)handleSetSubtitleState:(id)a3 completion:(id)a4
{
}

- (void)resolveDeviceForSetSubtitleState:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveLanguageForSetSubtitleState:(id)a3 withCompletion:(id)a4
{
}

- (void)confirmSetSubtitleState:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents29SetSubtitleStateIntentHandler_playbackController);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents29SetSubtitleStateIntentHandler_analyticsService);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents29SetSubtitleStateIntentHandler_deviceState;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end