@interface PUCrossfadeAnimatedTransitioning
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation PUCrossfadeAnimatedTransitioning

- (void)animateTransition:(id)a3
{
  id v3 = a3;
  v4 = [v3 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  v5 = [v3 containerView];
  v6 = [v4 view];
  [v6 setAlpha:0.0];
  [v5 addSubview:v6];
  v7 = (void *)MEMORY[0x1E4FB1EB0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__PUCrossfadeAnimatedTransitioning_animateTransition___block_invoke;
  v12[3] = &unk_1E5F2ED10;
  id v13 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__PUCrossfadeAnimatedTransitioning_animateTransition___block_invoke_2;
  v10[3] = &unk_1E5F2CEE8;
  id v11 = v3;
  id v8 = v3;
  id v9 = v6;
  [v7 animateWithDuration:v12 animations:v10 completion:0.3];
}

uint64_t __54__PUCrossfadeAnimatedTransitioning_animateTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __54__PUCrossfadeAnimatedTransitioning_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeTransition:a2];
}

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

@end