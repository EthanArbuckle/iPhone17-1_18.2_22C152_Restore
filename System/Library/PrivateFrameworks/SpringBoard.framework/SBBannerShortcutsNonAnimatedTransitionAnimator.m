@interface SBBannerShortcutsNonAnimatedTransitionAnimator
- (double)transitionDuration:(id)a3;
- (void)prepareForTransition:(id)a3;
@end

@implementation SBBannerShortcutsNonAnimatedTransitionAnimator

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)prepareForTransition:(id)a3
{
  id v3 = [a3 transitionView];
  [v3 setClipsToBounds:0];
}

@end