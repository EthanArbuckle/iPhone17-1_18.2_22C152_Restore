@interface PSMigratorUtilities
- (void)_migrateKey:(id)a3 domain:(id)a4 toKey:(id)a5 toDomain:(id)a6 migrateCloud:(BOOL)a7;
@end

@implementation PSMigratorUtilities

- (void)_migrateKey:(id)a3 domain:(id)a4 toKey:(id)a5 toDomain:(id)a6 migrateCloud:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v11 = (__CFString *)a3;
  v12 = (__CFString *)a4;
  v13 = (__CFString *)a5;
  v14 = (__CFString *)a6;
  CFPropertyListRef v15 = CFPreferencesCopyAppValue(v11, v12);
  CFPropertyListRef v16 = CFPreferencesCopyAppValue(v13, v14);
  if (v15)
  {
    v17 = _PSLoggingFacility();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        int v25 = 138412546;
        v26 = v12;
        __int16 v27 = 2112;
        v28 = v11;
        _os_log_impl(&dword_1A6597000, v17, OS_LOG_TYPE_DEFAULT, "Removing defunct pref '%@' '%@'", (uint8_t *)&v25, 0x16u);
      }
    }
    else
    {
      if (v18)
      {
        int v25 = 138413058;
        v26 = v12;
        __int16 v27 = 2112;
        v28 = v11;
        __int16 v29 = 2112;
        v30 = v14;
        __int16 v31 = 2112;
        v32 = v13;
        _os_log_impl(&dword_1A6597000, v17, OS_LOG_TYPE_DEFAULT, "Migrating pref '%@' '%@' => '%@' '%@'", (uint8_t *)&v25, 0x2Au);
      }

      CFPreferencesSetAppValue(v13, v15, v14);
    }
    CFPreferencesSetAppValue(v11, 0, v12);
    CFRelease(v15);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v7)
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v12];
    v20 = [v19 objectForKey:v11];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v14];
      v22 = [v21 objectForKey:v13];
      v23 = _PSLoggingFacility();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (v24)
        {
          int v25 = 138412546;
          v26 = v12;
          __int16 v27 = 2112;
          v28 = v11;
          _os_log_impl(&dword_1A6597000, v23, OS_LOG_TYPE_DEFAULT, "Removing defunct cloud pref '%@' '%@'", (uint8_t *)&v25, 0x16u);
        }
      }
      else
      {
        if (v24)
        {
          int v25 = 138413058;
          v26 = v12;
          __int16 v27 = 2112;
          v28 = v11;
          __int16 v29 = 2112;
          v30 = v14;
          __int16 v31 = 2112;
          v32 = v13;
          _os_log_impl(&dword_1A6597000, v23, OS_LOG_TYPE_DEFAULT, "Migrating cloud pref from '%@' '%@' => '%@' %@'", (uint8_t *)&v25, 0x2Au);
        }

        objc_msgSend(v21, "setBool:forKey:", objc_msgSend(v20, "BOOLValue"), v13);
      }
      [v19 removeObjectForKey:v11];
    }
  }
}

@end