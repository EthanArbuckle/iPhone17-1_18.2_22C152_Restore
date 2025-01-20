@interface RMLocations
+ (BOOL)fixFilePermissionsForURL:(id)a3;
+ (NSURL)managedObjectModelURL;
+ (NSURL)xpcServiceDirectoryURL;
+ (id)URLWithResolvedSymlinksFromURL:(id)a3 error:(id *)a4;
+ (id)_applicationSupportChildDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4 childName:(id)a5 descriptor:(id)a6;
+ (id)_dataVaultChildDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4 childName:(id)a5 descriptor:(id)a6;
+ (id)_rootDirectoryURLInDomain:(int64_t)a3 error:(id *)a4;
+ (id)baseDirectoryURLCreateIfNeeded:(BOOL)a3;
+ (id)baseDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4;
+ (id)configurationSchemaDirectoryForXPCServiceResourceURL:(id)a3;
+ (id)darwinCacheDirectoryURL;
+ (id)darwinTemporaryDirectoryURL;
+ (id)darwinUserDirectoryURL;
+ (id)dataVaultDirectoryURLCreateIfNeeded:(BOOL)a3;
+ (id)dataVaultDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4;
+ (id)defaultsOverrideFileURLCreateIfNeeded:(BOOL)a3;
+ (id)defaultsOverrideFileURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4;
+ (id)homeDirectoryURL;
+ (id)httpLoggingDirectoryURLCreateIfNeeded:(BOOL)a3;
+ (id)httpLoggingDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4;
+ (id)identityDirectoryURLCreateIfNeeded:(BOOL)a3;
+ (id)identityDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4;
+ (id)migrationStatusFileURLCreateIfNeeded:(BOOL)a3;
+ (id)migrationStatusFileURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4;
+ (id)oldBaseDirectoryURLInSystemDomain;
+ (id)persistentStoreDirectoryURLCreateIfNeeded:(BOOL)a3;
+ (id)persistentStoreDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4;
+ (id)persistentStoreURLCreateIfNeeded:(BOOL)a3;
+ (id)persistentStoreURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4;
+ (id)statusDirectoryURLCreateIfNeeded:(BOOL)a3;
+ (id)statusDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4;
+ (id)statusSchemaDirectoryForXPCServiceResourceURL:(id)a3;
+ (int64_t)currentDomain;
+ (void)_oneTimeDataVaultConversionInDomain:(int64_t)a3 dataVaultDirectoryURL:(id)a4;
+ (void)darwinCacheDirectoryURL;
+ (void)darwinTemporaryDirectoryURL;
+ (void)darwinUserDirectoryURL;
+ (void)homeDirectoryURL;
@end

@implementation RMLocations

+ (int64_t)currentDomain
{
  return +[RMBundle managementScope] == 1;
}

+ (id)_rootDirectoryURLInDomain:(int64_t)a3 error:(id *)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__RMLocations__rootDirectoryURLInDomain_error___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (_rootDirectoryURLInDomain_error__onceToken != -1) {
    dispatch_once(&_rootDirectoryURLInDomain_error__onceToken, block);
  }
  v4 = (void *)_rootDirectoryURLInDomain_error__containerURL;

  return v4;
}

void __47__RMLocations__rootDirectoryURLInDomain_error___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) != 1)
  {
    v4 = NSURL;
    v2 = NSHomeDirectory();
    v3 = v4;
    goto LABEL_5;
  }
  uint64_t v1 = DMCSystemContainerPathWithBundleIdentifier();
  if (v1)
  {
    v2 = (void *)v1;
    v3 = NSURL;
LABEL_5:
    v5 = [v3 fileURLWithPath:v2];

    uint64_t v6 = [v5 URLByAppendingPathComponent:@"Library/Application Support"];
    v7 = (void *)_rootDirectoryURLInDomain_error__containerURL;
    _rootDirectoryURLInDomain_error__containerURL = v6;

    goto LABEL_6;
  }
  v5 = +[RMLog locations];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __47__RMLocations__rootDirectoryURLInDomain_error___block_invoke_cold_1(v5);
  }
LABEL_6:
}

+ (id)baseDirectoryURLCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [a1 currentDomain];

  return (id)[a1 baseDirectoryURLInDomain:v5 createIfNeeded:v3];
}

