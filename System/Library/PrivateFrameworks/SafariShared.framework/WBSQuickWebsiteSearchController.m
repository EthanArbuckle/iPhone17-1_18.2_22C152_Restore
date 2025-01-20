@interface WBSQuickWebsiteSearchController
+ (id)sharedController;
- (BOOL)_quickWebsiteSearchProviderHasSearchURLTemplateStringOnAccessQueue:(id)a3;
- (BOOL)_shouldRemoveQuickWebsiteSearchProvider:(id)a3;
- (BOOL)quickWebsiteSearchProvidersLoadedFromDisk;
- (NSArray)quickWebsiteSearchHosts;
- (id)_dictionaryRepresentation;
- (id)_initWithSearchDescriptionsURL:(id)a3;
- (id)openSearchDescriptionForOpenSearchDescriptionURLString:(id)a3;
- (id)providerForSourcePageURLString:(id)a3;
- (id)providersMatchingQueryString:(id)a3 excludingSearchEngineHostSuffixes:(id)a4;
- (id)providersMatchingString:(id)a3 excludingSearchEngineHostSuffixes:(id)a4;
- (id)quickWebsiteSearchProvider:(id)a3 openSearchDescriptionForOpenSearchDescriptionURLString:(id)a4;
- (void)_addHost:(id)a3 toOpenSearchDescriptionWithDocumentURL:(id)a4;
- (void)_didCollectOpenSearchDescription:(id)a3;
- (void)_didFinishLoadingFromDisk;
- (void)_loadFromDisk;
- (void)_pruneUnusedQuickWebsiteSearchProviders;
- (void)_removeHost:(id)a3 fromOpenSearchDescriptionWithDocumentURL:(id)a4;
- (void)_resetCachedDataWithCompletionHandler:(id)a3;
- (void)_saveToDiskSoon;
- (void)_sendNotification:(id)a3 forQuickWebsiteSearchProvider:(id)a4;
- (void)beginLoadingFromDiskIfNeeded;
- (void)clearWithCompletionHandler:(id)a3;
- (void)didPerformSearchWithProvider:(id)a3;
- (void)noteProvidersAreStale;
- (void)removeProviderWithHost:(id)a3;
- (void)removeProvidersAddedAfterDate:(id)a3 beforeDate:(id)a4;
- (void)removeProvidersWithHosts:(id)a3 completionHandler:(id)a4;
- (void)savePendingChangesBeforeTermination;
- (void)savePendingChangesNowWithCompletionHandler:(id)a3;
- (void)setOpenSearchDescriptionURLString:(id)a3 forSourcePageURLString:(id)a4;
- (void)setQuickWebsiteSearchProvidersLoadedFromDisk:(BOOL)a3;
- (void)setSearchURLTemplateFromForm:(id)a3 forSourcePageURLString:(id)a4 completionHandler:(id)a5;
@end

@implementation WBSQuickWebsiteSearchController

+ (id)sharedController
{
  if (+[WBSQuickWebsiteSearchController sharedController]::onceToken != -1) {
    dispatch_once(&+[WBSQuickWebsiteSearchController sharedController]::onceToken, &__block_literal_global_94);
  }
  v2 = (void *)+[WBSQuickWebsiteSearchController sharedController]::controller;
  return v2;
}

void __51__WBSQuickWebsiteSearchController_sharedController__block_invoke()
{
  v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  v1 = objc_msgSend(v0, "safari_settingsDirectoryURL");
  id v4 = [v1 URLByAppendingPathComponent:@"SearchDescriptions.plist" isDirectory:0];

  id v2 = [[WBSQuickWebsiteSearchController alloc] _initWithSearchDescriptionsURL:v4];
  v3 = (void *)+[WBSQuickWebsiteSearchController sharedController]::controller;
  +[WBSQuickWebsiteSearchController sharedController]::controller = (uint64_t)v2;

  [(id)+[WBSQuickWebsiteSearchController sharedController]::controller beginLoadingFromDiskIfNeeded];
}

