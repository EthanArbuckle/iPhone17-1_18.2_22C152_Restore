@interface NTKBundleComplicationMigrationProvider
+ (NTKBundleComplicationMigrationProvider)cachedInstance;
- (BOOL)hasTypeLookupForDevice:(id)a3;
- (NTKBundleComplicationMigrationProvider)init;
- (id)_cachedLookupForDevice:(id)a3;
- (id)_loadMigrationCacheForDevice:(id)a3;
- (id)migratedComplicationFromType:(unint64_t)a3 family:(int64_t)a4 device:(id)a5;
- (void)_fetchTypeLookupForDevice:(id)a3 completion:(id)a4;
- (void)_handleDeviceDidUpdate:(id)a3;
- (void)_regenerateTypeLookupForDevice:(id)a3 completion:(id)a4;
- (void)ensureTypeLookupForDevice:(id)a3 completion:(id)a4;
- (void)serviceRequest:(id)a3 completion:(id)a4;
@end

@implementation NTKBundleComplicationMigrationProvider

+ (NTKBundleComplicationMigrationProvider)cachedInstance
{
  os_unfair_lock_lock((os_unfair_lock_t)&cachedInstance__lock);
  v2 = (NTKBundleComplicationMigrationProvider *)(id)cachedInstance__instance;
  if (!v2)
  {
    v2 = objc_alloc_init(NTKBundleComplicationMigrationProvider);
    objc_storeStrong((id *)&cachedInstance__instance, v2);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedInstance__lock);
  return v2;
}

- (NTKBundleComplicationMigrationProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)NTKBundleComplicationMigrationProvider;
  v2 = [(NTKBundleComplicationMigrationProvider *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_cachesLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    typeMigrationCaches = v3->_typeMigrationCaches;
    v3->_typeMigrationCaches = (NSMutableDictionary *)v4;

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v3 selector:sel__handleDeviceDidUpdate_ name:*MEMORY[0x1E4F19620] object:0];
  }
  return v3;
}

- (void)serviceRequest:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NTKBundleComplicationMigrationServiceClient sharedInstance];
  [v7 serviceRequest:v6 completion:v5];
}

- (void)ensureTypeLookupForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  objc_super v8 = [(NTKBundleComplicationMigrationProvider *)self _loadMigrationCacheForDevice:v6];
  if (v8)
  {
    v9 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NTKBundleComplicationMigrationProvider ensureTypeLookupForDevice:completion:]((uint64_t)v8, v9);
    }
  }
  v10 = [(NTKBundleComplicationMigrationProvider *)self _cachedLookupForDevice:v6];

  if (v10)
  {
    v7[2](v7, 0);
  }
  else
  {
    v11 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "Requesting type lookup...", v12, 2u);
    }

    [(NTKBundleComplicationMigrationProvider *)self _fetchTypeLookupForDevice:v6 completion:v7];
  }
}

- (id)migratedComplicationFromType:(unint64_t)a3 family:(int64_t)a4 device:(id)a5
{
  id v8 = a5;
  id v9 = [(NTKBundleComplicationMigrationProvider *)self _loadMigrationCacheForDevice:v8];
  v10 = [(NTKBundleComplicationMigrationProvider *)self _cachedLookupForDevice:v8];

  if (v10)
  {
    v11 = [[NTKBundleComplicationMigrationTypeLookupKey alloc] initWithComplicationType:a3 family:a4];
    v12 = [v10 objectForKeyedSubscript:v11];
  }
  else
  {
    v13 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[NTKBundleComplicationMigrationProvider migratedComplicationFromType:family:device:](v13);
    }

    v12 = 0;
  }

  return v12;
}

- (BOOL)hasTypeLookupForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKBundleComplicationMigrationProvider *)self _cachedLookupForDevice:v4];

  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    id v7 = [(NTKBundleComplicationMigrationProvider *)self _loadMigrationCacheForDevice:v4];
    id v8 = [(NTKBundleComplicationMigrationProvider *)self _cachedLookupForDevice:v4];
    BOOL v6 = v8 != 0;
  }
  return v6;
}

