@interface TILaunchServicesLookup
+ (id)genreIDsForApplicationIdentifier:(id)a3;
+ (id)lookupAppNames;
+ (id)sharedInstance;
+ (void)disableForTesting:(BOOL)a3;
+ (void)enumerateInstalledApplicationNames:(id)a3;
- (NSArray)cache;
- (NSDate)lastCacheUpdate;
- (TILaunchServicesLookup)init;
- (id)appNames;
- (id)tryCache;
- (void)cacheNames:(id)a3;
- (void)dealloc;
- (void)enumerateAppNames:(id)a3;
- (void)handleMemoryPressureLevel:(unint64_t)a3 excessMemoryInBytes:(unint64_t)a4;
- (void)resetCache;
- (void)setCache:(id)a3;
- (void)setLastCacheUpdate:(id)a3;
@end

@implementation TILaunchServicesLookup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCacheUpdate, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)setLastCacheUpdate:(id)a3
{
}

- (NSDate)lastCacheUpdate
{
  return self->_lastCacheUpdate;
}

- (void)setCache:(id)a3
{
}

- (NSArray)cache
{
  return self->_cache;
}

- (void)handleMemoryPressureLevel:(unint64_t)a3 excessMemoryInBytes:(unint64_t)a4
{
  if (a3 == 3) {
    [(TILaunchServicesLookup *)self resetCache];
  }
}

- (void)enumerateAppNames:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, char *))a3;
  if (v4)
  {
    [(TILaunchServicesLookup *)self appNames];
    char v14 = 0;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
        if (v14) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (id)appNames
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [(TILaunchServicesLookup *)self tryCache];
  if (!v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[TILaunchServicesLookup appNames]";
      _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s  Requesting installed app names from LaunchServices.", (uint8_t *)&v6, 0xCu);
    }
    v3 = +[TILaunchServicesLookup lookupAppNames];
    [(TILaunchServicesLookup *)self cacheNames:v3];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [v3 count];
    int v6 = 136315394;
    uint64_t v7 = "-[TILaunchServicesLookup appNames]";
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s  Got installed app names (count = %lu).", (uint8_t *)&v6, 0x16u);
  }

  return v3;
}

- (void)resetCache
{
  obj = self;
  objc_sync_enter(obj);
  [(TILaunchServicesLookup *)obj setCache:0];
  [(TILaunchServicesLookup *)obj setLastCacheUpdate:0];
  objc_sync_exit(obj);
}

- (void)cacheNames:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  [(TILaunchServicesLookup *)obj setCache:v4];

  id v5 = [MEMORY[0x1E4F1C9C8] date];
  [(TILaunchServicesLookup *)obj setLastCacheUpdate:v5];

  objc_sync_exit(obj);
}

- (id)tryCache
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(TILaunchServicesLookup *)v2 cache];
  if (v3
    && (id v4 = (void *)v3,
        [(TILaunchServicesLookup *)v2 lastCacheUpdate],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    int v6 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v7 = [(TILaunchServicesLookup *)v2 lastCacheUpdate];
    __int16 v8 = [v7 dateByAddingTimeInterval:1200.0];

    uint64_t v9 = [v6 earlierDate:v8];

    if (v9 == v6)
    {
      uint64_t v10 = [(TILaunchServicesLookup *)v2 cache];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  objc_sync_exit(v2);

  return v10;
}

- (void)dealloc
{
  uint64_t v3 = +[TIKeyboardActivityController sharedController];
  [v3 removeActivityObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TILaunchServicesLookup;
  [(TILaunchServicesLookup *)&v4 dealloc];
}

- (TILaunchServicesLookup)init
{
  v5.receiver = self;
  v5.super_class = (Class)TILaunchServicesLookup;
  v2 = [(TILaunchServicesLookup *)&v5 init];
  if (v2)
  {
    uint64_t v3 = +[TIKeyboardActivityController sharedController];
    [v3 addActivityObserver:v2];
  }
  return v2;
}

+ (id)genreIDsForApplicationIdentifier:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (__disableForTesting)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2050000000;
    objc_super v5 = (void *)getLSApplicationProxyClass_softClass_8921;
    uint64_t v39 = getLSApplicationProxyClass_softClass_8921;
    if (!getLSApplicationProxyClass_softClass_8921)
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __getLSApplicationProxyClass_block_invoke_8922;
      v35[3] = &unk_1E6E2E248;
      v35[4] = &v36;
      __getLSApplicationProxyClass_block_invoke_8922((uint64_t)v35);
      objc_super v5 = (void *)v37[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v36, 8);
    uint64_t v7 = [v6 applicationProxyForIdentifier:v3];
    __int16 v8 = [v7 bundleContainerURL];
    uint64_t v9 = [v8 path];
    uint64_t v10 = [v9 stringByAppendingPathComponent:@"iTunesMetadata.plist"];

    long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v10];
    long long v12 = [v11 objectForKey:@"subgenres"];
    long long v13 = [MEMORY[0x1E4F1CA80] set];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = v11;
      v28 = v10;
      v29 = v7;
      id v30 = v3;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v32 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v20 = [v19 objectForKey:@"genreId"];
              if ([v20 integerValue] < 7001)
              {
                v21 = v13;
                v22 = v20;
              }
              else
              {
                v21 = v13;
                v22 = &unk_1F3FA7C28;
              }
              [v21 addObject:v22];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
        }
        while (v16);
      }

      uint64_t v7 = v29;
      id v3 = v30;
      long long v11 = v27;
      uint64_t v10 = v28;
    }
    v23 = [v11 objectForKey:@"genreId"];
    if ([v23 integerValue] < 7001)
    {
      v25 = v13;
      v24 = v23;
    }
    else
    {
      v24 = &unk_1F3FA7C28;
      v25 = v13;
    }
    [v25 addObject:v24];
    if ([v13 count]) {
      id v4 = v13;
    }
    else {
      id v4 = 0;
    }
  }

  return v4;
}

