@interface NSKeyedArchiver(Secure)
+ (id)secureArchivedDataWithRootObject:()Secure;
+ (uint64_t)secureArchiveRootObject:()Secure toFile:;
+ (uint64_t)secureArchiveRootObject:()Secure toFile:withOptions:;
@end

@implementation NSKeyedArchiver(Secure)

+ (id)secureArchivedDataWithRootObject:()Secure
{
  id v3 = a3;
  if (v3)
  {
    id v7 = 0;
    v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v7];
    id v5 = v7;
    if (v5) {
      objc_exception_throw(v5);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (uint64_t)secureArchiveRootObject:()Secure toFile:
{
  return [a1 secureArchiveRootObject:a3 toFile:a4 withOptions:1];
}

+ (uint64_t)secureArchiveRootObject:()Secure toFile:withOptions:
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [a1 secureArchivedDataWithRootObject:v8];
  if (v10)
  {
    id v11 = [v9 stringByDeletingLastPathComponent];
    v12 = [MEMORY[0x263F08850] defaultManager];
    char v13 = [v12 fileExistsAtPath:v11];

    if (v13)
    {
      id v14 = 0;
    }
    else
    {
      v22 = [MEMORY[0x263F08850] defaultManager];
      id v35 = 0;
      [v22 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v35];
      id v14 = v35;

      if (v14)
      {
        v23 = psd_log();
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

        if (v24)
        {
          v25 = psd_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v30 = objc_msgSend(v14, "psy_safeDescription");
            v31 = (objc_class *)objc_opt_class();
            v32 = NSStringFromClass(v31);
            *(_DWORD *)buf = 138543874;
            v37 = v30;
            __int16 v38 = 2114;
            id v39 = v11;
            __int16 v40 = 2112;
            v41 = v32;
            _os_log_error_impl(&dword_2179FA000, v25, OS_LOG_TYPE_ERROR, "Error (%{public}@) creating directory (%{public}@) for (%@)", buf, 0x20u);
          }
        }
      }
    }

    id v34 = 0;
    uint64_t v18 = [v10 writeToFile:v9 options:a5 error:&v34];
    v21 = v34;
    if (v21)
    {
      v26 = psd_log();
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

      if (v27)
      {
        v28 = psd_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          +[NSKeyedArchiver(Secure) secureArchiveRootObject:toFile:withOptions:](v21);
        }
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  v15 = [MEMORY[0x263F08850] defaultManager];
  int v16 = [v15 fileExistsAtPath:v9];

  if (!v16)
  {
    uint64_t v18 = 1;
    goto LABEL_22;
  }
  v17 = [MEMORY[0x263F08850] defaultManager];
  id v33 = 0;
  [v17 removeItemAtPath:v9 error:&v33];
  id v11 = v33;

  uint64_t v18 = v11 == 0;
  if (v11)
  {
    v19 = psd_log();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

    if (!v20)
    {
      uint64_t v18 = 0;
      goto LABEL_21;
    }
    v21 = psd_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[NSKeyedArchiver(Secure) secureArchiveRootObject:toFile:withOptions:](v11);
    }
    uint64_t v18 = 0;
    goto LABEL_20;
  }
LABEL_21:

LABEL_22:
  return v18;
}

+ (void)secureArchiveRootObject:()Secure toFile:withOptions:.cold.1(void *a1)
{
  v1 = objc_msgSend(a1, "psy_safeDescription");
  OUTLINED_FUNCTION_0(&dword_2179FA000, v2, v3, "Error (%{public}@) deleting file (%{public}@)", v4, v5, v6, v7, 2u);
}

+ (void)secureArchiveRootObject:()Secure toFile:withOptions:.cold.2(void *a1)
{
  v1 = objc_msgSend(a1, "psy_safeDescription");
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0(&dword_2179FA000, v3, v4, "Error (%{public}@) writing encoded data for (%@)", v5, v6, v7, v8, 2u);
}

@end