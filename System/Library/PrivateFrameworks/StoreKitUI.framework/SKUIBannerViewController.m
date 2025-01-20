@interface SKUIBannerViewController
- (NSDictionary)scriptContextDictionary;
- (NSOperationQueue)resourceOperationQueue;
- (SKUIBannerViewDelegate)delegate;
- (SKUIClientContext)clientContext;
- (id)_iconImage;
- (id)_itemArtworkContext;
- (id)_itemState;
- (id)_screenshotConsumerWithSize:(CGSize)a3;
- (void)_bannerViewAction:(id)a3;
- (void)_closeButtonAction:(id)a3;
- (void)_finishWithResponse:(id)a3 error:(id)a4;
- (void)_launchApp;
- (void)_launchURL:(id)a3 withBundleIdentifier:(id)a4;
- (void)_loadImages;
- (void)_reloadBannerView;
- (void)_setIcon:(id)a3 error:(id)a4;
- (void)_setScreenshot:(id)a3 forIndex:(int64_t)a4 error:(id)a5;
- (void)_warmItemStateCenter;
- (void)dealloc;
- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4;
- (void)loadView;
- (void)loadWithProductParameters:(id)a3 mainDocumentURL:(id)a4;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setResourceOperationQueue:(id)a3;
- (void)setScriptContextDictionary:(id)a3;
@end

@implementation SKUIBannerViewController

- (void)dealloc
{
  v3 = [(SKUIBannerView *)self->_bannerView closeButton];
  [v3 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  v4 = [(SKUIBannerView *)self->_bannerView itemOfferButton];
  [v4 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  [(SKUIItemStateCenter *)self->_itemStateCenter removeObserver:self];
  v5.receiver = self;
  v5.super_class = (Class)SKUIBannerViewController;
  [(SKUIBannerViewController *)&v5 dealloc];
}

- (void)loadWithProductParameters:(id)a3 mainDocumentURL:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIBannerViewController loadWithProductParameters:mainDocumentURL:]();
  }
  id v8 = objc_alloc(MEMORY[0x1E4FA8350]);
  v9 = [(SKUIClientContext *)self->_clientContext platformContext];
  v10 = (void *)[v8 initWithPlatformContext:v9];

  v11 = [(SKUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
  [v10 setStoreFrontSuffix:v11];

  v12 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v13 = [v12 userInterfaceIdiom] == 1;

  v14 = (void *)MEMORY[0x1E4FA86D8];
  if (!v13) {
    v14 = (void *)MEMORY[0x1E4FA86D0];
  }
  [v10 setKeyProfile:*v14];
  [v10 setMainDocumentURL:v7];
  [v10 setShouldSuppressUserInfo:1];
  [v10 setAttribution:1];
  v15 = [v6 objectForKey:*MEMORY[0x1E4F3C3A8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [v15 stringValue];

    v15 = (void *)v16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25[0] = v15;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    [v10 setItemIdentifiers:v17];

    self->_itemIdentifier = [v15 longLongValue];
  }
  objc_initWeak(&location, self);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __70__SKUIBannerViewController_loadWithProductParameters_mainDocumentURL___block_invoke;
  v22 = &unk_1E64240D8;
  objc_copyWeak(&v23, &location);
  [v10 setResponseBlock:&v19];
  v18 = [(SKUIBannerViewController *)self resourceOperationQueue];
  [v18 addOperation:v10];

  [(SKUIBannerViewController *)self _warmItemStateCenter];
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __70__SKUIBannerViewController_loadWithProductParameters_mainDocumentURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SKUIBannerViewController_loadWithProductParameters_mainDocumentURL___block_invoke_2;
  block[3] = &unk_1E6423FF8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __70__SKUIBannerViewController_loadWithProductParameters_mainDocumentURL___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _finishWithResponse:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (NSOperationQueue)resourceOperationQueue
{
  resourceOperationQueue = self->_resourceOperationQueue;
  if (!resourceOperationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    id v5 = self->_resourceOperationQueue;
    self->_resourceOperationQueue = v4;

    [(NSOperationQueue *)self->_resourceOperationQueue setMaxConcurrentOperationCount:1];
    resourceOperationQueue = self->_resourceOperationQueue;
  }

  return resourceOperationQueue;
}

- (void)setClientContext:(id)a3
{
  id v5 = (SKUIClientContext *)a3;
  if (self->_clientContext != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    [(SKUIBannerView *)self->_bannerView setClientContext:self->_clientContext];
    id v5 = v6;
  }
}

- (void)loadView
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIBannerViewController loadView]";
}

- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__SKUIBannerViewController_itemStateCenter_itemStatesChanged___block_invoke;
  v7[3] = &unk_1E6421FF8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __62__SKUIBannerViewController_itemStateCenter_itemStatesChanged___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 1008))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v2 = *(id *)(a1 + 40);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          id v8 = objc_msgSend(v7, "itemIdentifier", (void)v11);
          uint64_t v9 = [v8 longLongValue];
          uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 1016);

          if (v9 == v10)
          {
            [*(id *)(*(void *)(a1 + 32) + 976) setItemState:v7];
            goto LABEL_12;
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)_bannerViewAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SKUIBannerViewController *)self _itemState];
  char v6 = [v5 state];

  if ((v6 & 4) != 0)
  {
    [(SKUIBannerViewController *)self _launchApp];
  }
  else
  {
    uint64_t v11 = 0;
    long long v12 = &v11;
    uint64_t v13 = 0x3032000000;
    long long v14 = __Block_byref_object_copy__6;
    v15 = __Block_byref_object_dispose__6;
    id v16 = [(SSLookupItem *)self->_item productPageURL];
    if (v12[5])
    {
      id v7 = [(NSDictionary *)self->_scriptContextDictionary objectForKey:@"affiliateData"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = (void *)[MEMORY[0x1E4F1CB10] copyDictionaryForQueryString:v7 unescapedValues:1];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __46__SKUIBannerViewController__bannerViewAction___block_invoke;
        v10[3] = &unk_1E6424100;
        v10[4] = &v11;
        [v8 enumerateKeysAndObjectsUsingBlock:v10];
      }
      uint64_t v9 = [MEMORY[0x1E4FB1438] sharedApplication];
      [v9 openURL:v12[5] options:MEMORY[0x1E4F1CC08] completionHandler:0];
    }
    _Block_object_dispose(&v11, 8);
  }
}

