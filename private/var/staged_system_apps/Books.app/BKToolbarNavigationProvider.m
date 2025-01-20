@interface BKToolbarNavigationProvider
- (BKToolbarNavigationProvider)init;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)bsuiFeedViewControllerNavigationBarStyle:(unint64_t)a3;
- (void)mainFlowControllerDock:(id)a3;
- (void)mainFlowControllerUndock:(id)a3;
- (void)navigationController:(id)a3 willShowViewController:(id)a4;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
@end

@implementation BKToolbarNavigationProvider

- (BKToolbarNavigationProvider)init
{
  return (BKToolbarNavigationProvider *)ToolbarNavigationProvider.init()();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___BKToolbarNavigationProvider__currentTopViewController;
  uint64_t v4 = sub_100058D18(&qword_100B2D7E8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___BKToolbarNavigationProvider__toolbarItems;
  uint64_t v6 = sub_100058D18(&qword_100B2D7E0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  _s5Books25ToolbarNavigationProviderC20navigationController_8willShowySo012UINavigationF0C_So06UIViewF0CtF_0(v6, v7);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  _s5Books25ToolbarNavigationProviderC20navigationController_8willShowySo012UINavigationF0C_So06UIViewF0CtF_0(v7, v8);
}

- (void)mainFlowControllerDock:(id)a3
{
}

- (void)mainFlowControllerUndock:(id)a3
{
}

- (void)bsuiFeedViewControllerNavigationBarStyle:(unint64_t)a3
{
  uint64_t v4 = self;
  ToolbarNavigationProvider.bsuiFeedViewControllerNavigationBarStyle(_:)(a3);
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  swift_retain();
  [v4 contentOffset];
  [v4 adjustedContentInset];
  sub_1007F7790();

  swift_release();
}

@end