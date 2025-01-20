@interface PXStoryScrubberClipView
@end

@implementation PXStoryScrubberClipView

uint64_t __42___PXStoryScrubberClipView_layoutSubviews__block_invoke(uint64_t a1)
{
  double v2 = 0.0;
  double v3 = 0.0;
  if (*(unsigned char *)(a1 + 48))
  {
    LOBYTE(v3) = *(unsigned char *)(a1 + 49);
    double v3 = (double)*(unint64_t *)&v3;
  }
  [*(id *)(a1 + 32) setAlpha:v3];
  if (!*(unsigned char *)(a1 + 48))
  {
    LOBYTE(v4) = *(unsigned char *)(a1 + 49);
    double v2 = (double)v4;
  }
  v5 = *(void **)(a1 + 40);
  return [v5 setAlpha:v2];
}

@end