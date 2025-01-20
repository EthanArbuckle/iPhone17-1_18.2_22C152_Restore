@interface SSPersistentCache
+ (id)safeKeyForKey:(id)a3;
- (BOOL)_isFileNotFound:(id)a3;
- (BOOL)clear;
- (BOOL)removeDataForKey:(id)a3;
- (BOOL)setData:(id)a3 forKey:(id)a4;
- (SSPersistentCache)initWithIdentifier:(id)a3 cacheName:(id)a4;
- (id)_pathForKey:(id)a3;
- (id)dataForKey:(id)a3;
- (id)description;
- (void)dealloc;
- (void)setFilenameSafeKeys:(BOOL)a3;
@end

@implementation SSPersistentCache

- (SSPersistentCache)initWithIdentifier:(id)a3 cacheName:(id)a4
{
  v39[2] = *MEMORY[0x1E4F143B8];
  v6 = [(SSPersistentCache *)self init];
  if (v6)
  {
    if (![a3 length] || !objc_msgSend(a4, "length"))
    {
LABEL_15:

      return 0;
    }
    v6->_identifier = (NSString *)[a3 copy];
    v6->_cacheName = (NSString *)[a4 copy];
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", CPSharedResourcesDirectory(), @"Library", @"Caches", a3, a4, 0);
    v6->_path = (NSString *)(id)[NSString pathWithComponents:v7];

    v6->_fm = (NSFileManager *)objc_alloc_init(MEMORY[0x1E4F28CB8]);
    id v8 = objc_alloc(MEMORY[0x1E4F1C978]);
    v9 = (objc_class *)objc_opt_class();
    v10 = objc_msgSend(v8, "initWithObjects:", NSStringFromClass(v9), a3, a4, 0);
    v11 = (void *)[v10 componentsJoinedByString:@"."];

    v12 = dispatch_queue_create((const char *)[v11 UTF8String], 0);
    v6->_serialQueue = (OS_dispatch_queue *)v12;
    global_queue = dispatch_get_global_queue(0, 0);
    dispatch_set_target_queue(v12, global_queue);
    uint64_t v14 = *MEMORY[0x1E4F282E0];
    v38[0] = *MEMORY[0x1E4F28320];
    v38[1] = v14;
    v39[0] = @"mobile";
    v39[1] = @"mobile";
    uint64_t v31 = 0;
    if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v6->_fm, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6->_path, 1, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2], &v31))
    {
      id v15 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v15) {
        id v15 = +[SSLogConfig sharedConfig];
      }
      int v16 = [v15 shouldLog];
      if ([v15 shouldLogToDisk]) {
        int v17 = v16 | 2;
      }
      else {
        int v17 = v16;
      }
      if (!os_log_type_enabled((os_log_t)[v15 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v17 &= 2u;
      }
      if (v17)
      {
        uint64_t v18 = objc_opt_class();
        path = v6->_path;
        int v32 = 138412802;
        uint64_t v33 = v18;
        __int16 v34 = 2112;
        v35 = path;
        __int16 v36 = 2112;
        uint64_t v37 = v31;
        LODWORD(v30) = 32;
        uint64_t v20 = _os_log_send_and_compose_impl();
        if (v20)
        {
          v21 = (void *)v20;
          uint64_t v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v32, v30);
          free(v21);
          SSFileLog(v15, @"%@", v23, v24, v25, v26, v27, v28, v22);
        }
      }
      goto LABEL_15;
    }
  }
  return v6;
}

- (void)dealloc
{
  serialQueue = self->_serialQueue;
  if (serialQueue) {
    dispatch_release(serialQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)SSPersistentCache;
  [(SSPersistentCache *)&v4 dealloc];
}

- (id)_pathForKey:(id)a3
{
  path = self->_path;
  if (!self->_safeKeys) {
    a3 = +[SSPersistentCache safeKeyForKey:a3];
  }
  return [(NSString *)path stringByAppendingPathComponent:a3];
}

- (BOOL)_isFileNotFound:(id)a3
{
  if ([a3 code] != 4) {
    return 0;
  }
  objc_super v4 = (void *)[a3 domain];
  uint64_t v5 = *MEMORY[0x1E4F281F8];
  return [v4 isEqualToString:v5];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ : %p> - [ID: %@] [Name: %@]", objc_opt_class(), self, self->_identifier, self->_cacheName];
}

+ (id)safeKeyForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!CC_MD5((const void *)[a3 UTF8String], objc_msgSend(a3, "length"), md)) {
    return 0;
  }
  v3 = (void *)[MEMORY[0x1E4F28E78] string];
  for (uint64_t i = 0; i != 16; ++i)
    objc_msgSend(v3, "appendFormat:", @"%02x", md[i]);
  return v3;
}

- (void)setFilenameSafeKeys:(BOOL)a3
{
  self->_safeKeys = a3;
}

