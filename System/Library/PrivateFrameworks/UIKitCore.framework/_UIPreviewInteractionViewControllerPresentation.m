@interface _UIPreviewInteractionViewControllerPresentation
- (BOOL)shouldFlipFromAndToViewsForDisappearanceTransition;
- (BOOL)shouldPresentAutomatically;
- (BOOL)shouldUpdateFromViewBeforePresentation;
- (BOOL)shouldUseCATransitions;
- (UIPreviewPresentationController)presentationController;
- (UIView)customContainerView;
- (UIView)customViewForTouchContinuation;
- (UIViewController)viewController;
- (_UIPreviewInteractionViewControllerPresentation)initWithViewController:(id)a3;
- (_UIPreviewInteractionViewControllerTransition)appearanceTransition;
- (_UIPreviewInteractionViewControllerTransition)disappearanceTransition;
- (id)privatePresentationBlock;
- (id)privatePresentationCompletionBlock;
- (void)_completeViewControllerPresentationImmediately;
- (void)presentViewController;
- (void)setAppearanceTransition:(id)a3;
- (void)setCustomContainerView:(id)a3;
- (void)setCustomViewForTouchContinuation:(id)a3;
- (void)setDisappearanceTransition:(id)a3;
- (void)setPresentationController:(id)a3;
- (void)setPrivatePresentationBlock:(id)a3;
- (void)setPrivatePresentationCompletionBlock:(id)a3;
- (void)setShouldFlipFromAndToViewsForDisappearanceTransition:(BOOL)a3;
- (void)setShouldPresentAutomatically:(BOOL)a3;
- (void)setShouldUpdateFromViewBeforePresentation:(BOOL)a3;
- (void)setShouldUseCATransitions:(BOOL)a3;
- (void)setViewController:(id)a3;
@end

@implementation _UIPreviewInteractionViewControllerPresentation

- (_UIPreviewInteractionViewControllerPresentation)initWithViewController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIPreviewInteractionViewControllerPresentation;
  v6 = [(_UIPreviewInteractionViewControllerPresentation *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewController, a3);
    v7->_shouldUseCATransitions = 1;
    *(_WORD *)&v7->_shouldUpdateFromViewBeforePresentation = 256;
    v8 = v7;
  }

  return v7;
}

- (void)presentViewController
{
  privatePresentationBlock = (void (**)(void))self->_privatePresentationBlock;
  if (privatePresentationBlock) {
    privatePresentationBlock[2]();
  }
}

- (void)_completeViewControllerPresentationImmediately
{
  privatePresentationCompletionBlock = (void (**)(id, uint64_t))self->_privatePresentationCompletionBlock;
  if (privatePresentationCompletionBlock) {
    privatePresentationCompletionBlock[2](privatePresentationCompletionBlock, 1);
  }
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (UIView)customContainerView
{
  return self->_customContainerView;
}

- (void)setCustomContainerView:(id)a3
{
}

- (UIPreviewPresentationController)presentationController
{
  return self->_presentationController;
}

- (void)setPresentationController:(id)a3
{
}

- (_UIPreviewInteractionViewControllerTransition)appearanceTransition
{
  return self->_appearanceTransition;
}

- (void)setAppearanceTransition:(id)a3
{
}

- (_UIPreviewInteractionViewControllerTransition)disappearanceTransition
{
  return self->_disappearanceTransition;
}

- (void)setDisappearanceTransition:(id)a3
{
}

- (BOOL)shouldUseCATransitions
{
  return self->_shouldUseCATransitions;
}

- (void)setShouldUseCATransitions:(BOOL)a3
{
  self->_shouldUseCATransitions = a3;
}

- (BOOL)shouldFlipFromAndToViewsForDisappearanceTransition
{
  return self->_shouldFlipFromAndToViewsForDisappearanceTransition;
}

- (void)setShouldFlipFromAndToViewsForDisappearanceTransition:(BOOL)a3
{
  self->_shouldFlipFromAndToViewsForDisappearanceTransition = a3;
}

- (id)privatePresentationBlock
{
  return self->_privatePresentationBlock;
}

- (void)setPrivatePresentationBlock:(id)a3
{
}

- (id)privatePresentationCompletionBlock
{
  return self->_privatePresentationCompletionBlock;
}

- (void)setPrivatePresentationCompletionBlock:(id)a3
{
}

- (BOOL)shouldUpdateFromViewBeforePresentation
{
  return self->_shouldUpdateFromViewBeforePresentation;
}

- (void)setShouldUpdateFromViewBeforePresentation:(BOOL)a3
{
  self->_shouldUpdateFromViewBeforePresentation = a3;
}

- (UIView)customViewForTouchContinuation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customViewForTouchContinuation);
  return (UIView *)WeakRetained;
}

- (void)setCustomViewForTouchContinuation:(id)a3
{
}

- (BOOL)shouldPresentAutomatically
{
  return self->_shouldPresentAutomatically;
}

- (void)setShouldPresentAutomatically:(BOOL)a3
{
  self->_shouldPresentAutomatically = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_customViewForTouchContinuation);
  objc_storeStrong(&self->_privatePresentationCompletionBlock, 0);
  objc_storeStrong(&self->_privatePresentationBlock, 0);
  objc_storeStrong((id *)&self->_disappearanceTransition, 0);
  objc_storeStrong((id *)&self->_appearanceTransition, 0);
  objc_storeStrong((id *)&self->_presentationController, 0);
  objc_storeStrong((id *)&self->_customContainerView, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end