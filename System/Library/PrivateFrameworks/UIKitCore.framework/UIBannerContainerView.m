@interface UIBannerContainerView
@end

@implementation UIBannerContainerView

void __52___UIBannerContainerView__presentBanner_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v6 = WeakRetained;
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
    id WeakRetained = v6;
  }
}

void __72___UIBannerContainerView__dismissBanner_alongsideAnimations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = WeakRetained;
  v8 = WeakRetained;
  if (a2)
  {
    if (WeakRetained) {
      [WeakRetained[51] removeObject:*(void *)(a1 + 32)];
    }
    id v6 = [*(id *)(a1 + 32) view];
    [v6 removeFromSuperview];

    uint64_t v5 = v8;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
    uint64_t v5 = v8;
  }
}

void __76___UIBannerContainerView__setBanner_visible_alongsideAnimations_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  if (*(unsigned char *)(a1 + 56))
  {
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v14.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v14.c = v7;
    *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v14, 0.8, 0.8);
  }
  v8 = *(void **)(a1 + 40);
  CGAffineTransform v13 = v14;
  [v8 setTransform:&v13];
  v9 = [*(id *)(a1 + 48) _bannerAnimationToVisible:*(unsigned __int8 *)(a1 + 56) hiddenValue:&unk_1ED3F2338 visibleValue:&unk_1ED3F2348 withKeyPath:@"opacity"];
  v10 = [*(id *)(a1 + 40) layer];
  [v10 addAnimation:v9 forKey:@"alpha"];

  v11 = [*(id *)(a1 + 48) _bannerAnimationToVisible:*(unsigned __int8 *)(a1 + 56) hiddenValue:&unk_1ED3F2358 visibleValue:&unk_1ED3F2338 withKeyPath:@"filters.gaussianBlur.inputRadius"];
  v12 = [*(id *)(a1 + 40) layer];
  [v12 addAnimation:v11 forKey:@"blur"];

  [*(id *)(a1 + 48) layoutIfNeeded];
}

uint64_t __76___UIBannerContainerView__setBanner_visible_alongsideAnimations_completion___block_invoke_155(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76___UIBannerContainerView__setBanner_visible_alongsideAnimations_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded", (void)v8);
}

@end