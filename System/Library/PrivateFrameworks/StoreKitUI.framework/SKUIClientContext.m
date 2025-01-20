@interface SKUIClientContext
+ (NSString)_cachePath;
+ (id)_cachePathForStoreFrontIdentifier:(id)a3;
+ (id)_configurationDictionaryWithBagDictionary:(id)a3;
+ (id)_fallbackConfigurationDictionary;
+ (id)defaultContext;
+ (id)localizedStringForKey:(id)a3 inBundles:(id)a4;
+ (id)localizedStringForKey:(id)a3 inBundles:(id)a4 inTable:(id)a5;
- (BOOL)isBootstrapScriptFallbackDisabled;
- (BOOL)isManagedAppleID;
- (BOOL)isMultiUser;
- (BOOL)shouldForceTransientSearchControllerBahavior;
- (BOOL)storeViewController:(id)a3 shouldDisplayDefaultDarButton:(int64_t)a4;
- (BOOL)supportsRenderingVersion:(unsigned int)a3;
- (Class)moviePlayerViewControllerClass;
- (IKAppContext)_scriptAppContext;
- (NSArray)navigationHistory;
- (NSCache)placeholderImageCache;
- (NSDictionary)configurationDictionary;
- (NSOperationQueue)resourceLoadQueue;
- (NSString)description;
- (NSString)metricsConfigurationIdentifier;
- (NSString)navigationHistoryPersistenceKey;
- (NSString)storeFrontIdentifier;
- (SKUIApplicationController)_applicationController;
- (SKUIClientContext)initWithConfigurationDictionary:(id)a3;
- (SKUITrendingSearchProvider)trendingSearchProvider;
- (SKUIURL)purchaseReferrerURL;
- (SSURLBag)URLBag;
- (SSVPlatformContext)platformContext;
- (SUClientInterface)clientInterface;
- (id)SAPSessionForVersion:(int64_t)a3;
- (id)_navigationHistory;
- (id)additionalLeftBarButtonItemForDocumentContainerViewController:(id)a3;
- (id)additionalLeftBarButtonItemForViewController:(id)a3;
- (id)additionalRightBarButtonItemForDocumentContainerViewController:(id)a3;
- (id)additionalRightBarButtonItemForViewController:(id)a3;
- (id)documentViewControllerForTemplateViewElement:(id)a3;
- (id)existingBagValueForKey:(id)a3;
- (id)localizedAlertWithError:(id)a3;
- (id)localizedStringForKey:(id)a3;
- (id)localizedStringForKey:(id)a3 inTable:(id)a4;
- (id)metricsPageContextForViewController:(id)a3;
- (id)modalDocumentViewControllerForDocument:(id)a3 options:(id)a4;
- (id)newLegacyStorePageViewControllerForURLResponse:(id)a3;
- (id)newLoadStoreURLOperationWithURL:(id)a3;
- (id)newLoadStoreURLOperationWithURLRequest:(id)a3;
- (id)previewViewControllerForViewElement:(id)a3;
- (id)scriptInterfaceForClientInterface:(id)a3;
- (id)tabBarItemsForStyle:(int64_t)a3;
- (id)valueForConfigurationKey:(id)a3;
- (int64_t)tabBarStyleForWidth:(double)a3;
- (int64_t)userInterfaceIdiomOverride;
- (void)_setAdditionalPurchaseParameters:(id)a3;
- (void)_setApplicationController:(id)a3;
- (void)_setPurchaseAffiliateIdentifier:(id)a3;
- (void)_setPurchaseURLBagType:(int64_t)a3;
- (void)_setScriptAppContext:(id)a3;
- (void)_setValue:(id)a3 forConfigurationKey:(id)a4;
- (void)clientInterface:(id)a3 dispatchOnPageResponseWithData:(id)a4 response:(id)a5;
- (void)clientInterface:(id)a3 dispatchXEvent:(id)a4 completionBlock:(id)a5;
- (void)clientInterface:(id)a3 presentDialog:(id)a4;
- (void)customizePurchase:(id)a3;
- (void)customizeSoftwarePurchase:(id)a3;
- (void)dealloc;
- (void)getDefaultMetricsControllerWithCompletionBlock:(id)a3;
- (void)loadValueForConfigurationKey:(id)a3 completionBlock:(id)a4;
- (void)pushNavigationHistoryPageIdentifier:(id)a3;
- (void)sendAppPreviewStateChanged:(BOOL)a3;
- (void)sendApplicationDidEnterBackground;
- (void)sendApplicationWillEnterForeground;
- (void)sendApplicationWindowSizeDidUpdate:(CGSize)a3;
- (void)sendOnPageResponseWithDocument:(id)a3 data:(id)a4 URLResponse:(id)a5 performanceMetrics:(id)a6;
- (void)sendOnXEventWithDictionary:(id)a3 completionBlock:(id)a4;
- (void)setMetricsConfigurationIdentifier:(id)a3;
- (void)setMetricsPageContext:(id)a3 forViewController:(id)a4;
- (void)setNavigationHistoryPersistenceKey:(id)a3;
- (void)setPurchaseReferrerURL:(id)a3;
- (void)setUserInterfaceIdiomOverride:(int64_t)a3;
@end

