@interface WBSPageZoomPreferenceManager
+ (id)pageZoomFactors;
- (BOOL)_canChangePageZoom:(BOOL)a3 fromStep:(int64_t)a4;
- (WBSPageZoomPreferenceManager)fallbackPreferenceManager;
- (WBSPageZoomPreferenceManager)initWithPerSitePreferencesStore:(id)a3;
- (WBSPerSitePreference)pageZoomPreference;
- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore;
- (double)_pageZoomStepToZoomFactor:(int64_t)a3;
- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3;
- (id)localizedStringForValue:(id)a3 inPreference:(id)a4;
- (id)preferenceNameForPreference:(id)a3;
- (id)preferences;
- (id)valuesForPreference:(id)a3;
- (void)_getDefaultZoomStep:(id)a3;
- (void)_getZoomStepForDomain:(id)a3 usingBlock:(id)a4;
- (void)_incrementOrDecreaseZoomStep:(BOOL)a3 forURL:(id)a4 completionHandler:(id)a5;
- (void)didUpdatePreference:(id)a3 toValue:(id)a4 forDomain:(id)a5;
- (void)getAvailableActionsForURL:(id)a3 usingBlock:(id)a4;
- (void)getPageZoomFactorForURL:(id)a3 usingBlock:(id)a4;
- (void)removeAllPageZoomPreferences;
- (void)removePageZoomPreferencesForHostnames:(id)a3;
- (void)resetZoomLevelOnURL:(id)a3 completionHandler:(id)a4;
- (void)setFallbackPreferenceManager:(id)a3;
- (void)zoomInOnURL:(id)a3 completionHandler:(id)a4;
- (void)zoomOutOnURL:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSPageZoomPreferenceManager

+ (id)pageZoomFactors
{
  return &unk_1EFC22208;
}

- (WBSPageZoomPreferenceManager)initWithPerSitePreferencesStore:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSPageZoomPreferenceManager;
  v6 = [(WBSPageZoomPreferenceManager *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_perSitePreferencesStore, a3);
    v8 = [[WBSPerSitePreference alloc] initWithIdentifier:@"ZoomPreference"];
    pageZoomPreference = v7->_pageZoomPreference;
    v7->_pageZoomPreference = v8;

    [(WBSPerSitePreferenceManager *)v7 setStorageDelegate:v7];
    [(WBSPerSitePreferenceManager *)v7 setDefaultsDelegate:v7];
    v10 = v7;
  }

  return v7;
}

- (void)getPageZoomFactorForURL:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_msgSend(v6, "safari_userVisibleHostWithoutWWWSubdomain");
  if ([v8 length])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__WBSPageZoomPreferenceManager_getPageZoomFactorForURL_usingBlock___block_invoke_2;
    v9[3] = &unk_1E5C9E2B8;
    objc_copyWeak(&v11, &location);
    id v10 = v7;
    [(WBSPageZoomPreferenceManager *)self _getZoomStepForDomain:v8 usingBlock:v9];

    objc_destroyWeak(&v11);
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__WBSPageZoomPreferenceManager_getPageZoomFactorForURL_usingBlock___block_invoke;
    v12[3] = &unk_1E5C9E290;
    id v13 = v7;
    objc_copyWeak(&v14, &location);
    [(WBSPageZoomPreferenceManager *)self _getDefaultZoomStep:v12];
    objc_destroyWeak(&v14);
  }
  objc_destroyWeak(&location);
}

void __67__WBSPageZoomPreferenceManager_getPageZoomFactorForURL_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _pageZoomStepToZoomFactor:a2];
  (*(void (**)(uint64_t))(v3 + 16))(v3);
}

uint64_t __67__WBSPageZoomPreferenceManager_getPageZoomFactorForURL_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _pageZoomStepToZoomFactor:a2];
  double v6 = v5;

  id v7 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 134217984;
    double v10 = v6;
    _os_log_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_INFO, "Loading website with page zoom factor: %f", (uint8_t *)&v9, 0xCu);
  }
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(v6);
}

- (void)zoomInOnURL:(id)a3 completionHandler:(id)a4
{
}

- (void)zoomOutOnURL:(id)a3 completionHandler:(id)a4
{
}

- (void)resetZoomLevelOnURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__WBSPageZoomPreferenceManager_resetZoomLevelOnURL_completionHandler___block_invoke;
  v10[3] = &unk_1E5C9E308;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(WBSPageZoomPreferenceManager *)self _getDefaultZoomStep:v10];
}

