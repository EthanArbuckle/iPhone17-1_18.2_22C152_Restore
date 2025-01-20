@interface TSUURLTrackerFilePresenter
- (NSData)bookmarkData;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSString)description;
- (NSURL)presentedItemURL;
- (TSUURLTrackerFilePresenter)init;
- (TSUURLTrackerFilePresenter)initWithURL:(id)a3 bookmarkData:(id)a4 delegate:(id)a5;
- (id)URLAndReturnError:(id *)a3;
- (id)_URLAndReturnError:(id *)a3;
- (id)_bookmarkData;
- (id)_bookmarkDataAndReturnError:(id *)a3;
- (id)_description;
- (id)bookmarkDataAndReturnError:(id *)a3;
- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3;
- (void)pause;
- (void)presentedItemDidChangeUbiquityAttributes:(id)a3;
- (void)presentedItemDidMoveToURL:(id)a3;
- (void)relinquishPresentedItemToWriter:(id)a3;
- (void)startOrResume;
- (void)stop;
@end

@implementation TSUURLTrackerFilePresenter

- (TSUURLTrackerFilePresenter)init
{
  v2 = [NSString stringWithUTF8String:"-[TSUURLTrackerFilePresenter init]"];
  v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUURLTracker.m"];
  +[OITSUAssertionHandler handleFailureInFunction:v2 file:v3 lineNumber:194 isFatal:0 description:"Do not call method"];

  +[OITSUAssertionHandler logBacktraceThrottled];
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSUURLTrackerFilePresenter init]");
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSUURLTrackerFilePresenter)initWithURL:(id)a3 bookmarkData:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)TSUURLTrackerFilePresenter;
  v11 = [(TSUURLTrackerFilePresenter *)&v23 init];
  if (v11)
  {
    dispatch_queue_t v12 = dispatch_queue_create("TSUURLTrackerFilePresenter.access", 0);
    accessQueue = v11->_accessQueue;
    v11->_accessQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [v8 copy];
    URLIfAvailable = v11->_URLIfAvailable;
    v11->_URLIfAvailable = (NSURL *)v14;

    uint64_t v16 = [v9 copy];
    bookmarkDataIfAvailable = v11->_bookmarkDataIfAvailable;
    v11->_bookmarkDataIfAvailable = (NSData *)v16;

    v18 = (void *)MEMORY[0x263F08A48];
    v19 = objc_msgSend(NSString, "stringWithFormat:", @"TSUURLTrackerFilePresenter-%p", v11);
    uint64_t v20 = objc_msgSend(v18, "tsu_newSerialOperationQueueWithName:", v19);
    presentedItemOperationQueue = v11->_presentedItemOperationQueue;
    v11->_presentedItemOperationQueue = (NSOperationQueue *)v20;

    objc_storeWeak((id *)&v11->_delegate, v10);
  }

  return v11;
}

- (id)URLAndReturnError:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__10;
  v19 = __Block_byref_object_dispose__10;
  id v20 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  dispatch_queue_t v12 = __Block_byref_object_copy__10;
  v13 = __Block_byref_object_dispose__10;
  id v14 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__TSUURLTrackerFilePresenter_URLAndReturnError___block_invoke;
  block[3] = &unk_264D61590;
  block[4] = self;
  block[5] = &v9;
  block[6] = &v15;
  dispatch_sync(accessQueue, block);
  uint64_t v5 = (void *)v10[5];
  if (a3 && !v5)
  {
    *a3 = (id) v16[5];
    uint64_t v5 = (void *)v10[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __48__TSUURLTrackerFilePresenter_URLAndReturnError___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 _URLAndReturnError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_URLAndReturnError:(id *)a3
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__10;
  objc_super v23 = __Block_byref_object_dispose__10;
  id v24 = 0;
  URLIfAvailable = self->_URLIfAvailable;
  if (!URLIfAvailable)
  {
    bookmarkDataIfAvailable = self->_bookmarkDataIfAvailable;
    if (bookmarkDataIfAvailable)
    {
      char v18 = 0;
      id obj = 0;
      id v8 = [NSURL URLByResolvingBookmarkData:bookmarkDataIfAvailable options:768 relativeToURL:0 bookmarkDataIsStale:&v18 error:&obj];
      objc_storeStrong(&v24, obj);
      uint64_t v9 = (NSURL *)[v8 copy];
      id v10 = self->_URLIfAvailable;
      self->_URLIfAvailable = v9;

      uint64_t v11 = self->_URLIfAvailable;
      if (v11)
      {
        if (v18)
        {
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 3221225472;
          v16[2] = __49__TSUURLTrackerFilePresenter__URLAndReturnError___block_invoke;
          v16[3] = &unk_264D615B8;
          v16[4] = self;
          v16[5] = &v19;
          v16[6] = 0;
          [(NSURL *)v11 tsu_performSecurityScopedResourceAccessUsingBlock:v16];
        }
      }
      else
      {
        objc_storeStrong((id *)&self->_latestError, (id)v20[5]);
      }
      dispatch_queue_t v12 = self->_URLIfAvailable;
    }
    else
    {
      dispatch_queue_t v12 = 0;
    }
    v13 = v12;
    uint64_t v5 = v13;
    if (!a3 || v13)
    {
      if (v13) {
        goto LABEL_19;
      }
    }
    else
    {
      *a3 = self->_latestError;
    }
    if (self->_bookmarkDataIfAvailable)
    {
      if (TSUDefaultCat_init_token == -1)
      {
        uint64_t v5 = 0;
        goto LABEL_19;
      }
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_90);
    }
    uint64_t v5 = 0;
    goto LABEL_19;
  }
  uint64_t v5 = URLIfAvailable;
LABEL_19:
  if (!self->_hasStarted && self->_bookmarkDataIfAvailable)
  {
    id v14 = self->_URLIfAvailable;
    self->_URLIfAvailable = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v5;
}

void __49__TSUURLTrackerFilePresenter__URLAndReturnError___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(a1[4] + 24);
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(v2 + 8);
  id obj = *(id *)(v5 + 40);
  id v6 = [v3 bookmarkDataWithOptions:v4 includingResourceValuesForKeys:0 relativeToURL:0 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
  {
    uint64_t v7 = [v6 copy];
    uint64_t v8 = a1[4];
    uint64_t v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = v7;
  }
  else if (TSUDefaultCat_init_token != -1)
  {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_21);
  }
}

