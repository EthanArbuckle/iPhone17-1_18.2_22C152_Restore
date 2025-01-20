@interface PlayVideoIntentHandler
- (_TtC16SiriVideoIntents22PlayVideoIntentHandler)init;
- (void)confirmPlayVideo:(PlayVideoIntent *)a3 completion:(id)a4;
- (void)handlePlayVideo:(PlayVideoIntent *)a3 completion:(id)a4;
- (void)resolveContentForPlayVideo:(PlayVideoIntent *)a3 withCompletion:(id)a4;
@end

@implementation PlayVideoIntentHandler

- (_TtC16SiriVideoIntents22PlayVideoIntentHandler)init
{
  PlayVideoIntentHandler.init()();
  return result;
}

- (void)resolveContentForPlayVideo:(PlayVideoIntent *)a3 withCompletion:(id)a4
{
}

- (void)confirmPlayVideo:(PlayVideoIntent *)a3 completion:(id)a4
{
}

- (void)handlePlayVideo:(PlayVideoIntent *)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents22PlayVideoIntentHandler_contentResolver);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents22PlayVideoIntentHandler_analyticsService);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents22PlayVideoIntentHandler_signalRecorder);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents22PlayVideoIntentHandler_contentWith3pAppsProviding);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents22PlayVideoIntentHandler_deviceState);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents22PlayVideoIntentHandler_tipService);
  v3 = (char *)self + OBJC_IVAR____TtC16SiriVideoIntents22PlayVideoIntentHandler_appProvider;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
}

@end