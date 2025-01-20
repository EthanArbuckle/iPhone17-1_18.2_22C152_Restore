@interface _PBFPosterExtensionDataStoreAssertionController
- (BOOL)_appendAssertion:(id)a3 forIdentity:(id)a4;
- (BOOL)_internalLock_appendAssertion:(id)a3 forIdentity:(id)a4;
- (BOOL)_internalLock_removeAssertion:(id)a3 forIdentity:(id)a4;
- (BOOL)_removeAssertion:(id)a3 forIdentity:(id)a4;
- (BOOL)acquireInUseAssertionForIdentity:(id)a3 reason:(id)a4;
- (BOOL)invalidateInUseAssertionForIdentity:(id)a3 reason:(id)a4;
- (NSMapTable)inUseAssertionsByIdentity;
- (NSString)description;
- (_PBFPosterExtensionDataStoreAssertionController)init;
- (_PBFPosterExtensionDataStoreAssertionController)initWithController:(id)a3;
- (id)inUsePosterPathIdentitiesForReason:(id)a3;
- (int64_t)_numberOfInUseAssertionsForIdentity:(id)a3;
- (int64_t)numberOfAssertionsForReason:(id)a3;
- (void)invalidate;
@end

@implementation _PBFPosterExtensionDataStoreAssertionController

- (_PBFPosterExtensionDataStoreAssertionController)initWithController:(id)a3
{
  id v4 = a3;
  v5 = [(_PBFPosterExtensionDataStoreAssertionController *)self init];
  if (v5)
  {
    v6 = [v4 inUseAssertionsByIdentity];
    v7 = (void *)[v6 mutableCopy];
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    }
    internalLock_inUseAssertionsByIdentity = v5->_internalLock_inUseAssertionsByIdentity;
    v5->_internalLock_inUseAssertionsByIdentity = v9;
  }
  return v5;
}

- (_PBFPosterExtensionDataStoreAssertionController)init
{
  v7.receiver = self;
  v7.super_class = (Class)_PBFPosterExtensionDataStoreAssertionController;
  v2 = [(_PBFPosterExtensionDataStoreAssertionController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_internalLock._os_unfair_lock_opaque = 0;
    if (!v2->_internalLock_inUseAssertionsByIdentity)
    {
      uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      internalLock_inUseAssertionsByIdentity = v3->_internalLock_inUseAssertionsByIdentity;
      v3->_internalLock_inUseAssertionsByIdentity = (NSMapTable *)v4;
    }
  }
  return v3;
}

- (NSString)description
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v18 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  os_unfair_lock_t lock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(NSMapTable *)self->_internalLock_inUseAssertionsByIdentity keyEnumerator];
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v9 = -[NSMapTable objectForKey:](self->_internalLock_inUseAssertionsByIdentity, "objectForKey:", v8, lock);
        v10 = [v3 objectForKey:v8];
        if (!v10)
        {
          v10 = objc_opt_new();
          [v3 setObject:v10 forKey:v8];
        }
        v11 = [v9 objectEnumerator];
        v12 = [v11 allObjects];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __62___PBFPosterExtensionDataStoreAssertionController_description__block_invoke;
        v20[3] = &unk_1E69838E0;
        id v21 = v10;
        id v13 = v10;
        [v12 enumerateObjectsUsingBlock:v20];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
  }

  os_unfair_lock_unlock(lock);
  v14 = [v3 dictionaryRepresentation];
  [v18 appendDictionarySection:v14 withName:@"assertion reasons for URL" skipIfEmpty:0];

  v15 = [v18 build];

  return (NSString *)v15;
}

- (NSMapTable)inUseAssertionsByIdentity
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  uint64_t v4 = (void *)[(NSMapTable *)self->_internalLock_inUseAssertionsByIdentity copy];
  os_unfair_lock_unlock(p_internalLock);
  return (NSMapTable *)v4;
}

- (void)invalidate
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  self->_internalLock_invalidated = 1;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = (void *)[(NSMapTable *)self->_internalLock_inUseAssertionsByIdentity copy];
  uint64_t v5 = [v4 keyEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [(NSMapTable *)self->_internalLock_inUseAssertionsByIdentity objectForKey:*(void *)(*((void *)&v19 + 1) + 8 * v9)];
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v16;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v10);
              }
              [*(id *)(*((void *)&v15 + 1) + 8 * v14++) invalidate];
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v12);
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  [(NSMapTable *)self->_internalLock_inUseAssertionsByIdentity removeAllObjects];
  os_unfair_lock_unlock(p_internalLock);
}

