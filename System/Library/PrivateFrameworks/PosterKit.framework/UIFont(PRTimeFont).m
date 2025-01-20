@interface UIFont(PRTimeFont)
+ (CTFontRef)pr_fontWithPostScriptName:()PRTimeFont inBundleAtURL:relativePath:;
+ (__CFString)pr_defaultTimeFontIdentifierForRole:()PRTimeFont;
+ (id)pr_defaultTimeFont;
+ (id)pr_defaultTimeFontForRole:()PRTimeFont;
+ (id)pr_downloadableFontWithPostScriptName:()PRTimeFont;
+ (id)pr_fontWithName:()PRTimeFont forRole:includingFallbackFonts:;
+ (id)pr_fontWithPostScriptName:()PRTimeFont inBundle:relativePath:;
+ (id)pr_fontWithPostScriptName:()PRTimeFont inBundleWithIdentifier:relativePath:;
+ (id)pr_fontWithTimeFontIdentifier:()PRTimeFont forRole:includingFallbackFonts:;
+ (uint64_t)pr_defaultTimeFontIdentifier;
+ (uint64_t)pr_fontWithTimeFontIdentifier:()PRTimeFont;
+ (uint64_t)pr_fontWithTimeFontIdentifier:()PRTimeFont forRole:;
+ (void)pr_clearCachesForInvalidation;
+ (void)pr_replacementFallbackFontNamesForRole:()PRTimeFont;
- (CTFontRef)pr_fontWithFallbacks:()PRTimeFont;
- (CTFontRef)pr_maximumAllowedFontWeightFont;
- (CTFontRef)pr_minimumAllowedFontWeightFont;
- (__CFString)pr_postScriptName;
- (id)pr_defaultFontFallbacks;
- (id)pr_fontFallbacks;
- (id)pr_fontWithDefaultFallbacksForRole:()PRTimeFont;
- (id)pr_fontWithFallbacks:()PRTimeFont beforeFontContainingName:;
- (id)pr_localizedTimeFontName;
- (id)pr_referencePathRelativeToBundle:()PRTimeFont;
- (id)pr_referencePathRelativeToDirectoryAtURL:()PRTimeFont;
- (id)pr_referenceURL;
- (id)pr_replaceFallbackFontNames:()PRTimeFont;
- (id)pr_timeFontIdentifier;
- (uint64_t)pr_isReferenceFileContainedInBundle:()PRTimeFont;
- (uint64_t)pr_isReferenceFileContainedInDirectoryAtURL:()PRTimeFont;
@end

@implementation UIFont(PRTimeFont)

+ (void)pr_clearCachesForInvalidation
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

+ (uint64_t)pr_fontWithTimeFontIdentifier:()PRTimeFont
{
  return objc_msgSend(a1, "pr_fontWithTimeFontIdentifier:forRole:", a3, 0);
}

+ (uint64_t)pr_fontWithTimeFontIdentifier:()PRTimeFont forRole:
{
  return objc_msgSend(a1, "pr_fontWithTimeFontIdentifier:forRole:includingFallbackFonts:", a3, a4, 1);
}

+ (id)pr_fontWithTimeFontIdentifier:()PRTimeFont forRole:includingFallbackFonts:
{
  id v8 = a4;
  v9 = PRFontNameForTimeFontIdentifier(a3);
  v10 = objc_msgSend(a1, "pr_fontWithName:forRole:includingFallbackFonts:", v9, v8, a5);

  return v10;
}

