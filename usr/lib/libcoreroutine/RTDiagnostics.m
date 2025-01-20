@interface RTDiagnostics
+ (BOOL)createArchiveSourceURL:(id)a3 destinationURL:(id)a4 error:(id *)a5;
+ (BOOL)fileNameEligibleForCollection:(id)a3;
+ (id)createDiagnosticsURLWithError:(id *)a3;
+ (id)stringFromDateWithFormat;
- (RTDiagnostics)init;
- (RTDiagnostics)initWithDefaultsManager:(id)a3 platform:(id)a4;
- (id)_collectBackupWithError:(id *)a3;
- (id)_collectDiagnosticFilesWithOptions:(id)a3 error:(id *)a4;
- (void)_fetchPathToBackupWithHandler:(id)a3;
- (void)_fetchPathToDiagnosticFilesWithOptions:(id)a3 handler:(id)a4;
- (void)_shutdownWithHandler:(id)a3;
- (void)addDiagnosticProvider:(id)a3;
- (void)fetchPathToBackupWithHandler:(id)a3;
- (void)fetchPathToDiagnosticFilesWithOptions:(id)a3 handler:(id)a4;
- (void)logDiagnosticStateWithReason:(id)a3;
- (void)logProcessDiagnosticInformation;
@end

@implementation RTDiagnostics

+ (BOOL)fileNameEligibleForCollection:(id)a3
{
  id v3 = a3;
  if (([v3 containsString:@"routined"] & 1) != 0
    || [v3 containsString:@"CoreRoutineHelperService"])
  {
    int v4 = [v3 containsString:@"Sandbox"] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

+ (id)createDiagnosticsURLWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int v4 = NSTemporaryDirectory();
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:1];
    v6 = (void *)MEMORY[0x1E4F1CB10];
    v7 = [MEMORY[0x1E4F29128] UUID];
    v8 = [v7 UUIDString];
    v9 = [v6 fileURLWithPath:v8 isDirectory:1 relativeToURL:v5];

    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v23 = 0;
    int v11 = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v23];
    id v12 = v23;

    if (v11) {
      BOOL v13 = v12 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      id v18 = v9;
    }
    else
    {
      if (a3)
      {
        v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v15 = *MEMORY[0x1E4F5CFE8];
        uint64_t v24 = *MEMORY[0x1E4F28568];
        v16 = [NSString stringWithFormat:@"failed to create diagnostic url at path, %@, error, %@", v5, v12];
        v25 = v16;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
        *a3 = [v14 errorWithDomain:v15 code:1 userInfo:v17];
      }
      id v18 = 0;
    }

    goto LABEL_15;
  }
  v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "+[RTDiagnostics createDiagnosticsURLWithError:]";
    __int16 v30 = 1024;
    int v31 = 65;
    _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Temporary diagnostics parent path was nil. (in %s:%d)", buf, 0x12u);
  }

  if (a3)
  {
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F5CFE8];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27 = @"failed to create diagnostic url, parent path was nil.";
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    [v20 errorWithDomain:v21 code:1 userInfo:v5];
    id v18 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
  id v18 = 0;
LABEL_16:

  return v18;
}

+ (BOOL)createArchiveSourceURL:(id)a3 destinationURL:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (RTArchiver *)a4;
  v9 = [(RTArchiver *)v8 path];
  v10 = [v9 stringByDeletingLastPathComponent];

  int v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v12 = [v11 fileExistsAtPath:v10];

  if ((v12 & 1) == 0)
  {
    BOOL v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v22 = 0;
    int v14 = [v13 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v22];
    uint64_t v15 = (RTArchiver *)v22;

    if (!v14 || v15)
    {
      v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v15;
        _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "error while creating archive destination directory, %@", buf, 0xCu);
      }

      if (a5)
      {
        v19 = v15;
        uint64_t v15 = v19;
        goto LABEL_14;
      }
