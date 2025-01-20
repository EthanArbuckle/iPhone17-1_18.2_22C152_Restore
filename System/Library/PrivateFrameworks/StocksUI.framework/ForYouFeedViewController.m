@interface ForYouFeedViewController
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (_TtC8StocksUI24ForYouFeedViewController)initWithCoder:(id)a3;
- (_TtC8StocksUI24ForYouFeedViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)didMoveToParentViewController:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ForYouFeedViewController

- (_TtC8StocksUI24ForYouFeedViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A7E801C();
}

- (_TtC8StocksUI24ForYouFeedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8StocksUI24ForYouFeedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI24ForYouFeedViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24ForYouFeedViewController_blueprintViewController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24ForYouFeedViewController_cardViewScrollViewCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24ForYouFeedViewController_statusBarView));
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI24ForYouFeedViewController_keyboardInputMonitor);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI24ForYouFeedViewController_watchlistManager);

  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20A7E056C();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_20A7E1098(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = v6.receiver;
  [(ForYouFeedViewController *)&v6 viewDidAppear:v3];
  sub_20A7E5E1C((unint64_t *)&unk_26AC68100, v5, (void (*)(uint64_t))type metadata accessor for ForYouFeedViewController);
  sub_20A8C5B10();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = v6.receiver;
  [(ForYouFeedViewController *)&v6 viewWillDisappear:v3];
  swift_getObjectType();
  sub_20A8C90E0();
  v4[OBJC_IVAR____TtC8StocksUI24ForYouFeedViewController_toolbarTitleIsHidden] = 1;
  sub_20A7E5E1C((unint64_t *)&unk_26AC68100, v5, (void (*)(uint64_t))type metadata accessor for ForYouFeedViewController);
  sub_20A8C5B20();
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(ForYouFeedViewController *)&v15 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8StocksUI24ForYouFeedViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(v2, sel_view);
    if (v5)
    {
      objc_super v6 = v5;
      objc_msgSend(v5, sel_bounds);
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;

      objc_msgSend(v4, sel_setFrame_, v8, v10, v12, v14);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_20A7E178C((uint64_t)a3);
}

- (void)didMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(ForYouFeedViewController *)&v6 didMoveToParentViewController:v4];
  sub_20A8C7F20();
}

- (int64_t)preferredStatusBarStyle
{
  id v3 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedViewController_styler);
  swift_beginAccess();
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  objc_super v6 = __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v7 = *(void *)(v4 - 8);
  double v8 = MEMORY[0x270FA5388](v6);
  double v10 = (char *)&v16 - v9;
  (*(void (**)(char *, double))(v7 + 16))((char *)&v16 - v9, v8);
  uint64_t v11 = *(void *)(v5 + 16);
  double v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
  double v13 = self;
  int64_t v14 = v12(v4, v11);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v4);

  return v14;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_20A8C7F10();
  sub_20A7E1188();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  MEMORY[0x210520220](v4);
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_20A7E8108();

  return self & 1;
}

@end