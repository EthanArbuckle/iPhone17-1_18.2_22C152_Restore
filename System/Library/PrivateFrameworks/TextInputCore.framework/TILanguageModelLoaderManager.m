@interface TILanguageModelLoaderManager
+ (id)knownClients;
+ (id)modelLocalesForInputModes:(id)a3;
+ (id)recipientRecords;
+ (id)sharedLanguageModelLoaderForModelLocaleIdentifier:(id)a3 isMultilingualModel:(BOOL)a4 customResourcePaths:(id)a5 dynamicResourcePath:(id)a6 mobileAssets:(id)a7 usesLinguisticContext:(BOOL)a8 isMultiLingualModeEnabled:(BOOL)a9 validEnglishTransformerMultilingualConfig:(BOOL)a10 isSiriMode:(BOOL)a11 trialParameters:(id)a12 isInlineCompletionEnabled:(BOOL)a13;
+ (shared_ptr<KB::LanguageModel>)modelForLocale:(id)a3 isMultilingualModel:(BOOL)a4 languageLocales:(id)a5 adaptationContext:(id)a6 staticResourcePaths:(id)a7 dynamicResourcePath:(id)a8 isMultiLingualModeEnabled:(BOOL)a9 isSiriMode:(BOOL)a10 validEnglishTransformerMultilingualConfig:(BOOL)a11 trialParameters:(id)a12 inlineCompletionPrecision:(int)a13 isInlineCompletionEnabled:(BOOL)a14;
+ (shared_ptr<KB::LanguageModel>)stubForModelLocale:(id)a3 isMultilingualModel:(BOOL)a4 languageLocales:(id)a5 adaptationContext:(id)a6 staticResourcePaths:(id)a7 dynamicResourcePath:(id)a8 isMultiLingualModeEnabled:(BOOL)a9 isSiriMode:(BOOL)a10 isInlineCompletionEnabled:(BOOL)a11;
+ (void)clearDynamicLearningCaches;
+ (void)clearDynamicResourcesAtPath:(id)a3;
+ (void)contactStoreDidChange:(id)a3;
+ (void)dropResourcesExcludingInputModes:(id)a3;
+ (void)flushDynamicLearningCaches;
+ (void)flushDynamicResourcesForInputModes:(id)a3;
+ (void)performMaintenance;
+ (void)resetClientAndRecipientCache;
+ (void)setAsynchronousLoad:(BOOL)a3;
+ (void)setOfflineTrainingEnabled:(BOOL)a3;
+ (void)startObservingContactStore;
+ (void)unwireAllLanguageModelMemory;
+ (void)wireAllLanguageModelMemory;
@end

@implementation TILanguageModelLoaderManager

+ (void)contactStoreDidChange:(id)a3
{
  id v6 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v5 = +[TILanguageModelLoaderManager recipientRecords];
    [v5 removeAllObjects];
  }
  else
  {
    [a1 performSelectorOnMainThread:a2 withObject:v6 waitUntilDone:1];
  }
}

+ (void)startObservingContactStore
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:a1 selector:sel_contactStoreDidChange_ name:*MEMORY[0x1E4F1AF80] object:0];
}

+ (id)modelLocalesForInputModes:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "preferredModelLocaleIdentifier", (void)v14);
        v12 = (void *)[v11 mutableCopy];

        if ([v10 isSiriMode]) {
          [v12 appendString:@"_SiriMode"];
        }
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (void)unwireAllLanguageModelMemory
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [(id)__sharedInstances allKeys];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
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
        uint64_t v7 = [(id)__sharedInstances objectForKey:*(void *)(*((void *)&v8 + 1) + 8 * v6)];
        [v7 unwireLanguageModelMemory];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

+ (void)wireAllLanguageModelMemory
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [(id)__sharedInstances allKeys];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
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
        uint64_t v7 = [(id)__sharedInstances objectForKey:*(void *)(*((void *)&v8 + 1) + 8 * v6)];
        [v7 wireLanguageModelMemory];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

