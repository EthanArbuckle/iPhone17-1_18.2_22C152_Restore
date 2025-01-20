@interface _UIEditMenuPresentation
- (BOOL)enforcesMenuControllerLifecycle;
- (CGRect)menuFrameInCoordinateSpace:(id)a3;
- (UIEditMenuConfiguration)activeConfiguration;
- (UIEditMenuConfiguration)dismissingConfiguration;
- (UIMenu)displayedMenu;
- (UIView)sourceView;
- (_UIEditMenuPresentation)initWithDelegate:(id)a3 sourceView:(id)a4;
- (_UIEditMenuPresentationAnimator)dismissAnimator;
- (_UIEditMenuPresentationAnimator)presentAnimator;
- (_UIEditMenuPresentationDelegate)delegate;
- (int64_t)resolvedUserInterfaceStyle;
- (unint64_t)currentState;
- (void)animateFadeWithDelay:(double)a3 animations:(id)a4 completion:(id)a5;
- (void)animateReducedMotionTransitionWithDelay:(double)a3 animations:(id)a4 completion:(id)a5;
- (void)animateScaleDismissalWithAnimations:(id)a3 completion:(id)a4;
- (void)animateScalePresentWithDelay:(double)a3 animations:(id)a4 completion:(id)a5;
- (void)didTransitionFrom:(unint64_t)a3 to:(unint64_t)a4;
- (void)forceEndDismissalIfNeeded;
- (void)forceEndPresentIfNeeded;
- (void)setActiveConfiguration:(id)a3;
- (void)setCurrentState:(unint64_t)a3;
- (void)setDismissAnimator:(id)a3;
- (void)setDismissingConfiguration:(id)a3;
- (void)setDisplayedMenu:(id)a3;
- (void)setEnforcesMenuControllerLifecycle:(BOOL)a3;
- (void)setPresentAnimator:(id)a3;
- (void)transitionWithEvent:(unint64_t)a3;
@end

@implementation _UIEditMenuPresentation

- (_UIEditMenuPresentation)initWithDelegate:(id)a3 sourceView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIEditMenuPresentation;
  v8 = [(_UIEditMenuPresentation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_sourceView, v7);
    v9->_currentState = 1;
  }

  return v9;
}

