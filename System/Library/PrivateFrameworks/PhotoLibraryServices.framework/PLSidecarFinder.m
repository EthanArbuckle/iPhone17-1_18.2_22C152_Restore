@interface PLSidecarFinder
+ (BOOL)_isValidExtensionForSidecar:(id)a3 context:(id)a4;
+ (id)_findPotentialSidecarURLsInDirectory:(id)a3 context:(id)a4;
- (NSCache)cachedSidecarURLsByDirectory;
- (PLSidecarFinder)init;
- (id)collectSidecarURLsForAssetFilename:(id)a3 inDirectory:(id)a4 context:(id)a5 removeWhenDone:(BOOL)a6;
- (void)reset;
- (void)setCachedSidecarURLsByDirectory:(id)a3;
@end

@implementation PLSidecarFinder

- (void).cxx_destruct
{
}

- (void)setCachedSidecarURLsByDirectory:(id)a3
{
}

- (NSCache)cachedSidecarURLsByDirectory
{
  return self->_cachedSidecarURLsByDirectory;
}

- (void)reset
{
  id v2 = [(PLSidecarFinder *)self cachedSidecarURLsByDirectory];
  [v2 removeAllObjects];
}

- (id)collectSidecarURLsForAssetFilename:(id)a3 inDirectory:(id)a4 context:(id)a5 removeWhenDone:(BOOL)a6
{
  BOOL v27 = a6;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v12 = [v9 stringByDeletingPathExtension];
  id v30 = [MEMORY[0x1E4F1CA48] array];
  v13 = [MEMORY[0x1E4F1CA48] array];
  v14 = [(PLSidecarFinder *)self cachedSidecarURLsByDirectory];
  v15 = [v14 objectForKey:v10];

  if (!v15)
  {
    v15 = [(id)objc_opt_class() _findPotentialSidecarURLsInDirectory:v10 context:v11];
    v16 = [(PLSidecarFinder *)self cachedSidecarURLsByDirectory];
    [v16 setObject:v15 forKey:v10];
  }
  v28 = v11;
  v29 = v10;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v23 = [v22 lastPathComponent];
        v24 = [v23 stringByDeletingPathExtension];
        if ([v12 isEqualToString:v24])
        {
          if (([v23 isEqualToString:v9] & 1) == 0) {
            [v30 addObject:v22];
          }
          [v13 addObject:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v19);
  }

  if (v27) {
    [v17 removeObjectsInArray:v13];
  }
  os_unfair_lock_unlock(lock);

  return v30;
}

- (PLSidecarFinder)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLSidecarFinder;
  id v2 = [(PLSidecarFinder *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    cachedSidecarURLsByDirectory = v2->_cachedSidecarURLsByDirectory;
    v2->_cachedSidecarURLsByDirectory = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (id)_findPotentialSidecarURLsInDirectory:(id)a3 context:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v27 = a4;
  objc_super v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v7 = *MEMORY[0x1E4F1C628];
  uint64_t v28 = *MEMORY[0x1E4F1C6E8];
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F1C628], 0);
  v24 = v6;
  v23 = v25 = v5;
  v8 = objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5);
  id v26 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
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
        v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x19F38D3B0]();
        id v30 = 0;
        int v16 = [v14 getResourceValue:&v30 forKey:v7 error:0];
        id v17 = v30;
        uint64_t v18 = v17;
        if (v16 && ([v17 BOOLValue] & 1) == 0)
        {
          id v29 = 0;
          int v19 = [v14 getResourceValue:&v29 forKey:v28 error:0];
          id v20 = v29;
          if (v19)
          {
            v21 = [v14 pathExtension];
            if ([(id)objc_opt_class() _isValidExtensionForSidecar:v21 context:v27]) {
              [v26 addObject:v14];
            }
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v11);
  }

  return v26;
}

uint64_t __64__PLSidecarFinder__findPotentialSidecarURLsInDirectory_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  objc_super v6 = PLImageManagerGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Error enumerating directory: %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

+ (BOOL)_isValidExtensionForSidecar:(id)a3 context:(id)a4
{
  id v4 = a3;
  if ([v4 length]
    && +[PLManagedAsset isValidFileExtensionForImport:](PLManagedAsset, "isValidFileExtensionForImport:", v4)&& ([MEMORY[0x1E4F8CDF8] resourceModelTypeForFilenameExtension:v4], v5 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "identifier"), objc_super v6 = objc_claimAutoreleasedReturnValue(), v5, v6))
  {
    uint64_t v7 = +[PLUniformTypeIdentifier utiWithIdentifier:v6];
    BOOL v8 = [v7 conformsToData]
      && (![v7 conformsToImage] || objc_msgSend(v7, "conformsToRawImage"))
      && ![v7 conformsToMovie];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end