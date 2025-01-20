@interface WLKFeatureEnablement
+ (id)_canvasFeatureFlags;
+ (id)_utsFeatureFlags;
+ (id)tvAppEnabledFeatures;
@end

@implementation WLKFeatureEnablement

+ (id)tvAppEnabledFeatures
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__WLKFeatureEnablement_tvAppEnabledFeatures__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (tvAppEnabledFeatures_onceToken != -1) {
    dispatch_once(&tvAppEnabledFeatures_onceToken, block);
  }
  v2 = (void *)tvAppEnabledFeatures_appFeatures;

  return v2;
}

+ (id)_utsFeatureFlags
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = objc_alloc_init(WLKFeature);
  [(WLKFeature *)v3 setName:@"catch_up_to_live"];
  [(WLKFeature *)v3 setDomain:@"TVApp"];
  [(WLKFeature *)v3 setEnabled:1];
  [v2 addObject:v3];
  if (_os_feature_enabled_impl())
  {
    v4 = objc_alloc_init(WLKFeature);
    [(WLKFeature *)v4 setName:@"capella_preview"];
    [(WLKFeature *)v4 setDomain:@"TVApp"];
    [(WLKFeature *)v4 setEnabled:1];
    [v2 addObject:v4];
  }
  if (_os_feature_enabled_impl())
  {
    v5 = objc_alloc_init(WLKFeature);
    [(WLKFeature *)v5 setName:@"testarossa"];
    [(WLKFeature *)v5 setDomain:@"TVApp"];
    [(WLKFeature *)v5 setEnabled:1];
    [v2 addObject:v5];
  }

  return v2;
}

void __44__WLKFeatureEnablement_tvAppEnabledFeatures__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = objc_alloc_init(WLKFeature);
  [(WLKFeature *)v3 setName:@"expanse"];
  [(WLKFeature *)v3 setDomain:@"TVApp"];
  [(WLKFeature *)v3 setEnabled:1];
  v25 = v3;
  [v2 addObject:v3];
  v4 = objc_alloc_init(WLKFeature);
  [(WLKFeature *)v4 setName:@"syndication"];
  [(WLKFeature *)v4 setDomain:@"TVApp"];
  [(WLKFeature *)v4 setEnabled:1];
  v24 = v4;
  [v2 addObject:v4];
  v5 = [*(id *)(a1 + 32) _utsFeatureFlags];
  [v2 addObjectsFromArray:v5];

  v6 = [*(id *)(a1 + 32) _canvasFeatureFlags];
  [v2 addObjectsFromArray:v6];

  v7 = objc_alloc_init(WLKFeature);
  [(WLKFeature *)v7 setName:@"teatro"];
  [(WLKFeature *)v7 setDomain:@"TVApp"];
  [(WLKFeature *)v7 setEnabled:1];
  [v2 addObject:v7];

  v8 = objc_alloc_init(WLKFeature);
  [(WLKFeature *)v8 setName:@"aether"];
  [(WLKFeature *)v8 setDomain:@"TVApp"];
  [(WLKFeature *)v8 setEnabled:1];
  [v2 addObject:v8];

  if (_os_feature_enabled_impl())
  {
    v9 = objc_alloc_init(WLKFeature);
    [(WLKFeature *)v9 setName:@"fromm"];
    [(WLKFeature *)v9 setDomain:@"TVApp"];
    [(WLKFeature *)v9 setEnabled:1];
    [v2 addObject:v9];
  }
  if (_os_feature_enabled_impl())
  {
    v10 = objc_alloc_init(WLKFeature);
    [(WLKFeature *)v10 setName:@"FederatedV2"];
    [(WLKFeature *)v10 setDomain:@"TVApp"];
    [(WLKFeature *)v10 setEnabled:1];
    [v2 addObject:v10];
  }
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.WatchListKit"];
  v12 = [v11 objectForKey:@"FeatureEnablementAdditionalFlags"];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * v16);
        v18 = objc_alloc_init(WLKFeature);
        [(WLKFeature *)v18 setName:v17];
        [(WLKFeature *)v18 setDomain:@"TVApp"];
        [(WLKFeature *)v18 setEnabled:1];
        [v2 addObject:v18];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v14);
  }
  v19 = [v2 allObjects];
  v20 = [v19 sortedArrayUsingSelector:sel_compare_];
  uint64_t v21 = [v20 copy];
  v22 = (void *)tvAppEnabledFeatures_appFeatures;
  tvAppEnabledFeatures_appFeatures = v21;

  v23 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v31 = tvAppEnabledFeatures_appFeatures;
    _os_log_impl(&dword_1BA2E8000, v23, OS_LOG_TYPE_DEFAULT, "Enabled features: %@", buf, 0xCu);
  }
}

+ (id)_canvasFeatureFlags
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (_os_feature_enabled_impl())
  {
    v3 = objc_alloc_init(WLKFeature);
    [(WLKFeature *)v3 setName:@"tahoma_keynote"];
    [(WLKFeature *)v3 setDomain:@"TVApp"];
    [(WLKFeature *)v3 setEnabled:1];
    [v2 addObject:v3];
  }

  return v2;
}

@end