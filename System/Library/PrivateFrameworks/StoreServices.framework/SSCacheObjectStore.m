@interface SSCacheObjectStore
- (BOOL)addObject:(id)a3 withItemIdentifier:(id)a4;
- (BOOL)removeObjectWithItemIdentifier:(id)a3;
- (SSCacheObjectStore)initWithSessionIdentifier:(id)a3;
- (id)_factoryForTypeIdentifier:(id)a3;
- (id)cacheObjectWithItemIdentifier:(id)a3;
- (id)description;
- (void)addCacheObjectFactory:(id)a3;
- (void)clearSession;
- (void)dealloc;
- (void)removeCacheObjectFactory:(id)a3;
@end

@implementation SSCacheObjectStore

- (SSCacheObjectStore)initWithSessionIdentifier:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([a3 length])
  {
    v5 = [(SSCacheObjectStore *)self init];
    if (v5)
    {
      v5->_sessionIdentifier = (NSString *)a3;
      v5->_factories = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:5];
      v6 = [SSDatabaseCache alloc];
      v7 = (objc_class *)objc_opt_class();
      v8 = [(SSDatabaseCache *)v6 initWithIdentifier:NSStringFromClass(v7) cacheName:a3];
      v5->_databaseCache = v8;
      [(SSDatabaseCache *)v8 setMaximumInlineBlobSize:1024];
      v9 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"%@.%@", objc_opt_class(), a3), "UTF8String"];
      v5->_serialQueue = (OS_dispatch_queue *)dispatch_queue_create(v9, 0);
    }
  }
  else
  {
    id v10 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig];
    }
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v24 = 138412290;
      uint64_t v25 = objc_opt_class();
      LODWORD(v23) = 12;
      uint64_t v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        v14 = (void *)v13;
        uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v24, v23);
        free(v14);
        SSFileLog(v10, @"%@", v16, v17, v18, v19, v20, v21, v15);
      }
    }

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_serialQueue);
  v3.receiver = self;
  v3.super_class = (Class)SSCacheObjectStore;
  [(SSCacheObjectStore *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)SSCacheObjectStore;
  return (id)[NSString stringWithFormat:@"%@: [Session Identifier: %@] [Factories: %d]", -[SSCacheObjectStore description](&v3, sel_description), self->_sessionIdentifier, -[NSMutableSet count](self->_factories, "count")];
}

- (id)_factoryForTypeIdentifier:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ([a3 length])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    factories = self->_factories;
    uint64_t v6 = [(NSMutableSet *)factories countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(factories);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
        if ([v10 supportsTypeIdentifier:a3]) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [(NSMutableSet *)factories countByEnumeratingWithState:&v26 objects:v32 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_12;
        }
      }
      id v11 = v10;
      if (v11) {
        return v11;
      }
    }
  }
LABEL_12:
  id v12 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v12) {
    id v12 = +[SSLogConfig sharedConfig];
  }
  int v13 = [v12 shouldLog];
  if ([v12 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  if (os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    int v15 = v14;
  }
  else {
    int v15 = v14 & 2;
  }
  if (!v15) {
    goto LABEL_23;
  }
  int v30 = 138412290;
  id v31 = a3;
  LODWORD(v25) = 12;
  id v11 = (id)_os_log_send_and_compose_impl();
  if (v11)
  {
    uint64_t v16 = v11;
    uint64_t v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v30, v25);
    free(v16);
    SSFileLog(v12, @"%@", v18, v19, v20, v21, v22, v23, v17);
LABEL_23:
    id v11 = 0;
  }
  return v11;
}

- (void)clearSession
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SSCacheObjectStore_clearSession__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __34__SSCacheObjectStore_clearSession__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
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
  if (os_log_type_enabled((os_log_t)[v2 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    int v5 = v4;
  }
  else {
    int v5 = v4 & 2;
  }
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 24);
    int v19 = 138412290;
    uint64_t v20 = v6;
    LODWORD(v18) = 12;
    uint64_t v17 = &v19;
    uint64_t v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v19, v18);
      free(v8);
      SSFileLog(v2, @"%@", v10, v11, v12, v13, v14, v15, v9);
    }
  }
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "clear", v17);
}

- (BOOL)addObject:(id)a3 withItemIdentifier:(id)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SSCacheObjectStore_addObject_withItemIdentifier___block_invoke;
  v7[3] = &unk_1E5BAE488;
  v7[4] = a3;
  v7[5] = self;
  v7[6] = a4;
  v7[7] = &v8;
  dispatch_sync(serialQueue, v7);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __51__SSCacheObjectStore_addObject_withItemIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[*(id *)(a1 + 32) cacheObjectDataRepresentation];
  if ([v2 length])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v3 = [*(id *)(a1 + 32) cacheObjectTypeIdentifier];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "distantFuture"), "timeIntervalSinceReferenceDate");
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void **)(*(void *)(a1 + 40) + 8);
    [v6 setData:v2 expiring:v5 retiring:v3 lookupKey:v4 userInfo:v4];
  }
  else
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
    if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_INFO)) {
      v9 &= 2u;
    }
    if (v9)
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = *(void *)(a1 + 48);
      int v22 = 138412546;
      uint64_t v23 = v10;
      __int16 v24 = 2112;
      uint64_t v25 = v11;
      LODWORD(v21) = 22;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v22, v21);
        free(v13);
        SSFileLog(v7, @"%@", v15, v16, v17, v18, v19, v20, v14);
      }
    }
  }
}

