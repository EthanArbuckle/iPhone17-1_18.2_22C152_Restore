@interface TSPFileDataStorage
- (BOOL)isInPackage:(id)a3;
- (BOOL)readOnly;
- (CGDataProvider)newCGDataProvider;
- (CGImageSource)newCGImageSource;
- (NSString)documentResourceLocator;
- (NSString)packageLocator;
- (id)AVAssetWithOptions:(id)a3 contentTypeUTI:(id)a4;
- (id)AVAssetWithOptions:(id)a3 usingResourceLoaderWithContentTypeUTI:(id)a4;
- (id)NSDataWithOptions:(unint64_t)a3;
- (id)bookmarkDataWithOptions:(unint64_t)a3;
- (id)filenameForPreferredFilename:(id)a3;
- (unint64_t)encodedLength;
- (unsigned)packageIdentifier;
- (void)performIOChannelReadWithAccessor:(id)a3;
- (void)performReadWithAccessor:(id)a3;
@end

@implementation TSPFileDataStorage

- (void)performReadWithAccessor:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F7C7F0] currentHandler];
  v5 = [NSString stringWithUTF8String:"-[TSPFileDataStorage performReadWithAccessor:]"];
  v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPFileDataStorage.mm"];
  [v4 handleFailureInFunction:v5 file:v6 lineNumber:46 description:@"Abstract method"];

  v7 = (void *)MEMORY[0x263EFF940];
  v8 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[TSPFileDataStorage performReadWithAccessor:]"];
  id v9 = [v7 exceptionWithName:*MEMORY[0x263EFF498] reason:v8 userInfo:0];

  objc_exception_throw(v9);
}

- (void)performIOChannelReadWithAccessor:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__TSPFileDataStorage_performIOChannelReadWithAccessor___block_invoke;
  v6[3] = &unk_2646B0128;
  id v7 = v4;
  id v5 = v4;
  [(TSPFileDataStorage *)self performReadWithAccessor:v6];
}

void __55__TSPFileDataStorage_performIOChannelReadWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263F7C830]) initForReadingURL:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)bookmarkDataWithOptions:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__TSPFileDataStorage_bookmarkDataWithOptions___block_invoke;
  v5[3] = &unk_2646B0150;
  v5[4] = &v6;
  v5[5] = a3;
  [(TSPFileDataStorage *)self performReadWithAccessor:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __46__TSPFileDataStorage_bookmarkDataWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v10 = 0;
    uint64_t v6 = [v3 bookmarkDataWithOptions:v5 includingResourceValuesForKeys:0 relativeToURL:0 error:&v10];
    id v7 = v10;
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v6;

    if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
      TSULogErrorInFunction();
    }
  }
}

- (CGDataProvider)newCGDataProvider
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__TSPFileDataStorage_newCGDataProvider__block_invoke;
  v4[3] = &unk_2646B0178;
  v4[4] = &v5;
  [(TSPFileDataStorage *)self performIOChannelReadWithAccessor:v4];
  v2 = (CGDataProvider *)v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __39__TSPFileDataStorage_newCGDataProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v9 = v3;
    id v4 = (void *)[objc_alloc(MEMORY[0x263F7C8B0]) initWithReadChannel:v3];
    if (([v4 canSeek] & 1) == 0)
    {
      uint64_t v5 = [MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSPFileDataStorage newCGDataProvider]_block_invoke"];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPFileDataStorage.mm"];
      [v5 handleFailureInFunction:v6 file:v7 lineNumber:90 description:@"Need a seekable input stream for -cgDataProvider"];
    }
    id v8 = v4;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CGDataProviderCreateSequential(v8, &TSPCGDataProviderCallbacks);

    id v3 = v9;
  }
}

- (CGImageSource)newCGImageSource
{
  result = [(TSPFileDataStorage *)self newCGDataProvider];
  if (result)
  {
    id v3 = result;
    id v4 = CGImageSourceCreateWithDataProvider(result, 0);
    CGDataProviderRelease(v3);
    return v4;
  }
  return result;
}

