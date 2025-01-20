@interface SBDisplayTransformerRegistry
+ (SBDisplayTransformerRegistry)sharedInstance;
- (id)_initWithOverrideTransformUpdater:(id)a3;
- (id)_lock_description;
- (id)addTransformer:(id)a3 withIdentifier:(id)a4;
- (id)transformDisplayConfiguration:(id)a3;
- (id)transformUpdater;
- (void)dealloc;
@end

@implementation SBDisplayTransformerRegistry

- (id)_initWithOverrideTransformUpdater:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBDisplayTransformerRegistry;
  v6 = [(SBDisplayTransformerRegistry *)&v14 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    lock_transformers = v7->_lock_transformers;
    v7->_lock_transformers = (NSMutableSet *)v8;

    objc_storeStrong((id *)&v7->_overrideTransformUpdater, a3);
    v13 = v7;
    uint64_t v10 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureToken = v13->_stateCaptureToken;
    v13->_stateCaptureToken = (BSInvalidatable *)v10;
  }
  return v7;
}

id __66__SBDisplayTransformerRegistry__initWithOverrideTransformUpdater___block_invoke(uint64_t a1)
{
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(void *)(a1 + 32) + 8));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  v2 = objc_msgSend(*(id *)(a1 + 32), "_lock_description");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  return v2;
}

+ (SBDisplayTransformerRegistry)sharedInstance
{
  if (sharedInstance_onceToken_24 != -1) {
    dispatch_once(&sharedInstance_onceToken_24, &__block_literal_global_172);
  }
  v2 = (void *)sharedInstance___result_1;
  return (SBDisplayTransformerRegistry *)v2;
}

void __46__SBDisplayTransformerRegistry_sharedInstance__block_invoke()
{
  id v0 = [[SBDisplayTransformerRegistry alloc] _initWithOverrideTransformUpdater:0];
  v1 = (void *)sharedInstance___result_1;
  sharedInstance___result_1 = (uint64_t)v0;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureToken invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBDisplayTransformerRegistry;
  [(SBDisplayTransformerRegistry *)&v3 dealloc];
}

- (id)addTransformer:(id)a3 withIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  objc_initWeak(&location, self);
  id v9 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint64_t v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __62__SBDisplayTransformerRegistry_addTransformer_withIdentifier___block_invoke;
  v19 = &unk_1E6AFA6D0;
  objc_copyWeak(&v21, &location);
  id v12 = v7;
  id v20 = v12;
  v13 = (void *)[v9 initWithIdentifier:v8 forReason:v11 invalidationBlock:&v16];

  LODWORD(v11) = [(NSMutableSet *)self->_lock_transformers containsObject:v12];
  [(NSMutableSet *)self->_lock_transformers addObject:v12];
  os_unfair_lock_unlock(&self->_lock);
  if (v11)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBDisplayTransformerRegistry.m", 85, @"transformer already registered: %@", v12, v16, v17, v18, v19 object file lineNumber description];
  }
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v13;
}

void __62__SBDisplayTransformerRegistry_addTransformer_withIdentifier___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_super v3 = WeakRetained + 2;
    id v5 = (id *)WeakRetained;
    os_unfair_lock_assert_not_owner(WeakRetained + 2);
    os_unfair_lock_lock(v3);
    [v5[2] removeObject:*(void *)(a1 + 32)];
    os_unfair_lock_unlock(v3);
    v4 = [v5 transformUpdater];
    [v4 updateTransformsWithCompletion:0];

    WeakRetained = (os_unfair_lock *)v5;
  }
}

- (id)transformUpdater
{
  overrideTransformUpdater = self->_overrideTransformUpdater;
  if (overrideTransformUpdater)
  {
    objc_super v3 = overrideTransformUpdater;
  }
  else
  {
    objc_super v3 = [MEMORY[0x1E4F62420] sharedInstance];
  }
  return v3;
}

- (id)transformDisplayConfiguration:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v40 = [v4 identity];
  id v5 = [MEMORY[0x1E4F1CA80] set];
  id v39 = [MEMORY[0x1E4F1CA80] set];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v28 = self;
  obj = self->_lock_transformers;
  uint64_t v33 = [(NSMutableSet *)obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v33)
  {
    uint64_t v37 = 0;
    char v36 = 0;
    id v6 = 0;
    id v7 = 0;
    id v31 = v4;
    uint64_t v32 = *(void *)v46;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v46 != v32) {
        objc_enumerationMutation(obj);
      }
      if (v7) {
        break;
      }
      id v9 = *(void **)(*((void *)&v45 + 1) + 8 * v8);
      uint64_t v10 = [v9 transformDisplayConfiguration:v4];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v38 = v10;
      uint64_t v11 = [v38 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v34 = v8;
        v35 = v6;
        uint64_t v13 = *(void *)v42;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v42 != v13) {
              objc_enumerationMutation(v38);
            }
            v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            uint64_t v16 = [v15 identity];
            if (v15)
            {
              id v7 = 0;
            }
            else
            {
              id v7 = v9;
              char v36 = 1;
            }
            uint64_t v17 = [v16 rootIdentity];
            char v18 = [v17 isEqual:v40];

            if ((v18 & 1) == 0)
            {
              id v19 = v9;

              LOBYTE(v37) = 1;
              id v7 = v19;
            }
            if ([v5 containsObject:v16])
            {
              id v20 = v9;

              BYTE4(v37) = 1;
              id v7 = v20;
            }
            if (v7)
            {
              id v6 = v15;

              id v4 = v31;
              goto LABEL_24;
            }
            [v5 addObject:v16];
            [v39 addObject:v15];
          }
          uint64_t v12 = [v38 countByEnumeratingWithState:&v41 objects:v49 count:16];
          if (v12) {
            continue;
          }
          break;
        }
        id v7 = 0;
        id v4 = v31;
        id v6 = v35;
LABEL_24:
        uint64_t v8 = v34;
      }
      else
      {
        id v7 = 0;
      }

      if (++v8 == v33)
      {
        uint64_t v33 = [(NSMutableSet *)obj countByEnumeratingWithState:&v45 objects:v50 count:16];
        if (v33) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v37 = 0;
    char v36 = 0;
    id v6 = 0;
    id v7 = 0;
  }

  os_unfair_lock_unlock(lock);
  if (v7)
  {
    if (v36)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
    }
    if (v37)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      v24 = [v6 identity];
      v25 = [v4 identity];
      [v23 handleFailureInMethod:a2, v28, @"SBDisplayTransformerRegistry.m", 146, @"received configuration from %@ with identity %@ disjoint from source: %@", v7, v24, v25 object file lineNumber description];
    }
    if ((v37 & 0x100000000) != 0)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, v28, @"SBDisplayTransformerRegistry.m", 147, @"received non-unique configuration from %@ with identity %@", v7, v6 object file lineNumber description];
    }
  }
  if (([v39 containsObject:v4] & 1) == 0) {
    [v39 addObject:v4];
  }

  return v39;
}

- (id)_lock_description
{
  objc_super v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(NSMutableSet *)self->_lock_transformers allObjects];
  [v3 appendArraySection:v4 withName:@"transformers" skipIfEmpty:0];

  id v5 = [v3 build];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTransformUpdater, 0);
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
  objc_storeStrong((id *)&self->_lock_transformers, 0);
}

@end