+ (id)baseDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v21 = 0;
  uint64_t v6 = [a1 _rootDirectoryURLInDomain:a3 error:&v21];
  id v7 = v21;
  if (!v6)
  {
    v8 = +[RMLog locations];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[RMLocations baseDirectoryURLInDomain:createIfNeeded:]();
    }
  }
  if (a3) {
    v9 = @"com.apple.remotemanagementd";
  }
  else {
    v9 = @"com.apple.RemoteManagementAgent";
  }
  v10 = [v6 URLByAppendingPathComponent:v9 isDirectory:1];
  v11 = v10;
  if (v4)
  {
    id v20 = v7;
    char DirectoryAtURL = createDirectoryAtURL(v10, a3, (uint64_t)&v20);
    id v13 = v20;

    if ((DirectoryAtURL & 1) == 0)
    {
      v14 = +[RMLog locations];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[RMLocations baseDirectoryURLInDomain:createIfNeeded:]();
      }
    }
    v15 = [v11 path];
    DMCSetSkipBackupAttributeToItemAtPath();
  }
  else
  {
    id v13 = v7;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__RMLocations_baseDirectoryURLInDomain_createIfNeeded___block_invoke;
  block[3] = &unk_2646DD018;
  id v16 = v11;
  id v19 = v16;
  if (baseDirectoryURLInDomain_createIfNeeded__onceToken != -1) {
    dispatch_once(&baseDirectoryURLInDomain_createIfNeeded__onceToken, block);
  }

  return v16;
}

void __55__RMLocations_baseDirectoryURLInDomain_createIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = +[RMLog locations];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_224784000, v2, OS_LOG_TYPE_INFO, "Base directory is %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)oldBaseDirectoryURLInSystemDomain
{
  return (id)[NSURL fileURLWithPath:@"/var/mobile/Library/Application Support/com.apple.remotemanagementd"];
}

+ (id)dataVaultDirectoryURLCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [a1 currentDomain];

  return (id)[a1 dataVaultDirectoryURLInDomain:v5 createIfNeeded:v3];
}

+ (id)dataVaultDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_msgSend(a1, "baseDirectoryURLInDomain:createIfNeeded:");
  if (!v7)
  {
    v11 = +[RMLog locations];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[RMLocations dataVaultDirectoryURLInDomain:createIfNeeded:]();
    }

    if (v4) {
      goto LABEL_3;
    }
LABEL_10:
    id v9 = 0;
    goto LABEL_11;
  }
  if (!v4) {
    goto LABEL_10;
  }
LABEL_3:
  id v16 = 0;
  char DirectoryAtURL = createDirectoryAtURL(v7, a3, (uint64_t)&v16);
  id v9 = v16;
  if ((DirectoryAtURL & 1) == 0)
  {
    v10 = +[RMLog locations];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[RMLocations dataVaultDirectoryURLInDomain:createIfNeeded:]();
    }
  }
LABEL_11:
  v12 = [MEMORY[0x263F08850] defaultManager];
  id v13 = [v7 path];
  int v14 = [v12 fileExistsAtPath:v13 isDirectory:0];

  if (v14) {
    [a1 _oneTimeDataVaultConversionInDomain:a3 dataVaultDirectoryURL:v7];
  }

  return v7;
}

+ (void)_oneTimeDataVaultConversionInDomain:(int64_t)a3 dataVaultDirectoryURL:(id)a4
{
  id v4 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__RMLocations__oneTimeDataVaultConversionInDomain_dataVaultDirectoryURL___block_invoke;
  block[3] = &unk_2646DD018;
  id v8 = v4;
  uint64_t v5 = _oneTimeDataVaultConversionInDomain_dataVaultDirectoryURL__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&_oneTimeDataVaultConversionInDomain_dataVaultDirectoryURL__onceToken, block);
  }
}

void __73__RMLocations__oneTimeDataVaultConversionInDomain_dataVaultDirectoryURL___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = +[RMLog locations];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_224784000, v2, OS_LOG_TYPE_INFO, "Data Vault directory is %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)identityDirectoryURLCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [a1 currentDomain];

  return (id)[a1 identityDirectoryURLInDomain:v5 createIfNeeded:v3];
}

+ (id)identityDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  return (id)[a1 _dataVaultChildDirectoryURLInDomain:a3 createIfNeeded:a4 childName:@"Identities" descriptor:@"Identity"];
}

+ (id)persistentStoreDirectoryURLCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [a1 currentDomain];

  return (id)[a1 persistentStoreDirectoryURLInDomain:v5 createIfNeeded:v3];
}