- (id)_initWithSearchDescriptionsURL:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WBSQuickWebsiteSearchController;
  v6 = [(WBSQuickWebsiteSearchController *)&v23 init];
  v7 = v6;
  if (v6)
  {
    p_searchDescriptionsURL = &v6->_searchDescriptionsURL;
    objc_storeStrong((id *)&v6->_searchDescriptionsURL, a3);
    id v9 = [NSString stringWithFormat:@"com.apple.Safari.QuickWebsiteSearchProvidersAccess.%@.%p.accessQueue", objc_opt_class(), v7];
    v10 = (const char *)[v9 UTF8String];
    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = v7->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
    v7->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    quickWebsiteSearchProvidersByHost = v7->_quickWebsiteSearchProvidersByHost;
    v7->_quickWebsiteSearchProvidersByHost = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    openSearchDescriptionsByDescriptionDocumentURLString = v7->_openSearchDescriptionsByDescriptionDocumentURLString;
    v7->_openSearchDescriptionsByDescriptionDocumentURLString = (NSMutableDictionary *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    hostSetsByOpenSearchDescriptionDocumentURLString = v7->_hostSetsByOpenSearchDescriptionDocumentURLString;
    v7->_hostSetsByOpenSearchDescriptionDocumentURLString = (NSMutableDictionary *)v18;

    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v7 selector:sel__didCollectOpenSearchDescription_ name:@"WBSOpenSearchSchemaFetcherDidCollectDescriptionNotification" object:0];
    if (!*p_searchDescriptionsURL) {
      [(WBSQuickWebsiteSearchController *)v7 _didFinishLoadingFromDisk];
    }
    v21 = v7;
  }
  return v7;
}

- (void)beginLoadingFromDiskIfNeeded
{
  if (!self->_hasBegunLoadingFromDisk)
  {
    self->_hasBegunLoadingFromDisk = 1;
    [(WBSQuickWebsiteSearchController *)self _loadFromDisk];
  }
}

- (void)noteProvidersAreStale
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __56__WBSQuickWebsiteSearchController_noteProvidersAreStale__block_invoke;
  v2[3] = &unk_1E5C8CA70;
  v2[4] = self;
  [(WBSQuickWebsiteSearchController *)self _resetCachedDataWithCompletionHandler:v2];
}

uint64_t __56__WBSQuickWebsiteSearchController_noteProvidersAreStale__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadFromDisk];
}

- (void)savePendingChangesBeforeTermination
{
}

- (void)savePendingChangesNowWithCompletionHandler:(id)a3
{
}

- (void)clearWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__WBSQuickWebsiteSearchController_clearWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5C8C9F8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WBSQuickWebsiteSearchController *)self _resetCachedDataWithCompletionHandler:v6];
}

uint64_t __62__WBSQuickWebsiteSearchController_clearWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _saveToDiskSoon];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)removeProvidersAddedAfterDate:(id)a3 beforeDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__WBSQuickWebsiteSearchController_removeProvidersAddedAfterDate_beforeDate___block_invoke;
  block[3] = &unk_1E5C8D840;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, block);
}

void __76__WBSQuickWebsiteSearchController_removeProvidersAddedAfterDate_beforeDate___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA48] array];
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__WBSQuickWebsiteSearchController_removeProvidersAddedAfterDate_beforeDate___block_invoke_2;
  v8[3] = &unk_1E5C9EFD8;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v5 = v2;
  id v11 = v5;
  id v6 = v3;
  id v12 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  [*(id *)(*(void *)(a1 + 32) + 32) removeObjectsForKeys:v5];
  [*(id *)(*(void *)(a1 + 32) + 48) removeObjectsForKeys:v6];
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectsForKeys:v6];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__WBSQuickWebsiteSearchController_removeProvidersAddedAfterDate_beforeDate___block_invoke_3;
  block[3] = &unk_1E5C8CA70;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __76__WBSQuickWebsiteSearchController_removeProvidersAddedAfterDate_beforeDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [v5 dateAdded];
  int v7 = objc_msgSend(v6, "safari_isInclusivelyBetweenDate:andDate:", *(void *)(a1 + 32), *(void *)(a1 + 40));

  if (v7)
  {
    [*(id *)(a1 + 48) addObject:v9];
    v8 = [v5 openSearchDescriptionURLString];
    if (v8) {
      [*(id *)(a1 + 56) addObject:v8];
    }
  }
}

uint64_t __76__WBSQuickWebsiteSearchController_removeProvidersAddedAfterDate_beforeDate___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveToDiskSoon];
}

- (void)_sendNotification:(id)a3 forQuickWebsiteSearchProvider:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v10 = @"QuickWebsiteSearchProvider";
  v11[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:v6 object:self userInfo:v8];
}

- (NSArray)quickWebsiteSearchHosts
{
  if ([(WBSQuickWebsiteSearchController *)self quickWebsiteSearchProvidersLoadedFromDisk])
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    id v10 = __Block_byref_object_copy__32;
    id v11 = __Block_byref_object_dispose__32;
    id v12 = 0;
    quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__WBSQuickWebsiteSearchController_quickWebsiteSearchHosts__block_invoke;
    v6[3] = &unk_1E5C8E190;
    v6[4] = self;
    void v6[5] = &v7;
    dispatch_sync(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, v6);
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }
  return (NSArray *)v4;
}