- (BOOL)removeObjectWithItemIdentifier:(id)a3
{
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__SSCacheObjectStore_removeObjectWithItemIdentifier___block_invoke;
  v5[3] = &unk_1E5BA7448;
  v5[4] = a3;
  v5[5] = self;
  dispatch_sync(serialQueue, v5);
  return 0;
}

void __53__SSCacheObjectStore_removeObjectWithItemIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) length])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 8);
    [v3 clearCacheForLookupKey:v2];
  }
  else
  {
    id v4 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v4) {
      id v4 = +[SSLogConfig sharedConfig];
    }
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v6 &= 2u;
    }
    if (v6)
    {
      int v17 = 138412290;
      uint64_t v18 = objc_opt_class();
      LODWORD(v16) = 12;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        int v8 = (void *)v7;
        uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v17, v16);
        free(v8);
        SSFileLog(v4, @"%@", v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
}

- (id)cacheObjectWithItemIdentifier:(id)a3
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__75;
  uint64_t v11 = __Block_byref_object_dispose__75;
  uint64_t v12 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SSCacheObjectStore_cacheObjectWithItemIdentifier___block_invoke;
  block[3] = &unk_1E5BA77A0;
  block[4] = a3;
  void block[5] = self;
  block[6] = &v7;
  dispatch_sync(serialQueue, block);
  id v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __52__SSCacheObjectStore_cacheObjectWithItemIdentifier___block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) length])
  {
    uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 40) + 8) cacheEntryForLookupKey:*(void *)(a1 + 32)];
    uint64_t v3 = (void *)[v2 dataBlob:0];
    if ([v3 length])
    {
      v27[0] = 0;
      uint64_t v26 = SSDatabaseCacheEntryUserInfo;
      [v2 getValues:v27 forProperties:&v26 count:1];
      if (v27[0])
      {
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "_factoryForTypeIdentifier:", v27[0]), "cachedObjectWithDataRepresentation:typeIdentifier:", v3, v27[0]);
        return;
      }
      id v4 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v4) {
        id v4 = +[SSLogConfig sharedConfig];
      }
      int v11 = [v4 shouldLog];
      if ([v4 shouldLogToDisk]) {
        int v12 = v11 | 2;
      }
      else {
        int v12 = v11;
      }
      if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_INFO)) {
        v12 &= 2u;
      }
      if (v12)
      {
        uint64_t v13 = objc_opt_class();
        uint64_t v14 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t v25 = 138412546;
        *(void *)&v25[4] = v13;
        *(_WORD *)&v25[12] = 2112;
        *(void *)&v25[14] = v14;
        LODWORD(v24) = 22;
LABEL_32:
        uint64_t v15 = _os_log_send_and_compose_impl();
        if (v15)
        {
          uint64_t v16 = (void *)v15;
          uint64_t v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, v25, v24, *(_OWORD *)v25);
          free(v16);
          SSFileLog(v4, @"%@", v18, v19, v20, v21, v22, v23, v17);
        }
      }
    }
    else
    {
      id v4 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v4) {
        id v4 = +[SSLogConfig sharedConfig];
      }
      int v7 = [v4 shouldLog];
      if ([v4 shouldLogToDisk]) {
        int v8 = v7 | 2;
      }
      else {
        int v8 = v7;
      }
      if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_INFO)) {
        v8 &= 2u;
      }
      if (v8)
      {
        uint64_t v9 = objc_opt_class();
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t v25 = 138412546;
        *(void *)&v25[4] = v9;
        *(_WORD *)&v25[12] = 2112;
        *(void *)&v25[14] = v10;
        LODWORD(v24) = 22;
        goto LABEL_32;
      }
    }
  }
  else
  {
    id v4 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v4) {
      id v4 = +[SSLogConfig sharedConfig];
    }
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v6 &= 2u;
    }
    if (v6)
    {
      *(_DWORD *)uint64_t v25 = 138412290;
      *(void *)&v25[4] = objc_opt_class();
      LODWORD(v24) = 12;
      goto LABEL_32;
    }
  }
}

- (void)addCacheObjectFactory:(id)a3
{
  if (a3)
  {
    serialQueue = self->_serialQueue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __44__SSCacheObjectStore_addCacheObjectFactory___block_invoke;
    v4[3] = &unk_1E5BA7448;
    v4[4] = self;
    v4[5] = a3;
    dispatch_sync(serialQueue, v4);
  }
}

uint64_t __44__SSCacheObjectStore_addCacheObjectFactory___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (void)removeCacheObjectFactory:(id)a3
{
  if (a3)
  {
    serialQueue = self->_serialQueue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __47__SSCacheObjectStore_removeCacheObjectFactory___block_invoke;
    v4[3] = &unk_1E5BA7448;
    v4[4] = self;
    v4[5] = a3;
    dispatch_sync(serialQueue, v4);
  }
}

uint64_t __47__SSCacheObjectStore_removeCacheObjectFactory___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

@end