+ (void)performMaintenance
{
  v2 = +[TIKeyboardAssertionManager sharedAssertionManager];
  [v2 retainBackgroundActivityAssertion];

  KB::LanguageModel::perform_maintenance(&__block_literal_global_22);
}

void __50__TILanguageModelLoaderManager_performMaintenance__block_invoke()
{
  id v0 = +[TIKeyboardAssertionManager sharedAssertionManager];
  [v0 releaseBackgroundActivityAssertion];
}

+ (void)flushDynamicResourcesForInputModes:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[TILanguageModelLoaderManager modelLocalesForInputModes:a3];
  uint64_t v4 = [(id)__sharedInstances allKeys];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v15;
    long long v9 = MEMORY[0x1E4F14500];
    *(void *)&long long v6 = 136315394;
    long long v13 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v3, "containsObject:", v11, v13))
        {
          v12 = [(id)__sharedInstances objectForKey:v11];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            uint64_t v19 = "+[TILanguageModelLoaderManager flushDynamicResourcesForInputModes:]";
            __int16 v20 = 2112;
            uint64_t v21 = v11;
            _os_log_impl(&dword_1E3F0E000, v9, OS_LOG_TYPE_DEFAULT, "%s  Flushing dynamic learning caches for model %@", buf, 0x16u);
          }
          [v12 flushDynamicLearningCaches];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v7);
  }
}

+ (void)dropResourcesExcludingInputModes:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [(id)__sharedInstances allKeys];
  long long v14 = v3;
  uint64_t v5 = +[TILanguageModelLoaderManager modelLocalesForInputModes:v3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    long long v10 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (([v5 containsObject:v12] & 1) == 0)
        {
          long long v13 = [(id)__sharedInstances objectForKey:v12];
          [v13 flushDynamicLearningCaches];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v20 = "+[TILanguageModelLoaderManager dropResourcesExcludingInputModes:]";
            __int16 v21 = 2112;
            uint64_t v22 = v12;
            _os_log_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_DEFAULT, "%s  Dropping loader for model %@", buf, 0x16u);
          }
          [(id)__sharedInstances removeObjectForKey:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v8);
  }
}

+ (void)flushDynamicLearningCaches
{
}

void __58__TILanguageModelLoaderManager_flushDynamicLearningCaches__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "+[TILanguageModelLoaderManager flushDynamicLearningCaches]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = a2;
    _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Flushing dynamic learning caches for %@", (uint8_t *)&v5, 0x16u);
  }
  [v4 flushDynamicLearningCaches];
}

+ (void)clearDynamicLearningCaches
{
}

void __58__TILanguageModelLoaderManager_clearDynamicLearningCaches__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "+[TILanguageModelLoaderManager clearDynamicLearningCaches]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = a2;
    _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Clearing caches for input mode %@", (uint8_t *)&v5, 0x16u);
  }
  [v4 clearDynamicLearningCaches];
}

+ (void)clearDynamicResourcesAtPath:(id)a3
{
  id v3 = a3;
  id v4 = (void *)__sharedInstances;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__TILanguageModelLoaderManager_clearDynamicResourcesAtPath___block_invoke;
  v14[3] = &unk_1E6E2B058;
  id v5 = v3;
  id v15 = v5;
  id v6 = [v4 keysOfEntriesPassingTest:v14];
  __int16 v7 = (void *)__sharedInstances;
  uint64_t v8 = [v6 allObjects];
  [v7 removeObjectsForKeys:v8];

  uint64_t v9 = +[TILanguageModelLoaderManager knownClients];
  [v9 removeAllObjects];

  long long v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__TILanguageModelLoaderManager_clearDynamicResourcesAtPath___block_invoke_2;
  v12[3] = &unk_1E6E2B080;
  id v13 = v5;
  id v11 = v5;
  KB::LanguageModel::clear_dynamic_learning_bundles(v10, v12);
}

