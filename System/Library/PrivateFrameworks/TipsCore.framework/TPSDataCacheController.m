@interface TPSDataCacheController
+ (id)sharedInstance;
+ (void)removeAllDataCache;
+ (void)removeDataCacheAtPath:(id)a3;
- (BOOL)backgroundOriginUpdate;
- (BOOL)cacheValidForIdentifier:(id)a3;
- (BOOL)dataCacheDirty;
- (BOOL)isDataCacheValid:(id)a3;
- (BOOL)isURLValid:(id)a3;
- (NSMutableArray)dataCacheArray;
- (NSMutableArray)originFetchItems;
- (NSMutableDictionary)dataCacheMap;
- (NSString)cacheDirectory;
- (NSString)identifier;
- (NSString)languageCode;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)dataCacheSerialQueue;
- (TPSDataCacheController)init;
- (TPSDataCacheController)initWithIdentifier:(id)a3 directoryName:(id)a4 maxCacheSize:(unint64_t)a5 URLSessionDataType:(int64_t)a6;
- (id)cacheFileURLForDataCache:(id)a3;
- (id)cacheFileURLForIdentifier:(id)a3;
- (id)dataCacheForIdentifier:(id)a3;
- (id)formattedDataForPath:(id)a3 identifier:(id)a4 attributionIdentifier:(id)a5 priority:(float)a6 completionHandler:(id)a7;
- (id)formattedDataForRequest:(id)a3 identifier:(id)a4 attributionIdentifier:(id)a5 requestType:(id)a6 priority:(float)a7 completionHandler:(id)a8;
- (id)formattedDataWithData:(id)a3;
- (id)formattedDataWithFileURL:(id)a3;
- (id)newDataCache;
- (id)saveFileURL:(id)a3 identifier:(id)a4 fileSize:(unint64_t)a5 lastModified:(id)a6 dataCache:(id)a7;
- (unint64_t)cacheSize;
- (unint64_t)maxDataCacheSize;
- (void)addDataCache:(id)a3;
- (void)cancelAllOriginSessionItems;
- (void)commonInit;
- (void)createCacheDirectory;
- (void)dealloc;
- (void)excludeURLFromBackup:(id)a3;
- (void)formattedDataWithFileURL:(id)a3 completionHandler:(id)a4;
- (void)pruneCache;
- (void)reloadDataCache;
- (void)removeAllDataCache;
- (void)removeCacheForIdentifier:(id)a3;
- (void)removeDataCache:(id)a3;
- (void)removeDataCache:(id)a3 updateCache:(BOOL)a4;
- (void)setBackgroundOriginUpdate:(BOOL)a3;
- (void)setCacheDirectory:(id)a3;
- (void)setCacheSize:(unint64_t)a3;
- (void)setDataCacheArray:(id)a3;
- (void)setDataCacheDirty:(BOOL)a3;
- (void)setDataCacheMap:(id)a3;
- (void)setDataCacheSerialQueue:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setMaxDataCacheSize:(unint64_t)a3;
- (void)setOriginFetchItems:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)syncCacheImmediately;
- (void)updateCache;
- (void)updateCacheDelay;
@end

@implementation TPSDataCacheController

