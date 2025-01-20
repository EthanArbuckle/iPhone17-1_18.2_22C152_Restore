@interface FCPuzzleThumbnailURLProtocol
+ (BOOL)canHandleURL:(id)a3;
+ (BOOL)canHandleURLWithComponents:(id)a3;
+ (BOOL)canInitWithRequest:(id)a3;
+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4;
+ (id)URLForResourceMapID:(id)a3 publishDate:(id)a4 difficulty:(id)a5;
+ (id)canonicalRequestForRequest:(id)a3;
+ (id)resourceMapSerialQueue;
+ (id)sharedURLRequestScheduler;
+ (void)setupWithArticleDatabase:(id)a3 cacheDirectory:(id)a4;
+ (void)unregister;
- (FCAssetDownloadOperation)assetOperation;
- (FCCKContentFetchOperation)fetchOperation;
- (id)_imageURLFromResourceMapFileURL:(id)a3 dayOfWeek:(int64_t)a4 difficulty:(id)a5 error:(id *)a6;
- (void)_fetchResourceMapWithID:(id)a3 completion:(id)a4;
- (void)setAssetOperation:(id)a3;
- (void)setFetchOperation:(id)a3;
- (void)startLoading;
- (void)stopLoading;
@end

@implementation FCPuzzleThumbnailURLProtocol

+ (BOOL)canHandleURLWithComponents:(id)a3
{
  v3 = [a3 host];
  char v4 = [v3 isEqualToString:@"puzzle-thumbnail"];

  return v4;
}

+ (void)setupWithArticleDatabase:(id)a3 cacheDirectory:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)[[NSString alloc] initWithFormat:@"record field URL protocol requires a non-nil database"];
    int v15 = 136315906;
    v16 = "+[FCPuzzleThumbnailURLProtocol setupWithArticleDatabase:cacheDirectory:]";
    __int16 v17 = 2080;
    v18 = "FCPuzzleThumbnailURLProtocol.m";
    __int16 v19 = 1024;
    int v20 = 71;
    __int16 v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);
  }
  id WeakRetained = objc_loadWeakRetained(&qword_1EB5D0F18);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    Class v10 = NSClassFromString(&cfstr_Xctest.isa);

    if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)[[NSString alloc] initWithFormat:@"record field URL protocol has already been setup"];
      int v15 = 136315906;
      v16 = "+[FCPuzzleThumbnailURLProtocol setupWithArticleDatabase:cacheDirectory:]";
      __int16 v17 = 2080;
      v18 = "FCPuzzleThumbnailURLProtocol.m";
      __int16 v19 = 1024;
      int v20 = 72;
      __int16 v21 = 2114;
      v22 = v14;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);
    }
  }
  objc_storeWeak(&qword_1EB5D0F18, v6);
  uint64_t v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
  v12 = (void *)qword_1EB5D0F20;
  qword_1EB5D0F20 = v11;

  [MEMORY[0x1E4F18DA0] registerClass:a1];
}

+ (BOOL)canInitWithRequest:(id)a3
{
  char v4 = [a3 URL];
  LOBYTE(a1) = [a1 canHandleURL:v4];

  return (char)a1;
}

+ (BOOL)canHandleURL:(id)a3
{
  v3 = [a3 host];
  char v4 = [v3 isEqualToString:@"puzzle-thumbnail"];

  return v4;
}

+ (id)sharedURLRequestScheduler
{
  if (qword_1EB5D0F00 != -1) {
    dispatch_once(&qword_1EB5D0F00, &__block_literal_global_20);
  }
  v2 = (void *)_MergedGlobals_11;
  return v2;
}

void __57__FCPuzzleThumbnailURLProtocol_sharedURLRequestScheduler__block_invoke()
{
  v0 = [FCURLRequestScheduler alloc];
  id v3 = +[FCAssetDownloadOperation sharedURLSession];
  uint64_t v1 = [(FCURLRequestScheduler *)v0 initWithURLSession:v3];
  v2 = (void *)_MergedGlobals_11;
  _MergedGlobals_11 = v1;
}

+ (id)resourceMapSerialQueue
{
  if (qword_1EB5D0F10 != -1) {
    dispatch_once(&qword_1EB5D0F10, &__block_literal_global_7_0);
  }
  v2 = (void *)qword_1EB5D0F08;
  return v2;
}

