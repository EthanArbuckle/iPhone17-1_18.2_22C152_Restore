@interface SPClientSession
+ (void)initialize;
+ (void)retrieveFirstTimeExperienceTextWithReply:(id)a3;
- (BOOL)_setSearchDomains:(id)a3;
- (BOOL)infinitePatience;
- (NSArray)disabledBundleIds;
- (SPClientSession)init;
- (SPSearchQueryContext)currentQueryContext;
- (id)copyStaleSectionsForQuery:(id)a3;
- (id)queryTaskWithContext:(id)a3;
- (int64_t)contentFilters;
- (int64_t)maxUISuggestions;
- (void)activate;
- (void)deactivate;
- (void)finishRanking:(id)a3 blendingDuration:(double)a4 spotlightQueryIntent:(int)a5;
- (void)preheat;
- (void)setCurrentQueryContext:(id)a3;
- (void)setInfinitePatience:(BOOL)a3;
- (void)setLastSections:(id)a3 forQuery:(id)a4;
- (void)setMaxUISuggestions:(int64_t)a3;
@end

@implementation SPClientSession

void __33__SPClientSession_contentFilters__block_invoke(uint64_t a1)
{
  id v2 = (id)sCloudController;
  if ([v2 hasProperNetworkConditionsToPlayMedia])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 canShowCloudVideo] ^ 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 canShowCloudMusic] ^ 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (SPClientSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)SPClientSession;
  id v2 = [(SPClientSession *)&v7 init];
  if (v2)
  {
    dispatch_async((dispatch_queue_t)sUnBlockMainQueue, &__block_literal_global_193);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)siriSettingsDidChange, (CFStringRef)*MEMORY[0x263F28760], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, v2, (CFNotificationCallback)siriSettingsDidChange, @"AFOutputLanguageDidChangeDarwinNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    if (runningInSpotlight) {
      uint64_t v5 = -1;
    }
    v2->_maxUISuggestions = v5;
  }
  return v2;
}

void __29__SPClientSession_initialize__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F11D60] sharedCloudController];
  v1 = (void *)sCloudController;
  sCloudController = v0;

  id v2 = dispatch_get_global_queue(0, 0);
  dispatch_async(v2, &__block_literal_global_85);
}

+ (void)initialize
{
  id v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 bundleIdentifier];
  if ([v3 isEqualToString:*MEMORY[0x263F674E8]])
  {
    runningInSpotlight = 1;
  }
  else
  {
    v4 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v5 = [v4 bundleIdentifier];
    runningInSpotlight = [v5 isEqualToString:@"com.apple.Spotlight"];
  }
  sClientRankAndBlend = _os_feature_enabled_impl();
  v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v6 = dispatch_queue_create("unblock main queue", v8);
  objc_super v7 = (void *)sUnBlockMainQueue;
  sUnBlockMainQueue = (uint64_t)v6;

  dispatch_async((dispatch_queue_t)sUnBlockMainQueue, &__block_literal_global_1);
}

- (void)activate
{
  SSScreenTimeStatusClearCache();
  if (sClientRankAndBlend)
  {
    +[SPFederatedQueryTask activate];
  }
  else
  {
    v3 = [MEMORY[0x263F67498] sharedConnection];
    [v3 activate:&__block_literal_global_103];
  }
  id v5 = +[SPPARSession spotlightPARSession];
  v4 = [MEMORY[0x263F674A0] sharedManager];
  [v4 setParsecFeedbackListener:v5];

  self->_contentFilter = [(SPClientSession *)self contentFilters];
}

- (int64_t)contentFilters
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v3 = sUnBlockMainQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SPClientSession_contentFilters__block_invoke;
  block[3] = &unk_264C76F70;
  v10 = &v16;
  v11 = &v12;
  v9 = v2;
  v4 = v2;
  dispatch_async(v3, block);
  dispatch_time_t v5 = dispatch_time(0, 200000000);
  int64_t v6 = 0;
  if (!dispatch_group_wait(v4, v5)) {
    int64_t v6 = *((unsigned __int8 *)v13 + 24) | (2 * *((unsigned __int8 *)v17 + 24));
  }

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v6;
}

uint64_t __27__SPClientSession_activate__block_invoke()
{
  return 0;
}

- (void)setMaxUISuggestions:(int64_t)a3
{
  self->_maxUISuggestions = a3;
}

void __29__SPClientSession_initialize__block_invoke_2()
{
  uint64_t v0 = (void *)DCSSearchFoundationCopyResultsWithOptions();
}

