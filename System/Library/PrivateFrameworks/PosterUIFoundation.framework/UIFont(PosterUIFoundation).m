@interface UIFont(PosterUIFoundation)
+ (CTFontRef)pui_UIFontWithPostScriptName:()PosterUIFoundation inBundleAtURL:relativePath:;
+ (__CFString)pui_defaultFontIdentifierForRole:()PosterUIFoundation;
+ (const)pui_UIFontWithName:()PosterUIFoundation forRole:includingFallbackFonts:;
+ (id)pui_UIFontWithPUIFontIdentifier:()PosterUIFoundation forRole:includingFallbackFonts:;
+ (id)pui_UIFontWithPostScriptName:()PosterUIFoundation inBundle:relativePath:;
+ (id)pui_UIFontWithPostScriptName:()PosterUIFoundation inBundleWithIdentifier:relativePath:;
+ (id)pui_defaultFont;
+ (id)pui_defaultFontForRole:()PosterUIFoundation;
+ (uint64_t)pui_UIFontWithPUIFontIdentifier:()PosterUIFoundation;
+ (uint64_t)pui_UIFontWithPUIFontIdentifier:()PosterUIFoundation forRole:;
+ (uint64_t)pui_defaultFontIdentifier;
+ (void)pui_clearCachesForInvalidation;
+ (void)pui_replacementFallbackFontNamesForRole:()PosterUIFoundation;
- (CTFontRef)pui_fontWithFallbacks:()PosterUIFoundation;
- (CTFontRef)pui_maximumAllowedFontWeightFont;
- (CTFontRef)pui_minimumAllowedFontWeightFont;
- (__CFString)pui_postScriptName;
- (id)pui_UIFontWithDefaultFallbacksForRole:()PosterUIFoundation;
- (id)pui_UIFontWithVariantWeight:()PosterUIFoundation forRole:;
- (id)pui_defaultFontFallbacks;
- (id)pui_fontFallbacks;
- (id)pui_fontWithFallbacks:()PosterUIFoundation beforeFontContainingName:;
- (id)pui_localizedTimeFontName;
- (id)pui_referencePathRelativeToBundle:()PosterUIFoundation;
- (id)pui_referencePathRelativeToDirectoryAtURL:()PosterUIFoundation;
- (id)pui_referenceURL;
- (id)pui_replaceFallbackFontNames:()PosterUIFoundation;
- (id)pui_timeFontIdentifier;
- (uint64_t)pui_isReferenceFileContainedInBundle:()PosterUIFoundation;
- (uint64_t)pui_isReferenceFileContainedInDirectoryAtURL:()PosterUIFoundation;
- (uint64_t)pui_variantWeight;
- (uint64_t)pui_variantWeightRange;
@end

@implementation UIFont(PosterUIFoundation)

+ (void)pui_clearCachesForInvalidation
{
  os_unfair_lock_lock((os_unfair_lock_t)&cachedFontLock);
  v0 = (void *)cachedFontWithDefaultFallbacks;
  cachedFontWithDefaultFallbacks = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&cachedFontLock);
  os_unfair_lock_lock((os_unfair_lock_t)&cachedDefaultFallbacksLock);
  v1 = (void *)cachedDefaultFallbacks;
  cachedDefaultFallbacks = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&cachedDefaultFallbacksLock);
}

+ (uint64_t)pui_UIFontWithPUIFontIdentifier:()PosterUIFoundation
{
  return objc_msgSend(a1, "pui_UIFontWithPUIFontIdentifier:forRole:", a3, 0);
}

+ (uint64_t)pui_UIFontWithPUIFontIdentifier:()PosterUIFoundation forRole:
{
  return objc_msgSend(a1, "pui_UIFontWithPUIFontIdentifier:forRole:includingFallbackFonts:", a3, a4, 1);
}

+ (id)pui_UIFontWithPUIFontIdentifier:()PosterUIFoundation forRole:includingFallbackFonts:
{
  id v8 = a4;
  v9 = UIFontNameForPUIFontIdentifier(a3);
  v10 = objc_msgSend(a1, "pui_UIFontWithName:forRole:includingFallbackFonts:", v9, v8, a5);

  return v10;
}