+ (id)persistentStoreDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  return (id)[a1 _dataVaultChildDirectoryURLInDomain:a3 createIfNeeded:a4 childName:@"Database" descriptor:@"Persistent Store"];
}

+ (id)persistentStoreURLCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = [a1 persistentStoreDirectoryURLCreateIfNeeded:a3];
  int v4 = [v3 URLByAppendingPathComponent:@"RemoteManagement.sqlite"];

  return v4;
}

+ (id)persistentStoreURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  int v4 = [a1 persistentStoreDirectoryURLInDomain:a3 createIfNeeded:a4];
  uint64_t v5 = [v4 URLByAppendingPathComponent:@"RemoteManagement.sqlite"];

  return v5;
}

+ (id)httpLoggingDirectoryURLCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [a1 currentDomain];

  return (id)[a1 httpLoggingDirectoryURLInDomain:v5 createIfNeeded:v3];
}

+ (id)httpLoggingDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  return (id)[a1 _dataVaultChildDirectoryURLInDomain:a3 createIfNeeded:a4 childName:@"HTTPLogs" descriptor:@"HTTP Logs"];
}

+ (id)statusDirectoryURLCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [a1 currentDomain];

  return (id)[a1 statusDirectoryURLInDomain:v5 createIfNeeded:v3];
}

+ (id)statusDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  return (id)[a1 _dataVaultChildDirectoryURLInDomain:a3 createIfNeeded:a4 childName:@"Status" descriptor:@"Status"];
}

+ (id)defaultsOverrideFileURLCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [a1 currentDomain];

  return (id)[a1 defaultsOverrideFileURLInDomain:v5 createIfNeeded:v3];
}

+ (id)defaultsOverrideFileURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  return (id)[NSURL fileURLWithPath:@"/var/db/.RMDefaultsOverride.plist" isDirectory:0];
}

+ (id)migrationStatusFileURLCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [a1 currentDomain];

  return (id)[a1 migrationStatusFileURLInDomain:v5 createIfNeeded:v3];
}

+ (id)migrationStatusFileURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  int v4 = [a1 dataVaultDirectoryURLInDomain:a3 createIfNeeded:a4];
  uint64_t v5 = [v4 URLByAppendingPathComponent:@"MigrationStatus.plist"];

  return v5;
}

+ (NSURL)managedObjectModelURL
{
  v2 = +[RMBundle remoteManagementBundle];
  BOOL v3 = [v2 URLForResource:@"RemoteManagement" withExtension:@"momd"];

  return (NSURL *)v3;
}

+ (NSURL)xpcServiceDirectoryURL
{
  v2 = +[RMBundle remoteManagementBundle];
  BOOL v3 = [v2 URLForResource:@"XPCServices" withExtension:0];

  return (NSURL *)v3;
}

+ (id)configurationSchemaDirectoryForXPCServiceResourceURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"ConfigurationSchema" isDirectory:1];
}

+ (id)statusSchemaDirectoryForXPCServiceResourceURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"StatusSchema" isDirectory:1];
}

+ (id)homeDirectoryURL
{
  v2 = NSURL;
  BOOL v3 = NSHomeDirectory();
  int v4 = [v2 fileURLWithPath:v3];

  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    +[RMLocations homeDirectoryURL]();
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__RMLocations_homeDirectoryURL__block_invoke;
  block[3] = &unk_2646DD018;
  id v10 = v4;
  uint64_t v5 = homeDirectoryURL_onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&homeDirectoryURL_onceToken, block);
  }
  id v7 = +[RMLocations URLWithResolvedSymlinksFromURL:v6 error:0];

  return v7;
}

void __31__RMLocations_homeDirectoryURL__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = 138543362;
    uint64_t v4 = v2;
    _os_log_impl(&dword_224784000, &_os_log_internal, OS_LOG_TYPE_INFO, "Home directory is %{public}@", (uint8_t *)&v3, 0xCu);
  }
}

