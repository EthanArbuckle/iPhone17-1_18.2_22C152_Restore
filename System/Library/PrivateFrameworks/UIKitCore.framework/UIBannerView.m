@interface UIBannerView
@end

@implementation UIBannerView

uint64_t __45___UIBannerView_setHighlighted_initialPress___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(*(void *)(a1 + 32) + 432);
  double v3 = 0.3;
  if (!v1) {
    double v3 = 0.0;
  }
  return [v2 setAlpha:v3];
}

@end