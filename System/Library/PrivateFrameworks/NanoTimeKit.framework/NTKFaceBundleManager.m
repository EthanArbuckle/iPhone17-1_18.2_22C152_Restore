@interface NTKFaceBundleManager
+ (id)sharedManager;
- (BOOL)loadKeyDescriptor:(id)a3;
- (NSMutableDictionary)progressiveBundleIDLookup;
- (NSMutableDictionary)progressiveStyleLookup;
- (NTKFaceBundleLoader)loader;
- (id)_generateLookupsIfNecessary;
- (id)_init;
- (id)faceBundleForBundleIdentifier:(id)a3 onDevice:(id)a4;
- (id)faceBundleForBundleIdentifier:(id)a3 onDevice:(id)a4 forMigration:(BOOL)a5;
- (id)faceBundleForFaceStyle:(int64_t)a3 onDevice:(id)a4;
- (void)_resetCaches;
- (void)argonUpdated:(id)a3;
- (void)dealloc;
- (void)enumerateArgonKeyDescriptorsWithBlock:(id)a3;
- (void)enumerateFaceBundlesOnDevice:(id)a3 includingLegacy:(BOOL)a4 withBlock:(id)a5;
- (void)enumerateFaceBundlesOnDevice:(id)a3 withBlock:(id)a4;
@end

@implementation NTKFaceBundleManager

- (void)enumerateFaceBundlesOnDevice:(id)a3 withBlock:(id)a4
{
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__NTKFaceBundleManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_1 != -1) {
    dispatch_once(&sharedManager_onceToken_1, block);
  }
  v2 = (void *)sharedManager_manager_0;

  return v2;
}

- (id)faceBundleForBundleIdentifier:(id)a3 onDevice:(id)a4 forMigration:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_lock(&self->_lookupLock);
  v10 = [(NSMutableDictionary *)self->_progressiveBundleIDLookup objectForKey:v8];
  os_unfair_lock_unlock(&self->_lookupLock);
  if (!v10)
  {
    v11 = [(NTKFaceBundleManager *)self loader];
    v10 = [v11 loadFaceBundleWithIdentifier:v8];

    if (v10)
    {
      os_unfair_lock_lock(&self->_lookupLock);
      [(NSMutableDictionary *)self->_progressiveBundleIDLookup setObject:v10 forKey:v8];
      os_unfair_lock_unlock(&self->_lookupLock);
      id v12 = v10;
    }
  }
  v13 = (objc_class *)[v10 faceClass];
  v14 = [v10 legacyFaceStyle];

  if (v14)
  {
    v15 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[NTKFaceBundleManager faceBundleForBundleIdentifier:onDevice:forMigration:](v13, v15);
    }
  }
  if (a5
    || ![(objc_class *)v13 isRestrictedForDevice:v9]
    || CLKIsFaceSnapshotService())
  {
    id v16 = v10;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (NTKFaceBundleLoader)loader
{
  return self->_loader;
}

- (id)faceBundleForBundleIdentifier:(id)a3 onDevice:(id)a4
{
  return [(NTKFaceBundleManager *)self faceBundleForBundleIdentifier:a3 onDevice:a4 forMigration:0];
}

- (void)enumerateFaceBundlesOnDevice:(id)a3 includingLegacy:(BOOL)a4 withBlock:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  [(NTKFaceBundleManager *)self _generateLookupsIfNecessary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
        id v16 = (void *)MEMORY[0x1C1875BE0]();
        if (a4
          || ([v15 legacyFaceStyle],
              v17 = objc_claimAutoreleasedReturnValue(),
              v17,
              !v17))
        {
          if ((objc_msgSend((id)objc_msgSend(v15, "faceClass"), "isRestrictedForDevice:", v8) & 1) == 0) {
            v9[2](v9, v15);
          }
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
}

- (id)_generateLookupsIfNecessary
{
  p_lookupLock = &self->_lookupLock;
  os_unfair_lock_lock(&self->_lookupLock);
  cachedLookup = self->_cachedLookup;
  if (!cachedLookup)
  {
    v5 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Generating face bundle lookups for bundle manager…", buf, 2u);
    }

    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = [(NTKFaceBundleManager *)self loader];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__NTKFaceBundleManager__generateLookupsIfNecessary__block_invoke;
    v13[3] = &unk_1E62C0DF8;
    id v14 = v6;
    id v8 = v6;
    [v7 enumerateFaceBundleClassesIgnoringCache:1 withBlock:v13];

    id v9 = (NSArray *)[v8 copy];
    id v10 = self->_cachedLookup;
    self->_cachedLookup = v9;

    cachedLookup = self->_cachedLookup;
  }
  uint64_t v11 = cachedLookup;
  os_unfair_lock_unlock(p_lookupLock);

  return v11;
}

void __37__NTKFaceBundleManager_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  v2 = (void *)sharedManager_manager_0;
  sharedManager_manager_0 = v1;
}

