@interface _TVNavigationCrossfadeAnimator
+ (void)_beginCrossfadeAnimationFromView:(id)a3 toView:(id)a4 containerView:(id)a5 delay:(double)a6 fadeOutFromView:(BOOL)a7 removeFromView:(BOOL)a8 completion:(id)a9;
- (BOOL)fadeOutFromView;
- (double)transitionDuration:(id)a3;
- (void)_beginCrossfadeAnimationFromViewController:(id)a3 toViewController:(id)a4 containerView:(id)a5 completion:(id)a6;
- (void)animateTransition:(id)a3;
- (void)setFadeOutFromView:(BOOL)a3;
@end

@implementation _TVNavigationCrossfadeAnimator

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 containerView];
  v6 = [v4 viewControllerForKey:*MEMORY[0x263F1D7B0]];
  v7 = [v4 viewControllerForKey:*MEMORY[0x263F1D7A0]];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52___TVNavigationCrossfadeAnimator_animateTransition___block_invoke;
  v9[3] = &unk_264BA69A0;
  id v10 = v4;
  id v8 = v4;
  [(_TVNavigationCrossfadeAnimator *)self _beginCrossfadeAnimationFromViewController:v7 toViewController:v6 containerView:v5 completion:v9];
}

+ (void)_beginCrossfadeAnimationFromView:(id)a3 toView:(id)a4 containerView:(id)a5 delay:(double)a6 fadeOutFromView:(BOOL)a7 removeFromView:(BOOL)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a9;
  id v18 = a5;
  [v18 bounds];
  objc_msgSend(v16, "setFrame:");
  [v16 setAlpha:0.0];
  [v18 addSubview:v16];

  v19 = (void *)MEMORY[0x263F1CB60];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __136___TVNavigationCrossfadeAnimator__beginCrossfadeAnimationFromView_toView_containerView_delay_fadeOutFromView_removeFromView_completion___block_invoke;
  v27[3] = &unk_264BA6AD8;
  BOOL v30 = a7;
  id v28 = v15;
  id v29 = v16;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __136___TVNavigationCrossfadeAnimator__beginCrossfadeAnimationFromView_toView_containerView_delay_fadeOutFromView_removeFromView_completion___block_invoke_2;
  v23[3] = &unk_264BA6B00;
  BOOL v26 = a8;
  id v24 = v28;
  id v25 = v17;
  id v20 = v17;
  id v21 = v28;
  id v22 = v16;
  [v19 animateWithDuration:2 delay:v27 options:v23 animations:0.5 completion:a6];
}

- (void)_beginCrossfadeAnimationFromViewController:(id)a3 toViewController:(id)a4 containerView:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_opt_class();
  id v16 = [v13 view];

  id v15 = [v12 view];

  [v14 _beginCrossfadeAnimationFromView:v16 toView:v15 containerView:v11 delay:self->_fadeOutFromView fadeOutFromView:1 removeFromView:v10 completion:0.0];
}

- (BOOL)fadeOutFromView
{
  return self->_fadeOutFromView;
}

- (void)setFadeOutFromView:(BOOL)a3
{
  self->_fadeOutFromView = a3;
}

@end