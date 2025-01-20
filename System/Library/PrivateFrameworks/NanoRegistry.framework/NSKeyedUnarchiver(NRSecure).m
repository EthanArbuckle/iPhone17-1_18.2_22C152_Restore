@interface NSKeyedUnarchiver(NRSecure)
+ (id)nr_secureUnarchiveObjectOfClasses:()NRSecure withData:;
+ (id)nr_secureUnarchiveObjectOfClasses:()NRSecure withFile:;
@end

@implementation NSKeyedUnarchiver(NRSecure)

+ (id)nr_secureUnarchiveObjectOfClasses:()NRSecure withFile:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v9 = [v8 fileExistsAtPath:v7];

  if (v9)
  {
    id v18 = 0;
    v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v7 options:0 error:&v18];
    id v11 = v18;
    if (v11)
    {
      v12 = nr_framework_log();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

      if (v13)
      {
        v14 = nr_framework_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v17 = objc_msgSend(v11, "nr_safeDescription");
          *(_DWORD *)buf = 138543618;
          id v20 = v7;
          __int16 v21 = 2114;
          v22 = v17;
          _os_log_error_impl(&dword_1A356E000, v14, OS_LOG_TYPE_ERROR, "Failed to read data from file %{public}@ with error %{public}@", buf, 0x16u);
        }
      }
      v15 = 0;
    }
    else
    {
      v15 = objc_msgSend(a1, "nr_secureUnarchiveObjectOfClasses:withData:", v6, v10);
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)nr_secureUnarchiveObjectOfClasses:()NRSecure withData:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v17 = 0;
  v8 = (void *)[[a1 alloc] initForReadingFromData:v7 error:&v17];
  id v9 = v17;
  v10 = [v8 decodeObjectOfClasses:v6 forKey:*MEMORY[0x1E4F284E8]];
  [v8 finishDecoding];
  if (v9)
  {
    id v11 = nr_framework_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      BOOL v13 = nr_framework_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v16 = objc_msgSend(v9, "nr_safeDescription");
        *(_DWORD *)buf = 138543618;
        id v19 = v6;
        __int16 v20 = 2114;
        __int16 v21 = v16;
        _os_log_error_impl(&dword_1A356E000, v13, OS_LOG_TYPE_ERROR, "Failed to unarchive data of type %{public}@ with error %{public}@", buf, 0x16u);
      }
    }
  }
  id v14 = v10;

  return v14;
}

@end