uint64_t __46__SKUIBannerViewController__bannerViewAction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) URLByAppendingQueryParameter:a2 value:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void *)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return MEMORY[0x1F41817F8](v4, v6);
}

- (void)_closeButtonAction:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 bannerViewDidClose:self];
  }
}

- (void)_finishWithResponse:(id)a3 error:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v12)
  {
    id v7 = [v12 allItems];
    if ([v7 count] == 1)
    {
      id v8 = [v7 objectAtIndex:0];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  objc_storeStrong((id *)&self->_item, v8);
  [(SKUIBannerViewController *)self _reloadBannerView];
  [(SKUIBannerViewController *)self _loadImages];
  if (!self->_item)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 bannerView:self didFailWithError:v6];
    }
  }
}

- (id)_iconImage
{
  uint64_t v3 = self->_iconImage;
  if (!v3)
  {
    uint64_t v4 = [(SKUIBannerViewController *)self _itemArtworkContext];
    uint64_t v5 = [SKUIItem alloc];
    id v6 = [(SSLookupItem *)self->_item lookupDictionary];
    id v7 = [(SKUIItem *)v5 initWithLookupDictionary:v6];
    uint64_t v3 = [v4 placeholderImageForItem:v7];
  }

  return v3;
}

- (id)_itemState
{
  if (self->_itemIdentifier < 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    [(SKUIBannerViewController *)self _warmItemStateCenter];
    uint64_t v3 = [(SKUIItemStateCenter *)self->_itemStateCenter stateForItemWithIdentifier:self->_itemIdentifier];
  }

  return v3;
}

- (void)_launchApp
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSDictionary *)self->_scriptContextDictionary objectForKey:@"app-argument"];
  if (!v3)
  {
    uint64_t v3 = [(NSDictionary *)self->_scriptContextDictionary objectForKey:@"applicationLaunchArgument"];
  }
  if ([v3 length]) {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v3];
  }
  else {
    uint64_t v4 = 0;
  }
  if (self->_itemIdentifier)
  {
    uint64_t v5 = (void *)[objc_alloc(NSNumber) initWithLongLong:self->_itemIdentifier];
    id v6 = objc_alloc_init(MEMORY[0x1E4FA82E0]);
    v10[0] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __38__SKUIBannerViewController__launchApp__block_invoke;
    v8[3] = &unk_1E6423CF8;
    v8[4] = self;
    id v9 = v4;
    [v6 getLibraryItemsForITunesStoreItemIdentifiers:v7 completionBlock:v8];
  }
  else
  {
    [(SKUIBannerViewController *)self _launchURL:v4 withBundleIdentifier:0];
  }
}

