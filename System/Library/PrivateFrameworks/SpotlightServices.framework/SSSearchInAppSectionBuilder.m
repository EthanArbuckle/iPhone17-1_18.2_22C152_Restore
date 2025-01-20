@interface SSSearchInAppSectionBuilder
+ (id)cachedPreferredStoreBundleIdentifier;
+ (id)supportedBundleId;
+ (void)updateCachedPreferredStoreBundleID;
- (BOOL)shouldSkipSection;
- (NSArray)searchInAppInfo;
- (NSSet)bundleIdentifiersForHiddenSections;
- (id)buildSection;
- (void)setBundleIdentifiersForHiddenSections:(id)a3;
- (void)setSearchInAppInfo:(id)a3;
@end

@implementation SSSearchInAppSectionBuilder

+ (id)supportedBundleId
{
  if (isMacOS())
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___SSSearchInAppSectionBuilder;
    objc_msgSendSuper2(&v5, sel_supportedBundleId);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = @"com.apple.searchd.searchThroughSuggestions";
  }
  return v3;
}

- (id)buildSection
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if ([(SSSearchInAppSectionBuilder *)self shouldSkipSection])
  {
    v3 = 0;
  }
  else
  {
    v4 = objc_opt_new();
    objc_super v5 = [(SSSearchInAppSectionBuilder *)self bundleIdentifiersForHiddenSections];
    v6 = [(SSSearchInAppSectionBuilder *)self searchInAppInfo];
    v7 = (void *)[v6 mutableCopy];
    v8 = v7;
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = (id)objc_opt_new();
    }
    v10 = v9;

    v11 = [(SSSectionBuilder *)self queryContext];
    uint64_t v12 = [v11 searchString];

    if ([v10 count])
    {
      unint64_t v13 = 0;
      do
      {
        if ((unint64_t)[v4 count] >= 4) {
          break;
        }
        v14 = [v10 objectAtIndexedSubscript:v13];
        unint64_t v15 = v13 + 1;
        v16 = [v10 objectAtIndexedSubscript:v15];
        if ([v5 containsObject:v14]
          && (SSScreenTimeStatusForBundleIDWithCompletionHandler(v14, 0) & 1) == 0)
        {
          v17 = +[SSSearchInAppResultBuilder buildResultWithAppName:v16 appBundleId:v14 searchString:v12 searchInAppType:0];
          [v4 addObject:v17];
        }
        unint64_t v13 = v15 + 1;
      }
      while ([v10 count] > v13);
    }
    v18 = [(id)objc_opt_class() cachedPreferredStoreBundleIdentifier];
    v19 = v18;
    if (v18 && (SSScreenTimeStatusForBundleIDWithCompletionHandler(v18, 0) & 1) == 0)
    {
      v20 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v19 allowPlaceholder:1 error:0];
      v21 = [v20 localizedName];

      v22 = +[SSSearchInAppResultBuilder buildResultWithAppName:appBundleId:searchString:searchInAppType:](SSSearchInAppResultBuilder, "buildResultWithAppName:appBundleId:searchString:searchInAppType:", v21, v19, v12, [v19 isEqual:@"com.apple.AppStore"] ^ 1);
      [v4 addObject:v22];
    }
    v37 = (void *)v12;
    if (buildSection_onceToken != -1) {
      dispatch_once(&buildSection_onceToken, &__block_literal_global_2);
    }
    v36 = v19;
    if (buildSection_localizedMapsName
      && (SSScreenTimeStatusForBundleIDWithCompletionHandler(@"com.apple.Maps", 0) & 1) == 0)
    {
      v23 = +[SSSearchInAppResultBuilder buildResultWithAppName:buildSection_localizedMapsName, @"com.apple.Maps", v12, 0, v19 appBundleId searchString searchInAppType];
      [v4 addObject:v23];
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v24 = v4;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v39 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          v30 = [(SSSectionBuilder *)self queryContext];
          objc_msgSend(v29, "setQueryId:", objc_msgSend(v30, "queryIdent"));

          [v29 setSectionBundleIdentifier:@"com.apple.searchd.searchThroughSuggestions"];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v26);
    }

    if ([v24 count])
    {
      v3 = objc_opt_new();
      v31 = [MEMORY[0x1E4F29128] UUID];
      v32 = [v31 UUIDString];
      [v3 setIdentifier:v32];

      [v3 setBundleIdentifier:@"com.apple.searchd.searchThroughSuggestions"];
      [v3 setResults:v24];
      v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v34 = [v33 localizedStringForKey:@"FOUND_IN_APPS" value:&stru_1F1824018 table:@"SpotlightServices"];
      [v3 setTitle:v34];
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

void __43__SSSearchInAppSectionBuilder_buildSection__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.Maps" allowPlaceholder:1 error:0];
  uint64_t v0 = [v2 localizedName];
  v1 = (void *)buildSection_localizedMapsName;
  buildSection_localizedMapsName = v0;
}

