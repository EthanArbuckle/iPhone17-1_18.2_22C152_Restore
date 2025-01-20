@interface BKSplitViewContentHostingController
- (BKSplitViewContentHostingController)init;
- (BSUIRootBarWrapperViewController)activeRootBarWrapperViewController;
@end

@implementation BKSplitViewContentHostingController

- (BKSplitViewContentHostingController)init
{
  result = (BKSplitViewContentHostingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10023E454((uint64_t)self + OBJC_IVAR___BKSplitViewContentHostingController_viewControllerProvider);

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___BKSplitViewContentHostingController_isCreatingContentForNavigationController));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___BKSplitViewContentHostingController__selectedItem;
  uint64_t v4 = sub_100058D18(&qword_100B27B78);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  v5 = (char *)self + OBJC_IVAR___BKSplitViewContentHostingController_rootBarCoordinator;

  sub_10023E454((uint64_t)v5);
}

- (BSUIRootBarWrapperViewController)activeRootBarWrapperViewController
{
  return (BSUIRootBarWrapperViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                     + OBJC_IVAR___BKSplitViewContentHostingController_viewController));
}

@end