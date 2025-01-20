@interface LibraryHomeCollectionViewManager
- (UICollectionViewDataSource)dataSource;
- (UICollectionViewLayout)collectionViewLayout;
- (_TtC4Maps32LibraryHomeCollectionViewManager)init;
- (void)dealloc;
- (void)libraryItemsCountManager:(id)a3 didUpdateCounts:(id)a4;
@end

@implementation LibraryHomeCollectionViewManager

- (UICollectionViewDataSource)dataSource
{
  v2 = self;
  id v3 = sub_100306788();

  return (UICollectionViewDataSource *)v3;
}

- (UICollectionViewLayout)collectionViewLayout
{
  v2 = self;
  id v3 = sub_100306830();

  return (UICollectionViewLayout *)v3;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(void **)(*(char **)((char *)&self->super.isa
                           + OBJC_IVAR____TtC4Maps32LibraryHomeCollectionViewManager_countsManager)
                + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_observers);
  v5 = self;
  [v4 unregisterObserver:v5];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(LibraryHomeCollectionViewManager *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps32LibraryHomeCollectionViewManager_cellActionHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps32LibraryHomeCollectionViewManager____lazy_storage___diffableDataSource));
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC4Maps32LibraryHomeCollectionViewManager____lazy_storage___compositionalLayout);
}

- (_TtC4Maps32LibraryHomeCollectionViewManager)init
{
  result = (_TtC4Maps32LibraryHomeCollectionViewManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)libraryItemsCountManager:(id)a3 didUpdateCounts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1003086AC();
}

@end