void __49__TSUURLTrackerFilePresenter__URLAndReturnError___block_invoke_2()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __49__TSUURLTrackerFilePresenter__URLAndReturnError___block_invoke_3()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (NSData)bookmarkData
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__10;
  id v10 = __Block_byref_object_dispose__10;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__TSUURLTrackerFilePresenter_bookmarkData__block_invoke;
  v5[3] = &unk_264D612C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __42__TSUURLTrackerFilePresenter_bookmarkData__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _bookmarkData];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_bookmarkData
{
  id v7 = 0;
  uint64_t v3 = [(TSUURLTrackerFilePresenter *)self _bookmarkDataAndReturnError:&v7];
  id v4 = v7;
  if (!v3 && self->_URLIfAvailable && TSUDefaultCat_init_token != -1) {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_92);
  }
  if (!self->_hasStarted && self->_bookmarkDataIfAvailable)
  {
    URLIfAvailable = self->_URLIfAvailable;
    self->_URLIfAvailable = 0;
  }
  return v3;
}

void __43__TSUURLTrackerFilePresenter__bookmarkData__block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (void)startOrResume
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__TSUURLTrackerFilePresenter_startOrResume__block_invoke;
  v4[3] = &unk_264D615E0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(accessQueue, v4);
  if (*((unsigned char *)v6 + 24)) {
    [MEMORY[0x263F08830] addFilePresenter:self];
  }
  _Block_object_dispose(&v5, 8);
}

void __43__TSUURLTrackerFilePresenter_startOrResume__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 16))
  {
    *(unsigned char *)(v1 + 16) = 1;
    uint64_t v3 = [*(id *)(a1 + 32) _URLAndReturnError:0];
    if (v3) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else {
      *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
    }
  }
}

- (void)pause
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__TSUURLTrackerFilePresenter_pause__block_invoke;
  v4[3] = &unk_264D615E0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(accessQueue, v4);
  if (*((unsigned char *)v6 + 24)) {
    [MEMORY[0x263F08830] removeFilePresenter:self];
  }
  _Block_object_dispose(&v5, 8);
}

id __35__TSUURLTrackerFilePresenter_pause__block_invoke(id result)
{
  uint64_t v1 = *((void *)result + 4);
  if (*(unsigned char *)(v1 + 16))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 16) = 0;
    result = (id)[*((id *)result + 4) _bookmarkData];
    *(unsigned char *)(*(void *)(v2[5] + 8) + 24) = 1;
  }
  return result;
}

