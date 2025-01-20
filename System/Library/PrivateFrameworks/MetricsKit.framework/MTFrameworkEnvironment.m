@interface MTFrameworkEnvironment
+ (MTFrameworkEnvironment)sharedEnvironment;
+ (void)initialize;
+ (void)setSharedEnvironment:(id)a3;
+ (void)withEnvironment:(id)a3 execute:(id)a4;
- (BOOL)isInternalBuild;
- (BOOL)useCloudKitSandbox;
- (NSString)localDataPath;
- (id)date;
- (id)dateOfBirthComponents;
- (id)hostProcessBundleIdentifier;
- (id)idCache;
- (id)metricsKitBundleIdentifier;
- (id)secretStore;
- (id)valueForEntitlement:(id)a3;
- (void)setLocalDataPath:(id)a3;
@end

@implementation MTFrameworkEnvironment

- (id)hostProcessBundleIdentifier
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 bundleIdentifier];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [MEMORY[0x263F08AB0] processInfo];
    id v5 = [v6 processName];
  }

  return v5;
}

+ (MTFrameworkEnvironment)sharedEnvironment
{
  return (MTFrameworkEnvironment *)(id)_sharedEnvironment;
}

- (BOOL)isInternalBuild
{
  return _isInternalBuild;
}

- (id)idCache
{
  v2 = self;
  objc_sync_enter(v2);
  idCache = v2->_idCache;
  if (!idCache)
  {
    v4 = objc_alloc_init(MTIDCache);
    id v5 = v2->_idCache;
    v2->_idCache = v4;

    idCache = v2->_idCache;
  }
  v6 = idCache;
  objc_sync_exit(v2);

  return v6;
}

- (id)secretStore
{
  v2 = self;
  objc_sync_enter(v2);
  secretStore = v2->_secretStore;
  if (!secretStore)
  {
    Class v4 = NSClassFromString(&cfstr_Mtidcomposites.isa);
    Class v5 = NSClassFromString(&cfstr_Mtidxpcsecrets.isa);
    v6 = [(MTFrameworkEnvironment *)v2 valueForEntitlement:@"com.apple.security.exception.mach-lookup.global-name"];
    if (([v6 containsObject:@"com.apple.AMPIDService"] & (v5 != 0)) != 0) {
      v7 = v5;
    }
    else {
      v7 = v4;
    }
    v8 = (MTIDSecretStore *)objc_alloc_init(v7);
    v9 = v2->_secretStore;
    v2->_secretStore = v8;

    secretStore = v2->_secretStore;
  }
  v10 = secretStore;
  objc_sync_exit(v2);

  return v10;
}

- (id)date
{
  return (id)[MEMORY[0x263EFF910] date];
}

+ (void)withEnvironment:(id)a3 execute:(id)a4
{
  v6 = (void (**)(void))a4;
  id v7 = a3;
  id v8 = [a1 sharedEnvironment];
  [a1 setSharedEnvironment:v7];

  v6[2](v6);
  [a1 setSharedEnvironment:v8];
}

+ (void)setSharedEnvironment:(id)a3
{
}

+ (void)initialize
{
  uint64_t v2 = objc_opt_new();
  v3 = (void *)_sharedEnvironment;
  _sharedEnvironment = v2;

  _isInternalBuild = MGGetBoolAnswer();
}

- (void)setLocalDataPath:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 hasPrefix:@"file://"])
  {
    Class v5 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_218211000, v5, OS_LOG_TYPE_ERROR, "MetricsKit: Expected a path but got a full url for MTFrameworkEnvironment.setLocalDataPath. Please remove file:// from %@", (uint8_t *)&v10, 0xCu);
    }

    v6 = [NSURL URLWithString:v4];
    uint64_t v7 = [v6 path];

    id v4 = (id)v7;
  }
  id v8 = [v4 stringByReplacingOccurrencesOfString:@"//" withString:@"/"];

  localDataPath = self->_localDataPath;
  self->_localDataPath = v8;
}

