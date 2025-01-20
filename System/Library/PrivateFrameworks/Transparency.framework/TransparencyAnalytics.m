@interface TransparencyAnalytics
+ (BOOL)doWithAnalyticsForEventName:(id)a3 error:(id *)a4 block:(id)a5;
+ (BOOL)hasInternalDiagnostics;
+ (id)analyticsApplications;
+ (id)analyticsErrorData:(id)a3;
+ (id)errorChain:(id)a3 depth:(unint64_t)a4;
+ (id)formatEventName:(id)a3 application:(id)a4;
+ (id)logger;
+ (unint64_t)doKTResultWithAnalyticsForEventName:(id)a3 error:(id *)a4 block:(id)a5;
+ (unint64_t)doKTResultWithAnalyticsForEventName:(id)a3 validateType:(unint64_t)a4 error:(id *)a5 block:(id)a6;
+ (void)unsetGlobalLogger;
- (BOOL)skipLogResult:(id)a3;
- (NSHashTable)nfsObserver;
- (SFAnalytics)sfanalytics;
- (TransparencyAnalytics)init;
- (id)dailyMetrics;
- (id)datePropertyForKey:(id)a3;
- (id)failureKey:(id)a3;
- (id)fuzzyTimeSinceDateKey:(id)a3;
- (id)fuzzyTimeSinceLastSuccess:(id)a3;
- (id)nfsReporting;
- (id)numberPropertyForKey:(id)a3;
- (int)token;
- (unsigned)manateeStatusForReporting;
- (void)addMultiSamplerForName:(id)a3 withTimeInterval:(double)a4 block:(id)a5;
- (void)addNFSReporting:(id)a3;
- (void)addUserInfoAttributes:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)incrementIntegerPropertyForKey:(id)a3;
- (void)loadCollectionConfiguration;
- (void)logHardFailureForEventNamed:(id)a3 withAttributes:(id)a4;
- (void)logMetric:(id)a3 withName:(id)a4;
- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5;
- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5 withAttributes:(id)a6;
- (void)logSoftFailureForEventNamed:(id)a3 withAttributes:(id)a4;
- (void)logSuccessForEventNamed:(id)a3;
- (void)noteEventNamed:(id)a3;
- (void)removeMultiSamplerForName:(id)a3;
- (void)setDateProperty:(id)a3 forKey:(id)a4;
- (void)setFailureNowForPropertyKey:(id)a3;
- (void)setMetricsAccountID:(id)a3;
- (void)setNfsObserver:(id)a3;
- (void)setNumberProperty:(id)a3 forKey:(id)a4;
- (void)setSfanalytics:(id)a3;
- (void)setSuccessNowForPropertyKey:(id)a3;
- (void)setToken:(int)a3;
- (void)setupCollection;
- (void)updateCollectionConfigurationWithData:(id)a3;
@end

@implementation TransparencyAnalytics

+ (id)logger
{
  os_unfair_lock_lock((os_unfair_lock_t)&analytics_lock);
  if (!analytics)
  {
    v2 = [MEMORY[0x263F08AB0] processInfo];
    v3 = [v2 processName];

    int v4 = [v3 isEqualToString:@"transparencyd"];
    int v5 = [v3 isEqualToString:@"swtransparencyd"];
    v6 = objc_alloc_init(TransparencyAnalytics);
    v7 = (void *)analytics;
    analytics = (uint64_t)v6;

    if ((v4 & 1) != 0 || v5)
    {
      v8 = off_26479E490;
      if (!v4) {
        v8 = off_26479E428;
      }
      v9 = [(__objc2_class *)*v8 logger];
      [(id)analytics setSfanalytics:v9];
    }
    v10 = [(id)analytics sfanalytics];

    if (v10)
    {
      [(id)analytics loadCollectionConfiguration];
      [(id)analytics setupCollection];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&analytics_lock);
  v11 = (void *)analytics;

  return v11;
}

- (TransparencyAnalytics)init
{
  v6.receiver = self;
  v6.super_class = (Class)TransparencyAnalytics;
  v2 = [(TransparencyAnalytics *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(TransparencyAnalytics *)v2 setToken:0xFFFFFFFFLL];
    int v4 = v3;
  }

  return v3;
}

- (void)setupCollection
{
  if ([(TransparencyAnalytics *)self token] == -1)
  {
    v3 = dispatch_get_global_queue(-32768, 0);
    id location = 0;
    objc_initWeak(&location, self);
    int v4 = (const char *)kTransparencySFACollectionUpdateName;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __40__TransparencyAnalytics_setupCollection__block_invoke;
    v5[3] = &unk_26479F338;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch(v4, &self->_token, v3, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __40__TransparencyAnalytics_setupCollection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_9 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_9, &__block_literal_global_61_0);
  }
  v2 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_9;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_226345000, v2, OS_LOG_TYPE_DEFAULT, "SFACollection updated, reloading", v3, 2u);
  }
  [WeakRetained loadCollectionConfiguration];
}

