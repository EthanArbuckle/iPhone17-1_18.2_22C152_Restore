@interface PLCoreOperator
+ (id)registeredOperators;
+ (id)registeredOperatorsOfSuperClassType:(Class)a3;
+ (void)registerOperator:(Class)a3;
- (NSMutableDictionary)operators;
- (PLCoreOperator)init;
- (id)allOperators;
- (id)tablesToTrimConditionsForTrimDate:(id)a3;
- (void)dealloc;
- (void)initOperatorDependancies;
- (void)initOperatorDependanciesWithBlock:(id)a3;
- (void)initTaskOperatorDependancies;
- (void)log;
- (void)setOperators:(id)a3;
- (void)setupEntryObjectsAndStorage:(id)a3;
- (void)startOperatorsOfSuperClassType:(Class)a3;
- (void)startServicesForPreUnlockTelemetry;
@end

@implementation PLCoreOperator

+ (void)registerOperator:(Class)a3
{
  if (registerOperator__onceToken != -1) {
    dispatch_once(&registerOperator__onceToken, &__block_literal_global_3);
  }
  for (i = (void *)[(objc_class *)a3 superclass];
        i != objc_opt_class();
        i = (void *)[i superclass])
  {
    if (i == objc_opt_class()) {
      break;
    }
    if (i == objc_opt_class()) {
      break;
    }
  }
  v5 = [(id)_registeredOperators objectForKeyedSubscript:i];

  if (!v5)
  {
    id v6 = (id)_registeredOperators;
    objc_sync_enter(v6);
    v7 = [(id)_registeredOperators objectForKeyedSubscript:i];

    if (!v7)
    {
      v8 = objc_opt_new();
      [(id)_registeredOperators setObject:v8 forKeyedSubscript:i];
    }
    objc_sync_exit(v6);
  }
  if (+[PLDefaults debugEnabled])
  {
    v9 = [NSString stringWithFormat:@"%@ %@ registered", i, a3];
    v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLCoreOperator.m"];
    v11 = [v10 lastPathComponent];
    v12 = [NSString stringWithUTF8String:"+[PLCoreOperator registerOperator:]"];
    +[PLCoreStorage logMessage:v9 fromFile:v11 fromFunction:v12 fromLineNumber:38];

    v13 = PLLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
  }
  v14 = [(id)_registeredOperators objectForKeyedSubscript:i];
  objc_sync_enter(v14);
  v15 = [(id)_registeredOperators objectForKeyedSubscript:i];
  [v15 addObject:a3];

  objc_sync_exit(v14);
}

uint64_t __35__PLCoreOperator_registerOperator___block_invoke()
{
  _registeredOperators = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (id)registeredOperatorsOfSuperClassType:(Class)a3
{
  return (id)[(id)_registeredOperators objectForKeyedSubscript:a3];
}

+ (id)registeredOperators
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class() || (uint64_t v4 = objc_opt_class(), v4 == objc_opt_class()))
  {
    v5 = [a1 registeredOperatorsOfSuperClassType:objc_opt_class()];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (PLCoreOperator)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLCoreOperator;
  v2 = [(PLCoreOperator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    operators = v2->_operators;
    v2->_operators = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)PLCoreOperator;
  [(PLCoreOperator *)&v5 dealloc];
}

- (void)initOperatorDependancies
{
}

void __42__PLCoreOperator_initOperatorDependancies__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PLCoreOperator_initOperatorDependancies__block_invoke_2;
  block[3] = &unk_1E62538C8;
  id v6 = v2;
  id v4 = v2;
  dispatch_async(v3, block);
}

uint64_t __42__PLCoreOperator_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) className];
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1BBD2F000, v2, OS_LOG_TYPE_DEFAULT, "Calling %@ initOperatorDependancies", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) initOperatorDependancies];
}

