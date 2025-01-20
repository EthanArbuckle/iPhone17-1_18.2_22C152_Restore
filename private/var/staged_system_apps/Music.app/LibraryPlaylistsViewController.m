@interface LibraryPlaylistsViewController
- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5;
- (BOOL)collectionView:(void *)a3 shouldSelectItemAtIndexPath:;
- (_TtC5Music30LibraryPlaylistsViewController)initWithCoder:(id)a3;
- (_TtC5Music30LibraryPlaylistsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)indexTitlesForCollectionView:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation LibraryPlaylistsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100318A8C();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_10031DBCC(v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10031DE24(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(LibraryPlaylistsViewController *)&v5 viewDidDisappear:v3];
  RequestResponse.Controller.isAutomaticReloadingEnabled.setter(0);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  int64_t v6 = sub_10032D05C();

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  int64_t v8 = sub_10032D2B4(a4);

  return v8;
}

- (id)indexTitlesForCollectionView:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  id v6 = sub_10032D71C();

  if (v6)
  {
    v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }

  return v7.super.isa;
}

- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  IndexPath.init(index:)();
  v9.super.isa = IndexPath._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v9.super.isa;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a3;
  v15 = self;
  v16 = (void *)sub_1003220B0((uint64_t)v14, v11, v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v16;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = sub_10032240C((uint64_t)v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (BOOL)collectionView:(void *)a3 shouldSelectItemAtIndexPath:
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a1;
  LOBYTE(a1) = UICollectionView.isDraggingCell(at:)();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (a1 & 1) == 0;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_100323C7C(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  type metadata accessor for IndexPath();
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  id v9 = self;
  id v10 = sub_10032D838(v7);

  swift_bridgeObjectRelease();

  return v10;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  id v9 = self;
  id v10 = [*(id *)(sub_1003198D0() + 32) searchBar];
  [v10 resignFirstResponder];

  swift_unknownObjectRelease();
  swift_release();
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = self;
  sub_100325684(v8, v9, a5);

  swift_unknownObjectRelease();
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  char v19 = 1;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  id v15 = sub_1001F1FB0((uint64_t)v11, (uint64_t)v17);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  return v15;
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = (char *)a3;
  swift_unknownObjectRetain();
  id v12 = self;
  LOBYTE(self) = sub_10032DF34(v11, (uint64_t)v10);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UIContentUnavailableConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_100325D54();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC5Music30LibraryPlaylistsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10032E538();
}

- (_TtC5Music30LibraryPlaylistsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Music30LibraryPlaylistsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController_pendingSelectedPlaylistItem, (uint64_t *)&unk_1010A4490);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController____lazy_storage___globalHeaderRegistration, &qword_1010A45B0);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController____lazy_storage___headerRegistration, &qword_1010A45B0);
  sub_1000637B8((uint64_t)self+ OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController____lazy_storage___listPlaylistCellRegistration, (uint64_t *)&unk_1010A45A0);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController____lazy_storage___listFolderCellRegistration, (uint64_t *)&unk_1010A4560);
  sub_1000637B8((uint64_t)self+ OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController____lazy_storage___gridPlaylistCellRegistration, &qword_1010A4548);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController____lazy_storage___gridFolderCellRegistration, (uint64_t *)&unk_1010A44E0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController____lazy_storage___collectionView));
  sub_10032FDF0((uint64_t)self + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController_scope, _s9PlaylistsV5ScopeVMa);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController_prefetchingController));
  swift_release();
  swift_release();
  sub_1000637B8((uint64_t)self+ OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController____lazy_storage___actionMetricsReportingContext, (uint64_t *)&unk_10109B9A0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController____lazy_storage___contextBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController____lazy_storage___newPlaylistBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController____lazy_storage___playBarButtonItem));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController____lazy_storage___shuffleBarButtonItem);
}

@end