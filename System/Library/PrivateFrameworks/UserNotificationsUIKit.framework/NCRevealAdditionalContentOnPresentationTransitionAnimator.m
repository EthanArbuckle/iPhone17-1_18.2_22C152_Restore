@interface NCRevealAdditionalContentOnPresentationTransitionAnimator
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation NCRevealAdditionalContentOnPresentationTransitionAnimator

- (void)animateTransition:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "__runAlongsideAnimations");
  }
  [v3 completeTransition:1];
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

@end