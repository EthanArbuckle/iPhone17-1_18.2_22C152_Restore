@interface WBSAutoplayPreferenceManager
- (WBSAutoplayPreferenceManager)init;
- (WBSAutoplayPreferenceManager)initWithPerSitePreferencesStore:(id)a3 allowListManager:(id)a4;
- (WBSPerSitePreference)autoplayPreference;
- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore;
- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3;
- (id)localizedStringForValue:(id)a3 inPreference:(id)a4;
- (id)preferenceNameForPreference:(id)a3;
- (id)preferences;
- (id)valuesForPreference:(id)a3;
- (void)didUpdatePreference:(id)a3 toValue:(id)a4 forDomain:(id)a5;
- (void)getAutoplayPreferenceValueForDomain:(id)a3 withTimeout:(double)a4 fallbackValue:(int64_t)a5 completionHandler:(id)a6;
- (void)getValueOfPreference:(id)a3 forDomain:(id)a4 withTimeout:(id)a5 usingBlock:(id)a6;
- (void)prepareForTermination;
- (void)setAutoplayPreferenceValue:(int64_t)a3 forURL:(id)a4 completionHandler:(id)a5;
@end

@implementation WBSAutoplayPreferenceManager

- (WBSAutoplayPreferenceManager)init
{
  return 0;
}

- (WBSAutoplayPreferenceManager)initWithPerSitePreferencesStore:(id)a3 allowListManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSAutoplayPreferenceManager;
  v9 = [(WBSAutoplayPreferenceManager *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_perSitePreferencesStore, a3);
    objc_storeStrong((id *)&v10->_domainAllowListManager, a4);
    v11 = [[WBSPerSitePreference alloc] initWithIdentifier:@"AutoplayPreference"];
    autoplayPreference = v10->_autoplayPreference;
    v10->_autoplayPreference = v11;

    [(WBSPerSitePreferenceManager *)v10 setStorageDelegate:v10];
    [(WBSPerSitePreferenceManager *)v10 setDefaultsDelegate:v10];
    v13 = v10;
  }

  return v10;
}

- (void)getAutoplayPreferenceValueForDomain:(id)a3 withTimeout:(double)a4 fallbackValue:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  autoplayPreference = self->_autoplayPreference;
  v12 = NSNumber;
  id v13 = a3;
  v14 = [v12 numberWithInteger:a5];
  objc_super v15 = +[WBSPerSitePreferenceTimeout timeoutWithInterval:v14 fallbackValue:a4];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __112__WBSAutoplayPreferenceManager_getAutoplayPreferenceValueForDomain_withTimeout_fallbackValue_completionHandler___block_invoke;
  v17[3] = &unk_1E5C8C748;
  id v18 = v10;
  id v16 = v10;
  [(WBSAutoplayPreferenceManager *)self getValueOfPreference:autoplayPreference forDomain:v13 withTimeout:v15 usingBlock:v17];
}

uint64_t __112__WBSAutoplayPreferenceManager_getAutoplayPreferenceValueForDomain_withTimeout_fallbackValue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = [a2 integerValue];
  if (v3 >= 3) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v3;
  }
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v5(v2, v4);
}

- (void)getValueOfPreference:(id)a3 forDomain:(id)a4 withTimeout:(id)a5 usingBlock:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__WBSAutoplayPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke;
  v15[3] = &unk_1E5C8C7C0;
  id v16 = v10;
  id v17 = v11;
  v15[4] = self;
  v14.receiver = self;
  v14.super_class = (Class)WBSAutoplayPreferenceManager;
  id v12 = v10;
  id v13 = v11;
  [(WBSPerSitePreferenceManager *)&v14 getValueOfPreference:a3 forDomain:v12 withTimeout:a5 usingBlock:v15];
}

void __86__WBSAutoplayPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  v6 = v5;
  if (a3 && *(void *)(*(void *)(a1 + 32) + 40))
  {
    if (![v5 isEqual:&unk_1EFC22450])
    {
      uint64_t v8 = *(void *)(a1 + 40);
      v9 = *(void **)(*(void *)(a1 + 32) + 40);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __86__WBSAutoplayPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_11;
      v12[3] = &unk_1E5C8C798;
      id v16 = *(id *)(a1 + 48);
      char v17 = a3;
      id v13 = *(id *)(a1 + 40);
      id v10 = v6;
      uint64_t v11 = *(void *)(a1 + 32);
      id v14 = v10;
      uint64_t v15 = v11;
      [v9 isDomainAllowed:v8 completionHandler:v12];

      goto LABEL_7;
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v7();
LABEL_7:
}

void __86__WBSAutoplayPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_11(uint64_t a1, int a2)
{
  if (a2)
  {
    unint64_t v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
  else
  {
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "safari_highLevelDomainFromHost");
    if ([v4 length] && !objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v4))
    {
      id v5 = *(void **)(*(void *)(a1 + 48) + 40);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __86__WBSAutoplayPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_14;
      v6[3] = &unk_1E5C8C770;
      id v8 = *(id *)(a1 + 56);
      id v7 = *(id *)(a1 + 40);
      char v9 = *(unsigned char *)(a1 + 64);
      [v5 isDomainAllowed:v4 completionHandler:v6];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

uint64_t __86__WBSAutoplayPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_14(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    uint64_t v4 = &unk_1EFC22468;
  }
  else {
    uint64_t v4 = *(void **)(a1 + 32);
  }
  return (*(uint64_t (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, *(unsigned __int8 *)(a1 + 48));
}

- (void)setAutoplayPreferenceValue:(int64_t)a3 forURL:(id)a4 completionHandler:(id)a5
{
  id v8 = NSNumber;
  id v9 = a5;
  id v10 = a4;
  id v13 = [v8 numberWithInteger:a3];
  autoplayPreference = self->_autoplayPreference;
  id v12 = objc_msgSend(v10, "safari_userVisibleHostWithoutWWWSubdomain");

  [(WBSPerSitePreferenceManager *)self setValue:v13 ofPreference:autoplayPreference forDomain:v12 completionHandler:v9];
}

- (void)prepareForTermination
{
}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_perSitePreferencesStore;
}

- (id)preferences
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_autoplayPreference;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)valuesForPreference:(id)a3
{
  return &unk_1EFC22088;
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  if ((unint64_t)[a3 integerValue] > 2)
  {
    uint64_t v4 = &stru_1EFBE3CF8;
  }
  else
  {
    _WBSLocalizedString();
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)didUpdatePreference:(id)a3 toValue:(id)a4 forDomain:(id)a5
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)WBSAutoplayPreferenceManager;
  id v8 = a5;
  id v9 = a4;
  [(WBSPerSitePreferenceManager *)&v12 didUpdatePreference:a3 toValue:v9 forDomain:v8];
  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v13[0] = @"AutoplayPreferenceDomain";
  v13[1] = @"AutoplayPreferenceValue";
  v14[0] = v8;
  v14[1] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  [v10 postNotificationName:@"WBSAutoplayPreferenceManagerDidUpdateAutoplayPreference" object:self userInfo:v11];
}

- (id)preferenceNameForPreference:(id)a3
{
  return @"PerSitePreferencesAutoplay";
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  return &unk_1EFC22480;
}

- (WBSPerSitePreference)autoplayPreference
{
  return self->_autoplayPreference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoplayPreference, 0);
  objc_storeStrong((id *)&self->_domainAllowListManager, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesStore, 0);
}

@end