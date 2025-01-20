@interface NowPlayingViewController
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4;
- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC12NowPlayingUI24NowPlayingViewController)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI24NowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForHeaderInSection:(int64_t)a5;
- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForRowAtIndexPath:(id)a5;
- (id)accessibilityCollectionView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)collectionView:(id)a3 tableLayout:(id)a4 trailingSwipeActionsForRowAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)collectionView:(id)a3 tableLayout:(id)a4 editingStyleForRowAtIndexPath:(id)a5;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)configureCell:(id)a3 forMovie:(id)a4;
- (void)configureCell:(id)a3 forPodcastEpisode:(id)a4;
- (void)configureCell:(id)a3 forSong:(id)a4;
- (void)configureCell:(id)a3 forTVEpisode:(id)a4;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)dealloc;
- (void)dismissTapGestureRecognizerFired;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NowPlayingViewController

- (_TtC12NowPlayingUI24NowPlayingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_78864();
}

- (void)dealloc
{
  v2 = self;
  sub_6BC20();
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_metrics);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_configuration);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_controlsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_descriptionTextViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_showNotesTextViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_chapterResultsController);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_dismissalTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_playerRequestController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController____lazy_storage___prototypeShowNotesController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_episodeTextInfoProvider);
  sub_1A41C((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_episodeTextInfoDetail, &qword_19FC88);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_descriptionHeaderSizingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_showNotesHeaderSizingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_queueHeaderSizingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_chapterHeaderSizingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController__systemPodcastsResponse));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_scrollingTipView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_scrollingTipDimmingView);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_6BFD4();
}

- (void)dismissTapGestureRecognizerFired
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_6D050(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_6D954(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_6E170(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_6E320();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_6F578(v4);
}

- (_TtC12NowPlayingUI24NowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NowPlayingUI24NowPlayingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)collectionView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4
{
  return 1;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = sub_126C50();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_126BD0();
  id v11 = a3;
  swift_unknownObjectRetain();
  v12 = self;
  sub_78B58((uint64_t)v10);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_E67C(0, &qword_19FCD8);
  v13.super.isa = sub_129AA0().super.isa;
  swift_bridgeObjectRelease();

  return v13.super.isa;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  v6 = (char *)a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_715F4(v6, (unint64_t)a4);

  swift_unknownObjectRelease();
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_19FCB0);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_126BD0();
    uint64_t v12 = sub_126C50();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_126C50();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a3;
  swift_unknownObjectRetain();
  uint64_t v15 = self;
  sub_78F48(a4, (uint64_t)v11);
  v17 = v16;

  swift_unknownObjectRelease();
  sub_1A41C((uint64_t)v11, &qword_19FCB0);

  return v17;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = self;
  id v5 = a3;
  uint64_t v6 = swift_bridgeObjectRetain();
  uint64_t v7 = sub_8CB04(v6, (uint64_t)v4);
  swift_bridgeObjectRelease();
  int64_t v8 = *(void *)(v7 + 16);

  swift_bridgeObjectRelease();
  return v8;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  int64_t v8 = sub_793FC(a4);

  return v8;
}

- (void)configureCell:(id)a3 forPodcastEpisode:(id)a4
{
  id v6 = (char *)a3;
  id v7 = a4;
  int64_t v8 = self;
  sub_721D8(v6, v7);
}

- (void)configureCell:(id)a3 forSong:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = self;
  sub_79A58((uint64_t)v6, v7);
}

- (void)configureCell:(id)a3 forTVEpisode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = self;
  sub_79C68((uint64_t)v6, v7);
}

- (void)configureCell:(id)a3 forMovie:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = self;
  sub_79E0C((uint64_t)v6, v7);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_126C50();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_126BD0();
  uint64_t v10 = (char *)a3;
  id v11 = self;
  uint64_t v12 = sub_727E4(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_126C50();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_126BD0();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_7A110(v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v7 = sub_126C50();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  id v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v22 - v13;
  __chkstk_darwin(v12);
  v16 = (char *)&v22 - v15;
  sub_126BD0();
  sub_126BD0();
  id v17 = a3;
  v18 = self;
  sub_7446C((uint64_t)v14, (uint64_t)v11, (uint64_t)v16);

  uint64_t v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v11, v7);
  v19(v14, v7);
  v20.super.isa = sub_126BC0().super.isa;
  v19(v16, v7);

  return v20.super.isa;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_126C50();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_126BD0();
  id v10 = a3;
  id v11 = self;
  LOBYTE(self) = sub_7A030((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  uint64_t v7 = sub_126C50();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  id v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v17 - v12;
  sub_126BD0();
  sub_126BD0();
  id v14 = a3;
  uint64_t v15 = self;
  sub_78C40((uint64_t)v13);

  v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v11, v7);
  v16(v13, v7);
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = sub_126C50();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1299F0();
  sub_126BD0();
  id v11 = a3;
  uint64_t v12 = self;
  uint64_t v13 = sub_74CC0(v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_126C50();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_126BD0();
  id v10 = a3;
  id v11 = self;
  sub_753B4(v10, v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForHeaderInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  double v11 = sub_7A260(v8, a5);

  return v11;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_126C50();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  double v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_126BD0();
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  double v15 = sub_7A924(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v15;
}

- (int64_t)collectionView:(id)a3 tableLayout:(id)a4 editingStyleForRowAtIndexPath:(id)a5
{
  uint64_t v5 = sub_126C50();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_126BD0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 0;
}

- (id)collectionView:(id)a3 tableLayout:(id)a4 trailingSwipeActionsForRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_126C50();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  double v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_126BD0();
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  double v15 = sub_7AF24((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (v15)
  {
    sub_E67C(0, &qword_19FCA8);
    v16.super.isa = sub_129AA0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v16.super.isa = 0;
  }

  return v16.super.isa;
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_76354(v8, (uint64_t)sub_2744C, v7);

  swift_release();
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  unsigned __int8 v9 = sub_7B16C(v6);

  return v9 & 1;
}

- (id)accessibilityCollectionView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_collectionView));
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  unsigned __int8 v9 = sub_7B2BC(v7);

  return v9 & 1;
}

@end