void __38__SKUIBannerViewController__launchApp__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 count] == 1)
  {
    uint64_t v3 = [v5 objectAtIndex:0];
    uint64_t v4 = [v3 valueForProperty:*MEMORY[0x1E4FA8928]];
  }
  else
  {
    uint64_t v4 = 0;
  }
  [*(id *)(a1 + 32) _launchURL:*(void *)(a1 + 40) withBundleIdentifier:v4];
}

- (void)_launchURL:(id)a3 withBundleIdentifier:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    if (v9)
    {
      id v8 = v9;
      SKUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptions((uint64_t)v7, (uint64_t)v8, 0, 0, 0);
      CFRelease(v8);
    }
    else
    {
      SKUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptions((uint64_t)v7, 0, 0, 0, 0);
    }
    CFRelease(v7);
  }
  else
  {
    SKUIMetricsOpenURL(v9);
  }
}

- (void)_loadImages
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    double v4 = 75.0;
  }
  else {
    double v4 = 64.0;
  }
  id v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 scale];
  double v7 = v6;

  [(SSLookupItem *)self->_item artwork];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v80 objects:v86 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v81;
LABEL_6:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v81 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v80 + 1) + 8 * v10);
      if ([v11 width] == (uint64_t)(v4 * v7)) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [obj countByEnumeratingWithState:&v80 objects:v86 count:16];
        if (v8) {
          goto LABEL_6;
        }
        goto LABEL_12;
      }
    }
    id v57 = v11;

    if (v57) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_12:
  }
  if ([obj count]
    && ([obj objectAtIndex:0], (id v57 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_16:
    id v12 = [(SKUIBannerViewController *)self _itemArtworkContext];
    uint64_t v13 = [SKUIItem alloc];
    long long v14 = [(SSLookupItem *)self->_item lookupDictionary];
    v15 = [(SKUIItem *)v13 initWithLookupDictionary:v14];
    id v16 = [v12 dataConsumerForItem:v15];

    id v17 = objc_alloc(MEMORY[0x1E4FA8338]);
    v18 = [v57 URL];
    uint64_t v19 = (void *)[v17 initWithURL:v18];

    [v19 setDataConsumer:v16];
    [v19 setITunesStoreRequest:0];
    uint64_t v20 = [(SKUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
    [v19 setStoreFrontSuffix:v20];

    objc_initWeak(location, self);
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __39__SKUIBannerViewController__loadImages__block_invoke;
    v78[3] = &unk_1E6424128;
    objc_copyWeak(&v79, location);
    [v19 setOutputBlock:v78];
    v21 = [(SKUIBannerViewController *)self resourceOperationQueue];
    [v21 addOperation:v19];

    objc_destroyWeak(&v79);
    objc_destroyWeak(location);
  }
  else
  {
    id v57 = 0;
  }
  v22 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v23 = [v22 userInterfaceIdiom] == 1;

  if (v23)
  {
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    screenshotImages = self->_screenshotImages;
    self->_screenshotImages = v25;

    v27 = [(SSLookupItem *)self->_item lookupDictionary];
    v56 = [v27 objectForKey:*MEMORY[0x1E4FA87E0]];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v55 = [v56 objectForKey:*MEMORY[0x1E4FA87C8]];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v60 = v55;
        uint64_t v28 = [v60 countByEnumeratingWithState:&v74 objects:v85 count:16];
        if (v28)
        {
          uint64_t v61 = *(void *)v75;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v75 != v61) {
                objc_enumerationMutation(v60);
              }
              v30 = *(void **)(*((void *)&v74 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v31 = [MEMORY[0x1E4FB1BA8] mainScreen];
                [v31 scale];
                BOOL v33 = v32 == 2.0;

                if (v33) {
                  double v34 = 148.0;
                }
                else {
                  double v34 = 34.0;
                }
                if (v33) {
                  double v35 = 83.0;
                }
                else {
                  double v35 = 60.0;
                }
                if (v33) {
                  double v36 = 180.0;
                }
                else {
                  double v36 = 82.0;
                }
                long long v72 = 0u;
                long long v73 = 0u;
                if (v33) {
                  double v37 = 135.0;
                }
                else {
                  double v37 = 62.0;
                }
                long long v70 = 0uLL;
                long long v71 = 0uLL;
                id v38 = v30;
                uint64_t v39 = [v38 countByEnumeratingWithState:&v70 objects:v84 count:16];
                if (v39)
                {
                  uint64_t v40 = *(void *)v71;
                  do
                  {
                    for (uint64_t j = 0; j != v39; ++j)
                    {
                      if (*(void *)v71 != v40) {
                        objc_enumerationMutation(v38);
                      }
                      v42 = [[SKUIArtwork alloc] initWithArtworkDictionary:*(void *)(*((void *)&v70 + 1) + 8 * j)];
                      uint64_t v43 = [(SKUIArtwork *)v42 width];
                      double v44 = (double)[(SKUIArtwork *)v42 height];
                      BOOL v45 = v36 == (double)v43 && v37 == v44;
                      if (v45 || (v34 == (double)v43 ? (BOOL v46 = v35 == v44) : (BOOL v46 = 0), v46)) {
                        objc_msgSend(v24, "addObject:", v42, v55);
                      }
                    }
                    uint64_t v39 = [v38 countByEnumeratingWithState:&v70 objects:v84 count:16];
                  }
                  while (v39);
                }
              }
            }
            uint64_t v28 = [v60 countByEnumeratingWithState:&v74 objects:v85 count:16];
          }
          while (v28);
        }
      }
    }
    v47 = [(SKUIBannerViewController *)self resourceOperationQueue];
    v48 = -[SKUIBannerViewController _screenshotConsumerWithSize:](self, "_screenshotConsumerWithSize:", 100.0, 75.0);
    v49 = -[SKUIBannerViewController _screenshotConsumerWithSize:](self, "_screenshotConsumerWithSize:", 56.0, 75.0);
    v50 = [(SKUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
    location[0] = 0;
    location[1] = location;
    location[2] = (id)0x2020000000;
    location[3] = (id)0x4076200000000000;
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __39__SKUIBannerViewController__loadImages__block_invoke_3;
    v62[3] = &unk_1E64241A0;
    id v51 = v49;
    id v63 = v51;
    id v52 = v48;
    id v64 = v52;
    v68 = location;
    id v53 = v50;
    id v65 = v53;
    v66 = self;
    id v54 = v47;
    id v67 = v54;
    [v24 enumerateObjectsUsingBlock:v62];
    [(SKUIBannerView *)self->_bannerView setScreenshotImages:self->_screenshotImages];

    _Block_object_dispose(location, 8);
  }
}

void __39__SKUIBannerViewController__loadImages__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SKUIBannerViewController__loadImages__block_invoke_2;
  block[3] = &unk_1E6423FF8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __39__SKUIBannerViewController__loadImages__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setIcon:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

void __39__SKUIBannerViewController__loadImages__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 width];
  uint64_t v7 = [v5 height];
  uint64_t v8 = 40;
  if (v6 >= v7)
  {
    double v9 = 100.0;
  }
  else
  {
    uint64_t v8 = 32;
    double v9 = 56.0;
  }
  id v10 = *(id *)(a1 + v8);
  if (v9 < *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    id v11 = objc_alloc(MEMORY[0x1E4FA8338]);
    id v12 = [v5 URL];
    uint64_t v13 = (void *)[v11 initWithURL:v12];

    [v13 setDataConsumer:v10];
    [v13 setITunesStoreRequest:0];
    [v13 setStoreFrontSuffix:*(void *)(a1 + 48)];
    objc_initWeak(&location, *(id *)(a1 + 56));
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __39__SKUIBannerViewController__loadImages__block_invoke_4;
    v17[3] = &unk_1E6424178;
    objc_copyWeak(v18, &location);
    v18[1] = a3;
    [v13 setOutputBlock:v17];
    [*(id *)(a1 + 64) addOperation:v13];
    *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                            + 24)
                                                                - (v9
                                                                 + 15.0);
    long long v14 = *(void **)(*(void *)(a1 + 56) + 1040);
    v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.8 alpha:1.0];
    id v16 = [v10 imageForColor:v15];
    [v14 addObject:v16];

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
}

