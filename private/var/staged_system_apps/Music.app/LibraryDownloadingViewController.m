@interface LibraryDownloadingViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (_TtC5Music32LibraryDownloadingViewController)init;
- (_TtC5Music32LibraryDownloadingViewController)initWithCoder:(id)a3;
- (_TtC5Music32LibraryDownloadingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation LibraryDownloadingViewController

- (_TtC5Music32LibraryDownloadingViewController)init
{
  return (_TtC5Music32LibraryDownloadingViewController *)sub_10029510C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100295470();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_100297A70(v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(LibraryDownloadingViewController *)&v5 viewDidDisappear:v3];
  sub_100296180();
  sub_1001257E4(0);

  swift_release();
}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UIContentUnavailableConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_100297C04();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music32LibraryDownloadingViewController_sections))[2];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_10029A694(a4);
  int64_t v9 = v8;

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100057778(0, (unint64_t *)&unk_10109C820);
  id v11 = a3;
  v12 = self;
  v13 = (void *)UICollectionView.dequeueConfiguredReusableSupplementary<A>(using:for:)();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  v12 = (void *)sub_100299740((uint64_t)v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC5Music32LibraryDownloadingViewController_sections);
  id v11 = a3;
  v12 = self;
  unint64_t v13 = IndexPath.section.getter();
  if ((v13 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v13 >= *(void *)(v10 + 16))
  {
LABEL_8:
    __break(1u);
    return v13;
  }
  if (*(unsigned char *)(v10 + v13 + 32)) {
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  else {
    char v14 = 1;
  }

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  LOBYTE(v13) = v14 & 1;
  return v13;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  sub_10029A848();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC5Music32LibraryDownloadingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10029A938();
}

- (_TtC5Music32LibraryDownloadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Music32LibraryDownloadingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC5Music32LibraryDownloadingViewController_headerRegistration;
  uint64_t v4 = sub_100063814((uint64_t *)&unk_10109C570);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music32LibraryDownloadingViewController____lazy_storage___actionCellRegistration, &qword_1010A1C68);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music32LibraryDownloadingViewController____lazy_storage___listCellRegistration, &qword_1010A1CF0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music32LibraryDownloadingViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music32LibraryDownloadingViewController_prefetchingController));
  swift_release();
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC5Music32LibraryDownloadingViewController_items;
  uint64_t v6 = sub_100063814((uint64_t *)&unk_10109C150);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music32LibraryDownloadingViewController_updateTimer));

  swift_bridgeObjectRelease();
}

@end