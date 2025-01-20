@interface BKMainContentViewController
- (BKDockableMiniPlayer)miniPlayerViewController;
- (BKMainContentViewController)initWithContentNavigationController:(id)a3;
- (BSUINavigationController)contentNavigationController;
- (UIViewController)childViewControllerForScreenEdgesDeferringSystemGestures;
- (void)dockMiniPlayer:(id)a3;
- (void)setContentNavigationController:(id)a3;
- (void)setMiniPlayerViewController:(id)a3;
- (void)undockMiniPlayer;
- (void)viewSafeAreaInsetsDidChange;
@end

@implementation BKMainContentViewController

- (BSUINavigationController)contentNavigationController
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = [(BKMainContentViewController *)&v4 contentNavigationController];

  return v2;
}

- (void)setContentNavigationController:(id)a3
{
  id v5 = a3;
  v6 = self;
  MainContentViewController.contentNavigationController.setter((char *)a3);
}

- (BKDockableMiniPlayer)miniPlayerViewController
{
  v2 = (id *)&self->BSUIRootBarWrapperViewController_opaque[OBJC_IVAR___BKMainContentViewController_miniPlayerViewController];
  swift_beginAccess();
  return (BKDockableMiniPlayer *)*v2;
}

- (void)setMiniPlayerViewController:(id)a3
{
  id v5 = (void **)&self->BSUIRootBarWrapperViewController_opaque[OBJC_IVAR___BKMainContentViewController_miniPlayerViewController];
  swift_beginAccess();
  v6 = *v5;
  *id v5 = a3;
  id v7 = a3;
  v8 = self;
  sub_100620328(v6);
}

- (UIViewController)childViewControllerForScreenEdgesDeferringSystemGestures
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  v3 = [(BKMainContentViewController *)&v5 contentNavigationController];

  return (UIViewController *)v3;
}

- (BKMainContentViewController)initWithContentNavigationController:(id)a3
{
  id v4 = a3;
  return (BKMainContentViewController *)MainContentViewController.init(contentNavigationController:)(a3);
}

- (void)viewSafeAreaInsetsDidChange
{
  id v2 = self;
  MainContentViewController.viewSafeAreaInsetsDidChange()();
}

- (void).cxx_destruct
{
  swift_release();
  sub_100621B70(*(void *)&self->BSUIRootBarWrapperViewController_opaque[OBJC_IVAR___BKMainContentViewController_keyboardObserver]);

  v3 = *(void **)&self->BSUIRootBarWrapperViewController_opaque[OBJC_IVAR___BKMainContentViewController_paletteContainerViewIfLoaded];
}

- (void)dockMiniPlayer:(id)a3
{
  objc_super v5 = (void **)&self->BSUIRootBarWrapperViewController_opaque[OBJC_IVAR___BKMainContentViewController_miniPlayerViewController];
  swift_beginAccess();
  v6 = *v5;
  *objc_super v5 = a3;
  id v7 = a3;
  v8 = self;
  sub_100620328(v6);
}

- (void)undockMiniPlayer
{
  v3 = (void **)&self->BSUIRootBarWrapperViewController_opaque[OBJC_IVAR___BKMainContentViewController_miniPlayerViewController];
  swift_beginAccess();
  id v4 = *v3;
  void *v3 = 0;
  objc_super v5 = self;
  sub_100620328(v4);
}

@end