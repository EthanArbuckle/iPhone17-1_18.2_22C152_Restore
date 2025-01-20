@interface ICHTTPArchive
+ (ICHTTPArchive)sharedArchive;
- (ICHTTPArchive)init;
- (ICHTTPArchive)initWithArchiveDirectoryPath:(id)a3 maxArchiveFiles:(int64_t)a4 maxArchiveBodyLength:(int64_t)a5 flushDelaySeconds:(int64_t)a6;
- (id)_archiveCreator;
- (id)_archiveForRequest:(id)a3;
- (id)_archiveForResponse:(id)a3 responseData:(id)a4;
- (id)_arrayFromHeaderDictionary:(id)a3;
- (id)initUnboundedArchiveWithDirectoryPath:(id)a3;
- (void)_loadExistingArchivePaths;
- (void)_onQueueFlush;
- (void)_pruneOldArchives;
- (void)archiveRequest:(id)a3 withResponse:(id)a4 responseData:(id)a5;
- (void)archiveRequest:(id)a3 withResponse:(id)a4 responseData:(id)a5 performanceMetrics:(id)a6;
- (void)dealloc;
- (void)flush;
@end

@implementation ICHTTPArchive

uint64_t __42__ICHTTPArchive__loadExistingArchivePaths__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 lastPathComponent];
  v6 = [v4 lastPathComponent];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_arrayFromHeaderDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [v3 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v3 objectForKey:v9];
        v18[0] = @"name";
        v18[1] = @"value";
        v19[0] = v9;
        v19[1] = v10;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
        [v4 addObject:v11];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)archiveRequest:(id)a3 withResponse:(id)a4 responseData:(id)a5 performanceMetrics:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__ICHTTPArchive_archiveRequest_withResponse_responseData_performanceMetrics___block_invoke;
  block[3] = &unk_1E5AC7EB8;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_sync(accessQueue, block);
}

+ (ICHTTPArchive)sharedArchive
{
  if (sharedArchive_sOnceToken != -1) {
    dispatch_once(&sharedArchive_sOnceToken, &__block_literal_global_8331);
  }
  v2 = (void *)sharedArchive_sSharedArchive;

  return (ICHTTPArchive *)v2;
}

void __101__ICHTTPArchive_initWithArchiveDirectoryPath_maxArchiveFiles_maxArchiveBodyLength_flushDelaySeconds___block_invoke(uint64_t a1)
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v2 = +[ICClientInfo defaultInfo];
  id v3 = NSString;
  id v4 = MSVMediaLoggingDirectory();
  v19[0] = v4;
  v19[1] = @"HTTPArchives";
  uint64_t v5 = [v2 clientIdentifier];
  uint64_t v6 = (void *)v5;
  uint64_t v7 = &stru_1EF5F5C40;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  void v19[2] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  uint64_t v9 = [v3 pathWithComponents:v8];
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 56);
  *(void *)(v10 + 56) = v9;

  id v12 = *(void **)(a1 + 40);
  if (v12) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), v12);
  }
  id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v16 = 0;
  if ([v13 fileExistsAtPath:*(void *)(*(void *)(a1 + 32) + 56) isDirectory:&v16]
    && !v16)
  {
    [v13 removeItemAtPath:*(void *)(*(void *)(a1 + 32) + 56) error:0];
  }
  [v13 createDirectoryAtPath:*(void *)(*(void *)(a1 + 32) + 56) withIntermediateDirectories:1 attributes:0 error:0];
  if ([v13 fileExistsAtPath:*(void *)(*(void *)(a1 + 32) + 56) isDirectory:&v16]
    && v16)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
  }
  else
  {
    long long v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 56);
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v15;
      _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_ERROR, "ICHTTPArchive directory '%{public}@' is not a directory! Disabling archiving", buf, 0xCu);
    }
  }
  *(void *)(*(void *)(a1 + 32) + 80) = *(void *)(a1 + 48);
  *(void *)(*(void *)(a1 + 32) + 88) = *(void *)(a1 + 56);
  *(void *)(*(void *)(a1 + 32) + 96) = *(void *)(a1 + 64);
  [*(id *)(a1 + 32) _loadExistingArchivePaths];
  [*(id *)(a1 + 32) _pruneOldArchives];
}

