@interface Transition
- (_TtC5TeaUI10Transition)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)interactionControllerForDismissal:(id)a3;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
@end

@implementation Transition

- (_TtC5TeaUI10Transition)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5TeaUI10Transition_presentationControllerFactory);
  sub_1B5E3799C(v3);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  v12 = (void *)Transition.animationController(forPresented:presenting:source:)();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)Transition.animationController(forDismissed:)();

  return v6;
}

- (id)interactionControllerForDismissal:(id)a3
{
  uint64_t v3 = Transition.interactionControllerForDismissal(using:)();
  return v3;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8 = (UIViewController *)a3;
  id v9 = a4;
  id v10 = (UIViewController *)a5;
  v11 = self;
  v12 = (void *)Transition.presentationController(forPresented:presenting:source:)(v8, (UIViewController_optional *)a4, v10);

  return v12;
}

@end