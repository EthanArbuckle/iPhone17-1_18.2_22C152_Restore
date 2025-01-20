@interface TagFeedDataManager
- (_TtC7NewsUI218TagFeedDataManager)init;
@end

@implementation TagFeedDataManager

- (_TtC7NewsUI218TagFeedDataManager)init
{
  result = (_TtC7NewsUI218TagFeedDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI218TagFeedDataManager_delegate);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI218TagFeedDataManager_headlineService);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI218TagFeedDataManager_historyService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI218TagFeedDataManager_puzzleStatsService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI218TagFeedDataManager_puzzleHistoryService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI218TagFeedDataManager_backgroundPluginFactory);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI218TagFeedDataManager_sportsSyncManager);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI218TagFeedDataManager_sportsOnboardingManager);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI218TagFeedDataManager_offlineFeedPrimer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI218TagFeedDataManager_offlineFeatures);
  swift_release();
  swift_release();
}

@end