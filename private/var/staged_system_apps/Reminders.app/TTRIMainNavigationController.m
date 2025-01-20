@interface TTRIMainNavigationController
- (_TtC9Reminders28TTRIMainNavigationController)initWithCoder:(id)a3;
- (_TtC9Reminders28TTRIMainNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC9Reminders28TTRIMainNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9Reminders28TTRIMainNavigationController)initWithRootViewController:(id)a3;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation TTRIMainNavigationController

- (_TtC9Reminders28TTRIMainNavigationController)initWithRootViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(TTRIMainNavigationController *)&v5 initWithRootViewController:a3];
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_10000C13C((uint64_t)v6, a4);
}

- (_TtC9Reminders28TTRIMainNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(TTRIMainNavigationController *)&v7 initWithNavigationBarClass:a3 toolbarClass:a4];
}

- (_TtC9Reminders28TTRIMainNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v8 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(TTRIMainNavigationController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC9Reminders28TTRIMainNavigationController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(TTRIMainNavigationController *)&v5 initWithCoder:a3];
}

@end