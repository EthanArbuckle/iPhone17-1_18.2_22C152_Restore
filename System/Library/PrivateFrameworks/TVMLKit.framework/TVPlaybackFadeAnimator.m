@interface TVPlaybackFadeAnimator
@end

@implementation TVPlaybackFadeAnimator

uint64_t __45___TVPlaybackFadeAnimator_animateTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

uint64_t __107___TVPlaybackFadeAnimator__beginFadeAnimationFromViewController_toViewController_containerView_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __107___TVPlaybackFadeAnimator__beginFadeAnimationFromViewController_toViewController_containerView_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 40) setHidden:0];
  if (*(unsigned char *)(a1 + 72))
  {
    [*(id *)(a1 + 48) removeFromSuperview];
    uint64_t v3 = *(void *)(a1 + 56);
    if (v3)
    {
      v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x263F1CB60];
    double v6 = *(double *)(a1 + 64);
    unint64_t v7 = (unint64_t)*(unsigned __int8 *)(a1 + 73) << 17;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __107___TVPlaybackFadeAnimator__beginFadeAnimationFromViewController_toViewController_containerView_completion___block_invoke_3;
    v11[3] = &unk_264BA69A0;
    id v12 = *(id *)(a1 + 48);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __107___TVPlaybackFadeAnimator__beginFadeAnimationFromViewController_toViewController_containerView_completion___block_invoke_4;
    v8[3] = &unk_264BA7200;
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    [v5 animateWithDuration:v7 delay:v11 options:v8 animations:v6 completion:0.0];
  }
}

uint64_t __107___TVPlaybackFadeAnimator__beginFadeAnimationFromViewController_toViewController_containerView_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __107___TVPlaybackFadeAnimator__beginFadeAnimationFromViewController_toViewController_containerView_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

@end