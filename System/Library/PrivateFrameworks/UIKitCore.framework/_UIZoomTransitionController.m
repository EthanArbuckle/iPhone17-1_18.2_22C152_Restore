@interface _UIZoomTransitionController
- (BOOL)_shouldAnimateBottomBarVisibility;
- (BOOL)_shouldCrossFadeBottomBars;
- (BOOL)dismissInteraction:(id)a3 shouldBeginWithAxis:(unint64_t)a4 location:(CGPoint)a5 velocity:(CGPoint)a6 proposal:(BOOL)a7;
- (BOOL)isZoomingIn;
- (BOOL)prefersPreemptionEnabledForPresentations;
- (BOOL)shouldPreemptWithContext:(id)a3;
- (BOOL)wantsInteractiveStart;
- (UIView)_navigationBarTransitionOverlay;
- (UIViewController)owningViewController;
- (_UIDismissInteraction)dismissInteraction;
- (_UIZoomTransitionController)init;
- (_UIZoomViewControllerTransition)clientTransition;
- (double)hysteresisForInteraction:(id)a3;
- (double)transitionDuration:(id)a3;
- (id)_navigationToolbarTransitionControllerForContext:(id)a3;
- (id)interruptibleAnimatorForTransition:(id)a3;
- (id)preemptWithContext:(id)a3;
- (id)trackingViewForInteraction:(id)a3;
- (int64_t)_navigationBarTransitionVariant;
- (void)completeKeyboard:(id)a3;
- (void)dismissInteraction:(id)a3 didBeginAtLocation:(CGPoint)a4 withVelocity:(CGPoint)a5;
- (void)dismissInteraction:(id)a3 didCancelWithVelocity:(CGPoint)a4 originalPosition:(CGPoint)a5;
- (void)dismissInteraction:(id)a3 didDismissWithVelocity:(CGPoint)a4;
- (void)dismissInteraction:(id)a3 didIssueUpdate:(id)a4;
- (void)prepareToAnimateKeyboard:(id)a3;
- (void)setClientTransition:(id)a3;
- (void)setDismissInteraction:(id)a3;
- (void)setIsZoomingIn:(BOOL)a3;
- (void)setOwningViewController:(id)a3;
- (void)startInteractiveTransition:(id)a3;
- (void)willBeginAfterPreemptionWithContext:(id)a3 data:(id)a4;
@end

@implementation _UIZoomTransitionController

- (_UIDismissInteraction)dismissInteraction
{
  return (_UIDismissInteraction *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____UIZoomTransitionController_dismissInteraction));
}

- (_UIZoomTransitionController)init
{
  return (_UIZoomTransitionController *)sub_1855D87F8();
}

- (void)setClientTransition:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIZoomTransitionController_clientTransition);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIZoomTransitionController_clientTransition) = (Class)a3;
  id v3 = a3;
}

- (void)setOwningViewController:(id)a3
{
}

- (_UIZoomViewControllerTransition)clientTransition
{
  return (_UIZoomViewControllerTransition *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                    + OBJC_IVAR____UIZoomTransitionController_clientTransition));
}

- (BOOL)isZoomingIn
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____UIZoomTransitionController_isZoomingIn);
}

- (void)setIsZoomingIn:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____UIZoomTransitionController_isZoomingIn) = a3;
  (*(unsigned char **)((char *)&self->super.isa + OBJC_IVAR____UIZoomTransitionController_toolbarTransitionController))[OBJC_IVAR____TtC5UIKit34_UIZoomToolbarTransitionController_isZoomingIn] = a3;
}

- (UIViewController)owningViewController
{
  v2 = (void *)MEMORY[0x18C109380]((char *)self + OBJC_IVAR____UIZoomTransitionController_owningViewController, a2);
  return (UIViewController *)v2;
}

- (void)setDismissInteraction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1858DD990(v4);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIZoomTransitionController_toolbarTransitionController);
}

- (void)startInteractiveTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1858DE4F8(a3);
  swift_unknownObjectRelease();
}

- (BOOL)wantsInteractiveStart
{
  v2 = self;
  id v3 = [(_UIZoomTransitionController *)v2 dismissInteraction];
  unsigned __int8 v4 = [(_UIDismissInteraction *)v3 isActive];

  return v4;
}

- (double)transitionDuration:(id)a3
{
  swift_unknownObjectRetain();
  unsigned __int8 v4 = self;
  sub_1858E4DE8();
  double v6 = v5;
  swift_unknownObjectRelease();

  return v6;
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  id result = *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIZoomTransitionController_shimPropertyAnimator);
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

- (int64_t)_navigationBarTransitionVariant
{
  v2 = self;
  int64_t v3 = sub_1858E291C();

  return v3;
}

