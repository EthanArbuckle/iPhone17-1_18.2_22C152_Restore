@interface MiniPlayerHostViewController
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC23ShelfKitCollectionViews28MiniPlayerHostViewController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews28MiniPlayerHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation MiniPlayerHostViewController

- (_TtC23ShelfKitCollectionViews28MiniPlayerHostViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_29F168();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(MiniPlayerHostViewController *)&v3 viewDidLoad];
  sub_29E15C();
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  MiniPlayerHostViewController.viewDidLayoutSubviews()();
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  id v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC23ShelfKitCollectionViews28MiniPlayerHostViewController_contentViewController);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (_TtC23ShelfKitCollectionViews28MiniPlayerHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC23ShelfKitCollectionViews28MiniPlayerHostViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews28MiniPlayerHostViewController_miniPlayerViewController));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews28MiniPlayerHostViewController_contentViewController);
}

@end