+ (id)cachedPreferredStoreBundleIdentifier
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = (id)s_cachedPreferredStoreBundleID;
  objc_sync_exit(v2);

  if (!v3) {
    [v2 updateCachedPreferredStoreBundleID];
  }
  return v3;
}

+ (void)updateCachedPreferredStoreBundleID
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SSSearchInAppSectionBuilder_updateCachedPreferredStoreBundleID__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (updateCachedPreferredStoreBundleID_onceToken != -1) {
    dispatch_once(&updateCachedPreferredStoreBundleID_onceToken, block);
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__SSSearchInAppSectionBuilder_updateCachedPreferredStoreBundleID__block_invoke_3;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a1;
  dispatch_async((dispatch_queue_t)updateCachedPreferredStoreBundleID_queue, v3);
}

void __65__SSSearchInAppSectionBuilder_updateCachedPreferredStoreBundleID__block_invoke(uint64_t a1)
{
  id v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v3 = dispatch_queue_create("SSMarketplaceKitUtilities fetching queue", v2);
  v4 = (void *)updateCachedPreferredStoreBundleID_queue;
  updateCachedPreferredStoreBundleID_queue = (uint64_t)v3;

  objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6 = +[SSMarketplaceKitUtilities distributorPriorityListChangedNotifationName];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__SSSearchInAppSectionBuilder_updateCachedPreferredStoreBundleID__block_invoke_2;
  v8[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
  v8[4] = *(void *)(a1 + 32);
  id v7 = (id)[v5 addObserverForName:v6 object:0 queue:0 usingBlock:v8];
}

uint64_t __65__SSSearchInAppSectionBuilder_updateCachedPreferredStoreBundleID__block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  dispatch_queue_t v3 = (void *)s_cachedPreferredStoreBundleID;
  s_cachedPreferredStoreBundleID = 0;

  objc_sync_exit(v2);
  v4 = *(void **)(a1 + 32);
  return [v4 updateCachedPreferredStoreBundleID];
}

void __65__SSSearchInAppSectionBuilder_updateCachedPreferredStoreBundleID__block_invoke_3(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = s_cachedPreferredStoreBundleID;
  objc_sync_exit(v2);

  if (!v3)
  {
    v4 = +[SSMarketplaceKitUtilities distributorPriorityList];
    objc_super v5 = [v4 firstObject];

    id v6 = *(id *)(a1 + 32);
    objc_sync_enter(v6);
    id v7 = (void *)s_cachedPreferredStoreBundleID;
    s_cachedPreferredStoreBundleID = (uint64_t)v5;
    id v8 = v5;

    objc_sync_exit(v6);
  }
}

- (BOOL)shouldSkipSection
{
  uint64_t v3 = [(SSSectionBuilder *)self queryContext];
  v4 = [v3 searchEntities];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    id v6 = SSDefaultsGetResources();
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9fb9d89e-6213-484c-9123-fbe1626207a7"];
    id v8 = [(SSSectionBuilder *)self queryContext];
    objc_msgSend(v6, "logForTrigger:queryID:", v7, objc_msgSend(v8, "queryIdent"));
  }
  int v9 = SSShowSearchInApps() ^ 1;
  if (v5) {
    return 1;
  }
  else {
    return v9;
  }
}

- (NSSet)bundleIdentifiersForHiddenSections
{
  return self->_bundleIdentifiersForHiddenSections;
}

- (void)setBundleIdentifiersForHiddenSections:(id)a3
{
}

- (NSArray)searchInAppInfo
{
  return self->_searchInAppInfo;
}

- (void)setSearchInAppInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchInAppInfo, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiersForHiddenSections, 0);
}

@end