@interface TabBarSplitViewController
- (BOOL)splitViewController:(id)a3 collapseSecondaryViewController:(id)a4 ontoPrimaryViewController:(id)a5;
- (BOOL)splitViewController:(id)a3 showDetailViewController:(id)a4 sender:(id)a5;
- (BOOL)splitViewController:(id)a3 showViewController:(id)a4 sender:(id)a5;
- (NSArray)keyCommands;
- (NSArray)viewControllers;
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC5TeaUI25TabBarSplitViewController)initWithCoder:(id)a3;
- (_TtC5TeaUI25TabBarSplitViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5TeaUI25TabBarSplitViewController)initWithStyle:(int64_t)a3;
- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4;
- (int64_t)currentSplitViewFocus;
- (int64_t)preferredDisplayMode;
- (int64_t)targetDisplayModeForActionInSplitViewController:(id)a3;
- (uint64_t)presentationTransitionDidEndWithNotification:;
- (void)didReceiveMemoryWarning;
- (void)loadView;
- (void)openNewWindow;
- (void)setPreferredDisplayMode:(int64_t)a3;
- (void)setViewControllers:(id)a3;
- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4;
- (void)splitViewControllerDidCollapse:(id)a3;
- (void)splitViewControllerDidExpand:(id)a3;
- (void)tabBarNavigationControllerDidPopWithNotification:(id)a3;
- (void)toggleResponderPane;
- (void)toggleSideBarVisibility;
- (void)toggleSplitViewFocusTo:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TabBarSplitViewController

- (_TtC5TeaUI25TabBarSplitViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  TabBarSplitViewController.init(coder:)();
}

- (_TtC5TeaUI25TabBarSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  TabBarSplitViewController.init(nibName:bundle:)();
}

- (_TtC5TeaUI25TabBarSplitViewController)initWithStyle:(int64_t)a3
{
}

- (void).cxx_destruct
{
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR____TtC5TeaUI25TabBarSplitViewController_extendedDelegate);
  swift_release();
  swift_release();
  sub_1B5ED98F8(0, (unint64_t *)&unk_1EB6425F0);
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_6_0();
  v6 = *(void (**)(uint64_t))(v5 + 8);
  uint64_t v7 = OUTLINED_FUNCTION_60();
  v6(v7);
  ((void (*)(char *, uint64_t))v6)((char *)self + OBJC_IVAR____TtC5TeaUI25TabBarSplitViewController_stagedModalContextCache, v4);
  sub_1B5ED98F8(0, &qword_1EB6425E8);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_1();
  v8();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  v9 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5TeaUI25TabBarSplitViewController_overlayToolbar);
}

- (void)loadView
{
  v2 = self;
  TabBarSplitViewController.loadView()();
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  v2 = self;
  uint64_t v3 = (void *)TabBarSplitViewController.childForStatusBarStyle.getter();

  return (UIViewController *)v3;
}

