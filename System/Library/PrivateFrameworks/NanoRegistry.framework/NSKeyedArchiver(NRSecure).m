@interface NSKeyedArchiver(NRSecure)
+ (id)nr_secureArchivedDataWithRootObject:()NRSecure;
+ (uint64_t)nr_secureArchiveRootObject:()NRSecure toFile:;
+ (uint64_t)nr_secureArchiveRootObject:()NRSecure toFile:withOptions:;
@end

@implementation NSKeyedArchiver(NRSecure)

+ (id)nr_secureArchivedDataWithRootObject:()NRSecure
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v14 = 0;
    v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v14];
    id v5 = v14;
    if (v5)
    {
      v6 = nr_framework_log();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (v7)
      {
        v8 = nr_framework_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v10 = objc_msgSend(v5, "nr_safeDescription");
          v11 = (objc_class *)objc_opt_class();
          v12 = NSStringFromClass(v11);
          *(_DWORD *)buf = 138543618;
          v16 = v10;
          __int16 v17 = 2112;
          v18 = v12;
          _os_log_error_impl(&dword_1A356E000, v8, OS_LOG_TYPE_ERROR, "Got error (%{public}@) archiving (%@)", buf, 0x16u);
        }
      }
    }
    id v9 = v4;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (uint64_t)nr_secureArchiveRootObject:()NRSecure toFile:
{
  return objc_msgSend(a1, "nr_secureArchiveRootObject:toFile:withOptions:", a3, a4, 1);
}

+ (uint64_t)nr_secureArchiveRootObject:()NRSecure toFile:withOptions:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = objc_msgSend(a1, "nr_secureArchivedDataWithRootObject:", v8);
  if (v10)
  {
    id v11 = [v9 stringByDeletingLastPathComponent];
    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v13 = [v12 fileExistsAtPath:v11];

    if (v13)
    {
      id v14 = 0;
    }
    else
    {
      v22 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v39 = 0;
      [v22 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v39];
      id v14 = v39;

      if (v14)
      {
        v23 = nr_framework_log();
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

        if (v24)
        {
          v25 = nr_framework_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v33 = objc_msgSend(v14, "nr_safeDescription");
            v34 = (objc_class *)objc_opt_class();
            v35 = NSStringFromClass(v34);
            *(_DWORD *)buf = 138543874;
            v41 = v33;
            __int16 v42 = 2114;
            id v43 = v11;
            __int16 v44 = 2112;
            v45 = v35;
            _os_log_error_impl(&dword_1A356E000, v25, OS_LOG_TYPE_ERROR, "Error (%{public}@) creating directory (%{public}@) for (%@)", buf, 0x20u);
          }
        }
      }
    }

    id v38 = 0;
    uint64_t v21 = [v10 writeToFile:v9 options:a5 error:&v38];
    v20 = v38;
    if (v20)
    {
      v26 = nr_framework_log();
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

      if (v27)
      {
        v28 = nr_framework_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v30 = [v20 nr_safeDescription];
          v31 = (objc_class *)objc_opt_class();
          v32 = NSStringFromClass(v31);
          *(_DWORD *)buf = 138543618;
          v41 = v30;
          __int16 v42 = 2112;
          id v43 = v32;
          _os_log_error_impl(&dword_1A356E000, v28, OS_LOG_TYPE_ERROR, "Error (%{public}@) writing encoded data for (%@)", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v16 = [v15 fileExistsAtPath:v9];

    if (!v16)
    {
      uint64_t v21 = 1;
      goto LABEL_22;
    }
    __int16 v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v37 = 0;
    [v17 removeItemAtPath:v9 error:&v37];
    id v11 = v37;

    if (!v11)
    {
      uint64_t v21 = 1;
      goto LABEL_21;
    }
    v18 = nr_framework_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

    if (!v19)
    {
      uint64_t v21 = 0;
      goto LABEL_21;
    }
    v20 = nr_framework_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v36 = objc_msgSend(v11, "nr_safeDescription");
      *(_DWORD *)buf = 138543618;
      v41 = v36;
      __int16 v42 = 2114;
      id v43 = v9;
      _os_log_error_impl(&dword_1A356E000, v20, OS_LOG_TYPE_ERROR, "Error (%{public}@) deleting file (%{public}@)", buf, 0x16u);
    }
    uint64_t v21 = 0;
  }

LABEL_21:
LABEL_22:

  return v21;
}

@end