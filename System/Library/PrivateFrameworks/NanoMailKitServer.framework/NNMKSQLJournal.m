@interface NNMKSQLJournal
- (BOOL)appendSQLStatement:(id)a3;
- (BOOL)isJournalOverflow;
- (NNMKSQLJournal)initWithPath:(id)a3;
- (NSMutableData)currentFileData;
- (NSString)directoryPath;
- (OS_dispatch_queue)journalQueue;
- (id)_journalFilesEnumerator;
- (id)_nextFilePath;
- (id)_sortedJournalFiles;
- (unint64_t)_currentFilesCount;
- (unint64_t)filesCount;
- (void)_flush;
- (void)deleteJournalFiles;
- (void)flushIfNeeded;
- (void)mergeUsingBlock:(id)a3;
- (void)setCurrentFileData:(id)a3;
- (void)setDirectoryPath:(id)a3;
- (void)setFilesCount:(unint64_t)a3;
- (void)setJournalQueue:(id)a3;
@end

@implementation NNMKSQLJournal

- (NNMKSQLJournal)initWithPath:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NNMKSQLJournal;
  v6 = [(NNMKSQLJournal *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_directoryPath, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.NanoMailKit.SQLJournal", 0);
    journalQueue = v7->_journalQueue;
    v7->_journalQueue = (OS_dispatch_queue *)v8;

    v7->_filesCount = [(NNMKSQLJournal *)v7 _currentFilesCount];
    v10 = [MEMORY[0x263F08850] defaultManager];
    [v10 createDirectoryAtPath:v7->_directoryPath withIntermediateDirectories:1 attributes:MEMORY[0x263EFFA78] error:0];
  }
  return v7;
}

- (BOOL)appendSQLStatement:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  journalQueue = self->_journalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__NNMKSQLJournal_appendSQLStatement___block_invoke;
  block[3] = &unk_264E9A7E0;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(journalQueue, block);
  LOBYTE(journalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)journalQueue;
}

void __37__NNMKSQLJournal_appendSQLStatement___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isJournalOverflow])
  {
    v2 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      __37__NNMKSQLJournal_appendSQLStatement___block_invoke_cold_1(v2);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    if (!*(void *)(*(void *)(a1 + 32) + 16))
    {
      id v3 = objc_alloc_init(MEMORY[0x263EFF990]);
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = *(void **)(v4 + 16);
      *(void *)(v4 + 16) = v3;
    }
    id v6 = [*(id *)(a1 + 40) dataUsingEncoding:4];
    uint64_t v7 = [v6 length];
    [*(id *)(*(void *)(a1 + 32) + 16) appendBytes:&v7 length:8];
    [*(id *)(*(void *)(a1 + 32) + 16) appendData:v6];
    if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 16) length] >= 0xA00000) {
      [*(id *)(a1 + 32) _flush];
    }
  }
}

- (void)flushIfNeeded
{
  journalQueue = self->_journalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__NNMKSQLJournal_flushIfNeeded__block_invoke;
  block[3] = &unk_264E99F20;
  block[4] = self;
  dispatch_sync(journalQueue, block);
}

void *__31__NNMKSQLJournal_flushIfNeeded__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[2]) {
    return (void *)[result _flush];
  }
  return result;
}

- (void)mergeUsingBlock:(id)a3
{
  id v4 = a3;
  [(NNMKSQLJournal *)self flushIfNeeded];
  journalQueue = self->_journalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__NNMKSQLJournal_mergeUsingBlock___block_invoke;
  v7[3] = &unk_264E9A808;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(journalQueue, v7);
}