+ (id)darwinUserDirectoryURL
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  bzero(v22, 0x400uLL);
  if (!confstr(0x10000, v22, 0x400uLL)
    || (uint64_t v2 = realpath_DARWIN_EXTSN(v22, 0)) == 0
    || (int v3 = (void *)[[NSString alloc] initWithBytesNoCopy:v2 length:strlen(v2) encoding:4 freeWhenDone:1], objc_msgSend(NSURL, "fileURLWithPath:", v3), v4 = objc_claimAutoreleasedReturnValue(), v3, !v4))
  {
    uint64_t v5 = __error();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[RMLocations darwinUserDirectoryURL];
    }
    uint64_t v4 = 0;
  }
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __37__RMLocations_darwinUserDirectoryURL__block_invoke;
  id v20 = &unk_2646DD018;
  id v21 = v4;
  uint64_t v13 = darwinUserDirectoryURL_onceToken;
  id v14 = v4;
  if (v13 != -1) {
    dispatch_once(&darwinUserDirectoryURL_onceToken, &v17);
  }
  v15 = +[RMLocations URLWithResolvedSymlinksFromURL:error:](RMLocations, "URLWithResolvedSymlinksFromURL:error:", v14, 0, v17, v18, v19, v20);

  return v15;
}

void __37__RMLocations_darwinUserDirectoryURL__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = 138543362;
    uint64_t v4 = v2;
    _os_log_impl(&dword_224784000, &_os_log_internal, OS_LOG_TYPE_INFO, "Darwin Cache directory is %{public}@", (uint8_t *)&v3, 0xCu);
  }
}

+ (id)darwinCacheDirectoryURL
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  bzero(v22, 0x400uLL);
  if (!confstr(65538, v22, 0x400uLL)
    || (uint64_t v2 = realpath_DARWIN_EXTSN(v22, 0)) == 0
    || (int v3 = (void *)[[NSString alloc] initWithBytesNoCopy:v2 length:strlen(v2) encoding:4 freeWhenDone:1], objc_msgSend(NSURL, "fileURLWithPath:", v3), v4 = objc_claimAutoreleasedReturnValue(), v3, !v4))
  {
    uint64_t v5 = __error();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[RMLocations darwinCacheDirectoryURL];
    }
    uint64_t v4 = 0;
  }
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __38__RMLocations_darwinCacheDirectoryURL__block_invoke;
  id v20 = &unk_2646DD018;
  id v21 = v4;
  uint64_t v13 = darwinCacheDirectoryURL_onceToken;
  id v14 = v4;
  if (v13 != -1) {
    dispatch_once(&darwinCacheDirectoryURL_onceToken, &v17);
  }
  v15 = +[RMLocations URLWithResolvedSymlinksFromURL:error:](RMLocations, "URLWithResolvedSymlinksFromURL:error:", v14, 0, v17, v18, v19, v20);

  return v15;
}

void __38__RMLocations_darwinCacheDirectoryURL__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = 138543362;
    uint64_t v4 = v2;
    _os_log_impl(&dword_224784000, &_os_log_internal, OS_LOG_TYPE_INFO, "Darwin Cache directory is %{public}@", (uint8_t *)&v3, 0xCu);
  }
}

+ (id)darwinTemporaryDirectoryURL
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  bzero(v22, 0x400uLL);
  if (!confstr(65537, v22, 0x400uLL)
    || (uint64_t v2 = realpath_DARWIN_EXTSN(v22, 0)) == 0
    || (int v3 = (void *)[[NSString alloc] initWithBytesNoCopy:v2 length:strlen(v2) encoding:4 freeWhenDone:1], objc_msgSend(NSURL, "fileURLWithPath:", v3), v4 = objc_claimAutoreleasedReturnValue(), v3, !v4))
  {
    uint64_t v5 = __error();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[RMLocations darwinTemporaryDirectoryURL];
    }
    uint64_t v4 = 0;
  }
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __42__RMLocations_darwinTemporaryDirectoryURL__block_invoke;
  id v20 = &unk_2646DD018;
  id v21 = v4;
  uint64_t v13 = darwinTemporaryDirectoryURL_onceToken;
  id v14 = v4;
  if (v13 != -1) {
    dispatch_once(&darwinTemporaryDirectoryURL_onceToken, &v17);
  }
  v15 = +[RMLocations URLWithResolvedSymlinksFromURL:error:](RMLocations, "URLWithResolvedSymlinksFromURL:error:", v14, 0, v17, v18, v19, v20);

  return v15;
}

void __42__RMLocations_darwinTemporaryDirectoryURL__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = 138543362;
    uint64_t v4 = v2;
    _os_log_impl(&dword_224784000, &_os_log_internal, OS_LOG_TYPE_INFO, "Darwin Temporary directory is %{public}@", (uint8_t *)&v3, 0xCu);
  }
}

