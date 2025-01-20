@interface PLBatteryUIResponderService
+ (void)load;
- (BOOL)demoMode;
- (BOOL)skipPlistWrite;
- (NSDictionary)configuration;
- (NSMutableArray)dependencies;
- (NSMutableArray)executionChain;
- (NSMutableArray)orderOfExecution;
- (NSMutableDictionary)requestedObjects;
- (NSMutableDictionary)responseCache;
- (NSMutableDictionary)resultDictionary;
- (NSMutableDictionary)sharedUtilityCache;
- (NSOperationQueue)operationQueue;
- (NSString)plistCopyDestination;
- (NSString)requestingService;
- (PLBatteryUIResponderService)responderService;
- (PLXPCResponderOperatorComposition)queryResponder;
- (double)endOfDayWithNow:(id)a3;
- (double)endOfHourWithNow:(id)a3;
- (id)constructResponseObjectFromType:(int64_t)a3;
- (id)convertResponseToLegacyFormat:(id)a3;
- (id)demoPath;
- (id)result;
- (void)cleanup;
- (void)coalesce;
- (void)configure:(id)a3;
- (void)initOperatorDependancies;
- (void)linkDependencies;
- (void)result;
- (void)run;
- (void)setConfiguration:(id)a3;
- (void)setDependencies:(id)a3;
- (void)setExecutionChain:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setOrderOfExecution:(id)a3;
- (void)setPlistCopyDestination:(id)a3;
- (void)setQueryResponder:(id)a3;
- (void)setRequestedObjects:(id)a3;
- (void)setRequestingService:(id)a3;
- (void)setResponderService:(id)a3;
- (void)setResponseCache:(id)a3;
- (void)setResultDictionary:(id)a3;
- (void)setSharedUtilityCache:(id)a3;
- (void)setSkipPlistWrite:(BOOL)a3;
@end

@implementation PLBatteryUIResponderService

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBatteryUIResponderService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)initOperatorDependancies
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [(PLBatteryUIResponderService *)self setRequestedObjects:v3];

  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [(PLBatteryUIResponderService *)self setResponseCache:v4];

  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [(PLBatteryUIResponderService *)self setSharedUtilityCache:v5];

  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [(PLBatteryUIResponderService *)self setResultDictionary:v6];

  v7 = [MEMORY[0x1E4F1CA48] array];
  [(PLBatteryUIResponderService *)self setOrderOfExecution:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [(PLBatteryUIResponderService *)self setOperationQueue:v8];

  v9 = [(PLBatteryUIResponderService *)self operationQueue];
  [v9 setMaxConcurrentOperationCount:1];

  id v10 = objc_alloc(MEMORY[0x1E4F92AA8]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__PLBatteryUIResponderService_initOperatorDependancies__block_invoke;
  v12[3] = &unk_1E6E47958;
  v12[4] = self;
  v11 = (void *)[v10 initWithOperator:self withRegistration:&unk_1F40115B8 withBlock:v12];
  [(PLBatteryUIResponderService *)self setQueryResponder:v11];
}

id __55__PLBatteryUIResponderService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([*(id *)(a1 + 32) demoMode])
  {
    v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __55__PLBatteryUIResponderService_initOperatorDependancies__block_invoke_cold_3();
    }

    id v8 = [*(id *)(a1 + 32) demoPath];
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v10 = [v9 fileExistsAtPath:v8];

    v11 = PLLogCommon();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __55__PLBatteryUIResponderService_initOperatorDependancies__block_invoke_cold_1();
      }

      v13 = NSString;
      v14 = [v8 pathExtension];
      v15 = [v13 stringWithFormat:@".%@", v14];

      if ([v15 isEqualToString:@".plist"])
      {
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v8];

LABEL_21:
        goto LABEL_17;
      }
      char v17 = [v15 isEqualToString:@".PLSQL"];

      if ((v17 & 1) == 0)
      {
        v16 = 0;
        goto LABEL_21;
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __55__PLBatteryUIResponderService_initOperatorDependancies__block_invoke_cold_2();
      }
    }
  }
  v18 = [v6 objectForKeyedSubscript:@"requestingService"];
  [*(id *)(a1 + 32) setRequestingService:v18];

  v19 = [v6 objectForKeyedSubscript:@"plistCopyDestination"];
  [*(id *)(a1 + 32) setPlistCopyDestination:v19];

  v20 = [v6 objectForKeyedSubscript:@"skipPlistWriteKey"];
  objc_msgSend(*(id *)(a1 + 32), "setSkipPlistWrite:", objc_msgSend(v20, "BOOLValue"));

  v21 = PLLogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = [*(id *)(a1 + 32) requestingService];
    *(_DWORD *)buf = 138412290;
    v25 = v22;
    _os_log_impl(&dword_1E4220000, v21, OS_LOG_TYPE_INFO, "requestingService=%@", buf, 0xCu);
  }
  [*(id *)(a1 + 32) cleanup];
  [*(id *)(a1 + 32) configure:v6];
  [*(id *)(a1 + 32) linkDependencies];
  [*(id *)(a1 + 32) run];
  [*(id *)(a1 + 32) coalesce];
  v16 = [*(id *)(a1 + 32) result];
LABEL_17:

  return v16;
}

- (void)cleanup
{
  v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1E4220000, v3, OS_LOG_TYPE_INFO, "Responder Service: Cleaning up...", v9, 2u);
  }

  v4 = [(PLBatteryUIResponderService *)self resultDictionary];
  [v4 removeAllObjects];

  v5 = [(PLBatteryUIResponderService *)self requestedObjects];
  [v5 removeAllObjects];

  id v6 = [(PLBatteryUIResponderService *)self orderOfExecution];
  [v6 removeAllObjects];

  v7 = [(PLBatteryUIResponderService *)self responseCache];
  [v7 removeAllObjects];

  id v8 = [(PLBatteryUIResponderService *)self sharedUtilityCache];
  [v8 removeAllObjects];
}

- (void)configure:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_INFO, "Responder Service: Received configuration %@", buf, 0xCu);
  }

  [(PLBatteryUIResponderService *)self setConfiguration:v4];
  id v6 = [(PLBatteryUIResponderService *)self configuration];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__PLBatteryUIResponderService_configure___block_invoke;
  v7[3] = &unk_1E6E49ED8;
  v7[4] = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

void __41__PLBatteryUIResponderService_configure___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 objectForKeyedSubscript:@"enum"];

    if (v7)
    {
      id v8 = [v6 objectForKeyedSubscript:@"enum"];
      uint64_t v9 = (int)[v8 intValue];

      uint64_t v10 = [*(id *)(a1 + 32) constructResponseObjectFromType:v9];
      if (v10)
      {
        v11 = [*(id *)(a1 + 32) requestedObjects];
        v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:v9];
        v13 = [v11 objectForKeyedSubscript:v12];

        if (!v13)
        {
          v14 = [MEMORY[0x1E4F1CA60] dictionary];
          v15 = [*(id *)(a1 + 32) requestedObjects];
          v16 = [MEMORY[0x1E4F28ED0] numberWithInteger:v9];
          [v15 setObject:v14 forKeyedSubscript:v16];
        }
        char v17 = [*(id *)(a1 + 32) requestedObjects];
        v18 = [MEMORY[0x1E4F28ED0] numberWithInteger:v9];
        v19 = [v17 objectForKeyedSubscript:v18];
        [v19 setObject:v10 forKeyedSubscript:v5];
      }
      else
      {
        char v17 = PLLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __41__PLBatteryUIResponderService_configure___block_invoke_cold_1((uint64_t)v6, v9, v17);
        }
      }
    }
  }
}