@implementation SKUIClientContext

- (SKUIClientContext)initWithConfigurationDictionary:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIClientContext initWithConfigurationDictionary:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIClientContext;
  v5 = [(SKUIClientContext *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    bundle = v5->_bundle;
    v5->_bundle = (NSBundle *)v6;

    v8 = (SUClientInterface *)objc_alloc_init(MEMORY[0x1E4FB88A0]);
    clientInterface = v5->_clientInterface;
    v5->_clientInterface = v8;

    [(SUClientInterface *)v5->_clientInterface setDelegate:v5];
    uint64_t v10 = [v4 copy];
    configurationDictionary = v5->_configurationDictionary;
    v5->_configurationDictionary = (NSDictionary *)v10;

    v5->_userInterfaceIdiomOverride = 0x7FFFFFFFFFFFFFFFLL;
    v12 = objc_alloc_init(SKUIClientContextViewControllerFactory);
    [(SUClientInterface *)v5->_clientInterface setViewControllerFactory:v12];
    v13 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    placeholderImageCache = v5->_placeholderImageCache;
    v5->_placeholderImageCache = v13;

    [(NSCache *)v5->_placeholderImageCache setName:@"com.apple.StoreKitUI.SKUIClientContext.placeholderImageCache"];
  }

  return v5;
}

- (void)dealloc
{
  [(SUClientInterface *)self->_clientInterface setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIClientContext;
  [(SKUIClientContext *)&v3 dealloc];
}

+ (id)defaultContext
{
  objc_super v3 = [MEMORY[0x1E4FA8100] defaultStore];
  id v4 = [v3 activeAccount];

  v5 = SSVStoreFrontIdentifierForAccount();
  if (!v5)
  {
    v13 = 0;
    goto LABEL_19;
  }
  uint64_t v6 = [a1 _cachePathForStoreFrontIdentifier:v5];
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v6];
    if (v7) {
      goto LABEL_15;
    }
  }
  v8 = [MEMORY[0x1E4F28B50] mainBundle];
  v9 = [v8 pathForResource:@"SKUIStoreConfigurations" ofType:@"plist"];

  if (v9)
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v9];
    v11 = [v10 objectForKey:v5];
    if (!v11)
    {
      uint64_t v12 = [v5 rangeOfString:@","];
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = 0;
      }
      else
      {
        v14 = [v5 substringToIndex:v12];
        v11 = [v10 objectForKey:v14];
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v11;
    }
    else {
      id v7 = 0;
    }

    if (v7)
    {
LABEL_15:
      v13 = (void *)[objc_alloc((Class)a1) initWithConfigurationDictionary:v7];
      if (v13)
      {
        uint64_t v15 = [v5 copy];
        objc_super v16 = (void *)v13[16];
        v13[16] = v15;
      }
      goto LABEL_18;
    }
  }
  else
  {
    id v7 = 0;
  }
  v13 = 0;
LABEL_18:

LABEL_19:

  return v13;
}

- (id)additionalLeftBarButtonItemForDocumentContainerViewController:(id)a3
{
  return 0;
}

- (id)additionalRightBarButtonItemForDocumentContainerViewController:(id)a3
{
  return 0;
}

- (id)additionalLeftBarButtonItemForViewController:(id)a3
{
  return 0;
}

- (id)additionalRightBarButtonItemForViewController:(id)a3
{
  return 0;
}

- (id)documentViewControllerForTemplateViewElement:(id)a3
{
  return 0;
}

- (BOOL)storeViewController:(id)a3 shouldDisplayDefaultDarButton:(int64_t)a4
{
  return 1;
}

- (BOOL)shouldForceTransientSearchControllerBahavior
{
  return 0;
}

- (void)getDefaultMetricsControllerWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = [(SKUIClientContext *)self URLBag];
  uint64_t v6 = *MEMORY[0x1E4FA88F8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__SKUIClientContext_getDefaultMetricsControllerWithCompletionBlock___block_invoke;
  v8[3] = &unk_1E642A790;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 loadValueForKey:v6 completionBlock:v8];
}

