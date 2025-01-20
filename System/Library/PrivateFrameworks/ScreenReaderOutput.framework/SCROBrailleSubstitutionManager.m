@interface SCROBrailleSubstitutionManager
+ (id)_bundleForStrings;
+ (id)sharedInstance;
- (SCROBrailleSubstitutionManager)init;
- (id)brailleSubstitutionForType:(int64_t)a3 withLanguage:(id)a4;
- (id)stringWithBrailleSubstitutions:(id)a3 withLanguage:(id)a4;
- (void)_ensureLanguageDataPresent:(id)a3;
- (void)_loadLanguageSubstitutions:(id)a3 intoDictionary:(id)a4;
@end

@implementation SCROBrailleSubstitutionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_Manager;

  return v2;
}

uint64_t __48__SCROBrailleSubstitutionManager_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  sharedInstance_Manager = v0;

  return MEMORY[0x270F9A758](v0);
}

- (SCROBrailleSubstitutionManager)init
{
  v19[1] = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)SCROBrailleSubstitutionManager;
  v2 = [(SCROBrailleSubstitutionManager *)&v18 init];
  id v3 = objc_alloc(MEMORY[0x263F08948]);
  v19[0] = *MEMORY[0x263F082D8];
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  uint64_t v5 = [v3 initWithTagSchemes:v4 options:0];
  linguisticTagger = v2->_linguisticTagger;
  v2->_linguisticTagger = (NSLinguisticTagger *)v5;

  v2->_taggerLock._os_unfair_lock_opaque = 0;
  uint64_t v7 = objc_opt_new();
  lookup = v2->_lookup;
  v2->_lookup = (NSMutableDictionary *)v7;

  v9 = objc_opt_new();
  v10 = v2->_lookup;
  v11 = [MEMORY[0x263EFF960] currentLocale];
  v12 = [v11 languageCode];
  [(NSMutableDictionary *)v10 setObject:v9 forKeyedSubscript:v12];

  v13 = [(id)objc_opt_class() _bundleForStrings];
  CFURLRef v14 = [v13 bundleURL];
  CFBundleRef v15 = CFBundleCreate(0, v14);

  v16 = (void *)CFBundleCopyLocalizedStringTableForLocalization();
  CFRelease(v15);
  [(SCROBrailleSubstitutionManager *)v2 _loadLanguageSubstitutions:v16 intoDictionary:v9];

  return v2;
}

- (void)_loadLanguageSubstitutions:(id)a3 intoDictionary:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v16 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = [v5 allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v11 hasSuffix:@"_FULL"])
        {
          v12 = [v11 stringByReplacingOccurrencesOfString:@"_FULL" withString:@"_SHORT"];
          v13 = [v5 objectForKeyedSubscript:v12];
          if (v13)
          {
            CFURLRef v14 = [v5 objectForKeyedSubscript:v11];
            CFBundleRef v15 = [v14 lowercaseString];
            [v16 setObject:v13 forKeyedSubscript:v15];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

+ (id)_bundleForStrings
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SCROBrailleSubstitutionManager__bundleForStrings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_bundleForStrings_onceToken != -1) {
    dispatch_once(&_bundleForStrings_onceToken, block);
  }
  v2 = (void *)_bundleForStrings_Bundle;

  return v2;
}