void __58__WBSQuickWebsiteSearchController_quickWebsiteSearchHosts__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__WBSQuickWebsiteSearchController_quickWebsiteSearchHosts__block_invoke_2;
  v8[3] = &unk_1E5C9F000;
  void v8[4] = v2;
  id v4 = [v3 keysOfEntriesPassingTest:v8];
  uint64_t v5 = [v4 allObjects];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __58__WBSQuickWebsiteSearchController_quickWebsiteSearchHosts__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_quickWebsiteSearchProviderHasSearchURLTemplateStringOnAccessQueue:");
}

- (id)providersMatchingString:(id)a3 excludingSearchEngineHostSuffixes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __93__WBSQuickWebsiteSearchController_providersMatchingString_excludingSearchEngineHostSuffixes___block_invoke;
  v17 = &unk_1E5C9B5C8;
  uint64_t v18 = self;
  id v10 = v6;
  id v19 = v10;
  id v11 = v7;
  id v20 = v11;
  id v12 = v8;
  id v21 = v12;
  dispatch_sync(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, &v14);
  objc_msgSend(v12, "sortUsingComparator:", &__block_literal_global_34_0, v14, v15, v16, v17, v18);

  return v12;
}

void __93__WBSQuickWebsiteSearchController_providersMatchingString_excludingSearchEngineHostSuffixes___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __93__WBSQuickWebsiteSearchController_providersMatchingString_excludingSearchEngineHostSuffixes___block_invoke_2;
  v4[3] = &unk_1E5C9F050;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __93__WBSQuickWebsiteSearchController_providersMatchingString_excludingSearchEngineHostSuffixes___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([a1[4] _quickWebsiteSearchProviderHasSearchURLTemplateStringOnAccessQueue:v6])
  {
    uint64_t v7 = [v5 length];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __93__WBSQuickWebsiteSearchController_providersMatchingString_excludingSearchEngineHostSuffixes___block_invoke_3;
    v8[3] = &unk_1E5C9F028;
    id v9 = v5;
    id v10 = a1[5];
    uint64_t v14 = v7;
    id v11 = a1[6];
    id v12 = v6;
    id v13 = a1[7];
    objc_msgSend(v9, "safari_enumerateSubdomainRangesInHostUsingBlock:", v8);
  }
}

void __93__WBSQuickWebsiteSearchController_providersMatchingString_excludingSearchEngineHostSuffixes___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:range:", *(void *)(a1 + 40), 393, a2, *(void *)(a1 + 72) - a2);
  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "safari_domainFromHost", (void)v15);
          id v12 = [*(id *)(a1 + 56) hostname];
          id v13 = objc_msgSend(v12, "safari_domainFromHost");
          char v14 = [v11 isEqualToString:v13];

          if (v14)
          {

            return;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    [*(id *)(a1 + 64) addObject:*(void *)(a1 + 56)];
    *a4 = 1;
  }
}

uint64_t __93__WBSQuickWebsiteSearchController_providersMatchingString_excludingSearchEngineHostSuffixes___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 dateOfLastSearch];
  id v7 = [v5 dateOfLastSearch];
  uint64_t v8 = v7;
  if (v6 || !v7)
  {
    if (!v6 || v7)
    {
      if (!v6 || !v7 || (uint64_t v9 = [v7 compare:v6]) == 0)
      {
        uint64_t v10 = [v5 dateAdded];
        id v11 = [v4 dateAdded];
        uint64_t v9 = [v10 compare:v11];
      }
    }
    else
    {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (id)providersMatchingQueryString:(id)a3 excludingSearchEngineHostSuffixes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithRange:", 8206, 1);
  uint64_t v9 = [v6 stringByTrimmingCharactersInSet:v8];

  uint64_t v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  unint64_t v11 = [v9 rangeOfCharacterFromSet:v10];

  if (v11 < 3 || v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((unint64_t)[v9 length] < 3)
    {
      id v13 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_10;
    }
    id v14 = v9;
  }
  else
  {
    id v14 = [v9 substringToIndex:v11];
  }
  long long v15 = v14;
  id v13 = [(WBSQuickWebsiteSearchController *)self providersMatchingString:v14 excludingSearchEngineHostSuffixes:v7];

LABEL_10:
  return v13;
}

- (void)didPerformSearchWithProvider:(id)a3
{
  id v4 = a3;
  quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__WBSQuickWebsiteSearchController_didPerformSearchWithProvider___block_invoke;
  v7[3] = &unk_1E5C8D980;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, v7);
}