- (void)stop
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__TSUURLTrackerFilePresenter_stop__block_invoke;
  v4[3] = &unk_264D615E0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(accessQueue, v4);
  if (*((unsigned char *)v6 + 24)) {
    [MEMORY[0x263F08830] removeFilePresenter:self];
  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __34__TSUURLTrackerFilePresenter_stop__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 16))
  {
    *(unsigned char *)(v1 + 16) = 0;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (id)bookmarkDataAndReturnError:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  char v18 = __Block_byref_object_copy__10;
  uint64_t v19 = __Block_byref_object_dispose__10;
  id v20 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  dispatch_queue_t v12 = __Block_byref_object_copy__10;
  v13 = __Block_byref_object_dispose__10;
  id v14 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__TSUURLTrackerFilePresenter_bookmarkDataAndReturnError___block_invoke;
  block[3] = &unk_264D61590;
  block[4] = self;
  block[5] = &v9;
  block[6] = &v15;
  dispatch_sync(accessQueue, block);
  uint64_t v5 = (void *)v10[5];
  if (a3 && !v5)
  {
    *a3 = (id) v16[5];
    uint64_t v5 = (void *)v10[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __57__TSUURLTrackerFilePresenter_bookmarkDataAndReturnError___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 _bookmarkDataAndReturnError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_bookmarkDataAndReturnError:(id *)a3
{
  bookmarkDataIfAvailable = self->_bookmarkDataIfAvailable;
  if (!bookmarkDataIfAvailable)
  {
    URLIfAvailable = self->_URLIfAvailable;
    if (URLIfAvailable)
    {
      uint64_t v11 = 0;
      dispatch_queue_t v12 = &v11;
      uint64_t v13 = 0x3032000000;
      id v14 = __Block_byref_object_copy__10;
      uint64_t v15 = __Block_byref_object_dispose__10;
      uint64_t v16 = 0;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __58__TSUURLTrackerFilePresenter__bookmarkDataAndReturnError___block_invoke;
      v10[3] = &unk_264D615B8;
      v10[5] = &v11;
      v10[6] = 0;
      v10[4] = self;
      [(NSURL *)URLIfAvailable tsu_performSecurityScopedResourceAccessUsingBlock:v10];
      if (!self->_bookmarkDataIfAvailable) {
        objc_storeStrong((id *)&self->_latestError, (id)v12[5]);
      }
      _Block_object_dispose(&v11, 8);
      bookmarkDataIfAvailable = v16;
      goto LABEL_8;
    }
  }
  if (self->_latestError)
  {
    self->_bookmarkDataIfAvailable = 0;
LABEL_8:
  }
  uint64_t v7 = self->_bookmarkDataIfAvailable;
  if (a3 && !v7)
  {
    *a3 = self->_latestError;
    uint64_t v7 = self->_bookmarkDataIfAvailable;
  }
  char v8 = v7;
  return v8;
}

void __58__TSUURLTrackerFilePresenter__bookmarkDataAndReturnError___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(a1[4] + 24);
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(v2 + 8);
  id obj = *(id *)(v5 + 40);
  id v6 = [v3 bookmarkDataWithOptions:v4 includingResourceValuesForKeys:0 relativeToURL:0 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = [v6 copy];
  uint64_t v8 = a1[4];
  uint64_t v9 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v7;
}

- (NSURL)presentedItemURL
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__10;
  id v10 = __Block_byref_object_dispose__10;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__TSUURLTrackerFilePresenter_presentedItemURL__block_invoke;
  v5[3] = &unk_264D612C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

void __46__TSUURLTrackerFilePresenter_presentedItemURL__block_invoke(uint64_t a1)
{
}

- (void)relinquishPresentedItemToWriter:(id)a3
{
  uint64_t v5 = (void (**)(id, void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained relinquishPresentedItemToWriter:v5];
  }
  else if (v5)
  {
    v5[2](v5, 0);
  }
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  uint64_t v5 = (void (**)(id, void))a3;
  [(TSUURLTrackerFilePresenter *)self stop];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained accommodatePresentedItemDeletionWithCompletionHandler:v5];
  }
  else if (v5)
  {
    v5[2](v5, 0);
  }
}

- (void)presentedItemDidMoveToURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[v4 copy];
  accessQueue = self->_accessQueue;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __56__TSUURLTrackerFilePresenter_presentedItemDidMoveToURL___block_invoke;
  dispatch_queue_t v12 = &unk_264D612E8;
  uint64_t v13 = self;
  id v7 = v5;
  id v14 = v7;
  dispatch_async(accessQueue, &v9);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "presentedItemDidMoveToURL:", v4, v9, v10, v11, v12, v13);
  }
}

void __56__TSUURLTrackerFilePresenter_presentedItemDidMoveToURL___block_invoke(uint64_t a1)
{
}

- (void)presentedItemDidChangeUbiquityAttributes:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(TSUURLTrackerFilePresenter *)self presentedItemURL];
    uint64_t v6 = [v7 allObjects];
    objc_msgSend(v5, "tsu_removeCachedResourceValueForKeys:", v6);

    [WeakRetained presentedItemDidChangeUbiquityAttributes:v7];
  }
}

- (id)_description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p URL=%@>", v5, self, self->_URLIfAvailable];

  return v6;
}

- (NSString)description
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__10;
  uint64_t v10 = __Block_byref_object_dispose__10;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__TSUURLTrackerFilePresenter_description__block_invoke;
  v5[3] = &unk_264D612C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __41__TSUURLTrackerFilePresenter_description__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _description];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedItemOperationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_latestError, 0);
  objc_storeStrong((id *)&self->_bookmarkDataIfAvailable, 0);
  objc_storeStrong((id *)&self->_URLIfAvailable, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end