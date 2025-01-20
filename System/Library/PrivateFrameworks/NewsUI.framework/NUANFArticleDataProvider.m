@interface NUANFArticleDataProvider
- (FCArticle)article;
- (FCContentContext)contentContext;
- (NFEventManager)eventManager;
- (NSArray)linkedContentProviders;
- (NSString)articleID;
- (NUANFArticleDataProvider)initWithArticle:(id)a3 contentContext:(id)a4 fontRegistration:(id)a5 host:(id)a6 embedDataManager:(id)a7 linkedContentManager:(id)a8;
- (NUANFAssetLoader)assetLoader;
- (NUANFContextLoader)contextLoader;
- (NUANFFontLoader)fontLoader;
- (NUEmbedDataManager)embedDataManger;
- (NUFontRegistration)fontRegistration;
- (NULinkedContentManager)linkedContentManager;
- (SXHost)host;
- (int64_t)relativePriority;
- (void)cancelAssetPrefetch;
- (void)dealloc;
- (void)loadArticleWithCompletionBlock:(id)a3;
- (void)loadContextWithCompletionBlock:(id)a3;
- (void)prefetchAssets;
- (void)reloadArticleIfNeeded;
- (void)setArticle:(id)a3;
- (void)setArticleID:(id)a3;
- (void)setAssetLoader:(id)a3;
- (void)setContextLoader:(id)a3;
- (void)setEmbedDataManger:(id)a3;
- (void)setEventManager:(id)a3;
- (void)setFontLoader:(id)a3;
- (void)setRelativePriority:(int64_t)a3;
- (void)setupAssetPrefetchCancellationWithOperation:(id)a3;
- (void)setupAssetPrefetchRequestEventsWithEvents:(id)a3;
@end

@implementation NUANFArticleDataProvider

void __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_21(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = NUArticleLoadLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) article];
    v4 = [v3 articleID];
    CFTimeInterval v5 = CACurrentMediaTime() - *(double *)(a1 + 48);
    int v6 = 138543618;
    v7 = v4;
    __int16 v8 = 2048;
    CFTimeInterval v9 = v5;
    _os_log_impl(&dword_2221C5000, v2, OS_LOG_TYPE_DEFAULT, "Article data loader did finish embed data, articleID=%{public}@, duration=%f", (uint8_t *)&v6, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_20(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = NUArticleLoadLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) article];
    v4 = [v3 articleID];
    CFTimeInterval v5 = CACurrentMediaTime() - *(double *)(a1 + 48);
    int v6 = 138543618;
    v7 = v4;
    __int16 v8 = 2048;
    CFTimeInterval v9 = v5;
    _os_log_impl(&dword_2221C5000, v2, OS_LOG_TYPE_DEFAULT, "Article data loader did finish loading fonts, articleID=%{public}@, duration=%f", (uint8_t *)&v6, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __59__NUANFArticleDataProvider_loadArticleWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  __int16 v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    if (v6)
    {
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __59__NUANFArticleDataProvider_loadArticleWithCompletionBlock___block_invoke_3;
      v45[3] = &unk_2645FF4D8;
      id v47 = *(id *)(a1 + 32);
      id v46 = v6;
      __59__NUANFArticleDataProvider_loadArticleWithCompletionBlock___block_invoke_3((uint64_t)v45);

      uint64_t v10 = v47;
    }
    else
    {
      v11 = [v5 headline];

      if (!v11)
      {
        uint64_t v33 = *(void *)(a1 + 32);
        v34 = objc_msgSend(MEMORY[0x263F087E8], "nu_errorArticleMissingHeadline:", v5);
        (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v34);

        goto LABEL_6;
      }
      v12 = [v5 headline];
      uint64_t v13 = [v12 contentType];

      if (v13 != 2)
      {
        uint64_t v35 = *(void *)(a1 + 32);
        v36 = (void *)MEMORY[0x263F087E8];
        v37 = [v5 headline];
        v38 = objc_msgSend(v36, "nu_errorArticleContentTypeUnsupported:", v37);
        (*(void (**)(uint64_t, void *))(v35 + 16))(v35, v38);

        goto LABEL_6;
      }
      v14 = [v5 headline];
      v15 = [v9 contentContext];
      v42 = [v14 contentWithContext:v15];

      v43 = [v42 anfContent];
      v16 = [NUArticleResourceURLTranslator alloc];
      v17 = [v9 contentContext];
      v18 = [v17 appConfigurationManager];
      v44 = [(NUArticleResourceURLTranslator *)v16 initWithAppConfigurationManager:v18];

      v39 = [NUANFContextLoader alloc];
      v41 = [v9 contentContext];
      v40 = [v41 flintResourceManager];
      v19 = [v9 contentContext];
      v20 = [v19 networkReachability];
      v21 = [v9 host];
      v22 = [v5 headline];
      v23 = [(NUANFContextLoader *)v39 initWithANFContent:v43 flintResourceManager:v40 networkReachability:v20 host:v21 resourceURLTranslator:v44 headline:v22];
      [v9 setContextLoader:v23];

      uint64_t v24 = [v9 relativePriority];
      v25 = [v9 contextLoader];
      [v25 setRelativePriority:v24];

      v26 = [NUANFFontLoader alloc];
      v27 = [v9 contentContext];
      v28 = [v27 flintResourceManager];
      v29 = [v9 fontRegistration];
      v30 = [(NUANFFontLoader *)v26 initWithANFContent:v43 flintResourceManager:v28 fontRegistration:v29];
      [v9 setFontLoader:v30];

      uint64_t v31 = [v9 relativePriority];
      v32 = [v9 fontLoader];
      [v32 setRelativePriority:v31];

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      uint64_t v10 = v42;
    }
  }
  else
  {
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __59__NUANFArticleDataProvider_loadArticleWithCompletionBlock___block_invoke_2;
    v48[3] = &unk_2645FE158;
    id v49 = *(id *)(a1 + 32);
    __59__NUANFArticleDataProvider_loadArticleWithCompletionBlock___block_invoke_2((uint64_t)v48);
    id v9 = v49;
  }