void __64__WBSQuickWebsiteSearchController_didPerformSearchWithProvider___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  [*(id *)(a1 + 32) setDateOfLastSearch:v2];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__WBSQuickWebsiteSearchController_didPerformSearchWithProvider___block_invoke_2;
  block[3] = &unk_1E5C8CA70;
  block[4] = *(void *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64__WBSQuickWebsiteSearchController_didPerformSearchWithProvider___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveToDiskSoon];
}

- (void)setSearchURLTemplateFromForm:(id)a3 forSourcePageURLString:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  unint64_t v11 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
  id v12 = [v11 host];
  id v13 = objc_msgSend(v12, "safari_stringByRemovingWwwDotPrefix");

  if (v13)
  {
    quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __105__WBSQuickWebsiteSearchController_setSearchURLTemplateFromForm_forSourcePageURLString_completionHandler___block_invoke;
    block[3] = &unk_1E5C9C218;
    block[4] = self;
    id v16 = v13;
    id v17 = v8;
    id v19 = v10;
    id v18 = v9;
    dispatch_async(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, block);
  }
  else if (v10)
  {
    v10[2](v10);
  }
}

void __105__WBSQuickWebsiteSearchController_setSearchURLTemplateFromForm_forSourcePageURLString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  v3 = v2;
  if (!v2)
  {
    id v7 = [[WBSQuickWebsiteSearchProvider alloc] initWithSourcePageURLString:*(void *)(a1 + 56) searchURLTemplateFromForm:*(void *)(a1 + 48) delegate:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __105__WBSQuickWebsiteSearchController_setSearchURLTemplateFromForm_forSourcePageURLString_completionHandler___block_invoke_3;
    v8[3] = &unk_1E5C8D730;
    void v8[4] = *(void *)(a1 + 32);
    id v6 = (id *)&v9;
    v3 = v7;
    id v9 = v3;
    id v10 = *(id *)(a1 + 64);
    dispatch_async(MEMORY[0x1E4F14428], v8);

    goto LABEL_5;
  }
  id v4 = [(WBSQuickWebsiteSearchProvider *)v2 searchURLTemplateFromForm];
  char v5 = [v4 isEqual:*(void *)(a1 + 48)];

  if ((v5 & 1) == 0)
  {
    [(WBSQuickWebsiteSearchProvider *)v3 setSearchURLTemplateFromForm:*(void *)(a1 + 48)];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __105__WBSQuickWebsiteSearchController_setSearchURLTemplateFromForm_forSourcePageURLString_completionHandler___block_invoke_2;
    block[3] = &unk_1E5C8C9F8;
    block[4] = *(void *)(a1 + 32);
    id v6 = &v12;
    id v12 = *(id *)(a1 + 64);
    dispatch_async(MEMORY[0x1E4F14428], block);
LABEL_5:
  }
}

uint64_t __105__WBSQuickWebsiteSearchController_setSearchURLTemplateFromForm_forSourcePageURLString_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _saveToDiskSoon];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __105__WBSQuickWebsiteSearchController_setSearchURLTemplateFromForm_forSourcePageURLString_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _sendNotification:@"WBSQuickWebsiteSearchControllerDidUpdateProviderNotification" forQuickWebsiteSearchProvider:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _saveToDiskSoon];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)setOpenSearchDescriptionURLString:(id)a3 forSourcePageURLString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  id v9 = [v8 host];
  id v10 = objc_msgSend(v9, "safari_stringByRemovingWwwDotPrefix");

  if (v10)
  {
    quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __92__WBSQuickWebsiteSearchController_setOpenSearchDescriptionURLString_forSourcePageURLString___block_invoke;
    v12[3] = &unk_1E5C9B5C8;
    v12[4] = self;
    id v13 = v10;
    id v14 = v6;
    id v15 = v7;
    dispatch_async(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, v12);
  }
}

