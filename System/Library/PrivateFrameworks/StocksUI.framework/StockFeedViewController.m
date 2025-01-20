@interface StockFeedViewController
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (_TtC8StocksUI23StockFeedViewController)initWithCoder:(id)a3;
- (_TtC8StocksUI23StockFeedViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)didMoveToParentViewController:(id)a3;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation StockFeedViewController

- (_TtC8StocksUI23StockFeedViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A58D734();
}

- (_TtC8StocksUI23StockFeedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8StocksUI23StockFeedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_blueprintViewController));
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_sceneProvider);
  swift_release();
  id v3 = (char *)self + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_stock;
  uint64_t v4 = sub_20A8C3F00();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_cardViewScrollViewCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_statusBarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_stockFeedTitleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_overlayView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_keyboardInputMonitor);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  sub_20A58BA28((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_latestQuote, (uint64_t (*)(void))sub_20A42C470);
  sub_20A58BA28((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_earnings, (uint64_t (*)(void))sub_20A4C7C24);

  swift_unknownObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20A583D4C();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_20A585428(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_20A585688(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(StockFeedViewController *)&v5 viewWillDisappear:v3];
  sub_20A5857CC();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_20A585928();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_20A585AC4((uint64_t)a3);
}

- (int64_t)preferredStatusBarStyle
{
  BOOL v3 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_styler);
  swift_beginAccess();
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  v6 = __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v7 = *(void *)(v4 - 8);
  double v8 = MEMORY[0x270FA5388](v6);
  v10 = (char *)&v16 - v9;
  (*(void (**)(char *, double))(v7 + 16))((char *)&v16 - v9, v8);
  uint64_t v11 = *(void *)(v5 + 16);
  v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
  v13 = self;
  int64_t v14 = v12(v4, v11);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v4);

  return v14;
}

- (void)didMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(StockFeedViewController *)&v6 didMoveToParentViewController:v4];
  sub_20A8C7F20();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_20A588640(v4);
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_20A58D900();

  return self & 1;
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_20A58ACD0(v6, a4);
}

@end