LABEL_6:
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (NUANFFontLoader)fontLoader
{
  return self->_fontLoader;
}

void __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = NUArticleLoadLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) article];
    id v6 = [v5 articleID];
    CFTimeInterval v7 = CACurrentMediaTime() - *(double *)(a1 + 56);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(CFTimeInterval *)&buf[14] = v7;
    _os_log_impl(&dword_2221C5000, v4, OS_LOG_TYPE_DEFAULT, "Article data loader did finish loading model, articleID=%{public}@, duration=%f", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v9 = WeakRetained;
  if (!WeakRetained)
  {
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_14;
    v59[3] = &unk_2645FE158;
    id v60 = *(id *)(a1 + 40);
    __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_14((uint64_t)v59);
    v11 = v60;
    goto LABEL_16;
  }
  id v10 = WeakRetained;
  v11 = v10;
  if (v3)
  {
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_2;
    v56[3] = &unk_2645FF4D8;
    id v58 = *(id *)(a1 + 40);
    id v57 = v3;
    __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_2((uint64_t)v56);

    goto LABEL_16;
  }
  v12 = [v10 contextLoader];
  if (![v12 hasLoaded]
    || ([v11 fontLoader], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_15;
  }
  v14 = [v11 embedDataManger];
  BOOL v15 = v14 == 0;

  if (v15)
  {
LABEL_15:
    v29 = dispatch_group_create();
    dispatch_group_enter(v29);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v62 = __Block_byref_object_copy__1;
    v63 = __Block_byref_object_dispose__1;
    id v64 = 0;
    v30 = [v11 contextLoader];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_17;
    v51[3] = &unk_2645FF528;
    v51[4] = v11;
    uint64_t v31 = v29;
    uint64_t v54 = *(void *)(a1 + 56);
    v52 = v31;
    v53 = buf;
    id v32 = (id)[v30 loadContextWithCompletion:v51];

    dispatch_group_enter(v31);
    uint64_t v33 = [v11 fontLoader];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_20;
    v48[3] = &unk_2645FF550;
    void v48[4] = v11;
    uint64_t v50 = *(void *)(a1 + 56);
    v34 = v31;
    id v49 = v34;
    id v35 = (id)[v33 loadFontsWithCompletion:v48];

    dispatch_group_enter(v34);
    v36 = [v11 embedDataManger];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_21;
    v45[3] = &unk_2645FF550;
    void v45[4] = v11;
    uint64_t v47 = *(void *)(a1 + 56);
    v37 = v34;
    id v46 = v37;
    [v36 loadEmbedDataWithCompletion:v45];

    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_22;
    v41[3] = &unk_2645FF5A0;
    v41[4] = v11;
    v44[1] = *(id *)(a1 + 56);
    objc_copyWeak(v44, (id *)(a1 + 48));
    id v42 = *(id *)(a1 + 40);
    v43 = buf;
    v41[5] = *(void *)(a1 + 32);
    dispatch_group_notify(v37, MEMORY[0x263EF83A0], v41);

    objc_destroyWeak(v44);
    _Block_object_dispose(buf, 8);

    goto LABEL_16;
  }
  v16 = NUArticleLoadLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [v11 article];
    v18 = [v17 articleID];
    CFTimeInterval v19 = CACurrentMediaTime() - *(double *)(a1 + 56);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2048;
    *(CFTimeInterval *)&buf[14] = v19;
    _os_log_impl(&dword_2221C5000, v16, OS_LOG_TYPE_DEFAULT, "Article data loader did finish with prewarmed article, articleID=%{public}@, duration=%f", buf, 0x16u);
  }
  v20 = [v11 contextLoader];
  v21 = [v20 context];
  BOOL v22 = v21 == 0;

  if (v22)
  {
    uint64_t v38 = *(void *)(a1 + 40);
    v39 = (void *)MEMORY[0x263F087E8];
    v26 = [v11 article];
    v27 = [v11 contextLoader];
    v28 = [v27 contextError];
    v40 = objc_msgSend(v39, "nu_errorArticleDownloadFailed:underlyingError:", v26, v28);
    (*(void (**)(uint64_t, void, void, void *))(v38 + 16))(v38, 0, 0, v40);
  }
  else
  {
    v23 = [v11 contextLoader];
    uint64_t v24 = [v23 assetLoader];
    [v11 setAssetLoader:v24];

    uint64_t v25 = *(void *)(a1 + 40);
    v26 = [v11 contextLoader];
    v27 = [v26 context];
    v28 = [v11 fontLoader];
    (*(void (**)(uint64_t, void *, void *, void))(v25 + 16))(v25, v27, v28, 0);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_16;
  block[3] = &unk_2645FE4C8;
  block[4] = v11;
  dispatch_async(MEMORY[0x263EF83A0], block);
LABEL_16:
}

- (NUANFContextLoader)contextLoader
{
  return self->_contextLoader;
}

- (void)setFontLoader:(id)a3
{
}

- (void)setContextLoader:(id)a3
{
}

- (void)loadContextWithCompletionBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CFTimeInterval v5 = CACurrentMediaTime();
  id v6 = NUArticleLoadLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFTimeInterval v7 = [(NUANFArticleDataProvider *)self article];
    __int16 v8 = [v7 articleID];
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_2221C5000, v6, OS_LOG_TYPE_DEFAULT, "Article data loader did start loading, articleID=%{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke;
  v10[3] = &unk_2645FF5C8;
  v10[4] = self;
  v12[1] = *(id *)&v5;
  objc_copyWeak(v12, (id *)buf);
  id v9 = v4;
  id v11 = v9;
  [(NUANFArticleDataProvider *)self loadArticleWithCompletionBlock:v10];

  objc_destroyWeak(v12);
  objc_destroyWeak((id *)buf);
}

