@interface QLDiskCacheQueryOperation
- (BOOL)appendThumbnailRequest:(id)a3;
- (NSMutableDictionary)thumbnailRequestBatch;
- (QLDiskCacheQueryOperation)initWithCacheThread:(id)a3;
- (_QLCacheThread)cacheThread;
- (int64_t)thumbnailRequestCount;
- (void)cancel;
- (void)dealloc;
- (void)main;
- (void)setCacheThread:(id)a3;
- (void)setThumbnailRequestBatch:(id)a3;
- (void)setThumbnailRequestCount:(int64_t)a3;
@end

@implementation QLDiskCacheQueryOperation

void __52__QLDiskCacheQueryOperation_appendThumbnailRequest___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isReady])
  {
    uint64_t v2 = [*(id *)(a1 + 32) thumbnailRequestBatch];
    if (v2)
    {
      v3 = (void *)v2;
      uint64_t v4 = [*(id *)(a1 + 32) thumbnailRequestCount];

      if (v4 <= 19)
      {
        v5 = [*(id *)(a1 + 40) request];
        v6 = [v5 fileIdentifier];
        v7 = [v6 fileIdentifier];

        if (v7)
        {
          v8 = [*(id *)(a1 + 32) thumbnailRequestBatch];
          v9 = [v8 objectForKeyedSubscript:v7];

          if (!v9)
          {
            v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v10 = [*(id *)(a1 + 32) thumbnailRequestBatch];
            [v10 setObject:v9 forKeyedSubscript:v7];
          }
          [v9 addObject:*(void *)(a1 + 40)];
          objc_msgSend(*(id *)(a1 + 32), "setThumbnailRequestCount:", objc_msgSend(*(id *)(a1 + 32), "thumbnailRequestCount") + 1);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        }
        else
        {
          uint64_t v11 = MEMORY[0x1E4F3A768];
          v12 = *(NSObject **)(MEMORY[0x1E4F3A768] + 16);
          if (!v12)
          {
            QLTInitLogging();
            v12 = *(NSObject **)(v11 + 16);
          }
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
            goto LABEL_13;
          }
          v13 = *(void **)(a1 + 40);
          v9 = v12;
          v14 = [v13 request];
          int v15 = 138412290;
          v16 = v14;
          _os_log_impl(&dword_1DDC5E000, v9, OS_LOG_TYPE_INFO, "could not get pathID for %@", (uint8_t *)&v15, 0xCu);
        }
LABEL_13:
      }
    }
  }
}

- (NSMutableDictionary)thumbnailRequestBatch
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 248, 1);
}

- (int64_t)thumbnailRequestCount
{
  return self->_thumbnailRequestCount;
}

- (void)setThumbnailRequestCount:(int64_t)a3
{
  self->_thumbnailRequestCount = a3;
}