- (id)formattedDataForRequest:(id)a3 identifier:(id)a4 attributionIdentifier:(id)a5 requestType:(id)a6 priority:(float)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v51 = a5;
  id v50 = a6;
  id v16 = a8;
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5907A48;
  id v17 = v16;
  id v80 = v17;
  id v18 = v15;
  id v79 = v18;
  v19 = _Block_copy(aBlock);
  v20 = [v14 URL];
  if ([v20 isFileURL])
  {
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_3;
    v76[3] = &unk_1E5907A70;
    id v77 = v19;
    [(TPSDataCacheController *)self formattedDataWithFileURL:v20 completionHandler:v76];
    v21 = 0;
    id v22 = v77;
    goto LABEL_36;
  }
  v49 = [v20 path];
  if (v49)
  {
    if (!v18)
    {
      id v18 = [v49 lastPathComponent];
    }
    uint64_t v72 = 0;
    v73 = &v72;
    uint64_t v74 = 0x2020000000;
    char v75 = 1;
    if ([v14 cachePolicy] == 1 || objc_msgSend(v14, "cachePolicy") == 5)
    {
      char v23 = 0;
      goto LABEL_21;
    }
    v46 = [(TPSDataCacheController *)self dataCacheForIdentifier:v18];
    v47 = -[TPSDataCacheController cacheFileURLForDataCache:](self, "cacheFileURLForDataCache:");
    v26 = [v47 path];
    if (!v26) {
      goto LABEL_15;
    }
    v27 = [MEMORY[0x1E4F28CB8] defaultManager];
    v28 = [v47 path];
    int v29 = [v27 fileExistsAtPath:v28];

    if (v29)
    {
      v30 = [v46 identifier];
      v31 = [(TPSDataCacheController *)self cacheFileURLForIdentifier:v30];

      if (v31 && [(TPSDataCacheController *)self isURLValid:v31])
      {
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_4;
        v66[3] = &unk_1E5907A98;
        id v70 = v19;
        id v67 = v46;
        v71 = &v72;
        id v68 = v49;
        v69 = self;
        [(TPSDataCacheController *)self formattedDataWithFileURL:v31 completionHandler:v66];

        char v23 = 1;
      }
      else
      {
        char v23 = 0;
      }
    }
    else
    {
LABEL_15:
      v32 = v46;
      if (!v46)
      {
        char v23 = 0;
        v31 = v47;
LABEL_20:

        if (!*((unsigned char *)v73 + 24) && ![(TPSDataCacheController *)self backgroundOriginUpdate]) {
          goto LABEL_25;
        }
LABEL_21:
        if (![v20 isFileURL])
        {
          v48 = +[TPSURLSessionManager defaultManager];
          if (v23)
          {
            uint64_t v56 = 0;
            v57 = &v56;
            uint64_t v58 = 0x3032000000;
            v59 = __Block_byref_object_copy__2;
            v60 = __Block_byref_object_dispose__2;
            id v61 = 0;
            v54[0] = MEMORY[0x1E4F143A8];
            v54[1] = 3221225472;
            v54[2] = __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_3_44;
            v54[3] = &unk_1E5907B10;
            objc_copyWeak(&v55, location);
            v54[4] = &v56;
            uint64_t v33 = [v48 newURLSessionItemWithRequest:v14 identifier:v18 attributionIdentifier:v51 requestType:v50 completionHandler:v54];
            v34 = (void *)v57[5];
            v57[5] = v33;

            int64_t dataType = self->_dataType;
            v36 = [(id)v57[5] sessionTask];
            [v36 setDataType:dataType];

            v37 = [(id)v57[5] sessionTask];
            LODWORD(v38) = *MEMORY[0x1E4F28A10];
            [v37 setPriority:v38];

            if (v57[5])
            {
              v39 = [(TPSDataCacheController *)self dataCacheSerialQueue];
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_5;
              block[3] = &unk_1E59079A8;
              objc_copyWeak(&v53, location);
              block[4] = &v56;
              dispatch_async(v39, block);

              objc_destroyWeak(&v53);
              uint64_t v40 = v57[5];
            }
            else
            {
              uint64_t v40 = 0;
            }
            [v48 resumeSessionItem:v40];
            objc_destroyWeak(&v55);
            _Block_object_dispose(&v56, 8);

            v25 = 0;
          }
          else
          {
            v62[0] = MEMORY[0x1E4F143A8];
            v62[1] = 3221225472;
            v62[2] = __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_2_43;
            v62[3] = &unk_1E5907AC0;
            id v63 = v19;
            v25 = (void *)[v48 newURLSessionItemWithRequest:v14 identifier:v18 attributionIdentifier:v51 requestType:v50 completionHandler:v62];
            int64_t v41 = self->_dataType;
            v42 = [v25 sessionTask];
            [v42 setDataType:v41];

            v43 = [v25 sessionTask];
            *(float *)&double v44 = a7;
            [v43 setPriority:v44];

            [v48 resumeSessionItem:v25];
          }

          goto LABEL_34;
        }
        if ((v23 & 1) == 0)
        {
          v64[0] = MEMORY[0x1E4F143A8];
          v64[1] = 3221225472;
          v64[2] = __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_42;
          v64[3] = &unk_1E5907A70;
          id v65 = v19;
          [(TPSDataCacheController *)self formattedDataWithFileURL:v20 completionHandler:v64];
          v25 = 0;
        }
        else
        {
LABEL_25:
          v25 = 0;
        }
LABEL_34:
        _Block_object_dispose(&v72, 8);
        goto LABEL_35;
      }
      [(TPSDataCacheController *)self removeDataCache:v46];
      char v23 = 0;
      v31 = v47;
    }
    v32 = v46;
    goto LABEL_20;
  }
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"Empty data path" code:-1 userInfo:0];
  (*((void (**)(void *, void, void, void, void, void *))v19 + 2))(v19, 0, 0, 0, 0, v24);

  v25 = 0;
LABEL_35:
  id v22 = v25;

  v21 = v22;
LABEL_36:

  objc_destroyWeak(location);
  return v21;
}

void __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4);
  }
  else
  {
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"Invalid data" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void, void, void, id))(v2 + 16))(v2, 0, 0, 0, 0, v5);
  }
}

void __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_2;
  block[3] = &unk_1E5907A20;
  id v25 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 32);
  id v21 = v11;
  char v26 = a4;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)formattedDataWithFileURL:(id)a3 completionHandler:(id)a4
{
}

