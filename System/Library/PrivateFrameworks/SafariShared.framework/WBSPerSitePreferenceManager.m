@interface WBSPerSitePreferenceManager
- (BOOL)shouldDeleteUnrecognizedPreference;
- (WBSPerSitePreferenceManagerDefaultsDelegate)defaultsDelegate;
- (WBSPerSitePreferenceManagerDelegate)delegate;
- (WBSPerSitePreferenceManagerStorageDelegate)storageDelegate;
- (id)defaultPreferenceValueForPreference:(id)a3;
- (id)localizedStringForValue:(id)a3 inPreference:(id)a4;
- (id)preferences;
- (id)validateValue:(id)a3 forPreference:(id)a4;
- (id)valueOfPreference:(id)a3 forDomain:(id)a4;
- (id)valuesForPreference:(id)a3;
- (void)_recursivelySetDefaultPreferenceValues:(id)a3 orderedKeys:(id)a4 currentIndex:(int64_t)a5 existingResult:(BOOL)a6 completionHandler:(id)a7;
- (void)getAllDomainsConfiguredForPreference:(id)a3 usingBlock:(id)a4;
- (void)getDefaultPreferenceValueForPreference:(id)a3 completionHandler:(id)a4;
- (void)getValueOfPreference:(id)a3 forDomain:(id)a4 withTimeout:(id)a5 usingBlock:(id)a6;
- (void)removePreferenceValuesForDomains:(id)a3 fromPreference:(id)a4 completionHandler:(id)a5;
- (void)setDefaultPreferenceValues:(id)a3 completionHandler:(id)a4;
- (void)setDefaultValue:(id)a3 ofPreference:(id)a4 completionHandler:(id)a5;
- (void)setDefaultsDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStorageDelegate:(id)a3;
- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 completionHandler:(id)a6;
@end

@implementation WBSPerSitePreferenceManager

- (void)setStorageDelegate:(id)a3
{
}

- (void)setDefaultsDelegate:(id)a3
{
}

void __88__WBSPerSitePreferenceManager_getDefaultPreferenceValueForPreference_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 40);
  if (a2)
  {
    id v6 = [*(id *)(a1 + 48) validateValue:a2 forPreference:v4];
    if (v6)
    {
      (*(void (**)(uint64_t, id))(v3 + 16))(v3, v6);
    }
    else
    {
      v5 = [*(id *)(a1 + 32) defaultPreferenceValueForPreferenceIfNotCustomized:*(void *)(a1 + 40)];
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
    }
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) defaultPreferenceValueForPreferenceIfNotCustomized:v4];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v6);
  }
}

- (void)getDefaultPreferenceValueForPreference:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultsDelegate);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = [WeakRetained preferenceNameForPreference:v6];
    v11 = [v9 perSitePreferencesStore];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __88__WBSPerSitePreferenceManager_getDefaultPreferenceValueForPreference_completionHandler___block_invoke;
    v13[3] = &unk_1E5C9E980;
    id v17 = v7;
    id v14 = v9;
    id v15 = v6;
    v16 = self;
    [v11 getDefaultValueForPreference:v10 completionHandler:v13];
  }
  else
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

- (id)preferences
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)valuesForPreference:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  return &stru_1EFBE3CF8;
}

- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storageDelegate);

  if (WeakRetained)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81__WBSPerSitePreferenceManager_setValue_ofPreference_forDomain_completionHandler___block_invoke;
    v15[3] = &unk_1E5C9E8E0;
    id v16 = v10;
    id v20 = v13;
    id v17 = self;
    id v18 = v11;
    id v19 = v12;
    [(WBSPerSitePreferenceManager *)self getValueOfPreference:v18 forDomain:v19 withTimeout:0 usingBlock:v15];
  }
  else
  {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
}

