@interface STSImageCache
+ (id)sharedCache;
- (BOOL)_allowImageInfoCaching;
- (STSImageCache)init;
- (UIImage)searchProviderImage;
- (id)_imageFromSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (id)_imageInfoUsingAVAssetReaderWithFileURL:(id)a3;
- (id)_imageInfoWithData:(id)a3;
- (id)_imageSession;
- (id)fetchCachedImageInfoForURL:(id)a3;
- (id)fetchCachedStaticImageForURL:(id)a3;
- (id)fetchCachedStaticImageForURL:(id)a3 hasMultipleFrames:(BOOL *)a4;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)cancelAllDownloads;
- (void)cancelQueuedDownloadForURL:(id)a3;
- (void)clearInMemoryCache;
- (void)fetchImageDataWithURL:(id)a3 priority:(int64_t)a4 isSource:(BOOL)a5 begin:(id)a6 progress:(id)a7 completion:(id)a8;
- (void)fetchImageWithURL:(id)a3 priority:(int64_t)a4 isSource:(BOOL)a5 begin:(id)a6 progress:(id)a7 completion:(id)a8;
- (void)setPriority:(int64_t)a3 forQueuedDownloadWithURL:(id)a4;
- (void)setSearchProviderImage:(id)a3;
@end

@implementation STSImageCache

+ (id)sharedCache
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__STSImageCache_sharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, block);
  }
  v2 = (void *)sharedCache_SharedCache;

  return v2;
}

uint64_t __28__STSImageCache_sharedCache__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v1 = sharedCache_SharedCache;
  sharedCache_SharedCache = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (STSImageCache)init
{
  v20.receiver = self;
  v20.super_class = (Class)STSImageCache;
  v2 = [(STSImageCache *)&v20 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:4];
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    downloadOperationInfos = v2->_downloadOperationInfos;
    v2->_downloadOperationInfos = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    cancelledDownloadOperationInfos = v2->_cancelledDownloadOperationInfos;
    v2->_cancelledDownloadOperationInfos = (NSMutableDictionary *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.siri.parsec.SearchToShareApp.SearchToShareAppExtension.queuedOperationsInfo", 0);
    queuedOperationsInfoQueue = v2->_queuedOperationsInfoQueue;
    v2->_queuedOperationsInfoQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x263F08B98]) initWithMemoryCapacity:0 diskCapacity:314572800 diskPath:@"STSImageCache.urlcache"];
    urlCache = v2->_urlCache;
    v2->_urlCache = (NSURLCache *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    staticImageCache = v2->_staticImageCache;
    v2->_staticImageCache = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    firstFrameImageCache = v2->_firstFrameImageCache;
    v2->_firstFrameImageCache = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    imageInfoCache = v2->_imageInfoCache;
    v2->_imageInfoCache = (NSMutableDictionary *)v17;
  }
  return v2;
}

- (id)fetchCachedStaticImageForURL:(id)a3
{
  return [(STSImageCache *)self fetchCachedStaticImageForURL:a3 hasMultipleFrames:0];
}

