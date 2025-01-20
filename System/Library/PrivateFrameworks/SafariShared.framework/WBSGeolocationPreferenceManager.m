@interface WBSGeolocationPreferenceManager
- (BOOL)_isDateLessThanOneDayAgo:(id)a3;
- (WBSGeolocationPreferenceManager)initWithPerSitePreferencesStore:(id)a3;
- (WBSPerSitePreference)geolocationPreference;
- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore;
- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3;
- (id)localizedStringForValue:(id)a3 inPreference:(id)a4;
- (id)perSitePreferenceValueForGeolocationSetting:(int64_t)a3;
- (id)preferenceNameForPreference:(id)a3;
- (id)preferences;
- (id)valuesForPreference:(id)a3;
- (void)_removePermissionsPassingTest:(id)a3 completionHandler:(id)a4;
- (void)_setValue:(id)a3 forDomain:(id)a4 shouldIncludeTimestamp:(BOOL)a5 completionHandler:(id)a6;
- (void)getAllDomainsConfiguredForPreference:(id)a3 usingBlock:(id)a4;
- (void)getGeolocationSettingForDomain:(id)a3 completionHandler:(id)a4;
- (void)getValueOfPreference:(id)a3 forDomain:(id)a4 withTimeout:(id)a5 usingBlock:(id)a6;
- (void)removeAllPermissions;
- (void)removeAllPermissionsWithCompletionHandler:(id)a3;
- (void)removeAllTemporaryPermissions;
- (void)removePermissionsAddedAfterDate:(id)a3 completionHandler:(id)a4;
- (void)removePreferenceValuesForDomains:(id)a3 fromPreference:(id)a4 completionHandler:(id)a5;
- (void)removeTemporaryPermissionsAddedAfterDate:(id)a3 completionHandler:(id)a4;
- (void)setDefaultGeolocationSetting:(int64_t)a3 completionHandler:(id)a4;
- (void)setGeolocationSetting:(int64_t)a3 forDomain:(id)a4 completionHandler:(id)a5;
- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 completionHandler:(id)a6;
@end

@implementation WBSGeolocationPreferenceManager

- (WBSGeolocationPreferenceManager)initWithPerSitePreferencesStore:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSGeolocationPreferenceManager;
  v6 = [(WBSGeolocationPreferenceManager *)&v11 init];
  if (v6)
  {
    v7 = [[WBSPerSitePreference alloc] initWithIdentifier:@"GeolocationPreference"];
    geolocationPreference = v6->_geolocationPreference;
    v6->_geolocationPreference = v7;

    objc_storeStrong((id *)&v6->_perSitePreferencesStore, a3);
    [(WBSPerSitePreferenceManager *)v6 setDefaultsDelegate:v6];
    v9 = v6;
  }

  return v6;
}

- (void)getGeolocationSettingForDomain:(id)a3 completionHandler:(id)a4
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__16;
  v9[4] = __Block_byref_object_dispose__16;
  id v6 = a3;
  id v10 = (id)MEMORY[0x1AD0C4F80](a4);
  geolocationPreference = self->_geolocationPreference;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__WBSGeolocationPreferenceManager_getGeolocationSettingForDomain_completionHandler___block_invoke;
  v8[3] = &unk_1E5C9BDB8;
  v8[4] = v9;
  [(WBSGeolocationPreferenceManager *)self getValueOfPreference:geolocationPreference forDomain:v6 withTimeout:0 usingBlock:v8];

  _Block_object_dispose(v9, 8);
}

void __84__WBSGeolocationPreferenceManager_getGeolocationSettingForDomain_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__WBSGeolocationPreferenceManager_getGeolocationSettingForDomain_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5C8E190;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __84__WBSGeolocationPreferenceManager_getGeolocationSettingForDomain_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, [*(id *)(a1 + 32) integerValue]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)setGeolocationSetting:(int64_t)a3 forDomain:(id)a4 completionHandler:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  v9 = [NSNumber numberWithInteger:a3];
  [(WBSGeolocationPreferenceManager *)self _setValue:v9 forDomain:v10 shouldIncludeTimestamp:(unint64_t)(a3 - 3) < 2 completionHandler:v8];
}