LABEL_16:
      BOOL v17 = 0;
      goto LABEL_17;
    }
  }
  v16 = [[RTArchiver alloc] initWithOutputURL:v8 compress:1];
  if (!v16)
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "error while creating archive at destination url, %@", buf, 0xCu);
    }

    if (a5)
    {
      v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:MEMORY[0x1E4F1CC08]];
      uint64_t v15 = 0;
LABEL_14:
      BOOL v17 = 0;
      *a5 = v19;
      goto LABEL_17;
    }
    uint64_t v15 = 0;
    goto LABEL_16;
  }
  uint64_t v15 = v16;
  [(RTArchiver *)v16 addDirectoryToArchive:v7];
  [(RTArchiver *)v15 closeArchive];
  BOOL v17 = 1;
LABEL_17:

  return v17;
}

+ (id)stringFromDateWithFormat
{
  v2 = objc_opt_new();
  [v2 setDateFormat:@"MM-dd-YYYY-HHmmss"];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  int v4 = [v2 stringFromDate:v3];

  return v4;
}

- (RTDiagnostics)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_platform_);
}

- (RTDiagnostics)initWithDefaultsManager:(id)a3 platform:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RTDiagnostics;
  v9 = [(RTNotifier *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_defaultsManager, a3);
    objc_storeStrong((id *)&v10->_platform, a4);
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    diagnosticProviders = v10->_diagnosticProviders;
    v10->_diagnosticProviders = (NSMutableArray *)v11;
  }
  return v10;
}

- (void)logProcessDiagnosticInformation
{
  id v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__RTDiagnostics_logProcessDiagnosticInformation__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

void __48__RTDiagnostics_logProcessDiagnosticInformation__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v24 = "Nov 21 2024";
    __int16 v25 = 2080;
    uint64_t v26 = "21:20:56";
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEFAULT, "/usr/libexec/routined was compiled on %s @ %s", buf, 0x16u);
  }

  id v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    pid_t v4 = getpid();
    *(_DWORD *)buf = 67109120;
    LODWORD(v24) = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEFAULT, "pid, %d", buf, 8u);
  }

  v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [MEMORY[0x1E4F28B50] _coreroutineBundle];
    id v7 = [v6 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D020]];
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v7;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "CoreRoutine-%{public}@", buf, 0xCu);
  }
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [*(id *)(*(void *)(a1 + 32) + 40) systemModel];
    v10 = [*(id *)(*(void *)(a1 + 32) + 40) buildVersion];
    uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 40) productType];
    *(_DWORD *)buf = 138543874;
    uint64_t v24 = v9;
    __int16 v25 = 2114;
    uint64_t v26 = v10;
    __int16 v27 = 2114;
    v28 = v11;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "system model, %{public}@, version, %{public}@, product, %{public}@", buf, 0x20u);
  }
  char v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v22 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    BOOL v13 = [v22 firstObject];
    objc_super v14 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v15 = [v14 localeIdentifier];
    v16 = [MEMORY[0x1E4F28B50] mainBundle];
    BOOL v17 = [v16 preferredLocalizations];
    id v18 = [v17 firstObject];
    v19 = [MEMORY[0x1E4F28B50] _coreroutineBundle];
    v20 = [v19 preferredLocalizations];
    uint64_t v21 = [v20 firstObject];
    *(_DWORD *)buf = 138413058;
    uint64_t v24 = v13;
    __int16 v25 = 2112;
    uint64_t v26 = v15;
    __int16 v27 = 2112;
    v28 = v18;
    __int16 v29 = 2112;
    __int16 v30 = v21;
    _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "preferredLanguage, %@, locale, %@, mainBundlePreferredLocalization, %@, frameworkPreferredLocalization, %@", buf, 0x2Au);
  }
}