+ (const)pui_UIFontWithName:()PosterUIFoundation forRole:includingFallbackFonts:
{
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F5F458];
  v9 = a3;
  if ([v7 isEqualToString:v8]) {
    CTFontOptions v10 = 132096;
  }
  else {
    CTFontOptions v10 = 0x20000;
  }
  CTFontRef v11 = CTFontCreateWithNameAndOptions(v9, 12.0, 0, v10);

  if (a5)
  {
    v12 = [(__CTFont *)v11 pui_UIFontWithDefaultFallbacksForRole:v7];
  }
  else
  {
    v12 = v11;
  }
  v13 = v12;

  return v13;
}

+ (id)pui_UIFontWithPostScriptName:()PosterUIFoundation inBundle:relativePath:
{
  id v8 = a5;
  id v9 = a3;
  CTFontOptions v10 = [a4 bundleURL];
  CTFontRef v11 = objc_msgSend(a1, "pui_UIFontWithPostScriptName:inBundleAtURL:relativePath:", v9, v10, v8);

  return v11;
}

+ (id)pui_UIFontWithPostScriptName:()PosterUIFoundation inBundleWithIdentifier:relativePath:
{
  id v8 = a3;
  id v9 = a5;
  CTFontOptions v10 = (objc_class *)MEMORY[0x263F01858];
  id v11 = a4;
  v12 = (void *)[[v10 alloc] initWithBundleIdentifier:v11 error:0];

  v13 = [v12 URL];
  if (v13)
  {
    v14 = objc_msgSend(a1, "pui_UIFontWithPostScriptName:inBundleAtURL:relativePath:", v8, v13, v9);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (CTFontRef)pui_UIFontWithPostScriptName:()PosterUIFoundation inBundleAtURL:relativePath:
{
  v18[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [a4 URLByAppendingPathComponent:a5];
  id v9 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v8 resolvingAgainstBaseURL:1];
  CTFontOptions v10 = [MEMORY[0x263F08BD0] queryItemWithName:@"postscript-name" value:v7];

  v18[0] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  [v9 setQueryItems:v11];

  v12 = [v9 URL];
  CFArrayRef FontsWithURL = (const __CFArray *)CGFontCreateFontsWithURL();
  if (FontsWithURL)
  {
    CFArrayRef v14 = FontsWithURL;
    if (CFArrayGetCount(FontsWithURL) == 1)
    {
      ValueAtIndex = (CGFont *)CFArrayGetValueAtIndex(v14, 0);
      CTFontRef v16 = CTFontCreateWithGraphicsFont(ValueAtIndex, 12.0, 0, 0);
    }
    else
    {
      CTFontRef v16 = 0;
    }
    CFRelease(v14);
  }
  else
  {
    CTFontRef v16 = 0;
  }

  return v16;
}

+ (id)pui_defaultFont
{
  v2 = objc_msgSend(a1, "pui_defaultFontIdentifier");
  v3 = objc_msgSend(a1, "pui_UIFontWithPUIFontIdentifier:", v2);

  return v3;
}

+ (id)pui_defaultFontForRole:()PosterUIFoundation
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "pui_defaultFontIdentifierForRole:", v4);
  v6 = objc_msgSend(a1, "pui_UIFontWithPUIFontIdentifier:forRole:", v5, v4);

  return v6;
}

+ (uint64_t)pui_defaultFontIdentifier
{
  return objc_msgSend(a1, "pui_defaultFontIdentifierForRole:", *MEMORY[0x263F5F460]);
}

+ (__CFString)pui_defaultFontIdentifierForRole:()PosterUIFoundation
{
  int v3 = [a3 isEqual:*MEMORY[0x263F5F458]];
  id v4 = PUIFontIdentifierSoft;
  if (v3) {
    id v4 = PUIFontIdentifierSFPro;
  }
  v5 = *v4;
  return v5;
}

+ (void)pui_replacementFallbackFontNamesForRole:()PosterUIFoundation
{
  if ([a3 isEqual:*MEMORY[0x263F5F458]]) {
    return &unk_27081B1F0;
  }
  else {
    return 0;
  }
}

- (CTFontRef)pui_minimumAllowedFontWeightFont
{
  v1 = objc_msgSend(a1, "pui_timeFontIdentifier");
  PUIMinimumVariableFontNameForTimeFontIdentifier(v1);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v2) {
    CTFontRef v3 = CTFontCreateWithNameAndOptions(v2, 12.0, 0, 0x20000uLL);
  }
  else {
    CTFontRef v3 = 0;
  }

  return v3;
}

