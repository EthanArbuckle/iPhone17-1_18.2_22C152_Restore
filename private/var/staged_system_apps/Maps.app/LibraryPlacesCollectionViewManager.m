@interface LibraryPlacesCollectionViewManager
- (UICollectionViewDataSource)dataSource;
- (_TtC4Maps34LibraryPlacesCollectionViewManager)init;
@end

@implementation LibraryPlacesCollectionViewManager

- (UICollectionViewDataSource)dataSource
{
  v2 = self;
  id v3 = sub_1002F3914();

  return (UICollectionViewDataSource *)v3;
}

- (_TtC4Maps34LibraryPlacesCollectionViewManager)init
{
  result = (_TtC4Maps34LibraryPlacesCollectionViewManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps34LibraryPlacesCollectionViewManager_libraryDataOperationsProvider));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps34LibraryPlacesCollectionViewManager_cellActionHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps34LibraryPlacesCollectionViewManager____lazy_storage___diffableDataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps34LibraryPlacesCollectionViewManager____lazy_storage___listLayout));
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps34LibraryPlacesCollectionViewManager_gridLayout);
}

@end