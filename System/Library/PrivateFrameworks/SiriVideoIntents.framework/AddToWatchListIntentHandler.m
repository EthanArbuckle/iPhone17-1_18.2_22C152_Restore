@interface AddToWatchListIntentHandler
- (_TtC16SiriVideoIntents27AddToWatchListIntentHandler)init;
- (void)confirmAddToWatchList:(AddToWatchListIntent *)a3 completion:(id)a4;
- (void)handleAddToWatchList:(AddToWatchListIntent *)a3 completion:(id)a4;
- (void)resolveContentForAddToWatchList:(AddToWatchListIntent *)a3 withCompletion:(id)a4;
@end

@implementation AddToWatchListIntentHandler

- (_TtC16SiriVideoIntents27AddToWatchListIntentHandler)init
{
  return (_TtC16SiriVideoIntents27AddToWatchListIntentHandler *)sub_22BC3380C();
}

- (void)resolveContentForAddToWatchList:(AddToWatchListIntent *)a3 withCompletion:(id)a4
{
}

- (void)confirmAddToWatchList:(AddToWatchListIntent *)a3 completion:(id)a4
{
}

- (void)handleAddToWatchList:(AddToWatchListIntent *)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents27AddToWatchListIntentHandler_contentResolver);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents27AddToWatchListIntentHandler_watchListService);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents27AddToWatchListIntentHandler_analyticsService);
  v3 = (char *)self + OBJC_IVAR____TtC16SiriVideoIntents27AddToWatchListIntentHandler_featureFlagService;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
}

@end