+ (id)pr_fontWithName:()PRTimeFont forRole:includingFallbackFonts:
{
  v7 = a3;
  id v8 = a4;
  v9 = PRTimeFontIdentifierForFontName(v7);
  v10 = v9;
  if (!v9
    || !PRTimeFontIsDownloadable(v9)
    || (objc_msgSend(MEMORY[0x1E4FB08E0], "pr_downloadableFontWithPostScriptName:", v7),
        (v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([v8 isEqualToString:@"PRPosterRoleIncomingCall"]) {
      CTFontOptions v12 = 132096;
    }
    else {
      CTFontOptions v12 = 0x20000;
    }
    CTFontRef v13 = CTFontCreateWithNameAndOptions(v7, 12.0, 0, v12);
    CTFontRef v14 = v13;
    if (a5)
    {
      v15 = [(__CTFont *)v13 pr_fontWithDefaultFallbacksForRole:v8];
    }
    else
    {
      v15 = v13;
    }
    v11 = v15;
  }
  return v11;
}

+ (id)pr_fontWithPostScriptName:()PRTimeFont inBundle:relativePath:
{
  id v8 = a5;
  id v9 = a3;
  v10 = [a4 bundleURL];
  v11 = objc_msgSend(a1, "pr_fontWithPostScriptName:inBundleAtURL:relativePath:", v9, v10, v8);

  return v11;
}

+ (id)pr_fontWithPostScriptName:()PRTimeFont inBundleWithIdentifier:relativePath:
{
  id v8 = a3;
  id v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E4F223A0];
  id v11 = a4;
  CTFontOptions v12 = (void *)[[v10 alloc] initWithBundleIdentifier:v11 error:0];

  CTFontRef v13 = [v12 URL];
  if (v13)
  {
    CTFontRef v14 = objc_msgSend(a1, "pr_fontWithPostScriptName:inBundleAtURL:relativePath:", v8, v13, v9);
  }
  else
  {
    CTFontRef v14 = 0;
  }

  return v14;
}

+ (CTFontRef)pr_fontWithPostScriptName:()PRTimeFont inBundleAtURL:relativePath:
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_14:
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"UIFont+TimeFontUtilities.m", 85, @"Invalid parameter not satisfying: %@", @"bundleURL" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, a1, @"UIFont+TimeFontUtilities.m", 84, @"Invalid parameter not satisfying: %@", @"postScriptName" object file lineNumber description];

  if (!v10) {
    goto LABEL_14;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_15:
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, a1, @"UIFont+TimeFontUtilities.m", 86, @"Invalid parameter not satisfying: %@", @"bundleRelativePath" object file lineNumber description];

LABEL_4:
  CTFontOptions v12 = [v10 URLByAppendingPathComponent:v11];
  CTFontRef v13 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v12 resolvingAgainstBaseURL:1];
  CTFontRef v14 = [MEMORY[0x1E4F290C8] queryItemWithName:@"postscript-name" value:v9];
  v25[0] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  [v13 setQueryItems:v15];

  v16 = [v13 URL];
  CFArrayRef FontsWithURL = (const __CFArray *)CGFontCreateFontsWithURL();
  if (FontsWithURL)
  {
    CFArrayRef v18 = FontsWithURL;
    if (CFArrayGetCount(FontsWithURL) == 1)
    {
      ValueAtIndex = (CGFont *)CFArrayGetValueAtIndex(v18, 0);
      CTFontRef v20 = CTFontCreateWithGraphicsFont(ValueAtIndex, 12.0, 0, 0);
    }
    else
    {
      CTFontRef v20 = 0;
    }
    CFRelease(v18);
  }
  else
  {
    CTFontRef v20 = 0;
  }

  return v20;
}

+ (id)pr_downloadableFontWithPostScriptName:()PRTimeFont
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F245A8];
  v24[0] = v3;
  CFDictionaryRef v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  CTFontDescriptorRef v5 = CTFontDescriptorCreateWithAttributes(v4);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 1;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  CTFontDescriptorRef v22 = v5;
  CFArrayRef v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  progressBlock[0] = MEMORY[0x1E4F143A8];
  progressBlock[1] = 3221225472;
  progressBlock[2] = __60__UIFont_PRTimeFont__pr_downloadableFontWithPostScriptName___block_invoke;
  progressBlock[3] = &unk_1E54DBF30;
  CTFontRef v14 = &v18;
  v15 = v16;
  id v8 = v6;
  CTFontRef v13 = v8;
  CTFontDescriptorMatchFontDescriptorsWithProgressHandler(v7, 0, progressBlock);

  dispatch_time_t v9 = dispatch_time(0, 750000000);
  dispatch_semaphore_wait(v8, v9);
  if (*((unsigned char *)v19 + 24))
  {
    id v10 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:48.0];
  }
  else
  {
    id v10 = 0;
  }

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

