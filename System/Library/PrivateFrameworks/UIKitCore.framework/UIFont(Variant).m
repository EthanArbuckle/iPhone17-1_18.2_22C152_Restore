@interface UIFont(Variant)
- (id)_fontWithVariantWeight:()Variant;
- (uint64_t)_variantWeight;
@end

@implementation UIFont(Variant)

- (uint64_t)_variantWeight
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = [a1 _cachedVariantWeight];

  if (v2)
  {
    v3 = [a1 _cachedVariantWeight];
    uint64_t v4 = [v3 unsignedIntegerValue];

    return v4;
  }
  else
  {
    CFDictionaryRef v6 = CTFontCopyVariation((CTFontRef)a1);
    CFDictionaryRef v7 = v6;
    if (v6
      && ([(__CFDictionary *)v6 objectForKeyedSubscript:&unk_1ED3F3C30],
          (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = (void *)v8;
      [a1 _setCachedVariantWeight:v8];
      uint64_t v10 = [v9 unsignedIntegerValue];
    }
    else
    {
      CFDictionaryRef v23 = v7;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      CFArrayRef v11 = CTFontCopyVariationAxes((CTFontRef)a1);
      uint64_t v12 = [(__CFArray *)v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v25;
        uint64_t v15 = *MEMORY[0x1E4F24680];
        uint64_t v16 = *MEMORY[0x1E4F24678];
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v25 != v14) {
              objc_enumerationMutation(v11);
            }
            v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            v19 = [v18 objectForKeyedSubscript:v15];
            v20 = v19;
            if (v19)
            {
              if ([v19 unsignedIntegerValue] == 2003265652)
              {
                uint64_t v21 = [v18 objectForKeyedSubscript:v16];
                if (v21)
                {
                  v22 = (void *)v21;
                  [a1 _setCachedVariantWeight:v21];
                  uint64_t v10 = [v22 unsignedIntegerValue];

                  goto LABEL_18;
                }
              }
            }
          }
          uint64_t v13 = [(__CFArray *)v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      [a1 _setCachedVariantWeight:&unk_1ED3F3C48];
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:

      CFDictionaryRef v7 = v23;
    }

    return v10;
  }
}

- (id)_fontWithVariantWeight:()Variant
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = *MEMORY[0x1E4F24670];
  v9 = &unk_1ED3F3C30;
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  uint64_t v10 = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v12[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  v5 = [a1 fontDescriptor];
  CFDictionaryRef v6 = [v5 fontDescriptorByAddingAttributes:v4];

  [a1 pointSize];
  CFDictionaryRef v7 = objc_msgSend(off_1E52D39B8, "fontWithDescriptor:size:", v6);

  return v7;
}

@end