- (id)fetchCachedStaticImageForURL:(id)a3 hasMultipleFrames:(BOOL *)a4
{
  id v6 = a3;
  if (!v6)
  {
    v8 = 0;
    goto LABEL_7;
  }
  uint64_t v7 = [(NSMutableDictionary *)self->_firstFrameImageCache objectForKey:v6];
  if (!v7)
  {
    v8 = [(NSMutableDictionary *)self->_staticImageCache objectForKey:v6];
LABEL_7:
    BOOL v9 = 0;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v8 = (void *)v7;
  BOOL v9 = 1;
  if (a4) {
LABEL_8:
  }
    *a4 = v9;
LABEL_9:

  return v8;
}

- (id)fetchCachedImageInfoForURL:(id)a3
{
  if (a3)
  {
    v4 = -[NSMutableDictionary objectForKey:](self->_imageInfoCache, "objectForKey:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)fetchImageWithURL:(id)a3 priority:(int64_t)a4 isSource:(BOOL)a5 begin:(id)a6 progress:(id)a7 completion:(id)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a8;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke;
  v18[3] = &unk_264A06150;
  v18[4] = self;
  id v19 = v14;
  id v20 = v15;
  id v16 = v15;
  id v17 = v14;
  [(STSImageCache *)self fetchImageDataWithURL:v17 priority:a4 isSource:v11 begin:a6 progress:a7 completion:v18];
}

void __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  unint64_t v11 = a2;
  unint64_t v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!(v11 | v12))
  {
    v18 = 0;
    goto LABEL_20;
  }
  id v16 = [v13 lowercaseString];
  if (([v16 containsString:@"gif"] & 1) == 0
    && ([v16 containsString:@"jpeg"] & 1) == 0
    && ![v16 containsString:@"png"])
  {
    v35 = [v13 lowercaseString];
    int v36 = [v35 containsString:@"mp4"];

    if (v36)
    {
      if (v12)
      {
        if ([*(id *)(a1 + 32) _allowImageInfoCaching])
        {
          v53[0] = MEMORY[0x263EF8330];
          v53[1] = 3221225472;
          v53[2] = __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke_18;
          v53[3] = &unk_264A059D0;
          v53[4] = *(void *)(a1 + 32);
          id v54 = (id)v12;
          id v55 = *(id *)(a1 + 40);
          dispatch_async(MEMORY[0x263EF83A0], v53);
        }
        else
        {
          v44 = [(id)v12 frames];
          v45 = [v44 firstObject];

          if (v45)
          {
            v46 = [(id)v12 frames];
            BOOL v47 = (unint64_t)[v46 count] > 1;

            v49[0] = MEMORY[0x263EF8330];
            v49[1] = 3221225472;
            v49[2] = __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke_2_19;
            v49[3] = &unk_264A06128;
            BOOL v52 = v47;
            v49[4] = *(void *)(a1 + 32);
            id v50 = v45;
            id v51 = *(id *)(a1 + 40);
            dispatch_async(MEMORY[0x263EF83A0], v49);
          }
        }
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke_cold_2(a1, v37, v38, v39, v40, v41, v42, v43);
    }
    goto LABEL_18;
  }
  if (([v16 containsString:@"jpeg"] & 1) != 0
    || [v16 containsString:@"png"])
  {
    id v17 = [MEMORY[0x263F827E8] imageWithData:v11];
    v18 = objc_msgSend(v17, "sts_nonAlphaImage");

    if (v18) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
  v18 = objc_msgSend(MEMORY[0x263F827E8], "agif_animatedImageWithAnimatedGIFData:", v11);
  if (!v18)
  {
LABEL_16:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke_cold_1(a1, v27, v28, v29, v30, v31, v32, v33);
    }
LABEL_18:
    v18 = 0;
    goto LABEL_19;
  }
LABEL_8:
  id v48 = v14;
  uint64_t v19 = a1;
  id v20 = [v18 images];
  unint64_t v21 = [v20 count];

  BOOL v22 = v21 > 1;
  if (v21 > 1)
  {
    v23 = [v18 images];
    id v24 = [v23 firstObject];

    a1 = v19;
    if (!v24) {
      goto LABEL_14;
    }
  }
  else
  {
    id v24 = v18;
    a1 = v19;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke_2;
  block[3] = &unk_264A06128;
  BOOL v59 = v22;
  v25 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v57 = v24;
  id v58 = v25;
  id v26 = v24;
  dispatch_async(MEMORY[0x263EF83A0], block);

LABEL_14:
  id v14 = v48;
LABEL_19:

LABEL_20:
  uint64_t v34 = *(void *)(a1 + 48);
  if (v34) {
    (*(void (**)(uint64_t, void *, unint64_t, id, id, id))(v34 + 16))(v34, v18, v12, v13, v14, v15);
  }
}

uint64_t __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = 40;
  if (!*(unsigned char *)(a1 + 56)) {
    uint64_t v1 = 32;
  }
  return [*(id *)(*(void *)(a1 + 32) + v1) setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

uint64_t __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke_18(void *a1)
{
  return [*(id *)(a1[4] + 48) setObject:a1[5] forKey:a1[6]];
}

uint64_t __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke_2_19(uint64_t a1)
{
  uint64_t v1 = 40;
  if (!*(unsigned char *)(a1 + 56)) {
    uint64_t v1 = 32;
  }
  return [*(id *)(*(void *)(a1 + 32) + v1) setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (void)fetchImageDataWithURL:(id)a3 priority:(int64_t)a4 isSource:(BOOL)a5 begin:(id)a6 progress:(id)a7 completion:(id)a8
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  if (v13)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v13;
      _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Fetch image data for %@", buf, 0xCu);
    }
    id v17 = dispatch_get_global_queue(25, 0);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke;
    v18[3] = &unk_264A06328;
    id v19 = v13;
    id v20 = self;
    id v21 = v16;
    int64_t v24 = a4;
    id v22 = v14;
    id v23 = v15;
    dispatch_async(v17, v18);
  }
}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke(uint64_t a1)
{
  v55[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08BD8] requestWithURL:*(void *)(a1 + 32)];
  if (v2)
  {
    uint64_t v50 = 0;
    id v51 = &v50;
    uint64_t v52 = 0x2020000000;
    char v53 = 0;
    uint64_t v3 = *(void *)(a1 + 40);
    v4 = *(NSObject **)(v3 + 72);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_2;
    block[3] = &unk_264A06178;
    block[4] = v3;
    id v44 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 72);
    id v48 = &v50;
    uint64_t v49 = v5;
    id v45 = *(id *)(a1 + 56);
    id v46 = *(id *)(a1 + 64);
    id v47 = *(id *)(a1 + 48);
    dispatch_sync(v4, block);
    if (!*((unsigned char *)v51 + 24))
    {
      id v6 = [*(id *)(*(void *)(a1 + 40) + 24) cachedResponseForRequest:v2];
      uint64_t v7 = [v6 response];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (v8 = v7, BOOL v9 = [v8 statusCode] == 200, v8, v9))
      {
        v10 = (void *)MEMORY[0x263F086D0];
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_3;
        v40[3] = &unk_264A059D0;
        int8x16_t v25 = *(int8x16_t *)(a1 + 32);
        id v11 = (id)v25.i64[0];
        int8x16_t v41 = vextq_s8(v25, v25, 8uLL);
        id v42 = v6;
        unint64_t v12 = [v10 blockOperationWithBlock:v40];

        id v13 = (id *)&v41.i64[1];
      }
      else
      {
        id v17 = [STSImageDownloadOperation alloc];
        v18 = [*(id *)(a1 + 40) _imageSession];
        uint64_t v19 = *(void *)(a1 + 56);
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_2_36;
        v38[3] = &unk_264A06238;
        int8x16_t v26 = *(int8x16_t *)(a1 + 32);
        id v20 = (id)v26.i64[0];
        int8x16_t v39 = vextq_s8(v26, v26, 8uLL);
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_5;
        v35[3] = &unk_264A062D8;
        int8x16_t v27 = *(int8x16_t *)(a1 + 32);
        id v21 = (id)v27.i64[0];
        int8x16_t v36 = vextq_s8(v27, v27, 8uLL);
        id v37 = v2;
        unint64_t v12 = [(STSImageDownloadOperation *)v17 initWithRequest:v37 session:v18 begin:v19 progress:v38 completion:v35];

        id v13 = (id *)&v39.i64[1];
      }

      id v22 = *(NSObject **)(*(void *)(a1 + 40) + 72);
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_2_62;
      v29[3] = &unk_264A06300;
      id v23 = v12;
      uint64_t v30 = v23;
      id v32 = *(id *)(a1 + 56);
      id v33 = *(id *)(a1 + 64);
      id v34 = *(id *)(a1 + 48);
      int8x16_t v28 = *(int8x16_t *)(a1 + 32);
      id v24 = (id)v28.i64[0];
      int8x16_t v31 = vextq_s8(v28, v28, 8uLL);
      dispatch_sync(v22, v29);
      [(STSImageDownloadOperation *)v23 setQueuePriority:*(void *)(a1 + 72)];
      [*(id *)(*(void *)(a1 + 40) + 8) addOperation:v23];
    }
    _Block_object_dispose(&v50, 8);
  }
  else if (*(void *)(a1 + 48))
  {
    uint64_t v54 = *MEMORY[0x263F08320];
    id v14 = STSLocalizedString(@"ERROR_DESC_INVALID_REQUEST");
    v55[0] = v14;
    id v15 = [NSDictionary dictionaryWithObjects:v55 forKeys:&v54 count:1];

    id v16 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"STSErrorDomain" code:3 userInfo:v15];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_2(void *a1)
{
  v2 = [*(id *)(a1[4] + 56) objectForKeyedSubscript:a1[5]];
  if (v2)
  {
    id v6 = v2;
    uint64_t v3 = [v2 operation];
    char v4 = [v3 isFinished];

    v2 = v6;
    if ((v4 & 1) == 0)
    {
      *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
      uint64_t v5 = [v6 operation];
      [v5 setQueuePriority:a1[10]];

      if (a1[6]) {
        objc_msgSend(v6, "addBegin:");
      }
      if (a1[7]) {
        objc_msgSend(v6, "addProgress:");
      }
      v2 = v6;
      if (a1[8])
      {
        objc_msgSend(v6, "addCompletion:");
        v2 = v6;
      }
    }
  }
}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_3(id *a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  int8x16_t v25 = __Block_byref_object_copy__2;
  int8x16_t v26 = __Block_byref_object_dispose__2;
  id v27 = 0;
  id v2 = a1[4];
  uint64_t v3 = *((void *)v2 + 9);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_29;
  block[3] = &unk_264A061A0;
  block[4] = v2;
  id v20 = a1[5];
  id v21 = &v22;
  dispatch_sync(v3, block);
  char v4 = [a1[6] data];
  uint64_t v5 = [a1[6] response];
  id v6 = [v5 allHeaderFields];
  uint64_t v7 = [v6 objectForKey:@"Content-Type"];

  id v8 = [v7 lowercaseString];
  LODWORD(v6) = [v8 containsString:@"mp4"];

  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = a1[5];
      *(_DWORD *)buf = 138412290;
      id v29 = v9;
      _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Cache Hit for URL: %@", buf, 0xCu);
    }
    v10 = [a1[4] _imageInfoWithData:v4];
  }
  else
  {
    v10 = 0;
  }
  id v11 = (void *)v23[5];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_33;
  v15[3] = &unk_264A061C8;
  id v12 = v4;
  id v16 = v12;
  id v13 = v10;
  id v17 = v13;
  id v14 = v7;
  id v18 = v14;
  [v11 enumerateObjectsUsingBlock:v15];

  _Block_object_dispose(&v22, 8);
}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_29(void *a1)
{
  id v5 = [*(id *)(a1[4] + 56) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = [v5 completionBlocks];
  uint64_t v3 = *(void *)(a1[6] + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(a1[4] + 56) setObject:0 forKeyedSubscript:a1[5]];
}

uint64_t __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_33(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void, void, void, void))(a2 + 16))(a2, a1[4], a1[5], a1[6], 0, 0);
}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_2_36(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 72);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_3_37;
  v7[3] = &unk_264A06210;
  v7[4] = v5;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = a2;
  uint64_t v10 = a3;
  dispatch_sync(v6, v7);
}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_3_37(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 progressBlocks];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_4;
  v4[3] = &__block_descriptor_48_e23_v32__0___v__qq_8Q16_B24l;
  long long v5 = *(_OWORD *)(a1 + 48);
  [v3 enumerateObjectsUsingBlock:v4];
}

