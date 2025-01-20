@interface Interstellar.ViewController
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (NSData)playActivityRecommendationData;
- (_TtCO16MusicApplication12Interstellar14ViewController)initWithCoder:(id)a3;
- (_TtCO16MusicApplication12Interstellar14ViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation Interstellar.ViewController

- (_TtCO16MusicApplication12Interstellar14ViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2BE93C();
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)_s14ViewControllerCMa();
  id v2 = v6.receiver;
  [(Interstellar.ViewController *)&v6 viewDidLayoutSubviews];
  id v3 = sub_2B865C();
  id v4 = [v2 view];
  if (v4)
  {
    v5 = v4;
    [v4 bounds];
    [v3 setFrame:];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_2B87A4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_2B9904((uint64_t)a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  sub_2B9AF4(v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_2B9F80(a3);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9 = sub_AB1110();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v16 = self;
  sub_2BA834(v13, v14, (unint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9 = sub_AB1110();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v16 = self;
  sub_2BC4FC();
  sub_4BD4E0((uint64_t)v12);

  swift_release();
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

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v11 = a3;
  id v12 = a4;
  id v13 = self;
  sub_2BB174();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  uint64_t v10 = self;
  sub_2BFA34(v9, a5);

  swift_unknownObjectRelease();
}

- (_TtCO16MusicApplication12Interstellar14ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtCO16MusicApplication12Interstellar14ViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO16MusicApplication12Interstellar14ViewController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO16MusicApplication12Interstellar14ViewController____lazy_storage___collectionViewLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO16MusicApplication12Interstellar14ViewController____lazy_storage___collectionView));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO16MusicApplication12Interstellar14ViewController_dataSource));
  swift_release();

  swift_release();
}

- (NSData)playActivityRecommendationData
{
  id v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCO16MusicApplication12Interstellar14ViewController_viewModel);
  if (v2
    && (BOOL v3 = *(uint64_t (**)(void))((char *)&stru_68.offset + (*v2 & swift_isaMask)),
        id v4 = self,
        id v5 = v2,
        uint64_t v6 = v3(),
        unint64_t v8 = v7,
        v4,
        v5,
        v8 >> 60 != 15))
  {
    Class isa = sub_AB09C0().super.isa;
    sub_4B654(v6, v8);
  }
  else
  {
    Class isa = 0;
  }

  return (NSData *)isa;
}

@end