- (id)queryTaskWithContext:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_time_t v5 = [v4 searchString];
  int64_t v6 = [v4 searchEntities];
  uint64_t v7 = [v6 count];

  if (!([v5 length] | v7))
  {
    v27 = 0;
    goto LABEL_38;
  }
  v8 = [v4 searchEntities];
  v9 = [v8 firstObject];

  v10 = (void *)MEMORY[0x263EFF980];
  v11 = SPDomains();
  uint64_t v12 = [v10 arrayWithArray:v11];

  if (([v4 allowInternet] & 1) == 0)
  {
    [v12 removeObject:&unk_26E9313A8];
    [v12 removeObject:&unk_26E9313C0];
  }
  if (([v9 isPhotosEntitySearch] & 1) != 0 || objc_msgSend(v9, "isContactEntitySearch"))
  {
    [v12 removeAllObjects];
    [v12 addObject:&unk_26E9313D8];
  }
  v46 = v12;
  [v4 setSearchDomains:v12];
  v13 = SPGetDisabledDomains();
  uint64_t v14 = [v13 allObjects];
  [v4 setDisabledDomains:v14];

  id v15 = v4;
  if (_os_feature_enabled_impl())
  {
    uint64_t v16 = SPLogForSPLogCategoryDefault();
    os_log_type_t v17 = 2 * (*MEMORY[0x263F67540] == 0);
    if (os_log_type_enabled(v16, v17))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235D0B000, v16, v17, "[ProtectedApps] on", buf, 2u);
    }
  }
  v47 = v5;
  uint64_t v18 = (void *)MEMORY[0x263EFF9C0];
  char v19 = MEMORY[0x237DF32B0](0);
  v20 = [v18 setWithSet:v19];

  v21 = (void *)MEMORY[0x263EFF9C0];
  v22 = MEMORY[0x237DF32A0]();
  v23 = [v21 setWithSet:v22];

  if ([v20 containsObject:@"com.apple.DocumentsApp"])
  {
    [v20 removeObject:@"com.apple.DocumentsApp"];
    [v20 addObject:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];
    [v20 addObject:@"com.apple.CloudDocs.iCloudDriveFileProvider"];
    [v20 addObject:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"];
    [v20 addObject:@"com.apple.FileProvider.LocalStorage"];
    v24 = SPLogForSPLogCategoryDefault();
    os_log_type_t v25 = 2 * (*MEMORY[0x263F67540] == 0);
    if (os_log_type_enabled(v24, v25))
    {
      *(_WORD *)buf = 0;
      v26 = "[ProtectedApps] Files app disabled";
LABEL_17:
      _os_log_impl(&dword_235D0B000, v24, v25, v26, buf, 2u);
    }
  }
  else
  {
    [v20 removeObject:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];
    [v20 removeObject:@"com.apple.CloudDocs.iCloudDriveFileProvider"];
    [v20 removeObject:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"];
    [v20 removeObject:@"com.apple.FileProvider.LocalStorage"];
    v24 = SPLogForSPLogCategoryDefault();
    os_log_type_t v25 = 2 * (*MEMORY[0x263F67540] == 0);
    if (os_log_type_enabled(v24, v25))
    {
      *(_WORD *)buf = 0;
      v26 = "[ProtectedApps] Files app enabled";
      goto LABEL_17;
    }
  }

  [v20 addObject:*MEMORY[0x263F78F40]];
  uint64_t v28 = [v20 allObjects];
  v29 = (void *)v28;
  uint64_t v30 = MEMORY[0x263EFFA68];
  if (v28) {
    uint64_t v31 = v28;
  }
  else {
    uint64_t v31 = MEMORY[0x263EFFA68];
  }
  [v15 setDisabledBundles:v31];

  uint64_t v32 = [v23 allObjects];
  v33 = (void *)v32;
  if (v32) {
    uint64_t v34 = v32;
  }
  else {
    uint64_t v34 = v30;
  }
  [v15 setDisabledApps:v34];

  v35 = SPLogForSPLogCategoryDefault();
  os_log_type_t v36 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v35, v36))
  {
    v37 = [v15 disabledBundles];
    *(_DWORD *)buf = 138412290;
    v49 = v37;
    _os_log_impl(&dword_235D0B000, v35, v36, "[ProtectedApps] Disabled bundles in query context: %@", buf, 0xCu);
  }
  v38 = SPLogForSPLogCategoryDefault();
  os_log_type_t v39 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v38, v39))
  {
    v40 = [v15 disabledApps];
    *(_DWORD *)buf = 138412290;
    v49 = v40;
    _os_log_impl(&dword_235D0B000, v38, v39, "[ProtectedApps] Disabled apps in query context: %@", buf, 0xCu);
  }
  if (v7)
  {
    if (([v9 isAppEntitySearch] & 1) != 0
      || ([v9 isPhotosEntitySearch] & 1) != 0
      || [v9 isContactEntitySearch])
    {
      uint64_t v41 = 50;
    }
    else
    {
      uint64_t v41 = 13;
    }
  }
  else
  {
    uint64_t v41 = 13;
  }
  v42 = (void *)[objc_alloc(MEMORY[0x263F674C0]) initWithSearchQueryContext:v15];
  [v42 setMaxCount:v41];
  [v42 setGrouped:1];
  [v42 setContentFilters:self->_contentFilter];
  [v42 setInfinitePatience:self->_infinitePatience];
  if (sClientRankAndBlend) {
    v43 = &off_264C76308;
  }
  else {
    v43 = off_264C76318;
  }
  v27 = (void *)[objc_alloc(*v43) initForSession:self withQuery:v42];
  objc_msgSend(v27, "setWhyQuery:", objc_msgSend(v15, "whyQuery"));
  objc_msgSend(v27, "setQueryKind:", objc_msgSend(v15, "queryKind"));
  objc_msgSend(v27, "setMaxUISuggestions:", -[SPClientSession maxUISuggestions](self, "maxUISuggestions"));
  v44 = [(SPClientSession *)self currentQueryContext];
  [v27 setPreviousQueryContext:v44];

  [(SPClientSession *)self setCurrentQueryContext:v15];
  dispatch_time_t v5 = v47;
