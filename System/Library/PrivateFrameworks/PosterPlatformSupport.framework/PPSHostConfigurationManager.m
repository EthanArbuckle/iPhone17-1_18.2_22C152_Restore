@interface PPSHostConfigurationManager
+ (id)bundleNameForRole:(id)a3;
+ (id)sharedHostConfigurationManager;
- (NSUserDefaults)userDefaults;
- (PPSHostConfigurationManager)initWithUserDefaults:(id)a3;
- (id)_lock_cachedHostConfigurationForRole:(id)a3;
- (id)_lock_hostConfigurationForRole:(id)a3 outCacheHit:(BOOL *)a4;
- (id)_lock_loadBundledHostConfigurationForRole:(id)a3;
- (id)defaultsKeyForRole:(id)a3;
- (id)hostConfigurationForRole:(id)a3;
- (void)_lock_deleteHostConfigurationForRole:(id)a3;
- (void)_lock_setHostConfiguration:(id)a3 forRole:(id)a4;
- (void)deleteHostConfigurationForRole:(id)a3;
- (void)setHostConfiguration:(id)a3 forRole:(id)a4;
- (void)setUserDefaults:(id)a3;
@end

@implementation PPSHostConfigurationManager

+ (id)bundleNameForRole:(id)a3
{
  if ([a3 isEqualToString:@"PRPosterRoleAmbient"]) {
    return @"AmbientHostConfigurationProvider.bundle";
  }
  else {
    return 0;
  }
}

+ (id)sharedHostConfigurationManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__PPSHostConfigurationManager_sharedHostConfigurationManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedHostConfigurationManager_onceToken != -1) {
    dispatch_once(&sharedHostConfigurationManager_onceToken, block);
  }
  v2 = (void *)sharedHostConfigurationManager_instance;

  return v2;
}

void __61__PPSHostConfigurationManager_sharedHostConfigurationManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v2 = [v1 initWithUserDefaults:v4];
  v3 = (void *)sharedHostConfigurationManager_instance;
  sharedHostConfigurationManager_instance = v2;
}

- (PPSHostConfigurationManager)initWithUserDefaults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPSHostConfigurationManager;
  v6 = [(PPSHostConfigurationManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userDefaults, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)setHostConfiguration:(id)a3 forRole:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  [(PPSHostConfigurationManager *)self _lock_setHostConfiguration:v8 forRole:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_setHostConfiguration:(id)a3 forRole:(id)a4
{
  id v6 = a4;
  id v10 = 0;
  id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v10];
  id v8 = v10;
  if (v7)
  {
    objc_super v9 = [(PPSHostConfigurationManager *)self defaultsKeyForRole:v6];
    [(NSUserDefaults *)self->_userDefaults setObject:v7 forKey:v9];
  }
  else
  {
    objc_super v9 = PPSLogHostConfiguration();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PPSHostConfigurationManager _lock_setHostConfiguration:forRole:]();
    }
  }
}

- (id)hostConfigurationForRole:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = PPSLogHostConfiguration();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = PPSLogHostConfiguration();
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25A0AB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "hostConfigurationForRole", (const char *)&unk_25A0AE171, buf, 2u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned __int8 v14 = 0;
  id v10 = [(PPSHostConfigurationManager *)self _lock_hostConfigurationForRole:v4 outCacheHit:&v14];

  os_unfair_lock_unlock(p_lock);
  v11 = PPSLogHostConfiguration();
  v12 = v11;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 67109376;
    BOOL v16 = v10 != 0;
    __int16 v17 = 1024;
    int v18 = v14;
    _os_signpost_emit_with_name_impl(&dword_25A0AB000, v12, OS_SIGNPOST_INTERVAL_END, v6, "hostConfigurationForRole", "wasHostConfigurationLoaded=%{BOOL}u wasCacheHit=%{BOOL}u", buf, 0xEu);
  }

  return v10;
}

- (id)_lock_hostConfigurationForRole:(id)a3 outCacheHit:(BOOL *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(PPSHostConfigurationManager *)self _lock_cachedHostConfigurationForRole:v6];
  if (v7)
  {
    id v8 = (void *)v7;
    objc_super v9 = PPSLogHostConfiguration();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PPSHostConfigurationManager _lock_hostConfigurationForRole:outCacheHit:]((uint64_t)v6, v9);
    }