- (id)dataCacheForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2;
  id v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  id v5 = [(TPSDataCacheController *)self dataCacheSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__TPSDataCacheController_dataCacheForIdentifier___block_invoke;
  block[3] = &unk_1E59073F8;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)cacheFileURLForDataCache:(id)a3
{
  id v4 = [a3 identifier];
  id v5 = [(TPSDataCacheController *)self cacheFileURLForIdentifier:v4];

  return v5;
}

- (id)cacheFileURLForIdentifier:(id)a3
{
  if (a3)
  {
    v3 = -[NSString stringByAppendingPathComponent:](self->_cacheDirectory, "stringByAppendingPathComponent:");
    if (v3)
    {
      id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:0];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)setLanguageCode:(id)a3
{
  id v5 = a3;
  if (![(NSString *)self->_languageCode isEqualToString:v5])
  {
    objc_storeStrong((id *)&self->_languageCode, a3);
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    id v6 = [(TPSDataCacheController *)self dataCacheSerialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__TPSDataCacheController_setLanguageCode___block_invoke;
    block[3] = &unk_1E5907930;
    void block[4] = self;
    id v8 = v5;
    v9 = &v10;
    dispatch_sync(v6, block);

    if (*((unsigned char *)v11 + 24)) {
      [(TPSDataCacheController *)self removeAllDataCache];
    }

    _Block_object_dispose(&v10, 8);
  }
}

uint64_t __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void, void))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 80), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

+ (void)removeAllDataCache
{
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v2 = +[TPSCommonDefines appGroupIdentifier];
  if (v2
    && ([v8 containerURLForSecurityApplicationGroupIdentifier:v2],
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = v3;
    id v5 = [v3 URLByAppendingPathComponent:@"Library/Caches"];

    uint64_t v6 = [v5 path];
  }
  else
  {
    id v5 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    uint64_t v6 = [v5 objectAtIndex:0];
  }
  id v7 = (void *)v6;

  +[TPSDataCacheController removeDataCacheAtPath:v7];
}

- (TPSDataCacheController)initWithIdentifier:(id)a3 directoryName:(id)a4 maxCacheSize:(unint64_t)a5 URLSessionDataType:(int64_t)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v29.receiver = self;
  v29.super_class = (Class)TPSDataCacheController;
  char v13 = [(TPSDataCacheController *)&v29 init];
  uint64_t v14 = v13;
  if (v13)
  {
    [(TPSDataCacheController *)v13 commonInit];
    objc_storeStrong((id *)&v14->_identifier, a3);
    v14->_int64_t dataType = a6;
    v14->_maxDataCacheSize = a5;
    id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v16 = +[TPSCommonDefines appGroupIdentifier];
    if (v16
      && ([v15 containerURLForSecurityApplicationGroupIdentifier:v16],
          (id v17 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v18 = v17;
      v19 = [v17 URLByAppendingPathComponent:@"Library/Caches"];

      id v20 = [v19 path];
      uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v16];
    }
    else
    {
      v19 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
      id v20 = [v19 objectAtIndex:0];
      uint64_t v21 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    }
    userDefaults = v14->_userDefaults;
    v14->_userDefaults = (NSUserDefaults *)v21;

    if (v20)
    {
      uint64_t v23 = [v20 stringByAppendingPathComponent:v12];
      cacheDirectory = v14->_cacheDirectory;
      v14->_cacheDirectory = (NSString *)v23;
    }
    if (!v14->_cacheDirectory)
    {

      v27 = 0;
      goto LABEL_14;
    }
    id v25 = +[TPSLogger default];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      char v26 = v14->_cacheDirectory;
      *(_DWORD *)buf = 138412546;
      id v31 = v11;
      __int16 v32 = 2112;
      uint64_t v33 = v26;
      _os_log_impl(&dword_19C8DC000, v25, OS_LOG_TYPE_INFO, "Cache directory for %@: %@.", buf, 0x16u);
    }

    [(TPSDataCacheController *)v14 reloadDataCache];
    [(TPSDataCacheController *)v14 pruneCache];
  }
  v27 = v14;
LABEL_14:

  return v27;
}

