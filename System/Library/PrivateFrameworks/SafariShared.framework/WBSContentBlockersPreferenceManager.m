@interface WBSContentBlockersPreferenceManager
- (WBSContentBlockersPreferenceManager)init;
- (WBSContentBlockersPreferenceManager)initWithPerSitePreferencesStore:(id)a3;
- (WBSPerSitePreference)contentBlockersPreference;
- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore;
- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3;
- (id)localizedStringForValue:(id)a3 inPreference:(id)a4;
- (id)offValueForPreference:(id)a3;
- (id)onValueForPreference:(id)a3;
- (id)preferenceNameForPreference:(id)a3;
- (id)preferences;
- (id)valuesForPreference:(id)a3;
- (void)didUpdatePreference:(id)a3 toValue:(id)a4 forDomain:(id)a5;
- (void)getContentBlockersEnabledStateForDomain:(id)a3 withTimeout:(double)a4 fallbackEnabledState:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation WBSContentBlockersPreferenceManager

- (WBSContentBlockersPreferenceManager)init
{
  return 0;
}

- (WBSContentBlockersPreferenceManager)initWithPerSitePreferencesStore:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSContentBlockersPreferenceManager;
  v6 = [(WBSContentBlockersPreferenceManager *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_perSitePreferencesStore, a3);
    v8 = [[WBSPerSitePreference alloc] initWithIdentifier:@"ContentBlockersPreference"];
    contentBlockersPreference = v7->_contentBlockersPreference;
    v7->_contentBlockersPreference = v8;

    [(WBSPerSitePreferenceManager *)v7 setStorageDelegate:v7];
    [(WBSPerSitePreferenceManager *)v7 setDefaultsDelegate:v7];
    v10 = v7;
  }

  return v7;
}

- (void)getContentBlockersEnabledStateForDomain:(id)a3 withTimeout:(double)a4 fallbackEnabledState:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  if ([v10 length])
  {
    contentBlockersPreference = self->_contentBlockersPreference;
    v13 = [NSNumber numberWithBool:v7];
    v14 = +[WBSPerSitePreferenceTimeout timeoutWithInterval:v13 fallbackValue:a4];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __130__WBSContentBlockersPreferenceManager_getContentBlockersEnabledStateForDomain_withTimeout_fallbackEnabledState_completionHandler___block_invoke;
    v15[3] = &unk_1E5C8C748;
    id v16 = v11;
    [(WBSPerSitePreferenceManager *)self getValueOfPreference:contentBlockersPreference forDomain:v10 withTimeout:v14 usingBlock:v15];
  }
  else
  {
    (*((void (**)(id, BOOL))v11 + 2))(v11, v7);
  }
}

uint64_t __130__WBSContentBlockersPreferenceManager_getContentBlockersEnabledStateForDomain_withTimeout_fallbackEnabledState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 BOOLValue];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (void)didUpdatePreference:(id)a3 toValue:(id)a4 forDomain:(id)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F28EB8];
  id v7 = a5;
  v8 = [v6 defaultCenter];
  id v10 = @"domainWithModifiedContentBlockersPreference";
  v11[0] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  [v8 postNotificationName:@"perSiteContentBlockersPreferenceDidChange" object:self userInfo:v9];
}

- (id)preferences
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_contentBlockersPreference;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)valuesForPreference:(id)a3
{
  return &unk_1EFC220B8;
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  return +[WBSPerSitePreference localizedStringForBinaryPreferenceValue:](WBSPerSitePreference, "localizedStringForBinaryPreferenceValue:", a3, a4);
}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_perSitePreferencesStore;
}

- (id)preferenceNameForPreference:(id)a3
{
  return @"PerSitePreferencesContentBlockers";
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  return (id)MEMORY[0x1E4F1CC38];
}

- (id)onValueForPreference:(id)a3
{
  return (id)MEMORY[0x1E4F1CC38];
}

- (id)offValueForPreference:(id)a3
{
  return (id)MEMORY[0x1E4F1CC28];
}

- (WBSPerSitePreference)contentBlockersPreference
{
  return self->_contentBlockersPreference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentBlockersPreference, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesStore, 0);
}

@end