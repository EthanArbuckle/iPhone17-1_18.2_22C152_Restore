@interface SKUILoadTrendingSearchPageOperation
- (NSURL)pageURL;
- (SKUIClientContext)clientContext;
- (SKUILoadTrendingSearchPageOperation)initWithClientContext:(id)a3 pageURL:(id)a4 outputBlock:(id)a5;
- (id)outputBlock;
- (void)main;
@end

@implementation SKUILoadTrendingSearchPageOperation

- (SKUILoadTrendingSearchPageOperation)initWithClientContext:(id)a3 pageURL:(id)a4 outputBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUILoadTrendingSearchPageOperation initWithClientContext:pageURL:outputBlock:]();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUILoadTrendingSearchPageOperation;
  v12 = [(SKUILoadTrendingSearchPageOperation *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientContext, a3);
    objc_storeStrong((id *)&v13->_pageURL, a4);
    uint64_t v14 = [v11 copy];
    id outputBlock = v13->_outputBlock;
    v13->_id outputBlock = (id)v14;
  }
  return v13;
}

- (void)main
{
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__72;
  v24[4] = __Block_byref_object_dispose__72;
  id v25 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__72;
  v22 = __Block_byref_object_dispose__72;
  id v23 = [(SKUILoadTrendingSearchPageOperation *)self pageURL];
  if (!v19[5])
  {
    v3 = [(SKUIClientContext *)self->_clientContext URLBag];

    if (v3)
    {
      dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
      v5 = [(SKUIClientContext *)self->_clientContext URLBag];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __43__SKUILoadTrendingSearchPageOperation_main__block_invoke;
      v14[3] = &unk_1E6428CA8;
      v16 = &v18;
      objc_super v17 = v24;
      v6 = v4;
      v15 = v6;
      [v5 loadValueForKey:@"trending-searches" completionBlock:v14];

      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__72;
  v12[4] = __Block_byref_object_dispose__72;
  id v13 = 0;
  if (v19[5])
  {
    id v7 = objc_alloc(MEMORY[0x1E4FA8338]);
    v8 = (void *)[v7 initWithURL:v19[5]];
    id v9 = +[SSVURLDataConsumer consumer];
    [v8 setDataConsumer:v9];

    id v10 = [(SKUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
    [v8 setStoreFrontSuffix:v10];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__SKUILoadTrendingSearchPageOperation_main__block_invoke_2;
    v11[3] = &unk_1E6428CD0;
    v11[4] = v12;
    v11[5] = v24;
    [v8 setOutputBlock:v11];
    [v8 main];
  }
  (*((void (**)(void))self->_outputBlock + 2))();
  _Block_object_dispose(v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v24, 8);
}

void __43__SKUILoadTrendingSearchPageOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CB10] URLWithString:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __43__SKUILoadTrendingSearchPageOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (id)outputBlock
{
  return self->_outputBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithClientContext:pageURL:outputBlock:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUILoadTrendingSearchPageOperation initWithClientContext:pageURL:outputBlock:]";
}

@end