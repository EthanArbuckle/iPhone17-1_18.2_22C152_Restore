@interface PNPPlatterPresentationController
- (BOOL)_shouldDisableInteractionDuringTransitions;
- (PNPPlatterPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
@end

@implementation PNPPlatterPresentationController

- (PNPPlatterPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PNPPlatterPresentationController;
  v4 = [(PNPPlatterPresentationController *)&v6 initWithPresentedViewController:a3 presentingViewController:a4];
  [(PNPPlatterPresentationController *)v4 _setContainerIgnoresDirectTouchEvents:1];
  return v4;
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return 0;
}

@end