- (void)reloadDataCache
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_19C8DC000, log, OS_LOG_TYPE_ERROR, "Unable to unarchive %@, error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)removeAllDataCache
{
  +[TPSDataCacheController removeDataCacheAtPath:self->_cacheDirectory];
  uint64_t v3 = [(TPSDataCacheController *)self dataCacheSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__TPSDataCacheController_removeAllDataCache__block_invoke;
  block[3] = &unk_1E5906740;
  void block[4] = self;
  dispatch_async(v3, block);

  self->_cacheSize = 0;
  [(TPSDataCacheController *)self updateCacheDelay];
  [(NSUserDefaults *)self->_userDefaults removeObjectForKey:self->_identifier];
  [(NSUserDefaults *)self->_userDefaults synchronize];
}

+ (void)removeDataCacheAtPath:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    int v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v5 = [v4 enumeratorAtPath:v3];
    id v6 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
    uint64_t v7 = [v5 nextObject];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      v9 = 0;
      do
      {
        uint64_t v10 = [v3 stringByAppendingPathComponent:v8];
        if (v10)
        {
          id v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
          if (v11)
          {
            id v16 = v9;
            v14[0] = MEMORY[0x1E4F143A8];
            v14[1] = 3221225472;
            v14[2] = __48__TPSDataCacheController_removeDataCacheAtPath___block_invoke;
            v14[3] = &unk_1E59078E0;
            id v15 = v4;
            [v6 coordinateWritingItemAtURL:v11 options:1 error:&v16 byAccessor:v14];
            id v12 = v16;

            v9 = v12;
          }
        }
        uint64_t v13 = [v5 nextObject];

        uint64_t v8 = (void *)v13;
      }
      while (v13);
    }
  }
}

- (void)updateCacheDelay
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__2;
  v8[4] = __Block_byref_object_dispose__2;
  id v9 = 0;
  id v3 = [(TPSDataCacheController *)self dataCacheSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__TPSDataCacheController_updateCacheDelay__block_invoke;
  block[3] = &unk_1E5906768;
  void block[4] = self;
  void block[5] = v8;
  dispatch_sync(v3, block);

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__TPSDataCacheController_updateCacheDelay__block_invoke_2;
  v4[3] = &unk_1E59079A8;
  objc_copyWeak(&v5, &location);
  v4[4] = v8;
  dispatch_async(MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  _Block_object_dispose(v8, 8);
}

- (OS_dispatch_queue)dataCacheSerialQueue
{
  return self->_dataCacheSerialQueue;
}

- (void)setCacheSize:(unint64_t)a3
{
  self->_cacheSize = a3;
}

- (void)pruneCache
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_debug_impl(&dword_19C8DC000, log, OS_LOG_TYPE_DEBUG, "Prune data cache %@.", buf, 0xCu);
}

- (void)createCacheDirectory
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v3 fileExistsAtPath:self->_cacheDirectory] & 1) == 0)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__2;
    id v17 = __Block_byref_object_dispose__2;
    id v18 = 0;
    int v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_cacheDirectory];
    id v5 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
    id v6 = (id *)(v14 + 5);
    id obj = (id)v14[5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__TPSDataCacheController_createCacheDirectory__block_invoke;
    v8[3] = &unk_1E5907908;
    id v9 = v3;
    id v11 = &v13;
    id v7 = v4;
    id v10 = v7;
    [v5 coordinateWritingItemAtURL:v7 options:8 error:&obj byAccessor:v8];
    objc_storeStrong(v6, obj);

    _Block_object_dispose(&v13, 8);
  }
}

- (void)commonInit
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  int v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.IPDataCacheControllerSerialQueue", v3);
  dataCacheSerialQueue = self->_dataCacheSerialQueue;
  self->_dataCacheSerialQueue = v4;

  self->_cacheSize = 0;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  dataCacheArray = self->_dataCacheArray;
  self->_dataCacheArray = v6;

  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  dataCacheMap = self->_dataCacheMap;
  self->_dataCacheMap = v8;

  id v10 = [MEMORY[0x1E4F1CA48] array];
  originFetchItems = self->_originFetchItems;
  self->_originFetchItems = v10;
  MEMORY[0x1F41817F8](v10, originFetchItems);
}

void __42__TPSDataCacheController_setLanguageCode___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "dataCacheArray", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v9 + 1) + 8 * i) languageCode];
        char v8 = [v7 isEqualToString:*(void *)(a1 + 40)];

        if ((v8 & 1) == 0)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __49__TPSDataCacheController_dataCacheForIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) dataCacheMap];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __41__TPSDataCacheController_reloadDataCache__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataCacheArray];
  [v2 removeAllObjects];

  id v3 = [*(id *)(a1 + 32) dataCacheMap];
  [v3 removeAllObjects];
}

void __44__TPSDataCacheController_removeAllDataCache__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataCacheMap];
  [v2 removeAllObjects];

  id v3 = [*(id *)(a1 + 32) dataCacheArray];
  [v3 removeAllObjects];
}

- (NSMutableDictionary)dataCacheMap
{
  return self->_dataCacheMap;
}

uint64_t __42__TPSDataCacheController_updateCacheDelay__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataCacheArray];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (NSMutableArray)dataCacheArray
{
  return self->_dataCacheArray;
}

void __41__TPSDataCacheController_reloadDataCache__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [WeakRetained cacheDirectory];
  uint64_t v4 = [v2 contentsOfDirectoryAtPath:v3 error:0];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (NSString)cacheDirectory
{
  return self->_cacheDirectory;
}

