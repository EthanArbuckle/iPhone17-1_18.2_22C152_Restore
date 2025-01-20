@interface PXViewControllerDismissalInteractionController
- (BOOL)screenEdgeSwipeAllowed;
- (BOOL)swipeDownAllowed;
- (BOOL)swipeUpAllowed;
- (BOOL)wantsChromeVisible;
- (PXViewControllerDismissalInteractionController)init;
- (PXViewControllerDismissalInteractionController)initWithViewController:(id)a3;
- (void)containedViewControllerModalStateChanged;
- (void)dealloc;
- (void)handleSwipeDownOrEdgeSwipe:(id)a3;
- (void)handleSwipeUp:(id)a3;
- (void)handleTapOnGrabAffordance:(id)a3;
- (void)setScreenEdgeSwipeAllowed:(BOOL)a3;
- (void)setSwipeDownAllowed:(BOOL)a3;
- (void)setSwipeUpAllowed:(BOOL)a3;
- (void)setWantsChromeVisible:(BOOL)a3;
- (void)viewControllerViewWillLayoutSubviews;
@end

@implementation PXViewControllerDismissalInteractionController

- (void)viewControllerViewWillLayoutSubviews
{
  v2 = self;
  sub_1A9C9F970();
  sub_1A9C9F730();
}

- (void)setSwipeDownAllowed:(BOOL)a3
{
  v4 = self;
  sub_1A9D20FF4(a3);
}

- (void)setSwipeUpAllowed:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___PXViewControllerDismissalInteractionController_swipeUpAllowed;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (PXViewControllerDismissalInteractionController)initWithViewController:(id)a3
{
  id v3 = a3;
  v4 = (PXViewControllerDismissalInteractionController *)sub_1A9D21264();

  return v4;
}

- (void)containedViewControllerModalStateChanged
{
  v2 = self;
  sub_1AA7C2F78();
}

- (BOOL)swipeDownAllowed
{
  v2 = (BOOL *)self + OBJC_IVAR___PXViewControllerDismissalInteractionController_swipeDownAllowed;
  swift_beginAccess();
  return *v2;
}

- (BOOL)swipeUpAllowed
{
  v2 = (BOOL *)self + OBJC_IVAR___PXViewControllerDismissalInteractionController_swipeUpAllowed;
  swift_beginAccess();
  return *v2;
}

- (BOOL)screenEdgeSwipeAllowed
{
  v2 = (BOOL *)self + OBJC_IVAR___PXViewControllerDismissalInteractionController_screenEdgeSwipeAllowed;
  swift_beginAccess();
  return *v2;
}

- (void)setScreenEdgeSwipeAllowed:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___PXViewControllerDismissalInteractionController_screenEdgeSwipeAllowed;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)wantsChromeVisible
{
  v2 = (BOOL *)self + OBJC_IVAR___PXViewControllerDismissalInteractionController_wantsChromeVisible;
  swift_beginAccess();
  return *v2;
}

- (void)setWantsChromeVisible:(BOOL)a3
{
  v4 = self;
  sub_1AA7C34F8(a3);
}

- (void)dealloc
{
  v2 = self;
  sub_1AA7C3B4C();
}

- (void).cxx_destruct
{
  sub_1A9D6D380((uint64_t)self + OBJC_IVAR___PXViewControllerDismissalInteractionController_delegate);
  swift_unknownObjectUnownedDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerDismissalInteractionController_viewControllerTransition));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerDismissalInteractionController_swipeUpGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerDismissalInteractionController_swipeDownGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerDismissalInteractionController_screenEdgePanGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerDismissalInteractionController_grabberSwipeDownGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerDismissalInteractionController_grabberTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerDismissalInteractionController____lazy_storage___proxy));
  sub_1AA7C6148((uint64_t)self + OBJC_IVAR___PXViewControllerDismissalInteractionController____lazy_storage___logger, &qword_1E981EA68, MEMORY[0x1E4FBD360]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerDismissalInteractionController_currentSwipeDownDismissalController));
  swift_unknownObjectRelease();
  swift_release();
}

- (void)handleSwipeUp:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AA7C4188(v4);
}

- (void)handleSwipeDownOrEdgeSwipe:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AA7C434C(v4);
}

- (void)handleTapOnGrabAffordance:(id)a3
{
  id v4 = (PXViewControllerDismissalInteractionController *)a3;
  v6 = self;
  if ([(PXViewControllerDismissalInteractionController *)v4 state] == (id)3)
  {
    Strong = (PXViewControllerDismissalInteractionController *)swift_unknownObjectUnownedLoadStrong();
    [(PXViewControllerDismissalInteractionController *)Strong dismissViewControllerAnimated:1 completion:0];

    id v4 = v6;
    v6 = Strong;
  }
}

- (PXViewControllerDismissalInteractionController)init
{
  result = (PXViewControllerDismissalInteractionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end