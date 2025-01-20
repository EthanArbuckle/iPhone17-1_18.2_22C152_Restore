@interface WBSTranslationAvailability
+ (id)sharedAvailability;
- (NSArray)userPreferredTargetLocales;
- (WBSTranslationAvailability)init;
- (id)_initWithAvailabilityProvider:(id)a3;
- (void)_didUpdateSupportedRegionAndLocalePairs;
- (void)_updateCachedValues;
- (void)getAllTargetLocalesInUserPreferredOrderWithCompletionHandler:(id)a3;
- (void)getAvailableLocalePairsWithCompletionHandler:(id)a3;
- (void)getTranslationAvailabilityWithCompletionHandler:(id)a3;
- (void)isTranslationSupportedForCurrentRegionWithCompletionHandler:(id)a3;
- (void)supportedLocalePairsWithCompletionHandler:(id)a3;
@end

@implementation WBSTranslationAvailability

+ (id)sharedAvailability
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WBSTranslationAvailability_sharedAvailability__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAvailability_onceToken != -1) {
    dispatch_once(&sharedAvailability_onceToken, block);
  }
  v2 = (void *)sharedAvailability_sharedInstance;
  return v2;
}

void __48__WBSTranslationAvailability_sharedAvailability__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedAvailability_sharedInstance;
  sharedAvailability_sharedInstance = (uint64_t)v1;
}

- (WBSTranslationAvailability)init
{
  return (WBSTranslationAvailability *)[(WBSTranslationAvailability *)self _initWithAvailabilityProvider:self];
}

- (id)_initWithAvailabilityProvider:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSTranslationAvailability;
  v5 = [(WBSTranslationAvailability *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_availabilityProvider, v4);
    [(WBSTranslationAvailability *)v6 _updateCachedValues];
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel__didUpdateSupportedRegionAndLocalePairs name:*MEMORY[0x1E4F1C370] object:0];

    v8 = v6;
  }

  return v6;
}

- (void)getTranslationAvailabilityWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  uint64_t v9 = 0;
  objc_super v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__28;
  v13 = __Block_byref_object_dispose__28;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__WBSTranslationAvailability_getTranslationAvailabilityWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5E43620;
  v8[4] = self;
  v8[5] = &v9;
  performWithLock(&self->_lock, v8);
  v5 = (void *)v10[5];
  if (v5)
  {
    v4[2](v4, [v5 BOOLValue]);
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __78__WBSTranslationAvailability_getTranslationAvailabilityWithCompletionHandler___block_invoke_2;
    v6[3] = &unk_1E5E420C8;
    v6[4] = self;
    v7 = v4;
    performWithLock(&self->_lock, v6);
  }
  _Block_object_dispose(&v9, 8);
}

void __78__WBSTranslationAvailability_getTranslationAvailabilityWithCompletionHandler___block_invoke(uint64_t a1)
{
}

void __78__WBSTranslationAvailability_getTranslationAvailabilityWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(*(void *)(a1 + 32) + 56);
  id v4 = (void *)MEMORY[0x1AD115160](*(void *)(a1 + 40));
  v5 = [v3 arrayByAddingObject:v4];
  v6 = v5;
  if (!v5)
  {
    id v1 = (void *)MEMORY[0x1AD115160](*(void *)(a1 + 40));
    v7[0] = v1;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), v6);
  if (!v5)
  {
  }
}

- (void)getAvailableLocalePairsWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__28;
  v16 = __Block_byref_object_dispose__28;
  id v17 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __75__WBSTranslationAvailability_getAvailableLocalePairsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E45540;
  v7[4] = self;
  v7[5] = &v12;
  v7[6] = &v8;
  performWithLock(&self->_lock, v7);
  if (*((unsigned char *)v9 + 24))
  {
    v4[2](v4, v13[5]);
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __75__WBSTranslationAvailability_getAvailableLocalePairsWithCompletionHandler___block_invoke_2;
    v5[3] = &unk_1E5E420C8;
    v5[4] = self;
    v6 = v4;
    performWithLock(&self->_lock, v5);
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

void __75__WBSTranslationAvailability_getAvailableLocalePairsWithCompletionHandler___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(unsigned char *)(a1[4] + 32);
}

void __75__WBSTranslationAvailability_getAvailableLocalePairsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(*(void *)(a1 + 32) + 64);
  id v4 = (void *)MEMORY[0x1AD115160](*(void *)(a1 + 40));
  v5 = [v3 arrayByAddingObject:v4];
  v6 = v5;
  if (!v5)
  {
    id v1 = (void *)MEMORY[0x1AD115160](*(void *)(a1 + 40));
    v7[0] = v1;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), v6);
  if (!v5)
  {
  }
}

