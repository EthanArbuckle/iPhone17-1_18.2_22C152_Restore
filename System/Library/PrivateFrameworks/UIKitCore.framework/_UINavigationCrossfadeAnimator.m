@interface _UINavigationCrossfadeAnimator
- (BOOL)_shouldCrossFadeNavigationBar;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation _UINavigationCrossfadeAnimator

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 containerView];
  v6 = [v4 viewControllerForKey:@"UITransitionContextToViewController"];
  v7 = [v4 viewForKey:@"UITransitionContextToView"];
  v8 = [v4 viewForKey:@"UITransitionContextFromView"];
  [v4 finalFrameForViewController:v6];
  objc_msgSend(v7, "setFrame:");
  [v7 setAlpha:0.0];
  [v5 addSubview:v7];
  [v8 alpha];
  uint64_t v10 = v9;
  [(_UINavigationCrossfadeAnimator *)self transitionDuration:v4];
  double v12 = v11;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __52___UINavigationCrossfadeAnimator_animateTransition___block_invoke;
  v20[3] = &unk_1E52D9F98;
  id v21 = v7;
  id v22 = v8;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52___UINavigationCrossfadeAnimator_animateTransition___block_invoke_2;
  v16[3] = &unk_1E52DF298;
  uint64_t v19 = v10;
  id v17 = v22;
  id v18 = v4;
  id v13 = v4;
  id v14 = v22;
  id v15 = v7;
  +[UIView animateWithDuration:v20 animations:v16 completion:v12];
}

- (BOOL)_shouldCrossFadeNavigationBar
{
  return 1;
}

@end