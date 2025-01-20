@interface _TVNavigationZoomAnimator
- (double)transitionDuration:(id)a3;
- (void)_beginZoomAnimationFromViewController:(id)a3 toViewController:(id)a4 containerView:(id)a5 completion:(id)a6;
- (void)animateTransition:(id)a3;
@end

@implementation _TVNavigationZoomAnimator

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
  v9[2] = __47___TVNavigationZoomAnimator_animateTransition___block_invoke;
  v9[3] = &unk_264BA69A0;
  id v10 = v4;
  id v8 = v4;
  [(_TVNavigationZoomAnimator *)self _beginZoomAnimationFromViewController:v7 toViewController:v6 containerView:v5 completion:v9];
}

- (void)_beginZoomAnimationFromViewController:(id)a3 toViewController:(id)a4 containerView:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v12 = [a4 view];
  [v10 bounds];
  objc_msgSend(v12, "setFrame:");
  [v12 setAlpha:0.0];
  v13 = [v12 layer];
  [v13 setShouldRasterize:1];

  v14 = [v12 layer];
  [v14 setRasterizationScale:1.0];

  v15 = [v11 view];

  [v10 insertSubview:v12 belowSubview:v15];
  v16 = [v15 layer];
  [v16 setShouldRasterize:1];

  v17 = [v15 layer];
  [v17 setRasterizationScale:1.0];

  v18 = (void *)MEMORY[0x263F1CB60];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __109___TVNavigationZoomAnimator__beginZoomAnimationFromViewController_toViewController_containerView_completion___block_invoke;
  v30[3] = &unk_264BA69A0;
  id v31 = v15;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __109___TVNavigationZoomAnimator__beginZoomAnimationFromViewController_toViewController_containerView_completion___block_invoke_2;
  v28[3] = &unk_264BA6D78;
  id v29 = v31;
  id v19 = v31;
  [v18 animateWithDuration:0x10000 delay:v30 options:v28 animations:0.3 completion:0.0];
  v20 = (void *)MEMORY[0x263F1CB60];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __109___TVNavigationZoomAnimator__beginZoomAnimationFromViewController_toViewController_containerView_completion___block_invoke_3;
  v26[3] = &unk_264BA69A0;
  id v27 = v12;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __109___TVNavigationZoomAnimator__beginZoomAnimationFromViewController_toViewController_containerView_completion___block_invoke_4;
  v23[3] = &unk_264BA7200;
  id v24 = v27;
  id v25 = v9;
  id v21 = v9;
  id v22 = v27;
  [v20 animateWithDuration:v26 animations:v23 completion:0.5];
}

@end