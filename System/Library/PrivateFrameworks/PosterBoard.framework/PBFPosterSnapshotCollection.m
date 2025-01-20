@interface PBFPosterSnapshotCollection
- (BOOL)beginRequestForDefinition:(id)a3 displayContext:(id)a4 invalidationContext:(id)a5;
- (BOOL)completeRequestForDefinition:(id)a3 displayContext:(id)a4 receivedSnapshot:(id)a5 receivedError:(id)a6;
- (BOOL)shouldProceedFetchingSnapshotForDefinition:(id)a3 displayContext:(id)a4 maxNumberOfRetryAfterErrors:(unint64_t)a5;
- (NSString)uniqueIdentifier;
- (PBFPosterSnapshotCollection)initWithUniqueIdentifier:(id)a3;
- (id)invalidateAndRemoveInProgressRequestsNotMatchingContext:(id)a3;
- (id)receivedImageForDefinition:(id)a3 displayContext:(id)a4;
- (int64_t)snapshotRequestStatusForDefinition:(id)a3 displayContext:(id)a4 outInvalidationContext:(id *)a5;
- (unint64_t)hash;
- (unint64_t)numberOfTimesSnapshotHasFailedToHydrateForDefinition:(id)a3 displayContext:(id)a4;
- (void)cancel;
- (void)enumerateInProgressRequests:(id)a3;
- (void)failPreviewImageForDefinition:(id)a3 displayContext:(id)a4 error:(id)a5;
@end

@implementation PBFPosterSnapshotCollection

- (PBFPosterSnapshotCollection)initWithUniqueIdentifier:(id)a3
{
  id v6 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v6)
  {
    v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotCollection initWithUniqueIdentifier:](a2);
    }
LABEL_11:
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D322BF1CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotCollection initWithUniqueIdentifier:](a2);
    }
    goto LABEL_11;
  }

  v13.receiver = self;
  v13.super_class = (Class)PBFPosterSnapshotCollection;
  v7 = [(PBFPosterSnapshotCollection *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_uniqueIdentifier, a3);
    uint64_t v9 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    lock_definitionToCollection = v8->_lock_definitionToCollection;
    v8->_lock_definitionToCollection = (NSMapTable *)v9;
  }
  return v8;
}

- (unint64_t)hash
{
  return [(NSString *)self->_uniqueIdentifier hash];
}

- (int64_t)snapshotRequestStatusForDefinition:(id)a3 displayContext:(id)a4 outInvalidationContext:(id *)a5
{
  id v8 = a4;
  p_lock = &self->_lock;
  id v10 = a3;
  os_unfair_lock_lock(&self->_lock);
  v11 = [(NSMapTable *)self->_lock_definitionToCollection objectForKey:v10];

  if (v11)
  {
    v12 = [v11 previewImageRequestForDisplayContext];
    objc_super v13 = [v12 objectForKey:v8];

    if (a5 && v13) {
      *a5 = v13;
    }
    int64_t v14 = [v11 requestStatusForDisplayContext:v8];
  }
  else
  {
    int64_t v14 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (unint64_t)numberOfTimesSnapshotHasFailedToHydrateForDefinition:(id)a3 displayContext:(id)a4
{
  id v6 = a4;
  p_lock = &self->_lock;
  id v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = [(NSMapTable *)self->_lock_definitionToCollection objectForKey:v8];

  if (v9)
  {
    id v10 = [v9 displayContextRequestFailures];
    unint64_t v11 = [v10 countForObject:v6];
  }
  else
  {
    unint64_t v11 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (id)receivedImageForDefinition:(id)a3 displayContext:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v9 = [(NSMapTable *)self->_lock_definitionToCollection objectForKey:v8];

  id v10 = [v9 receivedPreviewImageForDisplayContext];
  unint64_t v11 = [v10 objectForKey:v7];

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (BOOL)shouldProceedFetchingSnapshotForDefinition:(id)a3 displayContext:(id)a4 maxNumberOfRetryAfterErrors:(unint64_t)a5
{
  id v8 = a4;
  p_lock = &self->_lock;
  id v10 = a3;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v11 = [(NSMapTable *)self->_lock_definitionToCollection objectForKey:v10];

  v12 = [v11 failedPreviewImageForDisplayContext];
  objc_super v13 = [v12 objectForKey:v8];
  if (v13)
  {
    BOOL v14 = 0;
  }
  else
  {
    v15 = [v11 displayContextRequestFailures];
    BOOL v14 = [v15 countForObject:v8] < a5;
  }
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (void)enumerateInProgressRequests:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  if (v27)
  {
    v26 = objc_opt_new();
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = [(NSMapTable *)self->_lock_definitionToCollection keyEnumerator];
    uint64_t v24 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v24)
    {
      uint64_t v22 = *(void *)v36;
      v23 = self;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = v4;
          uint64_t v5 = *(void *)(*((void *)&v35 + 1) + 8 * v4);
          id v6 = -[NSMapTable objectForKey:](self->_lock_definitionToCollection, "objectForKey:", v5, lock);
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v7 = [v6 previewImageRequestForDisplayContext];
          id v8 = [v7 keyEnumerator];

          uint64_t v9 = v8;
          uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v32;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v32 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * i);
                v15 = [v6 previewImageRequestForDisplayContext];
                v16 = [v15 objectForKey:v14];

                aBlock[0] = MEMORY[0x1E4F143A8];
                aBlock[1] = 3221225472;
                aBlock[2] = __59__PBFPosterSnapshotCollection_enumerateInProgressRequests___block_invoke;
                aBlock[3] = &unk_1E6982840;
                id v17 = v27;
                aBlock[4] = v5;
                aBlock[5] = v14;
                id v29 = v16;
                id v30 = v17;
                id v18 = v16;
                v19 = _Block_copy(aBlock);
                [v26 addObject:v19];
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }
            while (v11);
          }

          uint64_t v4 = v25 + 1;
          self = v23;
        }
        while (v25 + 1 != v24);
        uint64_t v24 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v24);
    }

    os_unfair_lock_unlock(lock);
    [v26 enumerateObjectsUsingBlock:&__block_literal_global_7];
  }
}

