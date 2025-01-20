@interface SFUIImageProvider
- (NSCache)imageCache;
- (NSMutableDictionary)requestsForIdentifier;
- (NSMutableDictionary)requestsForRequestID;
- (OS_dispatch_queue)fetchQueue;
- (SFUIImageProvider)init;
- (int)nextRequestID;
- (void)cancelImageRequest:(int)a3;
- (void)deliverImage:(id)a3 identifier:(id)a4 placeholder:(BOOL)a5 error:(id)a6;
- (void)scheduleImageRequest:(id)a3;
@end

@implementation SFUIImageProvider

- (SFUIImageProvider)init
{
  v14.receiver = self;
  v14.super_class = (Class)SFUIImageProvider;
  v2 = [(SFUIImageProvider *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_nextRequestID = 1;
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    imageCache = v3->_imageCache;
    v3->_imageCache = v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.SharingUI.SFUIImageProvider.fetchQueue", v6);
    fetchQueue = v3->_fetchQueue;
    v3->_fetchQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    requestsForIdentifier = v3->_requestsForIdentifier;
    v3->_requestsForIdentifier = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    requestsForRequestID = v3->_requestsForRequestID;
    v3->_requestsForRequestID = (NSMutableDictionary *)v11;
  }
  return v3;
}

- (void)cancelImageRequest:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v5 = sharing_ui_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SFUIImageProvider cancelImageRequest:](v3, v5);
  }

  v6 = [(SFUIImageProvider *)self requestsForRequestID];
  dispatch_queue_t v7 = [NSNumber numberWithInt:v3];
  v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    uint64_t v9 = [(SFUIImageProvider *)self requestsForRequestID];
    v10 = [NSNumber numberWithInt:v3];
    [v9 setObject:0 forKeyedSubscript:v10];

    uint64_t v11 = [(SFUIImageProvider *)self requestsForIdentifier];
    v12 = [v8 identifier];
    v13 = [v11 objectForKeyedSubscript:v12];

    [v13 removeObject:v8];
  }
}

- (int)nextRequestID
{
  return self->_nextRequestID + 1;
}

- (void)scheduleImageRequest:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v5 = [(SFUIImageProvider *)self requestsForRequestID];
  v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "requestID"));
  [v5 setObject:v4 forKeyedSubscript:v6];

  dispatch_queue_t v7 = [(SFUIImageProvider *)self requestsForIdentifier];
  v8 = [v4 identifier];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x263EFF9C0] set];
    v10 = [(SFUIImageProvider *)self requestsForIdentifier];
    uint64_t v11 = [v4 identifier];
    [v10 setObject:v9 forKeyedSubscript:v11];
  }
  [v9 addObject:v4];
  if ((unint64_t)[v9 count] <= 1)
  {
    if ([v4 synchronous])
    {
      [(SFUIImageProvider *)self performImageRequest:v4];
    }
    else
    {
      id location = 0;
      objc_initWeak(&location, self);
      v13 = [(SFUIImageProvider *)self fetchQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __42__SFUIImageProvider_scheduleImageRequest___block_invoke;
      block[3] = &unk_264472418;
      objc_copyWeak(&v16, &location);
      id v15 = v4;
      dispatch_async(v13, block);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v12 = sharing_ui_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[SFUIImageProvider scheduleImageRequest:](v4, v12);
    }
  }
}

void __42__SFUIImageProvider_scheduleImageRequest___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained performImageRequest:*(void *)(a1 + 32)];
}

- (void)deliverImage:(id)a3 identifier:(id)a4 placeholder:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v31 = a6;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v12 = sharing_ui_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSStringFromBOOL();
    *(_DWORD *)buf = 138413058;
    id v38 = v10;
    __int16 v39 = 2112;
    id v40 = v11;
    __int16 v41 = 2112;
    v42 = v13;
    __int16 v43 = 2112;
    id v44 = v31;
    _os_log_impl(&dword_21DB23000, v12, OS_LOG_TYPE_DEFAULT, "deliver image:%@ identifier:%@ placeholder:%@ error:%@", buf, 0x2Au);
  }
  if (v10)
  {
    objc_super v14 = [(SFUIImageProvider *)self imageCache];
    [v14 setObject:v10 forKey:v11];
  }
  id v15 = [(SFUIImageProvider *)self requestsForIdentifier];
  id v16 = [v15 objectForKeyedSubscript:v11];

  if (!v7)
  {
    v17 = [(SFUIImageProvider *)self requestsForIdentifier];
    [v17 setObject:0 forKeyedSubscript:v11];
  }
  v29 = v11;
  v30 = self;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v18 = v16;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v24 = [v23 resultHandler];
        v25 = (void *)v24;
        if (v24) {
          (*(void (**)(uint64_t, id, BOOL, id))(v24 + 16))(v24, v10, v7, v31);
        }
        if (!v7)
        {
          [(SFUIImageProvider *)v30 requestsForRequestID];
          v27 = id v26 = v10;
          v28 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v23, "requestID"));
          [v27 setObject:0 forKeyedSubscript:v28];

          id v10 = v26;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v20);
  }
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (OS_dispatch_queue)fetchQueue
{
  return self->_fetchQueue;
}

- (NSMutableDictionary)requestsForIdentifier
{
  return self->_requestsForIdentifier;
}

- (NSMutableDictionary)requestsForRequestID
{
  return self->_requestsForRequestID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestsForRequestID, 0);
  objc_storeStrong((id *)&self->_requestsForIdentifier, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

- (void)cancelImageRequest:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21DB23000, a2, OS_LOG_TYPE_DEBUG, "cancel request for requestID:%ld", (uint8_t *)&v2, 0xCu);
}

- (void)scheduleImageRequest:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 identifier];
  int v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_21DB23000, a2, OS_LOG_TYPE_DEBUG, "existing request pending for identifier:%@", (uint8_t *)&v4, 0xCu);
}

@end