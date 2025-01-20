@interface NSURL(ICTesting)
- (void)ic_updateFlagToExcludeFromBackupNow:()ICTesting;
@end

@implementation NSURL(ICTesting)

- (void)ic_updateFlagToExcludeFromBackupNow:()ICTesting
{
  v25[2] = *MEMORY[0x263EF8340];
  v5 = os_log_create("com.apple.notes", "Application");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  uint64_t v7 = *MEMORY[0x263EFFAD8];
  if (v6)
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v17 = v7;
    __int16 v18 = 1024;
    int v19 = a3;
    __int16 v20 = 2112;
    v21 = a1;
    _os_log_debug_impl(&dword_20C263000, v5, OS_LOG_TYPE_DEBUG, "Updating backup exclusion flag %@ to %d for %@", buf, 0x1Cu);
  }

  uint64_t v8 = *MEMORY[0x263EFF6B0];
  v24[1] = v7;
  v25[0] = MEMORY[0x263EFFA80];
  v24[0] = v8;
  v9 = [NSNumber numberWithBool:a3];
  v25[1] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

  id v15 = 0;
  char v11 = [a1 setResourceValues:v10 error:&v15];
  id v12 = v15;
  v13 = v12;
  if ((v11 & 1) == 0 && [v12 code] != 4)
  {
    v14 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      uint64_t v17 = v7;
      __int16 v18 = 1024;
      int v19 = a3;
      __int16 v20 = 2112;
      v21 = a1;
      __int16 v22 = 2112;
      v23 = v13;
      _os_log_error_impl(&dword_20C263000, v14, OS_LOG_TYPE_ERROR, "Error marking %@=%d for %@: %@", buf, 0x26u);
    }
  }
}

@end