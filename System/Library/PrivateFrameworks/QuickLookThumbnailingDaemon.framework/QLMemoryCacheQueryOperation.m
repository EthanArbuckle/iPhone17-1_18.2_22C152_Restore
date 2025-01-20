@interface QLMemoryCacheQueryOperation
- (QLMemoryCacheQueryOperation)initWithThumbnailRequest:(id)a3 cacheThread:(id)a4;
- (QLTGeneratorThumbnailRequest)generatorRequest;
- (void)cancel;
- (void)main;
- (void)setGeneratorRequest:(id)a3;
@end

@implementation QLMemoryCacheQueryOperation

- (void)setGeneratorRequest:(id)a3
{
}

- (QLMemoryCacheQueryOperation)initWithThumbnailRequest:(id)a3 cacheThread:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(QLMemoryCacheQueryOperation *)self init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("quicklookd.memorycacheoperation", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_generatorRequest, a3);
    objc_storeStrong((id *)&v9->_cacheThread, a4);
  }

  return v9;
}

uint64_t __35__QLMemoryCacheQueryOperation_main__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 256) updateMode];
}

uint64_t __35__QLMemoryCacheQueryOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) generatorRequest];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = *(void **)(a1 + 32);
  return [v5 setGeneratorRequest:0];
}

- (QLTGeneratorThumbnailRequest)generatorRequest
{
  return (QLTGeneratorThumbnailRequest *)objc_getProperty(self, a2, 248, 1);
}

- (void)main
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__QLMemoryCacheQueryOperation_main__block_invoke;
  block[3] = &unk_1E6D0CAC0;
  block[4] = self;
  block[5] = &v24;
  dispatch_sync(queue, block);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v4 = [(id)v25[5] activity];
  os_activity_scope_enter(v4, &state);

  v5 = (void *)v25[5];
  if (v5)
  {
    int v6 = [v5 cancelled];
    cacheThread = self->_cacheThread;
    if (v6)
    {
      [(_QLCacheThread *)cacheThread _thumbnailHasBeenCancelled:v25[5]];
    }
    else
    {
      id v8 = [(_QLCacheThread *)cacheThread memoryCache];
      int v9 = [v8 sendThumbnailDataForThumbnailRequest:v25[5] withCacheThread:self->_cacheThread];

      if (v9)
      {
        uint64_t v10 = MEMORY[0x1E4F3A768];
        v11 = *(void **)(MEMORY[0x1E4F3A768] + 16);
        if (!v11)
        {
          QLTInitLogging();
          v11 = *(void **)(v10 + 16);
        }
        v12 = v11;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = [(id)v25[5] request];
          v14 = [v13 fileIdentifier];
          *(_DWORD *)buf = 138412290;
          v31 = v14;
          _os_log_impl(&dword_1DDC5E000, v12, OS_LOG_TYPE_INFO, "Did find thumbnail in memory cache %@", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v15 = MEMORY[0x1E4F3A768];
        v16 = *(void **)(MEMORY[0x1E4F3A768] + 16);
        if (!v16)
        {
          QLTInitLogging();
          v16 = *(void **)(v15 + 16);
        }
        v17 = v16;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = [(id)v25[5] request];
          v19 = [v18 fileIdentifier];
          *(_DWORD *)buf = 138412290;
          v31 = v19;
          _os_log_impl(&dword_1DDC5E000, v17, OS_LOG_TYPE_INFO, "No thumbnail found in memory cache %@", buf, 0xCu);
        }
        [(_QLCacheThread *)self->_cacheThread _addThumbnailRequestIntoDiskCacheQueryQueue:v25[5]];
      }
    }
  }
  v20 = [(_QLCacheThread *)self->_cacheThread serverThread];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __35__QLMemoryCacheQueryOperation_main__block_invoke_2;
  v21[3] = &unk_1E6D0C648;
  v21[4] = self;
  [v20 perform:v21];

  os_activity_scope_leave(&state);
  _Block_object_dispose(&v24, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cacheThread, 0);
  objc_storeStrong((id *)&self->_generatorRequest, 0);
}

- (void)cancel
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__QLMemoryCacheQueryOperation_cancel__block_invoke;
  block[3] = &unk_1E6D0CAC0;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(queue, block);
  if (v14[5])
  {
    uint64_t v4 = MEMORY[0x1E4F3A768];
    v5 = *(void **)(MEMORY[0x1E4F3A768] + 16);
    if (!v5)
    {
      QLTInitLogging();
      v5 = *(void **)(v4 + 16);
    }
    int v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [(id)v14[5] request];
      id v8 = [v7 fileIdentifier];
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl(&dword_1DDC5E000, v6, OS_LOG_TYPE_INFO, "Memory cache request cancel, sending the thumbnail request to the disk cache (%@)", buf, 0xCu);
    }
    [(_QLCacheThread *)self->_cacheThread _dispatchThumbnailRequestInServerThread:v14[5]];
  }
  v11.receiver = self;
  v11.super_class = (Class)QLMemoryCacheQueryOperation;
  [(QLMemoryCacheQueryOperation *)&v11 cancel];
  int v9 = [(_QLCacheThread *)self->_cacheThread serverThread];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__QLMemoryCacheQueryOperation_cancel__block_invoke_3;
  v10[3] = &unk_1E6D0C648;
  v10[4] = self;
  [v9 perform:v10];

  _Block_object_dispose(&v13, 8);
}

uint64_t __37__QLMemoryCacheQueryOperation_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) generatorRequest];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = *(void **)(a1 + 32);
  return [v5 setGeneratorRequest:0];
}

uint64_t __37__QLMemoryCacheQueryOperation_cancel__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 256) updateMode];
}

@end