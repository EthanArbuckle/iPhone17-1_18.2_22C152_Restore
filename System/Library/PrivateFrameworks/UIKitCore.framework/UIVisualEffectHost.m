@interface UIVisualEffectHost
@end

@implementation UIVisualEffectHost

void __36___UIVisualEffectHost_endTransition__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _configureEffectDescriptor:*(void *)(*(void *)(a1 + 32) + 48)];
  v2 = *(id **)(a1 + 32);
  id v3 = [v2[6] _identityContainerView];
  [v2 _applyRequestedDescriptorEffectInvertingView:v3];
}

BOOL __59___UIVisualEffectHost__updateView_shouldDrawWithTintColor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[UILabel _setMaterialTextColorFollowsTintColor:](v3, *(unsigned __int8 *)(a1 + 32));
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

void __68___UIVisualEffectHost__applyRequestedDescriptorEffectInvertingView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  if (v3 == a2)
  {
    [v4 applyIdentityViewEffects];
    [v4 applyIdentityFilterEffects];
  }
  else
  {
    [v4 applyRequestedViewEffects];
    [v4 applyRequestedFilterEffects];
  }
}

uint64_t __46___UIVisualEffectHost_setPrimaryCaptureGroup___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPrimaryCaptureGroup:*(void *)(*(void *)(a1 + 32) + 32)];
}

void __61___UIVisualEffectHost_prepareToTransitionToEffectDescriptor___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateAdjustTintColors];
  [*(id *)(a1 + 32) _configureEffectDescriptor:*(void *)(*(void *)(a1 + 32) + 56)];
  v2 = *(id **)(a1 + 32);
  id v3 = [v2[7] _identityContainerView];
  [v2 _applyIdentityDescriptorEffectInvertingView:v3];
}

void __67___UIVisualEffectHost__applyIdentityDescriptorEffectInvertingView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  if (v3 == a2)
  {
    [v4 applyRequestedViewEffects];
    [v4 applyRequestedFilterEffects];
  }
  else
  {
    [v4 applyIdentityViewEffects];
    [v4 applyIdentityFilterEffects];
  }
}

@end