@interface TabBarController
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (NSArray)viewControllers;
- (_TtC5TeaUI16TabBarController)initWithCoder:(id)a3;
- (_TtC5TeaUI16TabBarController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5TeaUI16TabBarController)initWithTabs:(id)a3;
- (void)setViewControllers:(id)a3;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TabBarController

- (_TtC5TeaUI16TabBarController)initWithCoder:(id)a3
{
  id v3 = a3;
  TabBarController.init(coder:)();
}

- (NSArray)viewControllers
{
  v2 = self;
  uint64_t v3 = TabBarController.viewControllers.getter();

  if (v3)
  {
    sub_1B5DFF760(0, (unint64_t *)&qword_1EB647BD0);
    v4 = (void *)sub_1B61B24D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setViewControllers:(id)a3
{
  unint64_t v3 = (unint64_t)a3;
  if (a3)
  {
    sub_1B5DFF760(0, (unint64_t *)&qword_1EB647BD0);
    unint64_t v3 = sub_1B61B24E0();
  }
  v5 = self;
  TabBarController.viewControllers.setter(v3);
}

- (void)viewDidLoad
{
  v2 = self;
  TabBarController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  TabBarController.viewDidAppear(_:)(a3);
}

- (_TtC5TeaUI16TabBarController)initWithTabs:(id)a3
{
}

- (_TtC5TeaUI16TabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  TabBarController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR____TtC5TeaUI16TabBarController_extendedDelegate);
  sub_1B5E36D74((uint64_t)self + OBJC_IVAR____TtC5TeaUI16TabBarController_styler, qword_1EB63DE60, &qword_1EB63DE58);
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6 = a3;
  v7 = (UIViewController *)a4;
  v8 = self;
  TabBarController.tabBarController(_:shouldSelect:)(&v8->super, v7);

  return 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6 = a3;
  v7 = (UIViewController *)a4;
  v8 = self;
  TabBarController.tabBarController(_:didSelect:)(&v8->super, v7);
}

@end