@interface NowPlayingQueueViewController
- (BOOL)canPresentViewControllers;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4;
- (_TtC5Music29NowPlayingQueueViewController)initWithCoder:(id)a3;
- (_TtC5Music29NowPlayingQueueViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_collectionView:(id)a3 indexPathOfReferenceItemToPreserveContentOffsetWithProposedReference:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)configureCell:(id)a3 forMovie:(id)a4;
- (void)configureCell:(id)a3 forSong:(id)a4;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)dealloc;
- (void)handleLongPress:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewSafeAreaInsetsDidChange;
@end

@implementation NowPlayingQueueViewController

- (BOOL)canPresentViewControllers
{
  return 1;
}

- (void)dealloc
{
  uint64_t v2 = qword_101097EA8;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_101129410;
  Playing = (Swift::Int *)MPCPlayerRequestTracklistRange.upNextPlayingItems.unsafeMutableAddressor();
  Swift::Int v6 = *Playing;
  Swift::Int v7 = Playing[1];
  v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v4 + 752))(v11);
  v9.reverseCount = v6;
  v9.forwardCount = v7;
  Player.NowPlayingConfiguration.remove(_:)(v9);
  v8(v11, 0);
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for NowPlayingQueueViewController(0);
  [(NowPlayingQueueViewController *)&v10 dealloc];
}

- (void).cxx_destruct
{
  sub_1002C3890((uint64_t)self + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_updateContext, _s13UpdateContextVMa);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_prefetchingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController____lazy_storage___collectionView));
  sub_100046744((uint64_t)self + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController__playerResponse));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_historyRequestController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController__historyResponse));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_dataSource));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_headerSizingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_autoPlayHeaderSizingView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_feedbackGenerator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController____lazy_storage___emptyStateLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController__hasSeenSharedListeningQueueItemRemoveAlert);
  swift_bridgeObjectRelease();

  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_onEndContextMenuInteraction);

  sub_10006ADFC(v4);
}

- (_TtC5Music29NowPlayingQueueViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002BFED4();
}

- (void)viewDidLoad
{
  uint64_t v2 = self;
  sub_10029E034();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NowPlayingQueueViewController(0);
  uint64_t v4 = v6.receiver;
  [(NowPlayingQueueViewController *)&v6 viewDidAppear:v3];
  uint64_t v5 = OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_didAppearOnce;
  if ((v4[OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_didAppearOnce] & 1) == 0)
  {
    v4[OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_currentSection] = 3;
    v4[v5] = 1;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NowPlayingQueueViewController(0);
  uint64_t v4 = (char *)v5.receiver;
  [(NowPlayingQueueViewController *)&v5 viewDidDisappear:v3];
  if (objc_msgSend(v4, "isBeingDismissed", v5.receiver, v5.super_class)) {
    [*(id *)&v4[OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_historyRequestController] endAutomaticResponseLoading];
  }
}

- (void)viewLayoutMarginsDidChange
{
  uint64_t v2 = self;
  sub_1002A1E94();
}

- (void)viewSafeAreaInsetsDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for NowPlayingQueueViewController(0);
  id v2 = v7.receiver;
  [(NowPlayingQueueViewController *)&v7 viewSafeAreaInsetsDidChange];
  id v3 = sub_10029B1E4();
  [v3 contentSize];
  double v5 = v4;

  sub_1002A3F3C(0, v6, v5);
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_1002A243C();
}

