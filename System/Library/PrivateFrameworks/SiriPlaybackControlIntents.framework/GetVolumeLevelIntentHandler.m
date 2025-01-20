@interface GetVolumeLevelIntentHandler
- (_TtC26SiriPlaybackControlIntents27GetVolumeLevelIntentHandler)init;
- (void)confirmGetVolumeLevel:(id)a3 completion:(id)a4;
- (void)handleGetVolumeLevel:(id)a3 completion:(id)a4;
- (void)resolveDeviceForGetVolumeLevel:(id)a3 withCompletion:(id)a4;
@end

@implementation GetVolumeLevelIntentHandler

- (_TtC26SiriPlaybackControlIntents27GetVolumeLevelIntentHandler)init
{
  GetVolumeLevelIntentHandler.init()();
  return result;
}

- (void)handleGetVolumeLevel:(id)a3 completion:(id)a4
{
}

- (void)resolveDeviceForGetVolumeLevel:(id)a3 withCompletion:(id)a4
{
}

- (void)confirmGetVolumeLevel:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents27GetVolumeLevelIntentHandler_accessoryVolumeController);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents27GetVolumeLevelIntentHandler_playbackController);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents27GetVolumeLevelIntentHandler_deviceState);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents27GetVolumeLevelIntentHandler_featureFlagProvider;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end