void __81__WBSPerSitePreferenceManager_setValue_ofPreference_forDomain_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isEqual:*(void *)(a1 + 32)])
  {
    uint64_t v3 = *(void *)(a1 + 64);
    if (v3)
    {
      uint64_t v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
    id v6 = [WeakRetained perSitePreferencesStore];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = [WeakRetained preferenceNameForPreference:*(void *)(a1 + 48)];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __81__WBSPerSitePreferenceManager_setValue_ofPreference_forDomain_completionHandler___block_invoke_2;
    v13[3] = &unk_1E5C9E8B8;
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = *(id *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = *(void **)(a1 + 48);
    id v17 = v10;
    void v13[4] = v11;
    id v14 = v12;
    id v15 = *(id *)(a1 + 32);
    id v16 = *(id *)(a1 + 56);
    [v6 setValue:v7 ofPreference:v8 forDomain:v9 completionHandler:v13];
  }
}

void __81__WBSPerSitePreferenceManager_setValue_ofPreference_forDomain_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  [*(id *)(a1 + 32) didUpdatePreference:*(void *)(a1 + 40) toValue:*(void *)(a1 + 48) forDomain:*(void *)(a1 + 56)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained perSitePreferenceManager:*(void *)(a1 + 32) didUpdateValueForPreference:*(void *)(a1 + 40) onDomain:*(void *)(a1 + 56) toValue:*(void *)(a1 + 48)];
  }
}

- (void)getValueOfPreference:(id)a3 forDomain:(id)a4 withTimeout:(id)a5 usingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storageDelegate);
  id v15 = WeakRetained;
  if (WeakRetained)
  {
    id v16 = [WeakRetained perSitePreferencesStore];
    id v17 = [v15 preferenceNameForPreference:v10];
    if (v12)
    {
      [v12 interval];
      double v19 = v18;
    }
    else
    {
      double v19 = 1.79769313e308;
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke;
    v20[3] = &unk_1E5C9E958;
    id v21 = v10;
    id v22 = v12;
    v23 = self;
    id v24 = v15;
    id v25 = v11;
    id v26 = v13;
    [v16 getValueOfPreference:v17 forDomain:v25 withTimeoutInterval:v20 completionHandler:v19];
  }
}

void __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = dispatch_get_global_queue(21, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2;
  v11[3] = &unk_1E5C9E930;
  uint64_t v19 = a3;
  id v12 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void **)(a1 + 56);
  id v13 = v7;
  uint64_t v14 = v8;
  id v15 = v5;
  id v16 = v9;
  id v17 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 72);
  id v10 = v5;
  dispatch_async(v6, v11);
}

void __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  if (!v2)
  {
    id v6 = [*(id *)(a1 + 48) validateValue:*(void *)(a1 + 56) forPreference:*(void *)(a1 + 32)];
    uint64_t v4 = v6;
    BOOL v5 = v6 == 0;
    if (v6)
    {
      id v7 = v6;
    }
    else if (*(void *)(a1 + 56) && [*(id *)(a1 + 48) shouldDeleteUnrecognizedPreference])
    {
      id v11 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2_cold_3(v11);
      }
      id v12 = [*(id *)(a1 + 64) perSitePreferencesStore];
      id v13 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 72)];
      uint64_t v14 = [*(id *)(a1 + 64) preferenceNameForPreference:*(void *)(a1 + 32)];
      [v12 removePreferenceValuesForDomains:v13 fromPreference:v14 completionHandler:0];
    }
    if (!v4) {
      goto LABEL_15;
    }
    goto LABEL_11;
  }
  if (v2 == 1)
  {
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2_cold_2(a1, v8);
    }
    goto LABEL_14;
  }
  if (v2 != 2)
  {
LABEL_14:
    BOOL v5 = 1;
LABEL_15:
    uint64_t v9 = *(void **)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_23;
    v15[3] = &unk_1E5C9E908;
    id v16 = *(id *)(a1 + 80);
    BOOL v17 = v5;
    [v9 getDefaultPreferenceValueForPreference:v10 completionHandler:v15];
    uint64_t v4 = v16;
    goto LABEL_16;
  }
  uint64_t v3 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2_cold_1(a1, v3);
  }
  uint64_t v4 = [*(id *)(a1 + 40) fallbackValue];
  BOOL v5 = 1;
  if (!v4) {
    goto LABEL_15;
  }
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
LABEL_16:
}

