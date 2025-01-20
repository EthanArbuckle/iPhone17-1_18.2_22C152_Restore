@interface PUReviewFileManager
+ (id)defaultManager;
- (BOOL)_allowedToDeleteItemAtURL:(id)a3;
- (BOOL)_removeItemAtURL:(id)a3 error:(id *)a4 stackshot:(id)a5;
- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4;
- (NSFileManager)_fileManager;
- (NSURL)_safePathURL;
- (OS_dispatch_queue)_fileManagementQueue;
- (PUReviewFileManager)initWithFileManager:(id)a3;
- (void)removeItemAtURL:(id)a3 completion:(id)a4;
@end

@implementation PUReviewFileManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__safePathURL, 0);
  objc_storeStrong((id *)&self->__fileManagementQueue, 0);
  objc_storeStrong((id *)&self->__fileManager, 0);
}

- (NSURL)_safePathURL
{
  return self->__safePathURL;
}

- (OS_dispatch_queue)_fileManagementQueue
{
  return self->__fileManagementQueue;
}

- (NSFileManager)_fileManager
{
  return self->__fileManager;
}

- (BOOL)_removeItemAtURL:(id)a3 error:(id *)a4 stackshot:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if ([(PUReviewFileManager *)self _allowedToDeleteItemAtURL:v9])
  {
    v11 = [(PUReviewFileManager *)self _fileManager];
    char v12 = [v11 removeItemAtURL:v9 error:a4];
  }
  else
  {
    v11 = [MEMORY[0x1E4F28E78] stringWithFormat:@"Attempt to remove item %@. ", v9];
    v13 = [(PUReviewFileManager *)self _safePathURL];
    [v11 appendFormat:@"The item is outside the specified safe area %@. ", v13];

    if (v10)
    {
      v14 = [v10 componentsJoinedByString:@"\n"];
      [v11 appendFormat:@"The deletion was attempted via\n%@", v14];
    }
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PUReviewFileManager.m" lineNumber:99 description:v11];

    char v12 = 0;
  }

  return v12;
}

- (BOOL)_allowedToDeleteItemAtURL:(id)a3
{
  v4 = [a3 pathComponents];
  v5 = [(PUReviewFileManager *)self _safePathURL];
  v6 = [v5 pathComponents];

  unint64_t v7 = [v4 count];
  if (v7 <= [v6 count])
  {
    char v11 = 0;
  }
  else if ([v6 count])
  {
    unint64_t v8 = 0;
    do
    {
      id v9 = [v4 objectAtIndexedSubscript:v8];
      id v10 = [v6 objectAtIndexedSubscript:v8];
      char v11 = [v9 isEqualToString:v10];

      if ((v11 & 1) == 0) {
        break;
      }
      ++v8;
    }
    while ([v6 count] > v8);
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (void)removeItemAtURL:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PUReviewFileManager *)self _fileManagementQueue];
  id v9 = [MEMORY[0x1E4F29060] callStackSymbols];
  objc_initWeak(&location, self);
  id v10 = PLUIGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to delete file at URL: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PUReviewFileManager_removeItemAtURL_completion___block_invoke;
  block[3] = &unk_1E5F2B510;
  objc_copyWeak(&v18, &location);
  id v15 = v6;
  id v16 = v9;
  id v17 = v7;
  id v11 = v7;
  id v12 = v9;
  id v13 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __50__PUReviewFileManager_removeItemAtURL_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v6 = 0;
  uint64_t v3 = [WeakRetained _removeItemAtURL:*(void *)(a1 + 32) error:&v6 stackshot:*(void *)(a1 + 40)];
  id v4 = v6;

  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v3, v4);
  }
}

- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = PLUIGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to delete file at URL: %@", (uint8_t *)&v10, 0xCu);
  }

  BOOL v8 = [(PUReviewFileManager *)self _removeItemAtURL:v6 error:a4 stackshot:0];
  return v8;
}

- (PUReviewFileManager)initWithFileManager:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PUReviewFileManager.m", 30, @"Invalid parameter not satisfying: %@", @"fileManager" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)PUReviewFileManager;
  id v7 = [(PUReviewFileManager *)&v17 init];
  BOOL v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->__fileManager, a3);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.ax-review.filemanagement", 0);
    fileManagementQueue = v8->__fileManagementQueue;
    v8->__fileManagementQueue = (OS_dispatch_queue *)v9;

    id v11 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v12 = NSTemporaryDirectory();
    uint64_t v13 = [v11 fileURLWithPath:v12];
    safePathURL = v8->__safePathURL;
    v8->__safePathURL = (NSURL *)v13;
  }
  return v8;
}

+ (id)defaultManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__PUReviewFileManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (defaultManager_onceToken_76632 != -1) {
    dispatch_once(&defaultManager_onceToken_76632, block);
  }
  v2 = (void *)defaultManager_defaultManager;
  return v2;
}

void __37__PUReviewFileManager_defaultManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v2 = [v1 initWithFileManager:v4];
  uint64_t v3 = (void *)defaultManager_defaultManager;
  defaultManager_defaultManager = v2;
}

@end