@interface TVLoadingView
@end

@implementation TVLoadingView

uint64_t __30___TVLoadingView__showSpinner__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  [*(id *)(a1 + 40) setAlpha:1.0];
  v2 = *(void **)(a1 + 40);
  return [v2 startAnimating];
}

@end