- (void)logDiagnosticStateWithReason:(id)a3
{
  id v5 = a3;
  v6 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__RTDiagnostics_logDiagnosticStateWithReason___block_invoke;
  block[3] = &unk_1E6B91220;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __46__RTDiagnostics_logDiagnosticStateWithReason___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = dispatch_group_create();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  pid_t v4 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector())
        {
          dispatch_group_enter(v3);
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __46__RTDiagnostics_logDiagnosticStateWithReason___block_invoke_2;
          v17[3] = &unk_1E6B9B460;
          v17[4] = *(void *)(a1 + 32);
          id v18 = v2;
          v19 = v9;
          v20 = v3;
          [v9 fetchDiagnosticLogsWithHandler:v17];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  SEL v10 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__RTDiagnostics_logDiagnosticStateWithReason___block_invoke_4;
  block[3] = &unk_1E6B91220;
  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 48);
  id v14 = v11;
  id v15 = v2;
  id v12 = v2;
  dispatch_group_notify(v3, v10, block);
}

void __46__RTDiagnostics_logDiagnosticStateWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  pid_t v4 = [*(id *)(a1 + 32) queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__RTDiagnostics_logDiagnosticStateWithReason___block_invoke_3;
  v9[3] = &unk_1E6B96E10;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void **)(a1 + 56);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v3;
  id v13 = v7;
  id v8 = v3;
  dispatch_async(v4, v9);
}

void __46__RTDiagnostics_logDiagnosticStateWithReason___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = NSString;
  id v3 = *(void **)(a1 + 32);
  pid_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v2 stringWithFormat:@"diagnostic provider, %@", v5];
  [v3 addObject:v6];

  [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(a1 + 48)];
  uint64_t v7 = *(NSObject **)(a1 + 56);

  dispatch_group_leave(v7);
}

void __46__RTDiagnostics_logDiagnosticStateWithReason___block_invoke_4(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 32);
    +[RTRuntime footprint];
    *(_DWORD *)buf = 138412802;
    v20 = v3;
    __int16 v21 = 2112;
    uint64_t v22 = v4;
    __int16 v23 = 2048;
    uint64_t v24 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "============== %@, %@, footprint, %.2f MB ==============", buf, 0x20u);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v11;
          _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "====================================", buf, 2u);
  }
}

- (void)addDiagnosticProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__RTDiagnostics_addDiagnosticProvider___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __39__RTDiagnostics_addDiagnosticProvider___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return [*(id *)(*(void *)(result + 40) + 48) addObject:];
  }
  return result;
}

- (void)_shutdownWithHandler:(id)a3
{
  id v5 = a3;
  [(NSMutableArray *)self->_diagnosticProviders removeAllObjects];
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
    id v4 = v5;
  }
}

