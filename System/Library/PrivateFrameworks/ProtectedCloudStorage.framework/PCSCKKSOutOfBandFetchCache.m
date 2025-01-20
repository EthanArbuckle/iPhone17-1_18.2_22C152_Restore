@interface PCSCKKSOutOfBandFetchCache
+ (id)cache;
- (NSMutableDictionary)identityNegativeCache;
- (NSMutableSet)currentItemNegativeCache;
- (OS_dispatch_queue)queue;
- (PCSCKKSOutOfBandFetchCache)init;
- (_PCSIdentitySetData)identities;
- (void)cacheCurrentIdentityFetchResult:(_PCSIdentitySetData *)a3 notFound:(id)a4;
- (void)cachePCSIdentityFetchResult:(_PCSIdentitySetData *)a3 notFound:(id)a4 serviceID:(unsigned int)a5;
- (void)dealloc;
- (void)getCurrentIdentities:(id)a3 result:(id)a4;
- (void)getPCSIdentities:(id)a3 forServiceID:(unsigned int)a4 result:(id)a5;
- (void)setCurrentItemNegativeCache:(id)a3;
- (void)setIdentityNegativeCache:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation PCSCKKSOutOfBandFetchCache

+ (id)cache
{
  if (cache_once != -1) {
    dispatch_once(&cache_once, &__block_literal_global_11);
  }
  v2 = (void *)cache_cache;
  return v2;
}

uint64_t __35__PCSCKKSOutOfBandFetchCache_cache__block_invoke()
{
  cache_cache = objc_alloc_init(PCSCKKSOutOfBandFetchCache);
  return MEMORY[0x1F41817F8]();
}

- (PCSCKKSOutOfBandFetchCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)PCSCKKSOutOfBandFetchCache;
  v2 = [(PCSCKKSOutOfBandFetchCache *)&v6 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ProtectedCloudStorage.CKKSOutOfBandFetchCache", v3);
    [(PCSCKKSOutOfBandFetchCache *)v2 setQueue:v4];
  }
  return v2;
}

- (void)dealloc
{
  identities = self->_identities;
  if (identities)
  {
    self->_identities = 0;
    CFRelease(identities);
  }
  v4.receiver = self;
  v4.super_class = (Class)PCSCKKSOutOfBandFetchCache;
  [(PCSCKKSOutOfBandFetchCache *)&v4 dealloc];
}

- (void)getCurrentIdentities:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PCSCKKSOutOfBandFetchCache *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PCSCKKSOutOfBandFetchCache_getCurrentIdentities_result___block_invoke;
  block[3] = &unk_1E5E6EB00;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __58__PCSCKKSOutOfBandFetchCache_getCurrentIdentities_result___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 40) identities])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      CFTypeRef Mutable = 0;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v3);
          }
          id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v10 = PCSIdentitySetCopyCurrentIdentityWithError(objc_msgSend(*(id *)(a1 + 40), "identities", (void)v14), v9, 0);
          if (v10)
          {
            v11 = v10;
            [v2 removeObject:v9];
            if (!Mutable) {
              CFTypeRef Mutable = PCSIdentitySetCreateMutable(0);
            }
            PCSIdentitySetAddIdentity((uint64_t)Mutable, (uint64_t)v11);
            PCSIdentitySetSetCurrentIdentity((uint64_t)Mutable, (uint64_t)v11);
            CFRelease(v11);
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v5);
    }
    else
    {
      CFTypeRef Mutable = 0;
    }
  }
  else
  {
    CFTypeRef Mutable = 0;
  }
  id v12 = objc_msgSend(*(id *)(a1 + 40), "currentItemNegativeCache", (void)v14);

  if (v12)
  {
    v13 = [*(id *)(a1 + 40) currentItemNegativeCache];
    [v2 minusSet:v13];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (Mutable) {
    CFRelease(Mutable);
  }
}

- (void)cacheCurrentIdentityFetchResult:(_PCSIdentitySetData *)a3 notFound:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(PCSCKKSOutOfBandFetchCache *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PCSCKKSOutOfBandFetchCache_cacheCurrentIdentityFetchResult_notFound___block_invoke;
  block[3] = &unk_1E5E6EB50;
  id v10 = v6;
  v11 = self;
  id v12 = a3;
  id v8 = v6;
  dispatch_barrier_async(v7, block);
}

uint64_t __71__PCSCKKSOutOfBandFetchCache_cacheCurrentIdentityFetchResult_notFound___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    v2 = [*(id *)(a1 + 40) currentItemNegativeCache];

    if (!v2)
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      [*(id *)(a1 + 40) setCurrentItemNegativeCache:v3];
    }
    uint64_t v4 = [*(id *)(a1 + 40) currentItemNegativeCache];
    [v4 unionSet:*(void *)(a1 + 32)];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__PCSCKKSOutOfBandFetchCache_cacheCurrentIdentityFetchResult_notFound___block_invoke_2;
    v6[3] = &unk_1E5E6EB28;
    v6[4] = *(void *)(a1 + 40);
    return PCSIdentitySetEnumerateIdentities(result, 0, v6);
  }
  return result;
}

