@interface UIIntelligenceLightSourceDescriptor
@end

@implementation UIIntelligenceLightSourceDescriptor

void __72___UIIntelligenceLightSourceDescriptor__createLightSourceViewWithFrame___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(double, double, double, double))(*(void *)(*(void *)(a1 + 32) + 8) + 16))(*(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setUserInteractionEnabled:0];
  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) layer];
  [v5 setAllowsHitTesting:0];
}

id __78___UIIntelligenceLightSourceDescriptor_descriptorWithModificationID_modifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  return v3;
}

@end