void __68__SKUIClientContext_getDefaultMetricsControllerWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v3 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SKUIClientContext_getDefaultMetricsControllerWithCompletionBlock___block_invoke_2;
  block[3] = &unk_1E64266D0;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __68__SKUIClientContext_getDefaultMetricsControllerWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  id v8 = *(id *)(a1 + 32);
  v2 = [*(id *)(a1 + 40) metricsConfigurationIdentifier];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) objectForKey:v2];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;

      id v8 = v4;
    }
  }
  v5 = (void *)[objc_alloc(MEMORY[0x1E4FA8208]) initWithGlobalConfiguration:v8];
  if (v5)
  {
    id v6 = [[SKUIMetricsController alloc] initWithGlobalConfiguration:v5];
    [(SKUIMetricsController *)v6 setTopic:@"xp_its_main"];
    id v7 = SSVDefaultUserAgent();
    [(SKUIMetricsController *)v6 setUserAgent:v7];
  }
  else
  {
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)localizedAlertWithError:(id)a3
{
  return 0;
}

- (id)localizedStringForKey:(id)a3
{
  return [(SKUIClientContext *)self localizedStringForKey:a3 inTable:0];
}

- (id)localizedStringForKey:(id)a3 inTable:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  localizedStrings = self->_localizedStrings;
  if (!localizedStrings)
  {
    uint64_t v9 = [(NSDictionary *)self->_configurationDictionary objectForKey:@"locale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [SKUILocalizedStringDictionary alloc];
      v16[0] = self->_bundle;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      uint64_t v12 = [(SKUILocalizedStringDictionary *)v10 initWithLocaleName:v9 bundles:v11];
      v13 = self->_localizedStrings;
      self->_localizedStrings = v12;
    }
    localizedStrings = self->_localizedStrings;
  }
  v14 = [(SKUILocalizedStringDictionary *)localizedStrings localizedStringForKey:v6 inTable:v7];

  return v14;
}

+ (id)localizedStringForKey:(id)a3 inBundles:(id)a4
{
  return (id)[a1 localizedStringForKey:a3 inBundles:a4 inTable:0];
}

+ (id)localizedStringForKey:(id)a3 inBundles:(id)a4 inTable:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    id v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v16[0] = v10;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  }
  v11 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v12 = [v11 localeIdentifier];

  v13 = [[SKUILocalizedStringDictionary alloc] initWithLocaleName:v12 bundles:v8];
  v14 = [(SKUILocalizedStringDictionary *)v13 localizedStringForKey:v7 inTable:v9];

  return v14;
}

- (id)metricsPageContextForViewController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    do
    {
      v5 = v4;
      id v6 = [(NSMapTable *)self->_metricsPageContexts objectForKey:v4];
      id v4 = [v4 parentViewController];
    }
    while (v4 && !v6);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)modalDocumentViewControllerForDocument:(id)a3 options:(id)a4
{
  return 0;
}

- (NSArray)navigationHistory
{
  v2 = [(SKUIClientContext *)self _navigationHistory];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (id)newLegacyStorePageViewControllerForURLResponse:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB8900]);
  [v4 setClientInterface:self->_clientInterface];
  return v4;
}

- (id)previewViewControllerForViewElement:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 attributes];
  id v6 = [v5 objectForKey:@"data-preview-id"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 length]
    || ([MEMORY[0x1E4F1CB18] standardUserDefaults],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 BOOLForKey:@"AllowPreviewForAllElements"],
        v7,
        v8))
  {
    id v9 = objc_alloc_init(SKUIPreviewContainerViewController);
    id v10 = [[SKUIClientContextPreviewContainer alloc] initWithAppContext:self->_scriptAppContext clientContext:self previewContainerViewController:v9];
    v13 = @"previewContainer";
    v14[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [v4 dispatchEvent:@"preview" eventAttribute:@"onpreview" canBubble:1 isCancelable:1 extraInfo:v11 completionBlock:0];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)pushNavigationHistoryPageIdentifier:(id)a3
{
  id v6 = a3;
  id v4 = [(SKUIClientContext *)self _navigationHistory];
  if ([v4 count] == 5) {
    [v4 removeObjectAtIndex:0];
  }
  [v4 addObject:v6];
  if (self->_navigationHistoryPersistenceKey)
  {
    v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v5 setObject:v4 forKey:self->_navigationHistoryPersistenceKey];
    [v5 synchronize];
  }
}

- (void)setMetricsPageContext:(id)a3 forViewController:(id)a4
{
  id v6 = a3;
  objc_initWeak(&location, a4);
  metricsPageContexts = self->_metricsPageContexts;
  if (v6)
  {
    if (!metricsPageContexts)
    {
      int v8 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
      id v9 = self->_metricsPageContexts;
      self->_metricsPageContexts = v8;

      metricsPageContexts = self->_metricsPageContexts;
    }
    id v10 = objc_loadWeakRetained(&location);
    [(NSMapTable *)metricsPageContexts setObject:v6 forKey:v10];
  }
  else
  {
    id v10 = objc_loadWeakRetained(&location);
    [(NSMapTable *)metricsPageContexts removeObjectForKey:v10];
  }

  objc_destroyWeak(&location);
}