- (id)_init
{
  v34.receiver = self;
  v34.super_class = (Class)NTKFaceBundleManager;
  v2 = [(NTKFaceBundleManager *)&v34 init];
  v3 = v2;
  if (v2)
  {
    v2->_lookupLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    progressiveStyleLookup = v3->_progressiveStyleLookup;
    v3->_progressiveStyleLookup = (NSMutableDictionary *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    progressiveBundleIDLookup = v3->_progressiveBundleIDLookup;
    v3->_progressiveBundleIDLookup = (NSMutableDictionary *)v6;

    id v8 = +[NTKBundleLoader rootDirectory];
    id v9 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v10 = _os_feature_enabled_impl();
    if (v10)
    {
      id v14 = (void *)MEMORY[0x1E4F1CB10];
      v15 = [v8 stringByAppendingPathComponent:@"/AppleInternal/Library/NanoTimeKit/FaceBundles/"];
      id v16 = [v14 fileURLWithPath:v15];

      [v9 addObject:v16];
    }
    if (NTKInternalBuild(v10, v11, v12, v13) && _os_feature_enabled_impl())
    {
      v17 = (void *)MEMORY[0x1E4F1CB10];
      long long v18 = [v8 stringByAppendingPathComponent:@"/AppleInternal/Library/NanoTimeKit/FaceSupport/UnencryptedBundles/"];
      long long v19 = [v17 fileURLWithPath:v18];

      [v9 addObject:v19];
      char v20 = 1;
    }
    else
    {
      char v20 = 0;
    }
    if (_os_feature_enabled_impl())
    {
      long long v21 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/mobile/Library/NanoTimeKit/FaceBundles/"];
      [v9 addObject:v21];
    }
    v22 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v23 = [v8 stringByAppendingString:@"/System/Library/NanoTimeKit/FaceBundles/"];
    v24 = [v22 fileURLWithPath:v23];

    [v9 addObject:v24];
    if ((v20 & 1) == 0)
    {
      v25 = NTKArgonExtractorBasePath();
      v26 = NTKArgonExtractorBuildVersion();
      v27 = [v25 stringByAppendingPathComponent:v26];
      v28 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v27];
      [v9 addObject:v28];
    }
    v29 = +[NTKFaceBundleLoader faceBundleLoaderWithDirectories:v9];
    objc_storeStrong((id *)&v3->_loader, v29);
    int v30 = CLKRunningInProcess();
    v31 = (id *)0x1E4F28EB8;
    if (!v30) {
      v31 = (id *)0x1E4F28C40;
    }
    v32 = [*v31 defaultCenter];
    [v32 addObserver:v3 selector:sel_argonUpdated_ name:@"NTKArgonManagerDidUpdateNotificationName" object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NTKFaceBundleManager;
  [(NTKFaceBundleManager *)&v4 dealloc];
}

- (void)_resetCaches
{
  v3 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Bundle manager is resetting caches…", v5, 2u);
  }

  os_unfair_lock_lock(&self->_lookupLock);
  cachedLookup = self->_cachedLookup;
  self->_cachedLookup = 0;

  os_unfair_lock_unlock(&self->_lookupLock);
}

- (void)argonUpdated:(id)a3
{
  objc_super v4 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "Bundle manager heard argon was updated…", buf, 2u);
  }

  [(NTKFaceBundleManager *)self _resetCaches];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__NTKFaceBundleManager_argonUpdated___block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __37__NTKFaceBundleManager_argonUpdated___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"NTKFaceBundleManagerDidUpdateBundlesNotificationName" object:*(void *)(a1 + 32)];
}

void __51__NTKFaceBundleManager__generateLookupsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  [*(id *)(a1 + 32) addObject:v4];
  objc_sync_exit(v3);
}

- (id)faceBundleForFaceStyle:(int64_t)a3 onDevice:(id)a4
{
  p_lookupLock = &self->_lookupLock;
  id v7 = a4;
  os_unfair_lock_lock(p_lookupLock);
  progressiveStyleLookup = self->_progressiveStyleLookup;
  id v9 = [NSNumber numberWithInteger:a3];
  uint64_t v10 = [(NSMutableDictionary *)progressiveStyleLookup objectForKey:v9];

  os_unfair_lock_unlock(p_lookupLock);
  if (!v10)
  {
    uint64_t v11 = [(NTKFaceBundleManager *)self loader];
    uint64_t v10 = [v11 loadLegacyFaceBundleForStyle:a3];

    if (v10)
    {
      os_unfair_lock_lock(p_lookupLock);
      uint64_t v12 = self->_progressiveStyleLookup;
      uint64_t v13 = [NSNumber numberWithInteger:a3];
      [(NSMutableDictionary *)v12 setObject:v10 forKey:v13];

      os_unfair_lock_unlock(p_lookupLock);
      id v14 = v10;
    }
  }
  int v15 = objc_msgSend((id)objc_msgSend(v10, "faceClass"), "isRestrictedForDevice:", v7);

  if (v15 && !CLKIsFaceSnapshotService()) {
    id v16 = 0;
  }
  else {
    id v16 = v10;
  }

  return v16;
}

