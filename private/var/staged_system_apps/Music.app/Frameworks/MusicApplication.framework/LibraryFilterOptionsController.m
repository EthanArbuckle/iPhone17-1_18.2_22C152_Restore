@interface LibraryFilterOptionsController
+ (BOOL)isFilteringToFavoritesWithStorageKey:(id)a3 legacyStorageKey:(id)a4;
+ (void)updateFavoriteFilter:(BOOL)a3 storageKey:(id)a4;
- (_TtC16MusicApplication30LibraryFilterOptionsController)init;
@end

@implementation LibraryFilterOptionsController

+ (BOOL)isFilteringToFavoritesWithStorageKey:(id)a3 legacyStorageKey:(id)a4
{
  sub_AB6510();
  sub_AB6510();
  id v6 = a3;
  id v7 = a4;
  char v8 = sub_54AFF8();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

+ (void)updateFavoriteFilter:(BOOL)a3 storageKey:(id)a4
{
  sub_AB6510();
  id v6 = a4;
  sub_54B31C(a3);

  swift_bridgeObjectRelease();
}

- (_TtC16MusicApplication30LibraryFilterOptionsController)init
{
  result = (_TtC16MusicApplication30LibraryFilterOptionsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A528(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtC16MusicApplication30LibraryFilterOptionsController_filterOptionDidChange));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication30LibraryFilterOptionsController____lazy_storage___filterButton));

  swift_release();
}

@end