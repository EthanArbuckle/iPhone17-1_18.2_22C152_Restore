@interface ForYouFeedDataManager
- (_TtC8StocksUI21ForYouFeedDataManager)init;
- (uint64_t)bundleSubscriptionDidSubscribe:(void *)a3;
- (void)dealloc;
@end

@implementation ForYouFeedDataManager

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_priceDataManager), *(void *)&self->priceDataManager[OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_priceDataManager]);
  sub_20A7B4BF8(&qword_26AC72968, (void (*)(uint64_t))type metadata accessor for ForYouFeedDataManager);
  v4 = self;
  sub_20A8C39D0();
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_watchlistManager), *(void *)&v4->priceDataManager[OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_watchlistManager]);
  sub_20A7B4BF8(&qword_26AC72970, (void (*)(uint64_t))type metadata accessor for ForYouFeedDataManager);
  v5 = v4;
  sub_20A8C36A0();

  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(ForYouFeedDataManager *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_20A4380C4((uint64_t)self + OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_delegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_priceDataManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_feedService);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_appConfigurationManager);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_watchlistManager);

  sub_20A7B4C40((uint64_t)self + OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_lastRefreshDate, (uint64_t (*)(void))sub_20A42D040);

  swift_bridgeObjectRelease();
}

- (_TtC8StocksUI21ForYouFeedDataManager)init
{
  result = (_TtC8StocksUI21ForYouFeedDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (uint64_t)bundleSubscriptionDidSubscribe:(void *)a3
{
  v5 = &a1[OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_delegate];
  uint64_t result = MEMORY[0x2105289B0](&a1[OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_delegate]);
  if (result)
  {
    uint64_t v7 = *((void *)v5 + 1);
    swift_getObjectType();
    v8 = *(void (**)(void))(v7 + 16);
    id v9 = a3;
    v10 = a1;
    v8();

    return swift_unknownObjectRelease();
  }
  return result;
}

@end