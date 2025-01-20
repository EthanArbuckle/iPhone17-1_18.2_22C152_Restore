@interface PlaylistPicker.ViewController
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (_TtCO5Music14PlaylistPicker14ViewController)initWithCoder:(id)a3;
- (_TtCO5Music14PlaylistPicker14ViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PlaylistPicker.ViewController

- (_TtCO5Music14PlaylistPicker14ViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003FBBC4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1003EE420();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1003F2510(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1003F273C();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v8 = *(void *)&a3.width;
  uint64_t v9 = *(void *)&a3.height;
  swift_unknownObjectRetain();
  v10 = self;
  sub_1003F7FEC(v8, v9, 0);
  v11.receiver = v10;
  v11.super_class = (Class)type metadata accessor for PlaylistPicker.ViewController(0);
  -[PlaylistPicker.ViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  swift_unknownObjectRelease();
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_1003FC06C();

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  int64_t v8 = sub_1003FC32C(a4);

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  objc_super v11 = self;
  v12 = (void *)sub_1003F29DC((uint64_t)v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = sub_100063814(&qword_1010A8958);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for IndexPath();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = (char *)self + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_headerRegistration;
  swift_beginAccess();
  sub_10006CAB8((uint64_t)v14, (uint64_t)v9, &qword_1010A8958);
  uint64_t v15 = sub_100063814(&qword_1010A8850);
  uint64_t v16 = *(void *)(v15 - 8);
  id result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v9, 1, v15);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_100057778(0, (unint64_t *)&unk_10109C880);
    id v18 = a3;
    v19 = self;
    v20 = (void *)UICollectionView.dequeueConfiguredReusableSupplementary<A>(using:for:)();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v15);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return v20;
  }
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_1003FC800(v12, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  LOBYTE(self) = sub_1003FCE64(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_1003F3E8C(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = a3;
  id v10 = self;
  sub_1003FD0F0(v6, v8);

  swift_bridgeObjectRelease();
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003FD180();
}

- (_TtCO5Music14PlaylistPicker14ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  id result = (_TtCO5Music14PlaylistPicker14ViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_tracksToAdd;
  uint64_t v4 = sub_100063814((uint64_t *)&unk_10109C150);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1003FD1F0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_containerSource), *(void *)&self->containerSource[OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_containerSource], *(void *)&self->containerSource[OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_containerSource + 8]);
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_selectHandler));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_newPlaylistHandler));
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_folder, &qword_1010A4440);
  swift_bridgeObjectRelease();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_recentPlaylists, &qword_1010A8870);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_allPlaylists, (uint64_t *)&unk_1010A4450);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_searchController));
  swift_bridgeObjectRelease();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_newPlaylistCellRegistration, (uint64_t *)&unk_1010A8928);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_playlistCellRegistration, (uint64_t *)&unk_1010A45A0);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_folderCellRegistration, (uint64_t *)&unk_1010A4560);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_headerRegistration, &qword_1010A8958);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController____lazy_storage___collectionView));
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController____lazy_storage___collectionViewLayout);
}

@end