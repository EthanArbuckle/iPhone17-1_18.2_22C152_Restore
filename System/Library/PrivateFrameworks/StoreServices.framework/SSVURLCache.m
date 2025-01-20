@interface SSVURLCache
- (SSVURLCache)init;
- (SSVURLCache)initWithConfiguration:(id)a3;
- (id)cachedConnectionResponseForRequestProperties:(id)a3;
- (id)cachedConnectionResponseForRequestProperties:(id)a3 cachedResponse:(id *)a4;
- (id)cachedResponseForRequest:(id)a3;
- (void)configureRequest:(id)a3;
- (void)dealloc;
- (void)loadMemoryCacheFromDisk;
- (void)removeAllCachedResponses;
- (void)saveMemoryCacheToDisk;
- (void)storeCachedResponse:(id)a3 forRequest:(id)a4;
- (void)storeConnectionResponse:(id)a3 forRequestProperties:(id)a4;
- (void)storeConnectionResponse:(id)a3 forRequestProperties:(id)a4 userInfo:(id)a5;
@end

@implementation SSVURLCache

- (id)cachedConnectionResponseForRequestProperties:(id)a3
{
  return [(SSVURLCache *)self cachedConnectionResponseForRequestProperties:a3 cachedResponse:0];
}

- (SSVURLCache)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v6 = [(SSVURLCache *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = [(SSVURLCacheConfiguration *)v7->_configuration sessionIdentifier];
    if (v8)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      if ([(SSVURLCacheConfiguration *)v7->_configuration supportsProcessSharing]) {
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F18F48], (const void *)*MEMORY[0x1E4F1CFD0]);
      }
      v7->_cacheStorageSession = (__CFURLStorageSession *)_CFURLStorageSessionCreate();
      CFRelease(Mutable);
    }
    if (v7->_cacheStorageSession)
    {
      uint64_t v10 = _CFURLStorageSessionCopyCache();
      if (v10)
      {
        v11 = (_CFURLCache *)v10;
        CFURLCacheSetMemoryCapacity();
        v7->_urlCache = v11;
      }
    }
  }
  return v7;
}

- (SSVURLCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSVURLCache;
  v2 = [(SSVURLCache *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.StoreServices.SSVURLCache.accessQueue", 0);
    accessSerialQueue = v2->_accessSerialQueue;
    v2->_accessSerialQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (id)cachedConnectionResponseForRequestProperties:(id)a3 cachedResponse:(id *)a4
{
  objc_super v6 = (void *)[a3 copyURLRequest];
  if (!v6)
  {
    v8 = 0;
LABEL_10:
    v12 = 0;
    if (!a4) {
      goto LABEL_12;
    }
LABEL_11:
    *a4 = v8;
    goto LABEL_12;
  }
  v7 = [(SSVURLCache *)self cachedResponseForRequest:v6];
  v8 = v7;
  if (!v7) {
    goto LABEL_10;
  }
  v9 = [v7 response];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [SSURLConnectionResponse alloc];
    v11 = [v8 data];
    v12 = [(SSURLConnectionResponse *)v10 initWithURLResponse:v9 bodyData:v11];

    v13 = [v8 userInfo];
    v14 = [v13 objectForKey:@"metrics-page-event-body-dictionary"];
    if (v14)
    {
      v15 = [(SSMetricsMutableEvent *)[SSMetricsPageEvent alloc] initWithBodyDictionary:v14];
      if (v15) {
        [(SSURLConnectionResponse *)v12 setMetricsPageEvent:v15];
      }
    }
  }
  else
  {
    v12 = 0;
  }

  if (a4) {
    goto LABEL_11;
  }
LABEL_12:
  v16 = v12;

  return v16;
}

- (id)cachedResponseForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 _CFURLRequest];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  id v24 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SSVURLCache_cachedResponseForRequest___block_invoke;
  block[3] = &unk_1E5BA86A8;
  block[5] = &v19;
  block[6] = v5;
  block[4] = self;
  dispatch_sync(accessSerialQueue, block);
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:"_SSVURLCPEB" length:11 freeWhenDone:0];
  v8 = [(id)v20[5] data];
  int v9 = [v8 isEqualToData:v7];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28B70]);
    v11 = [(id)v20[5] response];
    v12 = [MEMORY[0x1E4F1C9B8] data];
    v13 = [(id)v20[5] userInfo];
    uint64_t v14 = objc_msgSend(v10, "initWithResponse:data:userInfo:storagePolicy:", v11, v12, v13, objc_msgSend((id)v20[5], "storagePolicy"));
    v15 = (void *)v20[5];
    v20[5] = v14;
  }
  id v16 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v16;
}

void __40__SSVURLCache_cachedResponseForRequest___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    uint64_t v2 = CFURLCacheCopyResponseForRequest();
    if (v2)
    {
      dispatch_queue_t v3 = (const void *)v2;
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F28B70]) _initWithCFCachedURLResponse:v2];
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
      objc_super v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      CFRelease(v3);
    }
  }
}