uint64_t __40__TransparencyAnalytics_setupCollection__block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_9 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  if ([(TransparencyAnalytics *)self token] != -1) {
    notify_cancel([(TransparencyAnalytics *)self token]);
  }
  v3.receiver = self;
  v3.super_class = (Class)TransparencyAnalytics;
  [(TransparencyAnalytics *)&v3 dealloc];
}

- (void)loadCollectionConfiguration
{
  id v2 = [(TransparencyAnalytics *)self sfanalytics];
  [v2 loadCollectionConfiguration];
}

+ (void)unsetGlobalLogger
{
  os_unfair_lock_lock((os_unfair_lock_t)&analytics_lock);
  id v2 = (void *)analytics;
  analytics = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&analytics_lock);
}

+ (id)analyticsApplications
{
  if (analyticsApplications_onceToken != -1) {
    dispatch_once(&analyticsApplications_onceToken, &__block_literal_global_68);
  }
  id v2 = (void *)analyticsApplications_applications;

  return v2;
}

void __46__TransparencyAnalytics_analyticsApplications__block_invoke()
{
  v4[5] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"IDS";
  v4[1] = @"TLT";
  v4[2] = @"CK";
  v4[3] = @"MP";
  v4[4] = @"FT";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];
  uint64_t v2 = [v0 setWithArray:v1];
  objc_super v3 = (void *)analyticsApplications_applications;
  analyticsApplications_applications = v2;
}

+ (BOOL)hasInternalDiagnostics
{
  return MEMORY[0x270EDAB40]("com.apple.Transparency", a2);
}

+ (id)formatEventName:(id)a3 application:(id)a4
{
  return (id)[NSString stringWithFormat:@"kt%@%@", a4, a3];
}

+ (BOOL)doWithAnalyticsForEventName:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7 = a3;
  if (a4) {
    id v8 = *a4;
  }
  else {
    id v8 = 0;
  }
  id v18 = 0;
  id v19 = v8;
  v9 = (uint64_t (*)(id, id *, id *))*((void *)a5 + 2);
  id v10 = v8;
  int v11 = v9(a5, &v19, &v18);
  id v12 = v19;

  id v13 = v18;
  if (v11)
  {
    v14 = +[TransparencyAnalytics logger];
    [v14 logSuccessForEventNamed:v7];
  }
  else
  {
    v15 = +[TransparencyAnalytics logger];
    v14 = v15;
    if (v12 && v13)
    {
      [v15 logResultForEvent:v7 hardFailure:1 result:v12 withAttributes:v13];
    }
    else
    {
      if (!v12)
      {
        v17 = [MEMORY[0x263F087E8] errorWithDomain:@"TransparencyErrorUnknown" code:-120 userInfo:0];
        [v14 logResultForEvent:v7 hardFailure:1 result:v17];

        goto LABEL_14;
      }
      [v15 logResultForEvent:v7 hardFailure:1 result:v12];
    }
  }

  if (a4 && v12) {
    *a4 = v12;
  }
LABEL_14:

  return v11;
}

