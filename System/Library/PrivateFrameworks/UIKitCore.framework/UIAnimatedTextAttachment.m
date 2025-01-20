@interface UIAnimatedTextAttachment
@end

@implementation UIAnimatedTextAttachment

void __33___UIAnimatedTextAttachment_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePresentationValues];
}

uint64_t __39___UIAnimatedTextAttachment_setBounds___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 136) setValue:*(double *)(a1 + 64)];
}

uint64_t __67___UIAnimatedTextAttachment__initiateAnimationUsingSpringBehavior___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 136) setValue:*(double *)(a1 + 40)];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 144);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * i));
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "removeAllObjects", (void)v8);
}

uint64_t __67___UIAnimatedTextAttachment__initiateAnimationUsingSpringBehavior___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 152);
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

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "removeAllObjects", (void)v8);
}

@end