@interface SharedItemManager
- (_TtC8NewsFeed17SharedItemManager)init;
@end

@implementation SharedItemManager

- (_TtC8NewsFeed17SharedItemManager)init
{
  result = (_TtC8NewsFeed17SharedItemManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed17SharedItemManager_sharedItemCenter);

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed17SharedItemManager_modificationDate;
  uint64_t v4 = sub_1C151631C();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end