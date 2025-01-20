@interface SKUIReloadConfigurationOperation
+ (NSString)cachePath;
- (SKUIReloadConfigurationOperation)init;
- (SSURLBag)URLBag;
- (id)outputBlock;
- (void)init;
- (void)main;
- (void)setOutputBlock:(id)a3;
- (void)setURLBag:(id)a3;
@end

@implementation SKUIReloadConfigurationOperation

- (SKUIReloadConfigurationOperation)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIReloadConfigurationOperation init]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIReloadConfigurationOperation;
  v3 = [(SKUIReloadConfigurationOperation *)&v7 init];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.StoreKitUI.SKUIReloadConfigurationOperation", 0);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

+ (NSString)cachePath
{
  v2 = [MEMORY[0x1E4FA8140] currentDevice];
  v3 = [v2 storeFrontIdentifier];

  dispatch_queue_t v4 = +[SKUIClientContext _cachePathForStoreFrontIdentifier:v3];

  return (NSString *)v4;
}

- (id)outputBlock
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__104;
  v10 = __Block_byref_object_dispose__104;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__SKUIReloadConfigurationOperation_outputBlock__block_invoke;
  v5[3] = &unk_1E6422538;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __47__SKUIReloadConfigurationOperation_outputBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 256) copy];
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
  v7[2] = __51__SKUIReloadConfigurationOperation_setOutputBlock___block_invoke;
  v7[3] = &unk_1E6423820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void *__51__SKUIReloadConfigurationOperation_setOutputBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 256) != result)
  {
    uint64_t v4 = [result copy];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 256);
    *(void *)(v5 + 256) = v4;
    return (void *)MEMORY[0x1F41817F8](v4, v6);
  }
  return result;
}

- (void)setURLBag:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__SKUIReloadConfigurationOperation_setURLBag___block_invoke;
  v7[3] = &unk_1E6421FF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __46__SKUIReloadConfigurationOperation_setURLBag___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  uint64_t v2 = (id *)(*(void *)(a1 + 32) + 264);
  if (*v2 != v1) {
    objc_storeStrong(v2, v1);
  }
}

- (SSURLBag)URLBag
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6_0;
  v10 = __Block_byref_object_dispose__7_0;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SKUIReloadConfigurationOperation_URLBag__block_invoke;
  v5[3] = &unk_1E6422538;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SSURLBag *)v3;
}

void __42__SKUIReloadConfigurationOperation_URLBag__block_invoke(uint64_t a1)
{
}

- (void)main
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__6_0;
  v46 = __Block_byref_object_dispose__7_0;
  id v47 = 0;
  id v3 = [(SKUIReloadConfigurationOperation *)self URLBag];
  if (!v3)
  {
    id v4 = [MEMORY[0x1E4FA8300] contextWithBagType:0];
    [v4 setIgnoresCaches:1];
    uint64_t v5 = SSVDefaultUserAgent();
    [v4 setValue:v5 forHTTPHeaderField:*MEMORY[0x1E4FA8698]];

    id v3 = [(SSURLBag *)[SKUIURLBag alloc] initWithURLBagContext:v4];
  }
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__6_0;
  v40 = __Block_byref_object_dispose__7_0;
  id v41 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __40__SKUIReloadConfigurationOperation_main__block_invoke;
  v32[3] = &unk_1E642AD98;
  v34 = &v36;
  v35 = &v42;
  objc_super v7 = v6;
  v33 = v7;
  [(SKUIURLBag *)v3 loadWithCompletionBlock:v32];
  dispatch_time_t v8 = dispatch_time(0, 8000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v9 = [MEMORY[0x1E4FA81D8] sharedConfig];
    int v10 = [v9 shouldLog];
    int v11 = [v9 shouldLogToDisk];
    v12 = [v9 OSLogObject];
    v13 = v12;
    if (v11) {
      v10 |= 2u;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      int v14 = v10;
    }
    else {
      int v14 = v10 & 2;
    }
    if (v14)
    {
      int v48 = 138543362;
      v49 = self;
      LODWORD(v30) = 12;
      v29 = &v48;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_13:

        uint64_t v16 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"SKUIErrorDomain" code:6 userInfo:0];
        v17 = (void *)v43[5];
        v43[5] = v16;

        goto LABEL_14;
      }
      v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v48, v30);
      free(v15);
      v29 = (int *)v13;
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  if (objc_msgSend((id)v37[5], "count", v29))
  {
    v18 = [(SKUIURLBag *)v3 storeFrontIdentifier];
    v19 = [MEMORY[0x1E4FA8100] defaultStore];
    v20 = [v19 activeAccount];

    v21 = SSVStoreFrontIdentifierForAccount();
    if (![v18 length] || v21 && objc_msgSend(v18, "hasPrefix:", v21))
    {
      id v22 = v21;

      v18 = v22;
    }
    if (v18)
    {
      v23 = +[SKUIClientContext _cachePathForStoreFrontIdentifier:v18];
      v24 = +[SKUIClientContext _configurationDictionaryWithBagDictionary:v37[5]];
      if (v24 && v23)
      {
        v25 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v24 format:200 options:0 error:0];
        if (v25)
        {
          id v31 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
          v26 = [v23 stringByDeletingLastPathComponent];
          [v31 createDirectoryAtPath:v26 withIntermediateDirectories:1 attributes:0 error:0];

          [v25 writeToFile:v23 options:1 error:0];
        }
      }
    }
    else
    {
      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
  }
  uint64_t v27 = [(SKUIReloadConfigurationOperation *)self outputBlock];
  v28 = (void *)v27;
  if (v27) {
    (*(void (**)(uint64_t, void *, uint64_t))(v27 + 16))(v27, v24, v43[5]);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
}

intptr_t __40__SKUIReloadConfigurationOperation_main__block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 copy];
  uint64_t v7 = *(void *)(a1[5] + 8);
  dispatch_time_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [v5 copy];
  uint64_t v10 = *(void *)(a1[6] + 8);
  int v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  v12 = a1[4];

  return dispatch_semaphore_signal(v12);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong(&self->_outputBlock, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  id v1 = "-[SKUIReloadConfigurationOperation init]";
}

@end