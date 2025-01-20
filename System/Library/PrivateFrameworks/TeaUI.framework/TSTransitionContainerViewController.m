@interface TSTransitionContainerViewController
- (BOOL)hidesBottomBarWhenPushed;
- (NSArray)leftBarButtonItems;
- (NSArray)rightBarButtonItems;
- (NSString)description;
- (TSTransitionContainerViewController)initWithCoder:(id)a3;
- (TSTransitionContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TSTransitionContainerViewController)initWithRootViewController:(id)a3 identifier:(id)a4;
- (UITabBarItem)tabBarItem;
- (UIViewController)childViewControllerForStatusBarStyle;
- (void)handleDismiss;
- (void)handleSidebarWithSender:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setHidesBottomBarWhenPushed:(BOOL)a3;
- (void)setTabBarItem:(id)a3;
- (void)tabBarSplitViewDidChangeCollapseStateToCollapseState:(BOOL)a3;
- (void)tabBarSplitViewDidChangeTraitCollectionToTraitCollection:(id)a3;
- (void)tabBarSplitViewWillChangeDisplayModeToDisplayMode:(int64_t)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TSTransitionContainerViewController

- (TSTransitionContainerViewController)initWithRootViewController:(id)a3 identifier:(id)a4
{
  uint64_t v5 = sub_1B61B20F0();
  return (TSTransitionContainerViewController *)TransitionContainerViewController.init(rootViewController:identifier:)(a3, v5, v6);
}

- (TSTransitionContainerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5E7D15C();
}

- (NSString)description
{
  v2 = self;
  TransitionContainerViewController.description.getter();

  id v3 = (void *)sub_1B61B20C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (TSTransitionContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  TransitionContainerViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___TSTransitionContainerViewController_rootViewController));
  sub_1B5E7FD50(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR___TSTransitionContainerViewController_containerIdentifier), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR___TSTransitionContainerViewController_containerIdentifier), *((unsigned char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR___TSTransitionContainerViewController_containerIdentifier));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___TSTransitionContainerViewController_backBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___TSTransitionContainerViewController____lazy_storage___sidebarBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___TSTransitionContainerViewController____lazy_storage___doneBarButtonItem));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___TSTransitionContainerViewController____lazy_storage___spaceBarButtonItem);
}

- (void)viewDidLoad
{
  v2 = self;
  TransitionContainerViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  TransitionContainerViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  TransitionContainerViewController.viewDidDisappear(_:)(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  TransitionContainerViewController.viewWillLayoutSubviews()();
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  v2 = TransitionContainerViewController.childForStatusBarStyle.getter();
  return (UIViewController *)v2;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v6 = self;
  TransitionContainerViewController.setEditing(_:animated:)(a3, a4);
}

- (NSArray)leftBarButtonItems
{
  return (NSArray *)sub_1B5E7E30C(self, (uint64_t)a2, (void (*)(void))TransitionContainerViewController.leftBarButtonItems.getter);
}

- (NSArray)rightBarButtonItems
{
  return (NSArray *)sub_1B5E7E30C(self, (uint64_t)a2, (void (*)(void))TransitionContainerViewController.rightBarButtonItems.getter);
}

- (BOOL)hidesBottomBarWhenPushed
{
  v2 = self;
  unsigned __int8 v3 = TransitionContainerViewController.hidesBottomBarWhenPushed.getter();

  return v3 & 1;
}

- (void)setHidesBottomBarWhenPushed:(BOOL)a3
{
  unsigned __int8 v3 = self;
  TransitionContainerViewController.hidesBottomBarWhenPushed.setter();
}

- (UITabBarItem)tabBarItem
{
  v2 = self;
  id v3 = TransitionContainerViewController.tabBarItem.getter();

  return (UITabBarItem *)v3;
}

- (void)setTabBarItem:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  TransitionContainerViewController.tabBarItem.setter(a3);
}

- (void)tabBarSplitViewDidChangeTraitCollectionToTraitCollection:(id)a3
{
  id v4 = a3;
  id v5 = self;
  TransitionContainerViewController.tabBarSplitViewDidChangeTraitCollection(to:)((UITraitCollection)v5);
}

- (void)tabBarSplitViewDidChangeCollapseStateToCollapseState:(BOOL)a3
{
  id v3 = self;
  TransitionContainerViewController.tabBarSplitViewCollapseStateDidChange(to:)(0);
}

- (void)tabBarSplitViewWillChangeDisplayModeToDisplayMode:(int64_t)a3
{
  id v4 = self;
  TransitionContainerViewController.tabBarSplitViewWillChangeDisplayMode(to:)((UISplitViewControllerDisplayMode)a3);
}

- (void)handleSidebarWithSender:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1B61B3030();
  swift_unknownObjectRelease();
  sub_1B5E7ECB4();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)handleDismiss
{
  v2 = self;
  sub_1B5E7C734();
}

@end