void __48__TPSDataCacheController_removeDataCacheAtPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 path];
  [v2 removeItemAtPath:v3 error:0];
}

- (void)setBackgroundOriginUpdate:(BOOL)a3
{
  self->_backgroundOriginUpdate = a3;
}

void __42__TPSDataCacheController_updateCacheDelay__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained dataCacheDirty])
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:WeakRetained selector:sel_updateCacheDelay object:0];
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v9 = 0;
    uint64_t v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v9];
    id v5 = v9;
    if (v5)
    {
      id v6 = +[TPSLogger data];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __42__TPSDataCacheController_updateCacheDelay__block_invoke_2_cold_1(WeakRetained, (uint64_t)v5, v6);
      }
    }
    else
    {
      id v7 = [WeakRetained userDefaults];
      char v8 = [WeakRetained identifier];
      [v7 setObject:v4 forKey:v8];

      id v6 = [WeakRetained userDefaults];
      [v6 synchronize];
    }

    [WeakRetained setDataCacheDirty:0];
  }
}

- (BOOL)dataCacheDirty
{
  return self->_dataCacheDirty;
}

void __46__TPSDataCacheController_createCacheDirectory__block_invoke(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = [a2 path];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v5 + 40);
  [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);

  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v6 = +[TPSLogger data];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = a1[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_19C8DC000, v6, OS_LOG_TYPE_DEFAULT, "Unable to create path %@", buf, 0xCu);
    }
  }
}

- (id)formattedDataForPath:(id)a3 identifier:(id)a4 attributionIdentifier:(id)a5 priority:(float)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (v12
    && (id v16 = (void *)MEMORY[0x1E4F290D0],
        [MEMORY[0x1E4F1CB10] URLWithString:v12],
        id v17 = objc_claimAutoreleasedReturnValue(),
        [v16 requestWithURL:v17],
        id v18 = objc_claimAutoreleasedReturnValue(),
        v17,
        v18))
  {
    *(float *)&double v19 = a6;
    id v20 = [(TPSDataCacheController *)self formattedDataForRequest:v18 identifier:v13 attributionIdentifier:v14 requestType:@"asset" priority:v15 completionHandler:v19];
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __107__TPSDataCacheController_formattedDataForPath_identifier_attributionIdentifier_priority_completionHandler___block_invoke;
    v22[3] = &unk_1E5907B38;
    id v24 = v15;
    id v23 = v13;
    dispatch_async(MEMORY[0x1E4F14428], v22);

    id v20 = 0;
    id v18 = v24;
  }

  return v20;
}

+ (id)sharedInstance
{
  if (sharedInstance_predicate_3 != -1) {
    dispatch_once(&sharedInstance_predicate_3, &__block_literal_global_11);
  }
  uint64_t v2 = (void *)sharedInstance_gTPSDataCacheController;
  return v2;
}

uint64_t __40__TPSDataCacheController_sharedInstance__block_invoke()
{
  v0 = [[TPSDataCacheController alloc] initWithIdentifier:@"TPSDataCacheIdentifier" directoryName:@"Data" maxCacheSize:5242880 URLSessionDataType:0];
  uint64_t v1 = sharedInstance_gTPSDataCacheController;
  sharedInstance_gTPSDataCacheController = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)dealloc
{
  [(TPSDataCacheController *)self cancelAllOriginSessionItems];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_updateCacheDelay object:0];
  v3.receiver = self;
  v3.super_class = (Class)TPSDataCacheController;
  [(TPSDataCacheController *)&v3 dealloc];
}

- (TPSDataCacheController)init
{
  v5.receiver = self;
  v5.super_class = (Class)TPSDataCacheController;
  uint64_t v2 = [(TPSDataCacheController *)&v5 init];
  objc_super v3 = v2;
  if (v2) {
    [(TPSDataCacheController *)v2 commonInit];
  }
  return v3;
}

- (void)syncCacheImmediately
{
  [(TPSDataCacheController *)self updateCacheDelay];
  [(TPSDataCacheController *)self cancelAllOriginSessionItems];
}

- (BOOL)isDataCacheValid:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(TPSDataCacheController *)self cacheFileURLForDataCache:v4];
  id v6 = [v5 path];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v8 = [v5 path];
    if ([v7 fileExistsAtPath:v8]) {
      int v9 = [v4 expired] ^ 1;
    }
    else {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)cacheValidForIdentifier:(id)a3
{
  id v4 = [(TPSDataCacheController *)self dataCacheForIdentifier:a3];
  if (v4) {
    BOOL v5 = [(TPSDataCacheController *)self isDataCacheValid:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

void __41__TPSDataCacheController_reloadDataCache__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  objc_super v3 = [*(id *)(a1 + 32) dataCacheMap];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) dataCacheArray];
  [v4 addObject:*(void *)(a1 + 48)];
}

