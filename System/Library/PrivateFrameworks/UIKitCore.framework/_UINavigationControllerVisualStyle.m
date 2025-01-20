@interface _UINavigationControllerVisualStyle
- (BOOL)isUsingParallaxTransition;
- (BOOL)shouldUseInteractionControllerForInteractiveTransition;
- (UINavigationController)navigationController;
- (UIViewControllerAnimatedTransitioning)transitionController;
- (UIViewControllerInteractiveTransitioning)interactionController;
- (_UINavigationControllerVisualStyle)initWithNavigationController:(id)a3;
- (void)setNavigationController:(id)a3;
@end

@implementation _UINavigationControllerVisualStyle

- (_UINavigationControllerVisualStyle)initWithNavigationController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UINavigationControllerVisualStyle;
  result = [(_UINavigationControllerVisualStyle *)&v5 init];
  if (result) {
    result->_navigationController = (UINavigationController *)a3;
  }
  return result;
}

- (BOOL)shouldUseInteractionControllerForInteractiveTransition
{
  return 0;
}

- (UIViewControllerAnimatedTransitioning)transitionController
{
  return 0;
}

- (UIViewControllerInteractiveTransitioning)interactionController
{
  return 0;
}

- (BOOL)isUsingParallaxTransition
{
  return 0;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  self->_navigationController = (UINavigationController *)a3;
}

@end