@interface SMInitiatorLocation
@end

@implementation SMInitiatorLocation

void __69__SMInitiatorLocation_RTCoreDataTransformable__createWithLocationMO___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F99898]);
  id v17 = [*(id *)(a1 + 32) identifier];
  [*(id *)(a1 + 32) latitude];
  double v4 = v3;
  [*(id *)(a1 + 32) longitude];
  double v6 = v5;
  [*(id *)(a1 + 32) hunc];
  double v8 = v7;
  [*(id *)(a1 + 32) altitude];
  double v10 = v9;
  [*(id *)(a1 + 32) vunc];
  double v12 = v11;
  v13 = [*(id *)(a1 + 32) date];
  uint64_t v14 = [v2 initWithIdentifier:v17 latitude:v13 longitude:v4 hunc:v6 altitude:v8 vunc:v10 date:v12];
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

@end