void __41__TPSDataCacheController_reloadDataCache__block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 path];
  [v2 removeItemAtPath:v3 error:0];
}

void __36__TPSDataCacheController_pruneCache__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) dataCacheArray];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)updateCache
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__TPSDataCacheController_updateCache__block_invoke;
  block[3] = &unk_1E5906740;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __37__TPSDataCacheController_updateCache__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDataCacheDirty:1];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel_updateCacheDelay object:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 performSelector:sel_updateCacheDelay withObject:0 afterDelay:2.0];
}

- (void)addDataCache:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [(TPSDataCacheController *)self dataCacheForIdentifier:v5];
  if (!v6)
  {
    uint64_t v7 = [(TPSDataCacheController *)self dataCacheSerialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__TPSDataCacheController_addDataCache___block_invoke;
    block[3] = &unk_1E5907980;
    void block[4] = self;
    id v10 = v5;
    id v8 = v4;
    id v11 = v8;
    dispatch_sync(v7, block);

    self->_cacheSize += [v8 fileSize];
  }
  [(TPSDataCacheController *)self updateCache];
}

void __39__TPSDataCacheController_addDataCache___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) dataCacheMap];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) dataCacheArray];
  [v4 addObject:*(void *)(a1 + 48)];
}

- (void)cancelAllOriginSessionItems
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_originFetchItems count])
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy__2;
    double v19 = __Block_byref_object_dispose__2;
    id v20 = 0;
    uint64_t v3 = [(TPSDataCacheController *)self dataCacheSerialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__TPSDataCacheController_cancelAllOriginSessionItems__block_invoke;
    block[3] = &unk_1E5906768;
    void block[4] = self;
    void block[5] = &v15;
    dispatch_sync(v3, block);

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = (id)v16[5];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
          int v9 = +[TPSURLSessionManager defaultManager];
          [v9 cancelSessionItem:v8];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v21 count:16];
      }
      while (v5);
    }

    _Block_object_dispose(&v15, 8);
  }
}

uint64_t __53__TPSDataCacheController_cancelAllOriginSessionItems__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 96);
  return [v5 removeAllObjects];
}

- (void)removeCacheForIdentifier:(id)a3
{
  id v4 = [(TPSDataCacheController *)self dataCacheForIdentifier:a3];
  [(TPSDataCacheController *)self removeDataCache:v4];
}

- (void)removeDataCache:(id)a3
{
}

- (void)removeDataCache:(id)a3 updateCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 identifier];
    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__2;
    uint64_t v34 = __Block_byref_object_dispose__2;
    id v35 = 0;
    int v9 = [(TPSDataCacheController *)self dataCacheSerialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__TPSDataCacheController_removeDataCache_updateCache___block_invoke;
    block[3] = &unk_1E59073F8;
    objc_super v29 = &v30;
    void block[4] = self;
    id v10 = v8;
    id v28 = v10;
    dispatch_sync(v9, block);

    if (v31[5])
    {
      long long v11 = [(TPSDataCacheController *)self cacheFileURLForDataCache:v7];
      long long v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      long long v13 = [v11 path];
      if (v13)
      {
        id v14 = [v11 path];
        int v15 = [v12 fileExistsAtPath:v14];

        if (v15)
        {
          id v16 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
          id v26 = 0;
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __54__TPSDataCacheController_removeDataCache_updateCache___block_invoke_2;
          v24[3] = &unk_1E59078E0;
          id v25 = v12;
          [v16 coordinateWritingItemAtURL:v11 options:1 error:&v26 byAccessor:v24];
          id v17 = v26;
        }
      }
    }
    self->_cacheSize -= [v7 fileSize];
    id v18 = [(TPSDataCacheController *)self dataCacheSerialQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __54__TPSDataCacheController_removeDataCache_updateCache___block_invoke_3;
    v20[3] = &unk_1E59079D0;
    v20[4] = self;
    id v21 = v7;
    id v23 = &v30;
    id v19 = v10;
    id v22 = v19;
    dispatch_async(v18, v20);

    if (v4) {
      [(TPSDataCacheController *)self updateCache];
    }

    _Block_object_dispose(&v30, 8);
  }
}

void __54__TPSDataCacheController_removeDataCache_updateCache___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) dataCacheMap];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __54__TPSDataCacheController_removeDataCache_updateCache___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 path];
  [v2 removeItemAtPath:v3 error:0];
}

void __54__TPSDataCacheController_removeDataCache_updateCache___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataCacheArray];
  [v2 removeObject:*(void *)(a1 + 40)];

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v3 = [*(id *)(a1 + 32) dataCacheMap];
    [v3 removeObjectForKey:*(void *)(a1 + 48)];
  }
}