- (id)_cachedLookupForDevice:(id)a3
{
  p_cachesLock = &self->_cachesLock;
  id v5 = a3;
  os_unfair_lock_lock(p_cachesLock);
  typeMigrationCaches = self->_typeMigrationCaches;
  id v7 = [v5 descriptor];

  id v8 = [(NSMutableDictionary *)typeMigrationCaches objectForKeyedSubscript:v7];

  os_unfair_lock_unlock(p_cachesLock);
  return v8;
}

- (id)_loadMigrationCacheForDevice:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NTKBundleComplicationMigrationProvider *)self _cachedLookupForDevice:v4];

  if (v5)
  {
    BOOL v6 = 0;
    goto LABEL_34;
  }
  id v7 = NTKBundleComplicationMigrationServiceLookupPathForDevice(v4);
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v9 = [v8 fileExistsAtPath:v7];

  if (v9)
  {
    v10 = NTKBundleComplicationMigrationServiceGetLookupVersion(v4);
    if (v10)
    {
      v11 = NTKBundleComplicationMigrationCurrentVersion();
      char v12 = [v10 isEqualToString:v11];

      if (v12)
      {
        id v40 = 0;
        v13 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v7 options:0 error:&v40];
        id v14 = v40;
        v15 = v14;
        if (v13)
        {
          v16 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
          os_signpost_id_t v17 = os_signpost_id_generate(v16);
          v18 = v16;
          v19 = v18;
          if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BC5A9000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "load migration cache", "", buf, 2u);
          }

          v38 = v13;
          id v39 = v15;
          v20 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v13 error:&v39];
          v21 = v39;

          v22 = v19;
          v23 = v22;
          if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BC5A9000, v23, OS_SIGNPOST_INTERVAL_END, v17, "load migration cache", "", buf, 2u);
          }

          v24 = v20;
          if (v20)
          {
            v37 = v23;
            v25 = [v20 buildVersion];
            v26 = NTKBundleComplicationMigrationCurrentVersion();
            char v27 = [v25 isEqual:v26];

            v13 = v38;
            if (v27)
            {
              p_cachesLock = &self->_cachesLock;
              os_unfair_lock_lock(&self->_cachesLock);
              v29 = [v24 dictionary];
              typeMigrationCaches = self->_typeMigrationCaches;
              v31 = [v4 descriptor];
              [(NSMutableDictionary *)typeMigrationCaches setObject:v29 forKeyedSubscript:v31];

              os_unfair_lock_unlock(p_cachesLock);
              v32 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                v33 = [v24 dictionary];
                uint64_t v34 = [v33 count];
                *(_DWORD *)buf = 134217984;
                v42 = (const char *)v34;
                _os_log_impl(&dword_1BC5A9000, v32, OS_LOG_TYPE_DEFAULT, "Loaded type migration cache with %lu entries", buf, 0xCu);
              }
            }
            else
            {
              v32 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BC5A9000, v32, OS_LOG_TYPE_DEFAULT, "Loaded lookup from a different version", buf, 2u);
              }
            }

            BOOL v6 = 0;
            v23 = v37;
          }
          else
          {
            v35 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
            v13 = v38;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BC5A9000, v35, OS_LOG_TYPE_DEFAULT, "Failed to decode type lookup container", buf, 2u);
            }

            BOOL v6 = v21;
          }
        }
        else
        {
          v21 = v14;
          BOOL v6 = v21;
        }

        goto LABEL_32;
      }
      v21 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v42 = "-[NTKBundleComplicationMigrationProvider _loadMigrationCacheForDevice:]";
        _os_log_impl(&dword_1BC5A9000, v21, OS_LOG_TYPE_DEFAULT, "%s: xattr build version mismatched, not loading cache", buf, 0xCu);
      }
    }
    else
    {
      v21 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[NTKBundleComplicationMigrationProvider _loadMigrationCacheForDevice:](v21);
      }
    }
    BOOL v6 = 0;
