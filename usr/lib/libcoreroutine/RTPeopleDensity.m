@interface RTPeopleDensity
@end

@implementation RTPeopleDensity

void __70__RTPeopleDensity_RTCoreDataTransformable__createWithPeopleDensityMO___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F5CE60]);
  id v13 = [*(id *)(a1 + 32) identifier];
  v3 = [*(id *)(a1 + 32) startDate];
  v4 = [*(id *)(a1 + 32) endDate];
  [*(id *)(a1 + 32) densityScore];
  double v6 = v5;
  [*(id *)(a1 + 32) scanDuration];
  double v8 = v7;
  v9 = [*(id *)(a1 + 32) rssiHistogram];
  uint64_t v10 = [v2 initWithBundleUUID:v13 startDate:v3 endDate:v4 densityScore:v9 scanDuration:v6 rssiHistogram:v8];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

@end