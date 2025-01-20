@interface PLPreheatItem
- (BOOL)CPLPrefetching;
- (BOOL)CPLPrefetchingWasCancelled;
- (BOOL)addImageHandler:(id)a3;
- (BOOL)cachingAllowed;
- (BOOL)didCompleteCPLPrefetchingWithSuccessOrError;
- (BOOL)isCancelled;
- (BOOL)isRetained;
- (CGSize)optimalSourcePixelSize;
- (NSString)assetUUID;
- (NSString)virtualCPLTaskIdentifier;
- (OS_dispatch_group)CPLPrefetchingWaitGroup;
- (id)cachedImage:(BOOL *)a3;
- (id)cachedImageIfAvailable:(BOOL *)a3;
- (id)description;
- (id)initForCPLPrefetchingWithAssetUUID:(id)a3 format:(unsigned __int16)a4 assetsdClient:(id)a5;
- (int64_t)decrementRequestCount;
- (int64_t)imageType;
- (int64_t)incrementRequestCount;
- (unsigned)bestFormat;
- (unsigned)format;
- (void)cancelPreheatRequestWithCompletionHandler:(id)a3;
- (void)setBestFormat:(unsigned __int16)a3;
- (void)setCPLPrefetchingWasCancelled:(BOOL)a3;
- (void)setCachingAllowed:(BOOL)a3;
- (void)setDidCompleteCPLPrefetchingWithSuccessOrError:(BOOL)a3;
- (void)setVirtualCPLTaskIdentifier:(id)a3;
- (void)startPreheatRequestWithCompletionHandler:(id)a3;
@end

@implementation PLPreheatItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualCPLTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudClient, 0);
  objc_storeStrong((id *)&self->_CPLPrefetchingWaitGroup, 0);
  objc_storeStrong((id *)&self->_CPLPrefetchingDoneToken, 0);
  objc_storeStrong((id *)&self->_CPLPrefetchingIsolationQueue, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
}

- (BOOL)cachingAllowed
{
  return self->_cachingAllowed;
}

- (void)setCPLPrefetchingWasCancelled:(BOOL)a3
{
  self->_CPLPrefetchingWasCancelled = a3;
}

- (BOOL)CPLPrefetchingWasCancelled
{
  return self->_CPLPrefetchingWasCancelled;
}

- (void)setDidCompleteCPLPrefetchingWithSuccessOrError:(BOOL)a3
{
  self->_didCompleteCPLPrefetchingWithSuccessOrError = a3;
}

- (BOOL)didCompleteCPLPrefetchingWithSuccessOrError
{
  return self->_didCompleteCPLPrefetchingWithSuccessOrError;
}

- (void)setVirtualCPLTaskIdentifier:(id)a3
{
}

- (NSString)virtualCPLTaskIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (OS_dispatch_group)CPLPrefetchingWaitGroup
{
  return self->_CPLPrefetchingWaitGroup;
}

- (BOOL)CPLPrefetching
{
  return self->_CPLPrefetching;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (CGSize)optimalSourcePixelSize
{
  double width = self->_optimalSourcePixelSize.width;
  double height = self->_optimalSourcePixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)imageType
{
  return self->_imageType;
}

- (void)setBestFormat:(unsigned __int16)a3
{
  self->_bestFormat = a3;
}

- (unsigned)bestFormat
{
  return self->_bestFormat;
}

- (unsigned)format
{
  return self->_format;
}

- (BOOL)isRetained
{
  if (self->_cachingAllowed) {
    return 1;
  }
  signed int v3 = atomic_load((unsigned int *)&self->_requestCount);
  return v3 > 0;
}

- (int64_t)decrementRequestCount
{
  return (int)atomic_fetch_add(&self->_requestCount, 0xFFFFFFFF) - 1;
}

- (int64_t)incrementRequestCount
{
  return (int)atomic_fetch_add(&self->_requestCount, 1u) + 1;
}

- (void)setCachingAllowed:(BOOL)a3
{
  if (self->_cachingAllowed != a3) {
    self->_cachingAllowed = a3;
  }
}

- (BOOL)isCancelled
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  if ([(PLPreheatItem *)self CPLPrefetching]) {
    pl_dispatch_sync();
  }
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __28__PLPreheatItem_isCancelled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 76);
  return result;
}

- (void)cancelPreheatRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(PLPreheatItem *)self CPLPrefetching])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__PLPreheatItem_cancelPreheatRequestWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E58742F0;
    v6[4] = self;
    id v7 = v4;
    dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v6);
    pl_dispatch_async();
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

void __59__PLPreheatItem_cancelPreheatRequestWithCompletionHandler___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 76) = 1;
  char v2 = *(id **)(a1 + 32);
  if (v2[8])
  {
    notify_post((const char *)[v2[8] UTF8String]);
    char v2 = *(id **)(a1 + 32);
  }
  uint64_t v3 = [v2 virtualCPLTaskIdentifier];
  id v4 = (void *)v3;
  if (v3)
  {
    dispatch_block_t v5 = *(void **)(*(void *)(a1 + 32) + 96);
    v9[0] = v3;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__PLPreheatItem_cancelPreheatRequestWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E5875198;
    id v8 = *(id *)(a1 + 40);
    [v5 cancelCPLDownloadImageDataWithVirtualTaskIdentifiers:v6 completionHandler:v7];
  }
}