- (BOOL)acquireInUseAssertionForIdentity:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = v7;
    if (v6)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F4F838]);
      v10 = [v6 stablePersistenceIdentifier];
      uint64_t v11 = (void *)[v9 initWithIdentifier:v10 forReason:v8 invalidationBlock:&__block_literal_global_25];

      BOOL v12 = [(_PBFPosterExtensionDataStoreAssertionController *)self _appendAssertion:v11 forIdentity:v6];
    }
    else
    {
      BOOL v12 = 0;
    }

    return v12;
  }
  else
  {
    uint64_t v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"isActiveReason"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_PBFPosterExtensionDataStoreAssertionController acquireInUseAssertionForIdentity:reason:]();
    }
    [v14 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)invalidateInUseAssertionForIdentity:(id)a3 reason:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    long long v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"isActiveReason"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_PBFPosterExtensionDataStoreAssertionController invalidateInUseAssertionForIdentity:reason:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3271E64);
  }
  uint64_t v8 = v7;
  if (v6)
  {
    os_unfair_lock_t lock = &self->_internalLock;
    os_unfair_lock_lock(&self->_internalLock);
    [(NSMapTable *)self->_internalLock_inUseAssertionsByIdentity objectForKey:v6];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
LABEL_5:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
        long long v15 = [v14 reason];
        char v16 = [v15 isEqualToString:v8];

        if (v16) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v11) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
      id v17 = v14;

      if (!v17) {
        goto LABEL_14;
      }
      BOOL v18 = [(_PBFPosterExtensionDataStoreAssertionController *)self _internalLock_removeAssertion:v17 forIdentity:v6];
    }
    else
    {
LABEL_11:

      id v17 = 0;
LABEL_14:
      BOOL v18 = 0;
    }
    os_unfair_lock_unlock(lock);
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (int64_t)numberOfAssertionsForReason:(id)a3
{
  v3 = [(_PBFPosterExtensionDataStoreAssertionController *)self inUsePosterPathIdentitiesForReason:a3];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)inUsePosterPathIdentitiesForReason:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  os_unfair_lock_t lock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v20 = self;
  id obj = [(NSMapTable *)self->_internalLock_inUseAssertionsByIdentity keyEnumerator];
  uint64_t v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v19 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v8 = [(NSMapTable *)v20->_internalLock_inUseAssertionsByIdentity objectForKey:v7];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v23 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = [*(id *)(*((void *)&v22 + 1) + 8 * j) reason];
              int v14 = [v13 isEqual:v4];

              if (v14) {
                [v5 addObject:v7];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v10);
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v21);
  }

  os_unfair_lock_unlock(lock);
  long long v15 = (void *)[v5 copy];

  return v15;
}

- (int64_t)_numberOfInUseAssertionsForIdentity:(id)a3
{
  id v4 = a3;
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  if (self->_internalLock_invalidated)
  {
    int64_t v6 = 0;
  }
  else
  {
    uint64_t v7 = [(NSMapTable *)self->_internalLock_inUseAssertionsByIdentity objectForKey:v4];
    int64_t v6 = [v7 count];
  }
  os_unfair_lock_unlock(p_internalLock);

  return v6;
}

- (BOOL)_appendAssertion:(id)a3 forIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  BOOL v9 = !self->_internalLock_invalidated
    && [(_PBFPosterExtensionDataStoreAssertionController *)self _internalLock_appendAssertion:v6 forIdentity:v7];
  os_unfair_lock_unlock(p_internalLock);

  return v9;
}

