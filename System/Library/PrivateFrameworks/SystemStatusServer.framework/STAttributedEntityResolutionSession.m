@interface STAttributedEntityResolutionSession
- (STAttributedEntityResolutionSession)initWithEntityResolver:(id)a3 identityResolver:(id)a4 cache:(id)a5;
- (id)_entityWithResolvedIdentityForEntity:(uint64_t)a1;
- (id)resolveEntity:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)resolveEntities:(id)a3;
@end

@implementation STAttributedEntityResolutionSession

uint64_t __55__STAttributedEntityResolutionSession_resolveEntities___block_invoke(uint64_t a1, void *a2)
{
  return [a2 executableIdentity];
}

- (id)resolveEntity:(id)a3
{
  v4 = -[STAttributedEntityResolutionSession _entityWithResolvedIdentityForEntity:]((uint64_t)self, a3);
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
      entityResolver = self->_entityResolver;
    }
    else {
      entityResolver = 0;
    }
    id v9 = [(STAttributedEntityResolving *)entityResolver resolveEntity:v4];
  }
  v11 = v9;

  return v11;
}

- (void)resolveEntities:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    cache = self->_cache;
  }
  else {
    cache = 0;
  }
  v6 = cache;
  uint64_t v7 = objc_msgSend(v4, "bs_map:", &__block_literal_global_5);
  v25 = (void *)v7;
  if (self)
  {
    [(STExecutableIdentityBatchResolving *)self->_identityResolver resolveIdentities:v7];
    entityResolver = self->_entityResolver;
  }
  else
  {
    [0 resolveIdentities:v7];
    entityResolver = 0;
  }
  id v9 = entityResolver;
  v10 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = -[STAttributedEntityResolutionSession _entityWithResolvedIdentityForEntity:]((uint64_t)self, *(void **)(*((void *)&v30 + 1) + 8 * v15));
        [v10 addObject:v16];
        v17 = [(STReferenceCountedCache *)v6 cachedObjectForKey:v16];
        if (!v17)
        {
          v17 = [(STAttributedEntityResolving *)v9 resolveEntity:v16];
          if (v17)
          {
            [(STReferenceCountedCache *)v6 cacheObject:v17 forKey:v16];
            [(STReferenceCountedCache *)v6 incrementReferenceCountForKey:v16];
          }
        }
        [(STReferenceCountedCache *)v6 incrementReferenceCountForKey:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v13);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  if (self) {
    cachedEntities = self->_cachedEntities;
  }
  else {
    cachedEntities = 0;
  }
  v19 = cachedEntities;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        [(STReferenceCountedCache *)v6 decrementReferenceCountForKey:*(void *)(*((void *)&v26 + 1) + 8 * v23++)];
      }
      while (v21 != v23);
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v21);
  }

  if (self) {
    objc_setProperty_nonatomic_copy(self, v24, v10, 40);
  }
}

- (id)_entityWithResolvedIdentityForEntity:(uint64_t)a1
{
  if (a1)
  {
    id v3 = *(id *)(a1 + 24);
    id v4 = a2;
    v5 = [v4 executableIdentity];
    v6 = [v3 resolvedIdentityForIdentity:v5];

    uint64_t v7 = [v4 website];
    uint64_t v8 = [v4 isSystemService];
    id v9 = [v4 localizedDisplayName];
    v10 = [v4 localizedExecutableDisplayName];

    id v11 = (void *)[objc_alloc(MEMORY[0x1E4FA9318]) initWithExecutableIdentity:v6 website:v7 systemService:v8 localizedDisplayName:v9 localizedExecutableDisplayName:v10];
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

- (STAttributedEntityResolutionSession)initWithEntityResolver:(id)a3 identityResolver:(id)a4 cache:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)STAttributedEntityResolutionSession;
  uint64_t v12 = [(STAttributedEntityResolutionSession *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entityResolver, a3);
    objc_storeStrong((id *)&v13->_identityResolver, a4);
    objc_storeStrong((id *)&v13->_cache, a5);
  }

  return v13;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)STAttributedEntityResolutionSession;
  [(STAttributedEntityResolutionSession *)&v2 dealloc];
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
    cachedEntities = self->_cachedEntities;
  }
  else
  {
    cachedEntities = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
  }
  id v4 = cachedEntities;
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
    objc_setProperty_nonatomic_copy(self, v11, 0, 40);
    objc_storeStrong((id *)&self->_entityResolver, 0);
    [(STExecutableIdentityBatchResolving *)self->_identityResolver invalidate];
    objc_storeStrong((id *)&self->_identityResolver, 0);
  }
  else
  {
    [0 invalidate];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedEntities, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_identityResolver, 0);
  objc_storeStrong((id *)&self->_entityResolver, 0);
}

@end