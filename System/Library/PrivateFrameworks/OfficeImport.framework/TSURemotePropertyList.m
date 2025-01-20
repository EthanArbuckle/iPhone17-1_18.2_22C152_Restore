@interface TSURemotePropertyList
- (TSURemotePropertyList)init;
- (TSURemotePropertyList)initWithRemoteURL:(id)a3 localURL:(id)a4;
- (double)timeIntervalUntilNextUpdate;
- (id)URLForKey:(id)a3;
- (id)URLRequest;
- (id)arrayForKey:(id)a3;
- (id)deserializePropertyListData:(id)a3 error:(id *)a4;
- (id)dictionaryForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (id)validateUserDefaultsDownloadURL:(id)a3;
- (void)checkForUpdateWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)processDidResume:(id)a3;
- (void)processPropertyList:(id)a3;
- (void)processResponse:(id)a3 data:(id)a4 error:(id)a5;
- (void)processWillSuspend:(id)a3;
- (void)startUpdateTimer;
- (void)updateIfNeededWithCompletionHandler:(id)a3;
@end

@implementation TSURemotePropertyList

- (TSURemotePropertyList)init
{
  v2 = [NSString stringWithUTF8String:"-[TSURemotePropertyList init]"];
  v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSURemoteDefaults.m"];
  +[OITSUAssertionHandler handleFailureInFunction:v2 file:v3 lineNumber:41 isFatal:0 description:"Do not call method"];

  +[OITSUAssertionHandler logBacktraceThrottled];
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSURemotePropertyList init]");
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSURemotePropertyList)initWithRemoteURL:(id)a3 localURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)TSURemotePropertyList;
  v8 = [(TSURemotePropertyList *)&v32 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    remoteURL = v8->_remoteURL;
    v8->_remoteURL = (NSURL *)v9;

    uint64_t v11 = [v7 copy];
    localURL = v8->_localURL;
    v8->_localURL = (NSURL *)v11;

    if (v7)
    {
      if (([v7 isFileURL] & 1) == 0)
      {
        v13 = [NSString stringWithUTF8String:"-[TSURemotePropertyList initWithRemoteURL:localURL:]"];
        v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSURemoteDefaults.m"];
        +[OITSUAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:52 isFatal:0 description:"Local URL should be a file URL."];

        +[OITSUAssertionHandler logBacktraceThrottled];
      }
      uint64_t v15 = [objc_alloc(NSDictionary) initWithContentsOfURL:v7];
      propertyList = v8->_propertyList;
      v8->_propertyList = (NSDictionary *)v15;
    }
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    v19 = [v18 stringByAppendingString:@".Access"];

    id v20 = v19;
    dispatch_queue_t v21 = dispatch_queue_create((const char *)[v20 UTF8String], 0);
    accessQueue = v8->_accessQueue;
    v8->_accessQueue = (OS_dispatch_queue *)v21;

    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    v25 = [v24 stringByAppendingString:@".Check"];

    id v26 = v25;
    dispatch_queue_t v27 = dispatch_queue_create((const char *)[v26 UTF8String], 0);
    checkQueue = v8->_checkQueue;
    v8->_checkQueue = (OS_dispatch_queue *)v27;

    [(TSURemotePropertyList *)v8 startUpdateTimer];
    v29 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v30 = *MEMORY[0x263F1D038];
    [v29 addObserver:v8 selector:sel_processWillSuspend_ name:*MEMORY[0x263F1D0D8] object:0];
    [v29 addObserver:v8 selector:sel_processDidResume_ name:v30 object:0];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  dispatch_source_cancel((dispatch_source_t)self->_updateTimer);
  v4.receiver = self;
  v4.super_class = (Class)TSURemotePropertyList;
  [(TSURemotePropertyList *)&v4 dealloc];
}

