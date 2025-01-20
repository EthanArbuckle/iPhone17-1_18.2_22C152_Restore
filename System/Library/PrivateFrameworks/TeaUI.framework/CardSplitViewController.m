@interface CardSplitViewController
- (BOOL)splitViewController:(id)a3 collapseSecondaryViewController:(id)a4 ontoPrimaryViewController:(id)a5;
- (BOOL)splitViewController:(id)a3 showDetailViewController:(id)a4 sender:(id)a5;
- (BOOL)splitViewController:(id)a3 showViewController:(id)a4 sender:(id)a5;
- (NSArray)keyCommands;
- (NSArray)viewControllers;
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC5TeaUI23CardSplitViewController)initWithCoder:(id)a3;
- (_TtC5TeaUI23CardSplitViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5TeaUI23CardSplitViewController)initWithStyle:(int64_t)a3;
- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4;
- (uint64_t)presentationTransitionDidEndWithNotification:(void *)a1;
- (void)loadView;
- (void)setViewControllers:(id)a3;
- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4;
- (void)toggleResponderPane;
- (void)toggleSideBarVisibility;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CardSplitViewController

- (_TtC5TeaUI23CardSplitViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  CardSplitViewController.init(coder:)();
}

- (void)loadView
{
  v2 = self;
  sub_1B5F34378();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B5F35FE0((SEL *)&selRef_viewDidLoad);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1B5F344B4(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1B5F34550(a3);
}

- (NSArray)viewControllers
{
  v2 = self;
  sub_1B5F3466C();

  sub_1B5DFF760(0, (unint64_t *)&qword_1EB647BD0);
  id v3 = (void *)sub_1B61B24D0();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setViewControllers:(id)a3
{
  sub_1B5DFF760(0, (unint64_t *)&qword_1EB647BD0);
  sub_1B61B24E0();
  v4 = self;
  sub_1B5F34764();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1B5F348E0(a3);
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  v2 = self;
  id v3 = sub_1B5F35410();

  return (UIViewController *)v3;
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1B5F35584();
}

- (_TtC5TeaUI23CardSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  CardSplitViewController.init(nibName:bundle:)();
}

- (_TtC5TeaUI23CardSplitViewController)initWithStyle:(int64_t)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI23CardSplitViewController_primaryCardContainerController));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (uint64_t)presentationTransitionDidEndWithNotification:(void *)a1
{
  uint64_t v2 = sub_1B61AF6F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  id v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B61AF6B0();
  id v6 = a1;
  sub_1B5F3608C();

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

- (BOOL)splitViewController:(id)a3 showViewController:(id)a4 sender:(id)a5
{
  return sub_1B5F366A8(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(id, void *))CardSplitViewController.splitViewController(_:show:sender:));
}

- (BOOL)splitViewController:(id)a3 showDetailViewController:(id)a4 sender:(id)a5
{
  return sub_1B5F366A8(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(id, void *))CardSplitViewController.splitViewController(_:showDetail:sender:));
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  CardSplitViewController.splitViewController(_:willChangeTo:)(&v7->super, (UISplitViewControllerDisplayMode)a4);
}

- (BOOL)splitViewController:(id)a3 collapseSecondaryViewController:(id)a4 ontoPrimaryViewController:(id)a5
{
  id v8 = a3;
  v9 = (UIViewController *)a4;
  v10 = (UIViewController *)a5;
  v11 = self;
  LOBYTE(self) = CardSplitViewController.splitViewController(_:collapseSecondary:onto:)(&v11->super, v9, v10);

  return self & 1;
}

- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4
{
  id v6 = a3;
  v7 = (UIViewController *)a4;
  id v8 = self;
  CardSplitViewController.splitViewController(_:separateSecondaryFrom:)(v9, &v8->super, v7);
  v11 = v10;

  return v11;
}

- (NSArray)keyCommands
{
  uint64_t v2 = self;
  uint64_t v3 = CardSplitViewController.keyCommands.getter();

  if (v3)
  {
    sub_1B5DFF760(0, (unint64_t *)&qword_1EB647B78);
    uint64_t v4 = (void *)sub_1B61B24D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)toggleResponderPane
{
  uint64_t v2 = self;
  sub_1B5F38F38();
}

- (void)toggleSideBarVisibility
{
  uint64_t v2 = self;
  sub_1B5F391F8();
}

@end