- (CTFontRef)pui_maximumAllowedFontWeightFont
{
  v1 = objc_msgSend(a1, "pui_timeFontIdentifier");
  PUIMaximumVariableFontNameForTimeFontIdentifier(v1);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v2) {
    CTFontRef v3 = CTFontCreateWithNameAndOptions(v2, 12.0, 0, 0x20000uLL);
  }
  else {
    CTFontRef v3 = 0;
  }

  return v3;
}

- (id)pui_UIFontWithDefaultFallbacksForRole:()PosterUIFoundation
{
  v27[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v26[0] = a1;
    v26[1] = v4;
    v6 = (void *)MEMORY[0x263EFF8C0];
    id v7 = v26;
    uint64_t v8 = 2;
  }
  else
  {
    v27[0] = a1;
    v6 = (void *)MEMORY[0x263EFF8C0];
    id v7 = v27;
    uint64_t v8 = 1;
  }
  id v9 = [v6 arrayWithObjects:v7 count:v8];
  os_unfair_lock_lock((os_unfair_lock_t)&cachedFontLock);
  CTFontOptions v10 = (void *)cachedFontWithDefaultFallbacks;
  if (!cachedFontWithDefaultFallbacks)
  {
    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    v12 = (void *)cachedFontWithDefaultFallbacks;
    cachedFontWithDefaultFallbacks = v11;

    CTFontOptions v10 = (void *)cachedFontWithDefaultFallbacks;
  }
  v13 = [v10 objectForKeyedSubscript:v9];

  if (v13)
  {
    CFArrayRef v14 = [(id)cachedFontWithDefaultFallbacks objectForKeyedSubscript:v9];
    os_unfair_lock_unlock((os_unfair_lock_t)&cachedFontLock);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&cachedFontLock);
    v15 = objc_msgSend(a1, "pui_defaultFontFallbacks");
    CFArrayRef v14 = objc_msgSend(a1, "pui_fontWithFallbacks:", v15);

    CTFontRef v16 = objc_msgSend(a1, "pui_timeFontIdentifier");
    if (([v16 isEqualToString:@"PRTimeFontIdentifierNewYorkAlpha"] & 1) != 0
      || [v16 isEqualToString:@"PRTimeFontIdentifierSFCondensed"])
    {
      v17 = UIFontNameForPUIFontIdentifier(@"PRTimeFontIdentifierSFArabic");
      v25[0] = v17;
      v18 = UIFontNameForPUIFontIdentifier(@"PRTimeFontIdentifierSFHebrew");
      v25[1] = v18;
      v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];

      uint64_t v20 = objc_msgSend(v14, "pui_fontWithFallbacks:beforeFontContainingName:", v19, @"TimesNewRomanPS-BoldMT", v25[0]);

      CFArrayRef v14 = (void *)v20;
    }
    v21 = objc_msgSend(MEMORY[0x263F1C658], "pui_replacementFallbackFontNamesForRole:", v5);
    v22 = v21;
    if (v21 && [v21 count])
    {
      uint64_t v23 = objc_msgSend(v14, "pui_replaceFallbackFontNames:", v22);

      CFArrayRef v14 = (void *)v23;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&cachedFontLock);
    [(id)cachedFontWithDefaultFallbacks setObject:v14 forKeyedSubscript:v9];
    os_unfair_lock_unlock((os_unfair_lock_t)&cachedFontLock);
  }
  return v14;
}

- (id)pui_defaultFontFallbacks
{
  os_unfair_lock_lock((os_unfair_lock_t)&cachedDefaultFallbacksLock);
  v2 = (void *)cachedDefaultFallbacks;
  if (!cachedDefaultFallbacks)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    id v4 = (void *)cachedDefaultFallbacks;
    cachedDefaultFallbacks = v3;

    v2 = (void *)cachedDefaultFallbacks;
  }
  v5 = [v2 objectForKeyedSubscript:a1];

  if (v5)
  {
    v6 = [(id)cachedDefaultFallbacks objectForKeyedSubscript:a1];
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&cachedDefaultFallbacksLock);
    CFArrayRef v7 = CTFontCopyDefaultCascadeListForLanguages(a1, 0);
    v6 = (void *)[(__CFArray *)v7 copy];
    CFRelease(v7);
    os_unfair_lock_lock((os_unfair_lock_t)&cachedDefaultFallbacksLock);
    [(id)cachedDefaultFallbacks setObject:v6 forKeyedSubscript:a1];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedDefaultFallbacksLock);
  return v6;
}