LABEL_9:
    *a4 = 1;
    goto LABEL_10;
  }
  if ([(NSMutableSet *)self->_lock_rolesWithoutHostConfigurations containsObject:v6])
  {
    id v10 = PPSLogHostConfiguration();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = v6;
      _os_log_impl(&dword_25A0AB000, v10, OS_LOG_TYPE_DEFAULT, "Already know there's no bundle for role: %{public}@", (uint8_t *)&v17, 0xCu);
    }

    id v8 = 0;
    goto LABEL_9;
  }
  id v8 = [(PPSHostConfigurationManager *)self _lock_loadBundledHostConfigurationForRole:v6];
  v12 = PPSLogHostConfiguration();
  v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PPSHostConfigurationManager _lock_hostConfigurationForRole:outCacheHit:]();
    }

    [(PPSHostConfigurationManager *)self _lock_setHostConfiguration:v8 forRole:v6];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = v6;
      _os_log_impl(&dword_25A0AB000, v13, OS_LOG_TYPE_DEFAULT, "Did not find any host configuration for %{public}@", (uint8_t *)&v17, 0xCu);
    }

    lock_rolesWithoutHostConfigurations = self->_lock_rolesWithoutHostConfigurations;
    if (!lock_rolesWithoutHostConfigurations)
    {
      v15 = (NSMutableSet *)objc_opt_new();
      BOOL v16 = self->_lock_rolesWithoutHostConfigurations;
      self->_lock_rolesWithoutHostConfigurations = v15;

      lock_rolesWithoutHostConfigurations = self->_lock_rolesWithoutHostConfigurations;
    }
    [(NSMutableSet *)lock_rolesWithoutHostConfigurations addObject:v6];
    id v8 = 0;
  }
LABEL_10:

  return v8;
}

- (void)deleteHostConfigurationForRole:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(PPSHostConfigurationManager *)self _lock_deleteHostConfigurationForRole:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_deleteHostConfigurationForRole:(id)a3
{
  id v4 = a3;
  userDefaults = self->_userDefaults;
  id v6 = [(PPSHostConfigurationManager *)self defaultsKeyForRole:v4];
  [(NSUserDefaults *)userDefaults removeObjectForKey:v6];

  [(NSMutableSet *)self->_lock_rolesWithoutHostConfigurations removeObject:v4];
  uint64_t v7 = PPSLogHostConfiguration();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PPSHostConfigurationManager _lock_deleteHostConfigurationForRole:]((uint64_t)v4, v7);
  }
}

- (id)_lock_cachedHostConfigurationForRole:(id)a3
{
  id v4 = a3;
  id v5 = [(PPSHostConfigurationManager *)self defaultsKeyForRole:v4];
  id v6 = [(NSUserDefaults *)self->_userDefaults objectForKey:v5];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v11 = 0;
    uint64_t v7 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v11];
    id v8 = v11;
    if (!v7)
    {
      objc_super v9 = PPSLogHostConfiguration();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[PPSHostConfigurationManager _lock_cachedHostConfigurationForRole:]();
      }

      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
    id v8 = 0;
  }

  return v7;
}

- (id)_lock_loadBundledHostConfigurationForRole:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [(id)objc_opt_class() bundleNameForRole:v3];
  if (v4)
  {
    id v5 = [MEMORY[0x263F08850] defaultManager];
    id v6 = [v5 URLsForDirectory:5 inDomains:8];
    if ([v6 count])
    {
      uint64_t v7 = [v6 firstObject];
      id v8 = [v7 URLByAppendingPathComponent:@"Posters"];
      objc_super v9 = [v8 URLByAppendingPathComponent:@"HostConfigurationProviders"];
      id v10 = [v9 URLByAppendingPathComponent:v4];

      id v11 = PPSLogHostConfiguration();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v3;
        _os_log_impl(&dword_25A0AB000, v11, OS_LOG_TYPE_DEFAULT, "Checking for host configuration bundle %{public}@ for role %{public}@", buf, 0x16u);
      }

      v12 = [v10 path];
      char v13 = [v5 fileExistsAtPath:v12];

      if (v13)
      {
        unsigned __int8 v14 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.PosterPlatformSupportBundleService"];
        v15 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270801C30];
        [v14 setRemoteObjectInterface:v15];

        [v14 resume];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v30 = __Block_byref_object_copy_;
        v31 = __Block_byref_object_dispose_;
        id v32 = 0;
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __73__PPSHostConfigurationManager__lock_loadBundledHostConfigurationForRole___block_invoke;
        v26[3] = &unk_2654700F0;
        id v16 = v3;
        id v27 = v16;
        v28 = buf;
        int v17 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v26];
        uint64_t v20 = MEMORY[0x263EF8330];
        uint64_t v21 = 3221225472;
        v22 = __73__PPSHostConfigurationManager__lock_loadBundledHostConfigurationForRole___block_invoke_26;
        v23 = &unk_265470118;
        v25 = buf;
        id v24 = v16;
        [v17 hostConfigurationForBundleAtURL:v10 forRole:v24 completion:&v20];
        [v14 invalidate];
        id v18 = *(id *)(*(void *)&buf[8] + 40);

        _Block_object_dispose(buf, 8);
      }
      else
      {
        unsigned __int8 v14 = PPSLogHostConfiguration();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[PPSHostConfigurationManager _lock_loadBundledHostConfigurationForRole:]();
        }
        id v18 = 0;
      }
    }
    else
    {
      uint64_t v7 = PPSLogHostConfiguration();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[PPSHostConfigurationManager _lock_loadBundledHostConfigurationForRole:]((uint64_t)v3, v7);
      }
      id v18 = 0;
    }
  }
  else
  {
    id v5 = PPSLogHostConfiguration();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v3;
      _os_log_impl(&dword_25A0AB000, v5, OS_LOG_TYPE_DEFAULT, "Role %{public}@ not compatible with bundle-based host configuration", buf, 0xCu);
    }
    id v18 = 0;
  }

  return v18;
}