uint64_t __59__PLPreheatItem_cancelPreheatRequestWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)startPreheatRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(PLPreheatItem *)self CPLPrefetching])
  {
    dispatch_time_t v5 = dispatch_time(0, 300000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PLPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke;
    block[3] = &unk_1E5873370;
    block[4] = self;
    id v8 = v4;
    dispatch_time_t v9 = v5;
    dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
    pl_dispatch_async();
  }
  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __58__PLPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 76) = 0;
  char v2 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v3 = [v2 UUIDString];
  uint64_t v4 = *(void *)(a1 + 32);
  dispatch_time_t v5 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v3;

  int v23 = 0;
  [*(id *)(*(void *)(a1 + 32) + 64) UTF8String];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __58__PLPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_2;
  v20 = &unk_1E5872910;
  uint64_t v21 = v6;
  id v22 = *(id *)(a1 + 40);
  pl_notify_register_dispatch();
  id v7 = *(void **)(a1 + 32);
  id v8 = (void *)v7[12];
  dispatch_time_t v9 = [v7 assetUUID];
  v25[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  uint64_t v11 = [*(id *)(a1 + 32) format];
  uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 64);
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__PLPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_4;
  v14[3] = &unk_1E5872960;
  v13 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  int v16 = 0;
  id v15 = v13;
  [v8 requestCPLDownloadImageDataForAssets:v10 format:v11 doneTokens:v12 completionHandler:v14];
}

void __58__PLPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_2(uint64_t a1, int token)
{
  notify_cancel(token);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 64);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, 0, *(unsigned __int8 *)(v3 + 76));
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void **)(v3 + 64);
    }
  }
  *(void *)(v3 + 64) = 0;
}

void __58__PLPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  notify_cancel(*(_DWORD *)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 64);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, 0, *(unsigned __int8 *)(v2 + 76));
      uint64_t v2 = *(void *)(a1 + 32);
      uint64_t v3 = *(void **)(v2 + 64);
    }
  }
  *(void *)(v2 + 64) = 0;
}

void __58__PLPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 lastObject];
  uint64_t v4 = [v3 length];
  [*(id *)(a1 + 32) setVirtualCPLTaskIdentifier:v3];
  if (!v4)
  {
    id v5 = *(id *)(a1 + 40);
    pl_dispatch_async();
  }
}

void __58__PLPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  notify_cancel(*(_DWORD *)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 64);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, 0, *(unsigned __int8 *)(v2 + 76));
      uint64_t v2 = *(void *)(a1 + 32);
      uint64_t v3 = *(void **)(v2 + 64);
    }
  }
  *(void *)(v2 + 64) = 0;
}

- (BOOL)addImageHandler:(id)a3
{
  return 0;
}

- (id)cachedImageIfAvailable:(BOOL *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return 0;
}

- (id)cachedImage:(BOOL *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return 0;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t format = self->_format;
  signed int v7 = atomic_load((unsigned int *)&self->_requestCount);
  uint64_t v8 = v7;
  BOOL cachingAllowed = self->_cachingAllowed;
  v10 = [(PLPreheatItem *)self virtualCPLTaskIdentifier];
  if (v10)
  {
    uint64_t v11 = NSString;
    v12 = [(PLPreheatItem *)self virtualCPLTaskIdentifier];
    v13 = [v11 stringWithFormat:@" for Hyperion '%@'", v12];
    v14 = [v3 stringWithFormat:@"<%@ %p> fmt: %ld, [r: %ld, c: %ld], %@ ", v5, self, format, v8, cachingAllowed, v13];
  }
  else
  {
    v14 = [v3 stringWithFormat:@"<%@ %p> fmt: %ld, [r: %ld, c: %ld], %@ ", v5, self, format, v8, cachingAllowed, &stru_1EEB2EB80];
  }

  return v14;
}

- (id)initForCPLPrefetchingWithAssetUUID:(id)a3 format:(unsigned __int16)a4 assetsdClient:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PLPreheatItem;
  v10 = [(PLPreheatItem *)&v21 init];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_uint64_t format = a4;
    uint64_t v12 = [v8 copy];
    assetUUID = v11->_assetUUID;
    v11->_assetUUID = (NSString *)v12;

    v11->_CPLPrefetching = 1;
    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v15 = dispatch_queue_create("PLPreheatItem", v14);
    CPLPrefetchingIsolationQueue = v11->_CPLPrefetchingIsolationQueue;
    v11->_CPLPrefetchingIsolationQueue = (OS_dispatch_queue *)v15;

    CPLPrefetchingDoneToken = v11->_CPLPrefetchingDoneToken;
    v11->_CPLPrefetchingDoneToken = 0;

    v11->_CPLPrefetchingCancelled = 0;
    dispatch_group_t v18 = dispatch_group_create();
    CPLPrefetchingWaitGroup = v11->_CPLPrefetchingWaitGroup;
    v11->_CPLPrefetchingWaitGroup = (OS_dispatch_group *)v18;

    objc_storeStrong((id *)&v11->_cloudClient, a5);
  }

  return v11;
}

@end