uint64_t __59__PBFPosterSnapshotCollection_enumerateInProgressRequests___block_invoke(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, void, uint64_t))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], a2);
}

uint64_t __59__PBFPosterSnapshotCollection_enumerateInProgressRequests___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a4);
}

- (id)invalidateAndRemoveInProgressRequestsNotMatchingContext:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v30 = objc_opt_new();
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v29 = self;
  id obj = [(NSMapTable *)self->_lock_definitionToCollection keyEnumerator];
  uint64_t v31 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v31)
  {
    uint64_t v28 = *(void *)v42;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v42 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v6;
        id v7 = [(NSMapTable *)v29->_lock_definitionToCollection objectForKey:*(void *)(*((void *)&v41 + 1) + 8 * v6)];
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v8 = [v7 previewImageRequestForDisplayContext];
        uint64_t v9 = [v8 keyEnumerator];

        uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v38 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v37 + 1) + 8 * i);
              v15 = [v7 previewImageRequestForDisplayContext];
              v16 = [v15 objectForKey:v4];

              if ((BSEqualObjects() & 1) == 0)
              {
                [v5 addObject:v14];
                [v16 invalidate];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
          }
          while (v11);
        }

        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v17 = v5;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v45 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v34;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v34 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v33 + 1) + 8 * j);
              v23 = [v7 previewImageRequestForDisplayContext];
              [v23 removeObjectForKey:v22];
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v45 count:16];
          }
          while (v19);
        }

        [v30 addObjectsFromArray:v17];
        [v17 removeAllObjects];

        uint64_t v6 = v32 + 1;
      }
      while (v32 + 1 != v31);
      uint64_t v31 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v31);
  }

  os_unfair_lock_unlock(lock);
  uint64_t v24 = [v30 allObjects];

  return v24;
}

- (BOOL)beginRequestForDefinition:(id)a3 displayContext:(id)a4 invalidationContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v12 = [(NSMapTable *)self->_lock_definitionToCollection objectForKey:v8];
  if (!v12)
  {
    uint64_t v12 = objc_opt_new();
    [(NSMapTable *)self->_lock_definitionToCollection setObject:v12 forKey:v8];
  }
  objc_super v13 = [v12 previewImageRequestForDisplayContext];
  uint64_t v14 = [v13 objectForKey:v9];

  if (!v14)
  {
    v15 = [v12 previewImageRequestForDisplayContext];
    [v15 setObject:v10 forKey:v9];
  }
  os_unfair_lock_unlock(p_lock);

  return 0;
}

- (BOOL)completeRequestForDefinition:(id)a3 displayContext:(id)a4 receivedSnapshot:(id)a5 receivedError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = (unint64_t)a5;
  unint64_t v13 = (unint64_t)a6;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v15 = [(NSMapTable *)self->_lock_definitionToCollection objectForKey:v10];
  if (!v15)
  {
    if (v12 | v13)
    {
      v15 = objc_opt_new();
      [(NSMapTable *)self->_lock_definitionToCollection setObject:v15 forKey:v10];
    }
    else
    {
      v15 = 0;
    }
  }
  v16 = [v15 previewImageRequestForDisplayContext];
  id v17 = [v16 objectForKey:v11];

  if (v17)
  {
    uint64_t v18 = [v15 previewImageRequestForDisplayContext];
    [v18 removeObjectForKey:v11];
  }
  if (v13)
  {
    uint64_t v19 = [v15 failedPreviewImageForDisplayContext];
    [v19 setObject:v13 forKey:v11];

    uint64_t v20 = [v15 displayContextRequestFailures];
    [v20 addObject:v11];
  }
  else
  {
    if (!v12)
    {
      BOOL v23 = 0;
      goto LABEL_12;
    }
    v21 = [v15 receivedPreviewImageForDisplayContext];
    [v21 setObject:v12 forKey:v11];

    uint64_t v22 = [v15 failedPreviewImageForDisplayContext];
    [v22 removeObjectForKey:v11];

    uint64_t v20 = [v15 displayContextRequestFailures];
    [v20 removeObject:v11];
  }

  BOOL v23 = 1;
LABEL_12:
  os_unfair_lock_unlock(p_lock);

  return v23;
}

- (void)failPreviewImageForDefinition:(id)a3 displayContext:(id)a4 error:(id)a5
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  os_unfair_lock_lock(p_lock);
  id v13 = [(NSMapTable *)self->_lock_definitionToCollection objectForKey:v11];

  unint64_t v12 = [v13 failedPreviewImageForDisplayContext];
  [v12 setObject:v9 forKey:v10];

  os_unfair_lock_unlock(p_lock);
}

- (void)cancel
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(NSMapTable *)self->_lock_definitionToCollection objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) cancel];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSMapTable *)self->_lock_definitionToCollection removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_definitionToCollection, 0);
}

- (void)initWithUniqueIdentifier:(const char *)a1 .cold.1(const char *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_5();
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, 0x3Au);
}

@end