@interface UIProgressiveBlurPresentationController
@end

@implementation UIProgressiveBlurPresentationController

void __81___UIProgressiveBlurPresentationController__animateWithCoordinator_isPresenting___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEffect:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  id v3 = +[UIColor colorWithWhite:0.5 alpha:*(double *)(a1 + 48)];
  [v2 setBackgroundColor:v3];
}

uint64_t __81___UIProgressiveBlurPresentationController__animateWithCoordinator_isPresenting___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81___UIProgressiveBlurPresentationController__animateWithCoordinator_isPresenting___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end