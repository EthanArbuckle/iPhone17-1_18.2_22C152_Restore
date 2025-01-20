@interface PlaylistEditingViewController
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (_TtC5Music29PlaylistEditingViewController)initWithCoder:(id)a3;
- (_TtC5Music29PlaylistEditingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PlaylistEditingViewController

- (_TtC5Music29PlaylistEditingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006718C0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10065B728();
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  sub_10065E84C(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_10065EB64();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v8 = *(void *)&a3.width;
  uint64_t v9 = *(void *)&a3.height;
  swift_unknownObjectRetain();
  v10 = self;
  sub_10066E094(v8, v9, 0);
  v11.receiver = v10;
  v11.super_class = (Class)type metadata accessor for PlaylistEditingViewController(0);
  -[PlaylistEditingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);

  swift_unknownObjectRelease();
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v5 = a3;
  v6 = self;
  sub_10065ED64(v5, a4);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (*(void *)(self + OBJC_IVAR____TtC5Music29PlaylistEditingViewController_editController))
  {
    v4 = (void *)self;
    id v5 = a3;
    id v6 = v4;
    swift_retain();
    uint64_t v7 = dispatch thunk of MusicLibraryPlaylistEditViewModel.entries.getter();
    swift_release();
    int64_t v8 = *(void *)(v7 + 16);

    swift_bridgeObjectRelease();
    return v8;
  }
  else
  {
    __break(1u);
  }
  return self;
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
  v16 = (void *)sub_10065F5CC((uint64_t)v14, v11, v13);
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v16;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_10065F8C0((uint64_t)v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return sub_10065FE2C(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_100671AD0);
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v17 - v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a3;
  uint64_t v15 = self;
  sub_100669D44();

  v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v10, v7);
  v16(v13, v7);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_10065FE2C(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_100671D50);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  uint64_t v12 = sub_100660FB8();
  [(objc_class *)v12 setEnabled:[(PlaylistEditingViewController *)v11 isEditing]];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  uint64_t v12 = sub_100660FB8();
  id v13 = [v10 indexPathsForSelectedItems];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v16 = *(void *)(v15 + 16);
    swift_bridgeObjectRelease();
    BOOL v17 = v16 != 0;
  }
  else
  {
    BOOL v17 = 0;
  }
  [(objc_class *)v12 setEnabled:v17];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC5Music29PlaylistEditingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Music29PlaylistEditingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29PlaylistEditingViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29PlaylistEditingViewController____lazy_storage___mainLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29PlaylistEditingViewController____lazy_storage___cancelNavigationBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29PlaylistEditingViewController____lazy_storage___doneNavigationBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29PlaylistEditingViewController____lazy_storage___deleteToolBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29PlaylistEditingViewController____lazy_storage___addToolBarButtonItem));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29PlaylistEditingViewController_metadataHeaderView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29PlaylistEditingViewController____lazy_storage___musicPickerHostingView));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  id v3 = (char *)self + OBJC_IVAR____TtC5Music29PlaylistEditingViewController_playlist;
  uint64_t v4 = type metadata accessor for Playlist();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29PlaylistEditingViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29PlaylistEditingViewController_currentUserUploadImage));
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music29PlaylistEditingViewController____lazy_storage___headerRegistration, &qword_1010B5258);
  sub_10003CABC((uint64_t)self + OBJC_IVAR____TtC5Music29PlaylistEditingViewController_metadataView, (uint64_t)v5, &qword_1010B50D8);
  sub_1006715CC(v5);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music29PlaylistEditingViewController____lazy_storage___cellRegistration, &qword_1010B5230);
  swift_release();
  swift_release();
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if (sub_100664EDC())
  {

    char v6 = 0;
  }
  else
  {
    char v7 = *((unsigned char *)&v5->super.super.super.isa
         + OBJC_IVAR____TtC5Music29PlaylistEditingViewController_hasTracklistChanges);

    char v6 = v7 ^ 1;
  }
  return v6 & 1;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10066D844();
}

@end