- (FCArticle)article
{
  return self->_article;
}

- (void)loadArticleWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  [(NUANFArticleDataProvider *)self reloadArticleIfNeeded];
  uint64_t v5 = [(NUANFArticleDataProvider *)self contextLoader];
  if (v5
    && (id v6 = (void *)v5,
        [(NUANFArticleDataProvider *)self fontLoader],
        CFTimeInterval v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    v4[2](v4, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    __int16 v8 = [(NUANFArticleDataProvider *)self article];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __59__NUANFArticleDataProvider_loadArticleWithCompletionBlock___block_invoke;
    v9[3] = &unk_2645FE310;
    objc_copyWeak(&v11, &location);
    id v10 = v4;
    [v8 performBlockWhenFullyLoaded:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)reloadArticleIfNeeded
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [(NUANFArticleDataProvider *)self article];
  id v4 = [v3 headline];

  if (v4)
  {
    id v5 = v4;
    if ([v5 needsRapidUpdates])
    {
      id v6 = [(NUANFArticleDataProvider *)self contentContext];
      CFTimeInterval v7 = [v6 networkReachability];
      char v8 = [v7 isNetworkReachable];

      if (v8)
      {
        id v9 = [v5 lastFetchedDate];
        objc_msgSend(v9, "fc_timeIntervalUntilNow");
        double v11 = v10;

        if (v11 > 30.0)
        {
          v12 = NUArticleLoadLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = [(NUANFArticleDataProvider *)self article];
            v14 = [v13 articleID];
            *(_DWORD *)buf = 138543362;
            v23 = v14;
            _os_log_impl(&dword_2221C5000, v12, OS_LOG_TYPE_DEFAULT, "Article data loader did reset for rapid updates, articleID=%{public}@", buf, 0xCu);
          }
          [(NUANFArticleDataProvider *)self setContextLoader:0];
          [(NUANFArticleDataProvider *)self setFontLoader:0];
          uint64_t v15 = [(NUANFArticleDataProvider *)self contentContext];
          v16 = [v15 articleController];
          v17 = [(NUANFArticleDataProvider *)self articleID];
          [(NUANFArticleDataProvider *)self relativePriority];
          v18 = objc_msgSend(v16, "articleWithID:forceArticleUpdate:qualityOfService:relativePriority:", v17, 1, FCInferQualityOfServiceFromRelativePriority(), -[NUANFArticleDataProvider relativePriority](self, "relativePriority"));
          [(NUANFArticleDataProvider *)self setArticle:v18];
        }
        else
        {
          v19[0] = MEMORY[0x263EF8330];
          v19[1] = 3221225472;
          v19[2] = __49__NUANFArticleDataProvider_reloadArticleIfNeeded__block_invoke_47;
          v19[3] = &unk_2645FE470;
          id v20 = v5;
          v21 = self;
          __49__NUANFArticleDataProvider_reloadArticleIfNeeded__block_invoke_47((uint64_t)v19);
        }
      }
      else
      {
        __49__NUANFArticleDataProvider_reloadArticleIfNeeded__block_invoke_3();
      }
    }
  }
}

- (NUANFArticleDataProvider)initWithArticle:(id)a3 contentContext:(id)a4 fontRegistration:(id)a5 host:(id)a6 embedDataManager:(id)a7 linkedContentManager:(id)a8
{
  v30[2] = *MEMORY[0x263EF8340];
  id v28 = a3;
  id v27 = a4;
  id v26 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)NUANFArticleDataProvider;
  v18 = [(NUANFArticleDataProvider *)&v29 init];
  CFTimeInterval v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_article, a3);
    objc_storeStrong((id *)&v19->_contentContext, a4);
    objc_storeStrong((id *)&v19->_fontRegistration, a5);
    objc_storeStrong((id *)&v19->_host, a6);
    objc_storeStrong((id *)&v19->_embedDataManger, a7);
    objc_storeStrong((id *)&v19->_linkedContentManager, a8);
    uint64_t v20 = objc_msgSend(v17, "linkedContentProviders", v26, v27, v28);
    linkedContentProviders = v19->_linkedContentProviders;
    v19->_linkedContentProviders = (NSArray *)v20;

    v19->_relativePriority = 0;
    BOOL v22 = (void *)MEMORY[0x263EFFA08];
    v30[0] = @"contextDidLoadEvent";
    v30[1] = @"assetPrefetchRequestEvent";
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
    uint64_t v24 = [v22 setWithArray:v23];
    [(NUANFArticleDataProvider *)v19 setupAssetPrefetchRequestEventsWithEvents:v24];
  }
  return v19;
}

