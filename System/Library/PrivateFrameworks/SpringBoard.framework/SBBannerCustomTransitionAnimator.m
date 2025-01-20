@interface SBBannerCustomTransitionAnimator
+ (void)animateInteractive:(BOOL)a3 animations:(id)a4 completion:(id)a5;
+ (void)animateWithSettings:(id)a3 animations:(id)a4 completion:(id)a5;
- (void)_updateCustomContextWithTransitionContext:(id)a3;
- (void)actionsForTransition:(id)a3;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
@end

@implementation SBBannerCustomTransitionAnimator

+ (void)animateInteractive:(BOOL)a3 animations:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v6 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___SBBannerCustomTransitionAnimator;
    objc_msgSendSuper2(&v10, sel_animateInteractive_animations_completion_, v6, v8, v9);
  }
  else
  {
    [a1 performAnimationsForTransition:v8 completion:v9];
  }
}

+ (void)animateWithSettings:(id)a3 animations:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if (objc_opt_respondsToSelector())
  {
    [a1 performAnimationsForTransition:v10 completion:v9];
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___SBBannerCustomTransitionAnimator;
    objc_msgSendSuper2(&v11, sel_animateWithSettings_animations_completion_, v8, v10, v9);
  }
}

- (void)_updateCustomContextWithTransitionContext:(id)a3
{
  id v7 = a3;
  id v4 = [(SBBannerCustomTransitionAnimatorContext *)self->_customContext transitionContext];

  if (v4 != v7)
  {
    v5 = objc_alloc_init(SBBannerCustomTransitionAnimatorContext);
    customContext = self->_customContext;
    self->_customContext = v5;

    [(SBBannerCustomTransitionAnimatorContext *)self->_customContext setTransitionContext:v7];
    [(SBBannerCustomTransitionAnimatorContext *)self->_customContext setPresentationTransition:[(BNBannerTransitionAnimator *)self isPresenting]];
  }
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  [(SBBannerCustomTransitionAnimator *)self _updateCustomContextWithTransitionContext:v4];
  if (objc_opt_respondsToSelector()) {
    [(SBBannerCustomTransitionAnimator *)self prepareForTransition:self->_customContext];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBBannerCustomTransitionAnimator;
  [(BNBannerAnimator *)&v5 animateTransition:v4];
}

- (void)animationEnded:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(id)objc_opt_class() instancesRespondToSelector:sel_animationEnded_])
  {
    v5.receiver = self;
    v5.super_class = (Class)SBBannerCustomTransitionAnimator;
    [(SBBannerCustomTransitionAnimator *)&v5 animationEnded:v3];
  }
}

- (void)actionsForTransition:(id)a3
{
  id v4 = a3;
  [(SBBannerCustomTransitionAnimator *)self _updateCustomContextWithTransitionContext:v4];
  if (objc_opt_respondsToSelector())
  {
    [(SBBannerCustomTransitionAnimator *)self performActionsForTransition:self->_customContext];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBBannerCustomTransitionAnimator;
    [(BNBannerTransitionAnimator *)&v5 actionsForTransition:v4];
  }
}

- (void).cxx_destruct
{
}

@end