LABEL_38:

  return v27;
}

- (void)setLastSections:(id)a3 forQuery:(id)a4
{
  int64_t v6 = (SPSearchQuery *)a4;
  uint64_t v7 = (NSArray *)[a3 copy];
  os_unfair_lock_lock(&self->_sectionsLock);
  lastSections = self->_lastSections;
  self->_lastSections = v7;
  v9 = v7;

  lastQuery = self->_lastQuery;
  self->_lastQuery = v6;

  os_unfair_lock_unlock(&self->_sectionsLock);
}

- (id)copyStaleSectionsForQuery:(id)a3
{
  id v4 = a3;
  p_sectionsLock = &self->_sectionsLock;
  os_unfair_lock_lock(&self->_sectionsLock);
  int64_t v6 = self->_lastSections;
  uint64_t v7 = self->_lastQuery;
  os_unfair_lock_unlock(p_sectionsLock);
  if (v4 && [(SPSearchQuery *)v7 plausiblyMatchesQuery:v4]) {
    v8 = v6;
  }
  else {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_setSearchDomains:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = (NSArray *)a3;
  dispatch_time_t v5 = SPLogForSPLogCategoryDefault();
  int64_t v6 = (unsigned char *)MEMORY[0x263F67548];
  os_log_type_t v7 = *MEMORY[0x263F67548] ^ 1;
  if (os_log_type_enabled(v5, v7))
  {
    int v20 = 138412290;
    v21 = v4;
    _os_log_impl(&dword_235D0B000, v5, v7, "Setting search domains %@", (uint8_t *)&v20, 0xCu);
  }

  v8 = (void *)[(NSArray *)self->_searchDomains copy];
  if (v4)
  {
    v9 = v4;
    p_super = &self->_searchDomains->super;
    self->_searchDomains = v9;
  }
  else
  {
    SPDomains();
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    searchDomains = self->_searchDomains;
    self->_searchDomains = v11;

    if (!self->_observersAdded)
    {
      self->_observersAdded = 1;
      notify_register_check("com.apple.spotlightui.prefschanged", &self->_prefsToken);
      int v20 = 0;
      notify_check(self->_prefsToken, &v20);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_SpotlightInternetDomainsChangedCallback, (CFStringRef)*MEMORY[0x263F67550], 0, CFNotificationSuspensionBehaviorDrop);
    }
    SPDomains();
    uint64_t v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    id v15 = self->_searchDomains;
    self->_searchDomains = v14;

    p_super = SPLogForSPLogCategoryDefault();
    os_log_type_t v16 = *v6 ^ 1;
    if (os_log_type_enabled(p_super, v16))
    {
      os_log_type_t v17 = self->_searchDomains;
      int v20 = 138412290;
      v21 = v17;
      _os_log_impl(&dword_235D0B000, p_super, v16, "Setting search domains to %@", (uint8_t *)&v20, 0xCu);
    }
  }

  char v18 = [(NSArray *)self->_searchDomains isEqual:v8];
  return v18 ^ 1;
}

- (NSArray)disabledBundleIds
{
  if (self->_observersAdded)
  {
    int check = 0;
    notify_check(self->_prefsToken, &check);
    if (check) {
      [(SPClientSession *)self _setSearchDomains:0];
    }
  }
  v3 = MEMORY[0x237DF32B0](0, a2);
  id v4 = [v3 allObjects];

  return (NSArray *)v4;
}

- (void)preheat
{
  if (sClientRankAndBlend)
  {
    +[SPFederatedQueryTask preheat];
  }
  else
  {
    id v2 = [MEMORY[0x263F67498] sharedConnection];
    [v2 preheat];
  }
}

