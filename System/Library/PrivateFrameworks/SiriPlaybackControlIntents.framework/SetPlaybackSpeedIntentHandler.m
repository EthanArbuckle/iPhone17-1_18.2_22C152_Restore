@interface SetPlaybackSpeedIntentHandler
- (_TtC26SiriPlaybackControlIntents29SetPlaybackSpeedIntentHandler)init;
- (void)confirmSetPlaybackSpeed:(id)a3 completion:(id)a4;
- (void)handleSetPlaybackSpeed:(id)a3 completion:(id)a4;
- (void)resolveDevicesForSetPlaybackSpeed:(id)a3 withCompletion:(id)a4;
- (void)resolvePlaybackSpeedTypeForSetPlaybackSpeed:(id)a3 withCompletion:(id)a4;
- (void)resolveSpeedMagnitudeForSetPlaybackSpeed:(id)a3 withCompletion:(id)a4;
@end

@implementation SetPlaybackSpeedIntentHandler

- (_TtC26SiriPlaybackControlIntents29SetPlaybackSpeedIntentHandler)init
{
  return (_TtC26SiriPlaybackControlIntents29SetPlaybackSpeedIntentHandler *)SetPlaybackSpeedIntentHandler.init()();
}

- (void)handleSetPlaybackSpeed:(id)a3 completion:(id)a4
{
}

- (void)confirmSetPlaybackSpeed:(id)a3 completion:(id)a4
{
}

- (void)resolveSpeedMagnitudeForSetPlaybackSpeed:(id)a3 withCompletion:(id)a4
{
}

- (void)resolvePlaybackSpeedTypeForSetPlaybackSpeed:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveDevicesForSetPlaybackSpeed:(id)a3 withCompletion:(id)a4
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents29SetPlaybackSpeedIntentHandler_playbackController);
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents29SetPlaybackSpeedIntentHandler_deviceState;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end