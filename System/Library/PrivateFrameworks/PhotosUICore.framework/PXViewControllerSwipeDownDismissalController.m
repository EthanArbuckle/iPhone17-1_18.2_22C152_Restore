@interface PXViewControllerSwipeDownDismissalController
- (PXViewControllerSwipeDownDismissalController)init;
- (void)setNeedsUpdate;
- (void)updateCurrentPlacement;
- (void)updateInitialPlacement;
- (void)updateSwipeDownTracker;
@end

@implementation PXViewControllerSwipeDownDismissalController

- (void)setNeedsUpdate
{
  v2 = self;
  sub_1AA1A70C4();
}

- (void)updateInitialPlacement
{
  v3 = (void *)MEMORY[0x1AD10DA80]((char *)self + OBJC_IVAR___PXViewControllerSwipeDownDismissalController_viewControllerTransition, a2);
  v5 = self;
  id v4 = objc_msgSend(v3, sel_detailItemOriginalPlacement);

  sub_1AA1A6FD0(v4);
}

- (void)updateSwipeDownTracker
{
  v2 = self;
  sub_1AA1A747C();
}

- (void)updateCurrentPlacement
{
  v2 = self;
  sub_1AA1A8354();
}

- (PXViewControllerSwipeDownDismissalController)init
{
  result = (PXViewControllerSwipeDownDismissalController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerSwipeDownDismissalController_initialItemPlacement));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerSwipeDownDismissalController_swipeDownTracker));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerSwipeDownDismissalController_releaseAnimationProgressAnimator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerSwipeDownDismissalController_releaseAnimationDismissalProgressAnimator));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerSwipeDownDismissalController_centerOffsetAnimator));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXViewControllerSwipeDownDismissalController_updater);
}

@end