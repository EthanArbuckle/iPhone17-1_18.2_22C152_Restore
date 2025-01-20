@interface FCFileCoordinatedDictionary
- (BOOL)readSyncWithAccessor:(id)a3;
- (BOOL)writeSyncWithAccessor:(id)a3;
- (FCAsyncSerialQueue)asyncAccessQueue;
- (FCFileCoordinatedDictionary)init;
- (FCFileCoordinatedDictionary)initWithFileURL:(id)a3 allowedClasses:(id)a4;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSSet)allowedClasses;
- (NSURL)fileURL;
- (NSURL)presentedItemURL;
- (void)readWithAccessor:(id)a3;
- (void)writeWithAccessor:(id)a3 completion:(id)a4;
@end

@implementation FCFileCoordinatedDictionary

void __53__FCFileCoordinatedDictionary_writeSyncWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 allowedClasses];
  char v6 = FCReadWriteDictionaryWithAccessor(v4, v5, v4, 0, *(void **)(a1 + 40));

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
}

- (NSSet)allowedClasses
{
  return self->_allowedClasses;
}

- (void)writeWithAccessor:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "accessor");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCFileCoordinatedDictionary writeWithAccessor:completion:]";
    __int16 v17 = 2080;
    v18 = "FCFileCoordinatedDictionary.m";
    __int16 v19 = 1024;
    int v20 = 104;
    __int16 v21 = 2114;
    v22 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v8 = [(FCFileCoordinatedDictionary *)self asyncAccessQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__FCFileCoordinatedDictionary_writeWithAccessor_completion___block_invoke;
  v12[3] = &unk_1E5B50BC0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enqueueBlock:v12];
}

- (FCAsyncSerialQueue)asyncAccessQueue
{
  return self->_asyncAccessQueue;
}

void __60__FCFileCoordinatedDictionary_writeWithAccessor_completion___block_invoke(uint64_t a1, void *a2)
{
  v5 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) writeSyncWithAccessor:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v3);
  }
  v5[2](v5, v3);
}

- (BOOL)writeSyncWithAccessor:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:self];
  id v6 = [(FCFileCoordinatedDictionary *)self presentedItemURL];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__FCFileCoordinatedDictionary_writeSyncWithAccessor___block_invoke;
  v10[3] = &unk_1E5B59098;
  v12 = &v18;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  id v13 = &v14;
  [v5 coordinateWritingItemAtURL:v6 options:4 error:0 byAccessor:v10];

  if (v7 && !*((unsigned char *)v15 + 24)) {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
  char v8 = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

- (NSURL)presentedItemURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (FCFileCoordinatedDictionary)initWithFileURL:(id)a3 allowedClasses:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    char v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "fileURL");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCFileCoordinatedDictionary initWithFileURL:allowedClasses:]";
    __int16 v26 = 2080;
    v27 = "FCFileCoordinatedDictionary.m";
    __int16 v28 = 1024;
    int v29 = 34;
    __int16 v30 = 2114;
    v31 = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v22.receiver = self;
  v22.super_class = (Class)FCFileCoordinatedDictionary;
  char v8 = [(FCFileCoordinatedDictionary *)&v22 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    fileURL = v8->_fileURL;
    v8->_fileURL = (NSURL *)v9;

    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    uint64_t v12 = [v7 setByAddingObjectsFromArray:v11];
    allowedClasses = v8->_allowedClasses;
    v8->_allowedClasses = (NSSet *)v12;

    uint64_t v14 = [v6 copy];
    presentedItemURL = v8->_presentedItemURL;
    v8->_presentedItemURL = (NSURL *)v14;

    uint64_t v16 = objc_opt_new();
    presentedItemOperationQueue = v8->_presentedItemOperationQueue;
    v8->_presentedItemOperationQueue = (NSOperationQueue *)v16;

    [(NSOperationQueue *)v8->_presentedItemOperationQueue setMaxConcurrentOperationCount:1];
    uint64_t v18 = objc_opt_new();
    asyncAccessQueue = v8->_asyncAccessQueue;
    v8->_asyncAccessQueue = (FCAsyncSerialQueue *)v18;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncAccessQueue, 0);
  objc_storeStrong((id *)&self->_allowedClasses, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_presentedItemOperationQueue, 0);
  objc_storeStrong((id *)&self->_presentedItemURL, 0);
}

- (FCFileCoordinatedDictionary)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    char v8 = "-[FCFileCoordinatedDictionary init]";
    __int16 v9 = 2080;
    id v10 = "FCFileCoordinatedDictionary.m";
    __int16 v11 = 1024;
    int v12 = 29;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCFileCoordinatedDictionary init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)readSyncWithAccessor:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = __Block_byref_object_copy__61;
  uint64_t v18 = __Block_byref_object_dispose__61;
  id v19 = 0;
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:self];
  id v6 = [(FCFileCoordinatedDictionary *)self presentedItemURL];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__FCFileCoordinatedDictionary_readSyncWithAccessor___block_invoke;
  v9[3] = &unk_1E5B59070;
  v9[4] = self;
  v9[5] = &v14;
  v9[6] = &v10;
  [v5 coordinateReadingItemAtURL:v6 options:0 error:0 byAccessor:v9];

  if (v4) {
    v4[2](v4, v15[5]);
  }
  char v7 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __52__FCFileCoordinatedDictionary_readSyncWithAccessor___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  id v4 = a2;
  v5 = [v3 allowedClasses];
  uint64_t v6 = FCReadDictionary(v4, v5);

  uint64_t v7 = *(void *)(a1[5] + 8);
  char v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
}

- (void)readWithAccessor:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "accessor");
    *(_DWORD *)buf = 136315906;
    __int16 v11 = "-[FCFileCoordinatedDictionary readWithAccessor:]";
    __int16 v12 = 2080;
    char v13 = "FCFileCoordinatedDictionary.m";
    __int16 v14 = 1024;
    int v15 = 94;
    __int16 v16 = 2114;
    char v17 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = [(FCFileCoordinatedDictionary *)self asyncAccessQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__FCFileCoordinatedDictionary_readWithAccessor___block_invoke;
  v8[3] = &unk_1E5B590C0;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  [v5 enqueueBlock:v8];
}

void __48__FCFileCoordinatedDictionary_readWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 readSyncWithAccessor:v3];
  v4[2]();
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

@end