@interface RTDefaultsManager
- (BOOL)_generateDiagnosticFilesAtURL:(id)a3 error:(id *)a4;
- (RTDefaultsManager)init;
- (RTDefaultsManager)initWithUserDefaults:(id)a3 customDomain:(id)a4;
- (id)copyKeyListContainingString:(id)a3;
- (id)objectForKey:(id)a3;
- (id)objectForKey:(id)a3 domain:(id)a4;
- (id)objectForKey:(id)a3 value:(id)a4;
- (void)_shutdownWithHandler:(id)a3;
- (void)addDomain:(id)a3;
- (void)fetchDiagnosticLogsWithHandler:(id)a3;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)notifyUpdatedKeys:(id)a3;
- (void)registerDefault:(id)a3 forKey:(id)a4;
- (void)registerDefaults:(id)a3;
- (void)sendDiagnosticsToURL:(id)a3 options:(id)a4 handler:(id)a5;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4 domain:(id)a5;
@end

@implementation RTDefaultsManager

- (id)objectForKey:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v3 = -[RTUserDefaults objectForKey:](self->_userDefaults, "objectForKey:");
  }
  else
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      v7 = "-[RTDefaultsManager objectForKey:]";
      __int16 v8 = 1024;
      int v9 = 165;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key (in %s:%d)", (uint8_t *)&v6, 0x12u);
    }

    v3 = 0;
  }

  return v3;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    [(RTUserDefaults *)self->_userDefaults setObject:a3 forKey:v6];
    [(RTUserDefaults *)self->_userDefaults rt_synchronize];
    id v8 = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
    [(RTDefaultsManager *)self notifyUpdatedKeys:v7];
  }
  else
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v10 = "-[RTDefaultsManager setObject:forKey:]";
      __int16 v11 = 1024;
      int v12 = 177;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key (in %s:%d)", buf, 0x12u);
    }
  }
}

- (void)notifyUpdatedKeys:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [(RTNotifier *)self queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__RTDefaultsManager_notifyUpdatedKeys___block_invoke;
    v6[3] = &unk_1E6B90BF0;
    id v7 = v4;
    id v8 = self;
    dispatch_async(v5, v6);
  }
}

void __39__RTDefaultsManager_notifyUpdatedKeys___block_invoke(uint64_t a1)
{
  v2 = [[RTDefaultsManagerNotificationDefaultsChanged alloc] initWithUpdatedKeys:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) postNotification:v2];
}

- (RTDefaultsManager)init
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [MEMORY[0x1E4F28CB8] pathInCacheDirectory:@"defaults.plist"];
  v5 = [(RTDefaultsManager *)self initWithUserDefaults:v3 customDomain:v4];

  return v5;
}

- (RTDefaultsManager)initWithUserDefaults:(id)a3 customDomain:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)RTDefaultsManager;
    int v9 = [(RTNotifier *)&v13 init];
    p_isa = (id *)&v9->super.super.super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_userDefaults, a3);
      if (v8) {
        [p_isa[4] addSuiteNamed:v8];
      }
    }
    self = p_isa;
    __int16 v11 = self;
  }
  else
  {
    __int16 v11 = 0;
  }

  return v11;
}

- (void)_shutdownWithHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)registerDefaults:(id)a3
{
}

- (void)registerDefault:(id)a3 forKey:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  userDefaults = self->_userDefaults;
  id v10 = a4;
  v11[0] = a3;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  int v9 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [(RTUserDefaults *)userDefaults registerDefaults:v9];
}

- (void)addDomain:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(RTUserDefaults *)self->_userDefaults addSuiteNamed:v4];
    [(RTUserDefaults *)self->_userDefaults rt_refreshDomain:v4];
    v5 = [(RTUserDefaults *)self->_userDefaults rt_copyKeyListForDomain:v4];
    [(RTDefaultsManager *)self notifyUpdatedKeys:v5];
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "-[RTDefaultsManager addDomain:]";
      __int16 v9 = 1024;
      int v10 = 150;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: domain (in %s:%d)", (uint8_t *)&v7, 0x12u);
    }
  }
}

- (id)objectForKey:(id)a3 domain:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (v7)
    {
      __int16 v9 = [(RTUserDefaults *)self->_userDefaults rt_objectForKey:v6 domain:v7];
      goto LABEL_11;
    }
  }
  else
  {
    int v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      v14 = "-[RTDefaultsManager objectForKey:domain:]";
      __int16 v15 = 1024;
      int v16 = 192;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key (in %s:%d)", (uint8_t *)&v13, 0x12u);
    }

    if (v8) {
      goto LABEL_10;
    }
  }
  uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v13 = 136315394;
    v14 = "-[RTDefaultsManager objectForKey:domain:]";
    __int16 v15 = 1024;
    int v16 = 193;
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: domain (in %s:%d)", (uint8_t *)&v13, 0x12u);
  }

LABEL_10:
  __int16 v9 = 0;
LABEL_11:

  return v9;
}

- (void)setObject:(id)a3 forKey:(id)a4 domain:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v9)
  {
    if (v10)
    {
      [(RTUserDefaults *)self->_userDefaults rt_setObject:v8 forKey:v9 domain:v10];
      [(RTUserDefaults *)self->_userDefaults rt_synchronizeDomain:v11];
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  int v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v14 = 136315394;
    __int16 v15 = "-[RTDefaultsManager setObject:forKey:domain:]";
    __int16 v16 = 1024;
    int v17 = 208;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key (in %s:%d)", (uint8_t *)&v14, 0x12u);
  }

  if (!v11)
  {
LABEL_7:
    int v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      __int16 v15 = "-[RTDefaultsManager setObject:forKey:domain:]";
      __int16 v16 = 1024;
      int v17 = 209;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: domain (in %s:%d)", (uint8_t *)&v14, 0x12u);
    }
  }
