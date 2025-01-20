@interface BKPalettePresentationInteraction
- (BKPalettePresentationInteraction)init;
- (BKPalettePresentationInteractionDelegate)delegate;
- (BKPalettePresentationTransitioning)transitioningDelegate;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (UIView)view;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)didMoveToView:(id)a3;
- (void)panGestureRecognized:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTransitioningDelegate:(id)a3;
- (void)setView:(id)a3;
- (void)tapGestureRecognized:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation BKPalettePresentationInteraction

- (BKPalettePresentationInteraction)init
{
  return (BKPalettePresentationInteraction *)sub_100026C20();
}

- (BKPalettePresentationInteractionDelegate)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (BKPalettePresentationInteractionDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (BKPalettePresentationTransitioning)transitioningDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (BKPalettePresentationTransitioning *)Strong;
}

- (void)setTransitioningDelegate:(id)a3
{
}

- (UIView)view
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___BKPalettePresentationInteraction_view);
  swift_beginAccess();
  return (UIView *)*v2;
}

- (void)setView:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___BKPalettePresentationInteraction_view);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (void)tapGestureRecognized:(id)a3
{
  id v4 = a3;
  v5 = self;
  if ([v4 state] == (id)3
    && !*(Class *)((char *)&v5->super.isa + OBJC_IVAR___BKPalettePresentationInteraction_animationController))
  {
    sub_100387614(0, 0);
  }
}

- (void)panGestureRecognized:(id)a3
{
  id v4 = a3;
  v5 = self;
  if ([v4 state] == (id)1
    && !*(Class *)((char *)&v5->super.isa + OBJC_IVAR___BKPalettePresentationInteraction_animationController))
  {
    sub_100387614(0, 0);
  }
}

- (void).cxx_destruct
{
  sub_10023E454((uint64_t)self + OBJC_IVAR___BKPalettePresentationInteraction_delegate);
  sub_10023E454((uint64_t)self + OBJC_IVAR___BKPalettePresentationInteraction_transitioningDelegate);
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectRelease();
}

- (void)willMoveToView:(id)a3
{
  id v5 = a3;
  id v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.super.isa = (Class)a3;
  PalettePresentationInteraction.willMove(to:)(v9);
}

- (void)didMoveToView:(id)a3
{
  id v5 = a3;
  id v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.super.isa = (Class)a3;
  PalettePresentationInteraction.didMove(to:)(v9);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = _s5Books30PalettePresentationInteractionC17gestureRecognizer_33shouldRecognizeSimultaneouslyWithSbSo09UIGestureF0C_AGtF_0();

  return v9 & 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = PalettePresentationInteraction.gestureRecognizerShouldBegin(_:)((UIGestureRecognizer)v4);

  return self & 1;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  self;
  id v6 = (BKPalettePresentationInteraction *)swift_dynamicCastObjCClass();
  if (v6)
  {
    id v7 = v6;
    v8 = (objc_class *)type metadata accessor for AssetSheetPresentationController();
    v10.receiver = objc_allocWithZone(v8);
    v10.super_class = v8;
    id v6 = [(BKPalettePresentationInteraction *)&v10 initWithPresentedViewController:v7 presentingViewController:a4];
  }

  return v6;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_10038874C(v9);

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = PalettePresentationInteraction.animationController(forDismissed:)(v4);

  return v6;
}

@end