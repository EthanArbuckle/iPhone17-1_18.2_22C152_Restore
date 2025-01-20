@interface NTKArgonEncryptedBundleEnumerator
- (NSArray)allObjects;
- (NTKArgonEncryptedBundleEnumerator)initWithSearchPathDomains:(unint64_t)a3;
- (NTKArgonEncryptedBundleEnumerator)initWithSourceDirectoryPaths:(id)a3;
- (NTKArgonEncryptedBundleEnumerator)initWithSourceDirectoryURLs:(id)a3;
- (id)nextObject;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation NTKArgonEncryptedBundleEnumerator

- (NTKArgonEncryptedBundleEnumerator)initWithSearchPathDomains:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NTKArgonEncryptedBundleEnumerator;
  v4 = [(NTKArgonEncryptedBundleEnumerator *)&v9 init];
  if (!v4) {
    return 0;
  }
  v5 = v4;
  v6 = NTKFaceSupportArchiveSearchPathsForDomains(a3);
  v7 = [(NTKArgonEncryptedBundleEnumerator *)v5 initWithSourceDirectoryPaths:v6];

  return v7;
}

- (NTKArgonEncryptedBundleEnumerator)initWithSourceDirectoryURLs:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NTKArgonEncryptedBundleEnumerator;
  v5 = [(NTKArgonEncryptedBundleEnumerator *)&v20 init];
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v4;
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
          v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "absoluteURL", (void)v16);
          v13 = [v12 path];
          [v6 addObject:v13];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v9);
    }

    v14 = (void *)[v6 copy];
    v5 = [(NTKArgonEncryptedBundleEnumerator *)v5 initWithSourceDirectoryPaths:v14];
  }
  return v5;
}

- (NTKArgonEncryptedBundleEnumerator)initWithSourceDirectoryPaths:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)NTKArgonEncryptedBundleEnumerator;
  v5 = [(NTKArgonEncryptedBundleEnumerator *)&v45 init];
  v6 = v5;
  if (v5)
  {
    v28 = v5;
    id v7 = [MEMORY[0x1E4F1CA48] array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v29 = v4;
    obuint64_t j = v4;
    uint64_t v32 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (v32)
    {
      uint64_t v31 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v42 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v40 = 0;
          uint64_t v11 = [v10 contentsOfDirectoryAtPath:v9 error:&v40];
          id v12 = v40;

          if (v11)
          {
            id v33 = v12;
            uint64_t v35 = i;
            v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            v34 = v11;
            v14 = [v11 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
            uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v46 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v37;
              do
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v37 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  long long v19 = *(void **)(*((void *)&v36 + 1) + 8 * j);
                  objc_super v20 = [v19 pathExtension];
                  int v21 = [v20 isEqualToString:@"aea"];

                  if (v21)
                  {
                    uint64_t v22 = [v13 URLByAppendingPathComponent:v19];
                    [v7 addObject:v22];
                  }
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v46 count:16];
              }
              while (v16);
            }

            uint64_t v11 = v34;
            uint64_t i = v35;
            id v12 = v33;
          }
          else
          {
            v13 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v48 = v9;
              __int16 v49 = 2114;
              id v50 = v12;
              _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_DEFAULT, "NTKArgonEncryptedBundleEnumerator: No directory found at %{public}@: %{public}@", buf, 0x16u);
            }
          }
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
      }
      while (v32);
    }

    uint64_t v23 = [v7 copy];
    v6 = v28;
    allObjects = v28->_allObjects;
    v28->_allObjects = (NSArray *)v23;

    uint64_t v25 = [(NSArray *)v28->_allObjects objectEnumerator];
    urlEnumerator = v28->_urlEnumerator;
    v28->_urlEnumerator = (NSEnumerator *)v25;

    id v4 = v29;
  }

  return v6;
}

- (id)nextObject
{
  v3 = [(NSEnumerator *)self->_urlEnumerator nextObject];
  lastURL = self->_lastURL;
  self->_lastURL = v3;

  v5 = self->_lastURL;
  return v5;
}

- (NSArray)allObjects
{
  return [(NSEnumerator *)self->_urlEnumerator allObjects];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSEnumerator *)self->_urlEnumerator countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastURL, 0);
  objc_storeStrong((id *)&self->_urlEnumerator, 0);
  objc_storeStrong((id *)&self->_allObjects, 0);
}

@end