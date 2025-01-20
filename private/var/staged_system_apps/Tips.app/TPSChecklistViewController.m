@interface TPSChecklistViewController
- (TPSChecklistViewController)initWithCoder:(id)a3;
- (TPSChecklistViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TPSChecklistViewController)initWithViewModel:(id)a3;
- (TPSChecklistViewModel)viewModel;
- (UIViewController)hostingController;
- (id)currentCollection;
- (void)loadView;
- (void)setHostingController:(id)a3;
- (void)setPreferredViewMethod:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TPSChecklistViewController

- (TPSChecklistViewModel)viewModel
{
  return (TPSChecklistViewModel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                          + OBJC_IVAR___TPSChecklistViewController_viewModel));
}

- (UIViewController)hostingController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                     + OBJC_IVAR___TPSChecklistViewController_hostingController));
}

- (void)setHostingController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___TPSChecklistViewController_hostingController);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___TPSChecklistViewController_hostingController) = (Class)a3;
  id v3 = a3;
}

- (TPSChecklistViewController)initWithViewModel:(id)a3
{
  id v3 = a3;
  id v4 = (TPSChecklistViewController *)sub_100057228(v3);

  return v4;
}

- (TPSChecklistViewController)initWithCoder:(id)a3
{
  return (TPSChecklistViewController *)sub_100056508(a3);
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
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = self;
  static Published.subscript.getter();

  swift_release();
  swift_release();

  return v5;
}

- (void)loadView
{
  v2 = self;
  sub_100056864();
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ChecklistViewController();
  v2 = (char *)v4.receiver;
  [(TPSViewController *)&v4 viewDidLoad];
  id v3 = [v2 navigationItem];
  [v3 setLargeTitleDisplayMode:2];

  *(void *)(*(void *)&v2[OBJC_IVAR___TPSChecklistViewController_viewModel]
            + OBJC_IVAR___TPSChecklistViewModel_currentDisplayTips) = 0;

  swift_bridgeObjectRelease();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ChecklistViewController();
  id v4 = v9.receiver;
  [(TipsTOCViewController *)&v9 viewWillAppear:v3];
  id v5 = [v4 navigationController];
  if (v5)
  {
    v6 = v5;
    id v7 = [v5 navigationBar];

    id v8 = [self tintColor];
    [v7 setTintColor:v8];

    id v4 = v8;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_100056DB8(a3);
}

- (TPSChecklistViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (TPSChecklistViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___TPSChecklistViewController_viewModel));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___TPSChecklistViewController_hostingController);
}

@end