uint64_t __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_23(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40));
}

- (id)valueOfPreference:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storageDelegate);
  uint64_t v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = [WeakRetained perSitePreferencesStore];
    id v11 = [v9 preferenceNameForPreference:v6];
    id v12 = [v10 valueOfPreference:v11 forDomain:v7];

    id v13 = [(WBSPerSitePreferenceManager *)self validateValue:v12 forPreference:v6];
    uint64_t v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      if (v12
        && [(WBSPerSitePreferenceManager *)self shouldDeleteUnrecognizedPreference])
      {
        BOOL v17 = [v9 perSitePreferencesStore];
        id v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
        uint64_t v19 = [v9 preferenceNameForPreference:v6];
        [v17 removePreferenceValuesForDomains:v18 fromPreference:v19 completionHandler:0];
      }
      id v15 = [(WBSPerSitePreferenceManager *)self defaultPreferenceValueForPreference:v6];
    }
    id v16 = v15;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)defaultPreferenceValueForPreference:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultsDelegate);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained preferenceNameForPreference:v4];
    uint64_t v8 = [v6 perSitePreferencesStore];
    uint64_t v9 = [v8 defaultValueForPreference:v7];

    uint64_t v10 = [(WBSPerSitePreferenceManager *)self validateValue:v9 forPreference:v4];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [v6 defaultPreferenceValueForPreferenceIfNotCustomized:v4];
    }
    id v13 = v12;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)setDefaultValue:(id)a3 ofPreference:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultsDelegate);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__WBSPerSitePreferenceManager_setDefaultValue_ofPreference_completionHandler___block_invoke;
  v16[3] = &unk_1E5C9E9A8;
  id v17 = v8;
  id v18 = WeakRetained;
  id v19 = v9;
  id v20 = v10;
  id v12 = v9;
  id v13 = WeakRetained;
  id v14 = v10;
  id v15 = v8;
  [(WBSPerSitePreferenceManager *)self getDefaultPreferenceValueForPreference:v12 completionHandler:v16];
}

void __78__WBSPerSitePreferenceManager_setDefaultValue_ofPreference_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) isEqual:a2])
  {
    uint64_t v3 = *(void *)(a1 + 56);
    if (v3)
    {
      id v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    BOOL v5 = [*(id *)(a1 + 40) preferenceNameForPreference:*(void *)(a1 + 48)];
    id v6 = [*(id *)(a1 + 40) perSitePreferencesStore];
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__WBSPerSitePreferenceManager_setDefaultValue_ofPreference_completionHandler___block_invoke_2;
    v8[3] = &unk_1E5C9DF10;
    id v9 = *(id *)(a1 + 56);
    [v6 setDefaultValue:v7 forPreference:v5 completionHandler:v8];
  }
}

uint64_t __78__WBSPerSitePreferenceManager_setDefaultValue_ofPreference_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setDefaultPreferenceValues:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 allKeys];
  [(WBSPerSitePreferenceManager *)self _recursivelySetDefaultPreferenceValues:v7 orderedKeys:v8 currentIndex:0 existingResult:1 completionHandler:v6];
}