- (BOOL)supportsRenderingVersion:(unsigned int)a3
{
  if (a3 == 0x80000) {
    return 1;
  }
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v5 = [v4 bundleIdentifier];
  char v6 = [v5 isEqualToString:@"com.apple.Music"];

  return v6;
}

- (id)tabBarItemsForStyle:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = [(SKUIClientContext *)self valueForConfigurationKey:@"tabs"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a3
      || ([v4 objectForKey:@"compact"], (v5 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v5 = [v4 objectForKey:@"standard"];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = v4;
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v18 = v5;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            v13 = objc_msgSend(v12, "objectForKey:", @"id", v18);
            if (v13)
            {
              v14 = [[SKUITabBarItem alloc] initWithTabIdentifier:v13];
              uint64_t v15 = [v12 objectForKey:@"url"];
              if (v15)
              {
                objc_super v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v15];
                [(SKUITabBarItem *)v14 setRootURL:v16];
              }
              [v6 addObject:v14];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v9);
      }

      v5 = v18;
      id v4 = v19;
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (SSURLBag)URLBag
{
  urlBag = self->_urlBag;
  if (!urlBag)
  {
    id v4 = [MEMORY[0x1E4FA8300] contextWithBagType:0];
    v5 = SSVDefaultUserAgent();
    [v4 setValue:v5 forHTTPHeaderField:*MEMORY[0x1E4FA8698]];

    id v6 = [(SSURLBag *)[SKUIURLBag alloc] initWithURLBagContext:v4];
    id v7 = self->_urlBag;
    self->_urlBag = v6;

    urlBag = self->_urlBag;
  }

  return (SSURLBag *)urlBag;
}

- (id)valueForConfigurationKey:(id)a3
{
  return [(NSDictionary *)self->_configurationDictionary objectForKey:a3];
}

- (SKUITrendingSearchProvider)trendingSearchProvider
{
  trendingSearchProvider = self->_trendingSearchProvider;
  if (!trendingSearchProvider)
  {
    id v4 = [[SKUITrendingSearchProvider alloc] initWithClientContext:self];
    v5 = self->_trendingSearchProvider;
    self->_trendingSearchProvider = v4;

    trendingSearchProvider = self->_trendingSearchProvider;
  }

  return trendingSearchProvider;
}

- (NSOperationQueue)resourceLoadQueue
{
  resourceLoadQueue = self->_resourceLoadQueue;
  if (!resourceLoadQueue)
  {
    id v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    v5 = self->_resourceLoadQueue;
    self->_resourceLoadQueue = v4;

    [(NSOperationQueue *)self->_resourceLoadQueue setName:@"com.apple.StoreKitUI.SKUIClientContext.resourceLoadQueue"];
    [(NSOperationQueue *)self->_resourceLoadQueue setMaxConcurrentOperationCount:8];
    resourceLoadQueue = self->_resourceLoadQueue;
  }

  return resourceLoadQueue;
}

- (void)clientInterface:(id)a3 dispatchOnPageResponseWithData:(id)a4 response:(id)a5
{
}

- (void)clientInterface:(id)a3 dispatchXEvent:(id)a4 completionBlock:(id)a5
{
}

- (void)clientInterface:(id)a3 presentDialog:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v6)
  {
    dialogController = self->_dialogController;
    if (!dialogController)
    {
      uint64_t v8 = objc_alloc_init(SKUIStoreDialogController);
      uint64_t v9 = self->_dialogController;
      self->_dialogController = v8;

      dialogController = self->_dialogController;
    }
    [(SKUIStoreDialogController *)dialogController presentDialog:v6];
  }
}

