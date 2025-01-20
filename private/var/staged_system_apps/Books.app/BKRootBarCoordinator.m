@interface BKRootBarCoordinator
+ (NSString)didSwitchRootBarItemNotification;
+ (NSString)rootViewControllerDidDisappearNotification;
- (BKDockableMiniPlayer)miniPlayerViewController;
- (BKRootBarCoordinator)init;
- (BKRootBarCoordinator)initWithSceneController:(id)a3 presentersProvider:(id)a4 viewControllerProvider:(id)a5;
- (BKRootBarItem)selectedItem;
- (BKRootBarStandardItemsProcessing)standardItemsManager;
- (BOOL)hasStandardItemWithIdentifier:(id)a3;
- (BOOL)isMiniPlayerHidden;
- (UINavigationController)selectedNavigationController;
- (UIViewController)hostingViewController;
- (UIViewController)rootViewController;
- (UIViewController)selectedTopViewController;
- (id)coordinatedViewControllersFor:(id)a3;
- (id)currentTitleForRootBarItem:(id)a3;
- (id)donationItemFor:(id)a3 intent:(int64_t)a4;
- (id)donationTargets;
- (id)navigationControllerForIdentifier:(id)a3;
- (id)presentedViewControllerFor:(id)a3;
- (id)presentingViewControllerFor:(id)a3;
- (id)topViewControllerForIdentifier:(id)a3;
- (void)dismissCardStackForCurrentlySelected;
- (void)dockMiniPlayer:(id)a3;
- (void)presentFullPlayer:(id)a3 completion:(id)a4;
- (void)presentFullPlayerWithCompletion:(id)a3;
- (void)registerFullPlayer:(id)a3;
- (void)selectWithIdentifier:(id)a3 isUserAction:(BOOL)a4;
- (void)setIsMiniPlayerHidden:(BOOL)a3;
- (void)setMiniPlayerViewController:(id)a3;
- (void)undockMiniPlayer;
- (void)willMoveTo:(id)a3;
- (void)windowSceneTraitCollectionDidChangeFrom:(id)a3 to:(id)a4;
@end

@implementation BKRootBarCoordinator

- (BKRootBarCoordinator)initWithSceneController:(id)a3 presentersProvider:(id)a4 viewControllerProvider:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (BKRootBarCoordinator *)sub_100042190(v7, (uint64_t)a4, (uint64_t)a5);
}

- (void)willMoveTo:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100018D68(v4);
}

- (id)currentTitleForRootBarItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10003ADC4((uint64_t)v4);

  NSString v6 = sub_1007FDC30();
  swift_bridgeObjectRelease();

  return v6;
}

- (BKRootBarItem)selectedItem
{
  v2 = self;
  v3 = (void *)sub_100041EEC();

  return (BKRootBarItem *)v3;
}

- (UINavigationController)selectedNavigationController
{
  v2 = self;
  id v3 = sub_10004A500();

  return (UINavigationController *)v3;
}

- (UIViewController)hostingViewController
{
  unint64_t v2 = *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_activeRootBarKind);
  if ((v2 & 0x8000000000000000) != 0) {
    unint64_t v2 = *(void *)(*(void *)((v2 & 0x7FFFFFFFFFFFFFFFLL) + OBJC_IVAR___BKSplitViewController_contentHostingController)
  }
                   + OBJC_IVAR___BKSplitViewContentHostingController_viewController);
  return (UIViewController *)(id)v2;
}

- (void)windowSceneTraitCollectionDidChangeFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10006C0FC(v6, v7);
}

- (UIViewController)rootViewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKRootBarCoordinator_rootViewController));
}

+ (NSString)rootViewControllerDidDisappearNotification
{
  return (NSString *)sub_1000658BC((uint64_t)a1, (uint64_t)a2, &qword_100B22550);
}

- (BKRootBarStandardItemsProcessing)standardItemsManager
{
  unint64_t v2 = (void *)swift_unknownObjectRetain();

  return (BKRootBarStandardItemsProcessing *)v2;
}

+ (NSString)didSwitchRootBarItemNotification
{
  return (NSString *)sub_1000658BC((uint64_t)a1, (uint64_t)a2, &qword_100B22548);
}

- (BKDockableMiniPlayer)miniPlayerViewController
{
  return (BKDockableMiniPlayer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___BKRootBarCoordinator_miniPlayerViewController));
}