- (void)setDefaultGeolocationSetting:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(WBSGeolocationPreferenceManager *)self perSitePreferenceValueForGeolocationSetting:a3];
  geolocationPreference = self->_geolocationPreference;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__WBSGeolocationPreferenceManager_setDefaultGeolocationSetting_completionHandler___block_invoke;
  v10[3] = &unk_1E5C9B720;
  id v9 = v6;
  id v11 = v9;
  [(WBSPerSitePreferenceManager *)self setDefaultValue:v7 ofPreference:geolocationPreference completionHandler:v10];
}

uint64_t __82__WBSGeolocationPreferenceManager_setDefaultGeolocationSetting_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeAllTemporaryPermissions
{
}

BOOL __64__WBSGeolocationPreferenceManager_removeAllTemporaryPermissions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 value];
  uint64_t v3 = [v2 integerValue];

  return (unint64_t)(v3 - 3) < 2;
}

- (void)removeAllPermissions
{
}

- (void)removeAllPermissionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  perSitePreferencesStore = self->_perSitePreferencesStore;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__WBSGeolocationPreferenceManager_removeAllPermissionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C638;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(WBSPerSitePreferencesSQLiteStore *)perSitePreferencesStore removeAllPreferenceValuesFromPreference:@"PerSitePreferencesGeolocation" completionHandler:v7];
}

void __77__WBSGeolocationPreferenceManager_removeAllPermissionsWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__WBSGeolocationPreferenceManager_removeAllPermissionsWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E5C8C610;
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  char v6 = a2;
  [v3 setDefaultGeolocationSetting:0 completionHandler:v4];
}

uint64_t __77__WBSGeolocationPreferenceManager_removeAllPermissionsWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (*(unsigned char *)(a1 + 40)) {
      a2 = a2;
    }
    else {
      a2 = 0;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)removeTemporaryPermissionsAddedAfterDate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__WBSGeolocationPreferenceManager_removeTemporaryPermissionsAddedAfterDate_completionHandler___block_invoke;
  v8[3] = &unk_1E5C9BE00;
  id v9 = v6;
  id v7 = v6;
  [(WBSGeolocationPreferenceManager *)self _removePermissionsPassingTest:v8 completionHandler:a4];
}

BOOL __94__WBSGeolocationPreferenceManager_removeTemporaryPermissionsAddedAfterDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 value];
  uint64_t v5 = [v4 integerValue];

  if ((unint64_t)(v5 - 5) >= 0xFFFFFFFFFFFFFFFELL)
  {
    id v7 = [v3 creationDate];
    BOOL v6 = [v7 compare:*(void *)(a1 + 32)] == 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)removePermissionsAddedAfterDate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__WBSGeolocationPreferenceManager_removePermissionsAddedAfterDate_completionHandler___block_invoke;
  v8[3] = &unk_1E5C9BE00;
  id v9 = v6;
  id v7 = v6;
  [(WBSGeolocationPreferenceManager *)self _removePermissionsPassingTest:v8 completionHandler:a4];
}

BOOL __85__WBSGeolocationPreferenceManager_removePermissionsAddedAfterDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 creationDate];
  BOOL v4 = [v3 compare:*(void *)(a1 + 32)] == 1;

  return v4;
}

- (void)_removePermissionsPassingTest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  perSitePreferencesStore = self->_perSitePreferencesStore;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__WBSGeolocationPreferenceManager__removePermissionsPassingTest_completionHandler___block_invoke;
  v11[3] = &unk_1E5C9BE50;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(WBSPerSitePreferencesSQLiteStore *)perSitePreferencesStore getAllPreferenceInformationForPreference:@"PerSitePreferencesGeolocation" completionHandler:v11];
}