- (id)scriptInterfaceForClientInterface:(id)a3
{
  id v3 = [(SKUIClientContext *)self _applicationController];
  id v4 = [v3 delegate];
  if (objc_opt_respondsToSelector())
  {
    v5 = [v4 legacyScriptInterfaceForApplication:v3];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_fallbackConfigurationDictionary
{
  return 0;
}

- (void)customizePurchase:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSString *)self->_additionalPurchaseParameters length])
  {
    v5 = [v4 buyParameters];
    if (v5)
    {
      id v6 = [NSString stringWithFormat:@"%@&%@", v5, self->_additionalPurchaseParameters];
      [v4 setBuyParameters:v6];
    }
  }
  purchaseReferrerURL = self->_purchaseReferrerURL;
  if (purchaseReferrerURL)
  {
    uint64_t v8 = [(SKUIURL *)purchaseReferrerURL referrerApplicationName];
    [v4 setValue:v8 forDownloadProperty:*MEMORY[0x1E4FA8600]];
    uint64_t v9 = [(SKUIURL *)self->_purchaseReferrerURL referrerURLString];
    [v4 setValue:v9 forDownloadProperty:*MEMORY[0x1E4FA8608]];
    id v10 = [v4 buyParameters];
    v11 = v10;
    if (v10 && v8 | v9)
    {
      uint64_t v12 = (void *)[v10 mutableCopy];
      if (v8)
      {
        v13 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
        v14 = [(id)v8 stringByAddingPercentEncodingWithAllowedCharacters:v13];
        [v12 appendFormat:@"&extRefApp=%@", v14];
      }
      if (v9)
      {
        uint64_t v15 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
        objc_super v16 = [(id)v9 stringByAddingPercentEncodingWithAllowedCharacters:v15];
        [v12 appendFormat:@"&extRefUrl=%@", v16];
      }
      [v4 setBuyParameters:v12];
    }
  }
  if (self->_purchaseAffiliateIdentifier) {
    objc_msgSend(v4, "setAffiliateIdentifier:");
  }
  v17 = [v4 requestProperties];
  id v18 = (id)[v17 mutableCopy];

  if (!v18) {
    id v18 = objc_alloc_init(MEMORY[0x1E4FA8268]);
  }
  if (self->_purchaseURLBagType) {
    objc_msgSend(v18, "setURLBagType:");
  }
  v19 = [MEMORY[0x1E4FB87F0] currentClient];
  long long v20 = [v19 clientProvidedHeaders];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v21 = [v20 allKeys];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        v27 = [v20 objectForKeyedSubscript:v26];
        [v18 setValue:v27 forHTTPHeaderField:v26];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v23);
  }

  [v4 setRequestProperties:v18];
}

- (void)customizeSoftwarePurchase:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSString *)self->_additionalPurchaseParameters length])
  {
    v5 = [v4 buyParameters];
    if (v5)
    {
      id v6 = [NSString stringWithFormat:@"%@&%@", v5, self->_additionalPurchaseParameters];
      [v4 setBuyParameters:v6];
    }
  }
  purchaseReferrerURL = self->_purchaseReferrerURL;
  if (purchaseReferrerURL)
  {
    uint64_t v8 = [(SKUIURL *)purchaseReferrerURL referrerApplicationName];
    uint64_t v9 = [(SKUIURL *)self->_purchaseReferrerURL referrerApplicationName];
    [v4 setReferrerName:v9];

    uint64_t v10 = [(SKUIURL *)self->_purchaseReferrerURL referrerURLString];
    [v4 setReferrerURL:v10];
    v11 = [v4 buyParameters];
    uint64_t v12 = v11;
    if (v11 && v8 | v10)
    {
      v13 = (void *)[v11 mutableCopy];
      if (v8)
      {
        v14 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
        uint64_t v15 = [(id)v8 stringByAddingPercentEncodingWithAllowedCharacters:v14];
        [v13 appendFormat:@"&extRefApp=%@", v15];
      }
      if (v10)
      {
        objc_super v16 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
        v17 = [(id)v10 stringByAddingPercentEncodingWithAllowedCharacters:v16];
        [v13 appendFormat:@"&extRefUrl=%@", v17];
      }
      [v4 setBuyParameters:v13];
    }
  }
  if (self->_purchaseAffiliateIdentifier) {
    objc_msgSend(v4, "setAffiliateIdentifier:");
  }
  id v18 = objc_opt_new();
  v19 = [MEMORY[0x1E4FB87F0] currentClient];
  long long v20 = [v19 clientProvidedHeaders];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v21 = [v20 allKeys];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        v27 = [v20 objectForKeyedSubscript:v26];
        [v18 setValue:v27 forKey:v26];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v23);
  }

  [v4 setAdditionalHeaders:v18];
}

- (BOOL)isManagedAppleID
{
  v2 = [MEMORY[0x1E4FA8100] defaultStore];
  id v3 = [v2 activeAccount];
  char v4 = [v3 isManagedAppleID];

  return v4;
}

- (BOOL)isMultiUser
{
  v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  char v3 = [v2 isMultiUser];

  return v3;
}

- (void)loadValueForConfigurationKey:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SKUIClientContext *)self valueForConfigurationKey:v6];
  if (v8)
  {
    if (v7)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__SKUIClientContext_loadValueForConfigurationKey_completionBlock___block_invoke;
      block[3] = &unk_1E6423A78;
      id v17 = v7;
      id v16 = v8;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v9 = [(SKUIClientContext *)self URLBag];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__SKUIClientContext_loadValueForConfigurationKey_completionBlock___block_invoke_2;
    v10[3] = &unk_1E642A7E0;
    v10[4] = self;
    id v11 = v6;
    objc_copyWeak(&v13, &location);
    id v12 = v7;
    [v9 loadWithCompletionBlock:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

uint64_t __66__SKUIClientContext_loadValueForConfigurationKey_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __66__SKUIClientContext_loadValueForConfigurationKey_completionBlock___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = a2;
    id v7 = [(id)objc_opt_class() _configurationDictionaryWithBagDictionary:v6];
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = [v7 objectForKey:a1[5]];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__SKUIClientContext_loadValueForConfigurationKey_completionBlock___block_invoke_3;
  v13[3] = &unk_1E642A7B8;
  id v14 = v8;
  id v9 = v8;
  objc_copyWeak(&v19, a1 + 7);
  id v15 = a1[5];
  id v10 = a1[6];
  id v17 = v5;
  id v18 = v10;
  id v16 = v7;
  id v11 = v5;
  id v12 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v13);

  objc_destroyWeak(&v19);
}

