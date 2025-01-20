@interface PLBackgroundJobCriteria
+ (PLBackgroundJobCriteria)criteriaWithKnownShortCode:(id)a3;
+ (id)allKnownCriterias;
+ (id)allKnownShortCodes;
+ (id)criteriaForAssetStackWorker;
+ (id)criteriaForDiscretionaryResourceWorker;
+ (id)criteriaForDuplicateDetectorWorker;
+ (id)criteriaForFeatureAvailabilityWorker;
+ (id)criteriaForHighPriorityRenderDerivativesWorker;
+ (id)criteriaForHighPrioritySearchIndexingWorker;
+ (id)criteriaForHubbleNetworkDownloadWorker;
+ (id)criteriaForHubbleWorker;
+ (id)criteriaForLowPriorityBatterySearchWorker;
+ (id)criteriaForLowPriorityChargerSearchWorker;
+ (id)criteriaForUrgentResourceWorker;
- (BOOL)isEqual:(id)a3;
- (NSString)activityIdentifier;
- (NSString)name;
- (NSString)shortCode;
- (PLBackgroundJobCriteria)initWithName:(id)a3 shortCode:(id)a4 xpcActivityPriority:(unint64_t)a5 allowBattery:(BOOL)a6 gracePeriod:(int64_t)a7 delay:(int64_t)a8 requireScreenSleep:(BOOL)a9 cpuIntensive:(BOOL)a10 memoryIntensive:(BOOL)a11 requireInexpensiveNetworkConnectivity:(BOOL)a12 requireConcurrencyLimit:(BOOL)a13 overrideRateLimiting:(BOOL)a14 involvedProcesses:(id)a15;
- (id)description;
- (id)xpcCriteria;
- (unint64_t)hash;
@end

@implementation PLBackgroundJobCriteria

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_involvedProcesses, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_shortCode, 0);
}

- (NSString)activityIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)shortCode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_shortCode hash];
  NSUInteger v4 = [(NSString *)self->_name hash] ^ v3 ^ self->_xpcActivityPriority ^ self->_allowBattery ^ self->_gracePeriod ^ self->_delay ^ self->_requireScreenSleep ^ self->_cpuIntensive ^ self->_memoryIntensive;
  unint64_t v5 = self->_requireInexpensiveNetworkConnectivity ^ (unint64_t)self->_requireConcurrencyLimit ^ self->_overrideRateLimiting;
  return v4 ^ v5 ^ [(NSArray *)self->_involvedProcesses hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v5 = v4;
    if (PLObjectIsEqual()
      && PLObjectIsEqual()
      && self->_xpcActivityPriority == v5[4]
      && self->_allowBattery == *((unsigned __int8 *)v5 + 40)
      && self->_gracePeriod == v5[6]
      && self->_delay == v5[7]
      && self->_requireScreenSleep == *((unsigned __int8 *)v5 + 64)
      && self->_cpuIntensive == *((unsigned __int8 *)v5 + 65)
      && self->_memoryIntensive == *((unsigned __int8 *)v5 + 66)
      && self->_requireInexpensiveNetworkConnectivity == *((unsigned __int8 *)v5 + 67)
      && self->_requireConcurrencyLimit == *((unsigned __int8 *)v5 + 68)
      && self->_overrideRateLimiting == *((unsigned __int8 *)v5 + 69))
    {
      involvedProcesses = self->_involvedProcesses;
      v7 = (NSArray *)v5[9];
      v8 = involvedProcesses;
      v11 = v8;
      if (v8 == v7) {
        char v9 = 1;
      }
      else {
        char v9 = [(NSArray *)v8 isEqual:v7];
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)description
{
  if (self->_xpcActivityPriority) {
    v2 = @"utility";
  }
  else {
    v2 = @"maintenance";
  }
  return (id)[NSString stringWithFormat:@"[Criteria: %@ | Short: %@ | Priority: %@ | Battery: %d | Grace: %zd | Delay: %zd | ScreenSleep: %d | CPUIntensive: %d | MemoryIntensive: %d | InexpensiveNetwork: %d | ConcurrencyLimit: %d | OverrideRateLimiting: %d | InvolvedProcesses: %@]", self->_name, self->_shortCode, v2, self->_allowBattery, self->_gracePeriod, self->_delay, self->_requireScreenSleep, self->_cpuIntensive, self->_memoryIntensive, self->_requireInexpensiveNetworkConnectivity, self->_requireConcurrencyLimit, self->_overrideRateLimiting, self->_involvedProcesses];
}

- (id)xpcCriteria
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F142F8], 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14138], self->_allowBattery);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F141A8], self->_gracePeriod);
  int64_t delay = self->_delay;
  if (delay >= 1) {
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F14170], delay);
  }
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14340], self->_requireScreenSleep);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14168], self->_cpuIntensive);
  if (self->_memoryIntensive) {
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14250], 1);
  }
  if (self->_requireConcurrencyLimit)
  {
    xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E4F141C0], "com.apple.assetsd.backgroundJobService.concurrencygroupname");
    xpc_dictionary_set_uint64(v3, (const char *)*MEMORY[0x1E4F141B8], 1uLL);
  }
  if (self->_overrideRateLimiting)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v5, "com.apple.das.overrideRateLimiting", 1);
    xpc_dictionary_set_value(v3, (const char *)*MEMORY[0x1E4F14190], v5);
  }
  unint64_t xpcActivityPriority = self->_xpcActivityPriority;
  if (xpcActivityPriority)
  {
    if (xpcActivityPriority != 1) {
      goto LABEL_14;
    }
    v7 = (const char **)MEMORY[0x1E4F142E0];
  }
  else
  {
    v7 = (const char **)MEMORY[0x1E4F142D0];
  }
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E4F142C8], *v7);
LABEL_14:
  if ([(NSArray *)self->_involvedProcesses count])
  {
    xpc_object_t v8 = xpc_array_create(0, 0);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    char v9 = self->_involvedProcesses;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(id *)(*((void *)&v17 + 1) + 8 * i);
          xpc_object_t v15 = xpc_string_create((const char *)objc_msgSend(v14, "UTF8String", (void)v17));
          xpc_array_append_value(v8, v15);
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    xpc_dictionary_set_value(v3, (const char *)*MEMORY[0x1E4F14240], v8);
  }
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14320], 1);
  return v3;
}

