@interface INAddMediaIntentHandler
- (_TtC17SiriAudioInternal23INAddMediaIntentHandler)init;
- (void)handleAddMedia:(id)a3 completion:(id)a4;
- (void)resolveMediaDestinationForAddMedia:(id)a3 withCompletion:(id)a4;
- (void)resolveMediaItemsForAddMedia:(id)a3 withCompletion:(id)a4;
@end

@implementation INAddMediaIntentHandler

- (_TtC17SiriAudioInternal23INAddMediaIntentHandler)init
{
  return (_TtC17SiriAudioInternal23INAddMediaIntentHandler *)INAddMediaIntentHandler.init()();
}

- (void)resolveMediaItemsForAddMedia:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveMediaDestinationForAddMedia:(id)a3 withCompletion:(id)a4
{
}

- (void)handleAddMedia:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_nowPlaying);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_subscription);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_aceServiceInvoker);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_appIntentInvoker);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_provider);
  swift_release();
  sub_23557DE84((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_notificationProvider, &qword_26880C698);
  v3 = (char *)self + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_onscreenEntityProvider;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v3);
}

@end