- (void)deactivate
{
  if (sClientRankAndBlend)
  {
    +[SPFederatedQueryTask deactivate];
  }
  else
  {
    id v2 = [MEMORY[0x263F67498] sharedConnection];
    [v2 deactivate];
  }
}

- (void)finishRanking:(id)a3 blendingDuration:(double)a4 spotlightQueryIntent:(int)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v29 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v6;
  uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v38;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v38 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v7;
        v8 = *(void **)(*((void *)&v37 + 1) + 8 * v7);
        v9 = objc_opt_new();
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v31 = v8;
        v10 = [v8 results];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v34;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v34 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v33 + 1) + 8 * v14);
              if (objc_opt_respondsToSelector())
              {
                os_log_type_t v16 = [v15 duplicatedItems];
                os_log_type_t v17 = objc_msgSend(v16, "sp_copyForFeedback");
              }
              else
              {
                os_log_type_t v17 = 0;
              }
              id v18 = objc_alloc(MEMORY[0x263F679D8]);
              char v19 = [v15 objectForFeedback];
              int v20 = (void *)[v18 initWithResult:v19 hiddenResults:0 duplicateResults:v17 localResultPosition:0];

              [v9 addObject:v20];
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v12);
        }

        id v21 = objc_alloc(MEMORY[0x263F67A40]);
        uint64_t v22 = [v31 objectForFeedback];
        v23 = (void *)[v21 initWithResults:v9 section:v22 localSectionPosition:0 personalizationScore:0.0];

        [v29 addObject:v23];
        uint64_t v7 = v32 + 1;
      }
      while (v32 + 1 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v30);
  }

  v24 = (void *)[objc_alloc(MEMORY[0x263F679B8]) initWithSections:v29 blendingDuration:a4];
  if (objc_opt_respondsToSelector()) {
    [v24 setSpotlightQueryIntent:a5];
  }
  os_log_type_t v25 = [MEMORY[0x263F674A0] sharedManager];
  [v25 didRankSections:v24];
}

+ (void)retrieveFirstTimeExperienceTextWithReply:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (sClientRankAndBlend)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60__SPClientSession_retrieveFirstTimeExperienceTextWithReply___block_invoke;
    v6[3] = &unk_264C76FC0;
    id v7 = v3;
    +[SPParsecQuery getFTEStringsWithReply:v6];
  }
  else
  {
    dispatch_time_t v5 = [MEMORY[0x263F67498] sharedConnection];
    [v5 retrieveFirstTimeExperienceTextWithReply:v4];
  }
}

void __60__SPClientSession_retrieveFirstTimeExperienceTextWithReply___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = +[SPQueryTask queryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__SPClientSession_retrieveFirstTimeExperienceTextWithReply___block_invoke_2;
  block[3] = &unk_264C76F98;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = *(id *)(a1 + 32);
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  dispatch_async(v13, block);
}

void __60__SPClientSession_retrieveFirstTimeExperienceTextWithReply___block_invoke_2(uint64_t a1)
{
  v12[4] = *MEMORY[0x263EF8340];
  v11[0] = @"FTE_STRING";
  if ([*(id *)(a1 + 32) length]) {
    id v2 = *(__CFString **)(a1 + 32);
  }
  else {
    id v2 = &stru_26E92AFF0;
  }
  v12[0] = v2;
  v11[1] = @"FTE_LEARN_MORE_LINK";
  if ([*(id *)(a1 + 40) length]) {
    id v3 = *(__CFString **)(a1 + 40);
  }
  else {
    id v3 = &stru_26E92AFF0;
  }
  v12[1] = v3;
  v11[2] = @"FTE_CONTINUE_LINK";
  if ([*(id *)(a1 + 48) length]) {
    id v4 = *(__CFString **)(a1 + 48);
  }
  else {
    id v4 = &stru_26E92AFF0;
  }
  v11[3] = @"FTE_DOMAINS";
  uint64_t v5 = *(void *)(a1 + 56);
  if (!v5) {
    uint64_t v5 = MEMORY[0x263EFFA68];
  }
  v12[2] = v4;
  v12[3] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  id v7 = SPLogForSPLogCategoryDefault();
  os_log_type_t v8 = *MEMORY[0x263F67548] ^ 1;
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_235D0B000, v7, v8, "[FTE] Received FTE dictionary in client: %@", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (BOOL)infinitePatience
{
  return self->_infinitePatience;
}

- (void)setInfinitePatience:(BOOL)a3
{
  self->_infinitePatience = a3;
}

- (int64_t)maxUISuggestions
{
  return self->_maxUISuggestions;
}

- (SPSearchQueryContext)currentQueryContext
{
  return (SPSearchQueryContext *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCurrentQueryContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentQueryContext, 0);
  objc_storeStrong((id *)&self->_lastQuery, 0);
  objc_storeStrong((id *)&self->_lastSections, 0);
  objc_storeStrong((id *)&self->_searchDomains, 0);
}

@end