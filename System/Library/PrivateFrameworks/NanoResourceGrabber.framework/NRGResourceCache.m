@interface NRGResourceCache
+ (id)cacheDirPathForAppBundleID:(id)a3 withPairedDeviceStorePath:(id)a4;
+ (id)cacheDirPathForPairedDevice;
+ (id)cacheDirPathForPairedDeviceStorePath:(id)a3;
+ (id)cachePathForIconVariant:(int)a3 inBundleID:(id)a4 withPairedDeviceStorePath:(id)a5;
+ (id)iconCacheDirPathForAppBundleID:(id)a3 withPairedDeviceStorePath:(id)a4;
+ (id)iconForIconVariant:(int)a3 inBundleID:(id)a4 withPairedDeviceStorePath:(id)a5;
+ (void)createCachePathIfNecessaryWithPairedDeviceStorePath:(id)a3;
+ (void)invalidateBundleID:(id)a3 withPairedDeviceStorePath:(id)a4;
+ (void)invalidatePairedDevice:(id)a3;
+ (void)setIcon:(id)a3 forIconVariant:(int)a4 inBundleID:(id)a5 withPairedDeviceStorePath:(id)a6;
@end

@implementation NRGResourceCache

+ (void)setIcon:(id)a3 forIconVariant:(int)a4 inBundleID:(id)a5 withPairedDeviceStorePath:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  v11 = a5;
  id v12 = a6;
  v13 = [a1 iconCacheDirPathForAppBundleID:v11 withPairedDeviceStorePath:v12];
  if (v13)
  {
    v14 = [MEMORY[0x263F08850] defaultManager];
    char v15 = [v14 fileExistsAtPath:v13];

    if (v15)
    {
      v16 = 0;
    }
    else
    {
      [a1 createCachePathIfNecessaryWithPairedDeviceStorePath:v12];
      v17 = [MEMORY[0x263F08850] defaultManager];
      id v24 = 0;
      char v18 = [v17 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v24];
      v16 = v24;

      if ((v18 & 1) == 0)
      {
        v20 = nrg_daemon_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v26 = v16;
          __int16 v27 = 2112;
          v28 = v13;
          _os_log_impl(&dword_21C50B000, v20, OS_LOG_TYPE_DEFAULT, "setIcon: Error creating cache directory %@ path %@", buf, 0x16u);
        }
        goto LABEL_13;
      }
    }
    v19 = v16;
    v20 = [a1 cachePathForIconVariant:v8 inBundleID:v11 withPairedDeviceStorePath:v12];
    v23 = v16;
    char v21 = [v10 writeToFile:v20 options:268435457 error:&v23];
    v16 = v23;

    if ((v21 & 1) == 0)
    {
      v22 = nrg_daemon_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v26 = v20;
        __int16 v27 = 2112;
        v28 = v16;
        _os_log_impl(&dword_21C50B000, v22, OS_LOG_TYPE_DEFAULT, "setIcon: Failed writing icon path %@ with error: %@", buf, 0x16u);
      }
    }
LABEL_13:

    goto LABEL_14;
  }
  v16 = nrg_daemon_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v26 = (int)v8;
    __int16 v27 = 2112;
    v28 = v11;
    __int16 v29 = 2112;
    id v30 = v12;
    _os_log_impl(&dword_21C50B000, v16, OS_LOG_TYPE_DEFAULT, "setIcon: Error creating icon dir path: iconVariant=%ld appBundleID=%@ pairedDeviceStorePath=%@", buf, 0x20u);
  }
LABEL_14:
}

+ (id)iconForIconVariant:(int)a3 inBundleID:(id)a4 withPairedDeviceStorePath:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = [a1 cachePathForIconVariant:v6 inBundleID:v8 withPairedDeviceStorePath:v9];
  if (v10)
  {
    id v15 = 0;
    v11 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v10 options:0 error:&v15];
    id v12 = v15;
    if (v12)
    {
      v13 = nrg_daemon_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[NRGResourceCache iconForIconVariant:inBundleID:withPairedDeviceStorePath:]((uint64_t)v12, v13);
      }
    }
  }
  else
  {
    id v12 = nrg_daemon_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v17 = (int)v6;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_error_impl(&dword_21C50B000, v12, OS_LOG_TYPE_ERROR, "iconForIconVariant: Error creating icon path: iconVariant=%ld appBundleID=%@ pairedDeviceStorePath=%@", buf, 0x20u);
    }
    v11 = 0;
  }

  return v11;
}

+ (void)invalidateBundleID:(id)a3 withPairedDeviceStorePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 cacheDirPathForAppBundleID:v6 withPairedDeviceStorePath:v7];
  if (v8)
  {
    id v9 = [MEMORY[0x263F08850] defaultManager];
    int v10 = [v9 fileExistsAtPath:v8];

    if (v10)
    {
      v11 = [MEMORY[0x263F08850] defaultManager];
      id v15 = 0;
      char v12 = [v11 removeItemAtPath:v8 error:&v15];
      v13 = v15;

      if ((v12 & 1) == 0)
      {
        v14 = nrg_daemon_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          +[NRGResourceCache invalidateBundleID:withPairedDeviceStorePath:]();
        }
      }
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = nrg_daemon_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[NRGResourceCache invalidateBundleID:withPairedDeviceStorePath:]();
    }
  }
}