- (PLBackgroundJobCriteria)initWithName:(id)a3 shortCode:(id)a4 xpcActivityPriority:(unint64_t)a5 allowBattery:(BOOL)a6 gracePeriod:(int64_t)a7 delay:(int64_t)a8 requireScreenSleep:(BOOL)a9 cpuIntensive:(BOOL)a10 memoryIntensive:(BOOL)a11 requireInexpensiveNetworkConnectivity:(BOOL)a12 requireConcurrencyLimit:(BOOL)a13 overrideRateLimiting:(BOOL)a14 involvedProcesses:(id)a15
{
  id v34 = a3;
  id v33 = a4;
  id v21 = a15;
  v35.receiver = self;
  v35.super_class = (Class)PLBackgroundJobCriteria;
  uint64_t v22 = [(PLBackgroundJobCriteria *)&v35 init];
  if (v22)
  {
    uint64_t v23 = [v34 copy];
    name = v22->_name;
    v22->_name = (NSString *)v23;

    uint64_t v25 = [v33 copy];
    shortCode = v22->_shortCode;
    v22->_shortCode = (NSString *)v25;

    v22->_unint64_t xpcActivityPriority = a5;
    v22->_allowBattery = a6;
    v22->_gracePeriod = a7;
    v22->_int64_t delay = a8;
    v22->_requireScreenSleep = a9;
    v22->_cpuIntensive = a10;
    v22->_memoryIntensive = a11;
    v22->_requireInexpensiveNetworkConnectivity = a12;
    v22->_requireConcurrencyLimit = a13;
    v22->_overrideRateLimiting = a14;
    uint64_t v27 = [v21 copy];
    involvedProcesses = v22->_involvedProcesses;
    v22->_involvedProcesses = (NSArray *)v27;

    v29 = [(NSString *)v22->_name stringByReplacingOccurrencesOfString:@" " withString:&stru_1EEB2EB80];
    uint64_t v30 = [[NSString alloc] initWithFormat:@"com.apple.%s.backgroundjobservice.%@", "assetsd", v29];
    activityIdentifier = v22->_activityIdentifier;
    v22->_activityIdentifier = (NSString *)v30;
  }
  return v22;
}

+ (id)allKnownShortCodes
{
  v2 = [a1 allKnownCriterias];
  xpc_object_t v3 = objc_msgSend(v2, "_pl_map:", &__block_literal_global_50665);

  return v3;
}

uint64_t __45__PLBackgroundJobCriteria_allKnownShortCodes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 shortCode];
}

+ (PLBackgroundJobCriteria)criteriaWithKnownShortCode:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  xpc_object_t v5 = objc_msgSend(a1, "allKnownCriterias", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        char v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 shortCode];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (PLBackgroundJobCriteria *)v6;
}

+ (id)allKnownCriterias
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PLBackgroundJobCriteria_allKnownCriterias__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allKnownCriterias_onceToken != -1) {
    dispatch_once(&allKnownCriterias_onceToken, block);
  }
  v2 = (void *)allKnownCriterias_allKnownCriterias;
  return v2;
}