+ (unint64_t)doKTResultWithAnalyticsForEventName:(id)a3 validateType:(unint64_t)a4 error:(id *)a5 block:(id)a6
{
  id v8 = a3;
  if (a5) {
    id v9 = *a5;
  }
  else {
    id v9 = 0;
  }
  id v26 = 0;
  id v27 = v9;
  id v10 = (uint64_t (*)(id, id *, id *))*((void *)a6 + 2);
  id v11 = v9;
  unint64_t v12 = v10(a6, &v27, &v26);
  id v13 = v27;

  id v14 = v26;
  v15 = v14;
  if (v12)
  {
    if (v12 == 1)
    {
      v16 = +[TransparencyAnalytics logger];
      [v16 logSuccessForEventNamed:v8];
      goto LABEL_17;
    }
    uint64_t v19 = 0;
  }
  else
  {
    v17 = [v14 objectForKeyedSubscript:@"ktSoftFailure"];
    int v18 = [v17 BOOLValue];

    uint64_t v19 = v18 ^ 1u;
  }
  if (objc_msgSend(v8, "isEqual:", @"ktIDSPV2OptIn", v26))
  {
    v20 = [v15 objectForKeyedSubscript:@"peerOptIn"];
    int v21 = [v20 isEqual:@"On"];

    if (v21)
    {
      uint64_t v22 = +[TransparencyAnalytics formatEventName:@"PV2OptInBoth" application:@"IDS"];

      id v8 = (id)v22;
    }
  }
  v23 = +[TransparencyAnalytics logger];
  v16 = v23;
  if (v13 && v15)
  {
    [v23 logResultForEvent:v8 hardFailure:v19 result:v13 withAttributes:v15];
  }
  else
  {
    if (!v13)
    {
      v24 = [MEMORY[0x263F087E8] errorWithDomain:@"TransparencyErrorUnknown" code:-120 userInfo:0];
      [v16 logResultForEvent:v8 hardFailure:v19 result:v24];

      goto LABEL_21;
    }
    [v23 logResultForEvent:v8 hardFailure:v19 result:v13];
  }
LABEL_17:

  if (a5 && v13) {
    *a5 = v13;
  }
LABEL_21:

  return v12;
}

+ (unint64_t)doKTResultWithAnalyticsForEventName:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  unint64_t v9 = [(id)objc_opt_class() doKTResultWithAnalyticsForEventName:v8 validateType:0 error:a4 block:v7];

  return v9;
}

+ (id)errorChain:(id)a3 depth:(unint64_t)a4
{
  v33[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 <= 5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v32[0] = @"domain";
    id v7 = [v6 domain];
    v32[1] = @"code";
    v33[0] = v7;
    id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code"));
    v33[1] = v8;
    unint64_t v9 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
    id v10 = (void *)[v9 mutableCopy];

    id v11 = [v6 userInfo];
    unint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F08608]];
    unint64_t v13 = a4 + 1;
    id v14 = [a1 errorChain:v12 depth:v13];
    [v10 setObject:v14 forKeyedSubscript:@"child"];

    v15 = [v6 userInfo];
    v16 = [v15 objectForKeyedSubscript:*MEMORY[0x263F083F0]];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v26 = v10;
      v17 = [MEMORY[0x263EFF980] array];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v18 = v16;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v28 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = [a1 errorChain:*(void *)(*((void *)&v27 + 1) + 8 * i) depth:v13];
            if (v23) {
              [v17 addObject:v23];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v20);
      }

      id v10 = v26;
      if ([v17 count]) {
        [v26 setObject:v17 forKeyedSubscript:@"multiple"];
      }
    }
    id v24 = v10;
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

+ (id)analyticsErrorData:(id)a3
{
  return +[TransparencyAnalytics errorChain:a3 depth:0];
}

- (void)logSuccessForEventNamed:(id)a3
{
  id v4 = a3;
  sfanalytics = self->_sfanalytics;
  if (sfanalytics)
  {
    [(SFAnalytics *)sfanalytics logSuccessForEventNamed:v4];
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __49__TransparencyAnalytics_logSuccessForEventNamed___block_invoke;
    v6[3] = &unk_26479F360;
    id v7 = v4;
    +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v6 errorHandler:&__block_literal_global_113_0];
  }
}

uint64_t __49__TransparencyAnalytics_logSuccessForEventNamed___block_invoke(uint64_t a1, void *a2)
{
  return [a2 logSuccessForEventNamed:*(void *)(a1 + 32)];
}

- (void)logHardFailureForEventNamed:(id)a3 withAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_sfanalytics)
  {
    unint64_t v9 = (void *)[v7 mutableCopy];
    id v10 = [NSNumber numberWithLongLong:104];
    [v9 setObject:v10 forKeyedSubscript:@"transparencyVersion"];

    id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[TransparencySettings getEnvironment](TransparencySettings, "getEnvironment"));
    [v9 setObject:v11 forKeyedSubscript:@"ktEnvironment"];

    [(SFAnalytics *)self->_sfanalytics logHardFailureForEventNamed:v6 withAttributes:v9];
  }
  else
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __68__TransparencyAnalytics_logHardFailureForEventNamed_withAttributes___block_invoke;
    v12[3] = &unk_26479E570;
    id v13 = v6;
    id v14 = v8;
    +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v12 errorHandler:&__block_literal_global_116];
  }
}