- (void)linkDependencies
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v3, OS_LOG_TYPE_INFO, "Responder Service: Linking dependencies...", buf, 2u);
  }

  v33 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_initWeak(&location, self);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v4 = [(PLBatteryUIResponderService *)self requestedObjects];
  uint64_t v30 = [v4 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v45;
    obuint64_t j = v4;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v45 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        id v6 = objc_msgSend(v33, "objectForKeyedSubscript:", v5, obj);
        BOOL v7 = v6 == 0;

        if (v7)
        {
          id v8 = [MEMORY[0x1E4F1CA48] array];
          [v33 setObject:v8 forKeyedSubscript:v5];
        }
        uint64_t v9 = [(PLBatteryUIResponderService *)self responseCache];
        uint64_t v10 = [v9 objectForKeyedSubscript:v5];
        BOOL v11 = v10 == 0;

        if (v11)
        {
          v12 = [MEMORY[0x1E4F1CA60] dictionary];
          v13 = [(PLBatteryUIResponderService *)self responseCache];
          [v13 setObject:v12 forKeyedSubscript:v5];
        }
        long long v42 = 0u;
        long long v43 = 0u;
        long long v41 = 0u;
        long long v40 = 0u;
        v14 = [(PLBatteryUIResponderService *)self requestedObjects];
        id v32 = [v14 objectForKeyedSubscript:v5];

        uint64_t v15 = [v32 countByEnumeratingWithState:&v40 objects:v51 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v41;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v41 != v16) {
                objc_enumerationMutation(v32);
              }
              uint64_t v18 = *(void *)(*((void *)&v40 + 1) + 8 * j);
              v19 = [(PLBatteryUIResponderService *)self requestedObjects];
              v20 = [v19 objectForKeyedSubscript:v5];
              v21 = [v20 objectForKeyedSubscript:v18];

              if (v21)
              {
                v22 = (void *)MEMORY[0x1E4F28B48];
                v36[0] = MEMORY[0x1E4F143A8];
                v36[1] = 3221225472;
                v36[2] = __47__PLBatteryUIResponderService_linkDependencies__block_invoke;
                v36[3] = &unk_1E6E4A568;
                objc_copyWeak(&v39, &location);
                v36[4] = v18;
                v36[5] = self;
                id v37 = v21;
                uint64_t v38 = v5;
                v23 = [v22 blockOperationWithBlock:v36];
                v24 = [v33 objectForKeyedSubscript:v5];
                [v24 addObject:v23];

                objc_destroyWeak(&v39);
              }
            }
            uint64_t v15 = [v32 countByEnumeratingWithState:&v40 objects:v51 count:16];
          }
          while (v15);
        }
      }
      id v4 = obj;
      uint64_t v30 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v30);
  }

  v25 = PLLogCommon();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v33;
    _os_log_impl(&dword_1E4220000, v25, OS_LOG_TYPE_INFO, "Responder Service: Constructed <Response Type, Execution Block(s)> map: %@", buf, 0xCu);
  }

  uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
  [(PLBatteryUIResponderService *)self setExecutionChain:v26];

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __47__PLBatteryUIResponderService_linkDependencies__block_invoke_65;
  v34[3] = &unk_1E6E4A590;
  v34[4] = self;
  id v27 = v33;
  id v35 = v27;
  [v27 enumerateKeysAndObjectsUsingBlock:v34];

  objc_destroyWeak(&location);
}

void __47__PLBatteryUIResponderService_linkDependencies__block_invoke(uint64_t a1)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  objc_super v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = [WeakRetained configuration];
  uint64_t v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 32)];
  v85 = (void *)[v5 mutableCopy];

  id v6 = [*(id *)(a1 + 40) resultDictionary];
  BOOL v7 = [v6 objectForKeyedSubscript:@"PLBatteryUIQueryTime"];
  [v85 setObject:v7 forKeyedSubscript:@"timestamp"];

  if ([*(id *)(a1 + 40) demoMode])
  {
    id v8 = [v85 objectForKeyedSubscript:@"start"];
    [v8 doubleValue];
    double v10 = v9;

    BOOL v11 = [v85 objectForKeyedSubscript:@"end"];
    [v11 doubleValue];
    double v13 = v12;

    double v14 = v13 - v10;
    if (v14 == 864000.0)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F1C9C8];
      uint64_t v16 = [*(id *)(a1 + 40) resultDictionary];
      char v17 = [v16 objectForKeyedSubscript:@"PLBatteryUIQueryTime"];
      [v17 doubleValue];
      uint64_t v18 = objc_msgSend(v15, "dateWithTimeIntervalSince1970:");

      v19 = PLCalculateEndOfDayWithDate();
    }
    else
    {
      if (v14 != 86400.0 && v14 != 1209600.0) {
        goto LABEL_8;
      }
      v20 = (void *)MEMORY[0x1E4F1C9C8];
      v21 = [*(id *)(a1 + 40) resultDictionary];
      v22 = [v21 objectForKeyedSubscript:@"PLBatteryUIQueryTime"];
      [v22 doubleValue];
      uint64_t v18 = objc_msgSend(v20, "dateWithTimeIntervalSince1970:");

      v19 = PLCalculateEndOfHourWithDate();
    }
    v23 = v19;
    [v19 timeIntervalSince1970];
    double v13 = v24;

