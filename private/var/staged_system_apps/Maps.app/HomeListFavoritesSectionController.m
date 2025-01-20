@interface HomeListFavoritesSectionController
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)editFavoriteShortcut:(id)a3;
- (void)removeFavoriteShortcut:(id)a3;
- (void)shortcutsRowTableViewCell:(void *)a3 openShortcut:(void *)a4;
- (void)shortcutsRowTableViewCellAddNewShortcut:(id)a3;
@end

@implementation HomeListFavoritesSectionController

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_100083698(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps34HomeListFavoritesSectionController_favoritesDataProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps34HomeListFavoritesSectionController_libraryCountsDataProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps34HomeListFavoritesSectionController____lazy_storage___favoritesIdentifierPath));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps34HomeListFavoritesSectionController____lazy_storage___placeLibraryIdentifierPath));
  sub_1000FF2E0((uint64_t)self + OBJC_IVAR____TtC4Maps34HomeListFavoritesSectionController____lazy_storage___favoritesCellSnapshot, &qword_1015D68C0);
  sub_1000FF2E0((uint64_t)self+ OBJC_IVAR____TtC4Maps34HomeListFavoritesSectionController____lazy_storage___favoritesCellSnapshotLegacy, &qword_1015D68C0);
}

- (void)editFavoriteShortcut:(id)a3
{
}

- (void)removeFavoriteShortcut:(id)a3
{
}

- (void)shortcutsRowTableViewCellAddNewShortcut:(id)a3
{
  sub_1000F1C90((uint64_t)self + OBJC_IVAR____TtC4Maps25HomeListSectionController_configuration, (uint64_t)v9);
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  id v6 = a3;
  v7 = self;
  sub_1000F1BD8((uint64_t)v9);
  if (Strong)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    [Strong homeItemTapped:v8];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)shortcutsRowTableViewCell:(void *)a3 openShortcut:(void *)a4
{
  sub_1000F1C90((uint64_t)a1 + OBJC_IVAR____TtC4Maps25HomeListSectionController_configuration, (uint64_t)v11);
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  id v8 = a3;
  id v9 = a4;
  id v10 = a1;
  sub_1000F1BD8((uint64_t)v11);
  if (Strong)
  {
    [Strong homeItemTapped:v9];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

@end