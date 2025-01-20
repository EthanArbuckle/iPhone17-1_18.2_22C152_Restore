@interface TabBarNavigationController
- (NSArray)viewControllers;
- (NSString)description;
- (UITabBarItem)tabBarItem;
- (_TtC5TeaUI26TabBarNavigationController)initWithCoder:(id)a3;
- (_TtC5TeaUI26TabBarNavigationController)initWithRootViewController:(id)a3;
- (_TtC5TeaUI26TabBarNavigationController)initWithRootViewController:(id)a3 navigationBarClass:(Class)a4;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)setTabBarItem:(id)a3;
- (void)setViewControllers:(id)a3;
- (void)showViewController:(id)a3 sender:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TabBarNavigationController

- (_TtC5TeaUI26TabBarNavigationController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B60CB568();
}

- (NSArray)viewControllers
{
  v2 = self;
  TabBarNavigationController.viewControllers.getter();

  sub_1B5E36C10();
  id v3 = (void *)sub_1B61B24D0();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setViewControllers:(id)a3
{
  sub_1B5E36C10();
  sub_1B61B24E0();
  v4 = self;
  TabBarNavigationController.viewControllers.setter();
}

- (UITabBarItem)tabBarItem
{
  v2 = self;
  id v3 = TabBarNavigationController.tabBarItem.getter();

  return (UITabBarItem *)v3;
}

- (void)setTabBarItem:(id)a3
{
  id v5 = a3;
  v6 = self;
  TabBarNavigationController.tabBarItem.setter(a3);
}

- (NSString)description
{
  v2 = self;
  TabBarNavigationController.description.getter();

  id v3 = (void *)sub_1B61B20C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC5TeaUI26TabBarNavigationController)initWithRootViewController:(id)a3 navigationBarClass:(Class)a4
{
  id v4 = a3;
  TabBarNavigationController.init(rootViewController:navigationBarClass:)();
}

- (_TtC5TeaUI26TabBarNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  TabBarNavigationController.init(rootViewController:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI26TabBarNavigationController_rootViewController));
  swift_unknownObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC5TeaUI26TabBarNavigationController_animateAlongsideTabBarSnapshot);
}

- (void)viewDidLoad
{
  v2 = self;
  TabBarNavigationController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  TabBarNavigationController.viewWillAppear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  TabBarNavigationController.viewDidAppear(_:)(a3);
}

- (void)showViewController:(id)a3 sender:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1B61B3030();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a3;
    v9 = self;
  }
  TabBarNavigationController.show(_:sender:)(a3, (uint64_t)v10);

  sub_1B5E15B34((uint64_t)v10);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v8 = (UINavigationController *)a3;
  v9 = (UIViewController *)a4;
  v10 = self;
  TabBarNavigationController.navigationController(_:willShow:animated:)(v8, v9, a5);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v10 = self;
  TabBarNavigationController.navigationController(_:didShow:animated:)(&v10->super.super.super, v9, 0);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = self;
  id v14 = TabBarNavigationController.navigationController(_:animationControllerFor:from:to:)((uint64_t)v10, a4, v11, v12);

  return v14;
}

@end