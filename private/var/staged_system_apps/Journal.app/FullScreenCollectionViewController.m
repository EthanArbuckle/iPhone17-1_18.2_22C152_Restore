@interface FullScreenCollectionViewController
- (BOOL)accessibilityPerformEscape;
- (BOOL)prefersStatusBarHidden;
- (_TtC7Journal34FullScreenCollectionViewController)initWithCoder:(id)a3;
- (_TtC7Journal34FullScreenCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)handleAppWillMoveToBackground;
- (void)handleAppWillMoveToForeground;
- (void)handleDeletedAssetWithNotification:(id)a3;
- (void)handleOpenInHealth;
- (void)pageControlTapped;
- (void)videoMuteButtonTapped:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation FullScreenCollectionViewController

- (BOOL)prefersStatusBarHidden
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC7Journal34FullScreenCollectionViewController_statusBarHidden);
}

- (_TtC7Journal34FullScreenCollectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002F3A50();
}

- (void)dealloc
{
  id v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for FullScreenCollectionViewController();
  [(FullScreenCollectionViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal34FullScreenCollectionViewController_interactiveCoordinator));
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal34FullScreenCollectionViewController_delegate);
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal34FullScreenCollectionViewController_loadingDelegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal34FullScreenCollectionViewController_collectionView));
  id v3 = (char *)self + OBJC_IVAR____TtC7Journal34FullScreenCollectionViewController_initIndexPath;
  uint64_t v4 = type metadata accessor for IndexPath();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal34FullScreenCollectionViewController_pageControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal34FullScreenCollectionViewController____lazy_storage___removeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal34FullScreenCollectionViewController____lazy_storage___videoMuteButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal34FullScreenCollectionViewController____lazy_storage___closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal34FullScreenCollectionViewController_trashAndOpenInContextMenuButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal34FullScreenCollectionViewController_unmuteSymbol));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal34FullScreenCollectionViewController_muteSymbol));

  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1002E7754();
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1002E7DCC(a3);
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = self;
    sub_1005D68BC(0, 1);

    swift_unknownObjectRelease();
  }
  return Strong != 0;
}

- (void)handleDeletedAssetWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1002E9054();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)handleAppWillMoveToBackground
{
  v2 = self;
  sub_1002E9E48();
}

- (void)handleAppWillMoveToForeground
{
  v2 = self;
  sub_1002E9BF8();
}

- (void)pageControlTapped
{
  v2 = self;
  sub_1002EA868();
}

- (void)videoMuteButtonTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1002F413C();
}

- (void)handleOpenInHealth
{
  v2 = self;
  sub_1002EC288();
}

- (_TtC7Journal34FullScreenCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7Journal34FullScreenCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v6 = (unint64_t *)((char *)self + OBJC_IVAR____TtC7Journal34FullScreenCollectionViewController_journalAssets);
  swift_beginAccess();
  unint64_t v7 = *v6;
  if (!(v7 >> 62)) {
    return *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v10 = a3;
  v11 = self;
  swift_bridgeObjectRetain();
  int64_t v8 = _CocoaArrayWrapper.endIndex.getter();

  swift_bridgeObjectRelease();
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
  v11 = self;
  v12 = (void *)sub_1002F04CC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_1002F43B8(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_1002F46BC(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

@end