@interface TVSpinnerView
@end

@implementation TVSpinnerView

uint64_t __32___TVSpinnerView__addAnimations__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __35___TVSpinnerView__removeAnimations__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __35___TVSpinnerView__removeAnimations__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
  [v1 removeAnimationForKey:@"repeatingGroupAnimation"];
}

@end