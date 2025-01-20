@interface SBUIFullscreenAnimationView
- (BOOL)animating;
- (SBUIFullscreenAnimationViewDelegate)delegate;
- (void)_animationBegan;
- (void)_animationEnded;
- (void)_notifyDelegateAnimationBeganWithDuration:(double)a3 delay:(double)a4;
- (void)_notifyDelegateThatAnimationIsDone;
- (void)setDelegate:(id)a3;
@end

@implementation SBUIFullscreenAnimationView

- (void)_animationBegan
{
  self->_animating = 1;
}

- (void)_animationEnded
{
  self->_animating = 0;
}

- (void)_notifyDelegateAnimationBeganWithDuration:(double)a3 delay:(double)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained appTransitionView:self animationWillStartWithDuration:a3 afterDelay:a4];
}

- (void)_notifyDelegateThatAnimationIsDone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained appTransitionViewAnimationDidStop:self];
}

- (SBUIFullscreenAnimationViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBUIFullscreenAnimationViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)animating
{
  return self->_animating;
}

- (void).cxx_destruct
{
}

@end