LABEL_10:
}

- (id)copyKeyListContainingString:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(RTUserDefaults *)self->_userDefaults dictionaryRepresentation];
    id v6 = [v5 allKeys];
    id v7 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v13, "containsString:", v4, (void)v15)) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }
  }
  else
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: keySubstring", buf, 2u);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)objectForKey:(id)a3 value:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(RTDefaultsManager *)self objectForKey:v7];
  if (!v9) {
    id v9 = v8;
  }
  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityDefaults);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = NSStringFromSelector(a2);
    int v13 = 138412802;
    int v14 = v11;
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, key, %@, value, %@", (uint8_t *)&v13, 0x20u);
  }

  return v9;
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[RTNotification notificationName];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityDefaults);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = NSStringFromSelector(a2);
      int v12 = 138412802;
      int v13 = v11;
      __int16 v14 = 2112;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, unsupported notification, %@, observer, %@", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[RTNotification notificationName];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityDefaults);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = NSStringFromSelector(a2);
      int v12 = 138412802;
      int v13 = v11;
      __int16 v14 = 2112;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, unsupported notification, %@, observer, %@", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (BOOL)_generateDiagnosticFilesAtURL:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = [a3 path];
  id v8 = [MEMORY[0x1E4F28CB8] routinePreferencesPath];
  char v9 = [v7 stringByAppendingPathComponent:v8];

  uint64_t v10 = [v9 stringByDeletingLastPathComponent];
  uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v12 = [v11 fileExistsAtPath:v10];

  if (v12) {
    goto LABEL_6;
  }
  int v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    __int16 v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    __int16 v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v28 = v15;
    __int16 v29 = 2112;
    v30 = v16;
    __int16 v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@ %@, creating destination directory, %@", buf, 0x20u);
  }
  id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v26 = 0;
  int v18 = [v17 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v26];
  id v19 = v26;

  if (v18 && !v19)
  {
LABEL_6:
    id v19 = [(RTUserDefaults *)self->_userDefaults dictionaryRepresentation];
    [v19 writeToFile:v9 atomically:0];
    BOOL v20 = 1;
  }
  else
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      v25 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      v28 = v24;
      __int16 v29 = 2112;
      v30 = v25;
      __int16 v31 = 2112;
      v32 = v10;
      __int16 v33 = 2112;
      id v34 = v19;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "%@ %@, failed to create directory, %@, error, %@", buf, 0x2Au);
    }
    if (a4)
    {
      id v19 = v19;
      BOOL v20 = 0;
      *a4 = v19;
    }
    else
    {
      BOOL v20 = 0;
    }
  }

  return v20;
}

- (void)sendDiagnosticsToURL:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  char v12 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__RTDefaultsManager_sendDiagnosticsToURL_options_handler___block_invoke;
  block[3] = &unk_1E6B91C48;
  id v19 = v11;
  SEL v20 = a2;
  block[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v13 = v9;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(v12, block);
}

void __58__RTDefaultsManager_sendDiagnosticsToURL_options_handler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    v5 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v6 = *(__CFString **)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    SEL v20 = v4;
    __int16 v21 = 2112;
    uint64_t v22 = (uint64_t)v5;
    __int16 v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@ %@, options, %@", buf, 0x20u);
  }
  if ([*(id *)(a1 + 40) hasMask:1])
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    id v18 = 0;
    int v9 = [v7 _generateDiagnosticFilesAtURL:v8 error:&v18];
    id v10 = v18;
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      char v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      uint64_t v14 = NSStringFromSelector(*(SEL *)(a1 + 64));
      id v15 = (void *)v14;
      __int16 v16 = @"NO";
      *(_DWORD *)buf = 138413058;
      SEL v20 = v13;
      __int16 v21 = 2112;
      if (v9) {
        __int16 v16 = @"YES";
      }
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      v24 = v16;
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@ %@, success, %@, error, %@", buf, 0x2Au);
    }
    uint64_t v17 = *(void *)(a1 + 56);
    if (v17) {
      (*(void (**)(uint64_t, id))(v17 + 16))(v17, v10);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)fetchDiagnosticLogsWithHandler:(id)a3
{
  id v4 = a3;
  v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__RTDefaultsManager_fetchDiagnosticLogsWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__RTDefaultsManager_fetchDiagnosticLogsWithHandler___block_invoke(uint64_t a1)
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  v3 = [*(id *)(a1 + 32) objectForKey:@"RTDefaultsPersistenceMirroringManagerBackgroundLastImportDate"];
  id v4 = [v3 stringFromDate];
  v5 = [v2 stringWithFormat:@"Last Import Date, %@", v4];
  v11[0] = v5;
  id v6 = NSString;
  id v7 = [*(id *)(a1 + 32) objectForKey:@"RTDefaultsPersistenceMirroringManagerBackgroundLastExportDate"];
  id v8 = [v7 stringFromDate];
  int v9 = [v6 stringWithFormat:@"Last Export Date, %@", v8];
  v11[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
}

@end