+ (id)pr_defaultTimeFont
{
  v2 = objc_msgSend(a1, "pr_defaultTimeFontIdentifier");
  id v3 = objc_msgSend(a1, "pr_fontWithTimeFontIdentifier:", v2);

  return v3;
}

+ (id)pr_defaultTimeFontForRole:()PRTimeFont
{
  id v4 = a3;
  CTFontDescriptorRef v5 = objc_msgSend(a1, "pr_defaultTimeFontIdentifierForRole:", v4);
  dispatch_semaphore_t v6 = objc_msgSend(a1, "pr_fontWithTimeFontIdentifier:forRole:", v5, v4);

  return v6;
}

+ (uint64_t)pr_defaultTimeFontIdentifier
{
  return objc_msgSend(a1, "pr_defaultTimeFontIdentifierForRole:", @"PRPosterRoleLockScreen");
}

+ (__CFString)pr_defaultTimeFontIdentifierForRole:()PRTimeFont
{
  int v3 = [a3 isEqual:@"PRPosterRoleIncomingCall"];
  id v4 = PRTimeFontIdentifierSoft;
  if (v3) {
    id v4 = PRTimeFontIdentifierSFPro;
  }
  CTFontDescriptorRef v5 = *v4;
  return v5;
}

+ (void)pr_replacementFallbackFontNamesForRole:()PRTimeFont
{
  if ([a3 isEqual:@"PRPosterRoleIncomingCall"]) {
    return &unk_1ED9EF250;
  }
  else {
    return 0;
  }
}

- (CTFontRef)pr_minimumAllowedFontWeightFont
{
  v1 = objc_msgSend(a1, "pr_timeFontIdentifier");
  PRMinimumVariableFontNameForTimeFontIdentifier(v1);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v2) {
    CTFontRef v3 = CTFontCreateWithNameAndOptions(v2, 12.0, 0, 0x20000uLL);
  }
  else {
    CTFontRef v3 = 0;
  }

  return v3;
}

- (CTFontRef)pr_maximumAllowedFontWeightFont
{
  v1 = objc_msgSend(a1, "pr_timeFontIdentifier");
  PRMaximumVariableFontNameForTimeFontIdentifier(v1);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v2) {
    CTFontRef v3 = CTFontCreateWithNameAndOptions(v2, 12.0, 0, 0x20000uLL);
  }
  else {
    CTFontRef v3 = 0;
  }

  return v3;
}

