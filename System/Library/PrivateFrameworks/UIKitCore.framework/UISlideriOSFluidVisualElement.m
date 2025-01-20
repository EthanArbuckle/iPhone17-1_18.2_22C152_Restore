@interface UISlideriOSFluidVisualElement
@end

@implementation UISlideriOSFluidVisualElement

void __51___UISlideriOSFluidVisualElement__setupInteraction__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)(*(void *)(a1 + 32) + 560);
  [v3 trackBounds];
  void *v4 = v5;
  v4[1] = v6;
  v4[2] = v7;
  v4[3] = v8;
  v9 = (long long *)(*(void *)(a1 + 32) + 592);
  if (v3)
  {
    [v3 trackTransform];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
  }
  v9[1] = v17;
  v9[2] = v18;
  long long *v9 = v16;
  objc_msgSend(v3, "barFrame", v16, v17, v18);
  *(CGFloat *)(*(void *)(a1 + 32) + 552) = CGRectGetMaxX(v19);
  *(unsigned char *)(*(void *)(a1 + 32) + 640) = [v3 isTracking];
  unint64_t v10 = [v3 type];
  uint64_t v11 = (v10 >> 1) & 1;
  if ((v10 & 4) != 0) {
    uint64_t v11 = 2;
  }
  *(void *)(*(void *)(a1 + 32) + 648) = v11;
  uint64_t v12 = [v3 interactionState];
  if (v12 == ([v3 type] & 6))
  {
    v13 = [*(id *)(a1 + 32) slider];
    uint64_t v14 = [v13 isContinuous];
  }
  else
  {
    uint64_t v14 = 0;
  }
  v15 = *(id **)(a1 + 32);
  [v15[68] value];
  objc_msgSend(v15, "_updateModelValue:sendAction:", v14);
  [*(id *)(a1 + 32) _layoutSubviewsForBoundsChange:0];
}

uint64_t __69___UISlideriOSFluidVisualElement__updateConfigurationForFrameChange___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 544) setConfiguration:*(void *)(a1 + 40)];
}

uint64_t __69___UISlideriOSFluidVisualElement__setValue_minimum_maximum_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 544) setValue:*(double *)(a1 + 40)];
}

@end