@interface MusicMessagesSharingViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_TtC16MusicMessagesApp34MusicMessagesSharingViewController)initWithCoder:(id)a3;
- (_TtC16MusicMessagesApp34MusicMessagesSharingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)dealloc;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MusicMessagesSharingViewController

- (_TtC16MusicMessagesApp34MusicMessagesSharingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100483E10();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC16MusicMessagesApp34MusicMessagesSharingViewController *)sub_10000C054(v5, v7, a4);
}

- (_TtC16MusicMessagesApp34MusicMessagesSharingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100010EA4();
}

- (void)dealloc
{
  v2 = self;
  sub_10000C5F8();
}

- (void).cxx_destruct
{
  sub_100013294((uint64_t)self + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__contextMenuInteraction));
  swift_release();
  sub_1000130E4((uint64_t)self+ OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__previewedItemIndexToIgnoreForNextSelect, &qword_10059F5D8);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__collectionFlowLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__mediaLibraryQueue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__nowPlayingObserverToken));
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10000C860();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_10000CC74((uint64_t)a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10000CDE0();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MusicMessagesSharingViewController();
  id v4 = v5.receiver;
  [(MusicMessagesSharingViewController *)&v5 viewWillAppear:v3];
  sub_10000E754();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_10000D000(a3, (SEL *)&selRef_viewWillDisappear_);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_10000D000(a3, (SEL *)&selRef_viewDidDisappear_);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for MusicMessagesSharingViewController();
  swift_unknownObjectRetain();
  id v7 = v12.receiver;
  -[MusicMessagesSharingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  v11[4] = sub_10001323C;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10000D1AC;
  v11[3] = &unk_10054EE68;
  v9 = _Block_copy(v11);
  id v10 = v7;
  swift_release();
  [a4 animateAlongsideTransition:v9 completion:0];
  _Block_release(v9);
  swift_unknownObjectRelease();
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v6 = OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__sharableTracks;
  unint64_t v7 = *(unint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__sharableTracks);
  if (!(v7 >> 62))
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v9 = a3;
    id v10 = self;
    if (v8 >= 1) {
      goto LABEL_3;
    }
LABEL_6:

    return 1;
  }
  id v13 = a3;
  v14 = self;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_100485610();
  swift_bridgeObjectRelease();
  if (v15 < 1) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v11 = *(unint64_t *)((char *)&self->super.super.super.isa + v6);
  if (!(v11 >> 62))
  {
    int64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);

    return v12;
  }
  swift_bridgeObjectRetain();
  int64_t v17 = sub_100485610();

  swift_bridgeObjectRelease();
  return v17;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_10047F5E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10047F580();
  id v10 = a3;
  unint64_t v11 = self;
  sub_10000D450((uint64_t)v10, (uint64_t)v9);
  id v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = sub_10047F5E0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10047F580();
  id v11 = a3;
  int64_t v12 = self;
  id v13 = (void *)sub_10001126C((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v5 = sub_10047F5E0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10047F580();
  BOOL v9 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__activePreviewingTrack) == 0;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v9;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_10047F5E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  BOOL v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10047F580();
  id v10 = a3;
  uint64_t v11 = self;
  LOBYTE(self) = sub_100011438();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_10047F5E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  BOOL v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10047F580();
  id v10 = a3;
  uint64_t v11 = self;
  sub_1000116A0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_10047F5E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10047F580();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  double v15 = sub_1000118DC(v12);
  double v17 = v16;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v18 = v15;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  double v10 = sub_100011BA0(v7);
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = *(double *)&qword_1005A02C0;
  double v6 = 0.0;
  double v7 = *(double *)&qword_1005A02C0;
  double v8 = *(double *)&qword_1005A02C0;
  result.right = v8;
  result.bottom = v7;
  result.left = v5;
  result.top = v6;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 10.0;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  id v9 = sub_100011DA8(v6);

  return v9;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double v8 = self;
  id v9 = sub_10001200C(x, y);

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
}

@end