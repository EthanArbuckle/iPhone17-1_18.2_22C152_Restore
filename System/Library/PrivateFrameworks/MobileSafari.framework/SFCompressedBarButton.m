@interface SFCompressedBarButton
@end

@implementation SFCompressedBarButton

uint64_t __41___SFCompressedBarButton_setHighlighted___block_invoke(uint64_t a1)
{
  double v1 = 0.05;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 744) setAlpha:v1];
}

@end