- (void)_pruneOldArchives
{
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ((self->_maxArchiveFiles & 0x8000000000000000) == 0)
  {
    while ((unint64_t)[(NSMutableArray *)self->_archiveFilePaths count] > self->_maxArchiveFiles)
    {
      id v3 = [(NSMutableArray *)self->_archiveFilePaths lastObject];
      [v4 removeItemAtURL:v3 error:0];
      [(NSMutableArray *)self->_archiveFilePaths removeLastObject];
    }
  }
}

void __77__ICHTTPArchive_archiveRequest_withResponse_responseData_performanceMetrics___block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[72])
  {
    id v3 = [v2 _archiveForRequest:*(void *)(a1 + 40)];
    if (v3)
    {
      id v17 = v3;
      id v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
      [v4 setObject:v17 forKey:@"request"];
      uint64_t v5 = *(void *)(a1 + 48);
      if (v5)
      {
        uint64_t v6 = [*(id *)(a1 + 32) _archiveForResponse:v5 responseData:*(void *)(a1 + 56)];
        if (v6) {
          [v4 setObject:v6 forKey:@"response"];
        }
      }
      uint64_t v7 = *(void **)(a1 + 64);
      if (v7)
      {
        v8 = (void *)MEMORY[0x1E4F28D48];
        uint64_t v9 = (void *)MEMORY[0x1E4F1C9C8];
        [v7 requestStartTime];
        uint64_t v10 = objc_msgSend(v9, "dateWithTimeIntervalSince1970:");
        id v11 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
        id v12 = [v8 stringFromDate:v10 timeZone:v11 formatOptions:1907];
        [v4 setValue:v12 forKey:@"startedDateTime"];
      }
      [*(id *)(*(void *)(a1 + 32) + 8) addObject:v4];
      uint64_t v13 = *(void *)(a1 + 32);
      if (*(uint64_t *)(v13 + 96) >= 1
        && (unint64_t v14 = [*(id *)(v13 + 8) count], v13 = *(void *)(a1 + 32), v14 < 2))
      {
        uint64_t v15 = *(NSObject **)(v13 + 24);
        dispatch_time_t v16 = dispatch_time(0, 1000000000 * *(void *)(v13 + 96));
        dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      }
      else
      {
        [(id)v13 _onQueueFlush];
      }

      id v3 = v17;
    }
  }
}

- (id)_archiveForRequest:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = [v4 HTTPMethod];

  if (v6)
  {
    uint64_t v7 = [v4 HTTPMethod];
    [v5 setObject:v7 forKey:@"method"];
  }
  [v5 setObject:@"HTTP/1.1" forKey:@"httpVersion"];
  v8 = [v4 allHTTPHeaderFields];
  uint64_t v9 = [(ICHTTPArchive *)self _arrayFromHeaderDictionary:v8];
  [v5 setObject:v9 forKey:@"headers"];

  [v5 setObject:&unk_1EF640858 forKey:@"headersSize"];
  uint64_t v10 = [v4 HTTPBody];
  if (v10)
  {
    id v11 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
    if (!v11)
    {
      id v11 = [v10 base64EncodedStringWithOptions:0];
    }
    if ([v11 length])
    {
      v19 = @"text";
      v20[0] = v11;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      [v5 setObject:v12 forKey:@"postData"];
    }
  }
  uint64_t v13 = NSNumber;
  unint64_t v14 = [v4 HTTPBody];
  uint64_t v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "length"));
  [v5 setObject:v15 forKey:@"bodySize"];

  dispatch_time_t v16 = [v4 URL];
  id v17 = [v16 absoluteString];

  if (v17) {
    [v5 setObject:v17 forKey:@"url"];
  }

  return v5;
}