- (id)newDataCache
{
  uint64_t v2 = objc_alloc_init(TPSDataCache);
  [(TPSDataCache *)v2 setCacheType:0];
  [(TPSDataCache *)v2 setMaxAge:21600];
  return v2;
}

- (id)saveFileURL:(id)a3 identifier:(id)a4 fileSize:(unint64_t)a5 lastModified:(id)a6 dataCache:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = v15;
  id v17 = 0;
  if (v12 && v13)
  {
    unint64_t v39 = a5;
    id v40 = v15;
    id v18 = v15;
    id v19 = [v18 lastModified];
    int v20 = [v19 isEqualToString:v14];

    id v21 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v17 = [(TPSDataCacheController *)self cacheFileURLForIdentifier:v13];
    uint64_t v22 = [v17 path];
    int64_t v41 = v21;
    if (v22)
    {
      id v23 = (void *)v22;
      id v24 = [v17 path];
      int v25 = [v21 fileExistsAtPath:v24];

      if (v20 & v25)
      {
        id v26 = v17;
        v27 = [MEMORY[0x1E4F1C9C8] date];
        [v18 setUpdatedDate:v27];

        [(TPSDataCacheController *)self updateCache];
LABEL_19:
        id v16 = v40;

        goto LABEL_20;
      }
    }
    else
    {
      LOBYTE(v25) = 0;
    }
    id v28 = v17;
    [(TPSDataCacheController *)self createCacheDirectory];
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x2020000000;
    char v59 = 0;
    uint64_t v50 = 0;
    id v51 = &v50;
    uint64_t v52 = 0x3032000000;
    id v53 = __Block_byref_object_copy__2;
    v54 = __Block_byref_object_dispose__2;
    id v55 = 0;
    id v29 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
    if (!v28)
    {
LABEL_18:

      _Block_object_dispose(&v50, 8);
      _Block_object_dispose(&v56, 8);
      goto LABEL_19;
    }
    uint64_t v30 = (id *)(v51 + 5);
    id obj = (id)v51[5];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __81__TPSDataCacheController_saveFileURL_identifier_fileSize_lastModified_dataCache___block_invoke;
    v42[3] = &unk_1E59079F8;
    char v48 = v25;
    id v43 = v41;
    v46 = &v50;
    id v31 = v28;
    uint64_t v32 = v29;
    id v33 = v31;
    id v44 = v31;
    id v45 = v12;
    v47 = &v56;
    id v34 = v33;
    id v35 = v33;
    id v29 = v32;
    [v32 coordinateWritingItemAtURL:v34 options:1 writingItemAtURL:v35 options:2 error:&obj byAccessor:v42];
    objc_storeStrong(v30, obj);
    if (v18)
    {
      if (*((unsigned char *)v57 + 24))
      {
        -[TPSDataCacheController setCacheSize:](self, "setCacheSize:", -[TPSDataCacheController cacheSize](self, "cacheSize") - [v18 fileSize]);
        [(TPSDataCacheController *)self setCacheSize:[(TPSDataCacheController *)self cacheSize] + v39];
LABEL_15:
        [v18 setLastModified:v14];
        v37 = [MEMORY[0x1E4F1C9C8] date];
        [v18 setUpdatedDate:v37];

        [v18 setFileSize:v39];
        if (v18) {
          [(TPSDataCacheController *)self addDataCache:v18];
        }

        goto LABEL_18;
      }
      [(TPSDataCacheController *)self removeDataCache:v18];
    }
    else if (*((unsigned char *)v57 + 24))
    {
      id v18 = [(TPSDataCacheController *)self newDataCache];
      v36 = [(TPSDataCacheController *)self languageCode];
      [v18 setLanguageCode:v36];

      [v18 setIdentifier:v13];
      goto LABEL_15;
    }
    id v18 = 0;
    goto LABEL_15;
  }
LABEL_20:

  return v17;
}

void __81__TPSDataCacheController_saveFileURL_identifier_fileSize_lastModified_dataCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 72))
  {
    if (v5)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
      id obj = *(id *)(v8 + 40);
      [v7 removeItemAtURL:v5 error:&obj];
      objc_storeStrong((id *)(v8 + 40), obj);
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      int v9 = +[TPSLogger default];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v27 = v10;
        __int16 v28 = 2112;
        uint64_t v29 = v11;
        _os_log_impl(&dword_19C8DC000, v9, OS_LOG_TYPE_DEFAULT, "Unable to delete %@. Error: %@", buf, 0x16u);
      }
    }
  }
  if (!v6) {
    goto LABEL_13;
  }
  id v12 = [v6 path];
  id v13 = [v12 stringByDeletingLastPathComponent];

  id v14 = *(void **)(a1 + 32);
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  id v24 = *(id *)(v15 + 40);
  [v14 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v24];
  objc_storeStrong((id *)(v15 + 40), v24);

  uint64_t v16 = *(void *)(a1 + 48);
  if (v16)
  {
    id v17 = *(void **)(a1 + 32);
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    id v23 = *(id *)(v18 + 40);
    [v17 moveItemAtURL:v16 toURL:v6 error:&v23];
    objc_storeStrong((id *)(v18 + 40), v23);
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      goto LABEL_17;
    }
    id v19 = +[TPSLogger default];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v20;
      id v21 = "Unable to move cache data %@";