LABEL_8:
    v25 = [MEMORY[0x1E4F28ED0] numberWithDouble:v13 - v14];
    [v85 setObject:v25 forKeyedSubscript:@"start"];

    uint64_t v26 = [MEMORY[0x1E4F28ED0] numberWithDouble:v13];
    [v85 setObject:v26 forKeyedSubscript:@"end"];
  }
  v84 = PLBatteryUsageUIKeyFromConfiguration();
  id v27 = PLLogCommon();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = (objc_class *)objc_opt_class();
    uint64_t v29 = NSStringFromClass(v28);
    uint64_t v30 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v87 = v29;
    __int16 v88 = 2112;
    uint64_t v89 = v30;
    _os_log_impl(&dword_1E4220000, v27, OS_LOG_TYPE_INFO, "Responder Service: Running '%@' for '%@'", buf, 0x16u);
  }
  v31 = [v85 objectForKeyedSubscript:@"start"];
  [v31 doubleValue];
  double v33 = v32;

  v34 = [v85 objectForKeyedSubscript:@"end"];
  [v34 doubleValue];
  double v36 = v35;

  id v37 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v36];
  v83 = [v37 convertFromSystemToMonotonic];

  v82 = [v83 dateByAddingTimeInterval:-(v36 - v33)];
  uint64_t v38 = (void *)MEMORY[0x1E4F28ED0];
  [v82 timeIntervalSince1970];
  id v39 = objc_msgSend(v38, "numberWithDouble:");
  [v85 setObject:v39 forKeyedSubscript:@"start"];

  long long v40 = (void *)MEMORY[0x1E4F28ED0];
  [v83 timeIntervalSince1970];
  long long v41 = objc_msgSend(v40, "numberWithDouble:");
  [v85 setObject:v41 forKeyedSubscript:@"end"];

  [*(id *)(a1 + 48) configure:v85];
  [*(id *)(a1 + 48) run];
  [*(id *)(a1 + 48) coalesce];
  id v42 = objc_loadWeakRetained(v2);
  long long v43 = [v42 responseCache];

  objc_sync_enter(v43);
  long long v44 = [MEMORY[0x1E4F1CA60] dictionary];
  id v45 = objc_loadWeakRetained(v2);
  long long v46 = [v45 responseCache];
  long long v47 = [v46 objectForKeyedSubscript:*(void *)(a1 + 56)];
  [v47 setObject:v44 forKeyedSubscript:v84];

  id v48 = objc_loadWeakRetained(v2);
  v49 = [v48 configuration];
  v50 = [v49 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v51 = objc_loadWeakRetained(v2);
  v52 = [v51 responseCache];
  uint64_t v53 = [v52 objectForKeyedSubscript:*(void *)(a1 + 56)];
  v54 = [v53 objectForKeyedSubscript:v84];
  [v54 setObject:v50 forKeyedSubscript:@"configuration"];

  v55 = [*(id *)(a1 + 48) result];
  id v56 = objc_loadWeakRetained(v2);
  v57 = [v56 responseCache];
  v58 = [v57 objectForKeyedSubscript:*(void *)(a1 + 56)];
  v59 = [v58 objectForKeyedSubscript:v84];
  [v59 setObject:v55 forKeyedSubscript:@"result"];

  v60 = PLLogCommon();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
  {
    v61 = *(void **)(a1 + 32);
    id v62 = objc_loadWeakRetained(v2);
    v63 = [v62 responseCache];
    v64 = [v63 objectForKeyedSubscript:*(void *)(a1 + 56)];
    v65 = [v64 objectForKeyedSubscript:v84];
    v66 = [v65 objectForKeyedSubscript:@"result"];
    *(_DWORD *)buf = 138412802;
    v87 = v61;
    __int16 v88 = 2112;
    uint64_t v89 = (uint64_t)v84;
    __int16 v90 = 2112;
    v91 = v66;
    _os_log_impl(&dword_1E4220000, v60, OS_LOG_TYPE_INFO, "Responder Service: Stored '%@' as %@: %@", buf, 0x20u);
  }
  objc_sync_exit(v43);

  id v67 = objc_loadWeakRetained(v2);
  v68 = [v67 requestedObjects];

  objc_sync_enter(v68);
  id v69 = objc_loadWeakRetained(v2);
  v70 = [v69 requestedObjects];
  v71 = [v70 objectForKeyedSubscript:*(void *)(a1 + 56)];
  [v71 setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];

  v72 = PLLogCommon();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
  {
    v77 = *(void **)(a1 + 32);
    id v78 = objc_loadWeakRetained(v2);
    v79 = [v78 requestedObjects];
    v80 = [v79 objectForKeyedSubscript:*(void *)(a1 + 56)];
    uint64_t v81 = [v80 count];
    *(_DWORD *)buf = 138412546;
    v87 = v77;
    __int16 v88 = 2048;
    uint64_t v89 = v81;
    _os_log_debug_impl(&dword_1E4220000, v72, OS_LOG_TYPE_DEBUG, "Responder Service: Completed %@ (%lu remaining)", buf, 0x16u);
  }
  objc_sync_exit(v68);

  id v73 = objc_loadWeakRetained(v2);
  v74 = [v73 orderOfExecution];

  objc_sync_enter(v74);
  id v75 = objc_loadWeakRetained(v2);
  v76 = [v75 orderOfExecution];
  [v76 addObject:*(void *)(a1 + 32)];

  objc_sync_exit(v74);
}

void __47__PLBatteryUIResponderService_linkDependencies__block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v52 = a1;
  BOOL v7 = [*(id *)(a1 + 32) requestedObjects];
  id v8 = [v7 objectForKeyedSubscript:v5];

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v9 = v8;
  uint64_t v43 = [v9 countByEnumeratingWithState:&v65 objects:v78 count:16];
  if (v43)
  {
    uint64_t v10 = *(void *)v66;
    id v41 = v9;
    id v42 = v5;
    id v48 = v6;
    uint64_t v40 = *(void *)v66;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v66 != v10) {
          objc_enumerationMutation(v9);
        }
        uint64_t v44 = v11;
        uint64_t v12 = *(void *)(*((void *)&v65 + 1) + 8 * v11);
        double v13 = [*(id *)(v52 + 32) requestedObjects];
        double v14 = [v13 objectForKeyedSubscript:v5];
        uint64_t v45 = v12;
        uint64_t v15 = [v14 objectForKeyedSubscript:v12];

        uint64_t v16 = [v15 dependencies];

        if (v16)
        {
          long long v63 = 0u;
          long long v64 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v46 = v15;
          obuint64_t j = [v15 dependencies];
          uint64_t v50 = [obj countByEnumeratingWithState:&v61 objects:v77 count:16];
          if (v50)
          {
            uint64_t v49 = *(void *)v62;
            while (2)
            {
              uint64_t v17 = 0;
              do
              {
                if (*(void *)v62 != v49) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v18 = *(void **)(*((void *)&v61 + 1) + 8 * v17);
                v19 = [*(id *)(v52 + 40) objectForKeyedSubscript:v18];

                v20 = PLLogCommon();
                v21 = v20;
                if (!v19)
                {
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  {
                    id v37 = (objc_class *)objc_opt_class();
                    uint64_t v38 = NSStringFromClass(v37);
                    int v39 = [v18 intValue];
                    *(_DWORD *)buf = 138412802;
                    v72 = v38;
                    __int16 v73 = 2112;
                    uint64_t v74 = v45;
                    __int16 v75 = 1024;
                    int v76 = v39;
                    _os_log_error_impl(&dword_1E4220000, v21, OS_LOG_TYPE_ERROR, "Responder Service: '%@' (%@) is dependent upon type '%d' but this dependency is missing. Skipping response...", buf, 0x1Cu);
                  }
                  id v9 = v41;
                  id v5 = v42;
                  double v36 = v41;
                  goto LABEL_38;
                }
                uint64_t v51 = v17;
                if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                {
                  v22 = (objc_class *)objc_opt_class();
                  v23 = NSStringFromClass(v22);
                  int v24 = [v18 intValue];
                  *(_DWORD *)buf = 138412802;
                  v72 = v23;
                  __int16 v73 = 2112;
                  uint64_t v74 = v45;
                  __int16 v75 = 1024;
                  int v76 = v24;
                  _os_log_impl(&dword_1E4220000, v21, OS_LOG_TYPE_INFO, "Responder Service: '%@' (%@) is dependent upon type '%d'.  Linking dependency...", buf, 0x1Cu);
                }
                long long v59 = 0u;
                long long v60 = 0u;
                long long v57 = 0u;
                long long v58 = 0u;
                id v25 = v6;
                uint64_t v26 = [v25 countByEnumeratingWithState:&v57 objects:v70 count:16];
                if (v26)
                {
                  uint64_t v27 = v26;
                  uint64_t v28 = *(void *)v58;
                  do
                  {
                    for (uint64_t i = 0; i != v27; ++i)
                    {
                      if (*(void *)v58 != v28) {
                        objc_enumerationMutation(v25);
                      }
                      uint64_t v30 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                      long long v53 = 0u;
                      long long v54 = 0u;
                      long long v55 = 0u;
                      long long v56 = 0u;
                      v31 = [*(id *)(v52 + 40) objectForKeyedSubscript:v18];
                      uint64_t v32 = [v31 countByEnumeratingWithState:&v53 objects:v69 count:16];
                      if (v32)
                      {
                        uint64_t v33 = v32;
                        uint64_t v34 = *(void *)v54;
                        do
                        {
                          for (uint64_t j = 0; j != v33; ++j)
                          {
                            if (*(void *)v54 != v34) {
                              objc_enumerationMutation(v31);
                            }
                            [v30 addDependency:*(void *)(*((void *)&v53 + 1) + 8 * j)];
                          }
                          uint64_t v33 = [v31 countByEnumeratingWithState:&v53 objects:v69 count:16];
                        }
                        while (v33);
                      }
                    }
                    uint64_t v27 = [v25 countByEnumeratingWithState:&v57 objects:v70 count:16];
                  }
                  while (v27);
                }

                uint64_t v17 = v51 + 1;
                id v6 = v48;
              }
              while (v51 + 1 != v50);
              uint64_t v50 = [obj countByEnumeratingWithState:&v61 objects:v77 count:16];
              if (v50) {
                continue;
              }
              break;
            }
          }

          id v9 = v41;
          id v5 = v42;
          uint64_t v10 = v40;
          uint64_t v15 = v46;
        }

        uint64_t v11 = v44 + 1;
      }
      while (v44 + 1 != v43);
      uint64_t v43 = [v9 countByEnumeratingWithState:&v65 objects:v78 count:16];
    }
    while (v43);
  }

  double v36 = [*(id *)(v52 + 32) executionChain];
  [v36 addObjectsFromArray:v6];
