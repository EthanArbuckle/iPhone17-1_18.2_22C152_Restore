@interface SongsViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (_TtC16MusicApplication19SongsViewController)init;
- (_TtC16MusicApplication19SongsViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication19SongsViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC16MusicApplication19SongsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_collectionView:(id)a3 indexPathForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (id)_sectionIndexTitlesForCollectionView:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SongsViewController

- (_TtC16MusicApplication19SongsViewController)init
{
  return (_TtC16MusicApplication19SongsViewController *)sub_23C62C();
}

- (_TtC16MusicApplication19SongsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2442F4();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = type metadata accessor for MetricsEvent.Page(0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for SongsViewController();
  v12.receiver = self;
  v12.super_class = v8;
  v9 = self;
  [(SongsViewController *)&v12 viewDidAppear:v3];
  v10 = (id)*MetricsReportingController.shared.unsafeMutableAddressor();
  uint64_t v11 = MetricsEvent.Page.librarySongsList.unsafeMutableAddressor();
  sub_2450EC(v11, (uint64_t)v7, type metadata accessor for MetricsEvent.Page);
  (*(void (**)(char *, void, void, void, void, void))((char *)&stru_68.reloff
                                                                         + (swift_isaMask & *v10)))(v7, 0, 0, 0, 0, 0);
  sub_245154((uint64_t)v7, type metadata accessor for MetricsEvent.Page);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23E620();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_23FC30(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for SongsViewController();
  swift_unknownObjectRetain();
  id v7 = v12.receiver;
  -[SongsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  v11[4] = sub_245030;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_DCCD8;
  v11[3] = &block_descriptor_64;
  v9 = _Block_copy(v11);
  id v10 = v7;
  swift_release();
  [a4 animateAlongsideTransition:v9 completion:0];
  _Block_release(v9);
  swift_unknownObjectRelease();
}

- (void)viewDidLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SongsViewController();
  id v2 = v9.receiver;
  [(SongsViewController *)&v9 viewDidLayoutSubviews];
  id v3 = [v2 view];
  if (v3)
  {
    v4 = v3;
    [v3 bounds];
    sub_240548(v5, v6, v7, v8);
  }
  else
  {
    __break(1u);
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_2444C4();
  int64_t v7 = v6;

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = self;
  sub_244558(a4);
  int64_t v9 = v8;

  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  sub_24077C((uint64_t)v11, (uint64_t)v10);
  v15 = v14;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v15;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9 = sub_AB1110();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_AB6510();
  v15 = v14;
  sub_AB1080();
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  v19 = self;
  sub_240F74((uint64_t)v16, v13, v15, (uint64_t)v12);
  v21 = v20;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_bridgeObjectRelease();

  return v21;
}

- (id)_sectionIndexTitlesForCollectionView:(id)a3
{
  id v4 = self;
  id v5 = a3;
  id v6 = sub_244604();

  if (v6)
  {
    v7.super.isa = sub_AB6990().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }

  return v7.super.isa;
}

- (id)_collectionView:(id)a3 indexPathForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_DC0F70);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_AB6510();
    a4 = v12;
  }
  id v13 = a3;
  v14 = self;
  sub_241E38((uint64_t)a4, a5, (uint64_t)v11);

  swift_bridgeObjectRelease();
  uint64_t v15 = sub_AB1110();
  uint64_t v16 = *(void *)(v15 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v11, 1, v15) != 1)
  {
    Class isa = sub_AB1060().super.isa;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v15);
  }

  return isa;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  uint64_t v10 = self;
  sub_244678(v9, a5);

  swift_unknownObjectRelease();
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9 = sub_AB1110();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = self;
  sub_2449C0(v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v11 = a3;
  id v12 = a4;
  id v13 = self;
  char v14 = UICollectionView.isDraggingCell(at:)();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (v14 & 1) == 0;
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v11 = a3;
  id v12 = a4;
  id v13 = self;
  Class isa = sub_AB1060().super.isa;
  unsigned __int8 v15 = [(SongsViewController *)v13 collectionView:v11 shouldSelectItemAtIndexPath:isa];

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v11 = a3;
  id v12 = a4;
  id v13 = self;
  sub_242960(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC16MusicApplication19SongsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC16MusicApplication19SongsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16MusicApplication19SongsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication19SongsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19SongsViewController_filterOptionsController));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication19SongsViewController_artworkPrefetchingController);
}

@end