void __44__PLBackgroundJobCriteria_allKnownCriterias__block_invoke(uint64_t a1)
{
  long long v14 = (void *)MEMORY[0x1E4F1CAD0];
  long long v15 = [*(id *)(a1 + 32) criteriaForUrgentResourceWorker];
  v2 = [*(id *)(a1 + 32) criteriaForDiscretionaryResourceWorker];
  xpc_object_t v3 = [*(id *)(a1 + 32) criteriaForHubbleWorker];
  id v4 = [*(id *)(a1 + 32) criteriaForHubbleNetworkDownloadWorker];
  xpc_object_t v5 = [*(id *)(a1 + 32) criteriaForHighPrioritySearchIndexingWorker];
  id v6 = [*(id *)(a1 + 32) criteriaForLowPriorityBatterySearchWorker];
  uint64_t v7 = [*(id *)(a1 + 32) criteriaForLowPriorityChargerSearchWorker];
  xpc_object_t v8 = [*(id *)(a1 + 32) criteriaForDuplicateDetectorWorker];
  char v9 = [*(id *)(a1 + 32) criteriaForHighPriorityRenderDerivativesWorker];
  uint64_t v10 = [*(id *)(a1 + 32) criteriaForAssetStackWorker];
  char v11 = [*(id *)(a1 + 32) criteriaForFeatureAvailabilityWorker];
  uint64_t v12 = objc_msgSend(v14, "setWithObjects:", v15, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, 0);
  long long v13 = (void *)allKnownCriterias_allKnownCriterias;
  allKnownCriterias_allKnownCriterias = v12;
}

+ (id)criteriaForFeatureAvailabilityWorker
{
  v2 = [PLBackgroundJobCriteria alloc];
  WORD2(v5) = 1;
  LODWORD(v5) = 1;
  xpc_object_t v3 = -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:](v2, "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", @"feature availability", @"F", 0, 0, *MEMORY[0x1E4F141E8], 0, v5, 0);
  return v3;
}

+ (id)criteriaForAssetStackWorker
{
  v2 = [PLBackgroundJobCriteria alloc];
  WORD2(v5) = 1;
  LODWORD(v5) = 1;
  xpc_object_t v3 = -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:](v2, "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", @"asset stack", @"A", 0, 1, *MEMORY[0x1E4F141D8], 0, v5, 0);
  return v3;
}

+ (id)criteriaForDuplicateDetectorWorker
{
  v2 = [PLBackgroundJobCriteria alloc];
  WORD2(v5) = 1;
  LODWORD(v5) = 257;
  xpc_object_t v3 = -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:](v2, "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", @"duplicate detector", @"M", 0, 0, *MEMORY[0x1E4F14218], 0, v5, 0);
  return v3;
}

+ (id)criteriaForLowPriorityChargerSearchWorker
{
  v2 = [PLBackgroundJobCriteria alloc];
  WORD2(v5) = 0;
  LODWORD(v5) = 257;
  xpc_object_t v3 = -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:](v2, "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", @"low priority search charger", @"C", 0, 0, *MEMORY[0x1E4F141F8], 0, v5, &unk_1EEBF1DD8);
  return v3;
}

+ (id)criteriaForLowPriorityBatterySearchWorker
{
  v2 = [PLBackgroundJobCriteria alloc];
  WORD2(v5) = 0;
  LODWORD(v5) = 257;
  xpc_object_t v3 = -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:](v2, "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", @"low priority search battery", @"S", 0, 1, *MEMORY[0x1E4F14218], *MEMORY[0x1E4F141D8], v5, &unk_1EEBF1DD8);
  return v3;
}

+ (id)criteriaForHighPrioritySearchIndexingWorker
{
  WORD2(v4) = 256;
  LODWORD(v4) = 0;
  v2 = -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:]([PLBackgroundJobCriteria alloc], "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", @"high priority search indexing", @"P", 1, 1, 1, 0, v4, &unk_1EEBF1DD8);
  return v2;
}

+ (id)criteriaForHubbleNetworkDownloadWorker
{
  v2 = [PLBackgroundJobCriteria alloc];
  WORD2(v5) = 0;
  LODWORD(v5) = 16777473;
  xpc_object_t v3 = -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:](v2, "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", @"hubble network download", @"N", 0, 0, *MEMORY[0x1E4F14238], 0, v5, 0);
  return v3;
}

+ (id)criteriaForHubbleWorker
{
  v2 = [PLBackgroundJobCriteria alloc];
  WORD2(v5) = 257;
  LODWORD(v5) = 256;
  xpc_object_t v3 = -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:](v2, "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", @"hubble", @"H", 0, 0, *MEMORY[0x1E4F141D8], 0, v5, 0);
  return v3;
}

+ (id)criteriaForDiscretionaryResourceWorker
{
  v2 = [PLBackgroundJobCriteria alloc];
  WORD2(v5) = 0;
  LODWORD(v5) = 257;
  xpc_object_t v3 = -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:](v2, "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", @"discretionary resource", @"D", 0, 1, *MEMORY[0x1E4F141D8], 0, v5, 0);
  return v3;
}

+ (id)criteriaForHighPriorityRenderDerivativesWorker
{
  WORD2(v4) = 257;
  LODWORD(v4) = 0;
  v2 = -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:]([PLBackgroundJobCriteria alloc], "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", @"render derivatives high", @"I", 1, 1, 1, 0, v4, 0);
  return v2;
}

+ (id)criteriaForUrgentResourceWorker
{
  WORD2(v4) = 257;
  LODWORD(v4) = 0x10000;
  v2 = -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:]([PLBackgroundJobCriteria alloc], "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", @"urgent resource", @"U", 1, 1, 1, 30, v4, 0);
  return v2;
}

@end