LABEL_38:
}

- (void)run
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(PLBatteryUIResponderService *)self demoMode])
  {
    v3 = [MEMORY[0x1E4F929C0] objectForKey:@"BUI_DEMO_QUERY_TIME" forApplicationID:@"com.apple.powerlogd" synchronize:1];
    id v4 = [MEMORY[0x1E4F929C0] objectForKey:@"BUI_DEMO_QUERY_TIME_OFFSET" forApplicationID:@"com.apple.powerlogd" synchronize:1];
    if (v3)
    {
      [v3 doubleValue];
      double v6 = v5;
    }
    else
    {
      uint64_t v11 = +[PLUtilities getLastBatteryTimestamp];
      uint64_t v12 = [v11 convertFromMonotonicToSystem];
      [v12 timeIntervalSince1970];
      double v6 = v13;
    }
    double v14 = (void *)MEMORY[0x1E4F28ED0];
    [v4 doubleValue];
    uint64_t v16 = [v14 numberWithDouble:v6 + v15];
    uint64_t v17 = [(PLBatteryUIResponderService *)self resultDictionary];
    [v17 setObject:v16 forKeyedSubscript:@"PLBatteryUIQueryTime"];

    uint64_t v18 = PLLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1E4220000, v18, OS_LOG_TYPE_INFO, "Responder Service: Looking for Query Time...", (uint8_t *)&v28, 2u);
    }
  }
  else
  {
    BOOL v7 = (void *)MEMORY[0x1E4F28ED0];
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    [v8 timeIntervalSince1970];
    id v9 = objc_msgSend(v7, "numberWithDouble:");
    uint64_t v10 = [(PLBatteryUIResponderService *)self resultDictionary];
    [v10 setObject:v9 forKeyedSubscript:@"PLBatteryUIQueryTime"];
  }
  v19 = PLLogCommon();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = [(PLBatteryUIResponderService *)self resultDictionary];
    v21 = [v20 objectForKeyedSubscript:@"PLBatteryUIQueryTime"];
    [v21 doubleValue];
    int v28 = 134217984;
    uint64_t v29 = v22;
    _os_log_impl(&dword_1E4220000, v19, OS_LOG_TYPE_INFO, "Responder Service: Query Time = %f", (uint8_t *)&v28, 0xCu);
  }
  v23 = [(PLBatteryUIResponderService *)self operationQueue];
  int v24 = [(PLBatteryUIResponderService *)self executionChain];
  [v23 addOperations:v24 waitUntilFinished:1];

  id v25 = PLLogCommon();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    uint64_t v26 = [(PLBatteryUIResponderService *)self orderOfExecution];
    uint64_t v27 = [v26 componentsJoinedByString:@" -> "];
    int v28 = 138412290;
    uint64_t v29 = v27;
    _os_log_impl(&dword_1E4220000, v25, OS_LOG_TYPE_INFO, "Responder Service: Ran response objects in order: %@", (uint8_t *)&v28, 0xCu);
  }
}

- (void)coalesce
{
  v3 = [(PLBatteryUIResponderService *)self configuration];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __39__PLBatteryUIResponderService_coalesce__block_invoke;
  v15[3] = &unk_1E6E49ED8;
  v15[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v15];

  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  double v5 = [(PLBatteryUIResponderService *)self resultDictionary];
  double v6 = [v5 objectForKeyedSubscript:@"PLBatteryUIQueryTime"];
  [v6 doubleValue];
  BOOL v7 = objc_msgSend(v4, "dateWithTimeIntervalSince1970:");

  id v8 = (void *)MEMORY[0x1E4F28ED0];
  [(PLBatteryUIResponderService *)self endOfDayWithNow:v7];
  id v9 = objc_msgSend(v8, "numberWithDouble:");
  uint64_t v10 = [(PLBatteryUIResponderService *)self resultDictionary];
  [v10 setObject:v9 forKeyedSubscript:@"endOfDay"];

  uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
  [(PLBatteryUIResponderService *)self endOfHourWithNow:v7];
  uint64_t v12 = objc_msgSend(v11, "numberWithDouble:");
  double v13 = [(PLBatteryUIResponderService *)self resultDictionary];
  [v13 setObject:v12 forKeyedSubscript:@"endOfHour"];

  double v14 = [(PLBatteryUIResponderService *)self resultDictionary];
  [v14 setObject:&unk_1F4012348 forKeyedSubscript:@"PLBatteryUIXPCVersionKey"];
}

void __39__PLBatteryUIResponderService_coalesce__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v36 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = PLBatteryUsageUIKeyFromConfiguration();
    double v5 = [v36 objectForKeyedSubscript:@"enum"];
    uint64_t v6 = (int)[v5 intValue];

    uint64_t v7 = PLBatteryUsageUIStringForResponseType();
    id v8 = [*(id *)(a1 + 32) responseCache];
    id v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:v6];
    uint64_t v10 = [v8 objectForKeyedSubscript:v9];
    uint64_t v11 = [v10 count];

    if (v11 == 1)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
      double v13 = [*(id *)(a1 + 32) resultDictionary];
      [v13 setObject:v12 forKeyedSubscript:v7];

      double v14 = [*(id *)(a1 + 32) resultDictionary];
      double v15 = [v14 objectForKeyedSubscript:v7];
      [v15 setObject:v36 forKeyedSubscript:@"configuration"];

      uint64_t v16 = [*(id *)(a1 + 32) responseCache];
      uint64_t v17 = [MEMORY[0x1E4F28ED0] numberWithInteger:v6];
      uint64_t v18 = [v16 objectForKeyedSubscript:v17];
      v19 = [v18 objectForKeyedSubscript:v4];
      v20 = [v19 objectForKeyedSubscript:@"result"];
      v21 = [*(id *)(a1 + 32) resultDictionary];
      v22 = (void *)v7;
      [v21 objectForKeyedSubscript:v7];
      int v24 = v23 = (void *)v4;
      [v24 setObject:v20 forKeyedSubscript:@"result"];
    }
    else
    {
      id v25 = [*(id *)(a1 + 32) resultDictionary];
      uint64_t v26 = [v25 objectForKeyedSubscript:v7];

      if (!v26)
      {
        uint64_t v27 = [MEMORY[0x1E4F1CA60] dictionary];
        int v28 = [*(id *)(a1 + 32) resultDictionary];
        [v28 setObject:v27 forKeyedSubscript:v7];
      }
      uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v30 = [*(id *)(a1 + 32) resultDictionary];
      v31 = [v30 objectForKeyedSubscript:v7];
      [v31 setObject:v29 forKeyedSubscript:v4];

      uint64_t v32 = [*(id *)(a1 + 32) resultDictionary];
      uint64_t v33 = [v32 objectForKeyedSubscript:v7];
      uint64_t v34 = [v33 objectForKeyedSubscript:v4];
      [v34 setObject:v36 forKeyedSubscript:@"configuration"];

      uint64_t v16 = [*(id *)(a1 + 32) responseCache];
      uint64_t v17 = [MEMORY[0x1E4F28ED0] numberWithInteger:v6];
      uint64_t v18 = [v16 objectForKeyedSubscript:v17];
      v19 = [v18 objectForKeyedSubscript:v4];
      v20 = [v19 objectForKeyedSubscript:@"result"];
      v21 = [*(id *)(a1 + 32) resultDictionary];
      v22 = (void *)v7;
      [v21 objectForKeyedSubscript:v7];
      int v24 = v23 = (void *)v4;
      double v35 = [v24 objectForKeyedSubscript:v23];
      [v35 setObject:v20 forKeyedSubscript:@"result"];
    }
  }
}

