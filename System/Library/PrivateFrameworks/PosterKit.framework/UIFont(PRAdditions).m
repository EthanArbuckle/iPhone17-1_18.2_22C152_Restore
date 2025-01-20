@interface UIFont(PRAdditions)
- (id)pr_fontWithVariantWeight:()PRAdditions forRole:;
- (uint64_t)pr_variantWeight;
- (uint64_t)pr_variantWeightRange;
@end

@implementation UIFont(PRAdditions)

- (uint64_t)pr_variantWeight
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(a1, "pr_cachedVariantWeight");

  if (v2)
  {
    v3 = objc_msgSend(a1, "pr_cachedVariantWeight");
    uint64_t v4 = [v3 unsignedIntegerValue];

    return v4;
  }
  else
  {
    CFDictionaryRef v6 = CTFontCopyVariation((CTFontRef)a1);
    if (v6
      && ([NSNumber numberWithDouble:2003265650.0],
          v7 = objc_claimAutoreleasedReturnValue(),
          [(__CFDictionary *)v6 objectForKeyedSubscript:v7],
          v8 = objc_claimAutoreleasedReturnValue(),
          v7,
          v8))
    {
      objc_msgSend(a1, "pr_setCachedVariantWeight:", v8);
      uint64_t v9 = [v8 unsignedIntegerValue];
    }
    else
    {
      CFDictionaryRef v22 = v6;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v10 = (id)CTFontCopyVariationAxesInternal();
      uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v24;
        uint64_t v14 = *MEMORY[0x1E4F24680];
        uint64_t v15 = *MEMORY[0x1E4F24678];
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v10);
            }
            v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            v18 = [v17 objectForKeyedSubscript:v14];
            v19 = v18;
            if (v18)
            {
              if ([v18 unsignedIntegerValue] == 2003265652)
              {
                uint64_t v20 = [v17 objectForKeyedSubscript:v15];
                if (v20)
                {
                  v21 = (void *)v20;
                  objc_msgSend(a1, "pr_setCachedVariantWeight:", v20);
                  uint64_t v9 = [v21 unsignedIntegerValue];

                  goto LABEL_18;
                }
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      objc_msgSend(a1, "pr_setCachedVariantWeight:", &unk_1ED9EED88);
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:

      CFDictionaryRef v6 = v22;
    }

    return v9;
  }
}

- (uint64_t)pr_variantWeightRange
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(a1, "pr_minimumAllowedFontWeightFont");
  uint64_t v3 = objc_msgSend(a1, "pr_maximumAllowedFontWeightFont");
  uint64_t v4 = (void *)v3;
  if (v2 && v3)
  {
    uint64_t v5 = objc_msgSend(v2, "pr_variantWeight") + 1;
    objc_msgSend(v4, "pr_variantWeight");
  }
  else
  {
    v21 = (void *)v3;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v6 = (id)CTFontCopyVariationAxesInternal();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      uint64_t v10 = *MEMORY[0x1E4F24680];
      uint64_t v22 = *MEMORY[0x1E4F24690];
      uint64_t v11 = *MEMORY[0x1E4F24688];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v14 = [v13 objectForKeyedSubscript:v10];
          uint64_t v15 = v14;
          if (v14 && [v14 unsignedIntegerValue] == 2003265652)
          {
            v16 = [v13 objectForKeyedSubscript:v22];
            v17 = [v13 objectForKeyedSubscript:v11];
            v18 = v17;
            if (v16) {
              BOOL v19 = v17 == 0;
            }
            else {
              BOOL v19 = 1;
            }
            if (!v19)
            {
              uint64_t v5 = [v16 unsignedIntValue] + 1;
              [v18 unsignedIntValue];

              goto LABEL_20;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }

    uint64_t v5 = 0;
LABEL_20:
    uint64_t v4 = v21;
  }

  return v5;
}

- (id)pr_fontWithVariantWeight:()PRAdditions forRole:
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v19 = *MEMORY[0x1E4F24670];
  id v6 = NSNumber;
  id v7 = a4;
  uint64_t v8 = [v6 numberWithDouble:2003265650.0];
  v17 = v8;
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
  v18 = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v20[0] = v10;
  CFDictionaryRef v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];

  uint64_t v12 = CTFontDescriptorCreateWithAttributes(v11);
  [a1 pointSize];
  CTFontRef CopyWithAttributes = CTFontCreateCopyWithAttributes((CTFontRef)a1, v13, 0, v12);
  CFRelease(v12);
  uint64_t v15 = [(__CTFont *)CopyWithAttributes pr_fontWithDefaultFallbacksForRole:v7];

  return v15;
}

@end