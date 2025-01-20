@interface WLKSharedFileStorage
- (BOOL)_writeData:(id)a3 toURL:(id)a4 error:(id *)a5;
- (WLKSharedFileStorage)initWithFileName:(id)a3 class:(Class)a4;
- (id)_readDataFromURL:(id)a3 error:(id *)a4;
- (void)delete:(id)a3;
- (void)merge:(id)a3 completion:(id)a4;
- (void)read:(id)a3;
- (void)write:(id)a3 completion:(id)a4;
@end

@implementation WLKSharedFileStorage

- (WLKSharedFileStorage)initWithFileName:(id)a3 class:(Class)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WLKSharedFileStorage;
  v7 = [(WLKSharedFileStorage *)&v18 init];
  if (v7)
  {
    v8 = WLKDefaultSupportPath();
    if ([v8 length])
    {
      v9 = [v8 stringByAppendingPathComponent:v6];
      uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
      fileURL = v7->_fileURL;
      v7->_fileURL = (NSURL *)v10;
    }
    else
    {
      NSLog(&cfstr_Wlksettingssto.isa);
      v9 = v7->_fileURL;
      v7->_fileURL = 0;
    }

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:0];
    coordinator = v7->_coordinator;
    v7->_coordinator = (NSFileCoordinator *)v12;

    v7->_class = a4;
    uint64_t v14 = [(NSURL *)v7->_fileURL lastPathComponent];
    debugString = v7->_debugString;
    v7->_debugString = (NSString *)v14;

    if (([(objc_class *)v7->_class conformsToProtocol:&unk_1F13DBA18] & 1) == 0)
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"class must conform to <WLKCoding>"];

      v16 = 0;
      goto LABEL_9;
    }
  }
  v16 = v7;
LABEL_9:

  return v16;
}

void __29__WLKSharedFileStorage_read___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (v3)
  {
    id v16 = 0;
    id v6 = [WeakRetained _readDataFromURL:v3 error:&v16];
    id v7 = v16;
    v8 = v7;
    if (!v6 && v7)
    {
      v9 = WLKSystemLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v18 = v10;
        __int16 v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) read failed with error: %@", buf, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v11 = WLKSystemLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(v12 + 32);
      v15 = *(void **)(v12 + 8);
      *(_DWORD *)buf = 138412802;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      v20 = v15;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      _os_log_impl(&dword_1BA2E8000, v11, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) failed to coordinate read of %@: %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)_readDataFromURL:(id)a3 error:(id *)a4
{
  id v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3];
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:self->_class fromData:v6 error:a4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)read:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    -[WLKSharedFileStorage read:]();
  }
  v5 = v4;
  id v6 = WLKSystemLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    debugString = self->_debugString;
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = debugString;
    _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) read request", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  fileURL = self->_fileURL;
  coordinator = self->_coordinator;
  id v16 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __29__WLKSharedFileStorage_read___block_invoke;
  v12[3] = &unk_1E620A170;
  objc_copyWeak(&v15, (id *)buf);
  v12[4] = self;
  id v13 = 0;
  id v10 = v5;
  id v14 = v10;
  [(NSFileCoordinator *)coordinator coordinateReadingItemAtURL:fileURL options:0 error:&v16 byAccessor:v12];
  id v11 = v16;

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)write:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    -[WLKSharedFileStorage write:completion:]();
  }
  v8 = v7;
  if (!v7) {
    -[WLKSharedFileStorage write:completion:]();
  }
  v9 = WLKSystemLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    debugString = self->_debugString;
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = debugString;
    _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) write request", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  fileURL = self->_fileURL;
  coordinator = self->_coordinator;
  id v21 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __41__WLKSharedFileStorage_write_completion___block_invoke;
  v16[3] = &unk_1E620A198;
  objc_copyWeak(&v20, (id *)buf);
  v16[4] = self;
  id v17 = 0;
  id v13 = v8;
  id v19 = v13;
  id v14 = v6;
  id v18 = v14;
  [(NSFileCoordinator *)coordinator coordinateWritingItemAtURL:fileURL options:0 error:&v21 byAccessor:v16];
  id v15 = v21;

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __41__WLKSharedFileStorage_write_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = WeakRetained;
  if (v3)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    id v16 = 0;
    char v7 = [WeakRetained _writeData:v6 toURL:v3 error:&v16];
    id v8 = v16;
    if ((v7 & 1) == 0)
    {
      v9 = WLKSystemLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v18 = v10;
        __int16 v19 = 2112;
        id v20 = v8;
        _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) write failed with error: %@", buf, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v11 = WLKSystemLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(v12 + 32);
      id v15 = *(void **)(v12 + 8);
      *(_DWORD *)buf = 138412802;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      id v20 = v15;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      _os_log_impl(&dword_1BA2E8000, v11, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) failed to coordinate write of %@: %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)merge:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    -[WLKSharedFileStorage merge:completion:]();
  }
  id v8 = v7;
  if (!v7) {
    -[WLKSharedFileStorage merge:completion:]();
  }
  v9 = WLKSystemLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    debugString = self->_debugString;
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = debugString;
    _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - %@ merge request", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  fileURL = self->_fileURL;
  coordinator = self->_coordinator;
  id v21 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __41__WLKSharedFileStorage_merge_completion___block_invoke;
  v16[3] = &unk_1E620A198;
  objc_copyWeak(&v20, (id *)buf);
  v16[4] = self;
  id v17 = 0;
  id v13 = v8;
  id v19 = v13;
  id v14 = v6;
  id v18 = v14;
  [(NSFileCoordinator *)coordinator coordinateWritingItemAtURL:fileURL options:8 error:&v21 byAccessor:v16];
  id v15 = v21;

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __41__WLKSharedFileStorage_merge_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v3)
  {
    id v5 = *(id *)(a1 + 48);
    id v21 = 0;
    id v6 = [WeakRetained _readDataFromURL:v3 error:&v21];
    id v7 = v21;
    if (v6)
    {
      if (([v6 conformsToProtocol:&unk_1F13E64E0] & 1) == 0) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"class must conform to <WLKMergeableCoding>"];
      }
      id v8 = WLKSystemLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v9;
        _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) Read existing data. Merging", buf, 0xCu);
      }

      uint64_t v10 = [v6 dataByMergingWith:*(void *)(a1 + 48)];

      id v5 = (id)v10;
    }
    id v20 = v7;
    char v11 = [WeakRetained _writeData:v5 toURL:v3 error:&v20];
    id v12 = v20;

    if ((v11 & 1) == 0)
    {
      id v13 = WLKSystemLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v23 = v14;
        __int16 v24 = 2112;
        id v25 = v12;
        _os_log_impl(&dword_1BA2E8000, v13, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) merge failed with error: %@", buf, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v15 = WLKSystemLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = *(void *)(v16 + 32);
      id v19 = *(void **)(v16 + 8);
      *(_DWORD *)buf = 138412802;
      uint64_t v23 = v18;
      __int16 v24 = 2112;
      id v25 = v19;
      __int16 v26 = 2112;
      uint64_t v27 = v17;
      _os_log_impl(&dword_1BA2E8000, v15, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) failed to coordinate write of %@: %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)delete:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    -[WLKSharedFileStorage delete:]();
  }
  id v5 = v4;
  id v6 = WLKSystemLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    debugString = self->_debugString;
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = debugString;
    _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) delete request", buf, 0xCu);
  }

  fileURL = self->_fileURL;
  coordinator = self->_coordinator;
  id v14 = v5;
  id v15 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __31__WLKSharedFileStorage_delete___block_invoke;
  v12[3] = &unk_1E620A1C0;
  v12[4] = self;
  id v13 = 0;
  id v10 = v5;
  [(NSFileCoordinator *)coordinator coordinateWritingItemAtURL:fileURL options:1 error:&v15 byAccessor:v12];
  id v11 = v15;
}