- (id)result
{
  v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v3, OS_LOG_TYPE_INFO, "Responder Service: Converting response to legacy format...", buf, 2u);
  }

  uint64_t v4 = [(PLBatteryUIResponderService *)self resultDictionary];
  double v5 = [(PLBatteryUIResponderService *)self convertResponseToLegacyFormat:v4];

  uint64_t v6 = (void *)[v5 mutableCopy];
  [(PLBatteryUIResponderService *)self setResultDictionary:v6];

  if ([(PLBatteryUIResponderService *)self skipPlistWrite])
  {
    uint64_t v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl(&dword_1E4220000, v7, OS_LOG_TYPE_INFO, "Skipping write to plist", v38, 2u);
    }

    id v8 = [(PLBatteryUIResponderService *)self resultDictionary];
    id v9 = (void *)[v8 copy];
  }
  else
  {
    uint64_t v10 = +[PLUtilities containerPath];
    uint64_t v11 = [v10 stringByAppendingString:@"/Library/BatteryLife/Debug/"];
    +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:v11];

    uint64_t v12 = +[PLUtilities containerPath];
    id v8 = [v12 stringByAppendingString:@"/Library/BatteryLife/Debug/"];

    double v13 = [(PLBatteryUIResponderService *)self requestingService];

    if (v13)
    {
      double v14 = NSString;
      double v15 = [(PLBatteryUIResponderService *)self requestingService];
      uint64_t v16 = [v14 stringWithFormat:@"BatteryUI%@", v15];

      uint64_t v17 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:1];
      uint64_t v18 = [v17 URLByAppendingPathComponent:v16];

      [v18 URLByAppendingPathExtension:@"plist"];
    }
    else
    {
      v19 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v16 = +[PLUtilities containerPath];
      uint64_t v18 = [v16 stringByAppendingString:@"/Library/BatteryLife/Debug/BatteryUI.plist"];
      [v19 fileURLWithPath:v18];
    v20 = };

    v21 = PLLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponderService result].cold.5();
    }

    v22 = [(PLBatteryUIResponderService *)self resultDictionary];
    id v37 = 0;
    int v23 = [v22 writeToURL:v20 error:&v37];
    id v24 = v37;

    if (v23)
    {
      id v25 = [v20 path];
      +[PLUtilities setMobileOwnerForFile:v25];

      uint64_t v26 = PLLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIResponderService result]();
      }
    }
    else
    {
      uint64_t v26 = PLLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[PLBatteryUIResponderService result].cold.4();
      }
    }

    uint64_t v27 = [(PLBatteryUIResponderService *)self plistCopyDestination];

    if (v27)
    {
      id v28 = v8;
      uint64_t v29 = [(PLBatteryUIResponderService *)self plistCopyDestination];
      BOOL v30 = +[PLUtilities PLCopyItemsFromPath:v28 toPath:v29];

      if (v30)
      {
        v31 = [v20 lastPathComponent];
        uint64_t v32 = [v28 stringByAppendingPathComponent:v31];
        +[PLUtilities markFileAsPurgeable:v32 withUrgency:512];

        uint64_t v33 = PLLogCommon();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          [(PLBatteryUIResponderService *)self result];
        }
      }
      else
      {
        uint64_t v34 = PLLogCommon();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          [(PLBatteryUIResponderService *)self result];
        }

        [(PLBatteryUIResponderService *)self setResultDictionary:0];
      }
    }
    double v35 = [(PLBatteryUIResponderService *)self resultDictionary];
    id v9 = (void *)[v35 copy];
  }
  return v9;
}

- (double)endOfDayWithNow:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  double v5 = [v3 currentCalendar];
  uint64_t v6 = [v5 components:60 fromDate:v4];

  long double v7 = (double)(unint64_t)[v6 valueForComponent:32];
  objc_msgSend(v6, "setValue:forComponent:", (unint64_t)(v7 - fmod(v7, 3.0) + 3.0), 32);
  id v8 = [v5 dateFromComponents:v6];
  id v9 = [v8 convertFromSystemToMonotonic];
  uint64_t v10 = [v9 dateByAddingTimeInterval:-86400.0];
  id v11 = v9;
  [v10 timeIntervalSince1970];
  double v13 = v12;
  [v11 timeIntervalSince1970];
  double v15 = v14;

  uint64_t v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v13 + v15 - v13];
  uint64_t v17 = [v16 convertFromMonotonicToSystem];
  [v17 timeIntervalSince1970];
  double v19 = v18;

  return v19;
}

- (double)endOfHourWithNow:(id)a3
{
  v3 = PLCalculateEndOfHourWithDate();
  [v3 timeIntervalSince1970];
  double v5 = v4;

  return v5;
}

