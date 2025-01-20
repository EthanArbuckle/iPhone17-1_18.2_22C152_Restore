@interface WBSAutomaticReaderActivationManager
- (WBSAutomaticReaderActivationManager)init;
- (WBSAutomaticReaderActivationManager)initWithPerSitePreferencesStore:(id)a3;
- (WBSPerSitePreference)readerPreference;
- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore;
- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3;
- (id)localizedStringForValue:(id)a3 inPreference:(id)a4;
- (id)offValueForPreference:(id)a3;
- (id)onValueForPreference:(id)a3;
- (id)preferenceNameForPreference:(id)a3;
- (id)preferences;
- (id)valuesForPreference:(id)a3;
- (void)didUpdatePreference:(id)a3 toValue:(id)a4 forDomain:(id)a5;
- (void)getAutomaticReaderEnabledByDefaultUsingBlock:(id)a3;
- (void)getAutomaticReaderEnabledForDomain:(id)a3 usingBlock:(id)a4;
- (void)getAutomaticReaderStateForDomain:(id)a3 usingBlock:(id)a4;
- (void)setAutomaticReaderEnabled:(BOOL)a3 forDomain:(id)a4;
- (void)setAutomaticReaderEnabledByDefault:(BOOL)a3 removingExistingPreferencesForSites:(BOOL)a4;
@end

@implementation WBSAutomaticReaderActivationManager

- (WBSAutomaticReaderActivationManager)init
{
  return 0;
}

- (WBSAutomaticReaderActivationManager)initWithPerSitePreferencesStore:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSAutomaticReaderActivationManager;
  v6 = [(WBSAutomaticReaderActivationManager *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_perSitePreferencesStore, a3);
    v8 = [[WBSPerSitePreference alloc] initWithIdentifier:@"ReaderPreference"];
    readerPreference = v7->_readerPreference;
    v7->_readerPreference = v8;

    [(WBSPerSitePreferenceManager *)v7 setStorageDelegate:v7];
    [(WBSPerSitePreferenceManager *)v7 setDefaultsDelegate:v7];
    v10 = v7;
  }

  return v7;
}

- (id)preferences
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_readerPreference;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)valuesForPreference:(id)a3
{
  return &unk_1EFC22070;
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  v4 = +[WBSPerSitePreference localizedStringForBinaryPreferenceValue:](WBSPerSitePreference, "localizedStringForBinaryPreferenceValue:", a3, a4);
  return v4;
}

- (void)didUpdatePreference:(id)a3 toValue:(id)a4 forDomain:(id)a5
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v11[0] = @"domainWithModifiedReaderPreference";
  v11[1] = @"websiteShouldStartWithReaderEnabled";
  v12[0] = v8;
  v12[1] = v7;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v9 postNotificationName:@"perSiteAutomaticReaderActivationPreferenceDidChange" object:self userInfo:v10];
}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_perSitePreferencesStore;
}

- (id)preferenceNameForPreference:(id)a3
{
  return @"PerSitePreferencesUseReader";
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  return (id)MEMORY[0x1E4F1CC28];
}

- (id)onValueForPreference:(id)a3
{
  return (id)MEMORY[0x1E4F1CC38];
}

- (id)offValueForPreference:(id)a3
{
  return (id)MEMORY[0x1E4F1CC28];
}

- (void)getAutomaticReaderStateForDomain:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__WBSAutomaticReaderActivationManager_getAutomaticReaderStateForDomain_usingBlock___block_invoke;
  v8[3] = &unk_1E5C8C638;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(WBSAutomaticReaderActivationManager *)self getAutomaticReaderEnabledForDomain:a3 usingBlock:v8];
}

void __83__WBSAutomaticReaderActivationManager_getAutomaticReaderStateForDomain_usingBlock___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__WBSAutomaticReaderActivationManager_getAutomaticReaderStateForDomain_usingBlock___block_invoke_2;
  v3[3] = &unk_1E5C8C610;
  char v5 = a2;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v2 getAutomaticReaderEnabledByDefaultUsingBlock:v3];
}

uint64_t __83__WBSAutomaticReaderActivationManager_getAutomaticReaderStateForDomain_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAutomaticReaderEnabledForDomain:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  readerPreference = self->_readerPreference;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__WBSAutomaticReaderActivationManager_getAutomaticReaderEnabledForDomain_usingBlock___block_invoke;
  v9[3] = &unk_1E5C8C688;
  id v10 = v6;
  id v8 = v6;
  [(WBSPerSitePreferenceManager *)self getValueOfPreference:readerPreference forDomain:a3 withTimeout:0 usingBlock:v9];
}

void __85__WBSAutomaticReaderActivationManager_getAutomaticReaderEnabledForDomain_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__WBSAutomaticReaderActivationManager_getAutomaticReaderEnabledForDomain_usingBlock___block_invoke_2;
  v6[3] = &unk_1E5C8C660;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __85__WBSAutomaticReaderActivationManager_getAutomaticReaderEnabledForDomain_usingBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) BOOLValue];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (void)setAutomaticReaderEnabled:(BOOL)a3 forDomain:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [(WBSPerSitePreferenceManager *)self setValue:v6 ofPreference:self->_readerPreference forDomain:v7 completionHandler:0];
}

- (void)getAutomaticReaderEnabledByDefaultUsingBlock:(id)a3
{
  id v4 = a3;
  readerPreference = self->_readerPreference;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__WBSAutomaticReaderActivationManager_getAutomaticReaderEnabledByDefaultUsingBlock___block_invoke;
  v7[3] = &unk_1E5C8C6B0;
  id v8 = v4;
  id v6 = v4;
  [(WBSPerSitePreferenceManager *)self getDefaultPreferenceValueForPreference:readerPreference completionHandler:v7];
}

void __84__WBSAutomaticReaderActivationManager_getAutomaticReaderEnabledByDefaultUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v3 BOOLValue]);
}

- (void)setAutomaticReaderEnabledByDefault:(BOOL)a3 removingExistingPreferencesForSites:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4) {
    [(WBSPerSitePreferencesSQLiteStore *)self->_perSitePreferencesStore removeAllPreferenceValuesFromPreference:@"PerSitePreferencesUseReader" completionHandler:0];
  }
  id v6 = [NSNumber numberWithBool:v4];
  -[WBSPerSitePreferenceManager setDefaultValue:ofPreference:completionHandler:](self, "setDefaultValue:ofPreference:completionHandler:");
}

- (WBSPerSitePreference)readerPreference
{
  return self->_readerPreference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerPreference, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesStore, 0);
}

@end