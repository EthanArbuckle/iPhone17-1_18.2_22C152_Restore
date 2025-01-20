@interface PuzzleDataManager
- (_TtC8NewsFeed17PuzzleDataManager)init;
- (void)bundleSubscriptionDidSubscribe:(id)a3;
@end

@implementation PuzzleDataManager

- (_TtC8NewsFeed17PuzzleDataManager)init
{
  result = (_TtC8NewsFeed17PuzzleDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C019B9B4((uint64_t)self + OBJC_IVAR____TtC8NewsFeed17PuzzleDataManager_delegate);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed17PuzzleDataManager_puzzleService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed17PuzzleDataManager_puzzleHistoryService);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed17PuzzleDataManager_puzzleNotificationAutoEnableManager);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed17PuzzleDataManager_puzzleStatsService);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C02B073C();
}

@end