void __73__PPSHostConfigurationManager__lock_loadBundledHostConfigurationForRole___block_invoke(uint64_t a1)
{
  uint64_t v2 = PPSLogHostConfiguration();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __73__PPSHostConfigurationManager__lock_loadBundledHostConfigurationForRole___block_invoke_cold_1(a1, v2);
  }

  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void __73__PPSHostConfigurationManager__lock_loadBundledHostConfigurationForRole___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (v7)
  {
    id v8 = PPSLogHostConfiguration();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __73__PPSHostConfigurationManager__lock_loadBundledHostConfigurationForRole___block_invoke_26_cold_1(a1, v7, v8);
    }
  }
}

- (id)defaultsKeyForRole:(id)a3
{
  return (id)[@"PPSHostConfiguration_" stringByAppendingString:a3];
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);

  objc_storeStrong((id *)&self->_lock_rolesWithoutHostConfigurations, 0);
}

- (void)_lock_setHostConfiguration:forRole:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_25A0AB000, v0, v1, "Failed to set PRSHostConfiguration for role %{public}@: %{public}@");
}

- (void)_lock_hostConfigurationForRole:outCacheHit:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_25A0AB000, v0, OS_LOG_TYPE_DEBUG, "Loaded bundled host configuration for %{public}@: %{public}@", v1, 0x16u);
}

- (void)_lock_hostConfigurationForRole:(uint64_t)a1 outCacheHit:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_25A0AB000, a2, OS_LOG_TYPE_DEBUG, "Found cached host configuration for %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_lock_deleteHostConfigurationForRole:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_25A0AB000, a2, OS_LOG_TYPE_DEBUG, "Deleted cached host configuration for %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_lock_cachedHostConfigurationForRole:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_25A0AB000, v0, v1, "Error unarchiving PRSHostConfiguration for %{public}@: %{public}@");
}

- (void)_lock_loadBundledHostConfigurationForRole:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25A0AB000, a2, OS_LOG_TYPE_ERROR, "Failed to load host configuration for role %{public}@: There is no /System/Library directory??", (uint8_t *)&v2, 0xCu);
}

- (void)_lock_loadBundledHostConfigurationForRole:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_25A0AB000, v0, v1, "No bundle at %{public}@ for role %{public}@");
}

void __73__PPSHostConfigurationManager__lock_loadBundledHostConfigurationForRole___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_25A0AB000, a2, OS_LOG_TYPE_ERROR, "Connection failed loading host configuration for role %{public}@", (uint8_t *)&v3, 0xCu);
}

void __73__PPSHostConfigurationManager__lock_loadBundledHostConfigurationForRole___block_invoke_26_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [a2 localizedDescription];
  id v6 = (void *)v5;
  id v7 = @"<Unknown Error>";
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  int v8 = 138543618;
  uint64_t v9 = v4;
  __int16 v10 = 2114;
  id v11 = v7;
  _os_log_error_impl(&dword_25A0AB000, a3, OS_LOG_TYPE_ERROR, "Failed to load host configuration for role %{public}@: %{public}@", (uint8_t *)&v8, 0x16u);
}

@end