@interface PUOneUpAssetNavigationTransition
- (PUOneUpAssetNavigationTransition)init;
- (id)toViewController;
- (void)_animateTransitionWithOperation:(int64_t)a3;
- (void)_prepareViewForTransition;
- (void)animatePopTransition;
- (void)animatePushTransition;
@end

@implementation PUOneUpAssetNavigationTransition

- (void)_prepareViewForTransition
{
  id v7 = [(PUViewControllerTransition *)self containerView];
  v3 = [(PUOneUpAssetNavigationTransition *)self toViewController];
  v4 = [v3 view];
  v5 = [(PUViewControllerTransition *)self fromViewController];
  v6 = [v5 view];
  [(PUViewControllerTransition *)self finalToViewFrame];
  objc_msgSend(v4, "setFrame:");
  [v7 insertSubview:v4 aboveSubview:v6];
}

- (id)toViewController
{
  v4.receiver = self;
  v4.super_class = (Class)PUOneUpAssetNavigationTransition;
  v2 = [(PUViewControllerTransition *)&v4 toViewController];
  return v2;
}

- (void)_animateTransitionWithOperation:(int64_t)a3
{
  v5 = [(PUViewControllerTransition *)self fromViewController];
  v6 = [(PUOneUpAssetNavigationTransition *)self toViewController];
  if (([v5 conformsToProtocol:&unk_1F08030E0] & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUOneUpAssetNavigationTransition.m", 36, @"%@ (fromViewController) isn't conforming to PUOneUpAssetTransitionViewController", v5 object file lineNumber description];
  }
  if (([v6 conformsToProtocol:&unk_1F08030E0] & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PUOneUpAssetNavigationTransition.m", 37, @"%@ (toViewController) isn't conforming to PUOneUpAssetTransitionViewController", v6 object file lineNumber description];
  }
  id v7 = [(PUOneUpAssetNavigationTransition *)self toViewController];
  v8 = [v7 view];
  [v8 layoutIfNeeded];

  [(PUOneUpAssetNavigationTransition *)self _prepareViewForTransition];
  id v9 = [v5 navigationController];
  if (!v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (id v9 = v5) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v6;
      }
      else {
        id v9 = 0;
      }
    }
  }
  char v10 = [v9 _useStandardStatusBarHeight];
  int v11 = [v5 prefersStatusBarHidden];
  if (v11 != [v6 prefersStatusBarHidden]) {
    [v9 _setUseStandardStatusBarHeight:1];
  }
  [v5 oneUpAssetTransitionWillBegin:self];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__PUOneUpAssetNavigationTransition__animateTransitionWithOperation___block_invoke;
  v17[3] = &unk_1E5F27740;
  v17[4] = self;
  id v18 = v6;
  id v19 = v5;
  id v20 = v9;
  char v21 = v10;
  id v12 = v9;
  id v13 = v5;
  id v14 = v6;
  [v13 oneUpAssetTransition:self requestTransitionContextWithCompletion:v17];
}

void __68__PUOneUpAssetNavigationTransition__animateTransitionWithOperation___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 containerView];
  v6 = [v4 oneUpTransitionContextWithContextWithContainerView:v5];

  v8 = *(void **)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  [v8 duration];
  double v10 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__PUOneUpAssetNavigationTransition__animateTransitionWithOperation___block_invoke_2;
  v13[3] = &unk_1E5F27718;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 32);
  id v14 = v11;
  uint64_t v15 = v12;
  id v16 = *(id *)(a1 + 56);
  char v17 = *(unsigned char *)(a1 + 64);
  [v7 oneUpAssetTransition:v8 animateTransitionWithContext:v6 duration:v13 completion:v10];
}

uint64_t __68__PUOneUpAssetNavigationTransition__animateTransitionWithOperation___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) oneUpAssetTransitionDidEnd:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 40) transitionContext];
  uint64_t v3 = [v2 transitionWasCancelled] ^ 1;

  [*(id *)(a1 + 40) completeTransition:v3];
  id v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  return [v4 _setUseStandardStatusBarHeight:v5];
}

- (void)animatePopTransition
{
}

- (void)animatePushTransition
{
}

- (PUOneUpAssetNavigationTransition)init
{
  v3.receiver = self;
  v3.super_class = (Class)PUOneUpAssetNavigationTransition;
  return [(PUNavigationTransition *)&v3 initWithDuration:0.300000012];
}

@end