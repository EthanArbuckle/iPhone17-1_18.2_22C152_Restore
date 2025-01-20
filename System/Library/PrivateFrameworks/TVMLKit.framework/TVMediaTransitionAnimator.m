@interface TVMediaTransitionAnimator
- (TVMediaControllerHosting)fromHost;
- (TVMediaControllerHosting)toHost;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)migratesMediaControllerFromHost:(id)a3 toHost:(id)a4;
- (void)setFromHost:(id)a3;
- (void)setToHost:(id)a3;
@end

@implementation TVMediaTransitionAnimator

- (void)migratesMediaControllerFromHost:(id)a3 toHost:(id)a4
{
  id v6 = a4;
  [(TVMediaTransitionAnimator *)self setFromHost:a3];
  [(TVMediaTransitionAnimator *)self setToHost:v6];

  self->_migrates = 1;
}

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 containerView];
  id v6 = [v4 viewControllerForKey:*MEMORY[0x263F1D7B0]];
  v7 = [v4 viewControllerForKey:*MEMORY[0x263F1D7A0]];
  v8 = [v6 view];
  [v5 bounds];
  objc_msgSend(v8, "setFrame:");
  [v8 setAlpha:0.0];
  v9 = [v8 layer];
  [v9 setShouldRasterize:1];

  v10 = [v8 layer];
  [v10 setRasterizationScale:1.0];

  v11 = [v7 view];
  [v5 insertSubview:v8 belowSubview:v11];
  v12 = [v11 layer];
  [v12 setShouldRasterize:1];

  v13 = [v11 layer];
  [v13 setRasterizationScale:1.0];

  if (self->_migrates)
  {
    v14 = [(TVMediaTransitionAnimator *)self fromHost];
    v15 = [v14 relinquishOwnership];

    v16 = [v15 view];
    [v5 insertSubview:v16 atIndex:0];

    v17 = [(TVMediaTransitionAnimator *)self toHost];
    [v17 adoptMediaController:v15];
  }
  else
  {
    v15 = 0;
  }
  v18 = (void *)MEMORY[0x263F1CB60];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __47__TVMediaTransitionAnimator_animateTransition___block_invoke;
  v28[3] = &unk_264BA64A0;
  id v29 = v8;
  id v30 = v11;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __47__TVMediaTransitionAnimator_animateTransition___block_invoke_2;
  v23[3] = &unk_264BA64C8;
  id v24 = v30;
  id v25 = v29;
  id v26 = v15;
  id v27 = v4;
  id v19 = v4;
  id v20 = v15;
  id v21 = v29;
  id v22 = v30;
  [v18 animateWithDuration:v28 animations:v23 completion:0.5];
}

uint64_t __47__TVMediaTransitionAnimator_animateTransition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

uint64_t __47__TVMediaTransitionAnimator_animateTransition___block_invoke_2(id *a1)
{
  id v2 = a1[4];
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v8[0] = *MEMORY[0x263F000D0];
  v8[1] = v3;
  v8[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v2 setTransform:v8];
  [a1[4] setAlpha:1.0];
  [a1[4] removeFromSuperview];
  id v4 = [a1[4] layer];
  [v4 setShouldRasterize:0];

  v5 = [a1[5] layer];
  [v5 setShouldRasterize:0];

  id v6 = [a1[6] view];
  [v6 removeFromSuperview];

  return [a1[7] completeTransition:1];
}

- (TVMediaControllerHosting)fromHost
{
  return self->_fromHost;
}

- (void)setFromHost:(id)a3
{
}

- (TVMediaControllerHosting)toHost
{
  return self->_toHost;
}

- (void)setToHost:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toHost, 0);
  objc_storeStrong((id *)&self->_fromHost, 0);
}

@end