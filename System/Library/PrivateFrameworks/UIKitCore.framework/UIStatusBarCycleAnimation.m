@interface UIStatusBarCycleAnimation
@end

@implementation UIStatusBarCycleAnimation

double __56___UIStatusBarCycleAnimation_stopWithCompletionHandler___block_invoke(uint64_t a1)
{
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = ceil(*(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                               + 24));
  double v2 = *(double *)(a1 + 72);
  if ([*(id *)(a1 + 32) autoreverses])
  {
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24)
                                                                * 0.5;
    double v2 = v2 + v2;
    if (*(unsigned char *)(*(void *)(a1 + 40) + 8)) {
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = ceil(*(double *)(*(void *)(*(void *)(a1 + 48)
    }
                                                                                               + 8)
                                                                                   + 24));
  }
  double result = *(double *)(a1 + 80) + v2 * *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
  return result;
}

@end