- (id)_collectDiagnosticFilesWithOptions:(id)a3 error:(id *)a4
{
  v131[1] = *MEMORY[0x1E4F143B8];
  id v102 = a3;
  v91 = self;
  id v121 = 0;
  v96 = [(id)objc_opt_class() createDiagnosticsURLWithError:&v121];
  id v6 = v121;
  v89 = v6;
  if (v6)
  {
    uint64_t v7 = 0;
    if (a4) {
      *a4 = v6;
    }
  }
  else
  {
    v99 = objc_opt_new();
    id v8 = NSString;
    uint64_t v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    uint64_t v11 = NSStringFromSelector(a2);
    id v12 = [v8 stringWithFormat:@"%@-%@", v10, v11];
    [v12 UTF8String];
    v88 = (void *)os_transaction_create();

    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v84 = (objc_class *)objc_opt_class();
      v85 = NSStringFromClass(v84);
      v86 = NSStringFromSelector(a2);
      *(_DWORD *)v126 = 138412546;
      *(void *)&v126[4] = v85;
      *(_WORD *)&v126[12] = 2112;
      *(void *)&v126[14] = v86;
      _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", v126, 0x16u);
    }
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    obuint64_t j = v91->_diagnosticProviders;
    uint64_t v103 = [(NSMutableArray *)obj countByEnumeratingWithState:&v117 objects:v130 count:16];
    if (v103)
    {
      uint64_t v100 = *(void *)v118;
      uint64_t v92 = *MEMORY[0x1E4F5CFE8];
      uint64_t v94 = *MEMORY[0x1E4F28568];
      do
      {
        for (uint64_t i = 0; i != v103; ++i)
        {
          if (*(void *)v118 != v100) {
            objc_enumerationMutation(obj);
          }
          long long v15 = *(void **)(*((void *)&v117 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
            *(void *)v126 = 0;
            *(void *)&v126[8] = v126;
            *(void *)&v126[16] = 0x3032000000;
            v127 = __Block_byref_object_copy__137;
            v128 = __Block_byref_object_dispose__137;
            id v129 = 0;
            v114[0] = MEMORY[0x1E4F143A8];
            v114[1] = 3221225472;
            v114[2] = __58__RTDiagnostics__collectDiagnosticFilesWithOptions_error___block_invoke;
            v114[3] = &unk_1E6B90728;
            v116 = v126;
            long long v17 = v16;
            v115 = v17;
            [v15 flushToCacheWithOptions:v102 handler:v114];
            id v18 = v17;
            v19 = [MEMORY[0x1E4F1C9C8] now];
            dispatch_time_t v20 = dispatch_time(0, 300000000000);
            if (!dispatch_semaphore_wait(v18, v20)) {
              goto LABEL_17;
            }
            __int16 v21 = [MEMORY[0x1E4F1C9C8] now];
            [v21 timeIntervalSinceDate:v19];
            double v23 = v22;
            uint64_t v24 = objc_opt_new();
            uint64_t v25 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_108];
            uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
            __int16 v27 = [v26 filteredArrayUsingPredicate:v25];
            v28 = [v27 firstObject];

            [v24 submitToCoreAnalytics:v28 type:1 duration:v23];
            __int16 v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
            }

            __int16 v30 = (void *)MEMORY[0x1E4F28C58];
            v131[0] = v94;
            *(void *)buf = @"semaphore wait timeout";
            uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v131 count:1];
            uint64_t v32 = [v30 errorWithDomain:v92 code:15 userInfo:v31];

            if (v32)
            {
              id v33 = v32;

              char v34 = 0;
            }
            else
            {
LABEL_17:
              id v33 = 0;
              char v34 = 1;
            }

            id v35 = v33;
            if ((v34 & 1) == 0) {
              objc_storeStrong((id *)(*(void *)&v126[8] + 40), v33);
            }
            if (*(void *)(*(void *)&v126[8] + 40))
            {
              v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                v37 = (objc_class *)objc_opt_class();
                v38 = NSStringFromClass(v37);
                uint64_t v39 = *(void *)(*(void *)&v126[8] + 40);
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v38;
                __int16 v124 = 2112;
                uint64_t v125 = v39;
                _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "%@, failed to flush to cache, error, %@", buf, 0x16u);
              }
              [v99 addObject:*(void *)(*(void *)&v126[8] + 40)];
            }

            _Block_object_dispose(v126, 8);
          }
        }
        uint64_t v103 = [(NSMutableArray *)obj countByEnumeratingWithState:&v117 objects:v130 count:16];
      }
      while (v103);
    }

    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    obja = v91->_diagnosticProviders;
    uint64_t v104 = [(NSMutableArray *)obja countByEnumeratingWithState:&v110 objects:v122 count:16];
    if (v104)
    {
      uint64_t v101 = *(void *)v111;
      uint64_t v93 = *MEMORY[0x1E4F5CFE8];
      uint64_t v95 = *MEMORY[0x1E4F28568];
      do
      {
        for (uint64_t j = 0; j != v104; ++j)
        {
          if (*(void *)v111 != v101) {
            objc_enumerationMutation(obja);
          }
          v41 = *(void **)(*((void *)&v110 + 1) + 8 * j);
          if (objc_opt_respondsToSelector())
          {
            dispatch_semaphore_t v42 = dispatch_semaphore_create(0);
            *(void *)v126 = 0;
            *(void *)&v126[8] = v126;
            *(void *)&v126[16] = 0x3032000000;
            v127 = __Block_byref_object_copy__137;
            v128 = __Block_byref_object_dispose__137;
            id v129 = 0;
            v107[0] = MEMORY[0x1E4F143A8];
            v107[1] = 3221225472;
            v107[2] = __58__RTDiagnostics__collectDiagnosticFilesWithOptions_error___block_invoke_56;
            v107[3] = &unk_1E6B90728;
            v109 = v126;
            v43 = v42;
            v108 = v43;
            [v41 sendDiagnosticsToURL:v96 options:v102 handler:v107];
            v44 = v43;
            v45 = [MEMORY[0x1E4F1C9C8] now];
            dispatch_time_t v46 = dispatch_time(0, 300000000000);
            if (!dispatch_semaphore_wait(v44, v46)) {
              goto LABEL_38;
            }
            v47 = [MEMORY[0x1E4F1C9C8] now];
            [v47 timeIntervalSinceDate:v45];
            double v49 = v48;
            v50 = objc_opt_new();
            v51 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_108];
            v52 = [MEMORY[0x1E4F29060] callStackSymbols];
            v53 = [v52 filteredArrayUsingPredicate:v51];
            v54 = [v53 firstObject];

            [v50 submitToCoreAnalytics:v54 type:1 duration:v49];
            v55 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1D9BFA000, v55, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
            }

            v56 = (void *)MEMORY[0x1E4F28C58];
            v131[0] = v95;
            *(void *)buf = @"semaphore wait timeout";
            v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v131 count:1];
            v58 = [v56 errorWithDomain:v93 code:15 userInfo:v57];

            if (v58)
            {
              id v59 = v58;

              char v60 = 0;
            }
            else
            {
LABEL_38:
              id v59 = 0;
              char v60 = 1;
            }

            id v61 = v59;
            if ((v60 & 1) == 0) {
              objc_storeStrong((id *)(*(void *)&v126[8] + 40), v59);
            }
            if (*(void *)(*(void *)&v126[8] + 40))
            {
              v62 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
              {
                v63 = (objc_class *)objc_opt_class();
                v64 = NSStringFromClass(v63);
                uint64_t v65 = *(void *)(*(void *)&v126[8] + 40);
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v64;
                __int16 v124 = 2112;
                uint64_t v125 = v65;
                _os_log_error_impl(&dword_1D9BFA000, v62, OS_LOG_TYPE_ERROR, "%@, failed to send diagnostics to URL, error, %@", buf, 0x16u);
              }
              [v99 addObject:*(void *)(*(void *)&v126[8] + 40)];
            }

            _Block_object_dispose(v126, 8);
          }
        }
        uint64_t v104 = [(NSMutableArray *)obja countByEnumeratingWithState:&v110 objects:v122 count:16];
      }
      while (v104);
    }

    v66 = [MEMORY[0x1E4F28CB8] crashReporterPath];
    v67 = [v66 stringByAppendingPathComponent:@"CoreRoutineDiagnosticFiles"];
    v68 = [(id)objc_opt_class() stringFromDateWithFormat];
    v69 = [v67 stringByAppendingFormat:@"-%@", v68];
    uint64_t v7 = [v69 stringByAppendingPathExtension:@"tar.gz"];

    v70 = objc_opt_class();
    v71 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
    id v106 = 0;
    char v72 = [v70 createArchiveSourceURL:v96 destinationURL:v71 error:&v106];
    id v73 = v106;

    if (v73) {
      char v74 = 0;
    }
    else {
      char v74 = v72;
    }
    if ((v74 & 1) == 0)
    {
      v75 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v126 = 138412290;
        *(void *)&v126[4] = v73;
        _os_log_error_impl(&dword_1D9BFA000, v75, OS_LOG_TYPE_ERROR, "failed to create archive, error, %@", v126, 0xCu);
      }

      if (v73) {
        [v99 addObject:v73];
      }

      uint64_t v7 = 0;
    }
    v76 = [MEMORY[0x1E4F28CB8] defaultManager];
    v77 = [v96 path];
    id v105 = 0;
    char v78 = [v76 removeItemAtPath:v77 error:&v105];
    id v79 = v105;

    if (v79) {
      char v80 = 0;
    }
    else {
      char v80 = v78;
    }
    if ((v80 & 1) == 0)
    {
      v81 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        v87 = [v96 path];
        *(_DWORD *)v126 = 138412546;
        *(void *)&v126[4] = v87;
        *(_WORD *)&v126[12] = 2112;
        *(void *)&v126[14] = v79;
        _os_log_error_impl(&dword_1D9BFA000, v81, OS_LOG_TYPE_ERROR, "failed to remove temporary directory, %@, error, %@", v126, 0x16u);
      }
    }
    if (a4)
    {
      v82 = _RTSafeArray();
      _RTMultiErrorCreate();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

void __58__RTDiagnostics__collectDiagnosticFilesWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __58__RTDiagnostics__collectDiagnosticFilesWithOptions_error___block_invoke_56(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_fetchPathToDiagnosticFilesWithOptions:(id)a3 handler:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, id))a4;
  if (v7)
  {
    id v8 = objc_opt_new();
    if (v8)
    {
      id v13 = 0;
      uint64_t v9 = [(RTDiagnostics *)self _collectDiagnosticFilesWithOptions:v6 error:&v13];
      id v10 = v13;
      v7[2](v7, v9, v10);
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F5CFE8];
      uint64_t v14 = *MEMORY[0x1E4F28568];
      v15[0] = @"encrypetd data unavailable - please ensure the device is unlocked and try again.";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      id v10 = [v11 errorWithDomain:v12 code:5 userInfo:v9];
      v7[2](v7, 0, v10);
    }
  }
}

- (void)fetchPathToDiagnosticFilesWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__RTDiagnostics_fetchPathToDiagnosticFilesWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __63__RTDiagnostics_fetchPathToDiagnosticFilesWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPathToDiagnosticFilesWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (id)_collectBackupWithError:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F28CB8] crashReporterPath];
  id v5 = [v4 stringByAppendingPathComponent:@"CoreRoutineBackup"];
  id v6 = [(id)objc_opt_class() stringFromDateWithFormat];
  id v7 = [v5 stringByAppendingFormat:@"-%@", v6];
  id v8 = [v7 stringByAppendingPathExtension:@"tar.gz"];

  id v9 = objc_opt_class();
  id v10 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v11 = [MEMORY[0x1E4F28CB8] routineCacheDirectoryPath];
  id v12 = [v10 fileURLWithPath:v11 isDirectory:1];
  id v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
  id v18 = 0;
  LODWORD(v7) = [v9 createArchiveSourceURL:v12 destinationURL:v13 error:&v18];
  id v14 = v18;

  if (!v7 || v14)
  {
    dispatch_semaphore_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v14;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "failed to create archive, error, %@", buf, 0xCu);
    }

    id v15 = 0;
    if (a3) {
      *a3 = v14;
    }
  }
  else
  {
    id v15 = v8;
  }

  return v15;
}

- (void)_fetchPathToBackupWithHandler:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, id))a3;
  if (v4)
  {
    id v5 = objc_opt_new();
    if (v5)
    {
      id v10 = 0;
      id v6 = [(RTDiagnostics *)self _collectBackupWithError:&v10];
      id v7 = v10;
      v4[2](v4, v6, v7);
    }
    else
    {
      id v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F5CFE8];
      uint64_t v11 = *MEMORY[0x1E4F28568];
      v12[0] = @"encrypetd data unavailable - please ensure the device is unlocked and try again.";
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      id v6 = [v8 errorWithDomain:v9 code:5 userInfo:v7];
      v4[2](v4, 0, v6);
    }
  }
}

- (void)fetchPathToBackupWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__RTDiagnostics_fetchPathToBackupWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __46__RTDiagnostics_fetchPathToBackupWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPathToBackupWithHandler:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticProviders, 0);
  objc_storeStrong((id *)&self->_platform, 0);

  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end