uint64_t __54__FCPuzzleThumbnailURLProtocol_resourceMapSerialQueue__block_invoke()
{
  v0 = [[FCAsyncSerialQueue alloc] initWithQualityOfService:25];
  uint64_t v1 = qword_1EB5D0F08;
  qword_1EB5D0F08 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)unregister
{
  id WeakRetained = objc_loadWeakRetained(&qword_1EB5D0F18);

  if (WeakRetained)
  {
    objc_storeWeak(&qword_1EB5D0F18, 0);
    char v4 = (void *)qword_1EB5D0F20;
    qword_1EB5D0F20 = 0;

    v5 = (void *)MEMORY[0x1E4F18DA0];
    [v5 unregisterClass:a1];
  }
}

+ (id)URLForResourceMapID:(id)a3 publishDate:(id)a4 difficulty:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained(&qword_1EB5D0F18);
  if (WeakRetained)
  {
  }
  else if (!NSClassFromString(&cfstr_Xctest.isa) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)[[NSString alloc] initWithFormat:@"can't construct a URL without a database"];
    *(_DWORD *)buf = 136315906;
    v28 = "+[FCPuzzleThumbnailURLProtocol URLForResourceMapID:publishDate:difficulty:]";
    __int16 v29 = 2080;
    v30 = "FCPuzzleThumbnailURLProtocol.m";
    __int16 v31 = 1024;
    int v32 = 95;
    __int16 v33 = 2114;
    v34 = v26;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v11 = objc_loadWeakRetained(&qword_1EB5D0F18);

  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F29088]);
    id v13 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    v14 = (void *)[v13 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    int v15 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"EST"];
    [v14 setTimeZone:v15];

    uint64_t v16 = [v14 component:512 fromDate:v8];
    [v12 setScheme:@"https"];
    [v12 setHost:@"puzzle-thumbnail"];
    __int16 v17 = [@"/" stringByAppendingString:v7];
    [v12 setPath:v17];

    v18 = [v12 path];
    __int16 v19 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v16);
    int v20 = [v18 stringByAppendingPathComponent:v19];
    [v12 setPath:v20];

    if (v9)
    {
      __int16 v21 = [v12 path];
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v9, "longValue"));
      uint64_t v23 = [v21 stringByAppendingPathComponent:v22];
      [v12 setPath:v23];
    }
    v24 = [v12 URL];
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  id v5 = a4;
  id v6 = [a3 URL];
  id v7 = [v5 URL];

  LOBYTE(v5) = [v6 isEqual:v7];
  return (char)v5;
}

- (void)startLoading
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = [(FCPuzzleThumbnailURLProtocol *)self fetchOperation];

  if (v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v17 = (void *)[[NSString alloc] initWithFormat:@"shouldn't have a fetch operation yet"];
    *(_DWORD *)location = 136315906;
    *(void *)&location[4] = "-[FCPuzzleThumbnailURLProtocol startLoading]";
    __int16 v23 = 2080;
    v24 = "FCPuzzleThumbnailURLProtocol.m";
    __int16 v25 = 1024;
    int v26 = 151;
    __int16 v27 = 2114;
    v28 = v17;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", location, 0x26u);
  }
  char v4 = [(NSURLProtocol *)self request];
  id v5 = [v4 URL];

  id v6 = [v5 pathComponents];
  if ((unint64_t)[v6 count] <= 2)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke;
    v21[3] = &unk_1E5B4C018;
    v21[4] = self;
    __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke((uint64_t)v21);
  }
  else
  {
    id v7 = [v5 pathComponents];
    id v8 = [v7 objectAtIndexedSubscript:1];

    id v9 = [v5 pathComponents];
    Class v10 = [v9 objectAtIndexedSubscript:2];
    id v11 = (void *)[v10 integerValue];

    if ((unint64_t)[v6 count] < 4)
    {
      int v15 = 0;
    }
    else
    {
      id v12 = NSNumber;
      id v13 = [v5 pathComponents];
      v14 = [v13 objectAtIndexedSubscript:3];
      int v15 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v14, "integerValue"));
    }
    objc_initWeak((id *)location, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke_2;
    v18[3] = &unk_1E5B4ECA0;
    objc_copyWeak(v20, (id *)location);
    v18[4] = self;
    v20[1] = v11;
    id v16 = v15;
    id v19 = v16;
    [(FCPuzzleThumbnailURLProtocol *)self _fetchResourceMapWithID:v8 completion:v18];

    objc_destroyWeak(v20);
    objc_destroyWeak((id *)location);
  }
}