uint64_t __60__TILanguageModelLoaderManager_clearDynamicResourcesAtPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 dynamicResourcePath];
  if (v5 == *(void **)(a1 + 32))
  {
    uint64_t v7 = 1;
  }
  else
  {
    id v6 = [v4 dynamicResourcePath];
    uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 32)];
  }
  return v7;
}

void __60__TILanguageModelLoaderManager_clearDynamicResourcesAtPath___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (!v4) {
      return;
    }
    uint64_t v5 = *(void *)(a1 + 32);
    int v9 = 136315394;
    long long v10 = "+[TILanguageModelLoaderManager clearDynamicResourcesAtPath:]_block_invoke_2";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    id v6 = MEMORY[0x1E4F14500];
    uint64_t v7 = "%s  Removed dynamic resource bundles at %@";
  }
  else
  {
    if (!v4) {
      return;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 136315394;
    long long v10 = "+[TILanguageModelLoaderManager clearDynamicResourcesAtPath:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    id v6 = MEMORY[0x1E4F14500];
    uint64_t v7 = "%s  Could remove dynamic resource bundles at %@";
  }
  _os_log_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0x16u);
}

+ (id)sharedLanguageModelLoaderForModelLocaleIdentifier:(id)a3 isMultilingualModel:(BOOL)a4 customResourcePaths:(id)a5 dynamicResourcePath:(id)a6 mobileAssets:(id)a7 usesLinguisticContext:(BOOL)a8 isMultiLingualModeEnabled:(BOOL)a9 validEnglishTransformerMultilingualConfig:(BOOL)a10 isSiriMode:(BOOL)a11 trialParameters:(id)a12 isInlineCompletionEnabled:(BOOL)a13
{
  BOOL v59 = a8;
  BOOL v60 = a4;
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a12;
  if (!__sharedInstances)
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v22 = (void *)__sharedInstances;
    __sharedInstances = (uint64_t)v21;

    +[TILanguageModelLoaderManager startObservingContactStore];
  }
  if (a11)
  {
    id v23 = [v16 stringByAppendingString:@"_SiriMode"];
  }
  else
  {
    id v23 = v16;
  }
  uint64_t v24 = v23;
  v25 = [(id)__sharedInstances objectForKey:v23];
  int InlineCompletionPrecision = getInlineCompletionPrecision();
  id v57 = v16;
  if (v17)
  {
    if (v25)
    {
      v26 = (void *)MEMORY[0x1E4F1CAD0];
      v27 = [v25 customResourcePaths];
      v28 = [v26 setWithArray:v27];
      v29 = [MEMORY[0x1E4F1CAD0] setWithArray:v17];
      int v30 = [v28 isEqualToSet:v29];

      int v31 = v30 ^ 1;
    }
    else
    {
      int v31 = 1;
    }
    int v55 = v31;
  }
  else
  {
    int v55 = 0;
  }
  id v32 = [v25 dynamicResourcePath];
  id v56 = v17;
  if (v32 == v18)
  {
    int v35 = 0;
  }
  else
  {
    v33 = [v25 dynamicResourcePath];
    int v34 = [v33 isEqualToString:v18];

    int v35 = v34 ^ 1;
  }

  id v36 = [v25 mobileAssets];
  if (v36 == v19)
  {
    int v39 = 0;
  }
  else
  {
    v37 = [v25 mobileAssets];
    int v38 = [v37 isEqualToArray:v19];

    int v39 = v38 ^ 1;
  }

  if (v25) {
    int v40 = [v25 usesLinguisticContext] ^ v59;
  }
  else {
    int v40 = 1;
  }
  v41 = [v25 trialParameters];
  v42 = v41;
  if (v20) {
    int v43 = [v41 isEqualToDictionary:v20];
  }
  else {
    int v43 = v41 == 0;
  }

  if (v25) {
    BOOL v44 = [v25 inlineCompletionPrecision] != InlineCompletionPrecision;
  }
  else {
    BOOL v44 = 1;
  }
  BOOL v45 = v60;
  if (v60)
  {
    char v46 = _os_feature_enabled_impl();
    if (v25) {
      BOOL v45 = 0;
    }
    else {
      BOOL v45 = v46;
    }
  }
  if (v25) {
    int v47 = v35;
  }
  else {
    int v47 = 1;
  }
  if (v45 || (int v48 = v47 | v39 | v40 | v55 | v43 ^ 1 | v44, (v48 & 1) != 0) || (!v60 & v48) != 0)
  {
    BYTE4(v54) = a13;
    LODWORD(v54) = InlineCompletionPrecision;
    BYTE2(v53) = a10;
    BYTE1(v53) = a11;
    LOBYTE(v53) = a9;
    v50 = v56;
    v49 = v57;
    v51 = -[TILanguageModelLoader initWithModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:isSiriMode:validEnglishTransformerMultilingualConfig:trialParameters:inlineCompletionPrecision:isInlineCompletionEnabled:]([TILanguageModelLoader alloc], "initWithModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:isSiriMode:validEnglishTransformerMultilingualConfig:trialParameters:inlineCompletionPrecision:isInlineCompletionEnabled:", v57, v60, v56, v18, v19, v59, v53, v20, v54);

    [(id)__sharedInstances setObject:v51 forKey:v24];
    v25 = v51;
  }
  else
  {
    v50 = v56;
    v49 = v57;
  }

  return v25;
}

