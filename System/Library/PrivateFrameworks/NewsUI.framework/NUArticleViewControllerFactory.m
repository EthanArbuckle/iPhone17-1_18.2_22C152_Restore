@interface NUArticleViewControllerFactory
- (NSHashTable)loadingListeners;
- (NUArticleDataProviderFactory)articleDataProviderFactory;
- (NUArticleKeyCommandManager)keyCommandManager;
- (NUArticlePrefetcherType)articlePrefetcher;
- (NUArticleScrollPositionManagerType)articleScrollPositionManager;
- (NUArticleViewControllerFactory)initWithArticleDataProviderFactory:(id)a3 appStateMonitor:(id)a4 keyCommandManager:(id)a5 headerBlueprintProvider:(id)a6 articlePrefetcher:(id)a7 articleScrollPositionManager:(id)a8 spotlightManager:(id)a9 resolver:(id)a10;
- (NUDocumentSectionBlueprintProvider)headerBlueprintProvider;
- (NUSpotlightManager)spotlightManager;
- (SXAppStateMonitor)appStateMonitor;
- (TFResolver)resolver;
- (id)createArticleViewControllerWithArticle:(id)a3 issue:(id)a4 context:(id)a5 relativePriority:(int64_t)a6 articleHostViewController:(id)a7;
@end

@implementation NUArticleViewControllerFactory

- (NUArticleViewControllerFactory)initWithArticleDataProviderFactory:(id)a3 appStateMonitor:(id)a4 keyCommandManager:(id)a5 headerBlueprintProvider:(id)a6 articlePrefetcher:(id)a7 articleScrollPositionManager:(id)a8 spotlightManager:(id)a9 resolver:(id)a10
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v17 = a10;
  v30.receiver = self;
  v30.super_class = (Class)NUArticleViewControllerFactory;
  v18 = [(NUArticleViewControllerFactory *)&v30 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_articleDataProviderFactory, a3);
    objc_storeStrong((id *)&v19->_appStateMonitor, a4);
    objc_storeStrong((id *)&v19->_keyCommandManager, a5);
    objc_storeStrong((id *)&v19->_headerBlueprintProvider, a6);
    objc_storeStrong((id *)&v19->_articlePrefetcher, a7);
    objc_storeStrong((id *)&v19->_articleScrollPositionManager, a8);
    objc_storeStrong((id *)&v19->_spotlightManager, a9);
    objc_storeStrong((id *)&v19->_resolver, a10);
    uint64_t v20 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    loadingListeners = v19->_loadingListeners;
    v19->_loadingListeners = (NSHashTable *)v20;
  }
  return v19;
}

- (id)createArticleViewControllerWithArticle:(id)a3 issue:(id)a4 context:(id)a5 relativePriority:(int64_t)a6 articleHostViewController:(id)a7
{
  id v12 = a3;
  id v54 = a4;
  id v13 = a7;
  id v53 = a5;
  v14 = [(NUArticleViewControllerFactory *)self articlePrefetcher];
  v15 = [v12 articleID];
  v16 = [v14 prefetchedArticleDataProviderForArticleID:v15];
  id v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    v19 = [(NUArticleViewControllerFactory *)self articleDataProviderFactory];
    id v18 = [v19 createArticleDataProviderWithArticle:v12];
  }
  [v18 setRelativePriority:a6];
  uint64_t v20 = [(NUArticleViewControllerFactory *)self resolver];
  v21 = [v20 resolveClass:objc_opt_class()];

  v22 = [(NUArticleViewControllerFactory *)self resolver];
  uint64_t v23 = objc_opt_class();
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = __130__NUArticleViewControllerFactory_createArticleViewControllerWithArticle_issue_context_relativePriority_articleHostViewController___block_invoke;
  v66[3] = &unk_2645FE388;
  id v24 = v12;
  id v67 = v24;
  id v25 = [v22 resolveClass:v23 contextBlock:v66];

  id v26 = [(NUArticleViewControllerFactory *)self resolver];
  uint64_t v27 = objc_opt_class();
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __130__NUArticleViewControllerFactory_createArticleViewControllerWithArticle_issue_context_relativePriority_articleHostViewController___block_invoke_2;
  v64[3] = &unk_2645FE388;
  id v28 = v24;
  id v65 = v28;
  id v29 = [v26 resolveClass:v27 contextBlock:v64];

  objc_super v30 = [[NUArticleHostViewControllerProvider alloc] initWithArticleHostViewController:v13];
  v31 = [(NUArticleViewControllerFactory *)self resolver];
  uint64_t v32 = objc_opt_class();
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __130__NUArticleViewControllerFactory_createArticleViewControllerWithArticle_issue_context_relativePriority_articleHostViewController___block_invoke_3;
  v56[3] = &unk_2645FE3B0;
  id v57 = v25;
  id v58 = v29;
  id v59 = v28;
  v60 = v30;
  id v61 = v21;
  id v62 = v54;
  id v63 = v18;
  id v47 = v18;
  id v52 = v54;
  id v55 = v21;
  v50 = v30;
  id v51 = v28;
  id v48 = v29;
  id v49 = v25;
  v46 = [v31 resolveClass:v32 contextBlock:v56];

  v33 = [(NUArticleViewControllerFactory *)self resolver];
  v45 = [v33 resolveProtocol:&unk_26D4C42C0];

  v34 = [(NUArticleViewControllerFactory *)self resolver];
  v35 = [v34 resolveProtocol:&unk_26D4C7390];

  v36 = [NUArticleViewController alloc];
  v37 = [(NUArticleViewControllerFactory *)self appStateMonitor];
  v38 = [(NUArticleViewControllerFactory *)self keyCommandManager];
  v39 = [(NUArticleViewControllerFactory *)self loadingListeners];
  v40 = [(NUArticleViewControllerFactory *)self headerBlueprintProvider];
  v41 = [(NUArticleViewControllerFactory *)self articleScrollPositionManager];
  v42 = [(NUArticleViewControllerFactory *)self spotlightManager];
  v43 = [(NUArticleViewController *)v36 initWithArticleDataProvider:v47 scrollViewController:v46 appStateMonitor:v37 keyCommandManager:v38 loadingListeners:v39 headerBlueprintProvider:v40 debugSettingsProvider:v45 videoPlayerViewControllerManager:v55 articleScrollPositionManager:v41 chromeControl:v35 spotlightManager:v42];

  [(NUArticleViewController *)v43 setArticleContext:v53];

  return v43;
}

