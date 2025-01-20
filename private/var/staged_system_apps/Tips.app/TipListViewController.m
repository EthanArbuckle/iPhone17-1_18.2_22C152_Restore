@interface TipListViewController
- (TipListViewController)initWithCoder:(id)a3;
- (TipListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TipListViewController)initWithViewModel:(id)a3;
- (TipListViewModel)viewModel;
- (UIViewController)hostingController;
- (id)currentCollection;
- (int64_t)preferredStatusBarStyle;
- (void)loadView;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)runTest:(id)a3 options:(id)a4;
- (void)setPreferredViewMethod:(id)a3;
- (void)setViewModel:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TipListViewController

- (TipListViewController)initWithViewModel:(id)a3
{
  id v4 = a3;
  v5 = (TipListViewController *)sub_100005E24(a3);

  return v5;
}

- (TipListViewModel)viewModel
{
  return (TipListViewModel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                     + OBJC_IVAR___TipListViewController_viewModel));
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100004DE0();
}

- (void)loadView
{
  v2 = self;
  sub_10000ABB0();
}

- (void)setViewModel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___TipListViewController_viewModel);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___TipListViewController_viewModel) = (Class)a3;
  id v3 = a3;
}

- (UIViewController)hostingController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                     + OBJC_IVAR___TipListViewController_hostingController));
}

- (TipListViewController)initWithCoder:(id)a3
{
  return (TipListViewController *)sub_10005EAEC(a3);
}

- (void)setPreferredViewMethod:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC4Tips21TipsTOCViewController_preferredViewMethod);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Tips21TipsTOCViewController_preferredViewMethod) = (Class)a3;
  id v3 = a3;
}

- (id)currentCollection
{
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___TipListViewController_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = self;
  id v5 = v3;
  static Published.subscript.getter();

  swift_release();
  swift_release();

  return v7;
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10005EDD0();
}

- (int64_t)preferredStatusBarStyle
{
  v2 = self;
  int64_t v3 = sub_10005EF80();

  return v3;
}

- (TipListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (TipListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___TipListViewController_viewModel));
  int64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___TipListViewController_hostingController);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  sub_1000067A4(0, &qword_1000C9870);
  sub_10005F46C();
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a4;
  v8 = self;
  sub_10005F19C(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)runTest:(id)a3 options:(id)a4
{
}

@end