void __83__WBSGeolocationPreferenceManager__removePermissionsPassingTest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__WBSGeolocationPreferenceManager__removePermissionsPassingTest_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5C9BE28;
  id v7 = v3;
  id v4 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v4;
  id v10 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __83__WBSGeolocationPreferenceManager__removePermissionsPassingTest_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
        {
          uint64_t v8 = [v7 domain];
          [v2 addObject:v8];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  id v9 = *(void **)(*(void *)(a1 + 40) + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__WBSGeolocationPreferenceManager__removePermissionsPassingTest_completionHandler___block_invoke_3;
  v10[3] = &unk_1E5C9B720;
  id v11 = *(id *)(a1 + 56);
  [v9 removePreferenceValuesForDomains:v2 fromPreference:@"PerSitePreferencesGeolocation" completionHandler:v10];
}

void __83__WBSGeolocationPreferenceManager__removePermissionsPassingTest_completionHandler___block_invoke_3(uint64_t a1, char a2)
{
  if (*(void *)(a1 + 32))
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __83__WBSGeolocationPreferenceManager__removePermissionsPassingTest_completionHandler___block_invoke_4;
    v3[3] = &unk_1E5C9AF18;
    id v4 = *(id *)(a1 + 32);
    char v5 = a2;
    dispatch_async(MEMORY[0x1E4F14428], v3);
  }
}

uint64_t __83__WBSGeolocationPreferenceManager__removePermissionsPassingTest_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (id)preferences
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_geolocationPreference;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)valuesForPreference:(id)a3
{
  return &unk_1EFC22130;
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  id v4 = a3;
  switch([v4 integerValue])
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      _WBSLocalizedString();
      char v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      char v5 = &stru_1EFBE3CF8;
      break;
  }

  return v5;
}

- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 completionHandler:(id)a6
{
}

- (void)getValueOfPreference:(id)a3 forDomain:(id)a4 withTimeout:(id)a5 usingBlock:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  perSitePreferencesStore = self->_perSitePreferencesStore;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__WBSGeolocationPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke;
  v13[3] = &unk_1E5C9BE78;
  id v14 = v8;
  id v15 = v9;
  v13[4] = self;
  id v11 = v8;
  id v12 = v9;
  [(WBSPerSitePreferencesSQLiteStore *)perSitePreferencesStore getTimestampAndValueOfPreference:@"PerSitePreferencesGeolocation" forDomain:v11 completionHandler:v13];
}

void __89__WBSGeolocationPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = v9[5];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __89__WBSGeolocationPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2;
    v20[3] = &unk_1E5C8C6B0;
    id v21 = *(id *)(a1 + 48);
    [v9 getDefaultPreferenceValueForPreference:v10 completionHandler:v20];
    id v11 = v21;
LABEL_9:

    goto LABEL_10;
  }
  unint64_t v8 = [v6 integerValue];
  if (v8 >= 3 && (v8 - 3 >= 2 || ![*(id *)(a1 + 32) _isDateLessThanOneDayAgo:v5]))
  {
    id v14 = *(void **)(*(void *)(a1 + 32) + 32);
    id v15 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
    [v14 removePreferenceValuesForDomains:v15 fromPreference:@"PerSitePreferencesGeolocation" completionHandler:0];

    v16 = *(void **)(a1 + 32);
    uint64_t v17 = v16[5];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __89__WBSGeolocationPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_3;
    v18[3] = &unk_1E5C8C6B0;
    id v19 = *(id *)(a1 + 48);
    [v16 getDefaultPreferenceValueForPreference:v17 completionHandler:v18];
    id v11 = v19;
    goto LABEL_9;
  }
  uint64_t v12 = *(void *)(a1 + 48);
  long long v13 = [*(id *)(a1 + 32) perSitePreferenceValueForGeolocationSetting:v8];
  (*(void (**)(uint64_t, void *, void))(v12 + 16))(v12, v13, 0);

LABEL_10:
}