void __39__SKUIBannerViewController__loadImages__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__SKUIBannerViewController__loadImages__block_invoke_5;
  v9[3] = &unk_1E6424150;
  objc_copyWeak(v12, (id *)(a1 + 32));
  v12[1] = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(v12);
}

void __39__SKUIBannerViewController__loadImages__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setScreenshot:*(void *)(a1 + 32) forIndex:*(void *)(a1 + 56) error:*(void *)(a1 + 40)];
}

- (void)_reloadBannerView
{
  item = self->_item;
  if (item)
  {
    bannerView = self->_bannerView;
    id v5 = [(SSLookupItem *)item artistName];
    [(SKUIBannerView *)bannerView setArtistName:v5];

    id v6 = self->_bannerView;
    id v7 = [(SKUIBannerViewController *)self _iconImage];
    [(SKUIBannerView *)v6 setIconImage:v7];

    [(SKUIBannerView *)self->_bannerView setScreenshotImages:self->_screenshotImages];
    id v8 = self->_bannerView;
    double v9 = [(SSLookupItem *)self->_item displayName];
    [(SKUIBannerView *)v8 setTitle:v9];

    id v10 = self->_bannerView;
    [(SSLookupItem *)self->_item userRating];
    *(float *)&double v12 = v11 / 5.0;
    [(SKUIBannerView *)v10 setUserRating:v12];
    id v19 = [(SSLookupItem *)self->_item offers];
    uint64_t v13 = [v19 count];
    long long v14 = self->_bannerView;
    if (v13)
    {
      v15 = [v19 objectAtIndex:0];
      [(SKUIBannerView *)v14 setItemOffer:v15];
    }
    else
    {
      [(SKUIBannerView *)self->_bannerView setItemOffer:0];
    }
    id v16 = [(SSLookupItem *)self->_item ITunesStoreIdentifier];
    self->_itemIdentifier = [v16 longLongValue];

    id v17 = self->_bannerView;
    v18 = [(SKUIBannerViewController *)self _itemState];
    [(SKUIBannerView *)v17 setItemState:v18];
  }
}

