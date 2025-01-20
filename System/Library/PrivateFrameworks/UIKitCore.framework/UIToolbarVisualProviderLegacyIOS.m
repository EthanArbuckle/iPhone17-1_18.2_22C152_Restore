@interface UIToolbarVisualProviderLegacyIOS
@end

@implementation UIToolbarVisualProviderLegacyIOS

void __125___UIToolbarVisualProviderLegacyIOS__positionToolbarButtons_ignoringItem_resetFontScaleAdjustment_actuallyRepositionButtons___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 40) && *(unsigned char *)(a1 + 41))
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v1 = *(id *)(a1 + 32);
    uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v9;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v9 != v4) {
            objc_enumerationMutation(v1);
          }
          v6 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v5), "view", (void)v8);
          if (([v6 _isBorderedOtherThanAccessibility] & 1) == 0)
          {
            v7 = [v6 _info];
            if ([v7 _isFontScaleInvalid])
            {
              [v7 _updateStyle];
              [v7 layoutIfNeeded];
            }
          }
          ++v5;
        }
        while (v3 != v5);
        uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v3);
    }
  }
}

void __125___UIToolbarVisualProviderLegacyIOS__positionToolbarButtons_ignoringItem_resetFontScaleAdjustment_actuallyRepositionButtons___block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) objectAtIndexedSubscript:*(void *)(a1 + 48)];
  [v2 CGRectValue];
  objc_msgSend(v1, "setFrame:");
}

void __74___UIToolbarVisualProviderLegacyIOS_updateWithItems_fromOldItems_animate___block_invoke(id *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = [*(id *)(*((void *)&v18 + 1) + 8 * v6) view];
        [v7 setAlpha:0.0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }

  [a1[5] positionToolbarButtonsAndResetFontScaleAdjustment:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = a1[6];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "view", (void)v14);
        [v13 setAlpha:1.0];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }
}

void __74___UIToolbarVisualProviderLegacyIOS_updateWithItems_fromOldItems_animate___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
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
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v7, (void)v9) & 1) == 0)
        {
          id v8 = [v7 view];
          [v8 removeFromSuperview];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

@end