- (void)setupAssetPrefetchRequestEventsWithEvents:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F59E58]);
  [(NUANFArticleDataProvider *)self setEventManager:v5];

  objc_initWeak(&location, self);
  id v6 = [(NUANFArticleDataProvider *)self eventManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__NUANFArticleDataProvider_setupAssetPrefetchRequestEventsWithEvents___block_invoke;
  v7[3] = &unk_2645FED68;
  objc_copyWeak(&v8, &location);
  [v6 triggerOnceWhenAllEventsHaveOccurred:v4 block:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)setEventManager:(id)a3
{
}

- (SXHost)host
{
  return self->_host;
}

- (NUFontRegistration)fontRegistration
{
  return self->_fontRegistration;
}

- (NFEventManager)eventManager
{
  return self->_eventManager;
}

- (NUEmbedDataManager)embedDataManger
{
  return self->_embedDataManger;
}

- (void)dealloc
{
  id v3 = [(NUANFArticleDataProvider *)self fontLoader];
  [v3 unregisterFontsWithCompletion:&__block_literal_global_13];

  v4.receiver = self;
  v4.super_class = (Class)NUANFArticleDataProvider;
  [(NUANFArticleDataProvider *)&v4 dealloc];
}

- (NSString)articleID
{
  v2 = [(NUANFArticleDataProvider *)self article];
  id v3 = [v2 articleID];

  return (NSString *)v3;
}

uint64_t __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

void __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_16(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) eventManager];
  [v1 fireEvent:@"contextDidLoadEvent"];
}

