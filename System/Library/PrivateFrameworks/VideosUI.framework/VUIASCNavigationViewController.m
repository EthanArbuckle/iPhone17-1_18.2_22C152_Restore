@interface VUIASCNavigationViewController
- (VUIASCNavigationViewController)initWithCoder:(id)a3;
- (VUIASCNavigationViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (VUIASCNavigationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VUIASCNavigationViewController)initWithRootViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation VUIASCNavigationViewController

- (VUIASCNavigationViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E32DC504();
}

- (void)viewDidLoad
{
  v2 = self;
  ASCNavigationViewController.viewDidLoad()();
}

- (VUIASCNavigationViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
}

- (VUIASCNavigationViewController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  ASCNavigationViewController.init(rootViewController:)();
}

- (VUIASCNavigationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  ASCNavigationViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___VUIASCNavigationViewController_onFlowComplete));
}

@end