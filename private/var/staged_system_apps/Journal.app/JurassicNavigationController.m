@interface JurassicNavigationController
- (BOOL)prefersStatusBarHidden;
- (UIViewController)childViewControllerForStatusBarHidden;
- (_TtC7Journal28JurassicNavigationController)initWithCoder:(id)a3;
- (_TtC7Journal28JurassicNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC7Journal28JurassicNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Journal28JurassicNavigationController)initWithRootViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation JurassicNavigationController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JurassicNavigationController();
  id v2 = v5.receiver;
  [(JurassicNavigationController *)&v5 viewDidLoad];
  id v3 = [v2 navigationBar];
  id v4 = [self systemIndigoColor];
  [v3 setTintColor:v4];
}

- (UIViewController)childViewControllerForStatusBarHidden
{
  id v2 = [(JurassicNavigationController *)self topViewController];

  return (UIViewController *)v2;
}

- (BOOL)prefersStatusBarHidden
{
  id v2 = self;
  id v3 = (_TtC7Journal28JurassicNavigationController *)[(JurassicNavigationController *)v2 topViewController];
  if (v3)
  {
    id v4 = v3;
    unsigned __int8 v5 = [(JurassicNavigationController *)v3 prefersStatusBarHidden];

    id v2 = v4;
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (_TtC7Journal28JurassicNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for JurassicNavigationController();
  return [(JurassicNavigationController *)&v7 initWithNavigationBarClass:a3 toolbarClass:a4];
}

- (_TtC7Journal28JurassicNavigationController)initWithRootViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JurassicNavigationController();
  return [(JurassicNavigationController *)&v5 initWithRootViewController:a3];
}

- (_TtC7Journal28JurassicNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for JurassicNavigationController();
  v9 = [(JurassicNavigationController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC7Journal28JurassicNavigationController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JurassicNavigationController();
  return [(JurassicNavigationController *)&v5 initWithCoder:a3];
}

@end