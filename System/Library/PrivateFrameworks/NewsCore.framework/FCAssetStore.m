@interface FCAssetStore
- (FCAssetStore)initWithDirectoryAtPath:(id)a3 preferredAssetPathExtension:(id)a4;
- (FCAssetStore)initWithDirectoryAtPath:(id)a3 preferredAssetPathExtension:(id)a4 knownKeys:(id)a5;
- (id)_filePathForKey:(uint64_t)a1;
- (id)allKeys;
- (id)copyData:(id)a3 withKey:(id)a4;
- (id)copyFileAtPath:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)filePathForKey:(id)a3;
- (id)fileURLForKey:(id)a3;
- (id)moveFileAtPath:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)moveFileAtURL:(id)a3 withKey:(id)a4;
- (off_t)_sizeOfFileAtPath:(off_t)result;
- (unint64_t)sizeOfFileForKey:(id)a3;
- (unint64_t)storeSize;
- (unint64_t)storeSizeForKeys:(id)a3;
- (void)removeAllFiles;
- (void)removeAllFilesExceptKeys:(id)a3;
- (void)removeFileWithKey:(id)a3;
@end

@implementation FCAssetStore

- (FCAssetStore)initWithDirectoryAtPath:(id)a3 preferredAssetPathExtension:(id)a4 knownKeys:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v54.receiver = self;
  v54.super_class = (Class)FCAssetStore;
  v11 = [(FCAssetStore *)&v54 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    directoryPath = v11->_directoryPath;
    v11->_directoryPath = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    preferredExtension = v11->_preferredExtension;
    v11->_preferredExtension = (NSString *)v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    knownKeys = v11->_knownKeys;
    v11->_knownKeys = v16;

    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.assetstore.removal", (dispatch_queue_attr_t)v19);
    removalQueue = v11->_removalQueue;
    v11->_removalQueue = (OS_dispatch_queue *)v20;

    v22 = objc_alloc_init(FCThreadSafeMutableSet);
    keysAwaitingRemoval = v11->_keysAwaitingRemoval;
    v11->_keysAwaitingRemoval = v22;

    v24 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v53 = 0;
    LOBYTE(v19) = [v24 createDirectoryAtPath:v8 withIntermediateDirectories:0 attributes:0 error:&v53];
    id v25 = v53;

    if ((v19 & 1) == 0 && [v25 code] != 516)
    {
      v26 = FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v57 = v25;
        _os_log_error_impl(&dword_1A460D000, v26, OS_LOG_TYPE_ERROR, "error creating asset store directory: %{public}@", buf, 0xCu);
      }
    }
    id v44 = v25;
    id v46 = v10;
    id v47 = v9;
    if (v10)
    {
      v27 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v10, v25);
    }
    else
    {
      v27 = 0;
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v28 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v44);
    v29 = [v28 subpathsOfDirectoryAtPath:v8 error:0];

    id obj = v29;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v50 != v32) {
            objc_enumerationMutation(obj);
          }
          v34 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          v35 = (void *)MEMORY[0x1A6260FD0]();
          id v36 = v34;
          if ([(NSString *)v11->_preferredExtension length])
          {
            id v37 = [v36 stringByDeletingPathExtension];
          }
          else
          {
            id v37 = v36;
          }
          v38 = v37;

          v39 = [v8 stringByAppendingPathComponent:v36];
          if (!v27) {
            goto LABEL_20;
          }
          uint64_t v40 = [v27 member:v38];
          if (v40)
          {
            v41 = (void *)v40;

            v38 = v41;
LABEL_20:
            [(NSMutableSet *)v11->_knownKeys addObject:v38];
            goto LABEL_22;
          }
          v42 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v42 removeItemAtPath:v39 error:0];

LABEL_22:
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
      }
      while (v31);
    }

    id v10 = v46;
    id v9 = v47;
  }

  return v11;
}