- (BOOL)_internalLock_appendAssertion:(id)a3 forIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    long long v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identity"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_PBFPosterExtensionDataStoreAssertionController _internalLock_appendAssertion:forIdentity:]();
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_19;
  }
  if (!v6)
  {
    char v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"assertion"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_PBFPosterExtensionDataStoreAssertionController _internalLock_appendAssertion:forIdentity:]();
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32723E8);
  }
  uint64_t v8 = v7;
  if (!self->_internalLock_invalidated)
  {
    uint64_t v10 = [(NSMapTable *)self->_internalLock_inUseAssertionsByIdentity objectForKey:v7];
    BOOL v9 = v10 == 0;
    if (!v10)
    {
      uint64_t v10 = [MEMORY[0x1E4F28D30] hashTableWithOptions:0];
      [(NSMapTable *)self->_internalLock_inUseAssertionsByIdentity setObject:v10 forKey:v8];
    }
    uint64_t v11 = [v10 allObjects];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    long long v20 = __93___PBFPosterExtensionDataStoreAssertionController__internalLock_appendAssertion_forIdentity___block_invoke;
    uint64_t v21 = &unk_1E6983928;
    id v12 = v6;
    id v22 = v12;
    int v13 = objc_msgSend(v11, "bs_containsObjectPassingTest:", &v18);

    if (!v13)
    {

      [v10 addObject:v12];
      goto LABEL_9;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid condition not satisfying: %@", @"![[assertions allObjects] bs_containsObjectPassingTest:^BOOL(BSSimpleAssertion *otherAssertions) { return [[otherAssertions reason] isEqual:[assertion reason]]; }]",
      v18,
      v19,
      v20,
    id v17 = v21);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_PBFPosterExtensionDataStoreAssertionController _internalLock_appendAssertion:forIdentity:]();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
LABEL_19:
    JUMPOUT(0x1D3272384);
  }
  BOOL v9 = 0;
LABEL_9:

  return v9;
}

- (BOOL)_removeAssertion:(id)a3 forIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identity"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_PBFPosterExtensionDataStoreAssertionController _removeAssertion:forIdentity:]();
    }
LABEL_12:
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32725A8);
  }
  if (!v6)
  {
    id v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"assertion"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_PBFPosterExtensionDataStoreAssertionController _removeAssertion:forIdentity:]();
    }
    goto LABEL_12;
  }
  uint64_t v8 = v7;
  if (self->_internalLock_invalidated)
  {
    BOOL v9 = 0;
  }
  else
  {
    p_internalLock = &self->_internalLock;
    os_unfair_lock_lock(&self->_internalLock);
    BOOL v9 = [(_PBFPosterExtensionDataStoreAssertionController *)self _internalLock_removeAssertion:v6 forIdentity:v8];
    os_unfair_lock_unlock(p_internalLock);
  }

  return v9;
}

- (BOOL)_internalLock_removeAssertion:(id)a3 forIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    int v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identity"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_PBFPosterExtensionDataStoreAssertionController _internalLock_removeAssertion:forIdentity:]();
    }
LABEL_18:
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D327273CLL);
  }
  if (!v6)
  {
    int v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"assertion"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_PBFPosterExtensionDataStoreAssertionController _internalLock_removeAssertion:forIdentity:]();
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32727A0);
  }
  uint64_t v8 = v7;
  if (self->_internalLock_invalidated)
  {
    BOOL v9 = 0;
    goto LABEL_9;
  }
  uint64_t v10 = [(NSMapTable *)self->_internalLock_inUseAssertionsByIdentity objectForKey:v7];
  if (([v10 containsObject:v6] & 1) == 0)
  {
    int v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[assertions containsObject:assertion]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_PBFPosterExtensionDataStoreAssertionController _internalLock_removeAssertion:forIdentity:]();
    }
    goto LABEL_18;
  }
  [v10 removeObject:v6];
  [v6 invalidate];
  uint64_t v11 = [v10 count];
  BOOL v9 = v11 == 0;
  if (!v11) {
    [(NSMapTable *)self->_internalLock_inUseAssertionsByIdentity removeObjectForKey:v8];
  }

LABEL_9:
  return v9;
}

- (void).cxx_destruct
{
}

- (void)acquireInUseAssertionForIdentity:reason:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)invalidateInUseAssertionForIdentity:reason:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_internalLock_appendAssertion:forIdentity:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_internalLock_appendAssertion:forIdentity:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_internalLock_appendAssertion:forIdentity:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_removeAssertion:forIdentity:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_removeAssertion:forIdentity:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_internalLock_removeAssertion:forIdentity:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_internalLock_removeAssertion:forIdentity:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_internalLock_removeAssertion:forIdentity:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end