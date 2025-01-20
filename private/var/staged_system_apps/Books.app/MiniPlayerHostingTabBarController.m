@interface MiniPlayerHostingTabBarController
- (BKDockableMiniPlayer)miniPlayerViewController;
- (BOOL)_ignoreUnselectedTabsForStateRestoration;
- (NSArray)viewControllers;
- (NSMutableArray)mutableChildViewControllers;
- (UITabBarAppearance)bc_preferredTabBarScrollEdgeAppearance;
- (_TtC5Books33MiniPlayerHostingTabBarController)initWithCoder:(id)a3;
- (_TtC5Books33MiniPlayerHostingTabBarController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5Books33MiniPlayerHostingTabBarController)initWithTabs:(id)a3;
- (id)_viewControllersInTabBar;
- (void)_rebuildTabBarItemsAnimated:(BOOL)a3;
- (void)_updateLayoutForTraitCollection:(id)a3;
- (void)bc_setPreferredTabBarScrollEdgeAppearance:(id)a3;
- (void)dockMiniPlayer:(id)a3;
- (void)setMiniPlayerViewController:(id)a3;
- (void)setMutableChildViewControllers:(id)a3;
- (void)setViewControllers:(id)a3;
- (void)undockMiniPlayer;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MiniPlayerHostingTabBarController

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  _s5Books33MiniPlayerHostingTabBarControllerC11viewDidMove2to23shouldAppearOrDisappearySo8UIWindowCSg_SbtF_0();
}

- (void)_rebuildTabBarItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_isRebuildingTabBarItems;
  char v6 = *((unsigned char *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_isRebuildingTabBarItems);
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_isRebuildingTabBarItems) = 1;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MiniPlayerHostingTabBarController();
  id v7 = v8.receiver;
  [(MiniPlayerHostingTabBarController *)&v8 _rebuildTabBarItemsAnimated:v3];
  *((unsigned char *)&self->super.super.super.super.isa + v5) = v6;
}

- (void)_updateLayoutForTraitCollection:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_isRebuildingTabBarItems;
  char v6 = *((unsigned char *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_isRebuildingTabBarItems);
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_isRebuildingTabBarItems) = 1;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MiniPlayerHostingTabBarController();
  id v7 = a3;
  id v8 = v9.receiver;
  [(MiniPlayerHostingTabBarController *)&v9 _updateLayoutForTraitCollection:v7];
  *((unsigned char *)&self->super.super.super.super.isa + v5) = v6;
}

- (NSArray)viewControllers
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MiniPlayerHostingTabBarController();
  v2 = (id *)v8.receiver;
  BOOL v3 = [(MiniPlayerHostingTabBarController *)&v8 viewControllers];
  if (v3)
  {
    v4 = v3;
    sub_10004A860(0, (unint64_t *)&qword_100B2D950);
    unint64_t v5 = sub_1007FDFF0();

    sub_100054000(v5, v2);
    swift_bridgeObjectRelease();

    v6.super.isa = sub_1007FDFE0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {

    v6.super.isa = 0;
  }

  return (NSArray *)v6.super.isa;
}

- (NSMutableArray)mutableChildViewControllers
{
  v2 = self;
  id v3 = MiniPlayerHostingTabBarController.mutableChildViewControllers.getter();

  return (NSMutableArray *)v3;
}

- (id)_viewControllersInTabBar
{
  v2 = self;
  id v3 = [(MiniPlayerHostingTabBarController *)v2 childViewControllers];
  sub_10004A860(0, (unint64_t *)&qword_100B2D950);
  unint64_t v4 = sub_1007FDFF0();

  sub_100054000(v4, (id *)&v2->super.super.super.super.isa);
  swift_bridgeObjectRelease();

  v5.super.isa = sub_1007FDFE0().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (void)viewDidLayoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)type metadata accessor for MiniPlayerHostingTabBarController();
  id v2 = v20.receiver;
  [(MiniPlayerHostingTabBarController *)&v20 viewDidLayoutSubviews];
  id v3 = sub_10006B7B0();
  uint64_t v5 = v4;
  uint64_t ObjectType = swift_getObjectType();
  id v7 = [v2 tabBar];
  [v7 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  CGFloat Height = CGRectGetHeight(v21);
  v17 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v5 + 32))(v19, ObjectType, v5);
  *(CGFloat *)(v18 + 16) = Height;
  v17(v19, 0);

  _s5Books33MiniPlayerHostingTabBarControllerC11viewDidMove2to23shouldAppearOrDisappearySo8UIWindowCSg_SbtF_0();
}

- (_TtC5Books33MiniPlayerHostingTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1007FDC70();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC5Books33MiniPlayerHostingTabBarController *)MiniPlayerHostingTabBarController.init(nibName:bundle:)(v5, v7, a4);
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  MiniPlayerHostingTabBarController.viewWillAppear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  MiniPlayerHostingTabBarController.viewDidAppear(_:)(a3);
}

- (UITabBarAppearance)bc_preferredTabBarScrollEdgeAppearance
{
  return (UITabBarAppearance *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                       + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController__bc_preferredTabBarScrollEdgeAppearance));
}

- (void)bc_setPreferredTabBarScrollEdgeAppearance:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_1005DC278(a3);
}

- (BKDockableMiniPlayer)miniPlayerViewController
{
  id v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_miniPlayerViewController);
  swift_beginAccess();
  return (BKDockableMiniPlayer *)*v2;
}

- (void)setMiniPlayerViewController:(id)a3
{
  uint64_t v5 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_miniPlayerViewController);
  swift_beginAccess();
  id v6 = *v5;
  *uint64_t v5 = a3;
  id v7 = a3;
  id v8 = self;
  sub_1005D6060(v6);
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  MiniPlayerHostingTabBarController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  MiniPlayerHostingTabBarController.viewDidDisappear(_:)(a3);
}

- (BOOL)_ignoreUnselectedTabsForStateRestoration
{
  return 1;
}

- (void)setViewControllers:(id)a3
{
  isa = a3;
  if (a3)
  {
    sub_10004A860(0, (unint64_t *)&qword_100B2D950);
    sub_1007FDFF0();
    uint64_t v5 = self;
    isa = sub_1007FDFE0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = self;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MiniPlayerHostingTabBarController();
  [(MiniPlayerHostingTabBarController *)&v7 setViewControllers:isa];
}

- (void)setMutableChildViewControllers:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MiniPlayerHostingTabBarController();
  [(MiniPlayerHostingTabBarController *)&v4 setMutableChildViewControllers:a3];
}

- (_TtC5Books33MiniPlayerHostingTabBarController)initWithTabs:(id)a3
{
  return (_TtC5Books33MiniPlayerHostingTabBarController *)MiniPlayerHostingTabBarController.init(tabs:)();
}

- (_TtC5Books33MiniPlayerHostingTabBarController)initWithCoder:(id)a3
{
  return (_TtC5Books33MiniPlayerHostingTabBarController *)MiniPlayerHostingTabBarController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController__bc_preferredTabBarScrollEdgeAppearance));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_miniPlayerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_bottomAnchorConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController____lazy_storage___hostContainerView);
}

- (void)dockMiniPlayer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  MiniPlayerHostingTabBarController.dockMiniPlayer(_:)(v4);
}

- (void)undockMiniPlayer
{
  id v3 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_miniPlayerViewController);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = 0;
  uint64_t v5 = self;
  sub_1005D6060(v4);
}

@end