- (void)setMiniPlayerViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_miniPlayerViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_miniPlayerViewController) = (Class)a3;
  id v6 = a3;
  v5 = self;
  sub_100264A10((uint64_t)v4);
}

- (BOOL)isMiniPlayerHidden
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_isMiniPlayerHidden);
}

- (void)setIsMiniPlayerHidden:(BOOL)a3
{
  uint64_t v3 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_isMiniPlayerHidden);
  *((unsigned char *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_isMiniPlayerHidden) = a3;
  id v4 = self;
  sub_100264BA0(v3);
}

- (BKRootBarCoordinator)init
{
  result = (BKRootBarCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();

  swift_unknownObjectWeakDestroy();
  sub_10023E454((uint64_t)self + OBJC_IVAR___BKRootBarCoordinator_presentersProvider);

  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_miniPlayerPaletteInteraction);
}

- (UIViewController)selectedTopViewController
{
  unint64_t v2 = self;
  id v3 = sub_100265280();

  return (UIViewController *)v3;
}

- (void)selectWithIdentifier:(id)a3 isUserAction:(BOOL)a4
{
  uint64_t v6 = sub_1007FDC70();
  v8 = v7;
  v9 = self;
  sub_1002653F8(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (BOOL)hasStandardItemWithIdentifier:(id)a3
{
  uint64_t v4 = sub_1007FDC70();
  unint64_t v6 = v5;
  id v7 = self;
  LOBYTE(v4) = sub_10026580C(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (id)navigationControllerForIdentifier:(id)a3
{
  uint64_t v4 = sub_1007FDC70();
  unint64_t v6 = v5;
  unint64_t v7 = *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_activeRootBarKind);
  if ((v7 & 0x8000000000000000) != 0)
  {
    v12 = (char *)(v7 & 0x7FFFFFFFFFFFFFFFLL);
    v13 = *(void **)&v12[OBJC_IVAR___BKSplitViewController_contentHostingController];
    v14 = self;
    v15 = v12;
    id v9 = v13;
    v16._countAndFlagsBits = v4;
    v16._object = v6;
    v11 = (void *)SplitViewContentHostingController.navigationController(forIdentifier:)(v16);

    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = self;
    id v9 = (id)v7;
    v10._countAndFlagsBits = v4;
    v10._object = v6;
    v11 = (void *)TabBarController.navigationController(forIdentifier:)(v10);

    swift_bridgeObjectRelease();
  }

  return v11;
}

- (id)topViewControllerForIdentifier:(id)a3
{
  uint64_t v4 = sub_1007FDC70();
  unint64_t v6 = v5;
  unint64_t v7 = self;
  id v8 = sub_100265B30(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (void)dismissCardStackForCurrentlySelected
{
  unint64_t v2 = self;
  sub_100265DE0();
}

- (void)dockMiniPlayer:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  sub_100266120(v4);
}

- (void)undockMiniPlayer
{
  unint64_t v2 = self;
  sub_100266260();
}

- (void)presentFullPlayer:(id)a3 completion:(id)a4
{
  unint64_t v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    unint64_t v6 = sub_10026AC4C;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  id v9 = self;
  sub_100266350(v8, (uint64_t)v6, v7);
  sub_10003E138((uint64_t)v6);
}

- (void)presentFullPlayerWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = sub_100051634;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  id v8 = self;
  sub_100266660((void (*)(void))v7, v6);
  sub_10003E138((uint64_t)v7);
}

- (void)registerFullPlayer:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_fullPlayerViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_fullPlayerViewController) = (Class)a3;
  id v3 = a3;
}

- (id)presentingViewControllerFor:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___BKRootBarCoordinator_rootViewController));
}

- (id)presentedViewControllerFor:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___BKRootBarCoordinator_fullPlayerViewController));
}

- (id)coordinatedViewControllersFor:(id)a3
{
  sub_100058D18(&qword_100B33310);
  v3.super.isa = sub_1007FDFE0().super.isa;

  return v3.super.isa;
}

- (id)donationTargets
{
  type metadata accessor for PresentationDonationTarget();
  v2.super.isa = sub_1007FDFE0().super.isa;

  return v2.super.isa;
}

- (id)donationItemFor:(id)a3 intent:(int64_t)a4
{
  return 0;
}

@end