uint64_t __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v67 = a4;
  id v11 = a5;
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__2;
  v87 = __Block_byref_object_dispose__2;
  id v88 = 0;
  id v12 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_6;
  block[3] = &unk_264A06260;
  id v13 = v11;
  uint64_t v14 = *(void *)(a1 + 32);
  id v79 = v13;
  uint64_t v80 = v14;
  uint64_t v15 = a1 + 40;
  id v81 = *(id *)(a1 + 40);
  v82 = &v83;
  dispatch_sync(v12, block);
  id v16 = v9;
  id v17 = v16;
  if (v10 && [v16 statusCode] == 200)
  {
    id v18 = [v17 allHeaderFields];
    v66 = [v18 objectForKey:@"Content-Type"];

    v65 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v10];
    v64 = (void *)[objc_alloc(MEMORY[0x263F086F8]) initWithResponse:v17 data:v65];
    [*(id *)(*(void *)(a1 + 32) + 24) storeCachedResponse:v64 forRequest:*(void *)(a1 + 48)];
    uint64_t v19 = [v66 lowercaseString];
    int v20 = [v19 containsString:@"mp4"];

    if (v20)
    {
      v62 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
      v63 = [v62 firstObject];
      id v21 = [NSString alloc];
      uint64_t v22 = NSString;
      id v23 = [MEMORY[0x263F08C38] UUID];
      uint64_t v24 = [v23 UUIDString];
      int8x16_t v25 = [v22 stringWithFormat:@"%@.mp4", v24];
      int8x16_t v26 = [v63 stringByAppendingPathComponent:v25];
      id v27 = (void *)[v21 initWithString:v26];

      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "write file", buf, 2u);
      }
      int8x16_t v28 = [MEMORY[0x263F08850] defaultManager];
      id v29 = [NSURL fileURLWithPath:v27];
      id v75 = v13;
      [v28 moveItemAtURL:v10 toURL:v29 error:&v75];
      id v30 = v75;

      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "finished writing file", buf, 2u);
      }
      int8x16_t v31 = [NSURL fileURLWithPath:v27];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "start MP4Processing", buf, 2u);
      }
      double Current = CFAbsoluteTimeGetCurrent();
      id v33 = [*(id *)(a1 + 32) _imageInfoUsingAVAssetReaderWithFileURL:v31];
      double v34 = CFAbsoluteTimeGetCurrent();
      v35 = &_os_log_internal;
      id v36 = &_os_log_internal;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        id v37 = [NSNumber numberWithDouble:v34 - Current];
        *(_DWORD *)buf = 138412290;
        v92 = v37;
        _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "elapsedTimeMP4Processing %@", buf, 0xCu);
      }
      if (!v33 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_5_cold_1(v15, v38, v39, v40, v41, v42, v43, v44);
      }
      [v28 removeItemAtPath:v27 error:0];

      id v45 = 0;
    }
    else
    {
      v62 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
      v63 = [v62 firstObject];
      id v49 = [NSString alloc];
      uint64_t v50 = NSString;
      id v51 = [MEMORY[0x263F08C38] UUID];
      uint64_t v52 = [v51 UUIDString];
      char v53 = [v50 stringWithFormat:@"%@", v52];
      uint64_t v54 = [v63 stringByAppendingPathComponent:v53];
      id v27 = (void *)[v49 initWithString:v54];

      int8x16_t v28 = [MEMORY[0x263F08850] defaultManager];
      id v55 = [NSURL fileURLWithPath:v27];
      id v74 = v13;
      LODWORD(v52) = [v28 moveItemAtURL:v10 toURL:v55 error:&v74];
      id v30 = v74;

      if (v52)
      {
        id v45 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v27];
        if (![v45 length])
        {
          uint64_t v89 = *MEMORY[0x263F08320];
          v56 = STSLocalizedString(@"ERROR_DESC_IMAGE_DATA_UNAVAILABLE");
          v90 = v56;
          id v57 = [NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];

          uint64_t v58 = [objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"STSErrorDomain" code:5 userInfo:v57];
          id v30 = (id)v58;
        }
      }
      else
      {
        id v45 = 0;
      }
      [v28 removeItemAtPath:v27 error:0];
      id v33 = 0;
    }

    BOOL v59 = (void *)v84[5];
    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_60;
    v68[3] = &unk_264A062B0;
    id v48 = v45;
    id v69 = v48;
    id v60 = v33;
    id v70 = v60;
    id v61 = v66;
    id v71 = v61;
    id v72 = v67;
    id v47 = v30;
    id v73 = v47;
    [v59 enumerateObjectsUsingBlock:v68];
  }
  else
  {
    id v46 = (void *)v84[5];
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_7;
    v76[3] = &unk_264A06288;
    id v47 = v13;
    id v77 = v47;
    [v46 enumerateObjectsUsingBlock:v76];
    id v48 = v77;
  }

  _Block_object_dispose(&v83, 8);
}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_6(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2 && [v2 code] == -999) {
    uint64_t v3 = 64;
  }
  else {
    uint64_t v3 = 56;
  }
  id v7 = [*(id *)(a1[5] + v3) objectForKeyedSubscript:a1[6]];
  [*(id *)(a1[5] + v3) setObject:0 forKeyedSubscript:a1[6]];
  uint64_t v4 = [v7 completionBlocks];
  uint64_t v5 = *(void *)(a1[7] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_7(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  if (!v4)
  {
    uint64_t v9 = *MEMORY[0x263F08320];
    uint64_t v5 = STSLocalizedString(@"ERROR_DESC_COULD_NOT_DOWNLOAD");
    v10[0] = v5;
    id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

    id v4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"STSErrorDomain" code:4 userInfo:v6];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Download error. %@", (uint8_t *)&v7, 0xCu);
  }
  (*((void (**)(id, void, void, void, void, id))v3 + 2))(v3, 0, 0, 0, 0, v4);
}