LABEL_15:
      _os_log_impl(&dword_19C8DC000, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
    }
  }
  else
  {
LABEL_13:
    id v19 = +[TPSLogger default];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v22;
      id v21 = "Unable to save cache data %@ due to missing URL";
      goto LABEL_15;
    }
  }

LABEL_17:
}

void __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = [*(id *)(a1 + 32) lastModified];
    (*(void (**)(uint64_t, id, id, uint64_t, void *, void))(v7 + 16))(v7, v5, v6, 1, v8, 0);

    int v9 = +[TPSLogger data];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v15 = 138412290;
      uint64_t v16 = v10;
      _os_log_impl(&dword_19C8DC000, v9, OS_LOG_TYPE_DEFAULT, "Data cache exists for %@", (uint8_t *)&v15, 0xCu);
    }

    if ([*(id *)(a1 + 32) expired])
    {
      uint64_t v11 = +[TPSLogger default];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_4_cold_1(a1, (id *)(a1 + 32), v11);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      id v14 = [MEMORY[0x1E4F1C9C8] date];
      [*(id *)(a1 + 32) setUpdatedDate:v14];

      [*(id *)(a1 + 48) updateCache];
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    [*(id *)(a1 + 48) removeDataCache:*(void *)(a1 + 32)];
    uint64_t v12 = *(void *)(a1 + 56);
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"Invalid data cache" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void, void, void, void *))(v12 + 16))(v12, 0, 0, 0, 0, v13);
  }
}

uint64_t __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_42(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_2_43(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_3_44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained dataCacheSerialQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_4_45;
  v5[3] = &unk_1E5907AE8;
  uint64_t v4 = *(void *)(a1 + 32);
  v5[4] = WeakRetained;
  v5[5] = v4;
  dispatch_async(v3, v5);
}

void __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_4_45(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) originFetchItems];
  [v2 removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained originFetchItems];
  [v2 addObject:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

void __107__TPSDataCacheController_formattedDataForPath_identifier_attributionIdentifier_priority_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"Invalid request" code:-1 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void, void, void, void, id))(v1 + 16))(v1, v2, 0, 0, 0, 0, v3);
}

- (BOOL)isURLValid:(id)a3
{
  return a3 != 0;
}

- (id)formattedDataWithData:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)formattedDataWithFileURL:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)excludeURLFromBackup:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F1C630];
  id v8 = 0;
  char v5 = [v3 setResourceValue:MEMORY[0x1E4F1CC38] forKey:v4 error:&v8];
  id v6 = v8;
  if ((v5 & 1) == 0)
  {
    uint64_t v7 = +[TPSLogger data];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v10 = v3;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_19C8DC000, v7, OS_LOG_TYPE_DEFAULT, "Unable to exclude %@ from backup due to error %@", buf, 0x16u);
    }
  }
}

- (BOOL)backgroundOriginUpdate
{
  return self->_backgroundOriginUpdate;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setDataCacheArray:(id)a3
{
}

- (unint64_t)cacheSize
{
  return self->_cacheSize;
}

- (unint64_t)maxDataCacheSize
{
  return self->_maxDataCacheSize;
}

- (void)setMaxDataCacheSize:(unint64_t)a3
{
  self->_maxDataCacheSize = a3;
}

- (void)setDataCacheDirty:(BOOL)a3
{
  self->_dataCacheDirty = a3;
}

- (void)setDataCacheSerialQueue:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (void)setDataCacheMap:(id)a3
{
}

- (void)setCacheDirectory:(id)a3
{
}

- (NSMutableArray)originFetchItems
{
  return self->_originFetchItems;
}

- (void)setOriginFetchItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originFetchItems, 0);
  objc_storeStrong((id *)&self->_cacheDirectory, 0);
  objc_storeStrong((id *)&self->_dataCacheMap, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dataCacheSerialQueue, 0);
  objc_storeStrong((id *)&self->_dataCacheArray, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

void __42__TPSDataCacheController_updateCacheDelay__block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v5 = [a1 dataCacheArray];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_19C8DC000, a3, OS_LOG_TYPE_ERROR, "Unable to archive %@, error: %@", (uint8_t *)&v6, 0x16u);
}

void __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_4_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 40);
  char v5 = [*a2 updatedDate];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_19C8DC000, a3, OS_LOG_TYPE_DEBUG, "Data cache expired for %@.  Last update on %@", (uint8_t *)&v6, 0x16u);
}

@end