- (NSString)localDataPath
{
  localDataPath = self->_localDataPath;
  if (!localDataPath)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__MTFrameworkEnvironment_localDataPath__block_invoke;
    block[3] = &unk_26430FB90;
    block[4] = self;
    if (localDataPath_onceToken != -1) {
      dispatch_once(&localDataPath_onceToken, block);
    }
    localDataPath = (NSString *)localDataPath_defaultDataFolder;
  }
  v3 = localDataPath;

  return v3;
}

void __39__MTFrameworkEnvironment_localDataPath__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  id v9 = 0;
  v3 = [v2 URLForDirectory:5 inDomain:1 appropriateForURL:0 create:1 error:&v9];
  id v4 = v9;
  Class v5 = [*(id *)(a1 + 32) metricsKitBundleIdentifier];
  v6 = [v3 URLByAppendingPathComponent:v5];

  uint64_t v7 = [v6 path];
  id v8 = (void *)localDataPath_defaultDataFolder;
  localDataPath_defaultDataFolder = v7;
}

- (id)valueForEntitlement:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = (__CFString *)a3;
  id v4 = SecTaskCreateFromSelf(0);
  if (v4)
  {
    Class v5 = v4;
    CFErrorRef error = 0;
    v6 = (void *)SecTaskCopyValueForEntitlement(v4, v3, &error);
    if (error)
    {
      uint64_t v7 = MTMetricsKitOSLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v11 = v3;
        __int16 v12 = 2112;
        CFErrorRef v13 = error;
        _os_log_impl(&dword_218211000, v7, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to read entitlement %@ error: %@", buf, 0x16u);
      }

      CFRelease(error);
    }
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)useCloudKitSandbox
{
  BOOL v3 = [(MTFrameworkEnvironment *)self isInternalBuild];
  if (v3)
  {
    id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    Class v5 = [v4 valueForKey:@"MTMetricsKitContainerEnvironment"];

    if (!v5)
    {
      Class v5 = [(MTFrameworkEnvironment *)self valueForEntitlement:@"com.apple.developer.icloud-container-environment"];
    }
    char v6 = [v5 isEqualToString:@"Development"];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (id)metricsKitBundleIdentifier
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Mtmetricskit.isa)];
  BOOL v3 = [v2 bundleIdentifier];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idCache, 0);
  objc_storeStrong((id *)&self->_secretStore, 0);

  objc_storeStrong((id *)&self->_localDataPath, 0);
}

- (id)dateOfBirthComponents
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (HealthKitFramework_sOnce != -1) {
    dispatch_once(&HealthKitFramework_sOnce, &__block_literal_global_11);
  }
  if (!HealthKitFramework_sHandle
    || (NSClassFromString(&cfstr_Hkhealthstore.isa),
        (uint64_t v2 = (objc_class *)(id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v8 = "MetricsKit: HKHealthStore class is not found.";
      id v9 = v4;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
LABEL_15:
      _os_log_impl(&dword_218211000, v9, v10, v8, buf, 2u);
    }
LABEL_16:
    Class v5 = 0;
    goto LABEL_17;
  }
  BOOL v3 = v2;
  if (([(objc_class *)v2 isHealthDataAvailable] & 1) == 0)
  {
    id v4 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v8 = "MetricsKit: HealthKit health data is not available.";
      id v9 = v4;
      os_log_type_t v10 = OS_LOG_TYPE_INFO;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  id v4 = objc_alloc_init(v3);
  id v12 = 0;
  Class v5 = [v4 dateOfBirthComponentsWithError:&v12];
  id v6 = v12;
  if (v6)
  {
    uint64_t v7 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_218211000, v7, OS_LOG_TYPE_ERROR, "MetricsKit: Date of birth retrieval from HealthKit failed with error: %@", buf, 0xCu);
    }
  }
LABEL_17:

  return v5;
}

@end