+ (BOOL)fixFilePermissionsForURL:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = +[RMLog locations];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = v3;
    _os_log_impl(&dword_224784000, v4, OS_LOG_TYPE_INFO, "Trying to fix permissions: %{public}@", buf, 0xCu);
  }

  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v6 = [v3 path];
  id v20 = 0;
  uint64_t v7 = [v5 attributesOfItemAtPath:v6 error:&v20];
  id v8 = v20;

  if (v7)
  {
    uint64_t v9 = *MEMORY[0x263F08078];
    uint64_t v10 = [v7 objectForKeyedSubscript:*MEMORY[0x263F08078]];
    uint64_t v11 = v10;
    if (v10 && [v10 intValue])
    {
      uint64_t v12 = +[RMLog locations];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[RMLocations fixFilePermissionsForURL:]();
      }
      id v13 = v8;
    }
    else
    {
      uint64_t v21 = v9;
      v22 = &unk_26D7A1AD8;
      BOOL v14 = 1;
      v15 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      id v16 = [v3 path];
      id v19 = v8;
      char v17 = [v5 setAttributes:v15 ofItemAtPath:v16 error:&v19];
      id v13 = v19;

      if (v17)
      {
LABEL_13:
        id v8 = v13;
        goto LABEL_17;
      }
      uint64_t v12 = +[RMLog locations];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[RMLocations fixFilePermissionsForURL:]();
      }
    }

    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v11 = +[RMLog locations];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    +[RMLocations fixFilePermissionsForURL:]();
  }
  BOOL v14 = 0;
LABEL_17:

  return v14;
}

+ (id)_applicationSupportChildDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4 childName:(id)a5 descriptor:(id)a6
{
  BOOL v7 = a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [a1 baseDirectoryURLInDomain:a3 createIfNeeded:v7];
  if (!v12)
  {
    id v13 = +[RMLog locations];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[RMLocations _applicationSupportChildDirectoryURLInDomain:createIfNeeded:childName:descriptor:]();
    }
  }
  BOOL v14 = [v12 URLByAppendingPathComponent:v10 isDirectory:1];
  v15 = v14;
  if (v7)
  {
    id v28 = 0;
    char DirectoryAtURL = createDirectoryAtURL(v14, a3, (uint64_t)&v28);
    id v17 = v28;
    if ((DirectoryAtURL & 1) == 0)
    {
      uint64_t v18 = +[RMLog locations];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v30 = v11;
        __int16 v31 = 2114;
        v32 = v15;
        __int16 v33 = 2114;
        id v34 = v17;
        _os_log_error_impl(&dword_224784000, v18, OS_LOG_TYPE_ERROR, "Unable to create %{public}@ directory at %{public}@: %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v17 = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__RMLocations__applicationSupportChildDirectoryURLInDomain_createIfNeeded_childName_descriptor___block_invoke;
  block[3] = &unk_2646DD1E8;
  id v26 = v11;
  id v19 = v15;
  id v27 = v19;
  uint64_t v20 = _applicationSupportChildDirectoryURLInDomain_createIfNeeded_childName_descriptor__onceToken;
  id v21 = v11;
  if (v20 != -1) {
    dispatch_once(&_applicationSupportChildDirectoryURLInDomain_createIfNeeded_childName_descriptor__onceToken, block);
  }
  v22 = v27;
  id v23 = v19;

  return v23;
}

void __96__RMLocations__applicationSupportChildDirectoryURLInDomain_createIfNeeded_childName_descriptor___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[RMLog locations];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_224784000, v2, OS_LOG_TYPE_INFO, "%{public}@ directory is %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

+ (id)_dataVaultChildDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4 childName:(id)a5 descriptor:(id)a6
{
  BOOL v7 = a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [a1 dataVaultDirectoryURLInDomain:a3 createIfNeeded:v7];
  if (!v12)
  {
    id v13 = +[RMLog locations];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[RMLocations _dataVaultChildDirectoryURLInDomain:createIfNeeded:childName:descriptor:]();
    }
  }
  BOOL v14 = [v12 URLByAppendingPathComponent:v10 isDirectory:1];
  v15 = v14;
  if (v7)
  {
    id v28 = 0;
    char DirectoryAtURL = createDirectoryAtURL(v14, a3, (uint64_t)&v28);
    id v17 = v28;
    if ((DirectoryAtURL & 1) == 0)
    {
      uint64_t v18 = +[RMLog locations];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v30 = v11;
        __int16 v31 = 2114;
        v32 = v15;
        __int16 v33 = 2114;
        id v34 = v17;
        _os_log_error_impl(&dword_224784000, v18, OS_LOG_TYPE_ERROR, "Unable to create %{public}@ directory at %{public}@: %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v17 = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__RMLocations__dataVaultChildDirectoryURLInDomain_createIfNeeded_childName_descriptor___block_invoke;
  block[3] = &unk_2646DD1E8;
  id v26 = v11;
  id v19 = v15;
  id v27 = v19;
  uint64_t v20 = _dataVaultChildDirectoryURLInDomain_createIfNeeded_childName_descriptor__onceToken;
  id v21 = v11;
  if (v20 != -1) {
    dispatch_once(&_dataVaultChildDirectoryURLInDomain_createIfNeeded_childName_descriptor__onceToken, block);
  }
  v22 = v27;
  id v23 = v19;

  return v23;
}

void __87__RMLocations__dataVaultChildDirectoryURLInDomain_createIfNeeded_childName_descriptor___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[RMLog locations];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_224784000, v2, OS_LOG_TYPE_INFO, "%{public}@ directory is %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

+ (id)URLWithResolvedSymlinksFromURL:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 path];
  int v7 = open((const char *)[v6 fileSystemRepresentation], 0x8000, 0);

  if (v7 >= 1)
  {
    if (fcntl(v7, 50, v24) != -1)
    {
      uint64_t v8 = [NSString stringWithUTF8String:v24];
      close(v7);
      if (v8)
      {
        a4 = [NSURL fileURLWithPath:v8];

        goto LABEL_17;
      }
      goto LABEL_16;
    }
    uint64_t v14 = *__error();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      +[RMLocations URLWithResolvedSymlinksFromURL:error:]();
      if (a4) {
        goto LABEL_12;
      }
    }
    else if (a4)
    {
LABEL_12:
      v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v16 = *MEMORY[0x263F08438];
      uint64_t v22 = *MEMORY[0x263F08590];
      id v23 = v5;
      id v17 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      uint64_t v18 = [v15 errorWithDomain:v16 code:v14 userInfo:v17];

      if (v18) {
        *a4 = v18;
      }
    }
    close(v7);
LABEL_16:
    a4 = 0;
    goto LABEL_17;
  }
  uint64_t v9 = *__error();
  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_7;
  }
  +[RMLocations URLWithResolvedSymlinksFromURL:error:]();
  if (a4)
  {
LABEL_7:
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08438];
    uint64_t v20 = *MEMORY[0x263F08590];
    id v21 = v5;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v13 = [v10 errorWithDomain:v11 code:v9 userInfo:v12];

    if (v13) {
      *a4 = v13;
    }

    goto LABEL_16;
  }
