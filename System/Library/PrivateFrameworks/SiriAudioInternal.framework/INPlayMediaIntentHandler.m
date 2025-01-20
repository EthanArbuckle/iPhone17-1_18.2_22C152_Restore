@interface INPlayMediaIntentHandler
- (_TtC17SiriAudioInternal24INPlayMediaIntentHandler)init;
- (void)handlePlayMedia:(id)a3 completion:(id)a4;
- (void)resolveMediaItemsForPlayMedia:(id)a3 withCompletion:(id)a4;
@end

@implementation INPlayMediaIntentHandler

- (_TtC17SiriAudioInternal24INPlayMediaIntentHandler)init
{
  return (_TtC17SiriAudioInternal24INPlayMediaIntentHandler *)INPlayMediaIntentHandler.init()();
}

- (void)resolveMediaItemsForPlayMedia:(id)a3 withCompletion:(id)a4
{
}

- (void)handlePlayMedia:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_localSearch);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_deviceProvider);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_nowPlaying);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_seDeviceProvider);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_appleMediaServicesProvider);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_featureFlagProvider);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_nearDeviceProvider);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_accountProvider);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_siriKitTaskLoggingProvider);
  v3 = (char *)self + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_onscreenEntityProvider;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v3);
}

@end