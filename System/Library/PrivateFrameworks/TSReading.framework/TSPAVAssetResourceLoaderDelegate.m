@interface TSPAVAssetResourceLoaderDelegate
- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4;
- (TSPAVAssetResourceLoaderDelegate)initWithTSPFileDataStorage:(id)a3 contentTypeUTI:(id)a4;
- (id)delegateQueue;
- (void)_provideData:(id)a3 untilRequestCancelledForResourceLoadingRequest:(id)a4;
- (void)dealloc;
@end

@implementation TSPAVAssetResourceLoaderDelegate

- (TSPAVAssetResourceLoaderDelegate)initWithTSPFileDataStorage:(id)a3 contentTypeUTI:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TSPAVAssetResourceLoaderDelegate;
  v9 = [(TSPAVAssetResourceLoaderDelegate *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataStorage, a3);
    uint64_t v11 = [v8 copy];
    contentTypeUTI = v10->_contentTypeUTI;
    v10->_contentTypeUTI = (NSString *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("TSPFileDataStorage.AVAssetResourceLoader.request", MEMORY[0x263EF83A8]);
    concurrentRequestQueue = v10->_concurrentRequestQueue;
    v10->_concurrentRequestQueue = (OS_dispatch_queue *)v13;
  }
  return v10;
}

- (id)delegateQueue
{
  return self->_delegateQueue;
}

- (void)_provideData:(id)a3 untilRequestCancelledForResourceLoadingRequest:(id)a4
{
  v5 = a3;
  id v6 = a4;
  if (([v6 isCancelled] & 1) == 0)
  {
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __96__TSPAVAssetResourceLoaderDelegate__provideData_untilRequestCancelledForResourceLoadingRequest___block_invoke;
    applier[3] = &unk_2646B0410;
    id v8 = v6;
    dispatch_data_apply(v5, applier);
  }
}

uint64_t __96__TSPAVAssetResourceLoaderDelegate__provideData_untilRequestCancelledForResourceLoadingRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v8 = [*(id *)(a1 + 32) isCancelled];
  if ((v8 & 1) == 0)
  {
    v9 = [*(id *)(a1 + 32) dataRequest];
    v10 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:a4 length:a5 freeWhenDone:0];
    [v9 respondWithData:v10];
  }
  return v8 ^ 1u;
}

- (void)dealloc
{
  [(TSUReadChannel *)self->_readChannel close];
  v3.receiver = self;
  v3.super_class = (Class)TSPAVAssetResourceLoaderDelegate;
  [(TSPAVAssetResourceLoaderDelegate *)&v3 dealloc];
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v5 = a4;
  concurrentRequestQueue = self->_concurrentRequestQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __91__TSPAVAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke;
  v9[3] = &unk_2646AFAA0;
  id v10 = v5;
  uint64_t v11 = self;
  id v7 = v5;
  dispatch_async(concurrentRequestQueue, v9);

  return 1;
}

void __91__TSPAVAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 32) contentInformationRequest];

    if (v2)
    {
      objc_super v3 = [*(id *)(a1 + 32) contentInformationRequest];
      [v3 setContentType:*(void *)(*(void *)(a1 + 40) + 40)];
      objc_msgSend(v3, "setContentLength:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "encodedLength"));
      [v3 setByteRangeAccessSupported:1];
      v4 = [*(id *)(a1 + 32) dataRequest];

      if (!v4) {
        [*(id *)(a1 + 32) finishLoading];
      }
    }
    id v5 = [*(id *)(a1 + 32) dataRequest];

    if (v5)
    {
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __91__TSPAVAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_2;
      aBlock[3] = &unk_2646AFF48;
      int8x16_t v10 = *(int8x16_t *)(a1 + 32);
      id v6 = (id)v10.i64[0];
      int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
      id v7 = _Block_copy(aBlock);
      int v8 = v7;
      uint64_t v9 = *(void *)(a1 + 40);
      if (*(void *)(v9 + 24)) {
        (*((void (**)(void *))v7 + 2))(v7);
      }
      else {
        [*(id *)(v9 + 8) performIOChannelReadWithAccessor:v7];
      }
    }
  }
}

void __91__TSPAVAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), a2);
    dispatch_queue_t v5 = dispatch_queue_create("TSPFileDataStorage.AVAssetResourceLoader.Read", 0);
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    char v20 = 1;
    id v6 = [*(id *)(a1 + 40) dataRequest];
    uint64_t v7 = [v6 currentOffset];
    int v8 = [*(id *)(a1 + 40) dataRequest];
    uint64_t v9 = [v8 requestedLength];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __91__TSPAVAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_3;
    v15[3] = &unk_2646B01A0;
    v18 = v19;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 32);
    id v16 = v10;
    uint64_t v17 = v11;
    [v4 readFromOffset:v7 length:v9 queue:v5 handler:v15];

    _Block_object_dispose(v19, 8);
  }
  else
  {
    int8x16_t v12 = [MEMORY[0x263F7C7F0] currentHandler];
    dispatch_queue_t v13 = [NSString stringWithUTF8String:"-[TSPAVAssetResourceLoaderDelegate resourceLoader:shouldWaitForLoadingOfRequestedResource:]_block_invoke_2"];
    v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPAVAssetResourceLoaderDelegate.mm"];
    [v12 handleFailureInFunction:v13 file:v14 lineNumber:105 description:@"Expected a non-nil readChannel."];

    [*(id *)(a1 + 40) finishLoadingWithError:0];
  }
}

void __91__TSPAVAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_3(uint64_t a1, int a2, void *a3, void *a4)
{
  id v15 = a3;
  id v7 = a4;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && ([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    if (v7)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      [*(id *)(a1 + 32) finishLoadingWithError:v7];
    }
    else
    {
      if (v15)
      {
        [*(id *)(a1 + 40) _provideData:v15 untilRequestCancelledForResourceLoadingRequest:*(void *)(a1 + 32)];
      }
      else
      {
        int v8 = [*(id *)(a1 + 32) dataRequest];
        uint64_t v9 = malloc_type_malloc([v8 requestedLength], 0xC6DB5939uLL);

        id v10 = [*(id *)(a1 + 32) dataRequest];
        bzero(v9, [v10 requestedLength]);

        uint64_t v11 = [*(id *)(a1 + 32) dataRequest];
        int8x16_t v12 = (void *)MEMORY[0x263EFF8F8];
        dispatch_queue_t v13 = [*(id *)(a1 + 32) dataRequest];
        v14 = objc_msgSend(v12, "dataWithBytesNoCopy:length:", v9, objc_msgSend(v13, "requestedLength"));
        [v11 respondWithData:v14];
      }
      if ((([*(id *)(a1 + 32) isCancelled] | a2 ^ 1) & 1) == 0) {
        [*(id *)(a1 + 32) finishLoading];
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentTypeUTI, 0);
  objc_storeStrong((id *)&self->_concurrentRequestQueue, 0);
  objc_storeStrong((id *)&self->_readChannel, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);

  objc_storeStrong((id *)&self->_dataStorage, 0);
}

@end