void __34__NNMKSQLJournal_mergeUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) isJournalOverflow])
  {
    id v3 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      __34__NNMKSQLJournal_mergeUsingBlock___block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
  else
  {
    [*v2 _sortedJournalFiles];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v29)
    {
      uint64_t v25 = 0;
      uint64_t v28 = *(void *)v33;
      *(void *)&long long v4 = 138543874;
      long long v24 = v4;
      v27 = v2;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v33 != v28) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v7 = objc_msgSend(*((id *)*v2 + 1), "stringByAppendingPathComponent:", v6, v24);
          id v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v7];
          id v9 = v8;
          if (v8)
          {
            uint64_t v31 = 0;
            if ([v8 length])
            {
              unint64_t v10 = 0;
              while (1)
              {
                unint64_t v11 = v10 + 8;
                if (v10 + 8 > [v9 length]) {
                  break;
                }
                objc_msgSend(v9, "getBytes:range:", &v31, v10, 8);
                unint64_t v12 = v31 + v11;
                if (v12 > [v9 length])
                {
                  uint64_t v13 = qword_26AC21850;
                  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    v37 = v6;
                    _os_log_error_impl(&dword_23D3DF000, v13, OS_LOG_TYPE_ERROR, "Error reading journal file - invalid length. (Path: %{public}@).", buf, 0xCu);
                  }
                }
                char v14 = objc_msgSend(v9, "subdataWithRange:", v11, v31);
                unint64_t v10 = v31 + v11;
                v15 = (void *)[[NSString alloc] initWithData:v14 encoding:4];
                (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

                if (v10 >= [v9 length]) {
                  goto LABEL_22;
                }
              }
              v17 = (void *)__logCategories;
              if (os_log_type_enabled((os_log_t)__logCategories, OS_LOG_TYPE_ERROR))
              {
                v22 = v17;
                uint64_t v23 = [v9 length];
                *(_DWORD *)buf = v24;
                v37 = v6;
                __int16 v38 = 2048;
                unint64_t v39 = v10;
                __int16 v40 = 2048;
                uint64_t v41 = v23;
                _os_log_error_impl(&dword_23D3DF000, v22, OS_LOG_TYPE_ERROR, "Error journal file has data at the end of it that is smaller than NSUInteger of new data. (Path: %{public}@) cursor: %lu data length: %lu.", buf, 0x20u);
              }
            }
LABEL_22:
            v18 = [MEMORY[0x263F08850] defaultManager];
            id v30 = 0;
            char v19 = [v18 removeItemAtPath:v7 error:&v30];
            id v20 = v30;

            if ((v19 & 1) == 0)
            {
              uint64_t v25 = [v6 longLongValue];
              v21 = qword_26AC21850;
              if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v37 = v6;
                __int16 v38 = 2114;
                unint64_t v39 = (unint64_t)v20;
                _os_log_error_impl(&dword_23D3DF000, v21, OS_LOG_TYPE_ERROR, "Error deleting journal file after applying. (Path: %{public}@, Error: %{public}@).", buf, 0x16u);
              }
            }

            v2 = v27;
          }
          else
          {
            v16 = qword_26AC21850;
            if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v37 = v6;
              _os_log_error_impl(&dword_23D3DF000, v16, OS_LOG_TYPE_ERROR, "Error reading journal file from file system. (Path: %{public}@).", buf, 0xCu);
            }
          }
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v29);
    }
    else
    {
      uint64_t v25 = 0;
    }
    *((void *)*v2 + 4) = v25;
  }
}

- (void)deleteJournalFiles
{
  [(NNMKSQLJournal *)self flushIfNeeded];
  journalQueue = self->_journalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__NNMKSQLJournal_deleteJournalFiles__block_invoke;
  block[3] = &unk_264E99F20;
  block[4] = self;
  dispatch_sync(journalQueue, block);
}

void __36__NNMKSQLJournal_deleteJournalFiles__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
    __36__NNMKSQLJournal_deleteJournalFiles__block_invoke_cold_1(v2);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v15 = a1;
  id v3 = [*(id *)(a1 + 32) _journalFilesEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        id v9 = [MEMORY[0x263F08850] defaultManager];
        id v16 = 0;
        char v10 = [v9 removeItemAtURL:v8 error:&v16];
        id v11 = v16;

        if ((v10 & 1) == 0)
        {
          unint64_t v12 = (void *)qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
          {
            uint64_t v13 = v12;
            char v14 = [v8 lastPathComponent];
            *(_DWORD *)buf = 138543618;
            v22 = v14;
            __int16 v23 = 2114;
            id v24 = v11;
            _os_log_error_impl(&dword_23D3DF000, v13, OS_LOG_TYPE_ERROR, "Error deleting journal file. (Path: %{public}@, Error: %{public}@).", buf, 0x16u);
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v5);
  }

  *(void *)(*(void *)(v15 + 32) + 32) = 0;
}