- (void)initOperatorDependanciesWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  int v5 = [(PLCoreOperator *)self operators];
  uint64_t v6 = objc_sync_enter(v5);
  uint64_t v7 = (void *)MEMORY[0x1C1869120](v6);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = [(PLCoreOperator *)self operators];
  v9 = [v8 allValues];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        if (v4) {
          v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * v12));
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v5);
}

- (void)initTaskOperatorDependancies
{
  if (!+[PLDefaults liteMode])
  {
    if (!+[PLDefaults taskMode]
      || (+[PLCoreStorage additionalTables],
          uint64_t v3 = objc_claimAutoreleasedReturnValue(),
          v3,
          v3))
    {
      [(PLCoreOperator *)self initOperatorDependanciesWithBlock:&__block_literal_global_28];
    }
  }
}

void __46__PLCoreOperator_initTaskOperatorDependancies__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[PLCoreStorage additionalTables];
  id v4 = [v2 className];
  int v5 = [v3 objectForKey:v4];
  if (v5)
  {

LABEL_4:
    uint64_t v7 = [v2 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PLCoreOperator_initTaskOperatorDependancies__block_invoke_2;
    block[3] = &unk_1E62538C8;
    id v9 = v2;
    dispatch_async(v7, block);

    goto LABEL_5;
  }
  BOOL v6 = +[PLDefaults fullMode];

  if (v6) {
    goto LABEL_4;
  }
LABEL_5:
}

uint64_t __46__PLCoreOperator_initTaskOperatorDependancies__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) initTaskOperatorDependancies];
}

- (void)startServicesForPreUnlockTelemetry
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = NSClassFromString(&cfstr_Plxpcservice.isa);
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [(PLCoreOperator *)self setupEntryObjectsAndStorage:v3];
}

- (void)startOperatorsOfSuperClassType:(Class)a3
{
  int v5 = [(id)objc_opt_class() registeredOperatorsOfSuperClassType:a3];
  uint64_t v6 = [v5 count];

  if (v6) {
    [(id)objc_opt_class() registeredOperatorsOfSuperClassType:a3];
  }
  else {
  uint64_t v7 = +[PLUtilities allSubClassesForClass:a3];
  }
  if (+[PLDefaults debugEnabled])
  {
    v8 = [NSString stringWithFormat:@"%@ availableOperators=%@", a3, v7];
    id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLCoreOperator.m"];
    uint64_t v10 = [v9 lastPathComponent];
    uint64_t v11 = [NSString stringWithUTF8String:"-[PLCoreOperator startOperatorsOfSuperClassType:]"];
    +[PLCoreStorage logMessage:v8 fromFile:v10 fromFunction:v11 fromLineNumber:123];

    uint64_t v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
  }
  [(PLCoreOperator *)self setupEntryObjectsAndStorage:v7];
}

- (void)setupEntryObjectsAndStorage:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if ([v8 isEnabled]) {
          +[PLEntryKey setupEntryObjectsForOperatorClass:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v5);
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v3;
  uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0x1E6253000uLL;
    uint64_t v12 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(objc_class **)(*((void *)&v33 + 1) + 8 * j);
        long long v15 = NSStringFromClass(v14);
        int v16 = [(objc_class *)v14 isEnabled];
        int v17 = [*(id *)(v11 + 936) debugEnabled];
        if (v16)
        {
          if (v17)
          {
            uint64_t v18 = [NSString stringWithFormat:@"Setting-up %@", v15];
            v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLCoreOperator.m"];
            v20 = [v19 lastPathComponent];
            v21 = [NSString stringWithUTF8String:"-[PLCoreOperator setupEntryObjectsAndStorage:]"];
            +[PLCoreStorage logMessage:v18 fromFile:v20 fromFunction:v21 fromLineNumber:139];

            v22 = PLLogCommon();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v42 = v18;
              _os_log_debug_impl(&dword_1BBD2F000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            unint64_t v11 = 0x1E6253000;
          }
          v23 = +[PLUtilities workQueueForKey:v15];
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __46__PLCoreOperator_setupEntryObjectsAndStorage___block_invoke;
          v30[3] = &unk_1E6253A28;
          v32 = v14;
          v30[4] = self;
          id v31 = v15;
          +[PLUtilities dispatchSyncIfNotCallerQueue:v23 withBlock:v30];
        }
        else
        {
          if (!v17) {
            goto LABEL_26;
          }
          v23 = [NSString stringWithFormat:@"Skipping %@", v15];
          v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLCoreOperator.m"];
          v25 = [v24 lastPathComponent];
          v26 = [NSString stringWithUTF8String:"-[PLCoreOperator setupEntryObjectsAndStorage:]"];
          +[PLCoreStorage logMessage:v23 fromFile:v25 fromFunction:v26 fromLineNumber:156];

          v27 = PLLogCommon();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v23;
            _os_log_debug_impl(&dword_1BBD2F000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v11 = 0x1E6253000;
        }

LABEL_26:
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v10);
  }
}

