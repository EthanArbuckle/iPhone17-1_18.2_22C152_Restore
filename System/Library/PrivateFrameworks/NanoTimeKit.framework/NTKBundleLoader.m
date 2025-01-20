@interface NTKBundleLoader
+ (id)rootDirectory;
- (NSMutableDictionary)bundlesByPath;
- (NTKBundleLoader)init;
- (id)bundlesFromDirectoryURL:(id)a3;
- (id)loadBundlesFromDirectoryURL:(id)a3 enumerator:(id)a4;
- (void)enumerateBundlesFromDirectoryURL:(id)a3 enumerator:(id)a4;
- (void)resetCacheForDirectoryURL:(id)a3;
- (void)setBundlesByPath:(id)a3;
@end

@implementation NTKBundleLoader

void __58__NTKBundleLoader_loadBundlesFromDirectoryURL_enumerator___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = (void *)MEMORY[0x1C1875BE0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)loadBundlesFromDirectoryURL:(id)a3 enumerator:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = [(NSMutableDictionary *)self->_bundlesByPath objectForKeyedSubscript:v6];
  if (v9)
  {
    v10 = (void *)v9;
    if (!v7) {
      goto LABEL_24;
    }
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __58__NTKBundleLoader_loadBundlesFromDirectoryURL_enumerator___block_invoke_5;
    v40[3] = &unk_1E62C9460;
    v11 = &v41;
    id v41 = v7;
    [v10 enumerateObjectsUsingBlock:v40];
  }
  else
  {
    v33 = self;
    v34 = &self->_lock;
    v36 = [MEMORY[0x1E4F1CA48] array];
    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v48 = MEMORY[0x1E4F143A8];
    uint64_t v49 = 3221225472;
    v50 = __58__NTKBundleLoader_loadBundlesFromDirectoryURL_enumerator___block_invoke;
    v51 = &unk_1E62C9438;
    id v35 = v6;
    id v52 = v6;
    id v32 = v52;
    v13 = objc_msgSend(v12, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v13;
    uint64_t v14 = [obj countByEnumeratingWithState:&v44 objects:v57 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v45;
      uint64_t v17 = *MEMORY[0x1E4F1C538];
      uint64_t v18 = *MEMORY[0x1E4F44350];
      uint64_t v37 = *MEMORY[0x1E4F44350];
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v45 != v16) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v44 + 1) + 8 * v19);
          context = (void *)MEMORY[0x1C1875BE0]();
          id v42 = 0;
          id v43 = 0;
          [v20 getResourceValue:&v43 forKey:v17 error:&v42];
          id v21 = v43;
          id v22 = v42;
          if (v22)
          {
            v23 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v54 = v20;
              __int16 v55 = 2114;
              id v56 = v22;
              _os_log_error_impl(&dword_1BC5A9000, v23, OS_LOG_TYPE_ERROR, "Failed to get resource type for fileURL %{public}@ - %{public}@", buf, 0x16u);
            }
          }
          if ([v21 conformsToType:v18])
          {
            uint64_t v24 = v15;
            uint64_t v25 = v17;
            uint64_t v26 = v16;
            v27 = (void *)MEMORY[0x1E4F28B50];
            [v20 path];
            v29 = v28 = (unsigned int (**)(void, void *))v7;
            v30 = [v27 bundleWithPath:v29];

            id v7 = v28;
            if (!v28 || v28[2](v28, v30)) {
              [v36 addObject:v30];
            }

            uint64_t v16 = v26;
            uint64_t v17 = v25;
            uint64_t v15 = v24;
            uint64_t v18 = v37;
          }

          ++v19;
        }
        while (v15 != v19);
        uint64_t v15 = [obj countByEnumeratingWithState:&v44 objects:v57 count:16];
      }
      while (v15);
    }
    v11 = &v52;

    v10 = v36;
    if ([v36 count]) {
      [(NSMutableDictionary *)v33->_bundlesByPath setObject:v36 forKeyedSubscript:v32];
    }

    p_lock = v34;
    id v6 = v35;
  }

LABEL_24:
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (void)enumerateBundlesFromDirectoryURL:(id)a3 enumerator:(id)a4
{
  id v4 = [(NTKBundleLoader *)self loadBundlesFromDirectoryURL:a3 enumerator:a4];
}

- (NTKBundleLoader)init
{
  v7.receiver = self;
  v7.super_class = (Class)NTKBundleLoader;
  v2 = [(NTKBundleLoader *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    bundlesByPath = v3->_bundlesByPath;
    v3->_bundlesByPath = v4;
  }
  return v3;
}

+ (id)rootDirectory
{
  return &stru_1F1635E90;
}

uint64_t __58__NTKBundleLoader_loadBundlesFromDirectoryURL_enumerator___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__NTKBundleLoader_loadBundlesFromDirectoryURL_enumerator___block_invoke_cold_1(a1, (uint64_t)v4, v5);
  }

  return 1;
}

void __58__NTKBundleLoader_loadBundlesFromDirectoryURL_enumerator___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "Failed to list files from directory %{public}@ - %{public}@", (uint8_t *)&v4, 0x16u);
}

- (id)bundlesFromDirectoryURL:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  __int16 v6 = [v4 path];
  int v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    uint64_t v8 = [(NTKBundleLoader *)self loadBundlesFromDirectoryURL:v4 enumerator:0];
  }
  else
  {
    uint64_t v9 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "Folder does not exist at path %{public}@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (void)resetCacheForDirectoryURL:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableDictionary *)self->_bundlesByPath setObject:0 forKeyedSubscript:v5];

  os_unfair_lock_unlock(p_lock);
}

- (NSMutableDictionary)bundlesByPath
{
  return self->_bundlesByPath;
}

- (void)setBundlesByPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end