uint64_t __66__SKUIClientContext_loadValueForConfigurationKey_completionBlock___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained _setValue:*(void *)(a1 + 32) forConfigurationKey:*(void *)(a1 + 40)];
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    char v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (Class)moviePlayerViewControllerClass
{
  uint64_t v2 = SKUIMediaPlayerFramework();

  return (Class)SKUIWeakLinkedClassForString(&cfstr_Mpmovieplayerv.isa, v2);
}

- (SSVPlatformContext)platformContext
{
  char v3 = [(SKUIURLBag *)self->_urlBag existingBagDictionary];
  if (v3)
  {
    char v4 = (void *)[objc_alloc(MEMORY[0x1E4FA8348]) initWithBagDictionary:v3];
  }
  else
  {
    id v5 = [(SKUIClientContext *)self URLBag];
    [v5 loadWithCompletionBlock:&__block_literal_global_62];

    char v4 = 0;
  }

  return (SSVPlatformContext *)v4;
}

- (BOOL)isBootstrapScriptFallbackDisabled
{
  uint64_t v2 = [(SKUIClientContext *)self existingBagValueForKey:@"bootstrap-script-fallback-disabled"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)existingBagValueForKey:(id)a3
{
  urlBag = self->_urlBag;
  id v4 = a3;
  id v5 = [(SKUIURLBag *)urlBag existingBagDictionary];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)newLoadStoreURLOperationWithURL:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F18DA8];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithURL:v5];

  id v7 = [(SKUIClientContext *)self newLoadStoreURLOperationWithURLRequest:v6];
  return v7;
}

- (id)newLoadStoreURLOperationWithURLRequest:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FA8338];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithURLRequest:v5];

  id v7 = [(SKUIClientContext *)self URLBag];
  [v6 configureWithURLBag:v7];

  [v6 setITunesStoreRequest:1];
  [v6 setMachineDataStyle:2];
  uint64_t v8 = [(SKUIClientContext *)self SAPSessionForVersion:0];
  [v6 setSAPSession:v8];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FA8360]) initWithPolicyType:1];
  [v6 setSAPSignaturePolicy:v9];

  return v6;
}

- (id)SAPSessionForVersion:(int64_t)a3
{
  if (a3 == 1) {
    [MEMORY[0x1E4FA8328] sharedPrimeSession];
  }
  else {
  char v3 = [MEMORY[0x1E4FA8328] sharedDefaultSession];
  }

  return v3;
}

- (void)sendApplicationDidEnterBackground
{
}

void __54__SKUIClientContext_sendApplicationDidEnterBackground__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 objectForKeyedSubscript:@"itms"];
  id v3 = [v2 toObjectOfClass:objc_opt_class()];

  [v3 sendApplicationDidEnterBackground];
}

- (void)sendApplicationWillEnterForeground
{
}

void __55__SKUIClientContext_sendApplicationWillEnterForeground__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 objectForKeyedSubscript:@"itms"];
  id v3 = [v2 toObjectOfClass:objc_opt_class()];

  [v3 sendApplicationWillEnterForeground];
}

- (void)sendOnPageResponseWithDocument:(id)a3 data:(id)a4 URLResponse:(id)a5 performanceMetrics:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  scriptAppContext = self->_scriptAppContext;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __88__SKUIClientContext_sendOnPageResponseWithDocument_data_URLResponse_performanceMetrics___block_invoke;
  v19[3] = &unk_1E6424AF8;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [(IKAppContext *)scriptAppContext evaluate:v19 completionBlock:0];
}

void __88__SKUIClientContext_sendOnPageResponseWithDocument_data_URLResponse_performanceMetrics___block_invoke(void *a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"itms"];
  id v4 = [v3 toObjectOfClass:objc_opt_class()];

  [v4 sendOnPageResponseWithDocument:a1[4] data:a1[5] URLResponse:a1[6] performanceMetrics:a1[7]];
}