uint64_t __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_60(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void, void, void, void))(a2 + 16))(a2, a1[4], a1[5], a1[6], a1[7], a1[8]);
}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_2_62(void *a1)
{
  uint64_t v2 = [[STSDownloadOperationInfo alloc] initWithOperation:a1[4] begin:a1[7] progress:a1[8] completion:a1[9]];
  [*(id *)(a1[5] + 56) setObject:v2 forKeyedSubscript:a1[6]];
}

- (void)setPriority:(int64_t)a3 forQueuedDownloadWithURL:(id)a4
{
  id v6 = a4;
  int v7 = v6;
  if (v6)
  {
    queuedOperationsInfoQueue = self->_queuedOperationsInfoQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__STSImageCache_setPriority_forQueuedDownloadWithURL___block_invoke;
    block[3] = &unk_264A05A70;
    void block[4] = self;
    id v10 = v6;
    int64_t v11 = a3;
    dispatch_async(queuedOperationsInfoQueue, block);
  }
}

void __54__STSImageCache_setPriority_forQueuedDownloadWithURL___block_invoke(void *a1)
{
  id v3 = [*(id *)(a1[4] + 56) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = [v3 operation];
  [v2 setQueuePriority:a1[6]];
}

- (void)cancelQueuedDownloadForURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queuedOperationsInfoQueue = self->_queuedOperationsInfoQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__STSImageCache_cancelQueuedDownloadForURL___block_invoke;
    v7[3] = &unk_264A05958;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queuedOperationsInfoQueue, v7);
  }
}

