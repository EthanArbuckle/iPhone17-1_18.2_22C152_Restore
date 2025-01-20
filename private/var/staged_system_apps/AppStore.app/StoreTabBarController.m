@interface StoreTabBarController
- (NSArray)keyCommands;
- (_TtC8AppStore21StoreTabBarController)init;
- (_TtC8AppStore21StoreTabBarController)initWithCoder:(id)a3;
- (_TtC8AppStore21StoreTabBarController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8AppStore21StoreTabBarController)initWithTabs:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)accountPageViewControllerDidFinish:(id)a3;
- (void)handleSearchKeyCommandWithCommand:(id)a3;
- (void)handleTabSwitchKeyCommandWithCommand:(id)a3;
@end

@implementation StoreTabBarController

- (_TtC8AppStore21StoreTabBarController)init
{
  return [(StoreTabBarController *)self initWithNibName:0 bundle:0];
}

- (_TtC8AppStore21StoreTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC8AppStore21StoreTabBarController *)sub_10026093C(v5, v7, a4);
}

- (_TtC8AppStore21StoreTabBarController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore21StoreTabBarController_objectGraph) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore21StoreTabBarController_tabChangeDelegate) = 0;
  id v4 = a3;

  result = (_TtC8AppStore21StoreTabBarController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = self;
  id v5 = [(StoreTabBarController *)v4 selectedViewController];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = [v5 supportedInterfaceOrientations];
  }
  else
  {
    v9.receiver = v4;
    v9.super_class = ObjectType;
    id v7 = [(StoreTabBarController *)&v9 supportedInterfaceOrientations];
  }
  return (unint64_t)v7;
}

- (NSArray)keyCommands
{
  v2 = self;
  unint64_t v3 = sub_1002632B0();

  if (v3)
  {
    sub_100084CF0(0, (unint64_t *)&qword_100989350);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)handleTabSwitchKeyCommandWithCommand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10026343C(v4);
}

- (void)handleSearchKeyCommandWithCommand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1002647D0();
}

- (void)accountPageViewControllerDidFinish:(id)a3
{
}

- (_TtC8AppStore21StoreTabBarController)initWithTabs:(id)a3
{
  result = (_TtC8AppStore21StoreTabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  unint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore21StoreTabBarController_tabChangeDelegate);
}

@end