LABEL_17:

  return a4;
}

void __47__RMLocations__rootDirectoryURLInDomain_error___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_224784000, log, OS_LOG_TYPE_ERROR, "Failed to get system container path. Caller must be rmdctl or remotemanagementd.", v1, 2u);
}

+ (void)baseDirectoryURLInDomain:createIfNeeded:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_224784000, v0, v1, "Unable to create root directory at %{public}@: %{public}@");
}

+ (void)baseDirectoryURLInDomain:createIfNeeded:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Failed to find root directory: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)dataVaultDirectoryURLInDomain:createIfNeeded:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_224784000, v0, v1, "Unable to create Data Vault at %{public}@: %{public}@");
}

+ (void)dataVaultDirectoryURLInDomain:createIfNeeded:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Failed to find Data Vault directory: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)homeDirectoryURL
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_224784000, &_os_log_internal, v0, "Failed to find Home directory: %{public}@", v1, v2, v3, v4, v5);
}

+ (void)darwinUserDirectoryURL
{
}

+ (void)darwinCacheDirectoryURL
{
}

+ (void)darwinTemporaryDirectoryURL
{
}

+ (void)fixFilePermissionsForURL:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Could not get file attributes: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)fixFilePermissionsForURL:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Could not set file attributes: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)fixFilePermissionsForURL:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Could not set file attributes for permissions: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_applicationSupportChildDirectoryURLInDomain:createIfNeeded:childName:descriptor:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Failed to find Application Support directory: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_dataVaultChildDirectoryURLInDomain:createIfNeeded:childName:descriptor:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Failed to find data vault directory: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)URLWithResolvedSymlinksFromURL:error:.cold.1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_224784000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to resolve symlinks for path %@: %{errno}d", v0, 0x12u);
}

@end