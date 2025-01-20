@interface BKTabBarController
+ (NSString)rootBarReadyNotification;
- (BKRootBarCoordinating)bk_rootBarCoordinator;
- (BKTabBarController)initWithCoder:(id)a3;
- (BKTabBarController)initWithNibName:(id)a3 bundle:(id)a4;
- (BKTabBarController)initWithTabs:(id)a3;
- (BOOL)bc_analyticsVisibilityOfChild:(id)a3;
- (BOOL)prefersStatusBarHidden;
- (BSUIRootBarWrapperViewController)activeRootBarWrapperViewController;
- (NSString)bc_stringForReturnToRootBarItem;
- (UIViewController)childViewControllerForStatusBarHidden;
- (UIViewController)childViewControllerForStatusBarStyle;
- (id)flowControllers;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)tabBarControllerSupportedInterfaceOrientations:(id)a3;
- (void)_setSelectedViewController:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
- (void)traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BKTabBarController

- (void)_setSelectedViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.super.isa = (Class)a3;
  TabBarController._setSelectedViewController(_:)(v9);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  BOOL v8 = a3;
  char v11 = 0;
  v4 = self;
  sub_1007F7790();
  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for TabBarController();
  [(MiniPlayerHostingTabBarController *)&v7 viewWillAppear:v3];
  id v5 = [(BKTabBarController *)v4 view];
  if (v5)
  {
    v6 = v5;
    [v5 setAccessibilityElementsHidden:0];
  }
  else
  {
    __break(1u);
  }
}

- (unint64_t)tabBarControllerSupportedInterfaceOrientations:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 selectedViewController];
  if (v6)
  {
    objc_super v7 = v6;
    id v8 = [v6 supportedInterfaceOrientations];

    return (unint64_t)v8;
  }
  else
  {
    int v10 = isPad();

    if (v10) {
      return 30;
    }
    else {
      return 2;
    }
  }
}

- (BOOL)bc_analyticsVisibilityOfChild:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [(BKTabBarController *)v5 selectedViewController];

  if (!v6) {
    return 0;
  }

  return v6 == v4;
}

- (BOOL)prefersStatusBarHidden
{
  v2 = self;
  id v3 = [(BKTabBarController *)v2 bc_windowForViewController];
  id v4 = [v3 windowScene];

  if (v4)
  {
    id v5 = [v4 interfaceOrientation];
  }
  else
  {
    id v5 = 0;
  }
  char v6 = isPad();

  if (v6) {
    return 0;
  }

  return sub_10005EAA4((uint64_t)v5);
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  v2 = self;
  id v3 = TabBarController.childForStatusBarStyle.getter();

  return (UIViewController *)v3;
}

- (UIViewController)childViewControllerForStatusBarHidden
{
  v2 = self;
  id v3 = TabBarController.childForStatusBarHidden.getter();

  return (UIViewController *)v3;
}

- (id)flowControllers
{
  sub_100058D18(&qword_100B29550);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10085CCE0;
  *(void *)(v3 + 56) = type metadata accessor for TabBarController();
  *(void *)(v3 + 32) = self;
  id v4 = self;
  v5.super.isa = sub_1007FDFE0().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (BKRootBarCoordinating)bk_rootBarCoordinator
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (BKRootBarCoordinating *)Strong;
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  TabBarController.viewDidLoad()();
}

- (BKTabBarController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005DC464();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  TabBarController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  id v8 = self;
  TabBarController.viewWillTransition(to:with:)((uint64_t (*)(uint64_t))a4, width, height);
  swift_unknownObjectRelease();
}

- (void)traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  objc_super v7 = self;
  sub_1007FEEC0();
  swift_unknownObjectRelease();
  _s5Books33MiniPlayerHostingTabBarControllerC11viewDidMove2to23shouldAppearOrDisappearySo8UIWindowCSg_SbtF_0();

  _s5Books15CurrentPageViewVwxx_0((uint64_t)&v8);
}

- (void)didReceiveMemoryWarning
{
  v2 = self;
  TabBarController.didReceiveMemoryWarning()();
}

- (int64_t)preferredStatusBarStyle
{
  v2 = self;
  id v3 = TabBarController.preferredStatusBarStyle.getter();

  return (int64_t)v3;
}

- (BKTabBarController)initWithTabs:(id)a3
{
  result = (BKTabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BKTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (BKTabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10023E454((uint64_t)self + OBJC_IVAR___BKTabBarController_viewControllerProvider);
  swift_release();
  id v3 = (char *)self + OBJC_IVAR___BKTabBarController__cachedSelectedItem;
  uint64_t v4 = sub_100058D18(&qword_100B27B78);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10023E454((uint64_t)self + OBJC_IVAR___BKTabBarController__rootBarCoordinator);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___BKTabBarController_isCreatingContentForNavigationController));

  swift_bridgeObjectRelease();
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1005DC660(v7);
}

- (NSString)bc_stringForReturnToRootBarItem
{
  v2 = self;
  TabBarController.bc_stringForReturnToRootBarItem.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (BSUIRootBarWrapperViewController)activeRootBarWrapperViewController
{
  v2 = self;
  uint64_t v3 = (BKTabBarController *)[(BKTabBarController *)v2 selectedViewController];
  if (!v3 || (v4 = v3, self, NSString v5 = (void *)swift_dynamicCastObjCClass(), v2, v2 = v4, !v5))
  {

    NSString v5 = 0;
  }

  return (BSUIRootBarWrapperViewController *)v5;
}

+ (NSString)rootBarReadyNotification
{
  if (qword_100B22FD8 != -1) {
    swift_once();
  }
  sub_1007FDC70();
  NSString v2 = sub_1007FDC30();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

@end