- (id)pr_fontWithDefaultFallbacksForRole:()PRTimeFont
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CTFontDescriptorRef v5 = v4;
  if (v4)
  {
    v26[0] = a1;
    v26[1] = v4;
    dispatch_semaphore_t v6 = (void *)MEMORY[0x1E4F1C978];
    CFArrayRef v7 = v26;
    uint64_t v8 = 2;
  }
  else
  {
    v27[0] = a1;
    dispatch_semaphore_t v6 = (void *)MEMORY[0x1E4F1C978];
    CFArrayRef v7 = v27;
    uint64_t v8 = 1;
  }
  dispatch_time_t v9 = [v6 arrayWithObjects:v7 count:v8];
  os_unfair_lock_lock((os_unfair_lock_t)&cachedFontLock);
  id v10 = (void *)cachedFontWithDefaultFallbacks;
  if (!cachedFontWithDefaultFallbacks)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    CTFontOptions v12 = (void *)cachedFontWithDefaultFallbacks;
    cachedFontWithDefaultFallbacks = v11;

    id v10 = (void *)cachedFontWithDefaultFallbacks;
  }
  CTFontRef v13 = [v10 objectForKeyedSubscript:v9];

  if (v13)
  {
    CTFontRef v14 = [(id)cachedFontWithDefaultFallbacks objectForKeyedSubscript:v9];
    os_unfair_lock_unlock((os_unfair_lock_t)&cachedFontLock);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&cachedFontLock);
    v15 = objc_msgSend(a1, "pr_defaultFontFallbacks");
    CTFontRef v14 = objc_msgSend(a1, "pr_fontWithFallbacks:", v15);

    v16 = objc_msgSend(a1, "pr_timeFontIdentifier");
    if (([v16 isEqualToString:@"PRTimeFontIdentifierNewYorkAlpha"] & 1) != 0
      || [v16 isEqualToString:@"PRTimeFontIdentifierSFCondensed"])
    {
      char v17 = PRFontNameForTimeFontIdentifier(@"PRTimeFontIdentifierSFArabic");
      v25[0] = v17;
      uint64_t v18 = PRFontNameForTimeFontIdentifier(@"PRTimeFontIdentifierSFHebrew");
      v25[1] = v18;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];

      uint64_t v20 = objc_msgSend(v14, "pr_fontWithFallbacks:beforeFontContainingName:", v19, @"TimesNewRomanPS-BoldMT", v25[0]);

      CTFontRef v14 = (void *)v20;
    }
    char v21 = objc_msgSend(MEMORY[0x1E4FB08E0], "pr_replacementFallbackFontNamesForRole:", v5);
    CTFontDescriptorRef v22 = v21;
    if (v21 && [v21 count])
    {
      uint64_t v23 = objc_msgSend(v14, "pr_replaceFallbackFontNames:", v22);

      CTFontRef v14 = (void *)v23;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&cachedFontLock);
    [(id)cachedFontWithDefaultFallbacks setObject:v14 forKeyedSubscript:v9];
    os_unfair_lock_unlock((os_unfair_lock_t)&cachedFontLock);
  }
  return v14;
}

- (id)pr_defaultFontFallbacks
{
  os_unfair_lock_lock((os_unfair_lock_t)&cachedDefaultFallbacksLock);
  v2 = (void *)cachedDefaultFallbacks;
  if (!cachedDefaultFallbacks)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    id v4 = (void *)cachedDefaultFallbacks;
    cachedDefaultFallbacks = v3;

    v2 = (void *)cachedDefaultFallbacks;
  }
  CTFontDescriptorRef v5 = [v2 objectForKeyedSubscript:a1];

  if (v5)
  {
    dispatch_semaphore_t v6 = [(id)cachedDefaultFallbacks objectForKeyedSubscript:a1];
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&cachedDefaultFallbacksLock);
    CFArrayRef v7 = CTFontCopyDefaultCascadeListForLanguages(a1, 0);
    dispatch_semaphore_t v6 = (void *)[(__CFArray *)v7 copy];
    CFRelease(v7);
    os_unfair_lock_lock((os_unfair_lock_t)&cachedDefaultFallbacksLock);
    [(id)cachedDefaultFallbacks setObject:v6 forKeyedSubscript:a1];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedDefaultFallbacksLock);
  return v6;
}

- (id)pr_fontFallbacks
{
  v2 = [a1 fontDescriptor];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F24410]];

  if (v3 && [v3 count])
  {
    id v4 = v3;
  }
  else
  {
    objc_msgSend(a1, "pr_defaultFontFallbacks");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  CTFontDescriptorRef v5 = v4;

  return v5;
}

- (CTFontRef)pr_fontWithFallbacks:()PRTimeFont
{
  CFDictionaryRef v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a3 forKey:*MEMORY[0x1E4F24410]];
  CTFontDescriptorRef v5 = CTFontDescriptorCreateWithAttributes(v4);
  CTFontRef CopyWithAttributes = CTFontCreateCopyWithAttributes(a1, 0.0, 0, v5);

  return CopyWithAttributes;
}