void __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_17(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    double v10 = NUArticleLoadLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = [*(id *)(a1 + 32) article];
      v12 = [v11 articleID];
      CFTimeInterval v13 = CACurrentMediaTime() - *(double *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      __int16 v19 = 2048;
      CFTimeInterval v20 = v13;
      _os_log_impl(&dword_2221C5000, v10, OS_LOG_TYPE_DEFAULT, "Article data loader did finish loading context, articleID=%{public}@, duration=%f", buf, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_2_18;
    v14[3] = &unk_2645FF500;
    v14[4] = *(void *)(a1 + 32);
    id v15 = v8;
    id v16 = *(id *)(a1 + 40);
    __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_2_18((uint64_t)v14);
  }
}

void __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_2_18(uint64_t a1)
{
  v2 = NUArticleLoadLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_2_18_cold_1(a1, v2);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_22(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = NUArticleLoadLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) article];
    objc_super v4 = [v3 articleID];
    CFTimeInterval v5 = CACurrentMediaTime() - *(double *)(a1 + 72);
    *(_DWORD *)buf = 138543618;
    BOOL v22 = v4;
    __int16 v23 = 2048;
    CFTimeInterval v24 = v5;
    _os_log_impl(&dword_2221C5000, v2, OS_LOG_TYPE_DEFAULT, "Article data loader start loading linked content, articleID=%{public}@, duration=%f", buf, 0x16u);
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_23;
  v18[3] = &unk_2645FF578;
  objc_copyWeak(v20, (id *)(a1 + 64));
  id v19 = *(id *)(a1 + 48);
  v20[1] = *(id *)(a1 + 72);
  id v6 = (void (**)(void))MEMORY[0x223C968A0](v18);
  id v7 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) documentController];
  char v8 = [v7 requiresLinkedContentForLayout];

  if ((v8 & 1) == 0)
  {
    v6[2](v6);

    id v6 = (void (**)(void))&__block_literal_global_27;
  }
  id v9 = [*(id *)(a1 + 32) linkedContentManager];
  char v10 = objc_opt_respondsToSelector();

  double v11 = [*(id *)(a1 + 32) linkedContentManager];
  [*(id *)(a1 + 32) article];
  if (v10) {
    v12 = {;
  }
    CFTimeInterval v13 = [v12 headline];
    v14 = [*(id *)(a1 + 32) contextLoader];
    id v15 = [v14 context];
    id v16 = (id)objc_msgSend(v11, "loadLinkedContentForHeadline:withContext:priority:completion:", v13, v15, objc_msgSend(*(id *)(a1 + 40), "relativePriority"), v6);
  }
  else {
    v12 = {;
  }
    CFTimeInterval v13 = [v12 headline];
    v14 = [*(id *)(a1 + 32) contextLoader];
    id v15 = [v14 context];
    id v17 = (id)[v11 loadLinkedContentForHeadline:v13 withContext:v15 completion:v6];
  }

  objc_destroyWeak(v20);
}