void __92__WBSQuickWebsiteSearchController_setOpenSearchDescriptionURLString_forSourcePageURLString___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2)
  {
    v3 = v2;
    id v4 = [(WBSQuickWebsiteSearchProvider *)v2 openSearchDescriptionURLString];
    if (([v4 isEqualToString:*(void *)(a1 + 48)] & 1) == 0)
    {
      [(WBSQuickWebsiteSearchProvider *)v3 setOpenSearchDescriptionURLString:*(void *)(a1 + 48)];
      [*(id *)(a1 + 32) _addHost:*(void *)(a1 + 40) toOpenSearchDescriptionWithDocumentURL:*(void *)(a1 + 48)];
      if (v4) {
        [*(id *)(a1 + 32) _removeHost:*(void *)(a1 + 40) fromOpenSearchDescriptionWithDocumentURL:v4];
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __92__WBSQuickWebsiteSearchController_setOpenSearchDescriptionURLString_forSourcePageURLString___block_invoke_2;
      block[3] = &unk_1E5C8CA70;
      block[4] = *(void *)(a1 + 32);
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    v3 = [[WBSQuickWebsiteSearchProvider alloc] initWithSourcePageURLString:*(void *)(a1 + 56) openSearchDescriptionURLString:*(void *)(a1 + 48) delegate:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _addHost:*(void *)(a1 + 40) toOpenSearchDescriptionWithDocumentURL:*(void *)(a1 + 48)];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __92__WBSQuickWebsiteSearchController_setOpenSearchDescriptionURLString_forSourcePageURLString___block_invoke_3;
    v5[3] = &unk_1E5C8CA70;
    v5[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __92__WBSQuickWebsiteSearchController_setOpenSearchDescriptionURLString_forSourcePageURLString___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveToDiskSoon];
}

uint64_t __92__WBSQuickWebsiteSearchController_setOpenSearchDescriptionURLString_forSourcePageURLString___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveToDiskSoon];
}

- (id)providerForSourcePageURLString:(id)a3
{
  id v4 = a3;
  if ([(WBSQuickWebsiteSearchController *)self quickWebsiteSearchProvidersLoadedFromDisk])
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__32;
    id v15 = __Block_byref_object_dispose__32;
    id v16 = 0;
    quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__WBSQuickWebsiteSearchController_providerForSourcePageURLString___block_invoke;
    block[3] = &unk_1E5C9A498;
    id v10 = &v11;
    block[4] = self;
    id v9 = v4;
    dispatch_sync(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, block);
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __66__WBSQuickWebsiteSearchController_providerForSourcePageURLString___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 32);
  id v7 = [MEMORY[0x1E4F1CB10] URLWithString:a1[5]];
  v3 = [v7 host];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)openSearchDescriptionForOpenSearchDescriptionURLString:(id)a3
{
  id v4 = a3;
  if ([(WBSQuickWebsiteSearchController *)self quickWebsiteSearchProvidersLoadedFromDisk])
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__32;
    id v15 = __Block_byref_object_dispose__32;
    id v16 = 0;
    quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__WBSQuickWebsiteSearchController_openSearchDescriptionForOpenSearchDescriptionURLString___block_invoke;
    block[3] = &unk_1E5C9A498;
    id v10 = &v11;
    block[4] = self;
    id v9 = v4;
    dispatch_sync(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, block);
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __90__WBSQuickWebsiteSearchController_openSearchDescriptionForOpenSearchDescriptionURLString___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeProvidersWithHosts:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__WBSQuickWebsiteSearchController_removeProvidersWithHosts_completionHandler___block_invoke;
  block[3] = &unk_1E5C8D730;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, block);
}

void __78__WBSQuickWebsiteSearchController_removeProvidersWithHosts_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v17;
    uint64_t v5 = MEMORY[0x1E4F14428];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v8 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKeyedSubscript:v7];
        id v9 = v8;
        if (v8)
        {
          id v10 = [v8 openSearchDescriptionURLString];
          if (v10) {
            [*(id *)(a1 + 40) _removeHost:v7 fromOpenSearchDescriptionWithDocumentURL:v10];
          }

          [*(id *)(*(void *)(a1 + 40) + 32) removeObjectForKey:v7];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __78__WBSQuickWebsiteSearchController_removeProvidersWithHosts_completionHandler___block_invoke_2;
          block[3] = &unk_1E5C8D980;
          void block[4] = *(void *)(a1 + 40);
          id v15 = v9;
          dispatch_async(v5, block);
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v3);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__WBSQuickWebsiteSearchController_removeProvidersWithHosts_completionHandler___block_invoke_3;
  v12[3] = &unk_1E5C8C9F8;
  uint64_t v11 = *(void **)(a1 + 48);
  v12[4] = *(void *)(a1 + 40);
  id v13 = v11;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

uint64_t __78__WBSQuickWebsiteSearchController_removeProvidersWithHosts_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendNotification:@"WBSQuickWebsiteSearchControllerDidUpdateProviderNotification" forQuickWebsiteSearchProvider:*(void *)(a1 + 40)];
}

