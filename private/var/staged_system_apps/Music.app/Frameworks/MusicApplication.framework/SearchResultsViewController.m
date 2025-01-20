@interface SearchResultsViewController
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (_TtC16MusicApplication27SearchResultsViewController)init;
- (_TtC16MusicApplication27SearchResultsViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication27SearchResultsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SearchResultsViewController

- (_TtC16MusicApplication27SearchResultsViewController)init
{
  return (_TtC16MusicApplication27SearchResultsViewController *)sub_37D698();
}

- (_TtC16MusicApplication27SearchResultsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_38C8A8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_37DA34();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_37EF74(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SearchResultsViewController();
  id v4 = v5.receiver;
  [(SearchResultsViewController *)&v5 viewWillDisappear:v3];
  sub_383CD8();
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_37F360(a3);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchResultsViewController();
  id v2 = v3.receiver;
  [(SearchResultsViewController *)&v3 viewDidLayoutSubviews];
  sub_3837BC();
  sub_3E3B08();

  swift_release();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_37F738(a3);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  char v14 = UICollectionView.isDraggingCell(at:)();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (v14 & 1) == 0;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  sub_38CBDC((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
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
  sub_38CEC0(v14, (unint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
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
  sub_381844();
  sub_4BD508((uint64_t)v12);

  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (_TtC16MusicApplication27SearchResultsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication27SearchResultsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_onDidSelectItem));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_onContextMenuPresentation));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_onAddKeepLocalControl));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_onPageRenderFinish));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_contextActionsModelLoadingHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_onDragSessionStart));
  swift_release();
  sub_38D4CC((uint64_t)self + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController__frozenResults, type metadata accessor for Search.ResultContext);
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController__unfrozenResults, &qword_DD70D0);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_componentController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController____lazy_storage___dateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController____lazy_storage___playabilityController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController____lazy_storage___loadingView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_collectionView));

  swift_release();
}

@end