- (void)startUpdateTimer
{
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_checkQueue);
  updateTimer = self->_updateTimer;
  self->_updateTimer = v3;

  [(TSURemotePropertyList *)self timeIntervalUntilNextUpdate];
  dispatch_source_set_timer((dispatch_source_t)self->_updateTimer, (unint64_t)(v5 * 1000000000.0), 0x4E94914F0000uLL, 0x34630B8A000uLL);
  objc_initWeak(&location, self);
  id v6 = self->_updateTimer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__TSURemotePropertyList_startUpdateTimer__block_invoke;
  v7[3] = &unk_264D61B40;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v6, v7);
  dispatch_resume((dispatch_object_t)self->_updateTimer);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __41__TSURemotePropertyList_startUpdateTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained checkForUpdateWithCompletionHandler:0];
}

- (void)processWillSuspend:(id)a3
{
  updateTimer = self->_updateTimer;
  if (updateTimer)
  {
    dispatch_source_cancel(updateTimer);
    double v5 = self->_updateTimer;
    self->_updateTimer = 0;
  }
}

- (void)processDidResume:(id)a3
{
  if (!self->_updateTimer) {
    [(TSURemotePropertyList *)self startUpdateTimer];
  }
}

- (void)updateIfNeededWithCompletionHandler:(id)a3
{
  id v4 = a3;
  checkQueue = self->_checkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__TSURemotePropertyList_updateIfNeededWithCompletionHandler___block_invoke;
  v7[3] = &unk_264D618F8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(checkQueue, v7);
}

unsigned char *__61__TSURemotePropertyList_updateIfNeededWithCompletionHandler___block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (!result[56]) {
    return (unsigned char *)[result checkForUpdateWithCompletionHandler:v3];
  }
  if (v3) {
    return (unsigned char *)(*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
  return result;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__18;
  v16 = __Block_byref_object_dispose__18;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__TSURemotePropertyList_objectForKey___block_invoke;
  block[3] = &unk_264D61298;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __38__TSURemotePropertyList_objectForKey___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [(TSURemotePropertyList *)self objectForKey:v4];

  id v7 = TSUDynamicCast(v5, (uint64_t)v6);

  return v7;
}

- (id)URLForKey:(id)a3
{
  uint64_t v3 = [(TSURemotePropertyList *)self objectForKey:a3];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = TSUDynamicCast(v4, (uint64_t)v3);
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v3 == 0;
  }
  if (!v6)
  {
    uint64_t v7 = objc_opt_class();
    id v8 = TSUDynamicCast(v7, (uint64_t)v3);
    if (v8)
    {
      uint64_t v5 = [NSURL URLWithString:v8];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  return v5;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = [(TSURemotePropertyList *)self objectForKey:v4];

  uint64_t v7 = TSUDynamicCast(v5, (uint64_t)v6);

  return v7;
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = [(TSURemotePropertyList *)self objectForKey:v4];

  uint64_t v7 = TSUDynamicCast(v5, (uint64_t)v6);

  return v7;
}

- (void)checkForUpdateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TSURemotePropertyList *)self URLRequest];
  dispatch_suspend((dispatch_object_t)self->_checkQueue);
  BOOL v6 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v7 = [v6 beginBackgroundTaskWithExpirationHandler:0];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __61__TSURemotePropertyList_checkForUpdateWithCompletionHandler___block_invoke;
  v16 = &unk_264D61EF0;
  id v17 = self;
  id v18 = v6;
  id v19 = v4;
  uint64_t v20 = v7;
  id v8 = v4;
  id v9 = v6;
  id v10 = _Block_copy(&v13);
  uint64_t v11 = objc_msgSend(MEMORY[0x263F08BF8], "sharedSession", v13, v14, v15, v16, v17);
  uint64_t v12 = [v11 dataTaskWithRequest:v5 completionHandler:v10];

  [v12 resume];
}