- (id)pr_fontWithFallbacks:()PRTimeFont beforeFontContainingName:
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v23 = a1;
  id v24 = a4;
  CFArrayRef v7 = objc_msgSend(a1, "pr_fontFallbacks");
  v26 = (void *)[v7 mutableCopy];

  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  if (v24)
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __68__UIFont_PRTimeFont__pr_fontWithFallbacks_beforeFontContainingName___block_invoke;
    v31[3] = &unk_1E54DBF58;
    id v32 = v24;
    v33 = &v34;
    [v26 enumerateObjectsUsingBlock:v31];
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = *MEMORY[0x1E4FB0918];
  v41[0] = *MEMORY[0x1E4FB0918];
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
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
        v16 = (void *)MEMORY[0x1E4FB08E8];
        uint64_t v38 = v9;
        uint64_t v39 = v15;
        char v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        uint64_t v18 = [v16 fontDescriptorWithFontAttributes:v17];

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

  char v21 = objc_msgSend(v23, "pr_fontWithFallbacks:", v26);

  _Block_object_dispose(&v34, 8);
  return v21;
}

- (id)pr_replaceFallbackFontNames:()PRTimeFont
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CTFontDescriptorRef v5 = objc_msgSend(a1, "pr_fontFallbacks");
  id v6 = (void *)[v5 mutableCopy];

  CFArrayRef v7 = (void *)MEMORY[0x1E4F1CAD0];
  v19[0] = *MEMORY[0x1E4FB0918];
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  uint64_t v9 = [v7 setWithArray:v8];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__UIFont_PRTimeFont__pr_replaceFallbackFontNames___block_invoke;
  v15[3] = &unk_1E54DBF80;
  id v16 = v4;
  id v17 = v9;
  id v18 = v6;
  id v10 = v6;
  id v11 = v9;
  id v12 = v4;
  [v10 enumerateObjectsUsingBlock:v15];
  uint64_t v13 = objc_msgSend(a1, "pr_fontWithFallbacks:", v10);

  return v13;
}

- (id)pr_timeFontIdentifier
{
  v1 = [a1 fontName];
  v2 = PRTimeFontIdentifierForFontName(v1);

  return v2;
}

- (id)pr_localizedTimeFontName
{
  v2 = objc_msgSend(a1, "pr_timeFontIdentifier");
  uint64_t v3 = v2;
  if (v2) {
    PRLocalizedDisplayNameForTimeFontIdentifier(v2);
  }
  else {
  id v4 = [a1 familyName];
  }

  return v4;
}

- (__CFString)pr_postScriptName
{
  v1 = (__CFString *)CTFontCopyPostScriptName(a1);
  return v1;
}

- (id)pr_referenceURL
{
  v1 = [a1 fontDescriptor];
  v2 = (void *)CTFontDescriptorCopyAttribute(v1, (CFStringRef)*MEMORY[0x1E4F245E0]);

  return v2;
}

- (id)pr_referencePathRelativeToBundle:()PRTimeFont
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"UIFont+TimeFontUtilities.m", 366, @"Invalid parameter not satisfying: %@", @"bundle != nil" object file lineNumber description];
  }
  id v6 = [v5 bundleURL];
  CFArrayRef v7 = objc_msgSend(a1, "pr_referencePathRelativeToDirectoryAtURL:", v6);

  return v7;
}

- (id)pr_referencePathRelativeToDirectoryAtURL:()PRTimeFont
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"UIFont+TimeFontUtilities.m", 372, @"Invalid parameter not satisfying: %@", @"directoryURL != nil" object file lineNumber description];
  }
  if (objc_msgSend(a1, "pr_isReferenceFileContainedInDirectoryAtURL:", v5))
  {
    id v6 = objc_msgSend(a1, "pr_referenceURL");
    CFArrayRef v7 = [v6 path];
    uint64_t v8 = [v5 path];
    if ([v7 hasPrefix:v8])
    {
      uint64_t v9 = objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v8, "length"));
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (uint64_t)pr_isReferenceFileContainedInBundle:()PRTimeFont
{
  id v4 = [a3 bundleURL];
  uint64_t v5 = objc_msgSend(a1, "pr_isReferenceFileContainedInDirectoryAtURL:", v4);

  return v5;
}

- (uint64_t)pr_isReferenceFileContainedInDirectoryAtURL:()PRTimeFont
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "pr_referenceURL");
  id v6 = (void *)v5;
  uint64_t v7 = 0;
  if (v4 && v5)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
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

@end