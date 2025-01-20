@interface UIViewFloatAnimatableProperty
@end

@implementation UIViewFloatAnimatableProperty

void __98__UIViewFloatAnimatableProperty_SBFAdditions__sbf_animatablePropertyWithProgressMilestones_block___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && ([WeakRetained isInvalidated] & 1) == 0)
  {
    [v3 presentationValue];
    double v5 = v4;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          objc_msgSend(v12, "bs_CGFloatValue");
          double v14 = v13;
          if (BSFloatLessThanOrEqualToFloat())
          {
            (*(void (**)(double, double))(*(void *)(a1 + 40) + 16))(v14, v5);
            if (!v9) {
              id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            }
            [v9 addObject:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v15 = v9;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(void *)(*((void *)&v20 + 1) + 8 * j), (void)v20);
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v17);
    }

    if (![*(id *)(a1 + 32) count]) {
      [v3 invalidate];
    }
  }
}

@end