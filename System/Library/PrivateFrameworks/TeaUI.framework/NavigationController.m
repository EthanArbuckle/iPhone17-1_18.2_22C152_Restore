@interface NavigationController
- (BOOL)accessibilityPerformEscape;
- (BOOL)hidesBottomBarWhenPushed;
- (_TtC5TeaUI20NavigationController)initWithCoder:(id)a3;
- (_TtC5TeaUI20NavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC5TeaUI20NavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5TeaUI20NavigationController)initWithRootViewController:(id)a3;
- (_TtC5TeaUI20NavigationController)initWithRootViewController:(id)a3 navigationBarClass:(Class)a4;
- (id)popToRootViewControllerAnimated:(BOOL)a3;
- (id)popToViewController:(id)a3 animated:(BOOL)a4;
- (id)popViewControllerAnimated:(BOOL)a3;
- (int64_t)preferredStatusBarStyle;
- (int64_t)ts_preferredCenterStatusBarStyle;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setHidesBottomBarWhenPushed:(BOOL)a3;
@end

@implementation NavigationController

- (_TtC5TeaUI20NavigationController)initWithRootViewController:(id)a3 navigationBarClass:(Class)a4
{
  if (a4) {
    uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  }
  else {
    uint64_t ObjCClassMetadata = 0;
  }
  return (_TtC5TeaUI20NavigationController *)NavigationController.init(rootViewController:navigationBarClass:)(a3, ObjCClassMetadata);
}

- (_TtC5TeaUI20NavigationController)initWithRootViewController:(id)a3
{
  return (_TtC5TeaUI20NavigationController *)NavigationController.init(rootViewController:)(a3);
}

- (_TtC5TeaUI20NavigationController)initWithCoder:(id)a3
{
  id v3 = a3;
  NavigationController.init(coder:)();
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1B5E85494(v6, a4);
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  v4 = self;
  id v5 = sub_1B5E856B0(a3);

  return v5;
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  unint64_t v8 = sub_1B5E85AC4(v6, a4);

  if (v8)
  {
    sub_1B5DFF760(0, (unint64_t *)&qword_1EB647BD0);
    v9 = (void *)sub_1B61B24D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  v4 = self;
  unint64_t v5 = sub_1B5E85C94(a3);

  if (v5)
  {
    sub_1B5DFF760(0, (unint64_t *)&qword_1EB647BD0);
    id v6 = (void *)sub_1B61B24D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (BOOL)accessibilityPerformEscape
{
  v2 = self;
  unsigned __int8 v3 = sub_1B5E85E50();

  return v3 & 1;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  id v6 = self;
  sub_1B5E85F7C(a3, a4);
}

- (_TtC5TeaUI20NavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
}

- (_TtC5TeaUI20NavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  NavigationController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
}

- (BOOL)hidesBottomBarWhenPushed
{
  v2 = self;
  unsigned __int8 v3 = NavigationController.hidesBottomBarWhenPushed.getter();

  return v3 & 1;
}

- (void)setHidesBottomBarWhenPushed:(BOOL)a3
{
  v4 = self;
  NavigationController.hidesBottomBarWhenPushed.setter(a3);
}

- (int64_t)preferredStatusBarStyle
{
  v2 = self;
  int64_t v3 = NavigationController.preferredStatusBarStyle.getter();

  return v3;
}

- (int64_t)ts_preferredCenterStatusBarStyle
{
  v2 = self;
  int64_t v3 = NavigationController.ts_preferredCenterStatusBarStyle.getter();

  return v3;
}

@end