- (id)constructResponseObjectFromType:(int64_t)a3
{
  v23[21] = *MEMORY[0x1E4F143B8];
  v22[0] = &unk_1F400DD50;
  v23[0] = objc_opt_class();
  v22[1] = &unk_1F400DD68;
  v23[1] = objc_opt_class();
  v22[2] = &unk_1F400DD80;
  v23[2] = objc_opt_class();
  v22[3] = &unk_1F400DD98;
  v23[3] = objc_opt_class();
  v22[4] = &unk_1F400DDB0;
  v23[4] = objc_opt_class();
  v22[5] = &unk_1F400DDC8;
  v23[5] = objc_opt_class();
  v22[6] = &unk_1F400DDE0;
  v23[6] = objc_opt_class();
  v22[7] = &unk_1F400DDF8;
  v23[7] = objc_opt_class();
  v22[8] = &unk_1F400DE10;
  v23[8] = objc_opt_class();
  v22[9] = &unk_1F400DE28;
  v23[9] = objc_opt_class();
  v22[10] = &unk_1F400DE40;
  v23[10] = objc_opt_class();
  v22[11] = &unk_1F400DE58;
  v23[11] = objc_opt_class();
  v22[12] = &unk_1F400DE70;
  v23[12] = objc_opt_class();
  v22[13] = &unk_1F400DE88;
  v23[13] = objc_opt_class();
  v22[14] = &unk_1F400DEA0;
  v23[14] = objc_opt_class();
  v22[15] = &unk_1F400DEB8;
  v23[15] = objc_opt_class();
  v22[16] = &unk_1F400DED0;
  v23[16] = objc_opt_class();
  v22[17] = &unk_1F400DEE8;
  v23[17] = objc_opt_class();
  v22[18] = &unk_1F400DF00;
  v23[18] = objc_opt_class();
  v22[19] = &unk_1F400DF18;
  v23[19] = objc_opt_class();
  v22[20] = &unk_1F400DF30;
  v23[20] = objc_opt_class();
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:21];
  int v6 = _os_feature_enabled_impl();
  long double v7 = PLLogCommon();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8) {
      -[PLBatteryUIResponderService constructResponseObjectFromType:]();
    }

    id v9 = [v5 mutableCopy];
    [v9 setObject:objc_opt_class() forKeyedSubscript:&unk_1F400DF48];
    long double v7 = v5;
  }
  else
  {
    if (v8) {
      -[PLBatteryUIResponderService constructResponseObjectFromType:].cold.4();
    }
    id v9 = v5;
  }

  int v10 = _os_feature_enabled_impl();
  id v11 = PLLogCommon();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12) {
      -[PLBatteryUIResponderService constructResponseObjectFromType:]();
    }
  }
  else if (v12)
  {
    -[PLBatteryUIResponderService constructResponseObjectFromType:]();
  }

  double v13 = [v9 allKeys];
  double v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  int v15 = [v13 containsObject:v14];

  if (v15)
  {
    uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    uint64_t v17 = (objc_class *)(id)[v9 objectForKeyedSubscript:v16];

    id v18 = objc_alloc_init(v17);
    id v19 = objc_initWeak(&v21, self);
    [v18 setResponderService:self];

    objc_destroyWeak(&v21);
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (id)convertResponseToLegacyFormat:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F1CA60] dictionary];
  int v6 = [v4 objectForKeyedSubscript:@"endOfHour"];
  [v5 setObject:v6 forKeyedSubscript:@"endOfHour"];

  long double v7 = [v4 objectForKeyedSubscript:@"endOfDay"];
  [v5 setObject:v7 forKeyedSubscript:@"endOfDay"];

  BOOL v8 = [v4 objectForKeyedSubscript:@"PLBatteryUIXPCVersionKey"];
  [v5 setObject:v8 forKeyedSubscript:@"PLBatteryUIXPCVersionKey"];

  id v9 = [v4 objectForKeyedSubscript:@"PLBatteryUIQueryTime"];
  [v5 setObject:v9 forKeyedSubscript:@"PLBatteryUIQueryTime"];

  int v10 = [MEMORY[0x1E4F1CA60] dictionary];
  [v5 setObject:v10 forKeyedSubscript:@"Breakdown"];

  id v11 = [MEMORY[0x1E4F1CA48] array];
  BOOL v12 = [v5 objectForKeyedSubscript:@"Breakdown"];
  [v12 setObject:v11 forKeyedSubscript:@"PLBatteryUISuggestionArrayKey"];

  double v13 = [MEMORY[0x1E4F1CA60] dictionary];
  [v5 setObject:v13 forKeyedSubscript:@"Graph"];

  double v14 = [MEMORY[0x1E4F1CA60] dictionary];
  int v15 = [v5 objectForKeyedSubscript:@"Graph"];
  [v15 setObject:v14 forKeyedSubscript:@"PLBatteryUIGraph24hrs"];

  uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v17 = [v5 objectForKeyedSubscript:@"Graph"];
  [v17 setObject:v16 forKeyedSubscript:@"PLBatteryUIGraphDays"];

  id v18 = [v5 objectForKeyedSubscript:@"Breakdown"];
  [v18 setObject:&unk_1F400DF60 forKeyedSubscript:@"PLBatteryUIDataDurationKey"];

  id v19 = [MEMORY[0x1E4F1CA48] array];
  v20 = [v5 objectForKeyedSubscript:@"Breakdown"];
  [v20 setObject:v19 forKeyedSubscript:@"PLBatteryUIUrsaIssuesKey"];

  int v21 = 10;
  do
  {
    v22 = [v5 objectForKeyedSubscript:@"Graph"];
    int v23 = [v22 objectForKeyedSubscript:@"PLBatteryUIGraphDays"];
    id v24 = [MEMORY[0x1E4F1CA60] dictionary];
    [v23 addObject:v24];

    --v21;
  }
  while (v21);
  id v25 = [(PLBatteryUIResponderService *)self configuration];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke;
  v31[3] = &unk_1E6E4A608;
  id v32 = v4;
  id v26 = v5;
  id v33 = v26;
  id v27 = v4;
  [v25 enumerateKeysAndObjectsUsingBlock:v31];

  id v28 = v33;
  id v29 = v26;

  return v29;
}