void __44__STSImageCache_cancelQueuedDownloadForURL___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 56) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 64) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v2 = [v3 operation];
  [v2 cancel];
}

- (void)cancelAllDownloads
{
  queuedOperationsInfoQueue = self->_queuedOperationsInfoQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__STSImageCache_cancelAllDownloads__block_invoke;
  block[3] = &unk_264A053F0;
  void block[4] = self;
  dispatch_sync(queuedOperationsInfoQueue, block);
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
}

uint64_t __35__STSImageCache_cancelAllDownloads__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 56);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__STSImageCache_cancelAllDownloads__block_invoke_2;
  v5[3] = &unk_264A06350;
  v5[4] = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];
  return [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
}

uint64_t __35__STSImageCache_cancelAllDownloads__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) setObject:a3 forKey:a2];
}

- (void)clearInMemoryCache
{
  [(NSMutableDictionary *)self->_firstFrameImageCache removeAllObjects];
  [(NSMutableDictionary *)self->_staticImageCache removeAllObjects];
  imageInfoCache = self->_imageInfoCache;

  [(NSMutableDictionary *)imageInfoCache removeAllObjects];
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy__2;
    uint64_t v24 = __Block_byref_object_dispose__2;
    id v25 = 0;
    queuedOperationsInfoQueue = self->_queuedOperationsInfoQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__STSImageCache_URLSession_task_didCompleteWithError___block_invoke;
    block[3] = &unk_264A061A0;
    id v12 = v9;
    id v17 = v12;
    id v18 = self;
    uint64_t v19 = &v20;
    dispatch_sync(queuedOperationsInfoQueue, block);
    id v13 = (void *)v21[5];
    uint64_t v14 = [v12 response];
    uint64_t v15 = [v12 _timingData];
    [v13 completedWithResponse:v14 location:0 timingData:v15 error:v10];

    _Block_object_dispose(&v20, 8);
  }
}