void __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:", 16, @"Record field URL protocol has invalid path.");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [*(id *)(a1 + 32) client];
  [v2 URLProtocol:*(void *)(a1 + 32) didFailWithError:v3];
}

void __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    Class v10 = v9;
    if (v6)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke_4;
      v28[3] = &unk_1E5B4BE70;
      id v29 = v9;
      id v30 = v6;
      __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke_4((uint64_t)v28);

      id v11 = v29;
    }
    else
    {
      uint64_t v12 = *(void *)(a1 + 56);
      id v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      id v27 = 0;
      int v15 = [v13 _imageURLFromResourceMapFileURL:v5 dayOfWeek:v12 difficulty:v14 error:&v27];
      id v11 = v27;
      if (v15)
      {
        id v16 = (objc_class *)MEMORY[0x1E4F18DA8];
        id v17 = v15;
        v18 = (void *)[[v16 alloc] initWithURL:v17];
        id v19 = (void *)[objc_alloc(MEMORY[0x1E4F18DB0]) initWithURL:v17 MIMEType:0 expectedContentLength:0 textEncodingName:0];

        int v20 = [v10 client];
        [v20 URLProtocol:v10 wasRedirectedToRequest:v18 redirectResponse:v19];
      }
      else
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke_5;
        v23[3] = &unk_1E5B4C738;
        id v21 = v10;
        uint64_t v22 = *(void *)(a1 + 32);
        id v24 = v21;
        uint64_t v25 = v22;
        id v26 = v11;
        __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke_5((uint64_t)v23);

        v18 = v24;
      }
    }
  }
}

void __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  [v2 URLProtocol:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

void __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  [v2 URLProtocol:*(void *)(a1 + 40) didFailWithError:*(void *)(a1 + 48)];
}

- (void)stopLoading
{
  id v3 = [(FCPuzzleThumbnailURLProtocol *)self fetchOperation];
  [v3 cancel];

  id v4 = [(FCPuzzleThumbnailURLProtocol *)self assetOperation];
  [v4 cancel];
}

- (void)_fetchResourceMapWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(id)objc_opt_class() resourceMapSerialQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke;
  v11[3] = &unk_1E5B4ED40;
  id v9 = v7;
  id v14 = v9;
  id v10 = v6;
  id v12 = v10;
  objc_copyWeak(&v15, &location);
  id v13 = self;
  [v8 enqueueBlock:v11];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke(uint64_t a1, void *a2)
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_2;
  aBlock[3] = &unk_1E5B4ECC8;
  id v31 = *(id *)(a1 + 48);
  id v23 = v3;
  id v32 = v23;
  id v4 = (void (**)(void *, void *, void))_Block_copy(aBlock);
  id v5 = [(id)qword_1EB5D0F20 URLByAppendingPathComponent:@"puzzle-resources"];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    id v8 = objc_msgSend(v7, "URLByAppendingPathComponent:", *(void *)(a1 + 32), v23);
    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v10 = [v8 path];
    int v11 = [v9 fileExistsAtPath:v10];

    if (v11)
    {
      v4[2](v4, v8, 0);
    }
    else
    {
      id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v12 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:0];

      id v13 = objc_alloc_init(FCCKContentFetchOperation);
      id WeakRetained = objc_loadWeakRetained(&qword_1EB5D0F18);
      -[FCCKContentFetchOperation setDatabase:]((uint64_t)v13, WeakRetained);

      id v15 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:*(void *)(a1 + 32)];
      v34[0] = v15;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
      if (v13) {
        objc_setProperty_nonatomic_copy(v13, v16, v17, 384);
      }

      __int16 v33 = @"asset";
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
      if (v13) {
        objc_setProperty_nonatomic_copy(v13, v18, v19, 400);
      }

      newValue[0] = MEMORY[0x1E4F143A8];
      newValue[1] = 3221225472;
      newValue[2] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_4;
      newValue[3] = &unk_1E5B4ED18;
      objc_copyWeak(&v27, (id *)(a1 + 56));
      int v20 = v4;
      uint64_t v21 = *(void *)(a1 + 40);
      id v26 = v20;
      newValue[4] = v21;
      id v25 = v8;
      if (v13) {
        objc_setProperty_nonatomic_copy(v13, v22, newValue, 416);
      }
      [*(id *)(a1 + 40) setFetchOperation:v13];
      [(FCOperation *)v13 start];

      objc_destroyWeak(&v27);
    }
  }
  else
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_3;
    v28[3] = &unk_1E5B4CA88;
    id v29 = v4;
    __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_3((uint64_t)v28);
    id v7 = v29;
  }
}