- (void)sendOnXEventWithDictionary:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->_scriptAppContext;
  if (v8)
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    char v16 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__SKUIClientContext_sendOnXEventWithDictionary_completionBlock___block_invoke;
    v12[3] = &unk_1E642A808;
    id v14 = v15;
    id v13 = v6;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__SKUIClientContext_sendOnXEventWithDictionary_completionBlock___block_invoke_2;
    v9[3] = &unk_1E642A830;
    id v10 = v7;
    id v11 = v15;
    [(IKAppContext *)v8 evaluate:v12 completionBlock:v9];

    _Block_object_dispose(v15, 8);
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __64__SKUIClientContext_sendOnXEventWithDictionary_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"itms"];
  id v4 = [v3 toObjectOfClass:objc_opt_class()];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 sendOnXEventWithDictionary:*(void *)(a1 + 32)];
}

uint64_t __64__SKUIClientContext_sendOnXEventWithDictionary_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  }
  return result;
}

- (void)sendAppPreviewStateChanged:(BOOL)a3
{
  scriptAppContext = self->_scriptAppContext;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__SKUIClientContext_sendAppPreviewStateChanged___block_invoke;
  v4[3] = &__block_descriptor_33_e19_v16__0__JSContext_8l;
  BOOL v5 = a3;
  [(IKAppContext *)scriptAppContext evaluate:v4 completionBlock:0];
}

void __48__SKUIClientContext_sendAppPreviewStateChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"itms"];
  id v4 = [v3 toObjectOfClass:objc_opt_class()];

  [v4 sendAppPreviewStateChanged:*(unsigned __int8 *)(a1 + 32)];
}

- (void)sendApplicationWindowSizeDidUpdate:(CGSize)a3
{
  scriptAppContext = self->_scriptAppContext;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__SKUIClientContext_sendApplicationWindowSizeDidUpdate___block_invoke;
  v4[3] = &__block_descriptor_48_e19_v16__0__JSContext_8l;
  CGSize v5 = a3;
  [(IKAppContext *)scriptAppContext evaluate:v4 completionBlock:0];
}

void __56__SKUIClientContext_sendApplicationWindowSizeDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"itms"];
  id v4 = [v3 toObjectOfClass:objc_opt_class()];

  objc_msgSend(v4, "sendApplicationWindowSizeDidUpdate:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (int64_t)tabBarStyleForWidth:(double)a3
{
  if (SKUIUserInterfaceIdiom(self) != 1) {
    return 0;
  }
  if (SKUICompactThreshold_onceToken != -1) {
    dispatch_once(&SKUICompactThreshold_onceToken, &__block_literal_global_504);
  }
  return *(double *)&SKUICompactThreshold_threshold < a3;
}

+ (NSString)_cachePath
{
  uint64_t v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v3 = [v2 firstObject];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28B50] mainBundle];
    CGSize v5 = [v4 bundleIdentifier];
    id v6 = [v3 stringByAppendingPathComponent:v5];

    id v3 = [v6 stringByAppendingPathComponent:@"SKUIClientContext"];
  }

  return (NSString *)v3;
}

+ (id)_cachePathForStoreFrontIdentifier:(id)a3
{
  id v4 = a3;
  CGSize v5 = [a1 _cachePath];
  if (v5)
  {
    id v6 = [v4 stringByAppendingPathExtension:@"plist"];
    id v7 = [v5 stringByAppendingPathComponent:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)_configurationDictionaryWithBagDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"language"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CGSize v5 = [MEMORY[0x1E4F1CA60] dictionary];
    [v5 setObject:v4 forKey:@"locale"];
    id v6 = [v3 objectForKey:@"isScheduledGiftingEnabled"];
    if ((objc_opt_respondsToSelector() & 1) != 0 && ([v6 BOOLValue] & 1) == 0) {
      [v5 setObject:MEMORY[0x1E4F1CC28] forKey:@"cgift"];
    }
    id v7 = [v3 objectForKey:@"isBuyingScheduledGiftCertificateEnabled"];

    if ((objc_opt_respondsToSelector() & 1) != 0 && ([v7 BOOLValue] & 1) == 0) {
      [v5 setObject:MEMORY[0x1E4F1CC28] forKey:@"mgift"];
    }
    uint64_t v8 = [v3 objectForKey:@"storefront-header-suffix"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v5 setObject:v8 forKey:@"sfsuffix"];
    }
    id v9 = [v3 objectForKey:@"itml-store"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v5;
      id v11 = v9;
    }
    else
    {
      id v11 = &stru_1F1C879E8;
      id v10 = v5;
    }
    [v10 setObject:v11 forKey:@"appjs.v2"];
    id v12 = [v3 objectForKey:@"has-in-apps-notice"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v5 setObject:v12 forKey:@"inappnote"];
    }
    id v13 = [v3 objectForKey:@"tabs"];
    if (v13) {
      [v5 setObject:v13 forKey:@"tabs"];
    }
    id v14 = [v3 objectForKey:@"isSponsoredAdsEnabled"];
    if (v14) {
      [v5 setObject:v14 forKey:@"isSponsoredAdsEnabled"];
    }
  }
  else
  {
    CGSize v5 = 0;
  }

  return v5;
}

