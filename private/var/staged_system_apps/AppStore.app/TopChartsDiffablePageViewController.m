@interface TopChartsDiffablePageViewController
- (_TtC8AppStore35TopChartsDiffablePageViewController)initWithCoder:(id)a3;
- (_TtC8AppStore35TopChartsDiffablePageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)showCategoriesFor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TopChartsDiffablePageViewController

- (_TtC8AppStore35TopChartsDiffablePageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002788F8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10027497C();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TopChartsDiffablePageViewController();
  v4 = v6.receiver;
  [(TopChartsDiffablePageViewController *)&v6 viewWillAppear:v3];
  uint64_t v5 = OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_isPresenterLoaded;
  if ((v4[OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_isPresenterLoaded] & 1) == 0)
  {
    dispatch thunk of TimedMetricsPagePresenter.didLoad()();
    v4[v5] = 1;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TopChartsDiffablePageViewController();
  id v4 = v5.receiver;
  [(TopChartsDiffablePageViewController *)&v5 viewDidAppear:v3];
  TopChartsDiffablePagePresenter.viewDidAppear()();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = type metadata accessor for ViewWillDisappearReason();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for TopChartsDiffablePageViewController();
  v11.receiver = self;
  v11.super_class = v9;
  v10 = self;
  [(TopChartsDiffablePageViewController *)&v11 viewWillDisappear:v3];
  static ViewWillDisappearReason.inferred(for:)();
  TopChartsDiffablePagePresenter.viewWillDisappear(forReason:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_10027572C();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(TopChartsDiffablePageViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TopChartsDiffablePageViewController();
  id v4 = v8.receiver;
  id v5 = [(TopChartsDiffablePageViewController *)&v8 contentScrollViewForEdge:a3];
  if (!v5)
  {
    id v6 = objc_allocWithZone((Class)UIScrollView);
    id v5 = [v6 init];
  }

  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TopChartsDiffablePageViewController();
  id v4 = a3;
  id v5 = v6.receiver;
  [(TopChartsDiffablePageViewController *)&v6 traitCollectionDidChange:v4];
  if (objc_msgSend(v5, "isViewLoaded", v6.receiver, v6.super_class)) {
    sub_100274FF0(0, 0, 1);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  objc_super v8 = self;
  sub_100275A08(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)showCategoriesFor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100279BAC();
}

- (_TtC8AppStore35TopChartsDiffablePageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8AppStore35TopChartsDiffablePageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_paletteContents));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_categoriesBarButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_overlayViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_selectCategoryViewController);
}

@end