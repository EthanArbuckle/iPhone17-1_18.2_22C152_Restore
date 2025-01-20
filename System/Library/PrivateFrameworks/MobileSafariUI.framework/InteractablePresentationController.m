@interface InteractablePresentationController
- (BOOL)_shouldDisableInteractionDuringTransitions;
- (InteractablePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
@end

@implementation InteractablePresentationController

- (InteractablePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)InteractablePresentationController;
  v4 = [(InteractablePresentationController *)&v8 initWithPresentedViewController:a3 presentingViewController:a4];
  v5 = v4;
  if (v4)
  {
    [(InteractablePresentationController *)v4 _setContainerIgnoresDirectTouchEvents:1];
    v6 = v5;
  }

  return v5;
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return 0;
}

@end