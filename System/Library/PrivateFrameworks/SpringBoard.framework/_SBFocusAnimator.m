@interface _SBFocusAnimator
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation _SBFocusAnimator

- (void)animateTransition:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F42FF0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38___SBFocusAnimator_animateTransition___block_invoke;
  v8[3] = &unk_1E6AF4AC0;
  id v9 = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38___SBFocusAnimator_animateTransition___block_invoke_3;
  v6[3] = &unk_1E6AF5350;
  id v7 = v9;
  id v5 = v9;
  objc_msgSend(v4, "fcui_animateWithAnimationType:actions:completion:", 0, v8, v6);
}

- (double)transitionDuration:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    [v3 _duration];
    double v5 = v4;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F622A0];
  }

  return v5;
}

@end