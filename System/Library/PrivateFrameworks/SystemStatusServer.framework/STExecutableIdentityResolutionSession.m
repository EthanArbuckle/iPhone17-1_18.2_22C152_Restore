@interface STExecutableIdentityResolutionSession
- (STExecutableIdentityResolutionSession)initWithResolver:(id)a3 cache:(id)a4;
- (id)resolvedIdentityForIdentity:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)resolveIdentities:(id)a3;
@end

@implementation STExecutableIdentityResolutionSession

- (id)resolvedIdentityForIdentity:(id)a3
{
  id v4 = a3;
  if (self) {
    cache = self->_cache;
  }
  else {
    cache = 0;
  }
  v6 = cache;
  v7 = [(STReferenceCountedCache *)v6 cachedObjectForKey:v4];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    if (self) {
      resolver = self->_resolver;
    }
    else {
      resolver = 0;
    }
    id v9 = [(STExecutableIdentityResolving *)resolver resolvedIdentityForIdentity:v4];
  }
  v11 = v9;

  return v11;
}

- (void)resolveIdentities:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self)
  {
    v5 = self->_cache;
    resolver = self->_resolver;
  }
  else
  {
    v5 = 0;
    resolver = 0;
  }
  v7 = resolver;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v8 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v13 = [(STReferenceCountedCache *)v5 cachedObjectForKey:v12];
        if (!v13)
        {
          v13 = [(STExecutableIdentityResolving *)v7 resolvedIdentityForIdentity:v12];
          if (v13)
          {
            [(STReferenceCountedCache *)v5 cacheObject:v13 forKey:v12];
            [(STReferenceCountedCache *)v5 incrementReferenceCountForKey:v12];
          }
        }
        [(STReferenceCountedCache *)v5 incrementReferenceCountForKey:v12];
      }
      uint64_t v9 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  if (self) {
    cachedIdentities = self->_cachedIdentities;
  }
  else {
    cachedIdentities = 0;
  }
  v15 = cachedIdentities;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        -[STReferenceCountedCache decrementReferenceCountForKey:](v5, "decrementReferenceCountForKey:", *(void *)(*((void *)&v21 + 1) + 8 * j), (void)v21);
      }
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v17);
  }

  if (self) {
    objc_setProperty_nonatomic_copy(self, v20, v4, 32);
  }
}

- (STExecutableIdentityResolutionSession)initWithResolver:(id)a3 cache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STExecutableIdentityResolutionSession;
  uint64_t v9 = [(STExecutableIdentityResolutionSession *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resolver, a3);
    objc_storeStrong((id *)&v10->_cache, a4);
  }

  return v10;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)STExecutableIdentityResolutionSession;
  [(STExecutableIdentityResolutionSession *)&v2 dealloc];
}

- (void)invalidate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    self->_invalidated = 1;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    cachedIdentities = self->_cachedIdentities;
  }
  else
  {
    cachedIdentities = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
  }
  id v4 = cachedIdentities;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        if (self) {
          cache = self->_cache;
        }
        else {
          cache = 0;
        }
        -[STReferenceCountedCache decrementReferenceCountForKey:](cache, "decrementReferenceCountForKey:", *(void *)(*((void *)&v12 + 1) + 8 * v8++), (void)v12);
      }
      while (v6 != v8);
      uint64_t v10 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v6 = v10;
    }
    while (v10);
  }

  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v11, 0, 32);
    objc_storeStrong((id *)&self->_resolver, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedIdentities, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
}

@end