void __130__NUArticleViewControllerFactory_createArticleViewControllerWithArticle_issue_context_relativePriority_articleHostViewController___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 headline];
  [v3 useObject:v4 forProtocol:&unk_26D4E2540];
}

void __130__NUArticleViewControllerFactory_createArticleViewControllerWithArticle_issue_context_relativePriority_articleHostViewController___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 headline];
  [v3 useObject:v4 forProtocol:&unk_26D4E2540];
}

void __130__NUArticleViewControllerFactory_createArticleViewControllerWithArticle_issue_context_relativePriority_articleHostViewController___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [v3 useObject:*(void *)(a1 + 32) forProtocol:&unk_26D4D4988];
  [v3 useObject:*(void *)(a1 + 40) forProtocol:&unk_26D4D04C0];
  id v4 = [*(id *)(a1 + 48) headline];
  [v3 useObject:v4 forProtocol:&unk_26D4E2540];

  [v3 useObject:*(void *)(a1 + 56) forClass:objc_opt_class()];
  [v3 useObject:*(void *)(a1 + 64) forClass:objc_opt_class()];
  uint64_t v5 = *(void *)(a1 + 72);
  if (v5) {
    [v3 useObject:v5 forClass:objc_opt_class()];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = objc_msgSend(*(id *)(a1 + 80), "linkedContentProviders", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [v3 useObject:*(void *)(*((void *)&v11 + 1) + 8 * v10++) forClass:objc_opt_class()];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSHashTable)loadingListeners
{
  return self->_loadingListeners;
}

- (NUArticleDataProviderFactory)articleDataProviderFactory
{
  return self->_articleDataProviderFactory;
}

- (SXAppStateMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (NUArticleKeyCommandManager)keyCommandManager
{
  return self->_keyCommandManager;
}

- (TFResolver)resolver
{
  return self->_resolver;
}

- (NUDocumentSectionBlueprintProvider)headerBlueprintProvider
{
  return self->_headerBlueprintProvider;
}

- (NUArticlePrefetcherType)articlePrefetcher
{
  return self->_articlePrefetcher;
}

- (NUArticleScrollPositionManagerType)articleScrollPositionManager
{
  return self->_articleScrollPositionManager;
}

- (NUSpotlightManager)spotlightManager
{
  return self->_spotlightManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightManager, 0);
  objc_storeStrong((id *)&self->_articleScrollPositionManager, 0);
  objc_storeStrong((id *)&self->_articlePrefetcher, 0);
  objc_storeStrong((id *)&self->_headerBlueprintProvider, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_keyCommandManager, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_articleDataProviderFactory, 0);

  objc_storeStrong((id *)&self->_loadingListeners, 0);
}

@end