- (void)dealloc
{
  cacheStorageSession = self->_cacheStorageSession;
  if (cacheStorageSession) {
    CFRelease(cacheStorageSession);
  }
  urlCache = self->_urlCache;
  if (urlCache) {
    CFRelease(urlCache);
  }
  v5.receiver = self;
  v5.super_class = (Class)SSVURLCache;
  [(SSVURLCache *)&v5 dealloc];
}

- (void)configureRequest:(id)a3
{
  uint64_t v4 = [a3 _CFURLRequest];
  if (self->_cacheStorageSession)
  {
    MEMORY[0x1F40D5768](v4);
  }
}

- (void)loadMemoryCacheFromDisk
{
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SSVURLCache_loadMemoryCacheFromDisk__block_invoke;
  block[3] = &unk_1E5BA7040;
  block[4] = self;
  dispatch_async(accessSerialQueue, block);
}

uint64_t __38__SSVURLCache_loadMemoryCacheFromDisk__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 32);
  if (result) {
    return MEMORY[0x1F40D5730]();
  }
  return result;
}

- (void)removeAllCachedResponses
{
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SSVURLCache_removeAllCachedResponses__block_invoke;
  block[3] = &unk_1E5BA7040;
  block[4] = self;
  dispatch_async(accessSerialQueue, block);
}

uint64_t __39__SSVURLCache_removeAllCachedResponses__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 32);
  if (result) {
    return MEMORY[0x1F40D53B0]();
  }
  return result;
}

- (void)saveMemoryCacheToDisk
{
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SSVURLCache_saveMemoryCacheToDisk__block_invoke;
  block[3] = &unk_1E5BA7040;
  block[4] = self;
  dispatch_async(accessSerialQueue, block);
}

uint64_t __36__SSVURLCache_saveMemoryCacheToDisk__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 32);
  if (result) {
    return MEMORY[0x1F40D5738]();
  }
  return result;
}

- (void)storeCachedResponse:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 data];
  uint64_t v9 = [v8 length];

  if (!v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28B70]);
    v11 = [v6 response];
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:"_SSVURLCPEB" length:11 freeWhenDone:0];
    v13 = [v6 userInfo];
    uint64_t v14 = objc_msgSend(v10, "initWithResponse:data:userInfo:storagePolicy:", v11, v12, v13, objc_msgSend(v6, "storagePolicy"));

    id v6 = (id)v14;
  }
  if (self->_urlCache)
  {
    uint64_t v15 = [v7 _CFURLRequest];
    [v6 _CFCachedURLResponse];
    CFURLCacheAddCachedResponseForRequest();
    accessSerialQueue = self->_accessSerialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__SSVURLCache_storeCachedResponse_forRequest___block_invoke;
    block[3] = &unk_1E5BA86D0;
    id v18 = v6;
    uint64_t v19 = self;
    uint64_t v20 = v15;
    dispatch_async(accessSerialQueue, block);
  }
}

void __46__SSVURLCache_storeCachedResponse_forRequest___block_invoke(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  id v13 = [*(id *)(a1 + 32) userInfo];
  dispatch_queue_t v3 = [*(id *)(a1 + 32) data];
  while (CFAbsoluteTimeGetCurrent() - Current < 3.0)
  {
    uint64_t v4 = (void *)MEMORY[0x1A6267F60]();
    uint64_t v5 = CFURLCacheCopyResponseForRequest();
    if (v5)
    {
      id v6 = (const void *)v5;
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B70]) _initWithCFCachedURLResponse:v5];
      CFRelease(v6);
    }
    else
    {
      id v7 = 0;
    }
    id v8 = [v7 userInfo];
    uint64_t v9 = v8;
    if (v8 == v13 || objc_msgSend(v8, "isEqualToDictionary:"))
    {
      id v10 = [v7 data];
      if (v10 == v3)
      {

        break;
      }
      v11 = v10;
      char v12 = [v10 isEqualToData:v3];

      if (v12) {
        break;
      }
    }
    else
    {
    }
  }
}

- (void)storeConnectionResponse:(id)a3 forRequestProperties:(id)a4
{
}

- (void)storeConnectionResponse:(id)a3 forRequestProperties:(id)a4 userInfo:(id)a5
{
  id v20 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v20 URLResponse];
  v11 = (void *)[v9 copyURLRequest];

  if (v11 && v10)
  {
    char v12 = [v20 metricsPageEvent];
    uint64_t v13 = [v12 bodyDictionary];
    uint64_t v14 = (void *)v13;
    if (v8)
    {
      uint64_t v15 = [v8 mutableCopy];
      id v16 = (void *)v15;
      if (!v14)
      {
LABEL_10:
        id v17 = objc_alloc(MEMORY[0x1E4F28B70]);
        id v18 = [v20 bodyData];
        uint64_t v19 = (void *)[v17 initWithResponse:v10 data:v18 userInfo:v16 storagePolicy:0];

        [(SSVURLCache *)self storeCachedResponse:v19 forRequest:v11];
        goto LABEL_11;
      }
      if (v15)
      {
LABEL_9:
        [v16 setObject:v14 forKey:@"metrics-page-event-body-dictionary"];
        goto LABEL_10;
      }
    }
    else if (!v13)
    {
      id v16 = 0;
      goto LABEL_10;
    }
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    goto LABEL_9;
  }
LABEL_11:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
}

@end