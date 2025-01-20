@interface LibraryFilterOptionsController
+ (BOOL)isFilteringToFavoritesWithStorageKey:(id)a3 legacyStorageKey:(id)a4;
+ (void)updateFavoriteFilter:(BOOL)a3 storageKey:(id)a4;
- (_TtC5Music30LibraryFilterOptionsController)init;
@end

@implementation LibraryFilterOptionsController

+ (BOOL)isFilteringToFavoritesWithStorageKey:(id)a3 legacyStorageKey:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  char v4 = sub_100405C28();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

+ (void)updateFavoriteFilter:(BOOL)a3 storageKey:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100405F4C(a3);

  swift_bridgeObjectRelease();
}

- (_TtC5Music30LibraryFilterOptionsController)init
{
  result = (_TtC5Music30LibraryFilterOptionsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Music30LibraryFilterOptionsController_filterOptionDidChange));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Music30LibraryFilterOptionsController____lazy_storage___filterButton));

  swift_release();
}

@end