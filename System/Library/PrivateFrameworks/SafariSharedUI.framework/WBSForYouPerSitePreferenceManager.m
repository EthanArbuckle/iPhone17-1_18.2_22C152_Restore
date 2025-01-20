@interface WBSForYouPerSitePreferenceManager
- (WBSForYouPerSitePreferenceManager)init;
- (WBSForYouPerSitePreferenceManager)initWithPerSitePreferencesStore:(id)a3;
- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore;
- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3;
- (id)localizedStringForValue:(id)a3 inPreference:(id)a4;
- (id)preferenceNameForPreference:(id)a3;
- (id)preferences;
- (id)valuesForPreference:(id)a3;
- (void)allowedForYouRecommendationsFromRecommendations:(id)a3 completionHandler:(id)a4;
- (void)setPreferenceValue:(int64_t)a3 forURL:(id)a4 completionHandler:(id)a5;
@end

@implementation WBSForYouPerSitePreferenceManager

- (WBSForYouPerSitePreferenceManager)init
{
  return 0;
}

- (WBSForYouPerSitePreferenceManager)initWithPerSitePreferencesStore:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WBSForYouPerSitePreferenceManager;
  v6 = [(WBSForYouPerSitePreferenceManager *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_preferencesStore, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F98378]);
    uint64_t v9 = [v8 initWithIdentifier:*MEMORY[0x1E4F98600]];
    preference = v7->_preference;
    v7->_preference = (WBSPerSitePreference *)v9;

    [(WBSPerSitePreferenceManager *)v7 setStorageDelegate:v7];
    [(WBSPerSitePreferenceManager *)v7 setDefaultsDelegate:v7];
    v11 = v7;
  }

  return v7;
}

- (void)allowedForYouRecommendationsFromRecommendations:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = (void *)[a3 copy];
  preferencesStore = self->_preferencesStore;
  uint64_t v9 = *MEMORY[0x1E4F98740];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103__WBSForYouPerSitePreferenceManager_allowedForYouRecommendationsFromRecommendations_completionHandler___block_invoke;
  v12[3] = &unk_1E5E42910;
  id v13 = v7;
  id v14 = v6;
  id v10 = v7;
  id v11 = v6;
  [(WBSPerSitePreferencesSQLiteStore *)preferencesStore getAllDomainsConfiguredForPreference:v9 completionHandler:v12];
}

void __103__WBSForYouPerSitePreferenceManager_allowedForYouRecommendationsFromRecommendations_completionHandler___block_invoke(uint64_t a1, void *a2, char a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v13 = objc_msgSend(v12, "pageURL", (void)v15);
          id v14 = objc_msgSend(v13, "safari_userVisibleHostWithoutWWWSubdomain");

          if ([v14 length] && (objc_msgSend(v5, "containsObject:", v14) & 1) == 0) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)setPreferenceValue:(int64_t)a3 forURL:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = NSNumber;
  id v9 = a5;
  id v10 = a4;
  id v13 = [v8 numberWithInteger:a3];
  preference = self->_preference;
  v12 = objc_msgSend(v10, "safari_userVisibleHostWithoutWWWSubdomain");

  [(WBSPerSitePreferenceManager *)self setValue:v13 ofPreference:preference forDomain:v12 completionHandler:v9];
}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_preferencesStore;
}

- (id)preferences
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_preference;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)valuesForPreference:(id)a3
{
  return &unk_1F0341AC8;
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  return &stru_1F031A860;
}

- (id)preferenceNameForPreference:(id)a3
{
  return (id)*MEMORY[0x1E4F98740];
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  return &unk_1F0341448;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preference, 0);
  objc_storeStrong((id *)&self->_preferencesStore, 0);
}

@end