void __54__STSImageCache_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) originalRequest];
  id v7 = [v2 URL];

  id v3 = [*(id *)(*(void *)(a1 + 40) + 64) objectForKeyedSubscript:v7];
  if (!v3)
  {
    id v3 = [*(id *)(*(void *)(a1 + 40) + 56) objectForKeyedSubscript:v7];
  }
  uint64_t v4 = [v3 operation];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__2;
  id v23 = __Block_byref_object_dispose__2;
  id v24 = 0;
  queuedOperationsInfoQueue = self->_queuedOperationsInfoQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__STSImageCache_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke;
  block[3] = &unk_264A061A0;
  void block[4] = self;
  id v12 = v9;
  id v17 = v12;
  id v18 = &v19;
  dispatch_sync(queuedOperationsInfoQueue, block);
  id v13 = (void *)v20[5];
  uint64_t v14 = [v12 response];
  uint64_t v15 = [v12 _timingData];
  [v13 completedWithResponse:v14 location:v10 timingData:v15 error:0];

  _Block_object_dispose(&v19, 8);
}

void __67__STSImageCache_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  id v3 = [*(id *)(a1 + 40) originalRequest];
  uint64_t v4 = [v3 URL];
  id v8 = [v2 objectForKeyedSubscript:v4];

  uint64_t v5 = [v8 operation];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__2;
  uint64_t v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  queuedOperationsInfoQueue = self->_queuedOperationsInfoQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98__STSImageCache_URLSession_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke;
  block[3] = &unk_264A061A0;
  void block[4] = self;
  id v14 = v12;
  id v16 = v14;
  id v17 = &v18;
  dispatch_sync(queuedOperationsInfoQueue, block);
  [(id)v19[5] updateProgressWithTotalBytesWritten:a6 totalBytesExpectedToWrite:a7];

  _Block_object_dispose(&v18, 8);
}

