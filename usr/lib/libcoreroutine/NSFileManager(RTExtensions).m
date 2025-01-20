@interface NSFileManager(RTExtensions)
+ (NSObject)routineCacheDirectoryPath;
+ (__CFString)defaultsDomain;
+ (id)crashReporterPath;
+ (id)frameworkDirectoryPath;
+ (id)pathInCacheDirectory:()RTExtensions;
+ (id)routinePreferencesPath;
+ (id)sortedContentsOfDirectoryAtURL:()RTExtensions withExtension:;
+ (id)userCacheDirectoryPath;
+ (id)userLibraryPath;
+ (id)userPreferencesPath;
+ (uint64_t)frameworkBundle;
+ (uint64_t)sortFilesByName:()RTExtensions;
@end

@implementation NSFileManager(RTExtensions)

+ (uint64_t)frameworkBundle
{
  return [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreRoutine"];
}

+ (id)frameworkDirectoryPath
{
  v0 = [MEMORY[0x1E4F28CB8] frameworkBundle];
  v1 = [v0 bundleURL];
  v2 = [v1 absoluteString];

  return v2;
}

+ (__CFString)defaultsDomain
{
  return @"com.apple.routined";
}

+ (id)userCacheDirectoryPath
{
  v0 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  if ([v0 count])
  {
    v1 = [v0 firstObject];
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

+ (NSObject)routineCacheDirectoryPath
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [a1 userCacheDirectoryPath];
  if (v1)
  {
    v2 = (void *)v1;
    uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultsDomain];
    v4 = [v2 stringByAppendingPathComponent:v3];

    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    LOBYTE(v3) = [v5 fileExistsAtPath:v4];

    if ((v3 & 1) != 0
      || ([MEMORY[0x1E4F28CB8] defaultManager],
          v6 = objc_claimAutoreleasedReturnValue(),
          id v12 = 0,
          int v7 = [v6 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v12], v8 = v12, v6, v7)&& !v8)
    {
      v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v4;
        _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "routine cache directory path, %@", buf, 0xCu);
      }
    }
    else
    {
      v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v4;
        __int16 v15 = 2112;
        id v16 = v8;
        _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "failed to create %@, error, %@", buf, 0x16u);
      }

      v9 = v4;
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)pathInCacheDirectory:()RTExtensions
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315394;
      v23 = "+[NSFileManager(RTExtensions) pathInCacheDirectory:]";
      __int16 v24 = 1024;
      int v25 = 160;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: path (in %s:%d)", (uint8_t *)&v22, 0x12u);
    }
  }
  v5 = [MEMORY[0x1E4F28CB8] routineCacheDirectoryPath];
  v6 = v5;
  if (v3)
  {
    if (v5)
    {
      int v7 = (void *)MEMORY[0x1E4F1CB10];
      id v8 = [v5 stringByAppendingPathComponent:v3];
      v9 = [v7 fileURLWithPath:v8];

      v10 = [v9 standardizedURL];
      v11 = [v9 absoluteString];
      id v12 = [v10 absoluteString];
      int v13 = [v11 isEqualToString:v12];

      if (v13)
      {
        v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v21 = [v10 path];
          int v22 = 138412290;
          v23 = v21;
          _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "path in cache directory, %@", (uint8_t *)&v22, 0xCu);
        }
        id v15 = [v10 path];
      }
      else
      {
        id v15 = 0;
      }
    }
    else
    {
      v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136315394;
        v23 = "+[NSFileManager(RTExtensions) pathInCacheDirectory:]";
        __int16 v24 = 1024;
        int v25 = 172;
        _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Cache path was nil (in %s:%d)", (uint8_t *)&v22, 0x12u);
      }

      v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22) = 0;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Cache path was nil", (uint8_t *)&v22, 2u);
      }

      id v15 = 0;
    }
  }
  else
  {
    if (!v5)
    {
      id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136315394;
        v23 = "+[NSFileManager(RTExtensions) pathInCacheDirectory:]";
        __int16 v24 = 1024;
        int v25 = 164;
        _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Cache path was nil (in %s:%d)", (uint8_t *)&v22, 0x12u);
      }

      uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22) = 0;
        _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Cache path was nil", (uint8_t *)&v22, 2u);
      }
    }
    id v15 = v6;
  }

  return v15;
}

+ (id)userLibraryPath
{
  v0 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  if ([v0 count])
  {
    uint64_t v1 = [v0 firstObject];
  }
  else
  {
    uint64_t v1 = 0;
  }

  return v1;
}

+ (id)userPreferencesPath
{
  uint64_t v1 = [a1 userLibraryPath];
  v2 = v1;
  if (v1)
  {
    id v3 = [v1 stringByAppendingPathComponent:@"Preferences"];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (id)routinePreferencesPath
{
  v2 = [a1 userPreferencesPath];
  if (v2)
  {
    id v3 = [a1 defaultsDomain];
    v4 = [v2 stringByAppendingPathComponent:v3];
    v5 = [v4 stringByAppendingPathExtension:@"plist"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)crashReporterPath
{
  uint64_t v1 = [a1 userLibraryPath];
  if (v1)
  {
    v2 = [&unk_1F3452B08 componentsJoinedByString:@"/"];
    id v3 = [v1 stringByAppendingPathComponent:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (id)sortedContentsOfDirectoryAtURL:()RTExtensions withExtension:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v15 = 0;
  v9 = [v8 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:0 options:3 error:&v15];
  id v10 = v15;

  if (v10)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "encountered error getting contents of directory, %@, error, %@", buf, 0x16u);
    }
    id v12 = 0;
  }
  else
  {
    v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"pathExtension", v7];
    uint64_t v13 = [v9 filteredArrayUsingPredicate:v11];

    id v12 = [a1 sortFilesByName:v13];
    v9 = (void *)v13;
  }

  return v12;
}

+ (uint64_t)sortFilesByName:()RTExtensions
{
  return [a3 sortedArrayUsingComparator:&__block_literal_global_27];
}

@end