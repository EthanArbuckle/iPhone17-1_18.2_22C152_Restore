@interface NSDictionary
@end

@implementation NSDictionary

void __98__NSDictionary_PVStabilizationConfig__arrayOfTimedStabilizationConfigsWithCleanAperture_fillMode___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(a2, "timedStabilizationConfigWithCleanAperture:cropRect:fillMode:", *(unsigned int *)(a1 + 104), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  if (v3)
  {
    v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    v3 = v4;
  }
}

@end