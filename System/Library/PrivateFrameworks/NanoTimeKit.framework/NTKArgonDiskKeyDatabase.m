@interface NTKArgonDiskKeyDatabase
- (NTKArgonDiskKeyDatabase)initWithSearchPathDomains:(unint64_t)a3;
- (id)keyDescriptorEnumerator;
- (id)keyDescriptorForFileName:(id)a3;
- (void)_locked_rebuildCache;
- (void)clearCaches;
@end

@implementation NTKArgonDiskKeyDatabase

- (NTKArgonDiskKeyDatabase)initWithSearchPathDomains:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)NTKArgonDiskKeyDatabase;
  v4 = [(NTKArgonDiskKeyDatabase *)&v20 init];
  if (v4)
  {
    v5 = NTKFaceSupportUnencryptedBundleSearchPathsForDomains(a3);
    v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", *(void *)(*((void *)&v16 + 1) + 8 * v11), (void)v16);
          [v6 addObject:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v9);
    }

    uint64_t v13 = [v7 copy];
    searchPaths = v4->_searchPaths;
    v4->_searchPaths = (NSArray *)v13;

    v4->_lock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (id)keyDescriptorEnumerator
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  knownKeyDescriptors = self->_knownKeyDescriptors;
  if (!knownKeyDescriptors)
  {
    [(NTKArgonDiskKeyDatabase *)self _locked_rebuildCache];
    knownKeyDescriptors = self->_knownKeyDescriptors;
  }
  v5 = [(NSSet *)knownKeyDescriptors objectEnumerator];
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (id)keyDescriptorForFileName:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  knownKeyDescriptors = self->_knownKeyDescriptors;
  if (!knownKeyDescriptors)
  {
    [(NTKArgonDiskKeyDatabase *)self _locked_rebuildCache];
    knownKeyDescriptors = self->_knownKeyDescriptors;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = knownKeyDescriptors;
  id v8 = (id)[(NSSet *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "fileName", (void)v15);
        int v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_13;
        }
      }
      id v8 = (id)[(NSSet *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (void)clearCaches
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  knownKeyDescriptors = self->_knownKeyDescriptors;
  self->_knownKeyDescriptors = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)_locked_rebuildCache
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  v33 = [MEMORY[0x1E4F1CA80] set];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v27 = self;
  obj = self->_searchPaths;
  uint64_t v30 = [(NSArray *)obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v40;
    unint64_t v3 = 0x1E4F1C000uLL;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v40 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v4;
        uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", *(void *)(*((void *)&v39 + 1) + 8 * v4), v27);
        v6 = [MEMORY[0x1E4F28CB8] defaultManager];
        v31 = (void *)v5;
        id v7 = [v6 enumeratorAtURL:v5 includingPropertiesForKeys:0 options:2 errorHandler:0];

        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v36 != v11) {
                objc_enumerationMutation(v8);
              }
              int v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              v14 = [v13 lastPathComponent];
              long long v15 = [v14 pathExtension];
              int v16 = [v15 isEqualToString:@"bundle"];

              if (v16)
              {
                long long v17 = *(void **)(v3 + 2536);
                long long v18 = [v13 URLByAppendingPathComponent:@"Info.plist"];
                long long v19 = [v17 dictionaryWithContentsOfURL:v18];

                if (v19)
                {
                  uint64_t v20 = [v19 objectForKeyedSubscript:@"Argon"];
                  if (v20)
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      unint64_t v21 = v3;
                      uint64_t v22 = [v20 objectForKeyedSubscript:@"FileName"];
                      if (v22)
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          v23 = [v20 objectForKeyedSubscript:@"Key"];
                          if (v23)
                          {
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v24 = [[NTKArgonKeyDescriptor alloc] initWithKey:v23 fileName:v22];
                              if (v24)
                              {
                                v34 = v24;
                                [v33 addObject:v24];
                                v24 = v34;
                              }
                            }
                          }
                        }
                      }

                      unint64_t v3 = v21;
                    }
                  }
                }
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v43 count:16];
          }
          while (v10);
        }

        uint64_t v4 = v32 + 1;
      }
      while (v32 + 1 != v30);
      uint64_t v30 = [(NSArray *)obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v30);
  }

  uint64_t v25 = [v33 copy];
  knownKeyDescriptors = v27->_knownKeyDescriptors;
  v27->_knownKeyDescriptors = (NSSet *)v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownKeyDescriptors, 0);

  objc_storeStrong((id *)&self->_searchPaths, 0);
}

@end