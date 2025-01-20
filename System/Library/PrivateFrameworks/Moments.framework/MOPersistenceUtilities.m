@interface MOPersistenceUtilities
+ (id)getBundlingJSONURLWithDirectorySuffix:(id)a3;
+ (id)userCacheDirectoryPath;
+ (id)userDataDumpDirectoryPathWithSuffix:(id)a3;
+ (void)userCacheDirectoryPath;
@end

@implementation MOPersistenceUtilities

+ (id)userCacheDirectoryPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  if ([v2 count])
  {
    v3 = [v2 firstObject];
    v4 = [v3 stringByAppendingPathComponent:@"com.apple.momentsd"];

    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v6 = [v5 fileExistsAtPath:v4];

    if ((v6 & 1) != 0
      || ([MEMORY[0x1E4F28CB8] defaultManager],
          v7 = objc_claimAutoreleasedReturnValue(),
          id v14 = 0,
          int v8 = [v7 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v14], v9 = v14, v7, v8)&& !v9)
    {
      v10 = _mo_log_facility_get_os_log(MOLogFacilityPersistenceManager);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        +[MOPersistenceUtilities userCacheDirectoryPath];
      }

      id v11 = v4;
    }
    else
    {
      v12 = _mo_log_facility_get_os_log(MOLogFacilityPersistenceManager);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        +[MOPersistenceUtilities userCacheDirectoryPath]();
      }

      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)userDataDumpDirectoryPathWithSuffix:(id)a3
{
  id v3 = a3;
  v4 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  if ([v4 count])
  {
    v5 = [v4 firstObject];
    char v6 = [v5 stringByAppendingPathComponent:@"com.apple.momentsd"];
    v7 = [v6 stringByAppendingPathComponent:@"Temp"];
    int v8 = [v7 stringByAppendingPathComponent:v3];

    if (!v8) {
      goto LABEL_6;
    }
    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v10 = [v9 fileExistsAtPath:v8];

    if (v10) {
      goto LABEL_6;
    }
    id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v17 = 0;
    int v12 = [v11 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v17];
    id v13 = v17;

    if (!v12 || v13)
    {
      v16 = _mo_log_facility_get_os_log(MOLogFacilityPersistenceManager);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[MOPersistenceUtilities userDataDumpDirectoryPathWithSuffix:]();
      }

      id v14 = 0;
    }
    else
    {
LABEL_6:
      id v14 = v8;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (id)getBundlingJSONURLWithDirectorySuffix:(id)a3
{
  id v3 = +[MOPersistenceUtilities userDataDumpDirectoryPathWithSuffix:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];
  }
  else
  {
    v5 = _mo_log_facility_get_os_log(MOLogFacilityPersistenceManager);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[MOPersistenceUtilities getBundlingJSONURLWithDirectorySuffix:](v5);
    }

    v4 = 0;
  }

  return v4;
}

+ (void)userCacheDirectoryPath
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_1D24AE000, v0, OS_LOG_TYPE_DEBUG, "failed to create %@, error, %@", v1, 0x16u);
}

+ (void)userDataDumpDirectoryPathWithSuffix:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_1D24AE000, v0, OS_LOG_TYPE_ERROR, "failed to create %@, error, %@", v1, 0x16u);
}

+ (void)getBundlingJSONURLWithDirectorySuffix:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D24AE000, log, OS_LOG_TYPE_ERROR, "Failed to get bundling data dump directory.", v1, 2u);
}

@end