- (NSArray)viewControllers
{
  v2 = self;
  TabBarSplitViewController.viewControllers.getter();

  sub_1B5DFF760(0, (unint64_t *)&qword_1EB647BD0);
  uint64_t v3 = (void *)sub_1B61B24D0();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setViewControllers:(id)a3
{
  sub_1B5DFF760(0, (unint64_t *)&qword_1EB647BD0);
  sub_1B61B24E0();
  uint64_t v4 = self;
  TabBarSplitViewController.viewControllers.setter();
}

- (int64_t)preferredDisplayMode
{
  v2 = self;
  id v3 = TabBarSplitViewController.preferredDisplayMode.getter();

  return (int64_t)v3;
}

- (void)setPreferredDisplayMode:(int64_t)a3
{
  uint64_t v4 = self;
  TabBarSplitViewController.preferredDisplayMode.setter(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  uint64_t v7 = v6;
  v9.value.super.isa = (Class)a3;
  TabBarSplitViewController.traitCollectionDidChange(_:)(v9);
}

- (void)viewDidLoad
{
  v2 = self;
  TabBarSplitViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  TabBarSplitViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  TabBarSplitViewController.viewDidAppear(_:)(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  TabBarSplitViewController.viewDidLayoutSubviews()();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  TabBarSplitViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)didReceiveMemoryWarning
{
  v2 = self;
  TabBarSplitViewController.didReceiveMemoryWarning()();
}

- (uint64_t)presentationTransitionDidEndWithNotification:
{
  OUTLINED_FUNCTION_35();
  uint64_t v2 = sub_1B61AF6F0();
  OUTLINED_FUNCTION_0_10();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_2_2();
  sub_1B61AF6B0();
  id v6 = v0;
  OUTLINED_FUNCTION_63_1();
  sub_1B5ECF69C();

  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v1, v2);
}

- (void)tabBarNavigationControllerDidPopWithNotification:(id)a3
{
  uint64_t v4 = sub_1B61AF6F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B61AF6B0();
  v8 = self;
  sub_1B5ECF868();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)splitViewControllerDidCollapse:(id)a3
{
  uint64_t v4 = (UISplitViewController *)a3;
  uint64_t v5 = self;
  TabBarSplitViewController.splitViewControllerDidCollapse(_:)(v4);
}

- (void)splitViewControllerDidExpand:(id)a3
{
  uint64_t v4 = (UISplitViewController *)a3;
  uint64_t v5 = self;
  TabBarSplitViewController.splitViewControllerDidExpand(_:)(v4);
}

- (BOOL)splitViewController:(id)a3 collapseSecondaryViewController:(id)a4 ontoPrimaryViewController:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (UIViewController *)a4;
  v10 = (UIViewController *)a5;
  v11 = self;
  LOBYTE(self) = TabBarSplitViewController.splitViewController(_:collapseSecondary:onto:)(&v11->super, v9, v10);

  return self & 1;
}

- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (UIViewController *)a4;
  id v8 = self;
  TabBarSplitViewController.splitViewController(_:separateSecondaryFrom:)(v9, &v8->super, v7);
  v11 = v10;

  return v11;
}

- (BOOL)splitViewController:(id)a3 showViewController:(id)a4 sender:(id)a5
{
  return sub_1B5ED5318(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(id, void *))TabBarSplitViewController.splitViewController(_:show:sender:));
}

- (BOOL)splitViewController:(id)a3 showDetailViewController:(id)a4 sender:(id)a5
{
  return sub_1B5ED5318(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(id, void *))TabBarSplitViewController.splitViewController(_:showDetail:sender:));
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  TabBarSplitViewController.splitViewController(_:willChangeTo:)(&v7->super, (UISplitViewControllerDisplayMode)a4);
}

- (int64_t)targetDisplayModeForActionInSplitViewController:(id)a3
{
  uint64_t v4 = (UISplitViewController *)a3;
  uint64_t v5 = self;
  UISplitViewControllerDisplayMode v6 = TabBarSplitViewController.targetDisplayModeForAction(in:)(v4);

  return v6;
}

- (NSArray)keyCommands
{
  uint64_t v2 = self;
  TabBarSplitViewController.keyCommands.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    sub_1B5DFF760(0, (unint64_t *)&qword_1EB647B78);
    uint64_t v5 = (void *)sub_1B61B24D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (NSArray *)v5;
}

- (void)openNewWindow
{
  uint64_t v2 = self;
  sub_1B5ED7990();
}

- (void)toggleResponderPane
{
  uint64_t v2 = self;
  sub_1B5ED7C38();
}

- (void)toggleSideBarVisibility
{
  uint64_t v2 = self;
  sub_1B5ED7F38();
}

- (int64_t)currentSplitViewFocus
{
  return TabBarSplitViewController.currentSplitViewFocus.getter();
}

- (void)toggleSplitViewFocusTo:(int64_t)a3
{
  uint64_t v4 = self;
  TabBarSplitViewController.toggleSplitViewFocus(to:)(a3);
}

@end