LABEL_32:

    goto LABEL_33;
  }
  BOOL v6 = 0;
LABEL_33:

LABEL_34:
  return v6;
}

- (void)_fetchTypeLookupForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__NTKBundleComplicationMigrationProvider__fetchTypeLookupForDevice_completion___block_invoke;
  aBlock[3] = &unk_1E62C4E78;
  id v8 = v7;
  id v19 = v8;
  int v9 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  v10 = +[NTKBundleComplicationMigrationServiceClient sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__NTKBundleComplicationMigrationProvider__fetchTypeLookupForDevice_completion___block_invoke_2;
  v13[3] = &unk_1E62C5410;
  id v11 = v9;
  id v15 = v11;
  objc_copyWeak(&v16, &location);
  id v12 = v6;
  id v14 = v12;
  [v10 generateTypeLookupForDevice:v12 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

uint64_t __79__NTKBundleComplicationMigrationProvider__fetchTypeLookupForDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__NTKBundleComplicationMigrationProvider__fetchTypeLookupForDevice_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v5 = [WeakRetained _loadMigrationCacheForDevice:*(void *)(a1 + 32)];

    if (v5)
    {
      id v6 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        __79__NTKBundleComplicationMigrationProvider__fetchTypeLookupForDevice_completion___block_invoke_2_cold_1(v6);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_handleDeviceDidUpdate:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 object];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v5;
        _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "Received device did update capabilities or pairing: %@", buf, 0xCu);
      }

      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __65__NTKBundleComplicationMigrationProvider__handleDeviceDidUpdate___block_invoke;
      v8[3] = &unk_1E62C0D88;
      id v9 = v5;
      id v7 = v5;
      [(NTKBundleComplicationMigrationProvider *)self _regenerateTypeLookupForDevice:v7 completion:v8];
    }
  }
}

void __65__NTKBundleComplicationMigrationProvider__handleDeviceDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __65__NTKBundleComplicationMigrationProvider__handleDeviceDidUpdate___block_invoke_cold_1(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Finished regenerating type lookup for device: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_regenerateTypeLookupForDevice:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "Regenerating type lookup for device %@", (uint8_t *)&v11, 0xCu);
  }

  os_unfair_lock_lock(&self->_cachesLock);
  typeMigrationCaches = self->_typeMigrationCaches;
  v10 = [v6 descriptor];
  [(NSMutableDictionary *)typeMigrationCaches setObject:0 forKeyedSubscript:v10];

  os_unfair_lock_unlock(&self->_cachesLock);
  [(NTKBundleComplicationMigrationProvider *)self _fetchTypeLookupForDevice:v6 completion:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_typeMigrationCaches, 0);
}

- (void)ensureTypeLookupForDevice:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Error loading type lookup: %@", (uint8_t *)&v2, 0xCu);
}

- (void)migratedComplicationFromType:(os_log_t)log family:device:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "Attempted to load cached type migration, but the lookup hasn't been loaded yet!", v1, 2u);
}

- (void)_loadMigrationCacheForDevice:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "-[NTKBundleComplicationMigrationProvider _loadMigrationCacheForDevice:]";
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "%s: file exists but no xattr build version found", (uint8_t *)&v1, 0xCu);
}

void __79__NTKBundleComplicationMigrationProvider__fetchTypeLookupForDevice_completion___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_fault_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_FAULT, "Generated type lookup remotely but failed to load from disk", v1, 2u);
}

void __65__NTKBundleComplicationMigrationProvider__handleDeviceDidUpdate___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "Error regenerating type lookup for device %@: %@", (uint8_t *)&v4, 0x16u);
}

@end