void __33__QLDiskCacheQueryOperation_main__block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) cacheThread];
  v3 = [v2 diskCache];
  uint64_t v4 = [v3 enumeratorForThumbnailRequests:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  id v26 = 0;
  v5 = [v4 nextThumbnailRequestWithThumbnailData:&v26];
  id v6 = v26;
  v8 = v6;
  if (v5)
  {
    uint64_t v9 = MEMORY[0x1E4F3A768];
    *(void *)&long long v7 = 138412546;
    long long v24 = v7;
    do
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      v10 = objc_msgSend(v5, "activity", v24);
      os_activity_scope_enter(v10, &state);

      [v5 setDidCheckCache:1];
      if ([v5 cancelled])
      {
        uint64_t v11 = [*(id *)(a1 + 32) cacheThread];
        [v11 _thumbnailHasBeenCancelled:v5];
      }
      else if (v8)
      {
        v12 = *(void **)(v9 + 16);
        if (!v12)
        {
          QLTInitLogging();
          v12 = *(void **)(v9 + 16);
        }
        v13 = v12;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = [v5 request];
          int v15 = [v5 request];
          v16 = [v15 fileIdentifier];
          *(_DWORD *)buf = v24;
          v28 = v14;
          __int16 v29 = 2112;
          v30 = v16;
          _os_log_impl(&dword_1DDC5E000, v13, OS_LOG_TYPE_INFO, "Thumbnail found in disk cache for request:%@ fi: %@", buf, 0x16u);
        }
        uint64_t v11 = [*(id *)(a1 + 32) cacheThread];
        [v11 _sendThumbnailData:v8 forThumbnailRequest:v5];
      }
      else
      {
        uint64_t v17 = *(void **)(v9 + 16);
        if (!v17)
        {
          QLTInitLogging();
          uint64_t v17 = *(void **)(v9 + 16);
        }
        v18 = v17;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = [v5 request];
          v20 = [v5 request];
          v21 = [v20 fileIdentifier];
          *(_DWORD *)buf = v24;
          v28 = v19;
          __int16 v29 = 2112;
          v30 = v21;
          _os_log_impl(&dword_1DDC5E000, v18, OS_LOG_TYPE_INFO, "No thumbnail found in disk cache for request: %@ fi: %@", buf, 0x16u);
        }
        uint64_t v11 = [*(id *)(a1 + 32) cacheThread];
        [v11 _dispatchThumbnailRequestInServerThread:v5];
      }

      os_activity_scope_leave(&state);
      id v26 = v8;
      uint64_t v22 = [v4 nextThumbnailRequestWithThumbnailData:&v26];
      id v23 = v26;

      v8 = v23;
      v5 = (void *)v22;
    }
    while (v22);
  }
  else
  {
    id v23 = v6;
  }
}

- (_QLCacheThread)cacheThread
{
  return (_QLCacheThread *)objc_getProperty(self, a2, 264, 1);
}

- (BOOL)appendThumbnailRequest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v5 = self;
  objc_sync_enter(v5);
  queue = v5->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__QLDiskCacheQueryOperation_appendThumbnailRequest___block_invoke;
    block[3] = &unk_1E6D0CAE8;
    block[4] = v5;
    id v10 = v4;
    uint64_t v11 = &v12;
    dispatch_sync(queue, block);
  }
  objc_sync_exit(v5);

  char v7 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (QLDiskCacheQueryOperation)initWithCacheThread:(id)a3
{
  id v5 = a3;
  id v6 = [(QLDiskCacheQueryOperation *)self init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("quicklookd.memoreycacheoperation", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:20];
    thumbnailRequestBatch = v6->_thumbnailRequestBatch;
    v6->_thumbnailRequestBatch = (NSMutableDictionary *)v9;

    v6->_thumbnailRequestCount = 0;
    objc_storeStrong((id *)&v6->_cacheThread, a3);
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  queue = v2->_queue;
  v2->_queue = 0;

  objc_sync_exit(v2);
  v4.receiver = v2;
  v4.super_class = (Class)QLDiskCacheQueryOperation;
  [(QLDiskCacheQueryOperation *)&v4 dealloc];
}

- (void)setThumbnailRequestBatch:(id)a3
{
}

- (void)main
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__1;
  long long v24 = __Block_byref_object_dispose__1;
  id v25 = 0;
  uint64_t v2 = self;
  objc_sync_enter(v2);
  queue = v2->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__QLDiskCacheQueryOperation_main__block_invoke;
    block[3] = &unk_1E6D0CAC0;
    block[4] = v2;
    void block[5] = &v20;
    dispatch_sync(queue, block);
  }
  objc_sync_exit(v2);

  if (v21[5])
  {
    objc_super v4 = [(_QLCacheThread *)v2->_cacheThread diskCache];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __33__QLDiskCacheQueryOperation_main__block_invoke_2;
    v18[3] = &unk_1E6D0CB10;
    v18[4] = v2;
    v18[5] = &v20;
    char v5 = [v4 doReading:v18];

    if ((v5 & 1) == 0)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v6 = [(id)v21[5] allValues];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v26 count:16];
      if (v7)
      {
        id v8 = 0;
        uint64_t v9 = *(void *)v15;
        do
        {
          uint64_t v10 = 0;
          uint64_t v11 = v8;
          do
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            id v8 = *(id *)(*((void *)&v14 + 1) + 8 * v10);

            [(_QLCacheThread *)v2->_cacheThread _dispatchThumbnailRequestInServerThread:v8];
            ++v10;
            uint64_t v11 = v8;
          }
          while (v7 != v10);
          uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v26 count:16];
        }
        while (v7);
      }
    }
  }
  uint64_t v12 = [(_QLCacheThread *)v2->_cacheThread serverThread];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __33__QLDiskCacheQueryOperation_main__block_invoke_25;
  v13[3] = &unk_1E6D0C648;
  v13[4] = v2;
  [v12 perform:v13];

  _Block_object_dispose(&v20, 8);
}