uint64_t __51__SCROBrailleSubstitutionManager__bundleForStrings__block_invoke()
{
  if (+[SCROConnection inUnitTests]) {
    [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/ScreenReaderOutput.framework"];
  }
  else {
  uint64_t v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  }
  _bundleForStrings_Bundle = v0;

  return MEMORY[0x270F9A758](v0);
}

- (id)brailleSubstitutionForType:(int64_t)a3 withLanguage:(id)a4
{
  id v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:a4];
  if (a3 == 1 || a3 == 2)
  {
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v7 = [(id)objc_opt_class() _bundleForStrings];
    CFURLRef v8 = [v7 bundleURL];
    CFBundleRef v9 = CFBundleCreate(v6, v8);

    v10 = [v5 languageCode];
    v11 = (void *)CFBundleCopyLocalizedStringForLocalization();

    if (v9) {
      CFRelease(v9);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_ensureLanguageDataPresent:(id)a3
{
  id v12 = a3;
  v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_lookup, "objectForKeyedSubscript:");

  if (!v4)
  {
    id v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v12];
    CFAllocatorRef v6 = [(id)objc_opt_class() _bundleForStrings];
    CFURLRef v7 = [v6 bundleURL];
    CFBundleRef v8 = CFBundleCreate(0, v7);

    CFBundleRef v9 = [v5 languageCode];
    v10 = (void *)CFBundleCopyLocalizedStringTableForLocalization();

    CFRelease(v8);
    v11 = objc_opt_new();
    [(NSMutableDictionary *)self->_lookup setObject:v11 forKeyedSubscript:v12];
    [(SCROBrailleSubstitutionManager *)self _loadLanguageSubstitutions:v10 intoDictionary:v11];
  }
}

- (id)stringWithBrailleSubstitutions:(id)a3 withLanguage:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v42 = v6;
  if (![v6 length])
  {
    id v9 = v6;
    goto LABEL_22;
  }
  CFBundleRef v8 = (void *)[v6 copy];
  if (v7)
  {
    [(SCROBrailleSubstitutionManager *)self _ensureLanguageDataPresent:v7];
  }
  else
  {
    v10 = [MEMORY[0x263EFF960] currentLocale];
    id v7 = [v10 languageCode];
  }
  id v39 = v7;
  v41 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v7];
  v11 = (void *)MEMORY[0x263F08A58];
  id v12 = [v41 languageCode];
  v40 = [v11 defaultOrthographyForLanguage:v12];

  os_unfair_lock_t lock = &self->_taggerLock;
  os_unfair_lock_lock(&self->_taggerLock);
  [(NSLinguisticTagger *)self->_linguisticTagger setString:v8];
  -[NSLinguisticTagger setOrthography:range:](self->_linguisticTagger, "setOrthography:range:", v40, 0, [v8 length]);
  v13 = [(NSMutableDictionary *)self->_lookup objectForKeyedSubscript:v39];
  CFURLRef v14 = [MEMORY[0x263EFF980] array];
  linguisticTagger = self->_linguisticTagger;
  uint64_t v16 = [v8 length];
  uint64_t v17 = *MEMORY[0x263F082D8];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __78__SCROBrailleSubstitutionManager_stringWithBrailleSubstitutions_withLanguage___block_invoke;
  v45[3] = &unk_264414D18;
  id v18 = v8;
  id v46 = v18;
  id v19 = v14;
  id v47 = v19;
  -[NSLinguisticTagger enumerateTagsInRange:scheme:options:usingBlock:](linguisticTagger, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v16, v17, 0, v45);
  if (![v19 count])
  {
    os_unfair_lock_unlock(lock);
LABEL_20:
    id v9 = v18;
    id v36 = 0;
    goto LABEL_21;
  }
  uint64_t v20 = 0;
  v43 = 0;
  uint64_t v44 = 0;
  int v21 = 0;
  do
  {
    uint64_t v22 = objc_msgSend(v19, "objectAtIndexedSubscript:", v20, lock);
    uint64_t v23 = [v22 rangeValue];

    uint64_t v24 = 3;
    while (1)
    {
      if ([v19 count] > (unint64_t)(v21 + v24))
      {
        v25 = objc_msgSend(v19, "objectAtIndexedSubscript:");
        uint64_t v26 = [v25 rangeValue];
        uint64_t v28 = v27;

        uint64_t v29 = v28 - v23 + v26;
        v30 = objc_msgSend(v18, "substringWithRange:", v23, v29);
        v31 = [v30 lowercaseString];
        v32 = [v13 objectForKeyedSubscript:v31];

        if (v32) {
          break;
        }
      }
      if (--v24 == -1) {
        goto LABEL_16;
      }
    }
    v33 = v43;
    if (!v43) {
      v33 = (void *)[v18 mutableCopy];
    }
    v43 = v33;
    objc_msgSend(v33, "replaceCharactersInRange:withString:", v23 + v44, v29, v32);
    uint64_t v34 = [v32 length];

    v21 += v24;
    uint64_t v44 = v44 - v29 + v34;
LABEL_16:
    unint64_t v35 = [v19 count];
    uint64_t v20 = ++v21;
  }
  while (v35 > v21);
  os_unfair_lock_unlock(lock);
  if (!v43) {
    goto LABEL_20;
  }
  id v36 = v43;
  id v9 = v36;
LABEL_21:

  id v7 = v39;
LABEL_22:

  return v9;
}

void __78__SCROBrailleSubstitutionManager_stringWithBrailleSubstitutions_withLanguage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if ([a2 isEqualToString:*MEMORY[0x263F082F8]]
    && a3 + a4 <= (unint64_t)[*(id *)(a1 + 32) length])
  {
    id v7 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", a3, a4);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v7 addObject:v8];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linguisticTagger, 0);

  objc_storeStrong((id *)&self->_lookup, 0);
}

@end