uint64_t __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:", 16, @"Puzzle thumbnail URL protocol is missing a cache directory.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_4(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v10 = [v9 fetchOperation];
    int v11 = [v10 isCancelled];

    if (v11)
    {
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_6;
      v46[3] = &unk_1E5B4CA88;
      id v47 = a1[6];
      __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_6((uint64_t)v46);
      id v12 = v47;
    }
    else if (v6)
    {
      uint64_t v40 = MEMORY[0x1E4F143A8];
      uint64_t v41 = 3221225472;
      v42 = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_7;
      v43 = &unk_1E5B4C7C0;
      v45 = (void (**)(id, void, id))a1[6];
      id v44 = v6;
      v45[2](v45, 0, v44);

      id v12 = v45;
    }
    else
    {
      id v13 = [v5 allValues];
      id v12 = [v13 firstObject];

      if (v12)
      {
        id v12 = v12;
        objc_opt_class();
        id v14 = [v12 objectForKeyedSubscript:@"asset"];
        if (v14)
        {
          if (objc_opt_isKindOfClass()) {
            id v15 = v14;
          }
          else {
            id v15 = 0;
          }
        }
        else
        {
          id v15 = 0;
        }
        id v16 = v15;

        if (v16)
        {
          id v17 = [MEMORY[0x1E4F29088] componentsWithString:v16];
          if (v17)
          {
            id v18 = objc_loadWeakRetained(&qword_1EB5D0F18);
            int v19 = [v18 shouldUseSecureConnectionForCKAssetURLs];

            if (v19) {
              [v17 setScheme:@"https"];
            }
            id v20 = objc_loadWeakRetained(&qword_1EB5D0F18);
            [v20 updateAssetURLHostIfNeededWithComponents:v17];

            uint64_t v21 = [v17 URL];
            if (v21)
            {
              uint64_t v22 = [FCAssetDownloadOperation alloc];
              id v26 = objc_loadWeakRetained(&qword_1EB5D0F18);
              [v26 networkReachability];
              id v23 = v28 = v16;
              [(id)objc_opt_class() sharedURLRequestScheduler];
              v24 = id v27 = v21;
              id v25 = [(FCAssetDownloadOperation *)v22 initWithNetworkReachability:v23 URLRequestScheduler:v24];

              uint64_t v21 = v27;
              id v16 = v28;

              [(FCAssetDownloadOperation *)v25 setURL:v27];
              v29[0] = MEMORY[0x1E4F143A8];
              v29[1] = 3221225472;
              v29[2] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_12;
              v29[3] = &unk_1E5B4ECF0;
              id v31 = a1[6];
              id v30 = a1[5];
              [(FCAssetDownloadOperation *)v25 setFileDownloadCompletionHandler:v29];
              [v9 setAssetOperation:v25];
              [(FCOperation *)v25 start];
            }
            else
            {
              v32[0] = MEMORY[0x1E4F143A8];
              v32[1] = 3221225472;
              v32[2] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_11;
              v32[3] = &unk_1E5B4CA88;
              __int16 v33 = (FCAssetDownloadOperation *)a1[6];
              __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_11((uint64_t)v32);
              id v25 = v33;
            }
          }
          else
          {
            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v34[2] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_10;
            void v34[3] = &unk_1E5B4CA88;
            id v35 = a1[6];
            __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_10((uint64_t)v34);
            uint64_t v21 = v35;
          }
        }
        else
        {
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_9;
          v36[3] = &unk_1E5B4CA88;
          id v37 = a1[6];
          __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_9((uint64_t)v36);
          id v17 = v37;
        }
      }
      else
      {
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_8;
        v38[3] = &unk_1E5B4CA88;
        id v39 = a1[6];
        __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_8((uint64_t)v38);
      }
    }
  }
}