uint64_t __33__QLDiskCacheQueryOperation_main__block_invoke_25(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 264) updateMode];
}

uint64_t __33__QLDiskCacheQueryOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) thumbnailRequestBatch];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  char v5 = *(void **)(a1 + 32);
  return [v5 setThumbnailRequestBatch:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cacheThread, 0);
  objc_storeStrong((id *)&self->_thumbnailRequestBatch, 0);
}

- (void)cancel
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  id v35 = 0;
  uint64_t v2 = self;
  objc_sync_enter(v2);
  queue = v2->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__QLDiskCacheQueryOperation_cancel__block_invoke;
    block[3] = &unk_1E6D0CAC0;
    block[4] = v2;
    void block[5] = &v30;
    dispatch_sync(queue, block);
  }
  objc_sync_exit(v2);

  if (v31[5])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v26 = 0u;
    long long v25 = 0u;
    id obj = [(id)v31[5] allValues];
    uint64_t v17 = [obj countByEnumeratingWithState:&v25 objects:v39 count:16];
    if (v17)
    {
      uint64_t v16 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(obj);
          }
          objc_super v4 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v5 = v4;
          uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v38 count:16];
          if (v6)
          {
            uint64_t v7 = *(void *)v22;
            do
            {
              uint64_t v8 = 0;
              do
              {
                if (*(void *)v22 != v7) {
                  objc_enumerationMutation(v5);
                }
                uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
                uint64_t v10 = *(void **)(MEMORY[0x1E4F3A768] + 16);
                if (!v10)
                {
                  QLTInitLogging();
                  uint64_t v10 = *(void **)(MEMORY[0x1E4F3A768] + 16);
                }
                uint64_t v11 = v10;
                if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
                {
                  uint64_t v12 = [v9 request];
                  v13 = [v12 fileIdentifier];
                  *(_DWORD *)buf = 138412290;
                  v37 = v13;
                  _os_log_impl(&dword_1DDC5E000, v11, OS_LOG_TYPE_INFO, "Disk cache request cancel, sending the thumbnail request to the server thread (%@)", buf, 0xCu);
                }
                [(_QLCacheThread *)v2->_cacheThread _dispatchThumbnailRequestInServerThread:v9];
                ++v8;
              }
              while (v6 != v8);
              uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v38 count:16];
            }
            while (v6);
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v25 objects:v39 count:16];
      }
      while (v17);
    }
  }
  v20.receiver = v2;
  v20.super_class = (Class)QLDiskCacheQueryOperation;
  [(QLDiskCacheQueryOperation *)&v20 cancel];
  long long v14 = [(_QLCacheThread *)v2->_cacheThread serverThread];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __35__QLDiskCacheQueryOperation_cancel__block_invoke_26;
  v19[3] = &unk_1E6D0C648;
  v19[4] = v2;
  [v14 perform:v19];

  _Block_object_dispose(&v30, 8);
}

uint64_t __35__QLDiskCacheQueryOperation_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) thumbnailRequestBatch];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(a1 + 32);
  return [v5 setThumbnailRequestBatch:0];
}

uint64_t __35__QLDiskCacheQueryOperation_cancel__block_invoke_26(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 264) updateMode];
}

- (void)setCacheThread:(id)a3
{
}

@end