void __46__PLCoreOperator_setupEntryObjectsAndStorage___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1C1869120]();
  id v3 = [*(id *)(a1 + 48) operator];
  if (v3)
  {
    uint64_t v4 = +[PowerlogCore sharedCore];
    uint64_t v5 = [v4 storage];
    [v5 setupStorageForOperator:v3];

    uint64_t v6 = [*(id *)(a1 + 32) operators];
    objc_sync_enter(v6);
    uint64_t v7 = [*(id *)(a1 + 32) operators];
    [v7 setObject:v3 forKey:*(void *)(a1 + 40)];

    objc_sync_exit(v6);
    if (+[PLDefaults debugEnabled])
    {
      v8 = [NSString stringWithFormat:@"%@ is running", *(void *)(a1 + 40)];
      uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLCoreOperator.m"];
      uint64_t v10 = [v9 lastPathComponent];
      unint64_t v11 = [NSString stringWithUTF8String:"-[PLCoreOperator setupEntryObjectsAndStorage:]_block_invoke"];
      +[PLCoreStorage logMessage:v8 fromFile:v10 fromFunction:v11 fromLineNumber:149];

      uint64_t v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_7;
      }
      goto LABEL_8;
    }
  }
  else if (+[PLDefaults debugEnabled])
  {
    v8 = [NSString stringWithFormat:@"%@ failed setup", *(void *)(a1 + 40)];
    long long v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLCoreOperator.m"];
    long long v14 = [v13 lastPathComponent];
    long long v15 = [NSString stringWithUTF8String:"-[PLCoreOperator setupEntryObjectsAndStorage:]_block_invoke"];
    +[PLCoreStorage logMessage:v8 fromFile:v14 fromFunction:v15 fromLineNumber:151];

    uint64_t v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
LABEL_7:
    }
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
LABEL_8:
  }
}

- (void)log
{
  id v3 = +[PLUtilities workQueueForClass:objc_opt_class()];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__PLCoreOperator_log__block_invoke;
  block[3] = &unk_1E62538C8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __21__PLCoreOperator_log__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v1 = [*(id *)(a1 + 32) allOperators];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8 * v5);
        uint64_t v7 = +[PLUtilities workQueueForClass:objc_opt_class()];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __21__PLCoreOperator_log__block_invoke_2;
        block[3] = &unk_1E62538C8;
        void block[4] = v6;
        dispatch_sync(v7, block);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
}

void __21__PLCoreOperator_log__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1C1869120]();
  [*(id *)(a1 + 32) log];
}

- (id)tablesToTrimConditionsForTrimDate:(id)a3
{
  return 0;
}

- (id)allOperators
{
  uint64_t v3 = [(PLCoreOperator *)self operators];
  objc_sync_enter(v3);
  uint64_t v4 = [(PLCoreOperator *)self operators];
  uint64_t v5 = [v4 allValues];

  objc_sync_exit(v3);
  return v5;
}

- (NSMutableDictionary)operators
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOperators:(id)a3
{
}

- (void).cxx_destruct
{
}

@end