void __70__WBSPageZoomPreferenceManager_resetZoomLevelOnURL_completionHandler___block_invoke(id *a1, uint64_t a2)
{
  [a1[4] _pageZoomStepToZoomFactor:a2];
  double v4 = v3;
  double v5 = objc_msgSend(a1[5], "safari_userVisibleHostWithoutWWWSubdomain");
  if ([v5 length])
  {
    id v6 = a1[4];
    id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];
    uint64_t v8 = *((void *)a1[4] + 5);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__WBSPageZoomPreferenceManager_resetZoomLevelOnURL_completionHandler___block_invoke_2;
    v9[3] = &unk_1E5C9E2E0;
    id v10 = v5;
    id v11 = a1[6];
    double v12 = v4;
    [v6 removePreferenceValuesForDomains:v7 fromPreference:v8 completionHandler:v9];
  }
  else
  {
    (*((void (**)(double))a1[6] + 2))(v4);
  }
}

uint64_t __70__WBSPageZoomPreferenceManager_resetZoomLevelOnURL_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    double v3 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __70__WBSPageZoomPreferenceManager_resetZoomLevelOnURL_completionHandler___block_invoke_2_cold_2(v3);
    }
    double v4 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __70__WBSPageZoomPreferenceManager_resetZoomLevelOnURL_completionHandler___block_invoke_2_cold_1(a1, v4);
    }
  }
  return (*(uint64_t (**)(double))(*(void *)(a1 + 40) + 16))(*(double *)(a1 + 48));
}

- (void)getAvailableActionsForURL:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v6, "safari_userVisibleHostWithoutWWWSubdomain");
  if ([v8 length])
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__WBSPageZoomPreferenceManager_getAvailableActionsForURL_usingBlock___block_invoke;
    v9[3] = &unk_1E5C9E358;
    objc_copyWeak(&v12, &location);
    id v10 = v8;
    id v11 = v7;
    [(WBSPageZoomPreferenceManager *)self _getDefaultZoomStep:v9];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __69__WBSPageZoomPreferenceManager_getAvailableActionsForURL_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  double v4 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__WBSPageZoomPreferenceManager_getAvailableActionsForURL_usingBlock___block_invoke_2;
    v7[3] = &unk_1E5C9E330;
    objc_copyWeak(v9, v4);
    v9[1] = a2;
    id v8 = *(id *)(a1 + 40);
    [WeakRetained _getZoomStepForDomain:v6 usingBlock:v7];

    objc_destroyWeak(v9);
  }
}

void __69__WBSPageZoomPreferenceManager_getAvailableActionsForURL_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained _canChangePageZoom:0 fromStep:a2];
    [v5 _canChangePageZoom:1 fromStep:a2];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v5;
  }
}

- (void)removePageZoomPreferencesForHostnames:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "safari_stringByRemovingWwwDotPrefix", (void)v12);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(WBSPerSitePreferenceManager *)self removePreferenceValuesForDomains:v5 fromPreference:self->_pageZoomPreference completionHandler:0];
}

- (void)removeAllPageZoomPreferences
{
  perSitePreferencesStore = self->_perSitePreferencesStore;
  id v3 = [(WBSPageZoomPreferenceManager *)self preferenceNameForPreference:self->_pageZoomPreference];
  [(WBSPerSitePreferencesSQLiteStore *)perSitePreferencesStore removeAllPreferenceValuesFromPreference:v3 completionHandler:0];
}

- (void)_getDefaultZoomStep:(id)a3
{
  id v4 = a3;
  pageZoomPreference = self->_pageZoomPreference;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__WBSPageZoomPreferenceManager__getDefaultZoomStep___block_invoke;
  v7[3] = &unk_1E5C9E380;
  id v8 = v4;
  id v6 = v4;
  [(WBSPerSitePreferenceManager *)self getDefaultPreferenceValueForPreference:pageZoomPreference completionHandler:v7];
}

uint64_t __52__WBSPageZoomPreferenceManager__getDefaultZoomStep___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 integerValue];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (void)_getZoomStepForDomain:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[WBSPageZoomPreferenceManager _getZoomStepForDomain:usingBlock:](v8);
  }
  uint64_t v9 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[WBSPageZoomPreferenceManager _getZoomStepForDomain:usingBlock:]((uint64_t)v6, v9);
  }
  pageZoomPreference = self->_pageZoomPreference;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__WBSPageZoomPreferenceManager__getZoomStepForDomain_usingBlock___block_invoke;
  v13[3] = &unk_1E5C9E3F8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(WBSPerSitePreferenceManager *)self getValueOfPreference:pageZoomPreference forDomain:v12 withTimeout:0 usingBlock:v13];
}