- (void)getAllTargetLocalesInUserPreferredOrderWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __91__WBSTranslationAvailability_getAllTargetLocalesInUserPreferredOrderWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5E42D70;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(WBSTranslationAvailability *)self getAvailableLocalePairsWithCompletionHandler:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __91__WBSTranslationAvailability_getAllTargetLocalesInUserPreferredOrderWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__28;
    v19 = __Block_byref_object_dispose__28;
    id v20 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __91__WBSTranslationAvailability_getAllTargetLocalesInUserPreferredOrderWithCompletionHandler___block_invoke_2;
    v14[3] = &unk_1E5E43620;
    v14[4] = WeakRetained;
    v14[5] = &v15;
    performWithLock(WeakRetained + 2, v14);
    v6 = [(id)v16[5] userPreferredTargetLocales];
    id v7 = availablePreferredTargetLocalesFilteredBySupportedLocales(v6, v3, 0);
    id v8 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __91__WBSTranslationAvailability_getAllTargetLocalesInUserPreferredOrderWithCompletionHandler___block_invoke_3;
    v12[3] = &unk_1E5E45568;
    id v9 = v8;
    id v13 = v9;
    [v3 enumerateObjectsUsingBlock:v12];
    uint64_t v10 = *(void *)(a1 + 32);
    char v11 = [v9 array];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __91__WBSTranslationAvailability_getAllTargetLocalesInUserPreferredOrderWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

void __91__WBSTranslationAvailability_getAllTargetLocalesInUserPreferredOrderWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 targetLocaleIdentifier];
  [v2 addObject:v3];
}

- (void)isTranslationSupportedForCurrentRegionWithCompletionHandler:(id)a3
{
  id v3 = a3;
  uint64_t v4 = preferredTaskHint();
  id LTTranslatorClass = get_LTTranslatorClass();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __90__WBSTranslationAvailability_isTranslationSupportedForCurrentRegionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E412A0;
  id v8 = v3;
  id v6 = v3;
  [LTTranslatorClass taskIsSupportedInCurrentRegion:v4 completion:v7];
}

uint64_t __90__WBSTranslationAvailability_isTranslationSupportedForCurrentRegionWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"NO";
    if (a2) {
      id v5 = @"YES";
    }
    id v6 = v5;
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_DEFAULT, "Translation supported in current region result from Translation.framework: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)supportedLocalePairsWithCompletionHandler:(id)a3
{
  id v3 = a3;
  if (get_LTTranslatorClass())
  {
    uint64_t v4 = preferredTaskHint();
    id LTTranslatorClass = get_LTTranslatorClass();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__WBSTranslationAvailability_supportedLocalePairsWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E5E42B10;
    id v7 = v3;
    [LTTranslatorClass availableLocalePairsForTask:v4 completion:v6];
  }
  else
  {
    (*((void (**)(id, void))v3 + 2))(v3, MEMORY[0x1E4F1CBF0]);
  }
}

void __72__WBSTranslationAvailability_supportedLocalePairsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(a2, "safari_mapObjectsUsingBlock:", &__block_literal_global_50);
  uint64_t v4 = objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_37);
  id v5 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_DEFAULT, "Translation supported pairs from Translation.framework: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

WBSLocalePair *__72__WBSTranslationAvailability_supportedLocalePairsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[WBSLocalePair alloc] initWithLTLocalePair:v2];

  return v3;
}

uint64_t __72__WBSTranslationAvailability_supportedLocalePairsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 compactDescriptionForLogging];
}

- (NSArray)userPreferredTargetLocales
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__28;
  uint64_t v15 = __Block_byref_object_dispose__28;
  id v16 = 0;
  p_lock = &self->_lock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__WBSTranslationAvailability_userPreferredTargetLocales__block_invoke;
  v10[3] = &unk_1E5E43620;
  v10[4] = self;
  v10[5] = &v11;
  performWithLock(&self->_lock, v10);
  uint64_t v4 = (void *)v12[5];
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    int v6 = (void *)v12[5];
    v12[5] = v5;

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__WBSTranslationAvailability_userPreferredTargetLocales__block_invoke_2;
    v9[3] = &unk_1E5E44398;
    v9[4] = self;
    v9[5] = &v11;
    performWithLock(p_lock, v9);
    uint64_t v4 = (void *)v12[5];
  }
  id v7 = v4;
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v7;
}

void __56__WBSTranslationAvailability_userPreferredTargetLocales__block_invoke(uint64_t a1)
{
}

void __56__WBSTranslationAvailability_userPreferredTargetLocales__block_invoke_2(uint64_t a1)
{
}

