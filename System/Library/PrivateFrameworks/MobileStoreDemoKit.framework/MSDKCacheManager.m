@interface MSDKCacheManager
+ (id)getBundleFilePathFromHash:(id)a3;
+ (id)getDeviceContentPlistCachePath:(id)a3;
+ (id)getDeviceFileCachePath:(id)a3;
+ (id)getDeviceManifestCachePath:(id)a3;
@end

@implementation MSDKCacheManager

+ (id)getDeviceFileCachePath:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v4 = [v3 fileHash];
      if (v4)
      {
        v5 = v4;
        v6 = [v4 hexStringRepresentation];
        v7 = [v6 lowercaseString];

        if (v7)
        {
          v8 = [NSString stringWithFormat:@"%@/%@", @"/var/MSDWorkContainer/.MSD_cache", v7];

          goto LABEL_10;
        }
        v17 = defaultLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          +[MSDKCacheManager getDeviceFileCachePath:]();
        }
      }
      else
      {
        v5 = defaultLogHandle();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          +[MSDKCacheManager getDeviceFileCachePath:]();
        }
      }
    }
    else
    {
      v5 = defaultLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[MSDKCacheManager getDeviceFileCachePath:].cold.4(v5);
      }
    }
  }
  else
  {
    v5 = defaultLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[MSDKCacheManager getDeviceFileCachePath:](v5, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v8 = 0;
LABEL_10:

  return v8;
}

+ (id)getDeviceManifestCachePath:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 filePath];

    if (v5)
    {
      v6 = [v4 filePath];
      v7 = [v6 lastPathComponent];

      v8 = [NSString stringWithFormat:@"%@/%@", @"/var/MSDWorkContainer/.MSD_cache_manifest", v7];
      goto LABEL_4;
    }
    v7 = defaultLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[MSDKCacheManager getDeviceManifestCachePath:]();
    }
  }
  else
  {
    v7 = defaultLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[MSDKCacheManager getDeviceManifestCachePath:](v7, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v8 = 0;
LABEL_4:

  return v8;
}

+ (id)getDeviceContentPlistCachePath:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 partNumber];

    if (v5)
    {
      v6 = [v4 revision];

      if (v6)
      {
        v7 = NSString;
        v8 = [v4 partNumber];
        v9 = [v4 revision];
        uint64_t v10 = [v7 stringWithFormat:@"%@/%@_%d.plist", @"/var/MSDWorkContainer/.MSD_cache_content_plist", v8, objc_msgSend(v9, "intValue")];

        goto LABEL_5;
      }
      uint64_t v12 = defaultLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[MSDKCacheManager getDeviceContentPlistCachePath:](v12, v27, v28, v29, v30, v31, v32, v33);
      }
    }
    else
    {
      uint64_t v12 = defaultLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[MSDKCacheManager getDeviceContentPlistCachePath:](v12, v20, v21, v22, v23, v24, v25, v26);
      }
    }
  }
  else
  {
    uint64_t v12 = defaultLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[MSDKCacheManager getDeviceContentPlistCachePath:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }

  uint64_t v10 = 0;
LABEL_5:

  return v10;
}

+ (id)getBundleFilePathFromHash:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 hexStringRepresentation];
    v6 = [v5 lowercaseString];

    if (v6)
    {
      if ((unint64_t)[v6 length] > 1)
      {
        v7 = NSString;
        v8 = [v6 substringToIndex:2];
        v9 = [v7 stringWithFormat:@"%@/%@", v8, v6];

        goto LABEL_5;
      }
      uint64_t v25 = defaultLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        +[MSDKCacheManager getBundleFilePathFromHash:]();
      }
    }
    else
    {
      v6 = defaultLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[MSDKCacheManager getBundleFilePathFromHash:](v6, v18, v19, v20, v21, v22, v23, v24);
      }
    }
  }
  else
  {
    v6 = defaultLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[MSDKCacheManager getBundleFilePathFromHash:](v6, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v9 = 0;
LABEL_5:

  return v9;
}

+ (void)getDeviceFileCachePath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)getDeviceFileCachePath:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s: Item %{public}@ has empty hash, cannot build device cache path", v2, v3, v4, v5, 2u);
}

+ (void)getDeviceFileCachePath:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s: Failed to generate hash string for item %{public}@", v2, v3, v4, v5, 2u);
}

+ (void)getDeviceFileCachePath:(NSObject *)a1 .cold.4(NSObject *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_class();
  id v3 = v2;
  int v5 = 136315650;
  v6 = "+[MSDKCacheManager getDeviceFileCachePath:]";
  __int16 v7 = 2114;
  v8 = v2;
  __int16 v9 = 2114;
  id v10 = (id)objc_opt_class();
  id v4 = v10;
  _os_log_error_impl(&dword_21EF08000, a1, OS_LOG_TYPE_ERROR, "%s: Item is not of type %{public}@ or %{public}@", (uint8_t *)&v5, 0x20u);
}

+ (void)getDeviceManifestCachePath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)getDeviceManifestCachePath:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s: Manifest %{public}@ has empty filePath, cannot build manifest cache path", v2, v3, v4, v5, 2u);
}

+ (void)getDeviceContentPlistCachePath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)getDeviceContentPlistCachePath:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)getDeviceContentPlistCachePath:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)getBundleFilePathFromHash:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)getBundleFilePathFromHash:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)getBundleFilePathFromHash:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s: Hash string %{public}@ too short", v2, v3, v4, v5, 2u);
}

@end