- (CGRect)menuFrameInCoordinateSpace:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (int64_t)resolvedUserInterfaceStyle
{
  double v3 = [(_UIEditMenuPresentation *)self sourceView];
  double v4 = [v3 traitCollection];
  double v5 = _UIEditMenuGetPlatformMetrics([v4 userInterfaceIdiom]);

  if ([v5 overrideUserInterfaceStyle])
  {
    int64_t v6 = [v5 overrideUserInterfaceStyle];
  }
  else if (dyld_program_sdk_at_least())
  {
    id v7 = [(_UIEditMenuPresentation *)self sourceView];
    v8 = [v7 traitCollection];
    int64_t v6 = [v8 userInterfaceStyle];
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)forceEndPresentIfNeeded
{
  if (self->_currentState == 2
    && [(_UIEditMenuPresentation *)self enforcesMenuControllerLifecycle])
  {
    [(_UIEditMenuPresentation *)self transitionWithEvent:1];
  }
}

- (void)forceEndDismissalIfNeeded
{
  if (self->_currentState == 4
    && [(_UIEditMenuPresentation *)self enforcesMenuControllerLifecycle])
  {
    [(_UIEditMenuPresentation *)self transitionWithEvent:3];
  }
}

- (void)animateScalePresentWithDelay:(double)a3 animations:(id)a4 completion:(id)a5
{
}

- (void)animateScaleDismissalWithAnimations:(id)a3 completion:(id)a4
{
}

- (void)animateReducedMotionTransitionWithDelay:(double)a3 animations:(id)a4 completion:(id)a5
{
}

- (void)animateFadeWithDelay:(double)a3 animations:(id)a4 completion:(id)a5
{
}

- (void)transitionWithEvent:(unint64_t)a3
{
}

- (void)didTransitionFrom:(unint64_t)a3 to:(unint64_t)a4
{
  switch(a4)
  {
    case 2uLL:
      double v5 = objc_opt_new();
      [(_UIEditMenuPresentation *)self setPresentAnimator:v5];

      id v15 = [(_UIEditMenuPresentation *)self delegate];
      int64_t v6 = [(_UIEditMenuPresentation *)self activeConfiguration];
      id v7 = [(_UIEditMenuPresentation *)self presentAnimator];
      [v15 _editMenuPresentation:self willPresentMenuForConfiguration:v6 animator:v7];
      goto LABEL_16;
    case 3uLL:
      if (a3 == 6)
      {
        id v15 = [(_UIEditMenuPresentation *)self delegate];
        int64_t v6 = [(_UIEditMenuPresentation *)self activeConfiguration];
        [v15 _editMenuPresentation:self didTransitionMenuForConfiguration:v6];
LABEL_17:

LABEL_18:
      }
      else
      {
        v14 = [(_UIEditMenuPresentation *)self presentAnimator];
        [v14 runCompletions];

        [(_UIEditMenuPresentation *)self setPresentAnimator:0];
      }
      return;
    case 4uLL:
      v8 = objc_opt_new();
      [(_UIEditMenuPresentation *)self setDismissAnimator:v8];

      v9 = [(_UIEditMenuPresentation *)self dismissingConfiguration];
      v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        id v11 = [(_UIEditMenuPresentation *)self activeConfiguration];
      }
      id v15 = v11;

      int64_t v6 = [(_UIEditMenuPresentation *)self delegate];
      id v7 = [(_UIEditMenuPresentation *)self dismissAnimator];
      [v6 _editMenuPresentation:self willDismissMenuForConfiguration:v15 animator:v7];
LABEL_16:

      goto LABEL_17;
    case 5uLL:
      v12 = [(_UIEditMenuPresentation *)self dismissAnimator];
      [v12 runCompletions];

      [(_UIEditMenuPresentation *)self setDismissAnimator:0];
      return;
    case 7uLL:
      objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      [v15 handleFailureInMethod:a2 object:self file:@"_UIEditMenuPresentation.m" lineNumber:291 description:@"We should never reach this state."];
      goto LABEL_18;
    default:
      return;
  }
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  return (UIView *)WeakRetained;
}

- (_UIEditMenuPresentationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIEditMenuPresentationDelegate *)WeakRetained;
}

- (BOOL)enforcesMenuControllerLifecycle
{
  return self->_enforcesMenuControllerLifecycle;
}

- (void)setEnforcesMenuControllerLifecycle:(BOOL)a3
{
  self->_enforcesMenuControllerLifecycle = a3;
}

- (UIMenu)displayedMenu
{
  return self->_displayedMenu;
}

- (void)setDisplayedMenu:(id)a3
{
}

- (UIEditMenuConfiguration)activeConfiguration
{
  return self->_activeConfiguration;
}

- (void)setActiveConfiguration:(id)a3
{
}

- (UIEditMenuConfiguration)dismissingConfiguration
{
  return self->_dismissingConfiguration;
}

- (void)setDismissingConfiguration:(id)a3
{
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

- (_UIEditMenuPresentationAnimator)presentAnimator
{
  return self->_presentAnimator;
}

- (void)setPresentAnimator:(id)a3
{
}

- (_UIEditMenuPresentationAnimator)dismissAnimator
{
  return self->_dismissAnimator;
}

- (void)setDismissAnimator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissAnimator, 0);
  objc_storeStrong((id *)&self->_presentAnimator, 0);
  objc_storeStrong((id *)&self->_dismissingConfiguration, 0);
  objc_storeStrong((id *)&self->_activeConfiguration, 0);
  objc_storeStrong((id *)&self->_displayedMenu, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_sourceView);
}

@end