uint64_t __68__TransparencyAnalytics_logHardFailureForEventNamed_withAttributes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 logHardFailureForEventNamed:*(void *)(a1 + 32) withAttributes:*(void *)(a1 + 40)];
}

- (void)logSoftFailureForEventNamed:(id)a3 withAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_sfanalytics)
  {
    unint64_t v9 = (void *)[v7 mutableCopy];
    id v10 = [NSNumber numberWithLongLong:104];
    [v9 setObject:v10 forKeyedSubscript:@"transparencyVersion"];

    id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[TransparencySettings getEnvironment](TransparencySettings, "getEnvironment"));
    [v9 setObject:v11 forKeyedSubscript:@"ktEnvironment"];

    [(SFAnalytics *)self->_sfanalytics logSoftFailureForEventNamed:v6 withAttributes:v9];
  }
  else
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __68__TransparencyAnalytics_logSoftFailureForEventNamed_withAttributes___block_invoke;
    v12[3] = &unk_26479E570;
    id v13 = v6;
    id v14 = v8;
    +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v12 errorHandler:&__block_literal_global_118_0];
  }
}

uint64_t __68__TransparencyAnalytics_logSoftFailureForEventNamed_withAttributes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 logSoftFailureForEventNamed:*(void *)(a1 + 32) withAttributes:*(void *)(a1 + 40)];
}

- (void)noteEventNamed:(id)a3
{
  id v4 = a3;
  sfanalytics = self->_sfanalytics;
  if (sfanalytics)
  {
    [(SFAnalytics *)sfanalytics noteEventNamed:v4];
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__TransparencyAnalytics_noteEventNamed___block_invoke;
    v6[3] = &unk_26479F360;
    id v7 = v4;
    +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v6 errorHandler:&__block_literal_global_120];
  }
}

uint64_t __40__TransparencyAnalytics_noteEventNamed___block_invoke(uint64_t a1, void *a2)
{
  return [a2 noteEventNamed:*(void *)(a1 + 32)];
}

- (BOOL)skipLogResult:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 code] == -134)
  {
    int v5 = [v4 domain];
    char v6 = [v5 isEqual:@"TransparencyErrorUnknown"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)addUserInfoAttributes:(id)a3 error:(id)a4
{
  id v5 = a3;
  char v6 = [a4 userInfo];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__TransparencyAnalytics_addUserInfoAttributes_error___block_invoke;
  v8[3] = &unk_26479F388;
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

void __53__TransparencyAnalytics_addUserInfoAttributes_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 hasPrefix:@"swt"])
  {
    id v7 = [v5 substringFromIndex:3];
    id v10 = v7;
    v11[0] = v6;
    id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    if ([MEMORY[0x263F08900] isValidJSONObject:v8])
    {
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
    }
    else
    {
      id v9 = [v6 description];
      [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v7];
    }
  }
}

- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5
{
  BOOL v6 = a4;
  v19[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (![(TransparencyAnalytics *)self skipLogResult:v9])
  {
    if (self->_sfanalytics)
    {
      v18[0] = @"transparencyVersion";
      id v10 = [NSNumber numberWithLongLong:104];
      v18[1] = @"ktEnvironment";
      v19[0] = v10;
      id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[TransparencySettings getEnvironment](TransparencySettings, "getEnvironment"));
      v19[1] = v11;
      unint64_t v12 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
      id v13 = (void *)[v12 mutableCopy];

      [(TransparencyAnalytics *)self addUserInfoAttributes:v13 error:v9];
      [(SFAnalytics *)self->_sfanalytics logResultForEvent:v8 hardFailure:v6 result:v9 withAttributes:v13];
    }
    else
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __62__TransparencyAnalytics_logResultForEvent_hardFailure_result___block_invoke;
      v14[3] = &unk_26479F3B0;
      id v15 = v8;
      BOOL v17 = v6;
      id v16 = v9;
      +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v14 errorHandler:&__block_literal_global_127_0];

      id v13 = v15;
    }
  }
}

uint64_t __62__TransparencyAnalytics_logResultForEvent_hardFailure_result___block_invoke(uint64_t a1, void *a2)
{
  return [a2 logResultForEvent:*(void *)(a1 + 32) hardFailure:*(unsigned __int8 *)(a1 + 48) result:*(void *)(a1 + 40)];
}

- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5 withAttributes:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (self->_sfanalytics)
  {
    if (v12)
    {
      uint64_t v14 = [v12 mutableCopy];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    }
    id v15 = (void *)v14;
    [(TransparencyAnalytics *)self addUserInfoAttributes:v14 error:v11];
    id v16 = [NSNumber numberWithLongLong:104];
    [v15 setObject:v16 forKeyedSubscript:@"transparencyVersion"];

    BOOL v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[TransparencySettings getEnvironment](TransparencySettings, "getEnvironment"));
    [v15 setObject:v17 forKeyedSubscript:@"ktEnvironment"];

    [(SFAnalytics *)self->_sfanalytics logResultForEvent:v10 hardFailure:v8 result:v11 withAttributes:v15];
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    void v18[2] = __77__TransparencyAnalytics_logResultForEvent_hardFailure_result_withAttributes___block_invoke;
    v18[3] = &unk_26479F3D8;
    id v19 = v10;
    BOOL v22 = v8;
    id v20 = v11;
    id v21 = v13;
    +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v18 errorHandler:&__block_literal_global_130];
  }
}

uint64_t __77__TransparencyAnalytics_logResultForEvent_hardFailure_result_withAttributes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 logResultForEvent:*(void *)(a1 + 32) hardFailure:*(unsigned __int8 *)(a1 + 56) result:*(void *)(a1 + 40) withAttributes:*(void *)(a1 + 48)];
}

- (void)logMetric:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sfanalytics = self->_sfanalytics;
  if (sfanalytics)
  {
    [(SFAnalytics *)sfanalytics logMetric:v6 withName:v7];
  }
  else
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __44__TransparencyAnalytics_logMetric_withName___block_invoke;
    v9[3] = &unk_26479E570;
    id v10 = v6;
    id v11 = v7;
    +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v9 errorHandler:&__block_literal_global_132];
  }
}

uint64_t __44__TransparencyAnalytics_logMetric_withName___block_invoke(uint64_t a1, void *a2)
{
  return [a2 logMetric:*(void *)(a1 + 32) withName:*(void *)(a1 + 40)];
}

- (void)incrementIntegerPropertyForKey:(id)a3
{
}

- (void)setNumberProperty:(id)a3 forKey:(id)a4
{
}

- (id)numberPropertyForKey:(id)a3
{
  return [(SFAnalytics *)self->_sfanalytics numberPropertyForKey:a3];
}

- (void)setDateProperty:(id)a3 forKey:(id)a4
{
}

- (id)datePropertyForKey:(id)a3
{
  return [(SFAnalytics *)self->_sfanalytics datePropertyForKey:a3];
}

- (void)setMetricsAccountID:(id)a3
{
}

- (id)failureKey:(id)a3
{
  return (id)[a3 stringByAppendingString:@"-failure"];
}

- (void)setSuccessNowForPropertyKey:(id)a3
{
  id v9 = a3;
  id v4 = [(TransparencyAnalytics *)self failureKey:v9];
  id v5 = [(TransparencyAnalytics *)self datePropertyForKey:v9];
  uint64_t v6 = [(TransparencyAnalytics *)self datePropertyForKey:v4];
  id v7 = (void *)v6;
  if (!v5 || v6 && [v5 compare:v6] < 0)
  {
    BOOL v8 = [MEMORY[0x263EFF910] date];
    [(TransparencyAnalytics *)self setDateProperty:v8 forKey:v9];
  }
}

- (void)setFailureNowForPropertyKey:(id)a3
{
  id v9 = a3;
  id v4 = -[TransparencyAnalytics failureKey:](self, "failureKey:");
  id v5 = [(TransparencyAnalytics *)self datePropertyForKey:v4];
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF910] date];
    [(TransparencyAnalytics *)self setDateProperty:v6 forKey:v4];
  }
  id v7 = [(TransparencyAnalytics *)self datePropertyForKey:v9];
  if (v7 && [v5 compare:v7] < 0)
  {
    BOOL v8 = [MEMORY[0x263EFF910] date];
    [(TransparencyAnalytics *)self setDateProperty:v8 forKey:v4];
  }
}