- (void)_updateCachedValues
{
  objc_initWeak(&location, self);
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__28;
  v25 = __Block_byref_object_dispose__28;
  id v26 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __49__WBSTranslationAvailability__updateCachedValues__block_invoke;
  v20[3] = &unk_1E5E43620;
  v20[4] = self;
  v20[5] = &v21;
  performWithLock(&self->_lock, v20);
  id v3 = dispatch_group_create();
  objc_initWeak(&from, (id)v22[5]);
  dispatch_group_enter(v3);
  uint64_t v4 = (void *)v22[5];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__WBSTranslationAvailability__updateCachedValues__block_invoke_2;
  v15[3] = &unk_1E5E455F8;
  objc_copyWeak(&v17, &location);
  objc_copyWeak(&v18, &from);
  uint64_t v5 = v3;
  id v16 = v5;
  [v4 isTranslationSupportedForCurrentRegionWithCompletionHandler:v15];
  dispatch_group_enter(v5);
  int v6 = (void *)v22[5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__WBSTranslationAvailability__updateCachedValues__block_invoke_4;
  v11[3] = &unk_1E5E45648;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  id v7 = v5;
  uint64_t v12 = v7;
  [v6 supportedLocalePairsWithCompletionHandler:v11];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__WBSTranslationAvailability__updateCachedValues__block_invoke_6;
  v8[3] = &unk_1E5E45698;
  objc_copyWeak(&v9, &location);
  objc_copyWeak(&v10, &from);
  dispatch_group_notify(v7, MEMORY[0x1E4F14428], v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&from);

  _Block_object_dispose(&v21, 8);
  objc_destroyWeak(&location);
}

void __49__WBSTranslationAvailability__updateCachedValues__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

void __49__WBSTranslationAvailability__updateCachedValues__block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__WBSTranslationAvailability__updateCachedValues__block_invoke_3;
    v6[3] = &unk_1E5E455D0;
    void v6[4] = WeakRetained;
    objc_copyWeak(&v7, (id *)(a1 + 48));
    char v8 = a2;
    performWithLock(v5 + 2, v6);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    objc_destroyWeak(&v7);
  }
}

void __49__WBSTranslationAvailability__updateCachedValues__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained == v3)
  {
    uint64_t v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

void __49__WBSTranslationAvailability__updateCachedValues__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__WBSTranslationAvailability__updateCachedValues__block_invoke_5;
    v6[3] = &unk_1E5E45620;
    void v6[4] = WeakRetained;
    objc_copyWeak(&v8, (id *)(a1 + 48));
    id v7 = v3;
    performWithLock(v5 + 2, v6);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

    objc_destroyWeak(&v8);
  }
}

void __49__WBSTranslationAvailability__updateCachedValues__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained == v3)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  }
}

void __49__WBSTranslationAvailability__updateCachedValues__block_invoke_6(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = 0;
    id v7 = &v6;
    uint64_t v8 = 0x2020000000;
    char v9 = 0;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __49__WBSTranslationAvailability__updateCachedValues__block_invoke_7;
    v4[3] = &unk_1E5E45670;
    v4[4] = WeakRetained;
    v4[5] = &v6;
    objc_copyWeak(&v5, (id *)(a1 + 40));
    performWithLock(v3 + 2, v4);
    if (*((unsigned char *)v7 + 24)) {
      [(os_unfair_lock_s *)v3 _didUpdateSupportedRegionAndLocalePairs];
    }
    objc_destroyWeak(&v5);
    _Block_object_dispose(&v6, 8);
  }
}

void __49__WBSTranslationAvailability__updateCachedValues__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = WeakRetained == v2;
}

- (void)_didUpdateSupportedRegionAndLocalePairs
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__28;
  v32[4] = __Block_byref_object_dispose__28;
  id v33 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__28;
  v30 = __Block_byref_object_dispose__28;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__28;
  v24 = __Block_byref_object_dispose__28;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__WBSTranslationAvailability__didUpdateSupportedRegionAndLocalePairs__block_invoke;
  v19[3] = &unk_1E5E456C0;
  v19[4] = self;
  v19[5] = v34;
  v19[6] = v32;
  v19[7] = &v26;
  v19[8] = &v20;
  performWithLock(&self->_lock, v19);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = (id)v27[5];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v37 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v16;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v5++) + 16))();
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v37 count:16];
    }
    while (v3);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = (id)v21[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v36 count:16];
    }
    while (v7);
  }

  id v10 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", (void)v11);
  [v10 postNotificationName:@"translationAvailabilityDidChange" object:0];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);
}

void __69__WBSTranslationAvailability__didUpdateSupportedRegionAndLocalePairs__block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [*(id *)(a1[4] + 40) BOOLValue];
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 24));
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), *(id *)(a1[4] + 56));
  objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), *(id *)(a1[4] + 64));
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  uint64_t v4 = a1[4];
  uint64_t v5 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = 0;

  uint64_t v6 = a1[4];
  uint64_t v7 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableLocalePairsCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_availableInCurrentRegionCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_cachedUserPreferredLocales, 0);
  objc_storeStrong((id *)&self->_cachedTranslationAvailableInCurrentRegion, 0);
  objc_storeStrong((id *)&self->_cachedAvailableLocalePairs, 0);
  objc_destroyWeak((id *)&self->_availabilityProvider);
}

@end