void __65__WBSPageZoomPreferenceManager__getZoomStepForDomain_usingBlock___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 && (uint64_t v7 = *(void *)(a1 + 32), (v8 = *(void **)(v7 + 48)) != 0))
  {
    uint64_t v9 = *(void *)(v7 + 40);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__WBSPageZoomPreferenceManager__getZoomStepForDomain_usingBlock___block_invoke_2;
    v14[3] = &unk_1E5C9E3D0;
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 32);
    long long v13 = *(void **)(a1 + 40);
    id v16 = v11;
    v14[4] = v12;
    id v15 = v13;
    [v8 getValueOfPreference:v9 forDomain:v10 withTimeout:0 usingBlock:v14];
  }
  else
  {
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [v5 integerValue]);
  }
}

void __65__WBSPageZoomPreferenceManager__getZoomStepForDomain_usingBlock___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [v5 integerValue]);
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = v7[5];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__WBSPageZoomPreferenceManager__getZoomStepForDomain_usingBlock___block_invoke_3;
    v10[3] = &unk_1E5C9E3A8;
    id v12 = *(id *)(a1 + 48);
    id v11 = v6;
    [v7 setValue:v11 ofPreference:v9 forDomain:v8 completionHandler:v10];
  }
}

uint64_t __65__WBSPageZoomPreferenceManager__getZoomStepForDomain_usingBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) integerValue];
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (void)_incrementOrDecreaseZoomStep:(BOOL)a3 forURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  uint64_t v10 = objc_msgSend(v8, "safari_userVisibleHostWithoutWWWSubdomain");
  if ([v10 length])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __86__WBSPageZoomPreferenceManager__incrementOrDecreaseZoomStep_forURL_completionHandler___block_invoke_2;
    v11[3] = &unk_1E5C9E470;
    objc_copyWeak(&v14, &location);
    id v13 = v9;
    BOOL v15 = a3;
    id v12 = v10;
    [(WBSPageZoomPreferenceManager *)self _getZoomStepForDomain:v12 usingBlock:v11];

    objc_destroyWeak(&v14);
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __86__WBSPageZoomPreferenceManager__incrementOrDecreaseZoomStep_forURL_completionHandler___block_invoke;
    v16[3] = &unk_1E5C9E290;
    id v17 = v9;
    objc_copyWeak(&v18, &location);
    [(WBSPageZoomPreferenceManager *)self _getDefaultZoomStep:v16];
    objc_destroyWeak(&v18);
  }
  objc_destroyWeak(&location);
}

void __86__WBSPageZoomPreferenceManager__incrementOrDecreaseZoomStep_forURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _pageZoomStepToZoomFactor:a2];
  (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
}

void __86__WBSPageZoomPreferenceManager__incrementOrDecreaseZoomStep_forURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__WBSPageZoomPreferenceManager__incrementOrDecreaseZoomStep_forURL_completionHandler___block_invoke_3;
  block[3] = &unk_1E5C9E448;
  objc_copyWeak(v8, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  char v9 = *(unsigned char *)(a1 + 56);
  id v7 = v4;
  v8[1] = a2;
  id v6 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v8);
}

void __86__WBSPageZoomPreferenceManager__incrementOrDecreaseZoomStep_forURL_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained _canChangePageZoom:*(unsigned __int8 *)(a1 + 64) fromStep:*(void *)(a1 + 56)])
    {
      uint64_t v6 = *(void *)(a1 + 56);
      if (*(unsigned char *)(a1 + 64)) {
        id v7 = (void *)(v6 + 1);
      }
      else {
        id v7 = (void *)(v6 - 1);
      }
      id v8 = [NSNumber numberWithUnsignedInteger:v7];
      char v9 = [v5 pageZoomPreference];
      uint64_t v10 = *(void *)(a1 + 32);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __86__WBSPageZoomPreferenceManager__incrementOrDecreaseZoomStep_forURL_completionHandler___block_invoke_4;
      v13[3] = &unk_1E5C9E420;
      objc_copyWeak(v15, v2);
      v15[1] = v7;
      id v14 = *(id *)(a1 + 40);
      [v5 setValue:v8 ofPreference:v9 forDomain:v10 completionHandler:v13];

      objc_destroyWeak(v15);
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 40);
      [v5 _pageZoomStepToZoomFactor:*(void *)(a1 + 56)];
      (*(void (**)(__n128))(v11 + 16))(v12);
    }
  }
  else
  {
    v4.n128_u64[0] = 0;
    (*(void (**)(__n128))(*(void *)(a1 + 40) + 16))(v4);
  }
}