void __98__STSImageCache_URLSession_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  id v3 = [*(id *)(a1 + 40) originalRequest];
  uint64_t v4 = [v3 URL];
  id v8 = [v2 objectForKeyedSubscript:v4];

  uint64_t v5 = [v8 operation];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_imageSession
{
  v15[1] = *MEMORY[0x263EF8340];
  imageSession = self->_imageSession;
  if (!imageSession)
  {
    uint64_t v4 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    uint64_t v5 = NSString;
    uint64_t v6 = (void *)MGCopyAnswer();
    id v7 = (void *)MGCopyAnswer();
    id v8 = (void *)MGCopyAnswer();
    id v9 = [v5 stringWithFormat:@"%@ %@; %@ %@", @"Messages/1.0", v6, v7, v8];

    id v14 = @"User-Agent";
    v15[0] = v9;
    id v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    [v4 setHTTPAdditionalHeaders:v10];

    [v4 setURLCache:self->_urlCache];
    [v4 setHTTPCookieAcceptPolicy:1];
    [v4 setHTTPMaximumConnectionsPerHost:4];
    [v4 setTimeoutIntervalForResource:60.0];
    [v4 setTimeoutIntervalForRequest:15.0];
    objc_msgSend(v4, "set_connectionCacheCellPurgeTimeout:", 10.0);
    objc_msgSend(v4, "set_timingDataOptions:", 9);
    id v11 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v4 delegate:self delegateQueue:0];
    id v12 = self->_imageSession;
    self->_imageSession = v11;

    imageSession = self->_imageSession;
  }

  return imageSession;
}

- (id)_imageInfoUsingAVAssetReaderWithFileURL:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v4 = [MEMORY[0x263EFA470] assetWithURL:a3];
  id v41 = 0;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFA4C0]) initWithAsset:v4 error:&v41];
  id v6 = v41;
  if (v5)
  {
    id v7 = [v4 tracksWithMediaType:*MEMORY[0x263EF9D48]];
    if ([v7 count])
    {
      id v36 = v6;
      uint64_t v8 = [v7 objectAtIndex:0];
      id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [v9 setObject:&unk_26E2BAA68 forKey:*MEMORY[0x263F04180]];
      id v37 = v9;
      id v10 = (void *)[objc_alloc(MEMORY[0x263EFA4D8]) initWithTrack:v8 outputSettings:v9];
      [v5 addOutput:v10];
      if (([v5 startReading] & 1) == 0)
      {
        id v11 = [v5 error];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v43 = v11;
          _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Calling AVAssetReader failed with error: %@", buf, 0xCu);
        }
      }
      uint64_t v32 = v8;
      double v34 = v7;
      id v12 = objc_opt_new();
      if ([v5 status] == 1)
      {
        id v13 = &_os_log_internal;
        do
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22F3DE000, v13, OS_LOG_TYPE_DEFAULT, "AVAssetReaderStatusReading", buf, 2u);
          }
          uint64_t v14 = objc_msgSend(v10, "copyNextSampleBuffer", v32, v34);
          if (!v14) {
            break;
          }
          uint64_t v15 = (const void *)v14;
          id v16 = [(STSImageCache *)self _imageFromSampleBuffer:v14];
          if (v16) {
            [v12 addObject:v16];
          }
          CFRelease(v15);
        }
        while ([v5 status] == 1);
      }
      uint64_t v17 = objc_msgSend(v5, "status", v32, v34);
      [v5 cancelReading];
      if ([v12 count])
      {
        uint64_t v18 = objc_alloc_init(STSAnimatedImageInfo);
        if (v4)
        {
          [v4 duration];
          id v6 = v36;
          if (v40)
          {
            [v4 duration];
            double v19 = (double)v39;
          }
          else
          {
            double v19 = 600.0;
          }
          id v27 = v33;
          id v7 = v35;
          [v4 duration];
          double v28 = (double)v38 / v19;
        }
        else
        {
          double v28 = 0.0;
          id v7 = v35;
          id v6 = v36;
          id v27 = v33;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          id v29 = [NSNumber numberWithDouble:v28];
          id v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
          *(_DWORD *)buf = 138412546;
          uint64_t v43 = v29;
          __int16 v44 = 2112;
          id v45 = v30;
          _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DLS duration %@ numFrames %@", buf, 0x16u);
        }
        [(STSAnimatedImageInfo *)v18 setDuration:v28];
        [(STSAnimatedImageInfo *)v18 setFrames:v12];
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[STSImageCache _imageInfoUsingAVAssetReaderWithFileURL:](v17);
        }
        uint64_t v18 = 0;
        id v7 = v35;
        id v6 = v36;
        id v27 = v33;
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[STSImageCache _imageInfoUsingAVAssetReaderWithFileURL:]();
      }
      uint64_t v18 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[STSImageCache _imageInfoUsingAVAssetReaderWithFileURL:]((uint64_t)v6, v20, v21, v22, v23, v24, v25, v26);
    }
    uint64_t v18 = 0;
  }

  return v18;
}