- (void)handleLongPress:(id)a3
{
  id v5 = a3;
  double v4 = self;
  sub_1002A2CAC(v5);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  v8 = self;
  [v4 setDecelerationRate:UIScrollViewDecelerationRateNormal];
  [v4 contentOffset];
  id v5 = (Class *)((char *)&v8->super.super.super.isa
               + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_initialDraggingOffset);
  *id v5 = v6;
  v5[1] = v7;
  *((unsigned char *)&v8->super.super.super.isa + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_shouldPlayHapticFeedback) = 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_1002A3160(v5);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  id v10 = a3;
  v8 = self;
  sub_1002A3748(v10, &a5->x, v9, y);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (_TtC5Music29NowPlayingQueueViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Music29NowPlayingQueueViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)configureCell:(id)a3 forSong:(id)a4
{
  uint64_t v6 = (char *)a3;
  id v7 = a4;
  v8 = self;
  sub_1002C1488(v6, v7);
}

- (void)configureCell:(id)a3 forMovie:(id)a4
{
  uint64_t v6 = (char *)a3;
  id v7 = a4;
  v8 = self;
  sub_1002C15D0(v6, v7);
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
  v14 = self;
  sub_1002C16C4(v13, v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9 = type metadata accessor for IndexPath();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = self;
  sub_1002C1FBC(v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  uint64_t v8 = self;
  double v9 = sub_1002B7070(x, y);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  v26 = self;
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  double v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  double v13 = (char *)&v25 - v12;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v25 - v15;
  __chkstk_darwin(v17);
  v19 = (char *)&v25 - v18;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v20 = a3;
  v21 = v26;
  sub_1002B71CC((uint64_t)v16, (uint64_t)v10, v19);

  v22 = *(void (**)(char *, uint64_t))(v8 + 8);
  v22(v10, v7);
  v22(v13, v7);
  v22(v16, v7);
  v23.super.isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v22(v19, v7);

  return v23.super.isa;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_1002B7CC4(v10);
  LOBYTE(self) = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (unsigned int (**)(id, uint64_t, uint64_t))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_1002B8018((uint64_t)v10, v9);

  (*(void (**)(unsigned int (**)(id, uint64_t, uint64_t), uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = self;
  sub_1002C2260(v9, a5);

  swift_unknownObjectRelease();
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  uint64_t v12 = self;
  sub_1002C25D4((uint64_t)v10);
  uint64_t v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v14;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1002BC6C8(v6, v7);
  id v10 = v9;

  return v10;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v4 = [(NowPlayingQueueViewController *)self collectionView:a3 previewForHighlightingContextMenuWithConfiguration:a4];

  return v4;
}

- (id)_collectionView:(id)a3 indexPathOfReferenceItemToPreserveContentOffsetWithProposedReference:(id)a4
{
  uint64_t v5 = sub_100063814((uint64_t *)&unk_10109B9F0);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  id v10 = (char *)&v15 - v9;
  if (a4)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = type metadata accessor for IndexPath();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 0, 1, v11);
  }
  else
  {
    uint64_t v11 = type metadata accessor for IndexPath();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
  }
  type metadata accessor for IndexPath();
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  sub_1000637B8((uint64_t)v7, (uint64_t *)&unk_10109B9F0);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
  {
    Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  }

  return isa;
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  uint64_t v7 = sub_100063814(&qword_10109BA40);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  type metadata accessor for MainActor();
  id v13 = a3;
  uint64_t v14 = self;
  id v15 = v13;
  swift_retain();
  uint64_t v16 = static MainActor.shared.getter();
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v16;
  v17[3] = &protocol witness table for MainActor;
  v17[4] = v14;
  v17[5] = sub_100224CC4;
  v17[6] = v11;
  v17[7] = v15;
  sub_100066A3C((uint64_t)v9, (uint64_t)&unk_1010A1F60, (uint64_t)v17);

  swift_release();
  swift_release();
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  uint64_t v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_onEndContextMenuInteraction);
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_onEndContextMenuInteraction);
  *uint64_t v5 = 0;
  v5[1] = 0;
  sub_10006ADFC(v6);
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  if (a5)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = self;
    v14[4] = sub_1002BFA48;
    v14[5] = v9;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 1107296256;
    v14[2] = sub_100020238;
    v14[3] = &unk_100FD1E00;
    id v10 = _Block_copy(v14);
    uint64_t v11 = self;
    id v12 = a3;
    id v13 = a4;
    swift_unknownObjectRetain();
    swift_release();
    [a5 addCompletion:v10];
    _Block_release(v10);

    swift_unknownObjectRelease();
  }
}

@end