uint64_t __71__PCSCKKSOutOfBandFetchCache_cacheCurrentIdentityFetchResult_notFound___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) currentItemNegativeCache];

  if (v4)
  {
    uint64_t v5 = PCSIdentityGetServiceName(a2);
    id v6 = [*(id *)(a1 + 32) currentItemNegativeCache];
    [v6 removeObject:v5];
  }
  if (![*(id *)(a1 + 32) identities]) {
    *(void *)(*(void *)(a1 + 32) + 16) = PCSIdentitySetCreateMutable(0);
  }
  PCSIdentitySetAddIdentity([*(id *)(a1 + 32) identities], a2);
  uint64_t v7 = [*(id *)(a1 + 32) identities];
  return PCSIdentitySetSetCurrentIdentity(v7, a2);
}

- (void)getPCSIdentities:(id)a3 forServiceID:(unsigned int)a4 result:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(PCSCKKSOutOfBandFetchCache *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__PCSCKKSOutOfBandFetchCache_getPCSIdentities_forServiceID_result___block_invoke;
  v13[3] = &unk_1E5E6EB78;
  id v14 = v8;
  long long v15 = self;
  unsigned int v17 = a4;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, v13);
}

void __67__PCSCKKSOutOfBandFetchCache_getPCSIdentities_forServiceID_result___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 40) identities])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      CFTypeRef Mutable = 0;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v10 = PCSIdentitySetCopyIdentity(objc_msgSend(*(id *)(a1 + 40), "identities", (void)v16), v9);
          if (v10)
          {
            id v11 = (const void *)v10;
            if (PCSIdentityGetServiceID(v10) == *(_DWORD *)(a1 + 56))
            {
              [v2 removeObject:v9];
              if (!Mutable) {
                CFTypeRef Mutable = PCSIdentitySetCreateMutable(0);
              }
              PCSIdentitySetAddIdentity((uint64_t)Mutable, (uint64_t)v11);
            }
            CFRelease(v11);
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v5);
    }
    else
    {
      CFTypeRef Mutable = 0;
    }
  }
  else
  {
    CFTypeRef Mutable = 0;
  }
  id v12 = objc_msgSend(*(id *)(a1 + 40), "identityNegativeCache", (void)v16);

  if (v12)
  {
    v13 = [*(id *)(a1 + 40) identityNegativeCache];
    id v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
    long long v15 = [v13 objectForKeyedSubscript:v14];

    if (v15) {
      [v2 minusSet:v15];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (Mutable) {
    CFRelease(Mutable);
  }
}

- (void)cachePCSIdentityFetchResult:(_PCSIdentitySetData *)a3 notFound:(id)a4 serviceID:(unsigned int)a5
{
  id v8 = a4;
  uint64_t v9 = [(PCSCKKSOutOfBandFetchCache *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__PCSCKKSOutOfBandFetchCache_cachePCSIdentityFetchResult_notFound_serviceID___block_invoke;
  v11[3] = &unk_1E5E6EBC8;
  id v12 = v8;
  v13 = self;
  unsigned int v15 = a5;
  id v14 = a3;
  id v10 = v8;
  dispatch_barrier_async(v9, v11);
}

uint64_t __77__PCSCKKSOutOfBandFetchCache_cachePCSIdentityFetchResult_notFound_serviceID___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    v2 = [*(id *)(a1 + 40) identityNegativeCache];

    if (!v2)
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [*(id *)(a1 + 40) setIdentityNegativeCache:v3];
    }
    uint64_t v4 = [*(id *)(a1 + 40) identityNegativeCache];
    uint64_t v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
    id v6 = [v4 objectForKeyedSubscript:v5];

    if (!v6)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v7 = [*(id *)(a1 + 40) identityNegativeCache];
      id v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
      [v7 setObject:v6 forKeyedSubscript:v8];
    }
    [v6 unionSet:*(void *)(a1 + 32)];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__PCSCKKSOutOfBandFetchCache_cachePCSIdentityFetchResult_notFound_serviceID___block_invoke_2;
    v10[3] = &unk_1E5E6EBA0;
    v10[4] = *(void *)(a1 + 40);
    int v11 = *(_DWORD *)(a1 + 56);
    return PCSIdentitySetEnumerateIdentities(result, 0, v10);
  }
  return result;
}

uint64_t __77__PCSCKKSOutOfBandFetchCache_cachePCSIdentityFetchResult_notFound_serviceID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) identityNegativeCache];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) identityNegativeCache];
    id v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];

    if (v7)
    {
      id v8 = PCSIdentityGetPublicKey(a2);
      [v7 removeObject:v8];
    }
  }
  if (![*(id *)(a1 + 32) identities]) {
    *(void *)(*(void *)(a1 + 32) + 16) = PCSIdentitySetCreateMutable(0);
  }
  uint64_t v9 = [*(id *)(a1 + 32) identities];
  return PCSIdentitySetAddIdentity(v9, a2);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
}

- (_PCSIdentitySetData)identities
{
  return self->_identities;
}

- (NSMutableSet)currentItemNegativeCache
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentItemNegativeCache:(id)a3
{
}

- (NSMutableDictionary)identityNegativeCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdentityNegativeCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityNegativeCache, 0);
  objc_storeStrong((id *)&self->_currentItemNegativeCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end