+ (id)lookupAppNames
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v3 = (void *)getLSApplicationWorkspaceClass_softClass;
  uint64_t v14 = getLSApplicationWorkspaceClass_softClass;
  if (!getLSApplicationWorkspaceClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getLSApplicationWorkspaceClass_block_invoke;
    v10[3] = &unk_1E6E2E248;
    v10[4] = &v11;
    __getLSApplicationWorkspaceClass_block_invoke((uint64_t)v10);
    id v3 = (void *)v12[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v11, 8);
  objc_super v5 = [v4 defaultWorkspace];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__TILaunchServicesLookup_lookupAppNames__block_invoke;
  v8[3] = &unk_1E6E2B428;
  id v6 = v2;
  id v9 = v6;
  [v5 enumerateBundlesOfType:1 block:v8];

  return v6;
}

void __40__TILaunchServicesLookup_lookupAppNames__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v12 = a2;
  if ((unint64_t)[*(id *)(a1 + 32) count] >= 0x12C)
  {
    *a3 = 1;
    goto LABEL_10;
  }
  id v5 = v12;
  id v6 = [v5 applicationType];
  if ([v6 isEqualToString:@"Internal"]) {
    goto LABEL_8;
  }
  uint64_t v7 = [v5 applicationType];
  if ([v7 isEqualToString:@"Hidden"]) {
    goto LABEL_7;
  }
  __int16 v8 = [v5 appTags];
  if ([v8 containsObject:@"hidden"])
  {

LABEL_7:
    goto LABEL_8;
  }
  id v9 = [v5 bundleIdentifier];
  char v10 = [v9 isEqualToString:@"com.apple.webapp1"];

  if (v10) {
    goto LABEL_9;
  }
  uint64_t v11 = [v5 objectForInfoDictionaryKey:@"SBIconVisibilityDefaultVisible" ofClass:objc_opt_class()];
  id v6 = v11;
  if (!v11 || [v11 BOOLValue])
  {
    uint64_t v7 = [v5 localizedName];
    if (v7) {
      [*(id *)(a1 + 32) addObject:v7];
    }
    goto LABEL_7;
  }
LABEL_8:

LABEL_9:
LABEL_10:
}

+ (void)enumerateInstalledApplicationNames:(id)a3
{
  if (!__disableForTesting)
  {
    id v3 = a3;
    id v4 = +[TILaunchServicesLookup sharedInstance];
    [v4 enumerateAppNames:v3];
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8964 != -1) {
    dispatch_once(&sharedInstance_onceToken_8964, &__block_literal_global_8965);
  }
  v2 = (void *)sharedInstance_instance_8966;

  return v2;
}

uint64_t __40__TILaunchServicesLookup_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(TILaunchServicesLookup);
  uint64_t v1 = sharedInstance_instance_8966;
  sharedInstance_instance_8966 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)disableForTesting:(BOOL)a3
{
  __disableForTesting = a3;
}

@end