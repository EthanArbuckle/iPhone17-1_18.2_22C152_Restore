@interface MagazineFeedDataManager
- (_TtC7NewsUI223MagazineFeedDataManager)init;
@end

@implementation MagazineFeedDataManager

- (_TtC7NewsUI223MagazineFeedDataManager)init
{
  result = (_TtC7NewsUI223MagazineFeedDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI223MagazineFeedDataManager_delegate);
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223MagazineFeedDataManager_historyService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223MagazineFeedDataManager_puzzleStatsService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223MagazineFeedDataManager_puzzleHistoryService);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223MagazineFeedDataManager_offlineFeedPrimer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223MagazineFeedDataManager_offlineFeatures);
  swift_release();
}

@end