- (id)_archiveForResponse:(id)a3 responseData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v6;
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "statusCode"));
    [v8 setObject:v10 forKey:@"status"];

    id v11 = objc_msgSend(MEMORY[0x1E4F18D40], "localizedStringForStatusCode:", objc_msgSend(v9, "statusCode"));
    if (v11) {
      [v8 setObject:v11 forKey:@"statusText"];
    }
    [v8 setObject:@"HTTP/1.1" forKey:@"httpVersion"];
    id v12 = [v9 allHeaderFields];
    uint64_t v13 = [(ICHTTPArchive *)self _arrayFromHeaderDictionary:v12];
    [v8 setObject:v13 forKey:@"headers"];

    [v8 setObject:&unk_1EF640858 forKey:@"headersSize"];
    if (v7
      && (self->_maxArchiveBodyLength < 0 || (unint64_t)[v7 length] < self->_maxArchiveBodyLength))
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v15 = [v9 MIMEType];
      if (v15) {
        [v14 setObject:v15 forKey:@"mimeType"];
      }
      dispatch_time_t v16 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
      if (!v16)
      {
        dispatch_time_t v16 = [v7 base64EncodedStringWithOptions:0];
      }
      if ([v16 length])
      {
        [v14 setObject:v16 forKey:@"text"];
        id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "length"));
        [v14 setObject:v17 forKey:@"bodySize"];
      }
      [v8 setObject:v14 forKey:@"content"];
    }
  }

  return v8;
}

- (void)_onQueueFlush
{
  v25[1] = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_loggedEvents count])
  {
    id v3 = (void *)MEMORY[0x1A6240990]();
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    [v4 setObject:@"1.2" forKey:@"version"];
    uint64_t v5 = [(ICHTTPArchive *)self _archiveCreator];
    [v4 setObject:v5 forKey:@"creator"];

    [v4 setObject:self->_loggedEvents forKey:@"entries"];
    v24 = @"log";
    v25[0] = v4;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    currentArchiveFileName = self->_currentArchiveFileName;
    if (!currentArchiveFileName)
    {
      if (!self->_dateFormatter)
      {
        v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
        dateFormatter = self->_dateFormatter;
        self->_dateFormatter = v8;

        [(NSDateFormatter *)self->_dateFormatter setDateFormat:@"yyyy-MM-dd_HH-mm-ss-SSSS"];
      }
      uint64_t v10 = +[ICClientInfo defaultInfo];
      id v11 = NSString;
      id v12 = [v10 clientIdentifier];
      uint64_t v13 = self->_dateFormatter;
      id v14 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v15 = [(NSDateFormatter *)v13 stringFromDate:v14];
      dispatch_time_t v16 = [v11 stringWithFormat:@"%@_%@.har", v12, v15];
      id v17 = self->_currentArchiveFileName;
      self->_currentArchiveFileName = v16;

      currentArchiveFileName = self->_currentArchiveFileName;
    }
    uint64_t v18 = [(NSString *)self->_archiveDirectoryPath stringByAppendingPathComponent:currentArchiveFileName];
    v19 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:0 error:0];
    id v20 = v19;
    if (v19) {
      [v19 writeToFile:v18 atomically:0];
    }
    archiveFilePaths = self->_archiveFilePaths;
    id v22 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v18];
    [(NSMutableArray *)archiveFilePaths insertObject:v22 atIndex:0];

    [(ICHTTPArchive *)self _pruneOldArchives];
    if ((unint64_t)[(NSMutableArray *)self->_loggedEvents count] >= 2)
    {
      [(NSMutableArray *)self->_loggedEvents removeAllObjects];
      id v23 = self->_currentArchiveFileName;
      self->_currentArchiveFileName = 0;
    }
  }
}

- (id)_archiveCreator
{
  v17[2] = *MEMORY[0x1E4F143B8];
  creatorDictionary = self->_creatorDictionary;
  if (!creatorDictionary)
  {
    id v4 = +[ICClientInfo defaultInfo];
    uint64_t v5 = [v4 clientIdentifier];
    id v6 = (void *)v5;
    id v7 = @"com.apple.itunescloud";
    if (v5) {
      id v7 = (__CFString *)v5;
    }
    v8 = v7;

    uint64_t v9 = [v4 clientVersion];
    uint64_t v10 = (void *)v9;
    id v11 = @"1.0";
    if (v9) {
      id v11 = (__CFString *)v9;
    }
    id v12 = v11;

    v16[0] = @"name";
    v16[1] = @"version";
    v17[0] = v8;
    v17[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    id v14 = self->_creatorDictionary;
    self->_creatorDictionary = v13;

    creatorDictionary = self->_creatorDictionary;
  }

  return creatorDictionary;
}

- (void)_loadExistingArchivePaths
{
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_archiveDirectoryPath isDirectory:1];
  id v4 = [v8 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:0 error:0];
  uint64_t v5 = (void *)[v4 mutableCopy];

  if ([v5 count])
  {
    [v5 sortUsingComparator:&__block_literal_global_108];
    id v6 = v5;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  }
  archiveFilePaths = self->_archiveFilePaths;
  self->_archiveFilePaths = v6;
}