- (id)fuzzyTimeSinceLastSuccess:(id)a3
{
  id v4 = a3;
  id v5 = [(TransparencyAnalytics *)self failureKey:v4];
  uint64_t v6 = [(SFAnalytics *)self->_sfanalytics datePropertyForKey:v4];

  uint64_t v7 = [(SFAnalytics *)self->_sfanalytics datePropertyForKey:v5];
  BOOL v8 = (void *)v7;
  if (!(v6 | v7))
  {
    id v9 = 0;
    goto LABEL_13;
  }
  if (v6 || !v7)
  {
    if (v6 && !v7)
    {
      id v10 = NSNumber;
      uint64_t v12 = [MEMORY[0x263F16D60] fuzzyDaysSinceDate:v6] + 1;
      goto LABEL_12;
    }
    uint64_t v13 = [(id)v6 compare:v7];
    id v10 = NSNumber;
    id v11 = (void *)MEMORY[0x263F16D60];
    if ((v13 & 0x8000000000000000) == 0)
    {
      uint64_t v12 = [MEMORY[0x263F16D60] fuzzyDaysSinceDate:v6];
      goto LABEL_12;
    }
  }
  else
  {
    id v10 = NSNumber;
    id v11 = (void *)MEMORY[0x263F16D60];
  }
  uint64_t v12 = ~[v11 fuzzyDaysSinceDate:v8];
LABEL_12:
  id v9 = [v10 numberWithInteger:v12];
LABEL_13:

  return v9;
}

- (id)fuzzyTimeSinceDateKey:(id)a3
{
  id v3 = [(SFAnalytics *)self->_sfanalytics datePropertyForKey:a3];
  if (v3)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(MEMORY[0x263F16D60], "fuzzyDaysSinceDate:", v3));
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)addMultiSamplerForName:(id)a3 withTimeInterval:(double)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  sfanalytics = self->_sfanalytics;
  if (sfanalytics)
  {
    id v11 = [(SFAnalytics *)sfanalytics AddMultiSamplerForName:v8 withTimeInterval:v9 block:a4];
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_9 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_9, &__block_literal_global_139_0);
    }
    uint64_t v12 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_9;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_226345000, v12, OS_LOG_TYPE_ERROR, "SPI violation: multi-sampler may only be called from transparencyd", v13, 2u);
    }
  }
}

uint64_t __71__TransparencyAnalytics_addMultiSamplerForName_withTimeInterval_block___block_invoke()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_9 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)removeMultiSamplerForName:(id)a3
{
  id v4 = a3;
  sfanalytics = self->_sfanalytics;
  if (sfanalytics)
  {
    [(SFAnalytics *)sfanalytics removeMultiSamplerForName:v4];
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_9 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_9, &__block_literal_global_141);
    }
    uint64_t v6 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_9;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_226345000, v6, OS_LOG_TYPE_ERROR, "SPI violation: multi-sampler may only be called from transparencyd", v7, 2u);
    }
  }
}

uint64_t __51__TransparencyAnalytics_removeMultiSamplerForName___block_invoke()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_9 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)updateCollectionConfigurationWithData:(id)a3
{
  id v5 = a3;
  -[SFAnalytics updateCollectionConfigurationWithData:](self->_sfanalytics, "updateCollectionConfigurationWithData:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = +[SWTransparencySFAnalytics logger];
    [v4 updateCollectionConfigurationWithData:v5];

    notify_post((const char *)kTransparencySFACollectionUpdateName);
  }
}

- (id)dailyMetrics
{
  return [(SFAnalytics *)self->_sfanalytics dailyMetrics];
}

- (void)addNFSReporting:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(TransparencyAnalytics *)v4 nfsObserver];

  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [(TransparencyAnalytics *)v4 setNfsObserver:v6];
  }
  uint64_t v7 = [(TransparencyAnalytics *)v4 nfsObserver];
  [v7 addObject:v8];

  objc_sync_exit(v4);
}

- (id)nfsReporting
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = [(TransparencyAnalytics *)v2 nfsObserver];
  id v4 = [v3 allObjects];

  objc_sync_exit(v2);
  if ([v4 count])
  {
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "status", (void)v14);
          uint64_t v12 = [v10 name];
          [v5 setObject:v11 forKeyedSubscript:v12];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (unsigned)manateeStatusForReporting
{
  return MEMORY[0x270F58508](@"Manatee", a2);
}

- (NSHashTable)nfsObserver
{
  return (NSHashTable *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNfsObserver:(id)a3
{
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (SFAnalytics)sfanalytics
{
  return (SFAnalytics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSfanalytics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfanalytics, 0);

  objc_storeStrong((id *)&self->_nfsObserver, 0);
}

@end