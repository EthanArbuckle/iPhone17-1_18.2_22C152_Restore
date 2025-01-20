@interface _UIClickPresentation
- (BOOL)_presentsSelf;
- (UIPresentationController)presentationController;
- (UIView)customContainerView;
- (UIView)customViewForTouchContinuation;
- (UIViewController)viewController;
- (_UIClickPresentation)initWithPresentedViewController:(id)a3 presentationController:(id)a4;
- (_UIClickPresentationTransition)appearanceTransition;
- (_UIClickPresentationTransition)disappearanceTransition;
- (void)setAppearanceTransition:(id)a3;
- (void)setCustomContainerView:(id)a3;
- (void)setCustomViewForTouchContinuation:(id)a3;
- (void)setDisappearanceTransition:(id)a3;
@end

@implementation _UIClickPresentation

- (_UIClickPresentation)initWithPresentedViewController:(id)a3 presentationController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UIClickPresentation;
  v9 = [(_UIClickPresentation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewController, a3);
    objc_storeStrong((id *)&v10->_presentationController, a4);
  }

  return v10;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (UIPresentationController)presentationController
{
  return self->_presentationController;
}

- (UIView)customContainerView
{
  return self->_customContainerView;
}

- (void)setCustomContainerView:(id)a3
{
}

- (UIView)customViewForTouchContinuation
{
  return self->_customViewForTouchContinuation;
}

- (void)setCustomViewForTouchContinuation:(id)a3
{
}

- (_UIClickPresentationTransition)appearanceTransition
{
  return self->_appearanceTransition;
}

- (void)setAppearanceTransition:(id)a3
{
}

- (_UIClickPresentationTransition)disappearanceTransition
{
  return self->_disappearanceTransition;
}

- (void)setDisappearanceTransition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disappearanceTransition, 0);
  objc_storeStrong((id *)&self->_appearanceTransition, 0);
  objc_storeStrong((id *)&self->_customViewForTouchContinuation, 0);
  objc_storeStrong((id *)&self->_customContainerView, 0);
  objc_storeStrong((id *)&self->_presentationController, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

- (BOOL)_presentsSelf
{
  if (![(id)UIApp _isSpringBoard]) {
    return 0;
  }
  v3 = [(_UIClickPresentation *)self viewController];
  v4 = [(_UIClickPresentation *)self presentationController];
  v5 = [v4 presentingViewController];
  BOOL v6 = v3 == v5;

  return v6;
}

@end