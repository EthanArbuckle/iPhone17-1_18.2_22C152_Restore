@interface SUUIReloadConfigurationOperation
+ (NSString)cachePath;
- (SSURLBag)URLBag;
- (SUUIReloadConfigurationOperation)init;
- (id)outputBlock;
- (void)main;
- (void)setOutputBlock:(id)a3;
- (void)setURLBag:(id)a3;
@end

@implementation SUUIReloadConfigurationOperation

+ (NSString)cachePath
{
  v2 = [MEMORY[0x263F7B148] currentDevice];
  v3 = [v2 storeFrontIdentifier];

  v4 = +[SUUIClientContext _cachePathForStoreFrontIdentifier:v3];

  return (NSString *)v4;
}

- (SUUIReloadConfigurationOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIReloadConfigurationOperation;
  v2 = [(SUUIReloadConfigurationOperation *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIReloadConfigurationOperation", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (id)outputBlock
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__71;
  v10 = __Block_byref_object_dispose__71;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__SUUIReloadConfigurationOperation_outputBlock__block_invoke;
  v5[3] = &unk_2654008E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  dispatch_queue_t v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __47__SUUIReloadConfigurationOperation_outputBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 256) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)setOutputBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__SUUIReloadConfigurationOperation_setOutputBlock___block_invoke;
  v7[3] = &unk_265400DC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void *__51__SUUIReloadConfigurationOperation_setOutputBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 256) != result)
  {
    uint64_t v4 = [result copy];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 256);
    *(void *)(v5 + 256) = v4;
    return (void *)MEMORY[0x270F9A758](v4, v6);
  }
  return result;
}

- (void)setURLBag:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__SUUIReloadConfigurationOperation_setURLBag___block_invoke;
  v7[3] = &unk_265400890;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __46__SUUIReloadConfigurationOperation_setURLBag___block_invoke(uint64_t a1)
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
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3_0;
  v10 = __Block_byref_object_dispose__4_0;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__SUUIReloadConfigurationOperation_URLBag__block_invoke;
  v5[3] = &unk_2654008E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SSURLBag *)v3;
}

void __42__SUUIReloadConfigurationOperation_URLBag__block_invoke(uint64_t a1)
{
}

- (void)main
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__3_0;
  v46 = __Block_byref_object_dispose__4_0;
  id v47 = 0;
  id v3 = [(SUUIReloadConfigurationOperation *)self URLBag];
  if (!v3)
  {
    id v4 = [MEMORY[0x263F7B358] contextWithBagType:0];
    [v4 setIgnoresCaches:1];
    uint64_t v5 = SSVDefaultUserAgent();
    [v4 setValue:v5 forHTTPHeaderField:*MEMORY[0x263F7B788]];

    id v3 = [(SSURLBag *)[SUUIURLBag alloc] initWithURLBagContext:v4];
  }
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__3_0;
  v40 = __Block_byref_object_dispose__4_0;
  id v41 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __40__SUUIReloadConfigurationOperation_main__block_invoke;
  v32[3] = &unk_265407170;
  v34 = &v36;
  v35 = &v42;
  v7 = v6;
  v33 = v7;
  [(SUUIURLBag *)v3 loadWithCompletionBlock:v32];
  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v9 = [MEMORY[0x263F7B1F8] sharedConfig];
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

        uint64_t v16 = [objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SUUIErrorDomain" code:6 userInfo:0];
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
    v18 = [(SUUIURLBag *)v3 storeFrontIdentifier];
    v19 = [MEMORY[0x263F7B0E8] defaultStore];
    v20 = [v19 activeAccount];

    v21 = SSVStoreFrontIdentifierForAccount();
    if (![v18 length] || v21 && objc_msgSend(v18, "hasPrefix:", v21))
    {
      id v22 = v21;

      v18 = v22;
    }
    if (v18)
    {
      v23 = +[SUUIClientContext _cachePathForStoreFrontIdentifier:v18];
      v24 = +[SUUIClientContext _configurationDictionaryWithBagDictionary:v37[5]];
      if (v24 && v23)
      {
        v25 = [MEMORY[0x263F08AC0] dataWithPropertyList:v24 format:200 options:0 error:0];
        if (v25)
        {
          id v31 = objc_alloc_init(MEMORY[0x263F08850]);
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
  uint64_t v27 = [(SUUIReloadConfigurationOperation *)self outputBlock];
  v28 = (void *)v27;
  if (v27) {
    (*(void (**)(uint64_t, void *, uint64_t))(v27 + 16))(v27, v24, v43[5]);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
}

intptr_t __40__SUUIReloadConfigurationOperation_main__block_invoke(void *a1, void *a2, void *a3)
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

@end