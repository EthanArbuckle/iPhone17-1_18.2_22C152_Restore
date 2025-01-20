@interface StatusResponsiveNavigationController
- (_TtC7Journal36StatusResponsiveNavigationController)initWithCoder:(id)a3;
- (_TtC7Journal36StatusResponsiveNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC7Journal36StatusResponsiveNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Journal36StatusResponsiveNavigationController)initWithRootViewController:(id)a3;
- (int64_t)preferredStatusBarStyle;
@end

@implementation StatusResponsiveNavigationController

- (int64_t)preferredStatusBarStyle
{
  v2 = self;
  v3 = (_TtC7Journal36StatusResponsiveNavigationController *)[(StatusResponsiveNavigationController *)v2 topViewController];
  if (v3)
  {
    v4 = v3;
    int64_t v5 = [(StatusResponsiveNavigationController *)v3 preferredStatusBarStyle];

    v2 = v4;
  }
  else
  {
    int64_t v5 = 3;
  }

  return v5;
}

- (_TtC7Journal36StatusResponsiveNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for StatusResponsiveNavigationController();
  return [(StatusResponsiveNavigationController *)&v7 initWithNavigationBarClass:a3 toolbarClass:a4];
}

- (_TtC7Journal36StatusResponsiveNavigationController)initWithRootViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StatusResponsiveNavigationController();
  return [(StatusResponsiveNavigationController *)&v5 initWithRootViewController:a3];
}

- (_TtC7Journal36StatusResponsiveNavigationController)initWithNibName:(id)a3 bundle:(id)a4
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
  v11.super_class = (Class)type metadata accessor for StatusResponsiveNavigationController();
  v9 = [(StatusResponsiveNavigationController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC7Journal36StatusResponsiveNavigationController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StatusResponsiveNavigationController();
  return [(StatusResponsiveNavigationController *)&v5 initWithCoder:a3];
}

@end