- (id)filePathForKey:(id)a3
{
  id v4 = a3;
  if (self) {
    knownKeys = self->_knownKeys;
  }
  else {
    knownKeys = 0;
  }
  if ([(NSMutableSet *)knownKeys containsObject:v4])
  {
    v6 = -[FCAssetStore _filePathForKey:]((uint64_t)self, (uint64_t)v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_filePathForKey:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v3 = [*(id *)(a1 + 8) stringByAppendingPathComponent:a2];
    if ([*(id *)(a1 + 16) length])
    {
      id v4 = [v3 stringByDeletingPathExtension];
      char v5 = [v4 isEqualToString:v3];

      if ((v5 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v8 = (void *)[[NSString alloc] initWithFormat:@"asset store keys should not have an extension"];
        int v9 = 136315906;
        id v10 = "-[FCAssetStore _filePathForKey:]";
        __int16 v11 = 2080;
        uint64_t v12 = "FCAssetStore.m";
        __int16 v13 = 1024;
        int v14 = 292;
        __int16 v15 = 2114;
        v16 = v8;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);
      }
      uint64_t v6 = [v3 stringByAppendingPathExtension:*(void *)(a1 + 16)];

      v3 = (void *)v6;
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)allKeys
{
  if (self) {
    self = (FCAssetStore *)self->_knownKeys;
  }
  return (id)[(FCAssetStore *)self allObjects];
}

- (FCAssetStore)initWithDirectoryAtPath:(id)a3 preferredAssetPathExtension:(id)a4
{
  return [(FCAssetStore *)self initWithDirectoryAtPath:a3 preferredAssetPathExtension:a4 knownKeys:0];
}

- (id)copyFileAtPath:(id)a3 withKey:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = -[FCAssetStore _filePathForKey:]((uint64_t)self, (uint64_t)v9);
  __int16 v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10 isDirectory:0];
  if (self) {
    keysAwaitingRemoval = self->_keysAwaitingRemoval;
  }
  else {
    keysAwaitingRemoval = 0;
  }
  -[FCThreadSafeMutableSet removeObject:](keysAwaitingRemoval, "removeObject:", v9, a5);
  __int16 v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:0];
  id v25 = 0;
  int v15 = [v13 copyItemAtURL:v14 toURL:v11 error:&v25];
  id v16 = v25;

  if (v15)
  {
    if (self) {
      knownKeys = self->_knownKeys;
    }
    else {
      knownKeys = 0;
    }
    [(NSMutableSet *)knownKeys addObject:v9];
    goto LABEL_7;
  }
  uint64_t v19 = [v16 domain];
  if ([v19 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v20 = [v16 code];

    if (v20 == 516)
    {
      v21 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v21 removeItemAtURL:v11 error:0];

LABEL_7:
      id v18 = v10;
      goto LABEL_16;
    }
  }
  else
  {
  }
  v22 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v27 = v16;
    _os_log_error_impl(&dword_1A460D000, v22, OS_LOG_TYPE_ERROR, "error copying file into asset store: %{public}@", buf, 0xCu);
  }
  id v18 = 0;
  if (v24) {
    void *v24 = v16;
  }
LABEL_16:

  return v18;
}

- (id)moveFileAtPath:(id)a3 withKey:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = -[FCAssetStore _filePathForKey:]((uint64_t)self, (uint64_t)v9);
  __int16 v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10 isDirectory:0];
  if (self) {
    keysAwaitingRemoval = self->_keysAwaitingRemoval;
  }
  else {
    keysAwaitingRemoval = 0;
  }
  -[FCThreadSafeMutableSet removeObject:](keysAwaitingRemoval, "removeObject:", v9, a5);
  __int16 v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:0];
  id v25 = 0;
  int v15 = [v13 moveItemAtURL:v14 toURL:v11 error:&v25];
  id v16 = v25;

  if (v15)
  {
    if (self) {
      knownKeys = self->_knownKeys;
    }
    else {
      knownKeys = 0;
    }
    [(NSMutableSet *)knownKeys addObject:v9];
    goto LABEL_16;
  }
  id v18 = [v16 domain];
  if ([v18 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v19 = [v16 code];

    if (v19 == 516)
    {
      uint64_t v20 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v20 removeItemAtURL:v11 error:0];

      id v21 = [(FCAssetStore *)self moveFileAtPath:v8 withKey:v9 error:v24];
      goto LABEL_16;
    }
  }
  else
  {
  }
  v22 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v27 = v16;
    _os_log_error_impl(&dword_1A460D000, v22, OS_LOG_TYPE_ERROR, "error moving file into asset store: %{public}@", buf, 0xCu);
  }
  if (v24) {
    void *v24 = v16;
  }

  id v10 = 0;
LABEL_16:

  return v10;
}

- (id)moveFileAtURL:(id)a3 withKey:(id)a4
{
  id v6 = a4;
  v7 = [a3 path];
  id v8 = [(FCAssetStore *)self moveFileAtPath:v7 withKey:v6 error:0];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)copyData:(id)a3 withKey:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = -[FCAssetStore _filePathForKey:]((uint64_t)self, (uint64_t)v6);
  if (self) {
    keysAwaitingRemoval = self->_keysAwaitingRemoval;
  }
  else {
    keysAwaitingRemoval = 0;
  }
  [(FCThreadSafeMutableSet *)keysAwaitingRemoval removeObject:v6];
  id v15 = 0;
  int v10 = [v7 writeToFile:v8 options:1 error:&v15];

  id v11 = v15;
  if (v10)
  {
    if (self) {
      knownKeys = self->_knownKeys;
    }
    else {
      knownKeys = 0;
    }
    [(NSMutableSet *)knownKeys addObject:v6];
  }
  else
  {
    __int16 v13 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v11;
      _os_log_error_impl(&dword_1A460D000, v13, OS_LOG_TYPE_ERROR, "error copying data into asset store: %{public}@", buf, 0xCu);
    }

    id v8 = 0;
  }

  return v8;
}