uint64_t __78__WBSQuickWebsiteSearchController_removeProvidersWithHosts_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _saveToDiskSoon];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)removeProviderWithHost:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(WBSQuickWebsiteSearchController *)self removeProvidersWithHosts:v5 completionHandler:0];
}

- (id)quickWebsiteSearchProvider:(id)a3 openSearchDescriptionForOpenSearchDescriptionURLString:(id)a4
{
  id v4 = [(WBSQuickWebsiteSearchController *)self openSearchDescriptionForOpenSearchDescriptionURLString:a4];
  return v4;
}

- (BOOL)_quickWebsiteSearchProviderHasSearchURLTemplateStringOnAccessQueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 searchURLTemplateFromForm];

  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v7 = [v4 openSearchDescriptionURLString];
    if ([v7 length])
    {
      id v8 = [(NSMutableDictionary *)self->_openSearchDescriptionsByDescriptionDocumentURLString objectForKeyedSubscript:v7];
      id v9 = [v8 searchURLTemplate];
      BOOL v6 = v9 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  return v6;
}

- (void)_addHost:(id)a3 toOpenSearchDescriptionWithDocumentURL:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)self->_hostSetsByOpenSearchDescriptionDocumentURLString objectForKeyedSubscript:v6];
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_hostSetsByOpenSearchDescriptionDocumentURLString, "setObject:forKeyedSubscript:");
  }
  [v7 addObject:v8];
}

- (void)_removeHost:(id)a3 fromOpenSearchDescriptionWithDocumentURL:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)self->_hostSetsByOpenSearchDescriptionDocumentURLString objectForKeyedSubscript:v6];
  [v7 removeObject:v8];
  if (![v7 count])
  {
    [(NSMutableDictionary *)self->_hostSetsByOpenSearchDescriptionDocumentURLString removeObjectForKey:v6];
    [(NSMutableDictionary *)self->_openSearchDescriptionsByDescriptionDocumentURLString removeObjectForKey:v6];
  }
}

- (BOOL)_shouldRemoveQuickWebsiteSearchProvider:(id)a3
{
  id v3 = a3;
  id v4 = [v3 dateAdded];
  if (v4)
  {
    uint64_t v5 = [v3 dateOfLastSearch];

    if (v5)
    {
      BOOL v6 = 0;
    }
    else
    {
      [v4 timeIntervalSinceNow];
      BOOL v6 = v7 < -604800.0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)_pruneUnusedQuickWebsiteSearchProviders
{
  quickWebsiteSearchProvidersByHost = self->_quickWebsiteSearchProvidersByHost;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__WBSQuickWebsiteSearchController__pruneUnusedQuickWebsiteSearchProviders__block_invoke;
  v7[3] = &unk_1E5C9F000;
  void v7[4] = self;
  id v4 = [(NSMutableDictionary *)quickWebsiteSearchProvidersByHost keysOfEntriesPassingTest:v7];
  uint64_t v5 = self->_quickWebsiteSearchProvidersByHost;
  BOOL v6 = [v4 allObjects];
  [(NSMutableDictionary *)v5 removeObjectsForKeys:v6];
}

uint64_t __74__WBSQuickWebsiteSearchController__pruneUnusedQuickWebsiteSearchProviders__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) _shouldRemoveQuickWebsiteSearchProvider:v6];
  if (v7)
  {
    id v8 = [v6 openSearchDescriptionURLString];
    if (v8) {
      [*(id *)(a1 + 32) _removeHost:v5 fromOpenSearchDescriptionWithDocumentURL:v8];
    }
  }
  return v7;
}

- (void)_saveToDiskSoon
{
  if (self->_searchDescriptionsURL)
  {
    writer = self->_writer;
    if (!writer)
    {
      objc_initWeak(&location, self);
      id v4 = objc_alloc(MEMORY[0x1E4F97E70]);
      searchDescriptionsURL = self->_searchDescriptionsURL;
      uint64_t v8 = MEMORY[0x1E4F143A8];
      uint64_t v9 = 3221225472;
      id v10 = __50__WBSQuickWebsiteSearchController__saveToDiskSoon__block_invoke;
      uint64_t v11 = &unk_1E5C9F098;
      objc_copyWeak(&v12, &location);
      id v6 = (WBSCoalescedAsynchronousWriter *)[v4 initWithName:@"SearchDescriptions" fileURL:searchDescriptionsURL dataSourceBlock:&v8];
      uint64_t v7 = self->_writer;
      self->_writer = v6;

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
      writer = self->_writer;
    }
    [(WBSCoalescedAsynchronousWriter *)writer scheduleWrite];
  }
}