void __31__WLKSharedFileStorage_delete___block_invoke(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v15 = 0;
    [v4 removeItemAtURL:v3 error:&v15];
    id v5 = v15;

    if (v5 && [v5 code] == 4)
    {
      id v6 = WLKSystemLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = a1[4];
        uint64_t v8 = *(void *)(v7 + 32);
        uint64_t v9 = *(void *)(v7 + 8);
        *(_DWORD *)buf = 138412546;
        uint64_t v17 = v8;
        __int16 v18 = 2112;
        uint64_t v19 = v9;
        _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) No file found to delete. Returning success. %@", buf, 0x16u);
      }

      id v5 = 0;
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    id v10 = WLKSystemLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = a1[4];
      uint64_t v12 = a1[5];
      uint64_t v13 = *(void *)(v11 + 32);
      uint64_t v14 = *(void *)(v11 + 8);
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      _os_log_impl(&dword_1BA2E8000, v10, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) failed to coordinate deletion of %@: %@", buf, 0x20u);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (BOOL)_writeData:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = WLKDefaultSupportPath();
  if (![v9 length])
  {
    NSLog(&cfstr_Wlksettingssto.isa);
    goto LABEL_7;
  }
  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
  int v12 = [v10 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:a5];

  if (!v12)
  {
LABEL_7:
    char v13 = 0;
    goto LABEL_8;
  }
  char v13 = 1;
  uint64_t v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:a5];
  id v15 = v14;
  if (v14) {
    char v13 = [v14 writeToURL:v8 options:1 error:a5];
  }

LABEL_8:
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugString, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)read:.cold.1()
{
  __assert_rtn("-[WLKSharedFileStorage read:]", "WLKSharedFileStorage.m", 56, "completion != nil");
}

- (void)write:completion:.cold.1()
{
  __assert_rtn("-[WLKSharedFileStorage write:completion:]", "WLKSharedFileStorage.m", 83, "data != nil");
}

- (void)write:completion:.cold.2()
{
  __assert_rtn("-[WLKSharedFileStorage write:completion:]", "WLKSharedFileStorage.m", 84, "completion != nil");
}

- (void)merge:completion:.cold.1()
{
  __assert_rtn("-[WLKSharedFileStorage merge:completion:]", "WLKSharedFileStorage.m", 112, "data != nil");
}

- (void)merge:completion:.cold.2()
{
  __assert_rtn("-[WLKSharedFileStorage merge:completion:]", "WLKSharedFileStorage.m", 113, "completion != nil");
}

- (void)delete:.cold.1()
{
  __assert_rtn("-[WLKSharedFileStorage delete:]", "WLKSharedFileStorage.m", 155, "completion != nil");
}

@end