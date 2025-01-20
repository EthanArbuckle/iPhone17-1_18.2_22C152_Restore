@interface RTHint
@end

@implementation RTHint

void __52__RTHint_RTCoreDataTransformable__createWithHintMO___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F5CDF0]);
  id v3 = objc_alloc(MEMORY[0x1E4F5CE00]);
  [*(id *)(a1 + 32) latitude];
  double v5 = v4;
  [*(id *)(a1 + 32) longitude];
  double v7 = v6;
  [*(id *)(a1 + 32) horizontalUncertainty];
  double v9 = v8;
  id v16 = [*(id *)(a1 + 32) date];
  v10 = (void *)[v3 initWithLatitude:v16 longitude:v5 horizontalUncertainty:v7 date:v9];
  uint64_t v11 = [*(id *)(a1 + 32) source];
  v12 = [*(id *)(a1 + 32) date];
  uint64_t v13 = [v2 initWithLocation:v10 source:v11 date:v12];
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

@end