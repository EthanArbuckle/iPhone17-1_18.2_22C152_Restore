@interface PUCrossfadeModalTransition
- (PUCrossfadeModalTransition)init;
- (void)animateDismissTransition;
- (void)animatePresentTransition;
@end

@implementation PUCrossfadeModalTransition

- (void)animateDismissTransition
{
  v3 = [(PUViewControllerTransition *)self containerView];
  v4 = [(PUViewControllerTransition *)self toViewController];
  v5 = [v4 view];
  v6 = [(PUViewControllerTransition *)self fromViewController];
  v7 = [v6 view];
  [(PUViewControllerTransition *)self finalToViewFrame];
  objc_msgSend(v5, "setFrame:");
  [v3 insertSubview:v5 aboveSubview:v7];
  [v5 setAlpha:0.0];
  v8 = (void *)MEMORY[0x1E4FB1EB0];
  [(PUViewControllerTransition *)self duration];
  double v10 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__PUCrossfadeModalTransition_animateDismissTransition__block_invoke;
  v13[3] = &unk_1E5F2ED10;
  id v14 = v5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__PUCrossfadeModalTransition_animateDismissTransition__block_invoke_2;
  v12[3] = &unk_1E5F2CEE8;
  v12[4] = self;
  id v11 = v5;
  [v8 animateWithDuration:v13 animations:v12 completion:v10];
}

uint64_t __54__PUCrossfadeModalTransition_animateDismissTransition__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __54__PUCrossfadeModalTransition_animateDismissTransition__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) transitionContext];
  uint64_t v3 = [v2 transitionWasCancelled] ^ 1;

  v4 = *(void **)(a1 + 32);
  return [v4 completeTransition:v3];
}

- (void)animatePresentTransition
{
  uint64_t v3 = [(PUViewControllerTransition *)self containerView];
  v4 = [(PUViewControllerTransition *)self toViewController];
  v5 = [v4 view];
  v6 = [(PUViewControllerTransition *)self fromViewController];
  v7 = [v6 view];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v7 snapshotViewAfterScreenUpdates:0];
    [v8 setAutoresizingMask:18];
    [v5 insertSubview:v8 atIndex:0];
  }
  double v9 = [v7 snapshotViewAfterScreenUpdates:0];
  [(PUViewControllerTransition *)self finalToViewFrame];
  objc_msgSend(v5, "setFrame:");
  [v3 insertSubview:v5 aboveSubview:v7];
  [v3 addSubview:v9];
  double v10 = (void *)MEMORY[0x1E4FB1EB0];
  [(PUViewControllerTransition *)self duration];
  double v12 = v11;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__PUCrossfadeModalTransition_animatePresentTransition__block_invoke;
  v17[3] = &unk_1E5F2ED10;
  id v18 = v9;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__PUCrossfadeModalTransition_animatePresentTransition__block_invoke_2;
  v14[3] = &unk_1E5F2E1C0;
  id v15 = v18;
  v16 = self;
  id v13 = v18;
  [v10 animateWithDuration:v17 animations:v14 completion:v12];
}

uint64_t __54__PUCrossfadeModalTransition_animatePresentTransition__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __54__PUCrossfadeModalTransition_animatePresentTransition__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = [*(id *)(a1 + 40) transitionContext];
  uint64_t v3 = [v2 transitionWasCancelled] ^ 1;

  v4 = *(void **)(a1 + 40);
  return [v4 completeTransition:v3];
}

- (PUCrossfadeModalTransition)init
{
  return [(PUViewControllerTransition *)self initWithDuration:0.3];
}

@end