- (id)pui_fontFallbacks
{
  v2 = [a1 fontDescriptor];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x263F039A8]];

  if (v3 && [v3 count])
  {
    id v4 = v3;
  }
  else
  {
    objc_msgSend(a1, "pui_defaultFontFallbacks");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (CTFontRef)pui_fontWithFallbacks:()PosterUIFoundation
{
  CFDictionaryRef v4 = [NSDictionary dictionaryWithObject:a3 forKey:*MEMORY[0x263F039A8]];
  v5 = CTFontDescriptorCreateWithAttributes(v4);
  CTFontRef CopyWithAttributes = CTFontCreateCopyWithAttributes(a1, 0.0, 0, v5);

  return CopyWithAttributes;
}

- (id)pui_fontWithFallbacks:()PosterUIFoundation beforeFontContainingName:
{
  v41[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v23 = a1;
  id v24 = a4;
  CFArrayRef v7 = objc_msgSend(a1, "pui_fontFallbacks");
  v26 = (void *)[v7 mutableCopy];

  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  if (v24)
  {
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __77__UIFont_PosterUIFoundation__pui_fontWithFallbacks_beforeFontContainingName___block_invoke;
    v31[3] = &unk_265470D58;
    id v32 = v24;
    v33 = &v34;
    [v26 enumerateObjectsUsingBlock:v31];
  }
  uint64_t v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = *MEMORY[0x263F1D1F0];
  v41[0] = *MEMORY[0x263F1D1F0];
  CTFontOptions v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];
  uint64_t v11 = [v8 setWithArray:v10];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v6;
  uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        CTFontRef v16 = (void *)MEMORY[0x263F1C660];
        uint64_t v38 = v9;
        uint64_t v39 = v15;
        v17 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        v18 = [v16 fontDescriptorWithFontAttributes:v17];

        MatchingFontDescriptorsWithOptions = (void *)CTFontDescriptorCreateMatchingFontDescriptorsWithOptions();
        uint64_t v20 = [MatchingFontDescriptorsWithOptions firstObject];

        if (v20) {
          [v26 insertObject:v20 atIndex:v35[3]++];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v40 count:16];
    }
    while (v12);
  }

  v21 = objc_msgSend(v23, "pui_fontWithFallbacks:", v26);

  _Block_object_dispose(&v34, 8);
  return v21;
}

- (id)pui_replaceFallbackFontNames:()PosterUIFoundation
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(a1, "pui_fontFallbacks");
  id v6 = (void *)[v5 mutableCopy];

  CFArrayRef v7 = (void *)MEMORY[0x263EFFA08];
  v19[0] = *MEMORY[0x263F1D1F0];
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  uint64_t v9 = [v7 setWithArray:v8];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__UIFont_PosterUIFoundation__pui_replaceFallbackFontNames___block_invoke;
  v15[3] = &unk_265470D80;
  id v16 = v4;
  id v17 = v9;
  id v18 = v6;
  id v10 = v6;
  id v11 = v9;
  id v12 = v4;
  [v10 enumerateObjectsUsingBlock:v15];
  uint64_t v13 = objc_msgSend(a1, "pui_fontWithFallbacks:", v10);

  return v13;
}

- (id)pui_timeFontIdentifier
{
  v1 = [a1 fontName];
  v2 = PUIFontIdentifierForFontName(v1);

  return v2;
}

- (id)pui_localizedTimeFontName
{
  v2 = objc_msgSend(a1, "pui_timeFontIdentifier");
  uint64_t v3 = v2;
  if (v2) {
    PUILocalizedDisplayNameForTimeFontIdentifier(v2);
  }
  else {
  id v4 = [a1 familyName];
  }

  return v4;
}

- (__CFString)pui_postScriptName
{
  v1 = (__CFString *)CTFontCopyPostScriptName(a1);
  return v1;
}

- (id)pui_referenceURL
{
  v1 = [a1 fontDescriptor];
  v2 = (void *)CTFontDescriptorCopyAttribute(v1, (CFStringRef)*MEMORY[0x263F03B20]);

  return v2;
}

- (id)pui_referencePathRelativeToBundle:()PosterUIFoundation
{
  id v4 = [a3 bundleURL];
  v5 = objc_msgSend(a1, "pui_referencePathRelativeToDirectoryAtURL:", v4);

  return v5;
}

