@interface UINavigationBarContentView
@end

@implementation UINavigationBarContentView

BOOL __78___UINavigationBarContentView__updateNavItemContentLayoutGuideEdgeConstraints__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  v6 = v5;
  if (!v5) {
    goto LABEL_9;
  }
  v7 = (id)[v5 secondItem];
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(v8 + 557) != a3)
  {
    if (v7 == (void *)v8)
    {
      if (!*(unsigned char *)(a1 + 40))
      {
        v10 = (void *)v7[58];
        goto LABEL_12;
      }
    }
    else if (v7 == *(void **)(v8 + 464))
    {
      v10 = v7;
      if (*(unsigned char *)(a1 + 40))
      {
        BOOL v9 = 0;
        goto LABEL_10;
      }
LABEL_12:
      BOOL v9 = v7 == v10;
      goto LABEL_10;
    }
LABEL_9:
    BOOL v9 = 1;
    goto LABEL_10;
  }
  BOOL v9 = v7 != (void *)v8;
LABEL_10:

  return v9;
}

uint64_t __58___UINavigationBarContentView__runAllScheduledAnimations___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 544);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      v10 = v7;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 = _Block_copy(*(const void **)(*((void *)&v12 + 1) + 8 * v9));

        (*((void (**)(void *, uint64_t))v7 + 2))(v7, a2);
        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 728), "setKeepsSnapshotsInHierarchy:", 0, (void)v12);
  [*(id *)(*(void *)(a1 + 32) + 728) removeAllSnapshots];
  return [*(id *)(*(void *)(a1 + 32) + 544) removeAllObjects];
}

uint64_t __58___UINavigationBarContentView__runAllScheduledAnimations___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 536);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      uint64_t v8 = v5;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v5 = (void (**)(void))_Block_copy(*(const void **)(*((void *)&v10 + 1) + 8 * v7));

        v5[2](v5);
        ++v7;
        uint64_t v8 = v5;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 536), "removeAllObjects", (void)v10);
}

void __52___UINavigationBarContentView_setHostedTabBarFrame___block_invoke(double *a1, void *a2)
{
  double v3 = a1[4];
  id v4 = a2;
  uint64_t v5 = [v4 objectAtIndexedSubscript:0];
  [v5 setConstant:v3];

  double v6 = a1[5];
  uint64_t v7 = [v4 objectAtIndexedSubscript:1];
  [v7 setConstant:v6];

  double v8 = a1[6];
  uint64_t v9 = [v4 objectAtIndexedSubscript:2];
  [v9 setConstant:v8];

  double v10 = a1[7];
  id v11 = [v4 objectAtIndexedSubscript:3];

  [v11 setConstant:v10];
}

void __64___UINavigationBarContentView__setupStaticNavBarButtonAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _triggerActionForEvent:0];
}

void __64___UINavigationBarContentView__setupStaticNavBarButtonAnimated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _triggerActionForEvent:0];
}

void __54___UINavigationBarContentView_resolvedHeightDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 568));
  [WeakRetained navigationBarContentViewDidChangeDesiredHeight:*(void *)(a1 + 32)];

  *(_WORD *)(*(void *)(a1 + 32) + 552) &= ~2u;
}

@end