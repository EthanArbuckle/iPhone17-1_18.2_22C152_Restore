@interface NSFileManager(HKSPFileManager)
+ (id)_bundleCacheDirectory;
+ (id)_bundleCachePathForFile:()HKSPFileManager;
- (id)hkspDataForCacheFileWithName:()HKSPFileManager;
- (uint64_t)hkspFileWithNameExistsInCache:()HKSPFileManager;
- (uint64_t)hkspRemoveFileWithNameFromCache:()HKSPFileManager error:;
- (uint64_t)hkspWriteData:()HKSPFileManager toCacheFileWithName:error:;
@end

@implementation NSFileManager(HKSPFileManager)

+ (id)_bundleCacheDirectory
{
  if (qword_1EB5385C0 != -1) {
    dispatch_once(&qword_1EB5385C0, &__block_literal_global_9);
  }
  v0 = (void *)_MergedGlobals_13;
  return v0;
}

+ (id)_bundleCachePathForFile:()HKSPFileManager
{
  id v4 = a3;
  v5 = [a1 _bundleCacheDirectory];
  v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

- (uint64_t)hkspFileWithNameExistsInCache:()HKSPFileManager
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _bundleCachePathForFile:v4];

  uint64_t v6 = [a1 fileExistsAtPath:v5 isDirectory:0];
  return v6;
}

- (id)hkspDataForCacheFileWithName:()HKSPFileManager
{
  v3 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = [(id)objc_opt_class() _bundleCachePathForFile:v4];

  v7 = (void *)[v5 initWithContentsOfFile:v6];
  return v7;
}

- (uint64_t)hkspWriteData:()HKSPFileManager toCacheFileWithName:error:
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (([a1 hkspFileWithNameExistsInCache:v9] & 1) == 0)
  {
    v10 = [(id)objc_opt_class() _bundleCacheDirectory];
    uint64_t v34 = *MEMORY[0x1E4F28370];
    v35[0] = *MEMORY[0x1E4F28348];
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    id v27 = 0;
    [a1 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:v11 error:&v27];
    id v12 = v27;

    if (v12)
    {
      v13 = HKSPLogForCategory(7uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_opt_class();
        id v24 = v23;
        v25 = [(id)objc_opt_class() _bundleCacheDirectory];
        *(_DWORD *)buf = 138543874;
        id v29 = v23;
        __int16 v30 = 2114;
        id v31 = v25;
        __int16 v32 = 2114;
        id v33 = v12;
        _os_log_error_impl(&dword_1A7E74000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] failed to create directory at %{public}@ with error %{public}@", buf, 0x20u);
      }
      id v14 = v12;
      if (a5)
      {
LABEL_6:
        *a5 = v14;
LABEL_15:

        uint64_t v16 = 0;
        goto LABEL_16;
      }
LABEL_12:
      v19 = HKSPLogForCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v29 = v14;
        _os_log_error_impl(&dword_1A7E74000, v19, OS_LOG_TYPE_ERROR, "Dropping error because caller did not provide an errorOut pointer: %{public}@", buf, 0xCu);
      }

      goto LABEL_15;
    }
  }
  v15 = [(id)objc_opt_class() _bundleCachePathForFile:v9];
  id v26 = 0;
  uint64_t v16 = 1;
  char v17 = [v8 writeToFile:v15 options:1 error:&v26];
  id v14 = v26;

  if ((v17 & 1) == 0)
  {
    v18 = HKSPLogForCategory(7uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v29 = v21;
      __int16 v30 = 2114;
      id v31 = v14;
      id v22 = v21;
      _os_log_error_impl(&dword_1A7E74000, v18, OS_LOG_TYPE_ERROR, "[%{public}@] failed to write data to file with error %{public}@", buf, 0x16u);
    }
    id v14 = v14;
    if (!v14) {
      goto LABEL_15;
    }
    if (a5) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_16:

  return v16;
}

- (uint64_t)hkspRemoveFileWithNameFromCache:()HKSPFileManager error:
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() _bundleCachePathForFile:v6];

  uint64_t v8 = [a1 removeItemAtPath:v7 error:a4];
  return v8;
}

@end