- (BOOL)setData:(id)a3 forKey:(id)a4
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  if ([a4 length] && objc_msgSend(a3, "length"))
  {
    id v7 = [(SSPersistentCache *)self _pathForKey:a4];
    serialQueue = self->_serialQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __36__SSPersistentCache_setData_forKey___block_invoke;
    v11[3] = &unk_1E5BA7578;
    v11[4] = self;
    v11[5] = a3;
    v11[6] = v7;
    v11[7] = &v12;
    dispatch_sync(serialQueue, v11);
  }
  char v9 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __36__SSPersistentCache_setData_forKey___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v2) {
    id v2 = +[SSLogConfig sharedConfig];
  }
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  if (!os_log_type_enabled((os_log_t)[v2 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = [*(id *)(a1 + 40) length];
    uint64_t v7 = *(void *)(a1 + 48);
    int v20 = 138412802;
    uint64_t v21 = v5;
    __int16 v22 = 1024;
    int v23 = v6;
    __int16 v24 = 2112;
    uint64_t v25 = v7;
    LODWORD(v19) = 28;
    uint64_t v18 = &v20;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      char v9 = (void *)v8;
      uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v20, v19);
      free(v9);
      SSFileLog(v2, @"%@", v11, v12, v13, v14, v15, v16, v10);
    }
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 40), "writeToFile:atomically:", *(void *)(a1 + 48), 1, v18);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)removeDataForKey:(id)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  if ([a3 length])
  {
    id v5 = [(SSPersistentCache *)self _pathForKey:a3];
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__SSPersistentCache_removeDataForKey___block_invoke;
    block[3] = &unk_1E5BA8F70;
    block[5] = v5;
    block[6] = &v10;
    block[4] = self;
    dispatch_sync(serialQueue, block);
  }
  char v7 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __38__SSPersistentCache_removeDataForKey___block_invoke(uint64_t a1)
{
  uint64_t v3 = 0;
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) removeItemAtPath:*(void *)(a1 + 40) error:&v3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t result = [*(id *)(a1 + 32) _isFileNotFound:v3];
    if (result) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  return result;
}

- (BOOL)clear
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__SSPersistentCache_clear__block_invoke;
  v5[3] = &unk_1E5BAA0A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __26__SSPersistentCache_clear__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 40) enumeratorAtPath:*(void *)(*(void *)(a1 + 32) + 32)];
  uint64_t result = [v2 nextObject];
  if (result)
  {
    uint64_t v4 = result;
    do
    {
      id v5 = (void *)MEMORY[0x1A6267F60]();
      uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 32) stringByAppendingPathComponent:v4];
      uint64_t v22 = 0;
      if (([*(id *)(*(void *)(a1 + 32) + 40) removeItemAtPath:v6 error:&v22] & 1) == 0)
      {
        id v7 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v7) {
          id v7 = +[SSLogConfig sharedConfig];
        }
        int v8 = [v7 shouldLog];
        if ([v7 shouldLogToDisk]) {
          int v9 = v8 | 2;
        }
        else {
          int v9 = v8;
        }
        if (os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
          int v10 = v9;
        }
        else {
          int v10 = v9 & 2;
        }
        if (v10)
        {
          int v23 = 138412290;
          uint64_t v24 = v6;
          LODWORD(v21) = 12;
          int v20 = &v23;
          uint64_t v11 = _os_log_send_and_compose_impl();
          if (v11)
          {
            uint64_t v12 = (void *)v11;
            uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v23, v21);
            free(v12);
            SSFileLog(v7, @"%@", v14, v15, v16, v17, v18, v19, v13);
          }
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      }
      objc_msgSend(v2, "skipDescendents", v20);
      uint64_t result = [v2 nextObject];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (id)dataForKey:(id)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = __Block_byref_object_copy__73;
  uint64_t v14 = __Block_byref_object_dispose__73;
  uint64_t v15 = 0;
  if ([a3 length])
  {
    id v5 = [(SSPersistentCache *)self _pathForKey:a3];
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__SSPersistentCache_dataForKey___block_invoke;
    block[3] = &unk_1E5BA8F70;
    block[5] = self;
    block[6] = &v10;
    block[4] = v5;
    dispatch_sync(serialQueue, block);
  }
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __32__SSPersistentCache_dataForKey___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1A6267F60]();
  uint64_t v18 = 0;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:*(void *)(a1 + 32) options:1 error:&v18];
  if (v18 && (objc_msgSend(*(id *)(a1 + 40), "_isFileNotFound:") & 1) == 0)
  {
    id v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3) {
      id v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v5 &= 2u;
    }
    if (v5)
    {
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = *(void *)(a1 + 32);
      int v19 = 138412546;
      uint64_t v20 = v6;
      __int16 v21 = 2112;
      uint64_t v22 = v7;
      LODWORD(v17) = 22;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        int v9 = (void *)v8;
        uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v19, v17);
        free(v9);
        SSFileLog(v3, @"%@", v11, v12, v13, v14, v15, v16, v10);
      }
    }
  }
}

@end