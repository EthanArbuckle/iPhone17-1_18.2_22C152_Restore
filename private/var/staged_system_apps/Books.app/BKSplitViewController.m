@interface BKSplitViewController
- (BKRootBarCoordinating)bk_rootBarCoordinator;
- (BKSplitViewController)initWithCoder:(id)a3;
- (BKSplitViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BKSplitViewController)initWithStyle:(int64_t)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)prefersStatusBarHidden;
- (BSUIRootBarWrapperViewController)activeRootBarWrapperViewController;
- (NSString)bc_stringForReturnToRootBarItem;
- (UIViewController)childViewControllerForHomeIndicatorAutoHidden;
- (UIViewController)childViewControllerForStatusBarHidden;
- (UIViewController)childViewControllerForStatusBarStyle;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)splitViewControllerSupportedInterfaceOrientations:(id)a3;
- (void)books_addSelectionToCollection:(id)a3;
- (void)books_createCollection:(id)a3;
- (void)books_createCollectionFromSelection:(id)a3;
- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BKSplitViewController

- (BKRootBarCoordinating)bk_rootBarCoordinator
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (BKRootBarCoordinating *)Strong;
}

- (BKSplitViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR___BKSplitViewController_rootBarEventSubject;
  sub_100058D18(&qword_100B47B00);
  swift_allocObject();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_1007F77A0();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKSplitViewController_cancellables) = (Class)&_swiftEmptySetSingleton;
  v7 = (char *)self + OBJC_IVAR___BKSplitViewController_lastCollectionCreated;
  uint64_t v8 = sub_100058D18(&qword_100B27BB8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);

  result = (BKSplitViewController *)sub_1007FF260();
  __break(1u);
  return result;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    id v6 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    v7 = self;
  }
  sub_10077D720((uint64_t)a3, (uint64_t)v16, v17);

  sub_10005AFE8((uint64_t)v16, (uint64_t *)&unk_100B269C0);
  uint64_t v8 = v18;
  if (v18)
  {
    v9 = sub_10005DA74(v17, v18);
    uint64_t v10 = *(void *)(v8 - 8);
    double v11 = __chkstk_darwin(v9);
    v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v10 + 16))(v13, v11);
    v14 = (void *)sub_1007FF460();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    _s5Books15CurrentPageViewVwxx_0((uint64_t)v17);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    id v6 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  char v8 = sub_10077DC28((uint64_t)a3, (uint64_t)v10);

  sub_10005AFE8((uint64_t)v10, (uint64_t *)&unk_100B269C0);
  return v8 & 1;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SplitViewController();
  id v2 = v5.receiver;
  [(BKSplitViewController *)&v5 viewDidLoad];
  id v3 = [v2 view];
  if (v3)
  {
    v4 = v3;
    [v3 setAccessibilityIgnoresInvertColors:1];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  BOOL v6 = a3;
  char v9 = 0;
  v4 = self;
  sub_1007F7790();
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for SplitViewController();
  [(BKSplitViewController *)&v5 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  BOOL v6 = a3;
  char v9 = 3;
  v4 = self;
  sub_1007F7790();
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for SplitViewController();
  [(BKSplitViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9[1] = (objc_super)a3;
  id v10 = a4;
  char v11 = 4;
  swift_unknownObjectRetain();
  uint64_t v8 = self;
  sub_1007F7790();
  v9[0].receiver = v8;
  v9[0].super_class = (Class)type metadata accessor for SplitViewController();
  -[objc_super viewWillTransitionToSize:withTransitionCoordinator:](v9, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  swift_unknownObjectRelease();
}

- (UIViewController)childViewControllerForHomeIndicatorAutoHidden
{
  id v2 = self;
  id v3 = sub_10077E7CC();

  return (UIViewController *)v3;
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  id v2 = self;
  id v3 = sub_10077E8D8();

  return (UIViewController *)v3;
}

- (int64_t)preferredStatusBarStyle
{
  id v2 = self;
  id v3 = sub_10077E9A0();

  return (int64_t)v3;
}

- (UIViewController)childViewControllerForStatusBarHidden
{
  id v2 = self;
  id v3 = sub_10077EAA4();

  return (UIViewController *)v3;
}

- (BOOL)prefersStatusBarHidden
{
  id v2 = self;
  unsigned __int8 v3 = sub_10077EC70();

  return v3 & 1;
}

- (BKSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (BKSplitViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BKSplitViewController)initWithStyle:(int64_t)a3
{
  result = (BKSplitViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKSplitViewController_contentHostingController));
  swift_release();
  swift_bridgeObjectRelease();
  sub_10005AFE8((uint64_t)self + OBJC_IVAR___BKSplitViewController_lastCollectionCreated, &qword_100B47B08);
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_100780DDC(v6, a4);
}

- (unint64_t)splitViewControllerSupportedInterfaceOrientations:(id)a3
{
  return (unint64_t)[*(id *)(*(char **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR___BKSplitViewController_contentHostingController)+ OBJC_IVAR___BKSplitViewContentHostingController_viewController) supportedInterfaceOrientations:a3];
}

- (NSString)bc_stringForReturnToRootBarItem
{
  id v2 = self;
  sub_10077F130();
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
  id v2 = self;
  uint64_t v3 = sub_10077F244();
  if (v3)
  {
    id v4 = [v3 activeRootBarWrapperViewController];

    swift_unknownObjectRelease();
  }
  else
  {

    id v4 = 0;
  }

  return (BSUIRootBarWrapperViewController *)v4;
}

- (void)books_createCollection:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    NSString v5 = self;
  }
  sub_10077F630((uint64_t)_swiftEmptyArrayStorage);

  sub_10005AFE8((uint64_t)v6, (uint64_t *)&unk_100B269C0);
}

- (void)books_createCollectionFromSelection:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    NSString v5 = self;
  }
  id v6 = sub_10077D608();
  sub_10077F630((uint64_t)v6);

  swift_bridgeObjectRelease();
  sub_10005AFE8((uint64_t)v7, (uint64_t *)&unk_100B269C0);
}

- (void)books_addSelectionToCollection:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    NSString v5 = self;
  }
  sub_100780558((uint64_t)v6);

  sub_10005AFE8((uint64_t)v6, (uint64_t *)&unk_100B269C0);
}

@end