- (UIView)_navigationBarTransitionOverlay
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____UIZoomTransitionController_transitionOverlayView));
}

- (BOOL)_shouldCrossFadeBottomBars
{
  return 1;
}

- (BOOL)_shouldAnimateBottomBarVisibility
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIZoomTransitionController_activeTransitionContext);
  if (v2)
  {
    int64_t v3 = self;
    swift_unknownObjectRetain();
    if (UIAccessibilityIsReduceMotionEnabled())
    {
      unsigned __int8 v4 = objc_msgSend(v2, sel_isInteractive);

      swift_unknownObjectRelease();
      return v4 ^ 1;
    }

    swift_unknownObjectRelease();
  }
  return 0;
}

- (id)_navigationToolbarTransitionControllerForContext:(id)a3
{
  swift_unknownObjectRetain();
  double v5 = self;
  double v6 = sub_1858E2A2C(a3);
  swift_unknownObjectRelease();

  return v6;
}

- (BOOL)prefersPreemptionEnabledForPresentations
{
  return 1;
}

- (BOOL)shouldPreemptWithContext:(id)a3
{
  self;
  swift_unknownObjectRetain();
  unsigned __int8 v4 = self;
  if ((+[UIView _fluidZoomTransitionsEnabled]() & 1) != 0
    || +[UIView _uip_fluidPresentationTransitionsEnabled]())
  {
    char v5 = 1;
  }
  else
  {
    char v5 = *((unsigned char *)&v4->super.isa + OBJC_IVAR____UIZoomTransitionController_isPreempting);
  }
  swift_unknownObjectRelease();

  return v5;
}

- (id)preemptWithContext:(id)a3
{
  swift_unknownObjectRetain();
  char v5 = self;
  sub_1858E2BA0(a3, &v14);
  swift_unknownObjectRelease();

  uint64_t v6 = v15;
  if (v15)
  {
    v7 = __swift_project_boxed_opaque_existential_0Tm(&v14, v15);
    uint64_t v8 = *(void *)(v6 - 8);
    double v9 = MEMORY[0x1F4188790](v7);
    v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v8 + 16))(v11, v9);
    v12 = (void *)sub_186A1F83C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v6);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v14);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)willBeginAfterPreemptionWithContext:(id)a3 data:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  char v5 = self;
  sub_186A1F1CC();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v6);
}

- (void)prepareToAnimateKeyboard:(id)a3
{
  swift_unknownObjectRetain();
  char v5 = self;
  sub_1858E2FBC((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void)completeKeyboard:(id)a3
{
  if (a3)
  {
    swift_unknownObjectRetain_n();
    char v5 = self;
    id v6 = objc_msgSend(a3, sel_fromKeyboard);
    objc_msgSend(v6, sel_removeFromSuperview);

    id v7 = objc_msgSend(a3, sel_toKeyboard);
    objc_msgSend(v7, sel_removeFromSuperview);

    swift_unknownObjectRelease_n();
  }
}

- (double)hysteresisForInteraction:(id)a3
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____UIZoomTransitionController_activeTransitionContext)) {
    return 0.0;
  }
  unsigned __int8 v4 = self;
  objc_msgSend(v4, sel__defaultHysteresis);
  return result;
}

- (BOOL)dismissInteraction:(id)a3 shouldBeginWithAxis:(unint64_t)a4 location:(CGPoint)a5 velocity:(CGPoint)a6 proposal:(BOOL)a7
{
  double y = a6.y;
  double x = a6.x;
  double v10 = a5.y;
  double v11 = a5.x;
  id v14 = a3;
  uint64_t v15 = self;
  char v16 = sub_1858E3240(v14, a4, a7, v11, v10, x, y);

  return v16 & 1;
}

- (void)dismissInteraction:(id)a3 didBeginAtLocation:(CGPoint)a4 withVelocity:(CGPoint)a5
{
  id v6 = a3;
  id v7 = self;
  sub_1858E4F10();
}

- (id)trackingViewForInteraction:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.isa
                                                            + OBJC_IVAR____UIZoomTransitionController_morphAnimation)
                                                 + OBJC_IVAR____UIMagicMorphAnimation_morphView));
}

- (void)dismissInteraction:(id)a3 didIssueUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1858E5664(v7);
}

- (void)dismissInteraction:(id)a3 didDismissWithVelocity:(CGPoint)a4
{
  id v5 = a3;
  id v6 = self;
  sub_1858E5A28();
}

- (void)dismissInteraction:(id)a3 didCancelWithVelocity:(CGPoint)a4 originalPosition:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a3;
  double v9 = self;
  sub_1858E5E98(x, y);
}

@end