uint64_t __89__WBSGeolocationPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__WBSGeolocationPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAllDomainsConfiguredForPreference:(id)a3 usingBlock:(id)a4
{
  id v5 = a4;
  perSitePreferencesStore = self->_perSitePreferencesStore;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__WBSGeolocationPreferenceManager_getAllDomainsConfiguredForPreference_usingBlock___block_invoke;
  v8[3] = &unk_1E5C9BEA0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(WBSPerSitePreferencesSQLiteStore *)perSitePreferencesStore getAllPreferenceInformationForPreference:@"PerSitePreferencesGeolocation" completionHandler:v8];
}

void __83__WBSGeolocationPreferenceManager_getAllDomainsConfiguredForPreference_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__WBSGeolocationPreferenceManager_getAllDomainsConfiguredForPreference_usingBlock___block_invoke_2;
  block[3] = &unk_1E5C8D730;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __83__WBSGeolocationPreferenceManager_getAllDomainsConfiguredForPreference_usingBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "value", (void)v14);
        unint64_t v10 = [v9 integerValue];

        if (v10 < 3) {
          goto LABEL_7;
        }
        if (v10 - 3 >= 2) {
          continue;
        }
        uint64_t v12 = *(void **)(a1 + 40);
        long long v13 = [v8 creationDate];
        LODWORD(v12) = [v12 _isDateLessThanOneDayAgo:v13];

        if (v12)
        {
LABEL_7:
          id v11 = [v8 domain];
          [v2 addObject:v11];
        }
        else
        {
          id v11 = [v8 domain];
          [v3 addObject:v11];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  [*(id *)(*(void *)(a1 + 40) + 32) removePreferenceValuesForDomains:v3 fromPreference:@"PerSitePreferencesGeolocation" completionHandler:0];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)removePreferenceValuesForDomains:(id)a3 fromPreference:(id)a4 completionHandler:(id)a5
{
}

- (id)preferenceNameForPreference:(id)a3
{
  return @"PerSitePreferencesGeolocation";
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  id v3 = [(WBSGeolocationPreferenceManager *)self perSitePreferenceValueForGeolocationSetting:0];
  return v3;
}

- (id)perSitePreferenceValueForGeolocationSetting:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return &unk_1EFC22720;
  }
  else {
    return (id)qword_1E5C9BEE8[a3];
  }
}

- (BOOL)_isDateLessThanOneDayAgo:(id)a3
{
  [a3 timeIntervalSinceNow];
  return v3 > -86400.0 && v3 < 0.0;
}

- (void)_setValue:(id)a3 forDomain:(id)a4 shouldIncludeTimestamp:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, self);
  perSitePreferencesStore = self->_perSitePreferencesStore;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __96__WBSGeolocationPreferenceManager__setValue_forDomain_shouldIncludeTimestamp_completionHandler___block_invoke;
  v17[3] = &unk_1E5C9BEC8;
  objc_copyWeak(&v21, &location);
  id v18 = v11;
  id v19 = v10;
  id v20 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  [(WBSPerSitePreferencesSQLiteStore *)perSitePreferencesStore setValue:v15 ofPreference:@"PerSitePreferencesGeolocation" forDomain:v16 includeTimestamp:v7 completionHandler:v17];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __96__WBSGeolocationPreferenceManager__setValue_forDomain_shouldIncludeTimestamp_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (a2 && WeakRetained)
  {
    id v4 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v5 = WeakRetained[5];
      uint64_t v6 = *(void *)(a1 + 32);
      BOOL v7 = objc_msgSend(WeakRetained, "perSitePreferenceValueForGeolocationSetting:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
      [v4 perSitePreferenceManager:WeakRetained didUpdateValueForPreference:v5 onDomain:v6 toValue:v7];
    }
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, a2);
  }
}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_perSitePreferencesStore;
}

- (WBSPerSitePreference)geolocationPreference
{
  return self->_geolocationPreference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geolocationPreference, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesStore, 0);
}

@end