void __61__TSURemotePropertyList_checkForUpdateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a4;
  id v7 = a3;
  id v8 = a2;
  id v9 = (objc_class *)objc_opt_class();
  id v10 = TSUCheckedDynamicCast(v9, (uint64_t)v7);

  [*(id *)(a1 + 32) processResponse:v10 data:v8 error:v12];
  [*(id *)(a1 + 40) endBackgroundTask:*(void *)(a1 + 56)];
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 40));
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v12);
  }
}

- (id)validateUserDefaultsDownloadURL:(id)a3
{
  id v3 = a3;
  return v3;
}

- (double)timeIntervalUntilNextUpdate
{
  uint64_t v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [v4 stringByAppendingString:@"NextUpdate"];
  BOOL v6 = [v2 objectForKey:v5];

  double v7 = 0.0;
  if (v6)
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = TSUCheckedDynamicCast(v8, (uint64_t)v6);

    if (v9)
    {
      id v10 = [MEMORY[0x263EFF910] date];
      [v6 timeIntervalSinceDate:v10];
      double v12 = v11;

      double v7 = fmax(v12, 0.0);
    }
  }

  return v7;
}

- (id)URLRequest
{
  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  BOOL v6 = [v5 stringByAppendingString:@"DownloadURL"];
  double v7 = [v3 stringForKey:v6];

  if (![v7 length]
    || ([NSURL URLWithString:v7], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) == 0)
    || (id v9 = (void *)v8,
        [(TSURemotePropertyList *)self validateUserDefaultsDownloadURL:v8],
        id v10 = (NSURL *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    id v10 = self->_remoteURL;
  }
  double v11 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v10];
  [v11 setTimeoutInterval:20.0];
  [v11 setCachePolicy:1];
  double v12 = (objc_class *)objc_opt_class();
  uint64_t v13 = NSStringFromClass(v12);
  uint64_t v14 = [v13 stringByAppendingString:@"ETag"];
  uint64_t v15 = [v3 stringForKey:v14];

  if ([v15 length]) {
    [v11 setValue:v15 forHTTPHeaderField:@"If-None-Match"];
  }

  return v11;
}

- (void)processResponse:(id)a3 data:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 statusCode];
  uint64_t v12 = v11;
  if (v11 == 304 || v11 == 200)
  {
    uint64_t v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v14 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:86400.0];
    uint64_t v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    id v17 = [v16 stringByAppendingString:@"NextUpdate"];
    [v13 setObject:v14 forKey:v17];

    if (v12 == 200 && [v9 length])
    {
      id v25 = 0;
      id v18 = [(TSURemotePropertyList *)self deserializePropertyListData:v9 error:&v25];
      id v19 = v25;

      if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        [(TSURemotePropertyList *)self processPropertyList:v18];
        uint64_t v20 = [v8 allHeaderFields];
        dispatch_queue_t v21 = [v20 objectForKey:@"Etag"];

        v22 = (objc_class *)objc_opt_class();
        v23 = NSStringFromClass(v22);
        v24 = [v23 stringByAppendingString:@"ETag"];
        [v13 setObject:v21 forKey:v24];

        self->_didUpdateAtLeastOnce = 1;
      }
      else if (TSUDefaultCat_init_token != -1)
      {
        dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_35);
      }

      id v10 = v19;
    }
  }
}

void __52__TSURemotePropertyList_processResponse_data_error___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (id)deserializePropertyListData:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:a4];
}

- (void)processPropertyList:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  localURL = self->_localURL;
  if (localURL
    && ([v4 writeToURL:localURL atomically:0] & 1) == 0
    && TSUDefaultCat_init_token != -1)
  {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_48_0);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__TSURemotePropertyList_processPropertyList___block_invoke_2;
  v9[3] = &unk_264D612E8;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(accessQueue, v9);
}

void __45__TSURemotePropertyList_processPropertyList___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __45__TSURemotePropertyList_processPropertyList___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_checkQueue, 0);
  objc_storeStrong((id *)&self->_propertyList, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_localURL, 0);
  objc_storeStrong((id *)&self->_remoteURL, 0);
}

@end