+ (id)recipientRecords
{
  if (+[TILanguageModelLoaderManager recipientRecords]::dispatchOnce != -1) {
    dispatch_once(&+[TILanguageModelLoaderManager recipientRecords]::dispatchOnce, &__block_literal_global_3);
  }
  v2 = (void *)+[TILanguageModelLoaderManager recipientRecords]::__recipientRecords;

  return v2;
}

uint64_t __48__TILanguageModelLoaderManager_recipientRecords__block_invoke()
{
  +[TILanguageModelLoaderManager recipientRecords]::__recipientRecords = [[TILRUDictionary alloc] initWithMaximumCapacity:10];

  return MEMORY[0x1F41817F8]();
}

+ (id)knownClients
{
  if (+[TILanguageModelLoaderManager knownClients]::dispatchOnce != -1) {
    dispatch_once(&+[TILanguageModelLoaderManager knownClients]::dispatchOnce, &__block_literal_global_7321);
  }
  v2 = (void *)+[TILanguageModelLoaderManager knownClients]::__knownClients;

  return v2;
}

uint64_t __44__TILanguageModelLoaderManager_knownClients__block_invoke()
{
  +[TILanguageModelLoaderManager knownClients]::__knownClients = [[TILRUDictionary alloc] initWithMaximumCapacity:10];

  return MEMORY[0x1F41817F8]();
}

+ (shared_ptr<KB::LanguageModel>)stubForModelLocale:(id)a3 isMultilingualModel:(BOOL)a4 languageLocales:(id)a5 adaptationContext:(id)a6 staticResourcePaths:(id)a7 dynamicResourcePath:(id)a8 isMultiLingualModeEnabled:(BOOL)a9 isSiriMode:(BOOL)a10 isInlineCompletionEnabled:(BOOL)a11
{
  v27 = v11;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  id v21 = (const void *)[v18 appContext];
  uint64_t v22 = (const void *)[v18 recipientContext];

  KB::LanguageModelConfig::LanguageModelConfig((uint64_t)&v28, v20, a4, v19, v17, v16, v21, v22, 0, !a9, a10, 1, 1, 90, a11);
  id v23 = operator new(0x138uLL);
  v23[1] = 0;
  v23[2] = 0;
  *id v23 = &unk_1F3F75368;
  void *v27 = std::construct_at[abi:nn180100]<KB::LanguageModelImplStub,KB::LanguageModelConfig,KB::LanguageModelImplStub*>((KB::LanguageModelImplBase *)(v23 + 3), (uint64_t)&v28);
  v27[1] = (KB::LanguageModelImplBase *)v23;
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0;
  if (v33) {
    CFRelease(v33);
  }
  CFTypeRef v33 = 0;
  if (v32) {
    CFRelease(v32);
  }
  CFTypeRef v32 = 0;
  if (v31) {
    CFRelease(v31);
  }
  CFTypeRef v31 = 0;
  if (v30) {
    CFRelease(v30);
  }
  CFTypeRef v30 = 0;
  if (v29) {
    CFRelease(v29);
  }
  CFTypeRef v29 = 0;
  v25 = (LanguageModel *)v28;
  if (v28) {
    CFRelease(v28);
  }
  result.__cntrl_ = v24;
  result.__ptr_ = v25;
  return result;
}