id __50__WBSQuickWebsiteSearchController__saveToDiskSoon__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)MEMORY[0x1E4F28F98];
  id v3 = [WeakRetained _dictionaryRepresentation];
  id v9 = 0;
  id v4 = [v2 dataWithPropertyList:v3 format:200 options:0 error:&v9];
  id v5 = v9;

  if (!v4)
  {
    id v6 = (id)WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_msgSend(v5, "safari_privacyPreservingDescription");
      __50__WBSQuickWebsiteSearchController__saveToDiskSoon__block_invoke_cold_1(v7, buf, v6);
    }
  }
  return v4;
}

- (id)_dictionaryRepresentation
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __60__WBSQuickWebsiteSearchController__dictionaryRepresentation__block_invoke;
  id v13 = &unk_1E5C8D840;
  id v14 = self;
  id v6 = v3;
  id v15 = v6;
  id v7 = v4;
  id v16 = v7;
  dispatch_sync(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, &v10);
  v17[0] = @"WebsiteSpecificSearchDescriptions";
  v17[1] = @"OpenSearchDescriptions";
  v18[0] = v6;
  v18[1] = v7;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v18, v17, 2, v10, v11, v12, v13, v14);

  return v8;
}

void __60__WBSQuickWebsiteSearchController__dictionaryRepresentation__block_invoke(id *a1)
{
  [a1[4] _pruneUnusedQuickWebsiteSearchProviders];
  id v2 = a1[4];
  id v3 = (void *)v2[4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__WBSQuickWebsiteSearchController__dictionaryRepresentation__block_invoke_2;
  v8[3] = &unk_1E5C9F0C0;
  void v8[4] = v2;
  id v9 = a1[5];
  [v3 enumerateKeysAndObjectsUsingBlock:v8];
  id v4 = a1[4];
  id v5 = (void *)v4[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __60__WBSQuickWebsiteSearchController__dictionaryRepresentation__block_invoke_3;
  v6[3] = &unk_1E5C9F0E8;
  v6[4] = v4;
  id v7 = a1[6];
  [v5 enumerateKeysAndObjectsUsingBlock:v6];
}

void __60__WBSQuickWebsiteSearchController__dictionaryRepresentation__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_quickWebsiteSearchProviderHasSearchURLTemplateStringOnAccessQueue:"))
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = [v6 dictionaryRepresentation];
    [v4 addObject:v5];
  }
}

void __60__WBSQuickWebsiteSearchController__dictionaryRepresentation__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:v10];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = *(void **)(a1 + 40);
    id v9 = [v5 dictionaryRepresentation];
    [v8 addObject:v9];
  }
}

- (void)_loadFromDisk
{
  quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WBSQuickWebsiteSearchController__loadFromDisk__block_invoke;
  block[3] = &unk_1E5C8CA70;
  void block[4] = self;
  dispatch_async(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, block);
}

void __48__WBSQuickWebsiteSearchController__loadFromDisk__block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (v2[1])
  {
    v25 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithContentsOfURL:");
    v24 = objc_msgSend(v25, "safari_arrayForKey:", @"WebsiteSpecificSearchDescriptions");
    if (v24)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id obj = v24;
      uint64_t v3 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v3)
      {
        uint64_t v4 = *(void *)v32;
        do
        {
          uint64_t v5 = 0;
          do
          {
            if (*(void *)v32 != v4) {
              objc_enumerationMutation(obj);
            }
            uint64_t v6 = *(void *)(*((void *)&v31 + 1) + 8 * v5);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v7 = [[WBSQuickWebsiteSearchProvider alloc] initWithDictionaryRepresentation:v6 delegate:*(void *)(a1 + 32)];
              uint64_t v8 = v7;
              if (v7)
              {
                id v9 = (void *)MEMORY[0x1E4F1CB10];
                id v10 = [(WBSQuickWebsiteSearchProvider *)v7 sourcePageURLString];
                uint64_t v11 = [v9 URLWithString:v10];
                id v12 = [v11 host];
                id v13 = objc_msgSend(v12, "safari_stringByRemovingWwwDotPrefix");

                [*(id *)(*(void *)(a1 + 32) + 32) setObject:v8 forKeyedSubscript:v13];
                id v14 = [(WBSQuickWebsiteSearchProvider *)v8 openSearchDescriptionURLString];
                if (v14) {
                  [*(id *)(a1 + 32) _addHost:v13 toOpenSearchDescriptionWithDocumentURL:v14];
                }
              }
            }
            ++v5;
          }
          while (v3 != v5);
          uint64_t v3 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v3);
      }

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v15 = objc_msgSend(v25, "safari_arrayForKey:", @"OpenSearchDescriptions");
      uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v28;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v28 != v17) {
              objc_enumerationMutation(v15);
            }
            uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * v18);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v20 = [[WBSOpenSearchDescription alloc] initWithDictionaryRepresentation:v19];
              uint64_t v21 = v20;
              if (v20)
              {
                v22 = *(void **)(*(void *)(a1 + 32) + 40);
                objc_super v23 = [(WBSOpenSearchDescription *)v20 descriptionDocumentURLString];
                [v22 setObject:v21 forKeyedSubscript:v23];
              }
            }
            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v16);
      }

      [*(id *)(a1 + 32) _pruneUnusedQuickWebsiteSearchProviders];
    }
    [*(id *)(a1 + 32) _didFinishLoadingFromDisk];
  }
  else
  {
    [v2 _didFinishLoadingFromDisk];
  }
}