- (BOOL)isJournalOverflow
{
  return self->_filesCount >> 4 > 0x270;
}

- (unint64_t)_currentFilesCount
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(NNMKSQLJournal *)self _journalFilesEnumerator];
  unint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) lastPathComponent];
        if ([v7 compare:v4] == 1)
        {
          id v8 = v7;

          uint64_t v4 = v8;
        }
      }
      unint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);

    if (!v4) {
      return 0;
    }
    unint64_t v3 = [v4 longLongValue] + 1;
    v2 = v4;
  }

  return v3;
}

- (id)_journalFilesEnumerator
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [NSURL URLWithString:self->_directoryPath];
  if (v2)
  {
    unint64_t v3 = [MEMORY[0x263F08850] defaultManager];
    v7[0] = *MEMORY[0x263EFF750];
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    uint64_t v5 = [v3 enumeratorAtURL:v2 includingPropertiesForKeys:v4 options:5 errorHandler:&__block_literal_global_8];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __41__NNMKSQLJournal__journalFilesEnumerator__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
    __41__NNMKSQLJournal__journalFilesEnumerator__block_invoke_cold_1((uint64_t)v3, v4);
  }

  return 1;
}

- (void)_flush
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_23D3DF000, log, OS_LOG_TYPE_ERROR, "Error flushing journal file. (Path: %{public}@ - Error: %{public}@).", (uint8_t *)&v3, 0x16u);
}

- (id)_nextFilePath
{
  int v3 = objc_msgSend(NSString, "stringWithFormat:", @"%.15lu", self->_filesCount);
  uint64_t v4 = [(NSString *)self->_directoryPath stringByAppendingPathComponent:v3];

  return v4;
}

- (id)_sortedJournalFiles
{
  int v3 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v4 = [v3 contentsOfDirectoryAtPath:self->_directoryPath error:0];

  __int16 v5 = [v4 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

  return v5;
}

- (NSString)directoryPath
{
  return self->_directoryPath;
}

- (void)setDirectoryPath:(id)a3
{
}

- (NSMutableData)currentFileData
{
  return self->_currentFileData;
}

- (void)setCurrentFileData:(id)a3
{
}

- (OS_dispatch_queue)journalQueue
{
  return self->_journalQueue;
}

- (void)setJournalQueue:(id)a3
{
}

- (unint64_t)filesCount
{
  return self->_filesCount;
}

- (void)setFilesCount:(unint64_t)a3
{
  self->_filesCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_journalQueue, 0);
  objc_storeStrong((id *)&self->_currentFileData, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);
}

void __37__NNMKSQLJournal_appendSQLStatement___block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = 10000;
  _os_log_error_impl(&dword_23D3DF000, log, OS_LOG_TYPE_ERROR, "Journal Files count hit the limit (more than %lu). No longer appending SQL", (uint8_t *)&v1, 0xCu);
}

void __34__NNMKSQLJournal_mergeUsingBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 32);
  int v3 = 134218240;
  uint64_t v4 = v2;
  __int16 v5 = 2048;
  uint64_t v6 = 10000;
  _os_log_error_impl(&dword_23D3DF000, a2, OS_LOG_TYPE_ERROR, "Unable to Merge, Journal Files count is %lu (exceeding limit: %lu)", (uint8_t *)&v3, 0x16u);
}

void __36__NNMKSQLJournal_deleteJournalFiles__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_23D3DF000, log, OS_LOG_TYPE_ERROR, "Deleting journal files", v1, 2u);
}

void __41__NNMKSQLJournal__journalFilesEnumerator__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D3DF000, a2, OS_LOG_TYPE_ERROR, "Error reading journal file from folder. (Error: %{public}@).", (uint8_t *)&v2, 0xCu);
}

@end