- (void)_recursivelySetDefaultPreferenceValues:(id)a3 orderedKeys:(id)a4 currentIndex:(int64_t)a5 existingResult:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = (void (**)(id, BOOL))a7;
  if ([v12 count] <= a5)
  {
    if (v14) {
      v14[2](v14, v8);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    id v15 = [v13 objectAtIndexedSubscript:a5];
    id v16 = [v12 objectForKeyedSubscript:v15];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __128__WBSPerSitePreferenceManager__recursivelySetDefaultPreferenceValues_orderedKeys_currentIndex_existingResult_completionHandler___block_invoke;
    v17[3] = &unk_1E5C9E9D0;
    objc_copyWeak(v21, &location);
    id v18 = v12;
    id v19 = v13;
    v21[1] = (id)a5;
    BOOL v22 = v8;
    id v20 = v14;
    [(WBSPerSitePreferenceManager *)self setDefaultValue:v16 ofPreference:v15 completionHandler:v17];

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
}

void __128__WBSPerSitePreferenceManager__recursivelySetDefaultPreferenceValues_orderedKeys_currentIndex_existingResult_completionHandler___block_invoke(uint64_t a1, unsigned int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v6 = WeakRetained;
  if (*(unsigned char *)(a1 + 72)) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = 0;
  }
  [WeakRetained _recursivelySetDefaultPreferenceValues:*(void *)(a1 + 32) orderedKeys:*(void *)(a1 + 40) currentIndex:*(void *)(a1 + 64) + 1 existingResult:v5 completionHandler:*(void *)(a1 + 48)];
}

- (void)getAllDomainsConfiguredForPreference:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storageDelegate);
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = [WeakRetained perSitePreferencesStore];
    id v11 = [v9 preferenceNameForPreference:v6];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__WBSPerSitePreferenceManager_getAllDomainsConfiguredForPreference_usingBlock___block_invoke;
    v13[3] = &unk_1E5C9E9F8;
    id v14 = v7;
    [v10 getAllDomainsConfiguredForPreference:v11 completionHandler:v13];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1CAD0] set];
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

void __79__WBSPerSitePreferenceManager_getAllDomainsConfiguredForPreference_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__WBSPerSitePreferenceManager_getAllDomainsConfiguredForPreference_usingBlock___block_invoke_2;
  v6[3] = &unk_1E5C8DDF0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __79__WBSPerSitePreferenceManager_getAllDomainsConfiguredForPreference_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removePreferenceValuesForDomains:(id)a3 fromPreference:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storageDelegate);
  id v12 = WeakRetained;
  if (WeakRetained)
  {
    id v13 = [WeakRetained perSitePreferencesStore];
    id v14 = [v12 preferenceNameForPreference:v9];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __97__WBSPerSitePreferenceManager_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke;
    v15[3] = &unk_1E5C9A640;
    id v18 = v10;
    void v15[4] = self;
    id v16 = v9;
    id v17 = v8;
    [v13 removePreferenceValuesForDomains:v17 fromPreference:v14 completionHandler:v15];
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __97__WBSPerSitePreferenceManager_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97__WBSPerSitePreferenceManager_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5C9EA20;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v7;
  [v3 getDefaultPreferenceValueForPreference:v4 completionHandler:v8];
}

void __97__WBSPerSitePreferenceManager_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(a1 + 40), "didUpdatePreference:toValue:forDomain:", *(void *)(a1 + 48), v3, *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)shouldDeleteUnrecognizedPreference
{
  return 1;
}

- (id)validateValue:(id)a3 forPreference:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(WBSPerSitePreferenceManager *)self valuesForPreference:a4];
  if ([v7 containsObject:v6]) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (WBSPerSitePreferenceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSPerSitePreferenceManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WBSPerSitePreferenceManagerStorageDelegate)storageDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storageDelegate);
  return (WBSPerSitePreferenceManagerStorageDelegate *)WeakRetained;
}

- (WBSPerSitePreferenceManagerDefaultsDelegate)defaultsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultsDelegate);
  return (WBSPerSitePreferenceManagerDefaultsDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_defaultsDelegate);
  objc_destroyWeak((id *)&self->_storageDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

void __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 identifier];
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v5, v6, "Timed out fetching per site preference with identifier '%{public}@' from SQLiteStore", v7, v8, v9, v10, 2u);
}

void __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2_cold_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 identifier];
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v5, v6, "Failed to fetch per site preference with identifier '%{public}@' from SQLiteStore", v7, v8, v9, v10, 2u);
}

void __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2_cold_3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Unable to recognize value from the tag. Deleting preference value for this domain from memory", v1, 2u);
}

@end