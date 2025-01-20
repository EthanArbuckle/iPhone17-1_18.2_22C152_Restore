@interface UIIdleModeController
@end

@implementation UIIdleModeController

uint64_t __51___UIIdleModeController__enterIdleModeWithOptions___block_invoke(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 40) & 1) == 0) {
    [*(id *)(a1 + 32) _postWillEnterNotification];
  }
  v2 = *(void **)(a1 + 32);
  return [v2 _animatePresentation];
}

uint64_t __50___UIIdleModeController__exitIdleModeWithOptions___block_invoke(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 40) & 1) == 0) {
    [*(id *)(a1 + 32) _postWillExitNotification];
  }
  v2 = *(void **)(a1 + 32);
  return [v2 _animateDismissal];
}

void __50___UIIdleModeController__exitIdleModeWithOptions___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(void *)(a1 + 40) == WeakRetained[2])
  {
    v3 = WeakRetained;
    [WeakRetained _completeDismissal];
    WeakRetained = v3;
  }
}

uint64_t __66___UIIdleModeController__applyPresentationLayoutAttributesToViews__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:2048 delay:a2 options:a3 animations:0.0 completion:0.0];
}

void __66___UIIdleModeController__applyPresentationLayoutAttributesToViews__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "keyEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        v8 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKey:v7];
        [*(id *)(a1 + 32) _applyLayoutAttributes:v8 toView:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

uint64_t __63___UIIdleModeController__applyDismissalLayoutAttributesToViews__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:2048 delay:a2 options:a3 animations:0.0 completion:0.0];
}

void __63___UIIdleModeController__applyDismissalLayoutAttributesToViews__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "keyEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        v8 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKey:v7];
        [*(id *)(a1 + 32) _applyLayoutAttributes:v8 toView:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

uint64_t __63___UIIdleModeController__recordLayoutAttributesStartingAtView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 _idleModeLayoutAttributes];
  if (v4)
  {
    [*(id *)(*(void *)(a1 + 32) + 64) setObject:v4 forKey:v3];
    uint64_t v5 = *(void **)(a1 + 32);
    v6 = (void *)v5[9];
    uint64_t v7 = [v5 _originalAttributesForView:v3 comparedToIdleModeAttributes:v4];
    [v6 setObject:v7 forKey:v3];

    if (*(id *)(a1 + 40) == v3 || objc_msgSend(v3, "containsView:"))
    {
      [v4 wantsDimmingOverlay];
    }
    else
    {
      char v10 = [*(id *)(a1 + 40) containsView:v3];
      if ([v4 wantsDimmingOverlay] && (v10 & 1) == 0)
      {
        long long v11 = [v3 layer];
        long long v12 = [v11 filters];
        v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          id v14 = [MEMORY[0x1E4F1C978] array];
        }
        v15 = v14;

        [*(id *)(*(void *)(a1 + 32) + 56) setObject:v15 forKey:v3];
      }
    }
    id v8 = *(id *)(a1 + 40);
    if (v8 == v3 || [v8 containsView:v3]) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }

  return 1;
}

@end