uint64_t __86__WBSPageZoomPreferenceManager__incrementOrDecreaseZoomStep_forURL_completionHandler___block_invoke_4(uint64_t a1, char a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __86__WBSPageZoomPreferenceManager__incrementOrDecreaseZoomStep_forURL_completionHandler___block_invoke_4_cold_1(v3);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _pageZoomStepToZoomFactor:*(void *)(a1 + 48)];
  double v6 = v5;

  id v7 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 134217984;
    double v10 = v6;
    _os_log_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_INFO, "Updating website with page zoom factor: %f", (uint8_t *)&v9, 0xCu);
  }
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(v6);
}

- (BOOL)_canChangePageZoom:(BOOL)a3 fromStep:(int64_t)a4
{
  if (a3) {
    BOOL v4 = [&unk_1EFC22208 count] - 1 <= a4;
  }
  else {
    BOOL v4 = a4 <= 0;
  }
  return !v4;
}

- (double)_pageZoomStepToZoomFactor:(int64_t)a3
{
  uint64_t v3 = [&unk_1EFC22208 objectAtIndexedSubscript:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (id)preferences
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_pageZoomPreference;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)valuesForPreference:(id)a3
{
  return (id)objc_msgSend(&unk_1EFC22208, "safari_mapAndFilterObjectsWithOptions:usingBlock:", 0, &__block_literal_global_85);
}

uint64_t __52__WBSPageZoomPreferenceManager_valuesForPreference___block_invoke()
{
  return objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  double v4 = objc_msgSend(&unk_1EFC22208, "objectAtIndexedSubscript:", objc_msgSend(a3, "integerValue"));
  double v5 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:v4 numberStyle:3];

  return v5;
}

- (void)didUpdatePreference:(id)a3 toValue:(id)a4 forDomain:(id)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F28EB8];
  id v8 = a5;
  id v9 = a4;
  double v10 = [v7 defaultCenter];
  v15[0] = @"domainWithModifiedPageZoomPreference";
  v15[1] = @"pageZoomFactor";
  v16[0] = v8;
  uint64_t v11 = NSNumber;
  uint64_t v12 = [v9 integerValue];

  [(WBSPageZoomPreferenceManager *)self _pageZoomStepToZoomFactor:v12];
  id v13 = objc_msgSend(v11, "numberWithDouble:");
  v16[1] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  [v10 postNotificationName:@"perSitePageZoomPreferenceDidChange" object:self userInfo:v14];
}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_perSitePreferencesStore;
}

- (id)preferenceNameForPreference:(id)a3
{
  return @"PerSitePreferencesPageZoom";
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  uint64_t v3 = [&unk_1EFC22208 indexOfObject:&unk_1EFC229B8];
  double v4 = NSNumber;
  return (id)[v4 numberWithUnsignedInteger:v3];
}

- (WBSPerSitePreference)pageZoomPreference
{
  return self->_pageZoomPreference;
}

- (WBSPageZoomPreferenceManager)fallbackPreferenceManager
{
  return self->_fallbackPreferenceManager;
}

- (void)setFallbackPreferenceManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackPreferenceManager, 0);
  objc_storeStrong((id *)&self->_pageZoomPreference, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesStore, 0);
}

void __70__WBSPageZoomPreferenceManager_resetZoomLevelOnURL_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "SQLiteStore deletion failed for page zoom per site preferences for domain %{private}@", (uint8_t *)&v3, 0xCu);
}

void __70__WBSPageZoomPreferenceManager_resetZoomLevelOnURL_completionHandler___block_invoke_2_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "SQLiteStore deletion failed for page zoom per site preferences", v1, 2u);
}

- (void)_getZoomStepForDomain:(uint64_t)a1 usingBlock:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "Checking page zoom per site preference from storage for domain '%{private}@'", (uint8_t *)&v2, 0xCu);
}

- (void)_getZoomStepForDomain:(os_log_t)log usingBlock:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "Checking page zoom per site preference from storage", v1, 2u);
}

void __86__WBSPageZoomPreferenceManager__incrementOrDecreaseZoomStep_forURL_completionHandler___block_invoke_4_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Failed to update SQLiteStore for page zoom per site preferences due to database not open or statement not done", v1, 2u);
}

@end