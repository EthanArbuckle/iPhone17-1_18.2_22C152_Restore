@interface NSKeyedUnarchiver(Secure)
+ (id)secureUnarchiveObjectOfClasses:()Secure withData:;
+ (id)secureUnarchiveObjectOfClasses:()Secure withFile:;
@end

@implementation NSKeyedUnarchiver(Secure)

+ (id)secureUnarchiveObjectOfClasses:()Secure withFile:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F08850] defaultManager];
  int v9 = [v8 fileExistsAtPath:v7];

  if (v9)
  {
    id v17 = 0;
    v10 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v7 options:0 error:&v17];
    id v11 = v17;
    if (v11)
    {
      v12 = psd_log();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

      if (v13)
      {
        v14 = psd_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          +[NSKeyedUnarchiver(Secure) secureUnarchiveObjectOfClasses:withFile:]((uint64_t)v7, v11, v14);
        }
      }
      v15 = 0;
    }
    else
    {
      v15 = [a1 secureUnarchiveObjectOfClasses:v6 withData:v10];
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)secureUnarchiveObjectOfClasses:()Secure withData:
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[[a1 alloc] initForReadingFromData:v7 error:0];
  int v9 = [v8 decodeObjectOfClasses:v6 forKey:*MEMORY[0x263F081D0]];
  [v8 finishDecoding];
  id v10 = v9;

  return v10;
}

+ (void)secureUnarchiveObjectOfClasses:()Secure withFile:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend(a2, "psy_safeDescription");
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  int v9 = v5;
  _os_log_error_impl(&dword_2179FA000, a3, OS_LOG_TYPE_ERROR, "Failed to read data from file %{public}@ with error %{public}@", (uint8_t *)&v6, 0x16u);
}

+ (void)secureUnarchiveObjectOfClasses:()Secure withData:.cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_2179FA000, log, OS_LOG_TYPE_ERROR, "Failed to unarchive data of type %{public}@ with exception %{public}@", buf, 0x16u);
}

@end