@interface LibraryTVShowsMoviesViewController
- (BOOL)collectionView:(void *)a3 shouldSelectItemAtIndexPath:;
- (_TtC5Music34LibraryTVShowsMoviesViewController)initWithCoder:(id)a3;
- (_TtC5Music34LibraryTVShowsMoviesViewController)initWithNibName:(id)a3 bundle:(id)a4;
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
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation LibraryTVShowsMoviesViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100762284();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_100765B60(v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_100765C74(a3);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_10076F530();

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  int64_t v8 = sub_10076FA0C(a4);

  return v8;
}

- (id)indexTitlesForCollectionView:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_100770304();

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
  v16 = (void *)sub_10076A008((uint64_t)v14, v11, v13);

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
  v12 = (void *)sub_10076A41C((uint64_t)v10, (uint64_t)v9);

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
  sub_10076B4C4(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  type metadata accessor for IndexPath();
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  id v9 = self;
  id v10 = (void *)sub_100770524(v7);

  swift_bridgeObjectRelease();

  return v10;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  id v9 = self;
  id v10 = [*(id *)(sub_100764104() + 32) searchBar];
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
  sub_1007719F8(v9, a5);

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

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UIContentUnavailableConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_10076DA2C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC5Music34LibraryTVShowsMoviesViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10077226C();
}

- (_TtC5Music34LibraryTVShowsMoviesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Music34LibraryTVShowsMoviesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000637B8((uint64_t)self+ OBJC_IVAR____TtC5Music34LibraryTVShowsMoviesViewController____lazy_storage___globalHeaderRegistration, (uint64_t *)&unk_1010B9BE0);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music34LibraryTVShowsMoviesViewController____lazy_storage___headerRegistration, &qword_1010A45B0);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music34LibraryTVShowsMoviesViewController____lazy_storage___tvShowCellRegistration, &qword_1010B9B78);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music34LibraryTVShowsMoviesViewController____lazy_storage___movieCellRegistration, (uint64_t *)&unk_1010B9B80);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music34LibraryTVShowsMoviesViewController____lazy_storage___collectionView));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music34LibraryTVShowsMoviesViewController_prefetchingController));
  swift_release();
  swift_release();
  sub_1000637B8((uint64_t)self+ OBJC_IVAR____TtC5Music34LibraryTVShowsMoviesViewController____lazy_storage___actionMetricsReportingContext, (uint64_t *)&unk_10109B9A0);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music34LibraryTVShowsMoviesViewController____lazy_storage___sortMoviesBarButton);
}

@end