void __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [v4 objectForKeyedSubscript:@"enum"];
    uint64_t v6 = (int)[v5 intValue];

    long double v7 = [v4 objectForKeyedSubscript:@"bucket"];
    [v7 doubleValue];
    double v9 = v8;

    int v10 = [v4 objectForKeyedSubscript:@"end"];
    [v10 doubleValue];
    double v12 = v11;
    double v13 = [v4 objectForKeyedSubscript:@"start"];
    [v13 doubleValue];
    double v15 = v14;

    uint64_t v16 = PLBatteryUsageUIStringForResponseType();
    uint64_t v17 = PLBatteryUsageUIKeyFromConfiguration();
    id v18 = [*(id *)(a1 + 32) objectForKeyedSubscript:v16];
    id v19 = [v18 objectForKeyedSubscript:@"result"];
    v20 = [*(id *)(a1 + 32) objectForKeyedSubscript:v16];
    int v21 = v20;
    if (v19)
    {
      v22 = [v20 objectForKeyedSubscript:@"result"];
    }
    else
    {
      [v20 objectForKeyedSubscript:v17];
      uint64_t v23 = a1;
      id v24 = v16;
      id v26 = v25 = v17;
      v22 = [v26 objectForKeyedSubscript:@"result"];

      uint64_t v17 = v25;
      uint64_t v16 = v24;
      a1 = v23;
    }

    if (v22)
    {
      double v27 = v12 - v15;
      switch(v6)
      {
        case 0:
          if (v27 == 86400.0)
          {
            id v28 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Graph"];
            uint64_t v52 = [v28 objectForKeyedSubscript:@"PLBatteryUIGraph24hrs"];
            id v29 = v52;
            long long v53 = @"PLBatteryUIChargingIntervalsKey";
            goto LABEL_54;
          }
          break;
        case 1:
        case 2:
        case 3:
        case 4:
          BOOL v30 = [v22 objectForKeyedSubscript:@"PLBatteryUIDataDurationKey"];
          double v31 = (double)(int)[v30 intValue];

          id v32 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Breakdown"];
          id v33 = [v32 objectForKeyedSubscript:@"PLBatteryUIDataDurationKey"];
          [v33 doubleValue];
          double v35 = v34;

          if (v35 < v31)
          {
            id v36 = PLLogCommon();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              double v97 = v31;
              _os_log_impl(&dword_1E4220000, v36, OS_LOG_TYPE_INFO, "Maximum Data Duration = %f", buf, 0xCu);
            }

            id v37 = [MEMORY[0x1E4F28ED0] numberWithDouble:v31];
            uint64_t v38 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Breakdown"];
            [v38 setObject:v37 forKeyedSubscript:@"PLBatteryUIDataDurationKey"];
          }
          if (v27 == 86400.0 && v9 == 86400.0)
          {
            int v39 = [v22 objectForKeyedSubscript:@"PLBatteryUIBreakdownKey"];
            uint64_t v40 = [v39 firstObject];
            id v41 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Breakdown"];
            [v41 setObject:v40 forKeyedSubscript:@"PLBatteryUIQueryRangeDayKey"];
          }
          if (v27 == 86400.0 && v9 == 3600.0)
          {
            id v42 = [v22 objectForKeyedSubscript:@"PLBatteryUIBreakdownKey"];
            uint64_t v43 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Breakdown"];
            [v43 setObject:v42 forKeyedSubscript:@"PLBatteryUIQueryRangeDayTapKey"];
          }
          if (v27 == 864000.0 && v9 == 864000.0)
          {
            uint64_t v44 = [v22 objectForKeyedSubscript:@"PLBatteryUIBreakdownKey"];
            uint64_t v45 = [v44 firstObject];
            long long v46 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Breakdown"];
            [v46 setObject:v45 forKeyedSubscript:@"PLBatteryUIQueryRangeWeekKey"];
          }
          if (v27 == 864000.0 && v9 == 86400.0)
          {
            long long v47 = [v22 objectForKeyedSubscript:@"PLBatteryUIBreakdownKey"];
            id v48 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Breakdown"];
            [v48 setObject:v47 forKeyedSubscript:@"PLBatteryUIQueryRangeWeekTapKey"];
          }
          if (v27 == 10800.0 && v9 == 10800.0)
          {
            id v49 = [v22 objectForKeyedSubscript:@"PLBatteryUIBreakdownKey"];
            uint64_t v50 = [v49 firstObject];
            uint64_t v51 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Breakdown"];
            [v51 setObject:v50 forKeyedSubscript:@"PLBatteryUIQueryRangeDayKey"];

            goto LABEL_28;
          }
          break;
        case 5:
          long long v54 = *(void **)(a1 + 40);
          long long v55 = @"PLBatteryUILastChargeKey";
          goto LABEL_49;
        case 6:
          if (v27 == 864000.0 && v9 == 86400.0)
          {
            id v49 = v22;
            long long v56 = PLLogCommon();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
              __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke_cold_2(v49, v56);
            }

            v90[0] = MEMORY[0x1E4F143A8];
            v90[1] = 3221225472;
            v90[2] = __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke_214;
            v90[3] = &unk_1E6E4A5B8;
            id v91 = *(id *)(a1 + 40);
            [v49 enumerateObjectsUsingBlock:v90];

LABEL_28:
          }
          break;
        case 7:
          if (v27 != 86400.0 || v9 != 900.0) {
            break;
          }
          id v28 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Graph"];
          uint64_t v52 = [v28 objectForKeyedSubscript:@"PLBatteryUIGraph24hrs"];
          id v29 = v52;
          long long v53 = @"PLBatteryUIBatteryLevelsKey";
          goto LABEL_54;
        case 8:
          if (v27 == 86400.0 && v9 == 3600.0)
          {
            v94[0] = @"PLBatteryUIGraphHourly";
            v83 = [v22 objectForKeyedSubscript:@"PLBatteryUIScreenOnTimeKey"];
            uint64_t v81 = [v83 objectForKeyedSubscript:@"PLBatteryUIGraphByBucket"];
            v95[0] = v81;
            v94[1] = @"PLBatteryUIGraphTotal";
            long long v57 = [v22 objectForKeyedSubscript:@"PLBatteryUIScreenOnTimeKey"];
            long long v58 = [v57 objectForKeyedSubscript:@"PLBatteryUIGraphTotal"];
            v95[1] = v58;
            long long v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:2];
            [*(id *)(a1 + 40) objectForKeyedSubscript:@"Graph"];
            long long v60 = v85 = v17;
            long long v61 = [v60 objectForKeyedSubscript:@"PLBatteryUIGraph24hrs"];
            [v61 setObject:v59 forKeyedSubscript:@"PLBatteryUIScreenOnTimeKey"];

            v92[0] = @"PLBatteryUIGraphHourly";
            v84 = [v22 objectForKeyedSubscript:@"PLBatteryUIScreenOffTimeKey"];
            v82 = [v84 objectForKeyedSubscript:@"PLBatteryUIGraphByBucket"];
            v92[1] = @"PLBatteryUIGraphTotal";
            v93[0] = v82;
            long long v62 = [v22 objectForKeyedSubscript:@"PLBatteryUIScreenOffTimeKey"];
            long long v63 = [v62 objectForKeyedSubscript:@"PLBatteryUIGraphTotal"];
            v93[1] = v63;
            long long v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:2];
            long long v65 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Graph"];
            long long v66 = [v65 objectForKeyedSubscript:@"PLBatteryUIGraph24hrs"];
            [v66 setObject:v64 forKeyedSubscript:@"PLBatteryUIScreenOffTimeKey"];

            uint64_t v17 = v85;
          }
          if (v27 == 864000.0 && v9 == 86400.0)
          {
            long long v67 = [v22 objectForKeyedSubscript:@"PLBatteryUIScreenOnTimeKey"];
            long long v68 = [v67 objectForKeyedSubscript:@"PLBatteryUIGraphByBucket"];

            id v69 = [v22 objectForKeyedSubscript:@"PLBatteryUIScreenOffTimeKey"];
            v70 = [v69 objectForKeyedSubscript:@"PLBatteryUIGraphByBucket"];

            v88[0] = MEMORY[0x1E4F143A8];
            v88[1] = 3221225472;
            v88[2] = __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke_249;
            v88[3] = &unk_1E6E4A5E0;
            id v89 = *(id *)(a1 + 40);
            [v68 enumerateObjectsUsingBlock:v88];
            v86[0] = MEMORY[0x1E4F143A8];
            v86[1] = 3221225472;
            v86[2] = __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke_2;
            v86[3] = &unk_1E6E4A5E0;
            id v87 = *(id *)(a1 + 40);
            [v70 enumerateObjectsUsingBlock:v86];
          }
          v71 = (void *)MEMORY[0x1E4F28ED0];
          v72 = [v22 objectForKeyedSubscript:@"PLBatteryUIDidAdjustTimesKey"];
          __int16 v73 = objc_msgSend(v71, "numberWithBool:", objc_msgSend(v72, "BOOLValue"));
          uint64_t v74 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Graph"];
          [v74 setObject:v73 forKeyedSubscript:@"PLBatteryUIDidAdjustTimesKey"];

          break;
        case 9:
          if (_os_feature_enabled_impl())
          {
            long long v54 = *(void **)(a1 + 40);
            long long v55 = @"PLBatteryUIPausedChargingKey";
LABEL_49:
            [v54 setObject:v22 forKeyedSubscript:v55];
          }
          else
          {
            id v28 = PLLogCommon();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
              __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke_cold_1();
            }
LABEL_59:
          }
          break;
        case 10:
          if (v27 != 86400.0) {
            break;
          }
          __int16 v75 = PLLogCommon();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            double v97 = *(double *)&v22;
            _os_log_impl(&dword_1E4220000, v75, OS_LOG_TYPE_INFO, "response=%@", buf, 0xCu);
          }

          id v28 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Graph"];
          uint64_t v52 = [v28 objectForKeyedSubscript:@"PLBatteryUIGraph24hrs"];
          id v29 = v52;
          long long v53 = @"PLBatteryUIChargingStateIntervalsDictKey";
