@interface WBSProfilePreferenceManager
- (BOOL)hasDynamicPreferenceValues;
- (BOOL)preferenceDoesNotHaveForOtherWebsitesDefault:(id)a3;
- (BOOL)shouldDeleteUnrecognizedPreference;
- (WBSPerSitePreference)profilePreference;
- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore;
- (WBSProfilePreferenceManager)init;
- (WBSProfilePreferenceManager)initWithPerSitePreferencesStore:(id)a3 profileProvider:(id)a4;
- (WBSProfileProviding)profileProvider;
- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3;
- (id)identifierForProfilePreferenceForDomain:(id)a3;
- (id)localizedStringForValue:(id)a3 inPreference:(id)a4;
- (id)preferenceNameForPreference:(id)a3;
- (id)preferences;
- (id)valuesForPreference:(id)a3;
- (void)didRemoveProfileWithIdentifier:(id)a3 hasMultipleProfiles:(BOOL)a4;
- (void)getProfilePreferenceValueForDomain:(id)a3 withTimeout:(double)a4 fallbackValue:(id)a5 usingBlock:(id)a6;
- (void)setProfilePreferenceValue:(id)a3 forDomain:(id)a4 completionHandler:(id)a5;
@end

@implementation WBSProfilePreferenceManager

- (WBSProfilePreferenceManager)init
{
  return 0;
}

- (WBSProfilePreferenceManager)initWithPerSitePreferencesStore:(id)a3 profileProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSProfilePreferenceManager;
  v9 = [(WBSProfilePreferenceManager *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_perSitePreferencesStore, a3);
    objc_storeStrong((id *)&v10->_profileProvider, a4);
    v11 = [[WBSPerSitePreference alloc] initWithIdentifier:@"ProfilePreference"];
    profilePreference = v10->_profilePreference;
    v10->_profilePreference = v11;

    [(WBSPerSitePreferenceManager *)v10 setStorageDelegate:v10];
    [(WBSPerSitePreferenceManager *)v10 setDefaultsDelegate:v10];
    v13 = v10;
  }

  return v10;
}

- (id)identifierForProfilePreferenceForDomain:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(WBSPerSitePreferenceManager *)self valueOfPreference:self->_profilePreference forDomain:v4];
    v6 = v5;
    if (v5 && ([v5 isEqualToString:@"MostRecentProfile"] & 1) == 0)
    {
      id v8 = [(WBSProfileProviding *)self->_profileProvider profileWithServerID:v6];
      id v7 = [v8 identifier];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)getProfilePreferenceValueForDomain:(id)a3 withTimeout:(double)a4 fallbackValue:(id)a5 usingBlock:(id)a6
{
  id v10 = a6;
  profilePreference = self->_profilePreference;
  id v12 = a3;
  v13 = +[WBSPerSitePreferenceTimeout timeoutWithInterval:a5 fallbackValue:a4];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __103__WBSProfilePreferenceManager_getProfilePreferenceValueForDomain_withTimeout_fallbackValue_usingBlock___block_invoke;
  v15[3] = &unk_1E5C8C748;
  id v16 = v10;
  id v14 = v10;
  [(WBSPerSitePreferenceManager *)self getValueOfPreference:profilePreference forDomain:v12 withTimeout:v13 usingBlock:v15];
}

uint64_t __103__WBSProfilePreferenceManager_getProfilePreferenceValueForDomain_withTimeout_fallbackValue_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setProfilePreferenceValue:(id)a3 forDomain:(id)a4 completionHandler:(id)a5
{
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = v8;
  if (v8 && ![v8 isEqualToString:@"MostRecentProfile"])
  {
    v11 = [(WBSProfileProviding *)self->_profileProvider profileWithServerID:v9];
    id v10 = [v11 title];
  }
  else
  {
    id v10 = _WBSLocalizedString();
  }

  return v10;
}

- (void)didRemoveProfileWithIdentifier:(id)a3 hasMultipleProfiles:(BOOL)a4
{
  id v6 = a3;
  id v7 = self->_profilePreference;
  id v8 = [MEMORY[0x1E4F1CA80] set];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__WBSProfilePreferenceManager_didRemoveProfileWithIdentifier_hasMultipleProfiles___block_invoke;
  v12[3] = &unk_1E5C9EF28;
  v12[4] = self;
  v13 = v7;
  BOOL v16 = a4;
  id v14 = v6;
  id v15 = v8;
  id v9 = v8;
  id v10 = v6;
  v11 = v7;
  [(WBSPerSitePreferenceManager *)self getAllDomainsConfiguredForPreference:v11 usingBlock:v12];
}

void __82__WBSProfilePreferenceManager_didRemoveProfileWithIdentifier_hasMultipleProfiles___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = [*(id *)(a1 + 32) valueOfPreference:*(void *)(a1 + 40) forDomain:v8];
        if (([v9 isEqualToString:*(void *)(a1 + 48)] & 1) != 0
          || !*(unsigned char *)(a1 + 64)
          && ([*(id *)(*(void *)(a1 + 32) + 40) defaultProfileIdentifier],
              id v10 = objc_claimAutoreleasedReturnValue(),
              int v11 = [v9 isEqualToString:v10],
              v10,
              v11))
        {
          [*(id *)(a1 + 56) addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  [*(id *)(a1 + 32) removePreferenceValuesForDomains:*(void *)(a1 + 56) fromPreference:*(void *)(a1 + 40) completionHandler:0];
}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_perSitePreferencesStore;
}

- (id)preferences
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_profilePreference;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)valuesForPreference:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(WBSProfilePreferenceManager *)self defaultPreferenceValueForPreferenceIfNotCustomized:a3];
  v10[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v6 = [(WBSProfileProviding *)self->_profileProvider profiles];
  id v7 = objc_msgSend(v6, "safari_mapObjectsUsingBlock:", &__block_literal_global_93);
  uint64_t v8 = [v5 arrayByAddingObjectsFromArray:v7];

  return v8;
}

uint64_t __51__WBSProfilePreferenceManager_valuesForPreference___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serverID];
}

- (id)preferenceNameForPreference:(id)a3
{
  return @"PerSitePreferencesProfile";
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  return @"MostRecentProfile";
}

- (BOOL)shouldDeleteUnrecognizedPreference
{
  return 0;
}

- (BOOL)hasDynamicPreferenceValues
{
  return 1;
}

- (BOOL)preferenceDoesNotHaveForOtherWebsitesDefault:(id)a3
{
  return 1;
}

- (WBSProfileProviding)profileProvider
{
  return self->_profileProvider;
}

- (WBSPerSitePreference)profilePreference
{
  return self->_profilePreference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profilePreference, 0);
  objc_storeStrong((id *)&self->_profileProvider, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesStore, 0);
}

@end