+ (void)invalidatePairedDevice:(id)a3
{
  id v4 = a3;
  v5 = [a1 cacheDirPathForPairedDeviceStorePath:v4];
  if (!v5)
  {
    id v6 = nrg_daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[NRGResourceCache invalidatePairedDevice:]((uint64_t)v4, v6);
    }
  }
  id v7 = [MEMORY[0x263F08850] defaultManager];
  int v8 = [v7 fileExistsAtPath:v5];

  if (v8)
  {
    id v9 = [MEMORY[0x263F08850] defaultManager];
    id v13 = 0;
    char v10 = [v9 removeItemAtPath:v5 error:&v13];
    id v11 = v13;

    if ((v10 & 1) == 0)
    {
      char v12 = nrg_daemon_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[NRGResourceCache invalidatePairedDevice:]();
      }
    }
  }
  else
  {
    id v11 = 0;
  }
}

+ (id)cacheDirPathForPairedDevice
{
  v2 = NRGGetActivePairedDeviceStorePath();
  v3 = [v2 stringByAppendingPathComponent:@"com.apple.private.nanoresourcegrabber"];

  return v3;
}

+ (id)cacheDirPathForPairedDeviceStorePath:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 stringByAppendingPathComponent:@"com.apple.private.nanoresourcegrabber"];
    id v6 = [v5 stringByAppendingPathComponent:@"received"];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)cacheDirPathForAppBundleID:(id)a3 withPairedDeviceStorePath:(id)a4
{
  if (a3)
  {
    id v6 = a3;
    id v7 = [a1 cacheDirPathForPairedDeviceStorePath:a4];
    int v8 = [v7 stringByAppendingPathComponent:v6];
  }
  else
  {
    int v8 = 0;
  }
  return v8;
}

+ (void)createCachePathIfNecessaryWithPairedDeviceStorePath:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [a1 cacheDirPathForPairedDeviceStorePath:a3];
  id v4 = [MEMORY[0x263F08850] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) == 0)
  {
    id v6 = [MEMORY[0x263F08850] defaultManager];
    id v16 = 0;
    char v7 = [v6 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v16];
    id v8 = v16;

    if (v7)
    {
      id v9 = [NSURL fileURLWithPath:v3 isDirectory:1];
      uint64_t v10 = *MEMORY[0x263EFF6B0];
      id v15 = v8;
      char v11 = [v9 setResourceValue:MEMORY[0x263EFFA88] forKey:v10 error:&v15];
      id v12 = v15;

      id v13 = nrg_daemon_log();
      v14 = v13;
      if (v11)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v18 = v3;
          _os_log_impl(&dword_21C50B000, v14, OS_LOG_TYPE_DEFAULT, "createCachePathIfNecessary created and excludedFromBackup %@", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        +[NRGResourceCache createCachePathIfNecessaryWithPairedDeviceStorePath:]();
      }
    }
    else
    {
      id v9 = nrg_daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[NRGResourceCache createCachePathIfNecessaryWithPairedDeviceStorePath:]();
      }
      id v12 = v8;
    }
  }
}

+ (id)iconCacheDirPathForAppBundleID:(id)a3 withPairedDeviceStorePath:(id)a4
{
  id v4 = [a1 cacheDirPathForAppBundleID:a3 withPairedDeviceStorePath:a4];
  char v5 = v4;
  if (v4)
  {
    id v6 = [v4 stringByAppendingPathComponent:@"icons"];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)cachePathForIconVariant:(int)a3 inBundleID:(id)a4 withPairedDeviceStorePath:(id)a5
{
  uint64_t v5 = *(void *)&a3;
  id v6 = [a1 iconCacheDirPathForAppBundleID:a4 withPairedDeviceStorePath:a5];
  char v7 = objc_msgSend(NSString, "stringWithFormat:", @"icon_%d.png", v5);
  if (v6)
  {
    id v8 = [v6 stringByAppendingPathComponent:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (void)iconForIconVariant:(uint64_t)a1 inBundleID:(NSObject *)a2 withPairedDeviceStorePath:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C50B000, a2, OS_LOG_TYPE_ERROR, "iconForIconVariant: Error reading data %@", (uint8_t *)&v2, 0xCu);
}

+ (void)invalidateBundleID:withPairedDeviceStorePath:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C50B000, v0, v1, "invalidateBundleID: Error creating bundle cache dir path: appBundleID=%@ pairedDeviceStorePath=%@");
}

+ (void)invalidateBundleID:withPairedDeviceStorePath:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C50B000, v0, v1, "invalidateBundleID: Failed invalidating cache at %@, error %@");
}

+ (void)invalidatePairedDevice:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C50B000, v0, v1, "invalidatePairedDevice: Failed invalidating paired device cache at %@, error %@");
}

+ (void)invalidatePairedDevice:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C50B000, a2, OS_LOG_TYPE_ERROR, "invalidatePairedDevice: Error creating bundle cache dir path: pairedDeviceStorePath=%@", (uint8_t *)&v2, 0xCu);
}

+ (void)createCachePathIfNecessaryWithPairedDeviceStorePath:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C50B000, v0, v1, "createCachePathIfNecessary: Error setting attributes on cache directory %@ path %@");
}

+ (void)createCachePathIfNecessaryWithPairedDeviceStorePath:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C50B000, v0, v1, "createCachePathIfNecessary: Error creating cache directory %@ path %@");
}

@end