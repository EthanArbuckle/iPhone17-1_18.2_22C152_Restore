@interface SharedWithYouFeedDataManager
- (_TtC7NewsUI228SharedWithYouFeedDataManager)init;
@end

@implementation SharedWithYouFeedDataManager

- (_TtC7NewsUI228SharedWithYouFeedDataManager)init
{
  result = (_TtC7NewsUI228SharedWithYouFeedDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI228SharedWithYouFeedDataManager_delegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI228SharedWithYouFeedDataManager_sharedItemManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI228SharedWithYouFeedDataManager_headlineService);

  swift_release();
  swift_release();
  swift_release();
}

@end