- (void)_didFinishLoadingFromDisk
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__WBSQuickWebsiteSearchController__didFinishLoadingFromDisk__block_invoke;
  block[3] = &unk_1E5C8CA70;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__WBSQuickWebsiteSearchController__didFinishLoadingFromDisk__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setQuickWebsiteSearchProvidersLoadedFromDisk:1];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"WBSQuickWebsiteSearchControllerDidFinishLoadingNotification" object:*(void *)(a1 + 32)];
}

- (void)_didCollectOpenSearchDescription:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"WBSOpenSearchDescription"];

  quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__WBSQuickWebsiteSearchController__didCollectOpenSearchDescription___block_invoke;
  v9[3] = &unk_1E5C8D980;
  id v10 = v6;
  uint64_t v11 = self;
  id v8 = v6;
  dispatch_async(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, v9);
}

void __68__WBSQuickWebsiteSearchController__didCollectOpenSearchDescription___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) descriptionDocumentURLString];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [*(id *)(*(void *)(a1 + 40) + 48) objectForKeyedSubscript:v2];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * v7)];
        if (([*(id *)(a1 + 40) _quickWebsiteSearchProviderHasSearchURLTemplateStringOnAccessQueue:v8] & 1) == 0) {
          [v3 addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  [*(id *)(*(void *)(a1 + 40) + 40) setObject:*(void *)(a1 + 32) forKeyedSubscript:v2];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __68__WBSQuickWebsiteSearchController__didCollectOpenSearchDescription___block_invoke_2;
  v11[3] = &unk_1E5C8D980;
  uint64_t v9 = *(void *)(a1 + 40);
  id v12 = v3;
  uint64_t v13 = v9;
  id v10 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

uint64_t __68__WBSQuickWebsiteSearchController__didCollectOpenSearchDescription___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_sendNotification:forQuickWebsiteSearchProvider:", @"WBSQuickWebsiteSearchControllerDidUpdateProviderNotification", *(void *)(*((void *)&v7 + 1) + 8 * v5++), (void)v7);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }

  return [*(id *)(a1 + 40) _saveToDiskSoon];
}

- (void)_resetCachedDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__WBSQuickWebsiteSearchController__resetCachedDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, v7);
}

void __73__WBSQuickWebsiteSearchController__resetCachedDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = *(void *)(a1 + 32);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v9 = *(void *)(a1 + 32);
  long long v10 = *(void **)(v9 + 48);
  *(void *)(v9 + 48) = v8;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__WBSQuickWebsiteSearchController__resetCachedDataWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5C8D5F0;
  id v12 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__WBSQuickWebsiteSearchController__resetCachedDataWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)quickWebsiteSearchProvidersLoadedFromDisk
{
  return self->_quickWebsiteSearchProvidersLoadedFromDisk;
}

- (void)setQuickWebsiteSearchProvidersLoadedFromDisk:(BOOL)a3
{
  self->_quickWebsiteSearchProvidersLoadedFromDisk = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_hostSetsByOpenSearchDescriptionDocumentURLString, 0);
  objc_storeStrong((id *)&self->_openSearchDescriptionsByDescriptionDocumentURLString, 0);
  objc_storeStrong((id *)&self->_quickWebsiteSearchProvidersByHost, 0);
  objc_storeStrong((id *)&self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, 0);
  objc_storeStrong((id *)&self->_searchDescriptionsURL, 0);
}

void __50__WBSQuickWebsiteSearchController__saveToDiskSoon__block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "error \"%{public}@\" trying to convert search descriptions to NSData", buf, 0xCu);
}

@end