- (id)_screenshotConsumerWithSize:(CGSize)a3
{
  return +[SKUIScreenshotDataConsumer consumerWithScreenshotSize:](SKUIScreenshotDataConsumer, "consumerWithScreenshotSize:", a3.width, a3.height);
}

- (void)_setIcon:(id)a3 error:(id)a4
{
  objc_storeStrong((id *)&self->_iconImage, a3);
  id v6 = a3;
  bannerView = self->_bannerView;
  id v8 = [(SKUIBannerViewController *)self _iconImage];
  [(SKUIBannerView *)bannerView setIconImage:v8];
}

- (void)_setScreenshot:(id)a3 forIndex:(int64_t)a4 error:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  if (v9 && [(NSMutableArray *)self->_screenshotImages count] > (unint64_t)a4)
  {
    [(NSMutableArray *)self->_screenshotImages replaceObjectAtIndex:a4 withObject:v9];
    [(SKUIBannerView *)self->_bannerView setScreenshotImages:self->_screenshotImages];
  }
}

- (void)_warmItemStateCenter
{
  if (!self->_itemStateCenter)
  {
    uint64_t v3 = +[SKUIItemStateCenter defaultCenter];
    itemStateCenter = self->_itemStateCenter;
    self->_itemStateCenter = v3;

    id v5 = self->_itemStateCenter;
    [(SKUIItemStateCenter *)v5 addObserver:self];
  }
}

- (id)_itemArtworkContext
{
  itemArtworkContext = self->_itemArtworkContext;
  if (!itemArtworkContext)
  {
    double v4 = objc_alloc_init(SKUIItemArtworkContext);
    id v5 = self->_itemArtworkContext;
    self->_itemArtworkContext = v4;

    id v6 = self->_itemArtworkContext;
    id v7 = +[SKUIStyledImageDataConsumer safariBannerIconConsumer];
    [(SKUIItemArtworkContext *)v6 setIconConsumer:v7];

    id v8 = self->_itemArtworkContext;
    id v9 = +[SKUIProductImageDataConsumer smartBannerConsumer];
    [(SKUIItemArtworkContext *)v8 setGeneralConsumer:v9];

    id v10 = self->_itemArtworkContext;
    float v11 = +[SKUIStyledImageDataConsumer safariBannerProductImageConsumer];
    [(SKUIItemArtworkContext *)v10 setNewsstandConsumer:v11];

    itemArtworkContext = self->_itemArtworkContext;
  }

  return itemArtworkContext;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SKUIBannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIBannerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setResourceOperationQueue:(id)a3
{
}

- (NSDictionary)scriptContextDictionary
{
  return self->_scriptContextDictionary;
}

- (void)setScriptContextDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemArtworkContext, 0);
  objc_storeStrong((id *)&self->_scriptContextDictionary, 0);
  objc_storeStrong((id *)&self->_screenshotImages, 0);
  objc_storeStrong((id *)&self->_resourceOperationQueue, 0);
  objc_storeStrong((id *)&self->_itemStateCenter, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);

  objc_storeStrong((id *)&self->_bannerView, 0);
}

- (void)loadWithProductParameters:mainDocumentURL:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIBannerViewController loadWithProductParameters:mainDocumentURL:]";
}

@end