- (void)removeFileWithKey:(id)a3
{
  id v4 = a3;
  if (self)
  {
    [(NSMutableSet *)self->_knownKeys removeObject:v4];
    [(FCThreadSafeMutableSet *)self->_keysAwaitingRemoval addObject:v4];
    removalQueue = self->_removalQueue;
  }
  else
  {
    [0 removeObject:v4];
    [0 addObject:v4];
    removalQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__FCAssetStore_removeFileWithKey___block_invoke;
  v7[3] = &unk_1E5B4BE70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(removalQueue, v7);
}

void __34__FCAssetStore_removeFileWithKey___block_invoke(uint64_t a1)
{
  v2 = -[FCAssetStore _filePathForKey:](*(void *)(a1 + 32), *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    id v4 = *(void **)(v3 + 40);
  }
  else {
    id v4 = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__FCAssetStore_removeFileWithKey___block_invoke_2;
  v6[3] = &unk_1E5B4CD98;
  id v7 = *(id *)(a1 + 40);
  id v8 = v2;
  id v5 = v2;
  [v4 readWriteWithAccessor:v6];
}

void __34__FCAssetStore_removeFileWithKey___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 containsObject:*(void *)(a1 + 32)])
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v5 = *(void *)(a1 + 40);
    id v9 = 0;
    char v6 = [v4 removeItemAtPath:v5 error:&v9];
    id v7 = v9;

    if ((v6 & 1) == 0)
    {
      id v8 = FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v11 = v7;
        _os_log_error_impl(&dword_1A460D000, v8, OS_LOG_TYPE_ERROR, "error deleting file from asset store: %{public}@", buf, 0xCu);
      }
    }
    [v3 removeObject:*(void *)(a1 + 32)];
  }
}

- (void)removeAllFilesExceptKeys:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  if (self) {
    knownKeys = self->_knownKeys;
  }
  else {
    knownKeys = 0;
  }
  char v6 = knownKeys;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v11, (void)v12) & 1) == 0) {
          [(FCAssetStore *)self removeFileWithKey:v11];
        }
      }
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)removeAllFiles
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  if (self) {
    knownKeys = self->_knownKeys;
  }
  else {
    knownKeys = 0;
  }
  id v4 = knownKeys;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[FCAssetStore removeFileWithKey:](self, "removeFileWithKey:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9);
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)fileURLForKey:(id)a3
{
  id v3 = [(FCAssetStore *)self filePathForKey:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (unint64_t)sizeOfFileForKey:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "key");
    *(_DWORD *)buf = 136315906;
    long long v10 = "-[FCAssetStore sizeOfFileForKey:]";
    __int16 v11 = 2080;
    long long v12 = "FCAssetStore.m";
    __int16 v13 = 1024;
    int v14 = 253;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v5 = -[FCAssetStore _filePathForKey:]((uint64_t)self, (uint64_t)v4);
  off_t v6 = -[FCAssetStore _sizeOfFileAtPath:]((off_t)self, v5);

  return v6;
}

- (off_t)_sizeOfFileAtPath:(off_t)result
{
  if (result)
  {
    memset(&v2, 0, sizeof(v2));
    if (lstat((const char *)objc_msgSend(a2, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v2))
    {
      return 0;
    }
    else
    {
      return v2.st_size;
    }
  }
  return result;
}

- (unint64_t)storeSize
{
  stat v2 = self;
  if (self) {
    self = (FCAssetStore *)self->_knownKeys;
  }
  id v3 = [(FCAssetStore *)self allObjects];
  unint64_t v4 = [(FCAssetStore *)v2 storeSizeForKeys:v3];

  return v4;
}

- (unint64_t)storeSizeForKeys:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1A6260FD0]();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = -[FCAssetStore _filePathForKey:]((uint64_t)self, *(void *)(*((void *)&v14 + 1) + 8 * i));
        v9 += -[FCAssetStore _sizeOfFileAtPath:]((off_t)self, v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysAwaitingRemoval, 0);
  objc_storeStrong((id *)&self->_removalQueue, 0);
  objc_storeStrong((id *)&self->_knownKeys, 0);
  objc_storeStrong((id *)&self->_preferredExtension, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);
}

@end