- (id)pui_referencePathRelativeToDirectoryAtURL:()PosterUIFoundation
{
  id v4 = a3;
  if (objc_msgSend(a1, "pui_isReferenceFileContainedInDirectoryAtURL:", v4))
  {
    v5 = objc_msgSend(a1, "pui_referenceURL");
    id v6 = [v5 path];
    CFArrayRef v7 = [v4 path];
    if ([v6 hasPrefix:v7])
    {
      uint64_t v8 = objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v7, "length"));
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (uint64_t)pui_isReferenceFileContainedInBundle:()PosterUIFoundation
{
  id v4 = [a3 bundleURL];
  uint64_t v5 = objc_msgSend(a1, "pui_isReferenceFileContainedInDirectoryAtURL:", v4);

  return v5;
}

- (uint64_t)pui_isReferenceFileContainedInDirectoryAtURL:()PosterUIFoundation
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "pui_referenceURL");
  id v6 = (void *)v5;
  uint64_t v7 = 0;
  if (v4 && v5)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F08850]);
    uint64_t v11 = 0;
    unsigned int v9 = [v8 getRelationship:&v11 ofDirectoryAtURL:v4 toItemAtURL:v6 error:0];
    if (v11) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v9;
    }
  }
  return v7;
}

- (uint64_t)pui_variantWeight
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(a1, "pui_cachedVariantWeight");

  if (v2)
  {
    uint64_t v3 = objc_msgSend(a1, "pui_cachedVariantWeight");
    uint64_t v4 = [v3 unsignedIntegerValue];

    return v4;
  }
  else
  {
    CFDictionaryRef v6 = CTFontCopyVariation((CTFontRef)a1);
    if (v6
      && ([NSNumber numberWithDouble:2003265650.0],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          [(__CFDictionary *)v6 objectForKeyedSubscript:v7],
          id v8 = objc_claimAutoreleasedReturnValue(),
          v7,
          v8))
    {
      objc_msgSend(a1, "pui_setCachedVariantWeight:", v8);
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
        uint64_t v14 = *MEMORY[0x263F03BD0];
        uint64_t v15 = *MEMORY[0x263F03BC8];
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v10);
            }
            id v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            id v18 = [v17 objectForKeyedSubscript:v14];
            v19 = v18;
            if (v18)
            {
              if ([v18 unsignedIntegerValue] == 2003265652)
              {
                uint64_t v20 = [v17 objectForKeyedSubscript:v15];
                if (v20)
                {
                  v21 = (void *)v20;
                  objc_msgSend(a1, "pui_setCachedVariantWeight:", v20);
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

      objc_msgSend(a1, "pui_setCachedVariantWeight:", &unk_27081B218);
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:

      CFDictionaryRef v6 = v22;
    }

    return v9;
  }
}

- (uint64_t)pui_variantWeightRange
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(a1, "pui_minimumAllowedFontWeightFont");
  uint64_t v3 = objc_msgSend(a1, "pui_maximumAllowedFontWeightFont");
  uint64_t v4 = (void *)v3;
  if (v2 && v3)
  {
    uint64_t v5 = objc_msgSend(v2, "pui_variantWeight") + 1;
    objc_msgSend(v4, "pui_variantWeight");
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
      uint64_t v10 = *MEMORY[0x263F03BD0];
      uint64_t v22 = *MEMORY[0x263F03BE0];
      uint64_t v11 = *MEMORY[0x263F03BD8];
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
            id v16 = [v13 objectForKeyedSubscript:v22];
            id v17 = [v13 objectForKeyedSubscript:v11];
            id v18 = v17;
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

- (id)pui_UIFontWithVariantWeight:()PosterUIFoundation forRole:
{
  v20[1] = *MEMORY[0x263EF8340];
  uint64_t v19 = *MEMORY[0x263F03BC0];
  id v6 = NSNumber;
  id v7 = a4;
  uint64_t v8 = [v6 numberWithDouble:2003265650.0];
  id v17 = v8;
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
  id v18 = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v20[0] = v10;
  CFDictionaryRef v11 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];

  uint64_t v12 = CTFontDescriptorCreateWithAttributes(v11);
  [a1 pointSize];
  CTFontRef CopyWithAttributes = CTFontCreateCopyWithAttributes((CTFontRef)a1, v13, 0, v12);
  CFRelease(v12);
  uint64_t v15 = [(__CTFont *)CopyWithAttributes pui_UIFontWithDefaultFallbacksForRole:v7];

  return v15;
}

@end