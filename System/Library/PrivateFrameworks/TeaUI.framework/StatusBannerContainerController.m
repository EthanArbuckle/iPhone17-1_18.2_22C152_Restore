@interface StatusBannerContainerController
- (BOOL)_shouldOverlayTabBar;
- (BOOL)hidesBottomBarWhenPushed;
- (UITabBarItem)tabBarItem;
- (UIViewController)childViewControllerForHomeIndicatorAutoHidden;
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC5TeaUI31StatusBannerContainerController)initWithCoder:(id)a3;
- (_TtC5TeaUI31StatusBannerContainerController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_hostingNavigationBar;
- (void)loadView;
- (void)onStatusBannerTap;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setHidesBottomBarWhenPushed:(BOOL)a3;
- (void)setTabBarItem:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation StatusBannerContainerController

- (_TtC5TeaUI31StatusBannerContainerController)initWithCoder:(id)a3
{
}

- (void)loadView
{
  v2 = self;
  sub_1B5EE86DC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B5EE8888();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1B5EE8D08();
}

- (BOOL)_shouldOverlayTabBar
{
  v2 = self;
  unsigned __int8 v3 = sub_1B5EE9040();

  return v3 & 1;
}

- (id)_hostingNavigationBar
{
  v2 = self;
  id v3 = sub_1B5EE90A0();

  return v3;
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  v2 = self;
  id v3 = sub_1B5EE9168();

  return (UIViewController *)v3;
}

- (UIViewController)childViewControllerForHomeIndicatorAutoHidden
{
  v2 = sub_1B5EE91A0();
  return (UIViewController *)v2;
}

- (void)onStatusBannerTap
{
  v2 = self;
  sub_1B5EE9268();
}

- (_TtC5TeaUI31StatusBannerContainerController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  StatusBannerContainerController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI31StatusBannerContainerController_rootViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5TeaUI31StatusBannerContainerController_statusBannerViewController);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  StatusBannerContainerController.setEditing(_:animated:)(a3, a4);
}

- (BOOL)hidesBottomBarWhenPushed
{
  v2 = self;
  unsigned __int8 v3 = StatusBannerContainerController.hidesBottomBarWhenPushed.getter();

  return v3 & 1;
}

- (void)setHidesBottomBarWhenPushed:(BOOL)a3
{
  v4 = self;
  StatusBannerContainerController.hidesBottomBarWhenPushed.setter(a3);
}

- (UITabBarItem)tabBarItem
{
  v2 = self;
  id v3 = StatusBannerContainerController.tabBarItem.getter();

  return (UITabBarItem *)v3;
}

- (void)setTabBarItem:(id)a3
{
  id v5 = a3;
  v6 = self;
  StatusBannerContainerController.tabBarItem.setter(a3);
}

@end