void __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_23(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    CFTimeInterval v5 = NUArticleLoadLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 article];
      id v7 = [v6 articleID];
      CFTimeInterval v8 = CACurrentMediaTime() - *(double *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      CFTimeInterval v24 = v7;
      __int16 v25 = 2048;
      CFTimeInterval v26 = v8;
      _os_log_impl(&dword_2221C5000, v5, OS_LOG_TYPE_DEFAULT, "Article data loader did finish, articleID=%{public}@, duration=%f", buf, 0x16u);
    }
    id v9 = [v4 contextLoader];
    char v10 = [v9 context];

    if (v10)
    {
      double v11 = [v4 contextLoader];
      v12 = [v11 assetLoader];
      [v4 setAssetLoader:v12];

      uint64_t v13 = *(void *)(a1 + 32);
      v14 = [v4 contextLoader];
      id v15 = [v14 context];
      id v16 = [v4 fontLoader];
      (*(void (**)(uint64_t, void *, void *, void))(v13 + 16))(v13, v15, v16, 0);
    }
    else
    {
      uint64_t v17 = *(void *)(a1 + 32);
      v18 = (void *)MEMORY[0x263F087E8];
      v14 = [v4 article];
      id v15 = [v4 contextLoader];
      id v16 = [v15 contextError];
      id v19 = objc_msgSend(v18, "nu_errorArticleDownloadFailed:underlyingError:", v14, v16);
      (*(void (**)(uint64_t, void, void, void *))(v17 + 16))(v17, 0, 0, v19);
    }
    CFTimeInterval v20 = [v4 eventManager];
    [v20 fireEvent:@"contextDidLoadEvent"];
  }
  else
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_2_24;
    v21[3] = &unk_2645FE158;
    id v22 = *(id *)(a1 + 32);
    __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_2_24((uint64_t)v21);
    id v4 = v22;
  }
}

uint64_t __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_2_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prefetchAssets
{
  id v3 = [MEMORY[0x263F08AB0] processInfo];
  char v4 = [v3 isLowPowerModeEnabled];

  if ((v4 & 1) == 0)
  {
    CFTimeInterval v5 = [MEMORY[0x263F59548] sharedNetworkReachability];
    char v6 = [v5 isLowDataModeEnabled];

    if ((v6 & 1) == 0)
    {
      id v7 = [(NUANFArticleDataProvider *)self eventManager];
      [v7 fireEvent:@"assetPrefetchRequestEvent"];
    }
  }
}

- (void)cancelAssetPrefetch
{
  id v2 = [(NUANFArticleDataProvider *)self eventManager];
  [v2 fireEvent:@"assetPrefetchCancelEvent"];
}

- (void)setRelativePriority:(int64_t)a3
{
  self->_relativePriority = a3;
  CFTimeInterval v5 = [(NUANFArticleDataProvider *)self contextLoader];
  [v5 setRelativePriority:a3];

  id v6 = [(NUANFArticleDataProvider *)self fontLoader];
  [v6 setRelativePriority:a3];
}

uint64_t __59__NUANFArticleDataProvider_loadArticleWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__NUANFArticleDataProvider_loadArticleWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __49__NUANFArticleDataProvider_reloadArticleIfNeeded__block_invoke_3()
{
  v0 = NUArticleLoadLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_2221C5000, v0, OS_LOG_TYPE_DEFAULT, "Article data loader did not reload rapid-updates because network is not reachable", v1, 2u);
  }
}

