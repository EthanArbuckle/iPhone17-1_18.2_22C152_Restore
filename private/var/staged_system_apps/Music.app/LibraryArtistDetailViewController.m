@interface LibraryArtistDetailViewController
- (BOOL)collectionView:(void *)a3 shouldSelectItemAtIndexPath:;
- (_TtC5Music33LibraryArtistDetailViewController)initWithCoder:(id)a3;
- (_TtC5Music33LibraryArtistDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation LibraryArtistDetailViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10019EA30();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_1001A5348(v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1001A55B8(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(LibraryArtistDetailViewController *)&v5 viewDidDisappear:v3];
  RequestResponse.Controller.isAutomaticReloadingEnabled.setter(0);
  RequestResponse.Controller.isAutomaticReloadingEnabled.setter(0);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  BOOL v6 = sub_1001A266C();
  BOOL v7 = sub_1001A28BC();

  if (v6 && v7) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = self;
  int64_t v8 = sub_1001C47AC(a4);

  return v8;
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
  v16 = (void *)sub_1001ACC84((uint64_t)v14, v11, v13);
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
  v12 = (void *)sub_1001AD0C4((uint64_t)v10, (uint64_t)v9);

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
  id v9 = (void (*)(uint64_t, uint64_t))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_1001AE9D4(v10, v9);

  (*(void (**)(void, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  type metadata accessor for IndexPath();
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  id v9 = self;
  id v10 = (void *)sub_1001C4CEC(v7);
  swift_bridgeObjectRelease();

  return v10;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  id v9 = self;
  id v10 = [*(id *)(sub_10019F3F4() + 32) searchBar];
  [v10 resignFirstResponder];

  swift_unknownObjectRelease();
  swift_release();
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  id v9 = self;
  sub_1001B0F04(v10, v8, a5);

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

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10019E820();
}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UIContentUnavailableConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_1001B1504();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC5Music33LibraryArtistDetailViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001C6594();
}

- (_TtC5Music33LibraryArtistDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Music33LibraryArtistDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController____lazy_storage___globalHeaderRegistration, &qword_1010A45B0);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController____lazy_storage___headerRegistration, &qword_1010A45B0);
  sub_1000637B8((uint64_t)self+ OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController____lazy_storage___albumGridCellRegistration, (uint64_t *)&unk_1010B56C0);
  sub_1000637B8((uint64_t)self+ OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController____lazy_storage___albumListCellRegistration, &qword_10109C878);
  sub_1000637B8((uint64_t)self+ OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController____lazy_storage___musicVideoGridCellRegistration, (uint64_t *)&unk_10109C8C0);
  sub_1000637B8((uint64_t)self+ OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController____lazy_storage___musicVideoListCellRegistration, (uint64_t *)&unk_1010AAC60);
  id v3 = (char *)self + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController_artist;
  uint64_t v4 = type metadata accessor for Artist();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController____lazy_storage___collectionView));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController_prefetchingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController_artistHeader));
  swift_release();
  swift_release();
  sub_1000637B8((uint64_t)self+ OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController____lazy_storage___actionMetricsReportingContext, (uint64_t *)&unk_10109B9A0);
  swift_release();
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController____lazy_storage___favoriteButton);
}

@end