@interface RemoveFromWatchListIntentHandler
- (_TtC16SiriVideoIntents32RemoveFromWatchListIntentHandler)init;
- (void)confirmRemoveFromWatchList:(RemoveFromWatchListIntent *)a3 completion:(id)a4;
- (void)handleRemoveFromWatchList:(RemoveFromWatchListIntent *)a3 completion:(id)a4;
- (void)resolveContentForRemoveFromWatchList:(RemoveFromWatchListIntent *)a3 withCompletion:(id)a4;
@end

@implementation RemoveFromWatchListIntentHandler

- (_TtC16SiriVideoIntents32RemoveFromWatchListIntentHandler)init
{
  return (_TtC16SiriVideoIntents32RemoveFromWatchListIntentHandler *)sub_22BC6A04C();
}

- (void)resolveContentForRemoveFromWatchList:(RemoveFromWatchListIntent *)a3 withCompletion:(id)a4
{
}

- (void)confirmRemoveFromWatchList:(RemoveFromWatchListIntent *)a3 completion:(id)a4
{
}

- (void)handleRemoveFromWatchList:(RemoveFromWatchListIntent *)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents32RemoveFromWatchListIntentHandler_contentResolver);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents32RemoveFromWatchListIntentHandler_watchListService);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents32RemoveFromWatchListIntentHandler_analyticsService);
  v3 = (char *)self + OBJC_IVAR____TtC16SiriVideoIntents32RemoveFromWatchListIntentHandler_featureFlagService;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
}

@end