LABEL_54:
          [v52 setObject:v22 forKeyedSubscript:v53];
          goto LABEL_58;
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 21:
          if (![v22 count]) {
            break;
          }
          id v28 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Breakdown"];
          id v29 = [v28 objectForKeyedSubscript:@"PLBatteryUISuggestionArrayKey"];
          [v29 addObject:v22];
          goto LABEL_58;
        case 18:
          int v76 = @"hasNoteworthyInformation";
          goto LABEL_61;
        case 19:
          v77 = [v22 objectForKeyedSubscript:@"UrsaDefinition"];
          uint64_t v78 = [v77 count];

          if (!v78) {
            break;
          }
          id v28 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Breakdown"];
          id v29 = [v28 objectForKeyedSubscript:@"PLBatteryUIUrsaIssuesKey"];
          uint64_t v79 = [v22 objectForKeyedSubscript:@"UrsaDefinition"];
          [v29 addObjectsFromArray:v79];

LABEL_58:
          goto LABEL_59;
        case 20:
          int v76 = @"buiMappings";
LABEL_61:
          v80 = [v22 objectForKeyedSubscript:v76];
          [*(id *)(a1 + 40) setObject:v80 forKeyedSubscript:v76];

          break;
        default:
          break;
      }
    }
  }
}

void __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke_214(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 objectForKeyedSubscript:@"Graph"];
  long double v7 = [v6 objectForKeyedSubscript:@"PLBatteryUIGraphDays"];
  id v9 = [v7 objectAtIndex:a3];

  double v8 = [v5 objectForKeyedSubscript:@"PLBatteryUIEnergyKey"];

  [v9 setObject:v8 forKeyedSubscript:@"PLBatteryUIEnergyKey"];
}

void __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke_249(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 objectForKeyedSubscript:@"Graph"];
  long double v7 = [v6 objectForKeyedSubscript:@"PLBatteryUIGraphDays"];
  id v9 = [v7 objectAtIndex:a3];

  double v8 = [MEMORY[0x1E4F1CA60] dictionary];
  [v8 setObject:v5 forKeyedSubscript:@"PLBatteryUIGraphTotal"];

  [v9 setObject:v8 forKeyedSubscript:@"PLBatteryUIScreenOnTimeKey"];
}

void __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 objectForKeyedSubscript:@"Graph"];
  long double v7 = [v6 objectForKeyedSubscript:@"PLBatteryUIGraphDays"];
  id v9 = [v7 objectAtIndex:a3];

  double v8 = [MEMORY[0x1E4F1CA60] dictionary];
  [v8 setObject:v5 forKeyedSubscript:@"PLBatteryUIGraphTotal"];

  [v9 setObject:v8 forKeyedSubscript:@"PLBatteryUIScreenOffTimeKey"];
}

- (BOOL)demoMode
{
  int v2 = [MEMORY[0x1E4F92A38] internalBuild];
  if (v2)
  {
    if (demoMode_onceToken_0 != -1) {
      dispatch_once(&demoMode_onceToken_0, &__block_literal_global_30);
    }
    LOBYTE(v2) = demoMode_demoMode != 0;
  }
  return v2;
}

void __39__PLBatteryUIResponderService_demoMode__block_invoke()
{
  +[PLUtilities containerPath];
  id v0 = (id)_CFPreferencesCopyAppValueWithContainer();
  demoMode_demoMode = [v0 BOOLValue];
}

- (id)demoPath
{
  if (demoPath_onceToken != -1) {
    dispatch_once(&demoPath_onceToken, &__block_literal_global_271);
  }
  int v2 = (void *)demoPath_demoPath;
  return v2;
}

uint64_t __39__PLBatteryUIResponderService_demoPath__block_invoke()
{
  +[PLUtilities containerPath];
  uint64_t result = _CFPreferencesCopyAppValueWithContainer();
  if (result)
  {
    demoPath_demoPath = result;
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 56, 1);
}

- (void)setResponderService:(id)a3
{
}

- (NSMutableArray)dependencies
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDependencies:(id)a3
{
}

- (NSMutableDictionary)responseCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setResponseCache:(id)a3
{
}

- (NSMutableDictionary)sharedUtilityCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSharedUtilityCache:(id)a3
{
}

- (NSString)requestingService
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRequestingService:(id)a3
{
}

- (NSString)plistCopyDestination
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPlistCopyDestination:(id)a3
{
}

- (BOOL)skipPlistWrite
{
  return self->_skipPlistWrite;
}

- (void)setSkipPlistWrite:(BOOL)a3
{
  self->_skipPlistWrite = a3;
}

- (NSMutableDictionary)resultDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setResultDictionary:(id)a3
{
}

- (PLXPCResponderOperatorComposition)queryResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setQueryResponder:(id)a3
{
}

- (NSDictionary)configuration
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (NSMutableDictionary)requestedObjects
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRequestedObjects:(id)a3
{
}

- (NSMutableArray)executionChain
{
  return (NSMutableArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setExecutionChain:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 144, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (NSMutableArray)orderOfExecution
{
  return (NSMutableArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setOrderOfExecution:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderOfExecution, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_executionChain, 0);
  objc_storeStrong((id *)&self->_requestedObjects, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_queryResponder, 0);
  objc_storeStrong((id *)&self->_resultDictionary, 0);
  objc_storeStrong((id *)&self->_plistCopyDestination, 0);
  objc_storeStrong((id *)&self->_requestingService, 0);
  objc_storeStrong((id *)&self->_sharedUtilityCache, 0);
  objc_storeStrong((id *)&self->_responseCache, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

void __55__PLBatteryUIResponderService_initOperatorDependancies__block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, v0, v1, "Responder Service: Loading '%@'...", v2);
}

void __55__PLBatteryUIResponderService_initOperatorDependancies__block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1E4220000, v0, OS_LOG_TYPE_ERROR, "Responder Service: '%@' does not exist.", v1, 0xCu);
}

void __55__PLBatteryUIResponderService_initOperatorDependancies__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Responder Service: Demo Mode is enabled.", v2, v3, v4, v5, v6);
}

void __41__PLBatteryUIResponderService_configure___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_9(&dword_1E4220000, a2, a3, "Responder Service: Failed to initialize type %ld with configuration %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)result
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, v0, v1, "Attempting to create file %@", v2);
}

- (void)constructResponseObjectFromType:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "\"bui_last_charge_watchOS\" feature flag is enabled", v2, v3, v4, v5, v6);
}

- (void)constructResponseObjectFromType:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "\"bui_last_charge_watchOS\" feature flag is disabled. Not adding Paused Charging as a possible request.", v2, v3, v4, v5, v6);
}

- (void)constructResponseObjectFromType:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "\"bui_last_charge_iOS\" feature flag is enabled", v2, v3, v4, v5, v6);
}

- (void)constructResponseObjectFromType:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "\"bui_last_charge_iOS\" feature flag is disabled. Not adding Paused Charging as a possible request.", v2, v3, v4, v5, v6);
}

void __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "\"bui_last_charge_iOS\" feature flag is disabled. Not adding response to Paused Charging.", v2, v3, v4, v5, v6);
}

void __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v3, "Got %lu 10d UISoC", v4);
}

@end