- (id)NSDataWithOptions:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__4;
  id v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__TSPFileDataStorage_NSDataWithOptions___block_invoke;
  v5[3] = &unk_2646B0178;
  v5[4] = &v6;
  [(TSPFileDataStorage *)self performIOChannelReadWithAccessor:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__TSPFileDataStorage_NSDataWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("TSPFileDataStorage.NSDataWithOptions.Read", 0);
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__4;
    v15 = __Block_byref_object_dispose__4;
    id v16 = [MEMORY[0x263EFF990] data];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __40__TSPFileDataStorage_NSDataWithOptions___block_invoke_2;
    v7[3] = &unk_2646B01A0;
    id v10 = &v11;
    id v8 = v3;
    uint64_t v6 = v5;
    id v9 = v6;
    [v8 readFromOffset:0 length:-1 queue:v4 handler:v7];
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), (id)v12[5]);

    _Block_object_dispose(&v11, 8);
  }
}

void __40__TSPFileDataStorage_NSDataWithOptions___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7 || v8)
  {
    if (v8)
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = 0;

      v12 = [MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v13 = [NSString stringWithUTF8String:"-[TSPFileDataStorage NSDataWithOptions:]_block_invoke_2"];
      v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPFileDataStorage.mm"];
      [v12 handleFailureInFunction:v13, v14, 136, @"Error creating NSData for TSPFileDataStorage, %@", v9 file lineNumber description];
    }
  }
  else
  {
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __40__TSPFileDataStorage_NSDataWithOptions___block_invoke_3;
    applier[3] = &unk_2646AFD90;
    applier[4] = *(void *)(a1 + 48);
    dispatch_data_apply(v7, applier);
  }
  if (a2)
  {
    [*(id *)(a1 + 32) close];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

uint64_t __40__TSPFileDataStorage_NSDataWithOptions___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return 1;
}

- (id)AVAssetWithOptions:(id)a3 contentTypeUTI:(id)a4
{
  id v5 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  id v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__TSPFileDataStorage_AVAssetWithOptions_contentTypeUTI___block_invoke;
  v9[3] = &unk_2646B01C8;
  id v10 = v5;
  uint64_t v11 = &v12;
  id v6 = v5;
  [(TSPFileDataStorage *)self performReadWithAccessor:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__TSPFileDataStorage_AVAssetWithOptions_contentTypeUTI___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFA8D0], "URLAssetWithURL:options:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)AVAssetWithOptions:(id)a3 usingResourceLoaderWithContentTypeUTI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F08C38] UUID];
  id v9 = [v8 UUIDString];

  id v10 = NSURL;
  uint64_t v11 = [@"iWorkAVAsset://" stringByAppendingString:v9];
  uint64_t v12 = [v10 URLWithString:v11];

  uint64_t v13 = [MEMORY[0x263EFA8D0] URLAssetWithURL:v12 options:v6];
  id v14 = [@"TSPFileDataStorage.AVAssetResourceLoaderDelegateQueue.Read" stringByAppendingString:v9];
  dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], 0);
  id v16 = [[TSPAVAssetResourceLoaderDelegate alloc] initWithTSPFileDataStorage:self contentTypeUTI:v7];
  id v17 = [v13 resourceLoader];
  [v17 setDelegate:v16 queue:v15];
  objc_setAssociatedObject(v13, "com.apple.iWork.resourceLoaderDelegate", v16, (void *)1);

  return v13;
}

- (NSString)documentResourceLocator
{
  return 0;
}

- (NSString)packageLocator
{
  return 0;
}

- (unsigned)packageIdentifier
{
  return 0;
}

- (id)filenameForPreferredFilename:(id)a3
{
  id v3 = a3;

  return v3;
}

- (unint64_t)encodedLength
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__TSPFileDataStorage_encodedLength__block_invoke;
  v4[3] = &unk_2646B01F0;
  v4[4] = &v5;
  [(TSPFileDataStorage *)self performReadWithAccessor:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __35__TSPFileDataStorage_encodedLength__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 path];
    id v6 = [v5 stringByRemovingPercentEncoding];

    uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
    id v10 = 0;
    uint64_t v8 = [v7 attributesOfItemAtPath:v6 error:&v10];
    id v9 = v10;

    if (v8) {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v8 fileSize];
    }
    else {
      TSULogErrorInFunction();
    }
  }
}

- (BOOL)readOnly
{
  return 0;
}

- (BOOL)isInPackage:(id)a3
{
  return 0;
}

@end