- (void)enumerateArgonKeyDescriptorsWithBlock:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void))a3;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CA60] dictionary];
    loader = self->_loader;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __62__NTKFaceBundleManager_enumerateArgonKeyDescriptorsWithBlock___block_invoke;
    v28[3] = &unk_1E62C0DF8;
    id v7 = v5;
    id v29 = v7;
    [(NTKFaceBundleLoader *)loader enumerateFaceBundleClassesIgnoringCache:0 withBlock:v28];
    id v8 = v7;
    objc_sync_enter(v8);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v31 count:16];
    if (v10)
    {
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v9);
          }
          uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v13 = [v12 unsignedIntegerValue];
          id v14 = [v9 objectForKey:v12];
          objc_sync_enter(v14);
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v30 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v21;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v21 != v17) {
                  objc_enumerationMutation(v15);
                }
                v4[2](v4, v13, *(void *)(*((void *)&v20 + 1) + 8 * j));
              }
              uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v30 count:16];
            }
            while (v16);
          }

          objc_sync_exit(v15);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v31 count:16];
      }
      while (v10);
    }

    objc_sync_exit(v9);
  }
}

void __62__NTKFaceBundleManager_enumerateArgonKeyDescriptorsWithBlock___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = +[NTKArgonKeyDescriptor keyDescriptorFromBundle:v2];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__NTKFaceBundleManager_enumerateArgonKeyDescriptorsWithBlock___block_invoke_2;
  aBlock[3] = &unk_1E62C5D30;
  id v16 = *(id *)(a1 + 32);
  id v4 = (void (**)(void *, uint64_t, void *))_Block_copy(aBlock);
  if (v3)
  {
    v5 = [v2 bundleURL];
    v17[0] = *MEMORY[0x1E4F1C870];
    uint64_t v6 = v17[0];
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    id v14 = 0;
    id v8 = [v5 resourceValuesForKeys:v7 error:&v14];
    id v9 = v14;

    uint64_t v10 = [v8 objectForKey:v6];
    uint64_t v11 = v10;
    if (v10)
    {
      if ([v10 BOOLValue]) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = 2;
      }
    }
    else
    {
      uint64_t v13 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __62__NTKFaceBundleManager_enumerateArgonKeyDescriptorsWithBlock___block_invoke_cold_1((uint64_t)v5, (uint64_t)v9, v13);
      }

      uint64_t v12 = 0;
    }
    v4[2](v4, v12, v3);
  }
}

void __62__NTKFaceBundleManager_enumerateArgonKeyDescriptorsWithBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  id v7 = [*(id *)(a1 + 32) objectForKey:v5];
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1CA80] set];
    [*(id *)(a1 + 32) setObject:v7 forKey:v5];
  }
  objc_sync_exit(v6);

  id v8 = v7;
  objc_sync_enter(v8);
  [v8 addObject:v9];
  objc_sync_exit(v8);
}

- (BOOL)loadKeyDescriptor:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v11 = 0;
    id v4 = a3;
    BOOL v5 = NTKAskFaceSupportServerToAddKeyDescriptor(v4, 3, &v11);
    id v6 = v11;
    id v7 = [v4 fileName];

    id v8 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    id v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v13 = v7;
        _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "Key descriptor %{public}@ was ingested!", buf, 0xCu);
      }

      [(NTKFaceBundleManager *)self _resetCaches];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(NTKFaceBundleManager *)(uint64_t)v7 loadKeyDescriptor:v9];
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (NSMutableDictionary)progressiveBundleIDLookup
{
  return self->_progressiveBundleIDLookup;
}

- (NSMutableDictionary)progressiveStyleLookup
{
  return self->_progressiveStyleLookup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_progressiveStyleLookup, 0);
  objc_storeStrong((id *)&self->_progressiveBundleIDLookup, 0);

  objc_storeStrong((id *)&self->_cachedLookup, 0);
}

- (void)faceBundleForBundleIdentifier:(objc_class *)a1 onDevice:(NSObject *)a2 forMigration:.cold.1(objc_class *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = NSStringFromClass(a1);
  int v4 = 138412290;
  BOOL v5 = v3;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "%@: Wrong initializer is being used for a bundle with a face style - use +[NTKFace defaultFaceOfStyle:forDevice:]", (uint8_t *)&v4, 0xCu);
}

void __62__NTKFaceBundleManager_enumerateArgonKeyDescriptorsWithBlock___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, a2, a3, "Error reading status for URL %@ - %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)loadKeyDescriptor:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, a2, a3, "Key descriptor %{public}@ was NOT ingested: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end