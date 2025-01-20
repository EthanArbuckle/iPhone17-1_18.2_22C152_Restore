@interface WatchSportsEventIntentHandler
- (_TtC16SiriVideoIntents29WatchSportsEventIntentHandler)init;
- (void)confirmWatchSportsEvent:(WatchSportsEventIntent *)a3 completion:(id)a4;
- (void)handleWatchSportsEvent:(WatchSportsEventIntent *)a3 completion:(id)a4;
@end

@implementation WatchSportsEventIntentHandler

- (_TtC16SiriVideoIntents29WatchSportsEventIntentHandler)init
{
  return (_TtC16SiriVideoIntents29WatchSportsEventIntentHandler *)WatchSportsEventIntentHandler.init()();
}

- (void)confirmWatchSportsEvent:(WatchSportsEventIntent *)a3 completion:(id)a4
{
}

- (void)handleWatchSportsEvent:(WatchSportsEventIntent *)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents29WatchSportsEventIntentHandler_utsProvider);
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC16SiriVideoIntents29WatchSportsEventIntentHandler_siriRemembersProvider;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
}

@end