void __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_operationCancelledErrorWithAdditionalUserInfo:", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:", 16, @"Record field URL protocol is missing requested record.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:", 16, @"Record field URL protocol is missing requested field.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:", 16, @"Record field URL protocol is missing valid URL components.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_11(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:", 16, @"Record field URL protocol is missing valid URL.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_12(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v20[1] = (id)MEMORY[0x1E4F143A8];
    id v20[2] = (id)3221225472;
    v20[3] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_13;
    v20[4] = &unk_1E5B4C7C0;
    uint64_t v22 = (void (**)(id, void, id))*(id *)(a1 + 40);
    id v21 = v9;
    v22[2](v22, 0, v21);

    id v10 = v22;
  }
  else
  {
    id v10 = +[FCIdentityAssetTransformer sharedInstance];
    int v11 = [v8 responseMIMEType];
    int v12 = objc_msgSend(v7, "fc_isGzippedWithMIMETypeHint:", v11);

    if (v12)
    {
      uint64_t v13 = +[FCGzipAssetTransformer sharedInstance];

      id v10 = (void *)v13;
    }
    id v14 = [v7 path];
    id v15 = [*(id *)(a1 + 32) path];
    v20[0] = 0;
    char v16 = [v10 transformAssetDataFromFilePath:v14 toFilePath:v15 error:v20];
    id v17 = v20[0];

    if (v16)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      int v19 = (void (**)(id, void, id))*(id *)(a1 + 40);
      id v18 = v17;
      v19[2](v19, 0, v18);
    }
  }
}

uint64_t __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (id)_imageURLFromResourceMapFileURL:(id)a3 dayOfWeek:(int64_t)a4 difficulty:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1CA10] inputStreamWithURL:a3];
  [v10 open];
  int v11 = [v10 streamError];

  if (v11)
  {
    v25[1] = (id)MEMORY[0x1E4F143A8];
    v25[2] = (id)3221225472;
    v25[3] = __91__FCPuzzleThumbnailURLProtocol__imageURLFromResourceMapFileURL_dayOfWeek_difficulty_error___block_invoke;
    v25[4] = &unk_1E5B4ED68;
    id v27 = a6;
    id v26 = v10;
    [v26 streamError];
    int v12 = 0;
    *id v27 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = v26;
  }
  else
  {
    v25[0] = 0;
    id v14 = [MEMORY[0x1E4F28D90] JSONObjectWithStream:v10 options:0 error:v25];
    id v15 = v25[0];
    id v13 = v15;
    if (v14)
    {
      char v16 = [v14 objectForKeyedSubscript:@"smallImages"];
      id v17 = objc_msgSend(NSString, "stringWithFormat:", @"s%ld", a4);
      id v18 = [v16 objectForKeyedSubscript:v17];

      if (v9
        && (objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v9, "longValue")),
            int v19 = objc_claimAutoreleasedReturnValue(),
            [v18 objectForKeyedSubscript:v19],
            id v20 = objc_claimAutoreleasedReturnValue(),
            v19,
            v20)
        || ([v18 objectForKeyedSubscript:@"defaultUrl"],
            (id v20 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        int v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v20];
      }
      else
      {
        uint64_t v22 = a6;
        objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:", 16, @"Resource map is missing the requested thumbnail.");
        int v12 = 0;
        id *v22 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v24 = a6;
      id v23 = v15;
      int v12 = 0;
      id *v24 = v23;
      char v16 = v23;
    }
  }
  return v12;
}

uint64_t __91__FCPuzzleThumbnailURLProtocol__imageURLFromResourceMapFileURL_dayOfWeek_difficulty_error___block_invoke(uint64_t a1)
{
  **(void **)(a1 + 40) = [*(id *)(a1 + 32) streamError];
  return 0;
}

uint64_t __91__FCPuzzleThumbnailURLProtocol__imageURLFromResourceMapFileURL_dayOfWeek_difficulty_error___block_invoke_2(uint64_t a1)
{
  **(void **)(a1 + 40) = *(id *)(a1 + 32);
  return 0;
}

uint64_t __91__FCPuzzleThumbnailURLProtocol__imageURLFromResourceMapFileURL_dayOfWeek_difficulty_error___block_invoke_3(uint64_t a1)
{
  **(void **)(a1 + 32) = (id)objc_claimAutoreleasedReturnValue();
  return 0;
}

- (FCCKContentFetchOperation)fetchOperation
{
  return self->_fetchOperation;
}

- (void)setFetchOperation:(id)a3
{
}

- (FCAssetDownloadOperation)assetOperation
{
  return self->_assetOperation;
}

- (void)setAssetOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetOperation, 0);
  objc_storeStrong((id *)&self->_fetchOperation, 0);
}

@end