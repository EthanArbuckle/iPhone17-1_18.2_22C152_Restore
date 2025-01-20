@interface _UIKeyboardSubstitutePadPresentationController
- (CGRect)frameOfPresentedViewInContainerView;
- (_TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1946_UIKeyboardSubstitutePadPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (double)transitionDuration:(id)a3;
- (int)overrideTextEffectsVisibilityLevelForTransitionView:(id)a3;
- (void)animateTransition:(id)a3;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _UIKeyboardSubstitutePadPresentationController

- (void)presentationTransitionWillBegin
{
  v2 = self;
  sub_185A7CF98();
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  v3 = self;
  sub_185A7B440(2, 0);
}

- (void)dismissalTransitionWillBegin
{
  v2 = self;
  sub_185A7B440(3, 1);
  *(Class *)((char *)&v2->super.super.super.isa
           + OBJC_IVAR____TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1943_UIKeyboardSubstitutePresentationController_keyboardSuppressionAssertion) = 0;

  swift_unknownObjectRelease();
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  v3 = self;
  sub_185A7B440(3, 0);
}

- (CGRect)frameOfPresentedViewInContainerView
{
  double v2 = sub_185A7D1B8(self, (uint64_t)a2, (double (*)(void))sub_185A7D21C);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
}

- (int)overrideTextEffectsVisibilityLevelForTransitionView:(id)a3
{
  return 9;
}

- (_TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1946_UIKeyboardSubstitutePadPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (_TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1946_UIKeyboardSubstitutePadPresentationController *)sub_185A7EFD8((uint64_t)v5, (uint64_t)a4);

  return v7;
}

- (void).cxx_destruct
{
  sub_18596AE14((uint64_t)self+ OBJC_IVAR____TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1946_UIKeyboardSubstitutePadPresentationController_dimmingViewDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1946_UIKeyboardSubstitutePadPresentationController_shadowView));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1946_UIKeyboardSubstitutePadPresentationController_dimmingView);
}

- (double)transitionDuration:(id)a3
{
  return 0.8;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  sub_185A7DA78(a3);
  swift_unknownObjectRelease();
}

@end