void __49__NUANFArticleDataProvider_reloadArticleIfNeeded__block_invoke_47(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = NUArticleLoadLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) lastFetchedDate];
    char v4 = [*(id *)(a1 + 40) article];
    CFTimeInterval v5 = [v4 articleID];
    int v6 = 138543618;
    id v7 = v3;
    __int16 v8 = 2114;
    id v9 = v5;
    _os_log_impl(&dword_2221C5000, v2, OS_LOG_TYPE_DEFAULT, "Article data loader will not reload rapid-updates article because it's up-to-date, fetchDate=%{public}@, articleID=%{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __70__NUANFArticleDataProvider_setupAssetPrefetchRequestEventsWithEvents___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    char v4 = NUArticleLoadLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      CFTimeInterval v5 = [v3 article];
      int v6 = [v5 articleID];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_2221C5000, v4, OS_LOG_TYPE_DEFAULT, "Article data loader will prefetch assets, articleID=%{public}@", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy__1;
    v14 = __Block_byref_object_dispose__1;
    id v15 = 0;
    id v7 = [v3 assetLoader];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __70__NUANFArticleDataProvider_setupAssetPrefetchRequestEventsWithEvents___block_invoke_51;
    v10[3] = &unk_2645FEE80;
    v10[4] = &buf;
    uint64_t v8 = [v7 loadAssetsWithCompletion:v10];
    id v9 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v8;

    [v3 setupAssetPrefetchCancellationWithOperation:*(void *)(*((void *)&buf + 1) + 40)];
    _Block_object_dispose(&buf, 8);
  }
}

void __70__NUANFArticleDataProvider_setupAssetPrefetchRequestEventsWithEvents___block_invoke_51(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)setupAssetPrefetchCancellationWithOperation:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  CFTimeInterval v5 = [(NUANFArticleDataProvider *)self eventManager];
  int v6 = [MEMORY[0x263EFFA08] setWithObject:@"assetPrefetchCancelEvent"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__NUANFArticleDataProvider_setupAssetPrefetchCancellationWithOperation___block_invoke;
  v7[3] = &unk_2645FF5F0;
  objc_copyWeak(&v8, &from);
  objc_copyWeak(&v9, &location);
  [v5 triggerOnceWhenAllEventsHaveOccurred:v6 block:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __72__NUANFArticleDataProvider_setupAssetPrefetchCancellationWithOperation___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained cancel];
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    CFTimeInterval v5 = v4;
    if (v4)
    {
      id v6 = v4;
      id v7 = NUArticleLoadLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [v6 article];
        id v9 = [v8 articleID];
        int v11 = 138543362;
        uint64_t v12 = v9;
        _os_log_impl(&dword_2221C5000, v7, OS_LOG_TYPE_DEFAULT, "Article data loader will cancel asset prefetch, articleID=%{public}@", (uint8_t *)&v11, 0xCu);
      }
      uint64_t v10 = [MEMORY[0x263EFFA08] setWithObject:@"assetPrefetchRequestEvent"];
      [v6 setupAssetPrefetchRequestEventsWithEvents:v10];
    }
  }
}

- (void)setArticle:(id)a3
{
}

- (NSArray)linkedContentProviders
{
  return self->_linkedContentProviders;
}

- (void)setArticleID:(id)a3
{
}

- (NUANFAssetLoader)assetLoader
{
  return self->_assetLoader;
}

- (void)setAssetLoader:(id)a3
{
}

- (void)setEmbedDataManger:(id)a3
{
}

- (NULinkedContentManager)linkedContentManager
{
  return self->_linkedContentManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedContentManager, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_embedDataManger, 0);
  objc_storeStrong((id *)&self->_assetLoader, 0);
  objc_storeStrong((id *)&self->_contextLoader, 0);
  objc_storeStrong((id *)&self->_fontLoader, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_fontRegistration, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_linkedContentProviders, 0);

  objc_storeStrong((id *)&self->_article, 0);
}

void __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_2_18_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = [*(id *)(a1 + 32) article];
  CFTimeInterval v5 = [v4 articleID];
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = 138543618;
  id v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_2221C5000, a2, OS_LOG_TYPE_ERROR, "Article data loader did fail loading context, articleID=%{public}@, error=%{public}@", (uint8_t *)&v7, 0x16u);
}

@end