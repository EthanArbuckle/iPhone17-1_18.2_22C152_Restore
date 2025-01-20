@interface MetricsPageViewController
- (_TtC8ShelfKit25MetricsPageViewController)initWithCoder:(id)a3;
- (_TtC8ShelfKit25MetricsPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation MetricsPageViewController

- (_TtC8ShelfKit25MetricsPageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_3D8BC0(27);
  swift_bridgeObjectRelease();
  result = (_TtC8ShelfKit25MetricsPageViewController *)sub_3D8D60();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  MetricsPageViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  MetricsPageViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  MetricsPageViewController.viewDidAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  MetricsPageViewController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(MetricsPageViewController *)&v4 viewDidDisappear:v3];
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(MetricsPageViewController *)&v15 viewWillLayoutSubviews];
  id v3 = [v2[OBJC_IVAR____TtC8ShelfKit25MetricsPageViewController_viewController] view];
  if (v3)
  {
    objc_super v4 = v3;
    id v5 = [v2 view];
    if (v5)
    {
      v6 = v5;
      [v5 bounds];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;

      [v4 setFrame:v8, v10, v12, v14];
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (_TtC8ShelfKit25MetricsPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8ShelfKit25MetricsPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8ShelfKit25MetricsPageViewController_viewController);
}

@end