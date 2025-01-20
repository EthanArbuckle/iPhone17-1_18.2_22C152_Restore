@interface SKUILoadProductPageOperation
- (SKUILoadProductPageOperation)initWithItemIdentifier:(int64_t)a3 clientContext:(id)a4;
- (SKUILoadProductPageOperation)initWithProductPageURLRequest:(id)a3 clientContext:(id)a4;
- (SSMetricsPageEvent)metricsPageEvent;
- (id)_initSKUILoadProductPageOperation;
- (id)outputBlock;
- (void)_initSKUILoadProductPageOperation;
- (void)main;
- (void)setOutputBlock:(id)a3;
@end

@implementation SKUILoadProductPageOperation

- (id)_initSKUILoadProductPageOperation
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUILoadProductPageOperation _initSKUILoadProductPageOperation]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUILoadProductPageOperation;
  v3 = [(SKUILoadProductPageOperation *)&v7 init];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.StoreKitUI.SKUILoadProductPageOperation", 0);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (SKUILoadProductPageOperation)initWithItemIdentifier:(int64_t)a3 clientContext:(id)a4
{
  id v7 = a4;
  v8 = [(SKUILoadProductPageOperation *)self _initSKUILoadProductPageOperation];
  v9 = (SKUILoadProductPageOperation *)v8;
  if (v8)
  {
    objc_storeStrong(v8 + 31, a4);
    v9->_itemID = a3;
  }

  return v9;
}

- (SKUILoadProductPageOperation)initWithProductPageURLRequest:(id)a3 clientContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SKUILoadProductPageOperation *)self _initSKUILoadProductPageOperation];
  v9 = (SKUILoadProductPageOperation *)v8;
  if (v8)
  {
    objc_storeStrong(v8 + 31, a4);
    uint64_t v10 = [v6 copy];
    urlRequest = v9->_urlRequest;
    v9->_urlRequest = (NSURLRequest *)v10;
  }
  return v9;
}

- (SSMetricsPageEvent)metricsPageEvent
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__70;
  uint64_t v10 = __Block_byref_object_dispose__70;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__SKUILoadProductPageOperation_metricsPageEvent__block_invoke;
  v5[3] = &unk_1E6422538;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SSMetricsPageEvent *)v3;
}

void __48__SKUILoadProductPageOperation_metricsPageEvent__block_invoke(uint64_t a1)
{
}

- (id)outputBlock
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5_1;
  uint64_t v10 = __Block_byref_object_dispose__6_1;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SKUILoadProductPageOperation_outputBlock__block_invoke;
  v5[3] = &unk_1E6422538;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __43__SKUILoadProductPageOperation_outputBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 280) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setOutputBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SKUILoadProductPageOperation_setOutputBlock___block_invoke;
  v7[3] = &unk_1E6423820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void *__47__SKUILoadProductPageOperation_setOutputBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 280) != result)
  {
    uint64_t v4 = [result copy];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 280);
    *(void *)(v5 + 280) = v4;
    return (void *)MEMORY[0x1F41817F8](v4, v6);
  }
  return result;
}

- (void)main
{
  v45[1] = *MEMORY[0x1E4F143B8];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__70;
  v43 = __Block_byref_object_dispose__70;
  id v44 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__70;
  v37 = __Block_byref_object_dispose__70;
  id v38 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__70;
  v31 = __Block_byref_object_dispose__70;
  v32 = self->_urlRequest;
  if (v28[5]) {
    goto LABEL_3;
  }
  uint64_t v3 = (void *)MEMORY[0x1C8749310]();
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", self->_itemID);
  id v5 = objc_alloc(MEMORY[0x1E4FA8350]);
  uint64_t v6 = [(SKUIClientContext *)self->_clientContext platformContext];
  id v7 = (void *)[v5 initWithPlatformContext:v6];

  v45[0] = v4;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  [v7 setItemIdentifiers:v8];

  [v7 setKeyProfile:*MEMORY[0x1E4FA86E0]];
  v9 = [(SKUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
  [v7 setStoreFrontSuffix:v9];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __36__SKUILoadProductPageOperation_main__block_invoke;
  v23[3] = &unk_1E6428828;
  id v10 = v4;
  id v24 = v10;
  v25 = &v27;
  v26 = &v39;
  [v7 setResponseBlock:v23];
  [v7 main];

  if (v28[5])
  {
LABEL_3:
    id v11 = (void *)MEMORY[0x1C8749310]();
    id v12 = objc_alloc(MEMORY[0x1E4FA8338]);
    v13 = (void *)[v12 initWithURLRequest:v28[5]];
    v14 = +[SSVURLDataConsumer consumer];
    [v13 setDataConsumer:v14];

    v15 = [(SKUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
    [v13 setStoreFrontSuffix:v15];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __36__SKUILoadProductPageOperation_main__block_invoke_2;
    v22[3] = &unk_1E6428978;
    v22[4] = &v39;
    v22[5] = &v33;
    [v13 setOutputBlock:v22];
    [v13 main];
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__SKUILoadProductPageOperation_main__block_invoke_3;
    block[3] = &unk_1E6421FF8;
    block[4] = self;
    id v21 = v13;
    id v17 = v13;
    dispatch_sync(dispatchQueue, block);
  }
  uint64_t v18 = [(SKUILoadProductPageOperation *)self outputBlock];
  v19 = (void *)v18;
  if (v18) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v18, v34[5], v40[5]);
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
}

void __36__SKUILoadProductPageOperation_main__block_invoke(void *a1, void *a2, void *a3)
{
  id v13 = a3;
  id v5 = [a2 itemForKey:a1[4]];
  uint64_t v6 = [v5 productPageURL];

  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F18DA8]) initWithURL:v6];
    uint64_t v8 = *(void *)(a1[5] + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  uint64_t v10 = [v13 copy];
  uint64_t v11 = *(void *)(a1[6] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

void __36__SKUILoadProductPageOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a3 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [v5 copy];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

uint64_t __36__SKUILoadProductPageOperation_main__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) metricsPageEvent];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 272);
  *(void *)(v3 + 272) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_metricsPageEvent, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)_initSKUILoadProductPageOperation
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUILoadProductPageOperation _initSKUILoadProductPageOperation]";
}

@end