- (id)_imageFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  CVPixelBufferLockBaseAddress(ImageBuffer, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(ImageBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(ImageBuffer);
  size_t Width = CVPixelBufferGetWidth(ImageBuffer);
  size_t Height = CVPixelBufferGetHeight(ImageBuffer);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  id v9 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, DeviceRGB, 0x2006u);
  Image = CGBitmapContextCreateImage(v9);
  CVPixelBufferUnlockBaseAddress(ImageBuffer, 0);
  CGContextRelease(v9);
  CGColorSpaceRelease(DeviceRGB);
  id v11 = (void *)MEMORY[0x263F827E8];
  id v12 = [MEMORY[0x263F82B60] mainScreen];
  [v12 scale];
  id v13 = objc_msgSend(v11, "imageWithCGImage:scale:orientation:", Image, 0);

  CGImageRelease(Image);

  return v13;
}

- (id)_imageInfoWithData:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)MEMORY[0x263F08850];
  id v5 = a3;
  id v6 = [v4 defaultManager];
  id v7 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  uint64_t v8 = [v7 firstObject];
  id v9 = [NSString alloc];
  id v10 = NSString;
  id v11 = [MEMORY[0x263F08C38] UUID];
  id v12 = [v11 UUIDString];
  id v13 = [v10 stringWithFormat:@"%@.mp4", v12];
  uint64_t v14 = [v8 stringByAppendingPathComponent:v13];
  uint64_t v15 = (void *)[v9 initWithString:v14];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v34 = v15;
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "video file %@", buf, 0xCu);
  }
  int v16 = [v5 writeToFile:v15 atomically:1];

  if (v16)
  {
    uint64_t v17 = [NSURL fileURLWithPath:v15];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "start MP4Processing", buf, 2u);
    }
    double Current = CFAbsoluteTimeGetCurrent();
    double v19 = [(STSImageCache *)self _imageInfoUsingAVAssetReaderWithFileURL:v17];
    uint64_t v20 = v19;
    if (!v19
      || ([v19 frames],
          uint64_t v21 = objc_claimAutoreleasedReturnValue(),
          uint64_t v22 = [v21 count],
          v21,
          !v22))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[STSImageCache _imageInfoWithData:]();
      }
    }
    double v23 = CFAbsoluteTimeGetCurrent();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [NSNumber numberWithDouble:v23 - Current];
      *(_DWORD *)buf = 138412290;
      double v34 = v24;
      _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "end MP4Processing (duration %@)", buf, 0xCu);
    }
    [v6 removeItemAtPath:v15 error:0];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[STSImageCache _imageInfoWithData:]((uint64_t)v15, v25, v26, v27, v28, v29, v30, v31);
    }
    uint64_t v20 = 0;
  }

  return v20;
}

- (BOOL)_allowImageInfoCaching
{
  return 0;
}

- (UIImage)searchProviderImage
{
  return self->_searchProviderImage;
}

- (void)setSearchProviderImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchProviderImage, 0);
  objc_storeStrong((id *)&self->_queuedOperationsInfoQueue, 0);
  objc_storeStrong((id *)&self->_cancelledDownloadOperationInfos, 0);
  objc_storeStrong((id *)&self->_downloadOperationInfos, 0);
  objc_storeStrong((id *)&self->_imageInfoCache, 0);
  objc_storeStrong((id *)&self->_firstFrameImageCache, 0);
  objc_storeStrong((id *)&self->_staticImageCache, 0);
  objc_storeStrong((id *)&self->_urlCache, 0);
  objc_storeStrong((id *)&self->_imageSession, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

void __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22F3DE000, &_os_log_internal, a3, "Unsupport content-type returned: %@", a5, a6, a7, a8, 2u);
}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_5_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_imageInfoUsingAVAssetReaderWithFileURL:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_imageInfoUsingAVAssetReaderWithFileURL:.cold.2()
{
  *(_WORD *)id v0 = 0;
  _os_log_error_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "No valid tracks for video asset", v0, 2u);
}

- (void)_imageInfoUsingAVAssetReaderWithFileURL:(uint64_t)a1 .cold.3(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithInteger:a1];
  OUTLINED_FUNCTION_0(&dword_22F3DE000, &_os_log_internal, v2, "Could not create frames for video asset, final reader status: %@", v3, v4, v5, v6, 2u);
}

- (void)_imageInfoWithData:.cold.1()
{
  *(_WORD *)id v0 = 0;
  _os_log_error_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to create image info for data", v0, 2u);
}

- (void)_imageInfoWithData:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end