+ (shared_ptr<KB::LanguageModel>)modelForLocale:(id)a3 isMultilingualModel:(BOOL)a4 languageLocales:(id)a5 adaptationContext:(id)a6 staticResourcePaths:(id)a7 dynamicResourcePath:(id)a8 isMultiLingualModeEnabled:(BOOL)a9 isSiriMode:(BOOL)a10 validEnglishTransformerMultilingualConfig:(BOOL)a11 trialParameters:(id)a12 inlineCompletionPrecision:(int)a13 isInlineCompletionEnabled:(BOOL)a14
{
  CFTypeRef v33 = v14;
  id v20 = a12;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = a3;
  v26 = (const void *)[v23 appContext];
  v27 = (const void *)[v23 recipientContext];
  int v28 = [v23 isOnline];

  KB::LanguageModelConfig::LanguageModelConfig((uint64_t)&v35, v25, a4, v24, v22, v21, v26, v27, v20, !a9, a10, v28 ^ 1, !a11, a13, a14);
  CFTypeRef v29 = (char *)operator new(0x178uLL);
  *((void *)v29 + 1) = 0;
  *((void *)v29 + 2) = 0;
  *(void *)CFTypeRef v29 = &unk_1F3F75330;
  KB::LanguageModelStr::LanguageModelStr((const __CFLocale **)v29 + 3, (const __CFString **)&v35);
  *(void *)&long long v34 = v29 + 24;
  *((void *)&v34 + 1) = v29;
  std::shared_ptr<KB::LanguageModelStr>::__enable_weak_this[abi:nn180100]<KB::LanguageModelStr,KB::LanguageModelStr,void>((uint64_t)&v34, (void *)v29 + 22, (uint64_t)(v29 + 24));
  _OWORD *v33 = v34;
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0;
  if (v40) {
    CFRelease(v40);
  }
  CFTypeRef v40 = 0;
  if (v39) {
    CFRelease(v39);
  }
  CFTypeRef v39 = 0;
  if (v38) {
    CFRelease(v38);
  }
  CFTypeRef v38 = 0;
  if (v37) {
    CFRelease(v37);
  }
  CFTypeRef v37 = 0;
  if (v36) {
    CFRelease(v36);
  }
  CFTypeRef v36 = 0;
  CFTypeRef v31 = (LanguageModel *)v35;
  if (v35) {
    CFRelease(v35);
  }
  result.__cntrl_ = v30;
  result.__ptr_ = v31;
  return result;
}

+ (void)resetClientAndRecipientCache
{
  v2 = +[TILanguageModelLoaderManager knownClients];
  [v2 removeAllObjects];

  id v3 = +[TILanguageModelLoaderManager recipientRecords];
  [v3 removeAllObjects];
}

+ (void)setOfflineTrainingEnabled:(BOOL)a3
{
  __offlineTrainingEnabled = a3;
}

+ (void)setAsynchronousLoad:(BOOL)a3
{
  __asynchronousLoad = a3;
}

@end