uint64_t __30__ICHTTPArchive_sharedArchive__block_invoke()
{
  sharedArchive_sSharedArchive = objc_alloc_init(ICHTTPArchive);

  return MEMORY[0x1F41817F8]();
}

- (ICHTTPArchive)init
{
  return [(ICHTTPArchive *)self initWithArchiveDirectoryPath:0 maxArchiveFiles:25 maxArchiveBodyLength:204800 flushDelaySeconds:10];
}

- (ICHTTPArchive)initWithArchiveDirectoryPath:(id)a3 maxArchiveFiles:(int64_t)a4 maxArchiveBodyLength:(int64_t)a5 flushDelaySeconds:(int64_t)a6
{
  id v10 = a3;
  v32.receiver = self;
  v32.super_class = (Class)ICHTTPArchive;
  id v11 = [(ICHTTPArchive *)&v32 init];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    uint64_t v13 = (void *)*((void *)v11 + 1);
    *((void *)v11 + 1) = v12;

    id v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.itunescloud.ICHTTPArchive.accessQueue", v14);
    dispatch_time_t v16 = (void *)*((void *)v11 + 2);
    *((void *)v11 + 2) = v15;

    id v17 = *((void *)v11 + 2);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__ICHTTPArchive_initWithArchiveDirectoryPath_maxArchiveFiles_maxArchiveBodyLength_flushDelaySeconds___block_invoke;
    block[3] = &unk_1E5AC7E90;
    uint64_t v18 = (dispatch_source_t *)v11;
    v27 = v18;
    id v28 = v10;
    int64_t v29 = a4;
    int64_t v30 = a5;
    int64_t v31 = a6;
    dispatch_async(v17, block);
    dispatch_source_t v19 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v11 + 2));
    dispatch_source_t v20 = v18[3];
    v18[3] = v19;

    objc_initWeak(&location, v18);
    id v21 = v18[3];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __101__ICHTTPArchive_initWithArchiveDirectoryPath_maxArchiveFiles_maxArchiveBodyLength_flushDelaySeconds___block_invoke_11;
    handler[3] = &unk_1E5ACD778;
    objc_copyWeak(&v24, &location);
    dispatch_source_set_event_handler(v21, handler);
    dispatch_source_set_timer(v18[3], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    dispatch_resume(v18[3]);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return (ICHTTPArchive *)v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveFilePaths, 0);
  objc_storeStrong((id *)&self->_archiveDirectoryPath, 0);
  objc_storeStrong((id *)&self->_creatorDictionary, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_currentArchiveFileName, 0);
  objc_storeStrong((id *)&self->_flushTimer, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_loggedEvents, 0);
}

- (void)flush
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__ICHTTPArchive_flush__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
}

uint64_t __22__ICHTTPArchive_flush__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueFlush];
}

- (void)archiveRequest:(id)a3 withResponse:(id)a4 responseData:(id)a5
{
}

- (void)dealloc
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__ICHTTPArchive_dealloc__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
  flushTimer = self->_flushTimer;
  if (flushTimer) {
    dispatch_source_cancel(flushTimer);
  }
  v5.receiver = self;
  v5.super_class = (Class)ICHTTPArchive;
  [(ICHTTPArchive *)&v5 dealloc];
}

uint64_t __24__ICHTTPArchive_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueFlush];
}

void __101__ICHTTPArchive_initWithArchiveDirectoryPath_maxArchiveFiles_maxArchiveBodyLength_flushDelaySeconds___block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _onQueueFlush];
}

- (id)initUnboundedArchiveWithDirectoryPath:(id)a3
{
  return [(ICHTTPArchive *)self initWithArchiveDirectoryPath:a3 maxArchiveFiles:-1 maxArchiveBodyLength:-1 flushDelaySeconds:0];
}

@end