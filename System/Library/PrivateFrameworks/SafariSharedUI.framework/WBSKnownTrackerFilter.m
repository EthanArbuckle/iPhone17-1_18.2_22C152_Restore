@interface WBSKnownTrackerFilter
- (id)_createKnownTrackersDictionary;
- (void)_createKnownTrackersDictionary;
- (void)getKnownTrackersFromHighLevelDomains:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSKnownTrackerFilter

- (void)getKnownTrackersFromHighLevelDomains:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (SharedWebCredentialsLibraryCore())
  {
    get_SWCTrackingDomainInfoClass();
    char v8 = objc_opt_respondsToSelector();
    id SWCTrackingDomainInfoClass = get_SWCTrackingDomainInfoClass();
    v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    if (v8)
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __80__WBSKnownTrackerFilter_getKnownTrackersFromHighLevelDomains_completionHandler___block_invoke;
      v30[3] = &unk_1E5E431A8;
      id v31 = v7;
      [SWCTrackingDomainInfoClass getTrackingDomainInfoWithDomains:v10 sources:1 completion:v30];
    }
    else
    {
      v21 = [SWCTrackingDomainInfoClass trackingDomainInfoWithDomains:v10];

      v22 = objc_msgSend(v21, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_11);
      (*((void (**)(id, void *))v7 + 2))(v7, v22);
    }
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__WBSKnownTrackerFilter_getKnownTrackersFromHighLevelDomains_completionHandler___block_invoke_4;
    block[3] = &unk_1E5E40968;
    block[4] = self;
    v23 = (void (**)(void, void *))v7;
    if (getKnownTrackersFromHighLevelDomains_completionHandler__onceToken != -1) {
      dispatch_once(&getKnownTrackersFromHighLevelDomains_completionHandler__onceToken, block);
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v24 = v6;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend((id)getKnownTrackersFromHighLevelDomains_completionHandler__knownTrackers, "objectForKeyedSubscript:", v17, v23);
          v19 = (void *)v18;
          if (v18)
          {
            v32 = @"OwnerName";
            uint64_t v33 = v18;
            v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
            [v11 setObject:v20 forKeyedSubscript:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v14);
    }

    id v7 = v23;
    v23[2](v23, v11);

    id v6 = v24;
  }
}

void __80__WBSKnownTrackerFilter_getKnownTrackersFromHighLevelDomains_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_msgSend(a2, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_22);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

id __80__WBSKnownTrackerFilter_getKnownTrackersFromHighLevelDomains_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"OwnerName";
  id v3 = [a3 ownerDisplayName];
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

id __80__WBSKnownTrackerFilter_getKnownTrackersFromHighLevelDomains_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 source] == 1)
  {
    id v7 = @"OwnerName";
    v4 = [v3 ownerDisplayName];
    v8[0] = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __80__WBSKnownTrackerFilter_getKnownTrackersFromHighLevelDomains_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _createKnownTrackersDictionary];
  uint64_t v2 = (void *)getKnownTrackersFromHighLevelDomains_completionHandler__knownTrackers;
  getKnownTrackersFromHighLevelDomains_completionHandler__knownTrackers = v1;
}

- (id)_createKnownTrackersDictionary
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariSharedBundle");
  id v3 = [v2 URLForResource:@"WBSDuckDuckGoTDS" withExtension:@"json"];

  id v12 = 0;
  v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3 options:0 error:&v12];
  id v5 = v12;
  id v11 = v5;
  id v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v11];
  id v7 = v11;

  if (v7)
  {
    char v8 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(WBSKnownTrackerFilter *)v8 _createKnownTrackersDictionary];
    }
    v9 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v9 = objc_msgSend(v6, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_22_0);
  }

  return v9;
}

uint64_t __55__WBSKnownTrackerFilter__createKnownTrackersDictionary__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 objectForKeyedSubscript:@"d"];
}

- (void)_createKnownTrackersDictionary
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Unable to read known tracker data %{public}@", (uint8_t *)&v5, 0xCu);
}

@end