- (void)_setAdditionalPurchaseParameters:(id)a3
{
  if (self->_additionalPurchaseParameters != a3)
  {
    id v4 = (NSString *)[a3 copy];
    additionalPurchaseParameters = self->_additionalPurchaseParameters;
    self->_additionalPurchaseParameters = v4;
    MEMORY[0x1F41817F8](v4, additionalPurchaseParameters);
  }
}

- (void)_setPurchaseAffiliateIdentifier:(id)a3
{
  if (self->_purchaseAffiliateIdentifier != a3)
  {
    id v4 = (NSString *)[a3 copy];
    purchaseAffiliateIdentifier = self->_purchaseAffiliateIdentifier;
    self->_purchaseAffiliateIdentifier = v4;
    MEMORY[0x1F41817F8](v4, purchaseAffiliateIdentifier);
  }
}

- (void)_setPurchaseURLBagType:(int64_t)a3
{
  self->_purchaseURLBagType = a3;
}

- (void)_setValue:(id)a3 forConfigurationKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = (id)[(NSDictionary *)self->_configurationDictionary mutableCopy];
  if (!v7) {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  [v7 setObject:v11 forKey:v6];
  uint64_t v8 = (NSDictionary *)[v7 copy];
  configurationDictionary = self->_configurationDictionary;
  self->_configurationDictionary = v8;

  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:@"SKUIClientContextConfigurationDidChangeNotification" object:self];
}

- (id)_navigationHistory
{
  navigationHistory = self->_navigationHistory;
  if (!navigationHistory)
  {
    if (!self->_navigationHistoryPersistenceKey) {
      goto LABEL_6;
    }
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    CGSize v5 = [v4 arrayForKey:self->_navigationHistoryPersistenceKey];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = (NSMutableArray *)[v5 mutableCopy];
      id v7 = self->_navigationHistory;
      self->_navigationHistory = v6;
    }
    navigationHistory = self->_navigationHistory;
    if (!navigationHistory)
    {
LABEL_6:
      uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v9 = self->_navigationHistory;
      self->_navigationHistory = v8;

      navigationHistory = self->_navigationHistory;
    }
  }

  return navigationHistory;
}

- (NSString)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SKUIClientContext;
  id v4 = [(SKUIClientContext *)&v7 description];
  CGSize v5 = [v3 stringWithFormat:@"%@: [%@]", v4, self->_storeFrontIdentifier];

  return (NSString *)v5;
}

- (SKUIApplicationController)_applicationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationController);

  return (SKUIApplicationController *)WeakRetained;
}

- (void)_setApplicationController:(id)a3
{
}

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (NSDictionary)configurationDictionary
{
  return self->_configurationDictionary;
}

- (NSString)metricsConfigurationIdentifier
{
  return self->_metricsConfigurationIdentifier;
}

- (void)setMetricsConfigurationIdentifier:(id)a3
{
}

- (NSString)navigationHistoryPersistenceKey
{
  return self->_navigationHistoryPersistenceKey;
}

- (void)setNavigationHistoryPersistenceKey:(id)a3
{
}

- (SKUIURL)purchaseReferrerURL
{
  return self->_purchaseReferrerURL;
}

- (void)setPurchaseReferrerURL:(id)a3
{
}

- (IKAppContext)_scriptAppContext
{
  return self->_scriptAppContext;
}

- (void)_setScriptAppContext:(id)a3
{
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (int64_t)userInterfaceIdiomOverride
{
  return self->_userInterfaceIdiomOverride;
}

- (void)setUserInterfaceIdiomOverride:(int64_t)a3
{
  self->_userInterfaceIdiomOverride = a3;
}

- (NSCache)placeholderImageCache
{
  return self->_placeholderImageCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImageCache, 0);
  objc_storeStrong((id *)&self->_resourceLoadQueue, 0);
  objc_storeStrong((id *)&self->_trendingSearchProvider, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_scriptAppContext, 0);
  objc_storeStrong((id *)&self->_purchaseReferrerURL, 0);
  objc_storeStrong((id *)&self->_purchaseAffiliateIdentifier, 0);
  objc_storeStrong((id *)&self->_navigationHistoryPersistenceKey, 0);
  objc_storeStrong((id *)&self->_navigationHistory, 0);
  objc_storeStrong((id *)&self->_metricsPageContexts, 0);
  objc_storeStrong((id *)&self->_metricsConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedStrings, 0);
  objc_storeStrong((id *)&self->_dialogController, 0);
  objc_storeStrong((id *)&self->_configurationDictionary, 0);
  objc_storeStrong((id *)&self->_clientInterface, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_destroyWeak((id *)&self->_applicationController);

  objc_storeStrong((id *)&self->_additionalPurchaseParameters, 0);
}

- (void)initWithConfigurationDictionary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIClientContext initWithConfigurationDictionary:]";
}

@end