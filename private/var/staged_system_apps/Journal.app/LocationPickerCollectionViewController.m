@interface LocationPickerCollectionViewController
- (_TtC7Journal38LocationPickerCollectionViewController)initWithCoder:(id)a3;
- (_TtC7Journal38LocationPickerCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)appWillEnterForeground;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)onCancelButtonTapped;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation LocationPickerCollectionViewController

- (void)viewWillAppear:(BOOL)a3
{
  v3 = self;
  sub_1004CCF74();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1004BF1BC();
}

- (void)appWillEnterForeground
{
  v2 = self;
  sub_1004C036C();
}

- (void)dealloc
{
  v2 = self;
  sub_1004C047C();
}

- (void).cxx_destruct
{
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal38LocationPickerCollectionViewController_pickerDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal38LocationPickerCollectionViewController_searchBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal38LocationPickerCollectionViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal38LocationPickerCollectionViewController_offlineStateView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal38LocationPickerCollectionViewController_emptyJournaledLocationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal38LocationPickerCollectionViewController_emptySearchResultsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal38LocationPickerCollectionViewController_permissionMissingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal38LocationPickerCollectionViewController_progressView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal38LocationPickerCollectionViewController_searchManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal38LocationPickerCollectionViewController_localSearch));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal38LocationPickerCollectionViewController_localSearchWithCompletion));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal38LocationPickerCollectionViewController_currentPlacemark));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal38LocationPickerCollectionViewController_currentLocation));
  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal38LocationPickerCollectionViewController_currentLoc, (uint64_t *)&unk_10080F290);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal38LocationPickerCollectionViewController_photoLocation));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_10001ABB8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC7Journal38LocationPickerCollectionViewController_newLocationIsSelected));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Journal38LocationPickerCollectionViewController_locationToChange);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1004C0958(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = self;
  v6 = self;
  id v7 = [v5 defaultCenter];
  [v7 removeObserver:v6 name:UIApplicationWillEnterForegroundNotification object:0];

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for LocationPickerCollectionViewController(0);
  [(LocationPickerCollectionViewController *)&v8 viewDidDisappear:v3];
}

- (void)onCancelButtonTapped
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC7Journal38LocationPickerCollectionViewController_newLocationIsCanceled);
  BOOL v3 = self;
  uint64_t v4 = swift_retain();
  v2(v4);

  swift_release();
}

- (_TtC7Journal38LocationPickerCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC7Journal38LocationPickerCollectionViewController *)sub_1004C6D54(v5, v7, a4);
}

- (_TtC7Journal38LocationPickerCollectionViewController)initWithCoder:(id)a3
{
  return (_TtC7Journal38LocationPickerCollectionViewController *)sub_1004C727C(a3);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 2;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  int64_t v8 = sub_1004CD5A4(a4);

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  id v12 = sub_1004C88CC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1004CD6EC();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end