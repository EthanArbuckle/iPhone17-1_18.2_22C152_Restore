@interface UIContentEffectManager
@end

@implementation UIContentEffectManager

void __40___UIContentEffectManager_sharedManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_1EB264798;
  qword_1EB264798 = v0;

  uint64_t v2 = objc_opt_new();
  v3 = *(void **)(qword_1EB264798 + 8);
  *(void *)(qword_1EB264798 + 8) = v2;
}

void __73___UIContentEffectManager_compatibleEffectForKey_descriptor_constructor___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v8 = a3;
  v9 = [v8 descriptor];
  int canTransitionBetweenEffects = _canTransitionBetweenEffects(v9, *(void **)(a1 + 32));

  if (canTransitionBetweenEffects)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    *a4 = 1;
  }
}

void __73___UIContentEffectManager_compatibleEffectForKey_descriptor_constructor___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _stopManagingEffect:v3];
}

@end