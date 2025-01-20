@interface PSITopAssetsResult
- (NSArray)assetUUIDs;
- (PSITopAssetsResult)init;
- (PSITopAssetsResultDelegate)delegate;
- (__CFArray)assetIds;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)assetMatchCount;
- (void)dealloc;
- (void)fetchAssetUUIDsWithCompletionHandler:(id)a3;
- (void)setAssetIds:(__CFArray *)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PSITopAssetsResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PSITopAssetsResultDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSITopAssetsResultDelegate *)WeakRetained;
}

- (void)setAssetIds:(__CFArray *)a3
{
}

- (__CFArray)assetIds
{
  return self->_assetIds;
}

- (void)fetchAssetUUIDsWithCompletionHandler:(id)a3
{
  v3 = (void (**)(void))a3;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__29917;
  v10 = __Block_byref_object_dispose__29918;
  id v11 = 0;
  pl_dispatch_sync();
  if (v3 && v7[5])
  {
    dispatch_get_global_queue(0, 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    pl_dispatch_async();
  }
  else if (v3)
  {
    v3[2](v3);
  }
  _Block_object_dispose(&v6, 8);
}

void __59__PSITopAssetsResult_fetchAssetUUIDsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

void __59__PSITopAssetsResult_fetchAssetUUIDsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PSITopAssetsResult_fetchAssetUUIDsWithCompletionHandler___block_invoke_3;
  v5[3] = &unk_1E5868838;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  [v2 fetchAssetUUIDsForAssetIDs:v4 creationDateSorted:1 completionHandler:v5];
}

void __59__PSITopAssetsResult_fetchAssetUUIDsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v4 = v3;
  pl_dispatch_async();
}

void __59__PSITopAssetsResult_fetchAssetUUIDsWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  id v5 = *(id *)(a1 + 56);
  pl_dispatch_async();
}

uint64_t __59__PSITopAssetsResult_fetchAssetUUIDsWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSArray)assetUUIDs
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__29917;
  uint64_t v8 = __Block_byref_object_dispose__29918;
  id v9 = 0;
  pl_dispatch_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

void __32__PSITopAssetsResult_assetUUIDs__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)assetMatchCount
{
  unint64_t result = (unint64_t)self->_assetIds;
  if (result) {
    return CFArrayGetCount((CFArrayRef)result);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init((Class)objc_opt_class());
  v4[4] = CFArrayCreateCopy(0, self->_assetIds);
  uint64_t v5 = [(NSArray *)self->_assetUUIDs copy];
  uint64_t v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (void)dealloc
{
  assetIds = self->_assetIds;
  if (assetIds) {
    CFRelease(assetIds);
  }
  v4.receiver = self;
  v4.super_class = (Class)PSITopAssetsResult;
  [(PSITopAssetsResult *)&v4 dealloc];
}

- (PSITopAssetsResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)PSITopAssetsResult;
  uint64_t v2 = [(PSITopAssetsResult *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("PSITopAssetsResult.queue", 0);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end