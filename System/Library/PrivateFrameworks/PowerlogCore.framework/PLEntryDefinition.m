@interface PLEntryDefinition
+ (BOOL)cacheSQLPrepareStatementForEntryDefinition:(id)a3;
+ (BOOL)cacheSQLPrepareStatementForEntryKey:(id)a3;
+ (BOOL)filterEntryLoggingForEntryDefinition:(id)a3;
+ (BOOL)filterEntryLoggingForEntryKey:(id)a3;
+ (BOOL)hasAppIdentifierKeysForEntryDefinition:(id)a3;
+ (BOOL)hasArrayKeysForEntryDefinition:(id)a3;
+ (BOOL)hasArrayKeysForEntryKey:(id)a3;
+ (BOOL)hasDMAKeysForEntryDefinition:(id)a3;
+ (BOOL)hasDMAKeysForEntryKey:(id)a3;
+ (BOOL)hasDynamicKeysForEntryDefinition:(id)a3;
+ (BOOL)hasDynamicKeysForEntryKey:(id)a3;
+ (BOOL)hasTaskModeKeyForEntryDefinition:(id)a3;
+ (BOOL)hasTaskModeKeyInConfig:(id)a3;
+ (BOOL)isAggregateForEntryDefinition:(id)a3;
+ (BOOL)isAggregateForEntryKey:(id)a3;
+ (BOOL)isAggregateWallClockBucket:(id)a3;
+ (BOOL)isAggregateWallClockBucketForEntryDefinition:(id)a3;
+ (BOOL)isNonEmptyDictionary:(id)a3;
+ (BOOL)isOnDemandQueryableForEntryDefinition:(id)a3;
+ (BOOL)isOnDemandQueryableForEntryKey:(id)a3;
+ (BOOL)overridesEntryDateForEntryDefinition:(id)a3;
+ (BOOL)overridesEntryDateForEntryKey:(id)a3;
+ (double)schemaVersionForEntryDefinition:(id)a3;
+ (double)schemaVersionForEntryKey:(id)a3;
+ (id)DMAKeysForEntryDefinition:(id)a3;
+ (id)aggregateBucketDefinitionsForEntryDefinition:(id)a3;
+ (id)aggregateBucketDefinitionsForEntryKey:(id)a3;
+ (id)allAggregateKeysForEntryDefinition:(id)a3;
+ (id)allAggregateKeysForEntryKey:(id)a3;
+ (id)allAggregatePrimaryKeysForEntryDefinition:(id)a3;
+ (id)allAggregatePrimaryKeysForEntryKey:(id)a3;
+ (id)allDynamicKeysForEntryDefinition:(id)a3;
+ (id)allDynamicKeysForEntryKey:(id)a3;
+ (id)allIndexKeysForEntryDefinition:(id)a3;
+ (id)allIndexKeysForEntryKey:(id)a3;
+ (id)allKeysForEntryDefinition:(id)a3;
+ (id)allKeysForEntryKey:(id)a3;
+ (id)arrayKeyConfigsForEntryKey:(id)a3;
+ (id)arrayKeysForEntryDefinition:(id)a3;
+ (id)arrayKeysForEntryKey:(id)a3;
+ (id)configsForEntryDefinition:(id)a3;
+ (id)configsForEntryKey:(id)a3;
+ (id)constructEntryDefinition:(id)a3;
+ (id)definitionForEntryKey:(id)a3;
+ (id)dynamicKeyConfigsForEntryDefinition:(id)a3;
+ (id)dynamicKeyConfigsForEntryKey:(id)a3;
+ (id)entryDefinitionsForOperator:(id)a3;
+ (id)entryDefinitionsForOperatorClass:(Class)a3;
+ (id)keyConfigsForEntryDefinition:(id)a3;
+ (id)keyConfigsForEntryKey:(id)a3;
+ (id)logSelectorStringForEnteryKey:(id)a3;
+ (id)logSelectorStringForEntryDefinition:(id)a3;
+ (id)manualSortOrderForEntryDefinition:(id)a3;
+ (id)manualSortOrderForEntryKey:(id)a3;
+ (id)notificationNameForEntryKey:(id)a3 withFilterDefintion:(id)a4;
+ (id)sharedInstance;
+ (id)sortedKeysFromEntryDefinition:(id)a3;
+ (id)subEntryKeyKeyForEntryDefinition:(id)a3;
+ (id)subEntryKeyKeyForEntryKey:(id)a3;
+ (int)cacheCountForEntryDefition:(id)a3;
+ (int)cacheCountForEntryKey:(id)a3;
+ (int)limitOfType:(id)a3 forEntryDefinition:(id)a4;
+ (int)limitOfType:(id)a3 forEntryKey:(id)a4;
+ (signed)aggregateFunctionForEntryDefinition:(id)a3 forKey:(id)a4;
- (id)commonTypeDict_BoolFormat;
- (id)commonTypeDict_DateFormat;
- (id)commonTypeDict_DateFormat_isCFAbsoluteTime;
- (id)commonTypeDict_IntegerFormat;
- (id)commonTypeDict_IntegerFormat_aggregateFunction_sum;
- (id)commonTypeDict_IntegerFormat_withUnit_W;
- (id)commonTypeDict_IntegerFormat_withUnit_mA;
- (id)commonTypeDict_IntegerFormat_withUnit_mAh;
- (id)commonTypeDict_IntegerFormat_withUnit_mJ;
- (id)commonTypeDict_IntegerFormat_withUnit_mV;
- (id)commonTypeDict_IntegerFormat_withUnit_ms;
- (id)commonTypeDict_IntegerFormat_withUnit_s;
- (id)commonTypeDict_IntegerFormat_withUnit_us;
- (id)commonTypeDict_RawDataFormat;
- (id)commonTypeDict_RealFormat;
- (id)commonTypeDict_RealFormat_aggregateFunction_sum;
- (id)commonTypeDict_RealFormat_withUnit_W;
- (id)commonTypeDict_RealFormat_withUnit_mJ;
- (id)commonTypeDict_RealFormat_withUnit_mW;
- (id)commonTypeDict_RealFormat_withUnit_mWhr;
- (id)commonTypeDict_RealFormat_withUnit_s;
- (id)commonTypeDict_StringFormat;
- (id)commonTypeDict_StringFormat_withAppName;
- (id)commonTypeDict_StringFormat_withBundleID;
- (id)commonTypeDict_StringFormat_withProcessName;
@end

@implementation PLEntryDefinition

+ (BOOL)cacheSQLPrepareStatementForEntryKey:(id)a3
{
  id v4 = a3;
  if (+[PPSEntryKey PPSEnabled:v4])
  {
    char v5 = 1;
  }
  else
  {
    v6 = [a1 definitionForEntryKey:v4];
    char v5 = [a1 cacheSQLPrepareStatementForEntryDefinition:v6];
  }
  return v5;
}

+ (BOOL)isAggregateForEntryDefinition:(id)a3
{
  v3 = [a1 aggregateBucketDefinitionsForEntryDefinition:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (id)aggregateBucketDefinitionsForEntryDefinition:(id)a3
{
  return (id)[a3 objectForKey:@"AggregateBuckets"];
}

+ (id)subEntryKeyKeyForEntryKey:(id)a3
{
  BOOL v4 = [a1 definitionForEntryKey:a3];
  char v5 = [a1 subEntryKeyKeyForEntryDefinition:v4];

  return v5;
}

+ (BOOL)overridesEntryDateForEntryDefinition:(id)a3
{
  v3 = [a1 configsForEntryDefinition:a3];
  BOOL v4 = [v3 objectForKey:@"OverridesEntryDate"];

  if (v4) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (id)subEntryKeyKeyForEntryDefinition:(id)a3
{
  v3 = [a1 configsForEntryDefinition:a3];
  BOOL v4 = [v3 objectForKeyedSubscript:@"SubEntryKey"];

  return v4;
}

+ (id)configsForEntryDefinition:(id)a3
{
  return (id)[a3 objectForKey:@"Configs"];
}

+ (BOOL)hasDynamicKeysForEntryDefinition:(id)a3
{
  v3 = [a1 configsForEntryDefinition:a3];
  BOOL v4 = [v3 objectForKey:@"DynamicDefinition"];

  if (v4) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)cacheSQLPrepareStatementForEntryDefinition:(id)a3
{
  v3 = [a1 configsForEntryDefinition:a3];
  BOOL v4 = [v3 objectForKey:@"SQLPrepareStatementCaching"];

  if (v4) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)filterEntryLoggingForEntryDefinition:(id)a3
{
  v3 = [a1 configsForEntryDefinition:a3];
  BOOL v4 = [v3 objectForKey:@"FilterEntryLogging"];

  if (v4) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)hasDMAKeysForEntryDefinition:(id)a3
{
  v3 = [a1 DMAKeysForEntryDefinition:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

+ (id)DMAKeysForEntryDefinition:(id)a3
{
  v3 = [a1 configsForEntryDefinition:a3];
  BOOL v4 = [v3 objectForKeyedSubscript:@"DMACompliantKeys"];

  return v4;
}

+ (signed)aggregateFunctionForEntryDefinition:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  v6 = [a3 objectForKeyedSubscript:@"Keys"];
  v7 = [v6 objectForKeyedSubscript:v5];

  v8 = [v7 objectForKeyedSubscript:@"AggregateFunction"];
  signed __int16 v9 = [v8 shortValue];

  return v9;
}

+ (id)allAggregateKeysForEntryDefinition:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"AggregateKeys"];
}

+ (id)allAggregatePrimaryKeysForEntryDefinition:(id)a3
{
  id v4 = a3;
  id v5 = [a1 allKeysForEntryDefinition:v4];
  v6 = (void *)[v5 mutableCopy];

  v7 = [a1 allAggregateKeysForEntryDefinition:v4];

  [v6 removeObjectsInArray:v7];
  return v6;
}

+ (BOOL)isAggregateWallClockBucket:(id)a3
{
  id v3 = a1;
  id v4 = [a1 definitionForEntryKey:a3];
  LOBYTE(v3) = [v3 isAggregateWallClockBucketForEntryDefinition:v4];

  return (char)v3;
}

+ (id)definitionForEntryKey:(id)a3
{
  id v4 = +[PLEntryKey PLEntryKeyForEntryKey:a3];
  id v5 = objc_msgSend(a1, "entryDefinitionsForOperatorClass:", objc_msgSend(v4, "operatorClass"));
  v6 = [v4 entryType];
  v7 = [v5 objectForKeyedSubscript:v6];
  v8 = [v4 entryName];
  signed __int16 v9 = [v7 objectForKeyedSubscript:v8];

  return v9;
}

+ (id)entryDefinitionsForOperatorClass:(Class)a3
{
  v28[6] = *MEMORY[0x1E4F143B8];
  if (entryDefinitionsForOperatorClass__onceToken != -1)
  {
    dispatch_once(&entryDefinitionsForOperatorClass__onceToken, &__block_literal_global_13);
    if (a3) {
      goto LABEL_3;
    }
LABEL_14:
    id v5 = 0;
    goto LABEL_15;
  }
  if (!a3) {
    goto LABEL_14;
  }
LABEL_3:
  dispatch_semaphore_wait((dispatch_semaphore_t)entryDefinitionsForOperatorClass__entryDefinitionsSem, 0xFFFFFFFFFFFFFFFFLL);
  id v5 = [(id)entryDefinitionsForOperatorClass__entryDefinitions objectForKeyedSubscript:a3];
  if (!v5)
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v6 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__PLEntryDefinition_entryDefinitionsForOperatorClass___block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v6;
      if (entryDefinitionsForOperatorClass__defaultOnce != -1) {
        dispatch_once(&entryDefinitionsForOperatorClass__defaultOnce, block);
      }
      if (entryDefinitionsForOperatorClass__classDebugEnabled)
      {
        v7 = [NSString stringWithFormat:@"setting up entry Definitions for %@", a3];
        v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLEntryDefinition.m"];
        signed __int16 v9 = [v8 lastPathComponent];
        v10 = [NSString stringWithUTF8String:"+[PLEntryDefinition entryDefinitionsForOperatorClass:]"];
        +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:116];

        v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          [(PLSubmissionFileSP *)(uint64_t)v7 copyAndPrepareLog];
        }
      }
    }
    v27[0] = @"EventPoint";
    v25 = [(objc_class *)a3 entryEventPointDefinitions];
    v24 = [a1 constructEntryDefinition:v25];
    v28[0] = v24;
    v27[1] = @"EventForward";
    v23 = [(objc_class *)a3 entryEventForwardDefinitions];
    v22 = [a1 constructEntryDefinition:v23];
    v28[1] = v22;
    v27[2] = @"EventBackward";
    v12 = [(objc_class *)a3 entryEventBackwardDefinitions];
    v13 = [a1 constructEntryDefinition:v12];
    v28[2] = v13;
    v27[3] = @"EventInterval";
    v14 = [(objc_class *)a3 entryEventIntervalDefinitions];
    v15 = [a1 constructEntryDefinition:v14];
    v28[3] = v15;
    v27[4] = @"EventNone";
    v16 = [(objc_class *)a3 entryEventNoneDefinitions];
    v17 = [a1 constructEntryDefinition:v16];
    v28[4] = v17;
    v27[5] = @"Aggregate";
    v18 = [(objc_class *)a3 entryAggregateDefinitions];
    v19 = [a1 constructEntryDefinition:v18];
    v28[5] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:6];
    [(id)entryDefinitionsForOperatorClass__entryDefinitions setObject:v20 forKeyedSubscript:a3];

    id v5 = [(id)entryDefinitionsForOperatorClass__entryDefinitions objectForKeyedSubscript:a3];
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)entryDefinitionsForOperatorClass__entryDefinitionsSem);
LABEL_15:
  return v5;
}

+ (BOOL)isAggregateWallClockBucketForEntryDefinition:(id)a3
{
  id v3 = [a1 configsForEntryDefinition:a3];
  id v4 = [v3 objectForKey:@"AggregateWallClockBucket"];

  if (v4) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (id)keyConfigsForEntryKey:(id)a3
{
  id v4 = [a1 definitionForEntryKey:a3];
  char v5 = [a1 keyConfigsForEntryDefinition:v4];

  return v5;
}

+ (id)allKeysForEntryDefinition:(id)a3
{
  id v3 = [a1 keyConfigsForEntryDefinition:a3];
  id v4 = [v3 allKeys];
  char v5 = [v4 sortedArrayUsingSelector:sel_compare_];

  return v5;
}

+ (id)keyConfigsForEntryDefinition:(id)a3
{
  return (id)[a3 objectForKey:@"Keys"];
}

+ (int)limitOfType:(id)a3 forEntryKey:(id)a4
{
  id v6 = a3;
  v7 = [a1 definitionForEntryKey:a4];
  LODWORD(a1) = [a1 limitOfType:v6 forEntryDefinition:v7];

  return (int)a1;
}

+ (int)limitOfType:(id)a3 forEntryDefinition:(id)a4
{
  id v6 = a3;
  v7 = [a1 configsForEntryDefinition:a4];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    signed __int16 v9 = [v7 objectForKeyedSubscript:v6];
    int v10 = [v9 intValue];
  }
  else
  {
    if ([v6 isEqualToString:@"RateLimit"])
    {
      uint64_t v11 = 50;
    }
    else if ([v6 isEqualToString:@"WarningLimit"])
    {
      uint64_t v11 = 3;
    }
    else if ([v6 isEqualToString:@"SafetyDropLimit"])
    {
      uint64_t v11 = 3;
    }
    else
    {
      uint64_t v11 = 0;
    }
    int v10 = +[PLDefaults longForKey:v6 ifNotSet:v11];
  }

  return v10;
}

+ (BOOL)isAggregateForEntryKey:(id)a3
{
  id v3 = a1;
  id v4 = [a1 definitionForEntryKey:a3];
  LOBYTE(v3) = [v3 isAggregateForEntryDefinition:v4];

  return (char)v3;
}

+ (id)arrayKeyConfigsForEntryKey:(id)a3
{
  id v4 = a3;
  if (+[PPSEntryKey PPSEnabled:v4])
  {
    char v5 = +[PPSEntryKey arrayMetricsForEntryKey:v4];
  }
  else
  {
    uint64_t v6 = [a1 definitionForEntryKey:v4];

    char v5 = [a1 dynamicKeyConfigsForEntryDefinition:v6];
    id v4 = (id)v6;
  }

  return v5;
}

+ (BOOL)hasArrayKeysForEntryDefinition:(id)a3
{
  id v3 = [a1 arrayKeysForEntryDefinition:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

+ (id)arrayKeysForEntryDefinition:(id)a3
{
  return (id)[a3 objectForKey:@"ArrayKeys"];
}

+ (id)dynamicKeyConfigsForEntryKey:(id)a3
{
  id v4 = a3;
  if (+[PPSEntryKey PPSEnabled:v4])
  {
    char v5 = +[PPSEntryKey dynamicMetricsForEntryKey:v4];
  }
  else
  {
    uint64_t v6 = [a1 definitionForEntryKey:v4];

    char v5 = [a1 dynamicKeyConfigsForEntryDefinition:v6];
    id v4 = (id)v6;
  }

  return v5;
}

+ (id)dynamicKeyConfigsForEntryDefinition:(id)a3
{
  return (id)[a3 objectForKey:@"DynamicKeys"];
}

uint64_t __54__PLEntryDefinition_entryDefinitionsForOperatorClass___block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(1);
  v1 = (void *)entryDefinitionsForOperatorClass__entryDefinitionsSem;
  entryDefinitionsForOperatorClass__entryDefinitionsSem = (uint64_t)v0;

  entryDefinitionsForOperatorClass__entryDefinitions = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

BOOL __54__PLEntryDefinition_entryDefinitionsForOperatorClass___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  entryDefinitionsForOperatorClass__classDebugEnabled = result;
  return result;
}

+ (BOOL)isNonEmptyDictionary:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) == 0 || [v3 count];

  return v4;
}

+ (BOOL)hasTaskModeKeyInConfig:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[PLDefaults liteMode]
    && ([a1 hasTaskModeKeyForEntryDefinition:v4] & 1) != 0;

  return v5;
}

+ (id)constructEntryDefinition:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__PLEntryDefinition_constructEntryDefinition___block_invoke;
  v8[3] = &unk_1E62542E8;
  id v10 = a1;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __46__PLEntryDefinition_constructEntryDefinition___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 40) isNonEmptyDictionary:v5]
    && ([*(id *)(a1 + 40) hasTaskModeKeyInConfig:v5] & 1) == 0)
  {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

+ (id)entryDefinitionsForOperator:(id)a3
{
  uint64_t v4 = objc_opt_class();
  return (id)[a1 entryDefinitionsForOperatorClass:v4];
}

+ (id)configsForEntryKey:(id)a3
{
  uint64_t v4 = [a1 definitionForEntryKey:a3];
  id v5 = [a1 configsForEntryDefinition:v4];

  return v5;
}

+ (id)arrayKeysForEntryKey:(id)a3
{
  uint64_t v4 = [a1 definitionForEntryKey:a3];
  id v5 = [a1 arrayKeysForEntryDefinition:v4];

  return v5;
}

+ (id)aggregateBucketDefinitionsForEntryKey:(id)a3
{
  uint64_t v4 = [a1 definitionForEntryKey:a3];
  id v5 = [a1 aggregateBucketDefinitionsForEntryDefinition:v4];

  return v5;
}

+ (id)allKeysForEntryKey:(id)a3
{
  uint64_t v4 = [a1 definitionForEntryKey:a3];
  id v5 = [a1 allKeysForEntryDefinition:v4];

  return v5;
}

+ (id)allDynamicKeysForEntryKey:(id)a3
{
  uint64_t v4 = [a1 definitionForEntryKey:a3];
  id v5 = [a1 allDynamicKeysForEntryDefinition:v4];

  return v5;
}

+ (id)allAggregateKeysForEntryKey:(id)a3
{
  uint64_t v4 = [a1 definitionForEntryKey:a3];
  id v5 = [a1 allAggregateKeysForEntryDefinition:v4];

  return v5;
}

+ (id)allIndexKeysForEntryKey:(id)a3
{
  uint64_t v4 = [a1 definitionForEntryKey:a3];
  id v5 = [a1 allIndexKeysForEntryDefinition:v4];

  return v5;
}

+ (id)allAggregatePrimaryKeysForEntryKey:(id)a3
{
  uint64_t v4 = [a1 definitionForEntryKey:a3];
  id v5 = [a1 allAggregatePrimaryKeysForEntryDefinition:v4];

  return v5;
}

+ (BOOL)hasDynamicKeysForEntryKey:(id)a3
{
  id v3 = a1;
  uint64_t v4 = [a1 definitionForEntryKey:a3];
  LOBYTE(v3) = [v3 hasDynamicKeysForEntryDefinition:v4];

  return (char)v3;
}

+ (BOOL)hasArrayKeysForEntryKey:(id)a3
{
  id v3 = a1;
  uint64_t v4 = [a1 definitionForEntryKey:a3];
  LOBYTE(v3) = [v3 hasArrayKeysForEntryDefinition:v4];

  return (char)v3;
}

+ (BOOL)hasDMAKeysForEntryKey:(id)a3
{
  id v3 = a1;
  uint64_t v4 = [a1 definitionForEntryKey:a3];
  LOBYTE(v3) = [v3 hasDMAKeysForEntryDefinition:v4];

  return (char)v3;
}

+ (BOOL)isOnDemandQueryableForEntryKey:(id)a3
{
  id v3 = a1;
  uint64_t v4 = [a1 definitionForEntryKey:a3];
  LOBYTE(v3) = [v3 isOnDemandQueryableForEntryDefinition:v4];

  return (char)v3;
}

+ (BOOL)filterEntryLoggingForEntryKey:(id)a3
{
  id v3 = a1;
  uint64_t v4 = [a1 definitionForEntryKey:a3];
  LOBYTE(v3) = [v3 filterEntryLoggingForEntryDefinition:v4];

  return (char)v3;
}

+ (BOOL)overridesEntryDateForEntryKey:(id)a3
{
  id v3 = a1;
  uint64_t v4 = [a1 definitionForEntryKey:a3];
  LOBYTE(v3) = [v3 overridesEntryDateForEntryDefinition:v4];

  return (char)v3;
}

+ (double)schemaVersionForEntryKey:(id)a3
{
  uint64_t v4 = [a1 definitionForEntryKey:a3];
  [a1 schemaVersionForEntryDefinition:v4];
  double v6 = v5;

  return v6;
}

+ (int)cacheCountForEntryKey:(id)a3
{
  id v3 = a1;
  uint64_t v4 = [a1 definitionForEntryKey:a3];
  LODWORD(v3) = [v3 cacheCountForEntryDefition:v4];

  return (int)v3;
}

+ (id)manualSortOrderForEntryKey:(id)a3
{
  uint64_t v4 = [a1 definitionForEntryKey:a3];
  double v5 = [a1 manualSortOrderForEntryDefinition:v4];

  return v5;
}

+ (id)logSelectorStringForEnteryKey:(id)a3
{
  id v4 = a3;
  if ([a1 isOnDemandQueryableForEntryKey:v4])
  {
    double v5 = [a1 definitionForEntryKey:v4];
    double v6 = [a1 logSelectorStringForEntryDefinition:v5];

    if (v6)
    {
      id v7 = v6;
    }
    else
    {
      v8 = +[PLEntryKey PLEntryKeyForEntryKey:v4];
      id v9 = NSString;
      id v10 = [v8 entryType];
      uint64_t v11 = [v8 entryName];
      id v7 = [v9 stringWithFormat:@"log%@%@", v10, v11];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)allDynamicKeysForEntryDefinition:(id)a3
{
  id v3 = [a1 dynamicKeyConfigsForEntryDefinition:a3];
  id v4 = [v3 allKeys];

  return v4;
}

+ (id)allIndexKeysForEntryDefinition:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"IndexKeys"];
}

+ (BOOL)hasTaskModeKeyForEntryDefinition:(id)a3
{
  id v3 = [a1 configsForEntryDefinition:a3];
  id v4 = [v3 objectForKey:@"TaskModeTable"];

  if (v4) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)hasAppIdentifierKeysForEntryDefinition:(id)a3
{
  id v3 = [a1 configsForEntryDefinition:a3];
  id v4 = [v3 objectForKey:@"AppIdentifierKeys"];

  LOBYTE(v3) = [v4 BOOLValue];
  return (char)v3;
}

+ (BOOL)isOnDemandQueryableForEntryDefinition:(id)a3
{
  id v3 = [a1 configsForEntryDefinition:a3];
  id v4 = [v3 objectForKey:@"OnDemandQuery"];

  if (v4) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

+ (double)schemaVersionForEntryDefinition:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"Configs"];
  id v4 = [v3 objectForKeyedSubscript:@"SchemaVersion"];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

+ (int)cacheCountForEntryDefition:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"Configs"];
  id v4 = [v3 objectForKeyedSubscript:@"EntryCaching"];

  if (v4) {
    int v5 = [v4 intValue];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

+ (id)manualSortOrderForEntryDefinition:(id)a3
{
  id v4 = a3;
  int v5 = [a1 configsForEntryDefinition:v4];
  double v6 = [v5 objectForKey:@"SortOrderManual"];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1CA80] setWithArray:v6];
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    id v9 = [a1 allKeysForEntryDefinition:v4];
    id v10 = [v8 setWithArray:v9];
    [v7 minusSet:v10];

    if ([v7 count])
    {
      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[PLEntryDefinition manualSortOrderForEntryDefinition:]((uint64_t)v7, v11);
      }

      v12 = [MEMORY[0x1E4F1CA80] setWithArray:v6];
      [v12 minusSet:v7];
      id v13 = [v12 allObjects];
    }
    else
    {
      id v13 = v6;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)sortedKeysFromEntryDefinition:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  double v6 = [a1 allKeysForEntryDefinition:v5];
  id v7 = [v4 arrayWithArray:v6];

  v8 = [a1 manualSortOrderForEntryDefinition:v5];
  id v9 = [v5 objectForKey:@"Configs"];

  id v10 = [v9 objectForKey:@"SortOrderAuto"];
  __int16 v11 = [v10 intValue];

  v12 = objc_opt_new();
  [v12 addObjectsFromArray:v8];
  [v7 removeObjectsInArray:v8];
  if ((v11 & 0xFFFE) == 0)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__PLEntryDefinition_sortedKeysFromEntryDefinition___block_invoke;
    v15[3] = &__block_descriptor_34_e11_q24__0_8_16l;
    __int16 v16 = v11;
    id v13 = (id)[v7 sortedArrayUsingComparator:v15];
  }
  [v12 addObjectsFromArray:v7];

  return v12;
}

uint64_t __51__PLEntryDefinition_sortedKeysFromEntryDefinition___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (*(_WORD *)(a1 + 32) == 1)
  {
    id v8 = v5;
  }
  else
  {
    if (*(_WORD *)(a1 + 32))
    {
      uint64_t v9 = 0;
      goto LABEL_7;
    }
    id v6 = v5;
    id v8 = v7;
  }
  uint64_t v9 = [v6 compare:v8];
LABEL_7:

  return v9;
}

+ (id)logSelectorStringForEntryDefinition:(id)a3
{
  id v3 = [a1 configsForEntryDefinition:a3];
  id v4 = [v3 objectForKey:@"LogSelector"];

  return v4;
}

+ (id)notificationNameForEntryKey:(id)a3 withFilterDefintion:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@.filtered", a3];
  v24 = v5;
  id v7 = [v5 allKeys];
  id v8 = objc_msgSend(v7, "sortedArrayUsingSelector:");

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v8;
  uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v32;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v9;
        uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * v9);
        __int16 v11 = [v24 objectForKeyedSubscript:v10];
        v12 = [v11 allKeys];
        id v13 = [v12 sortedArrayUsingSelector:sel_compare_];

        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v28 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * i);
              v20 = [v11 objectForKeyedSubscript:v19];
              [v6 appendFormat:@".%@_%@_%@", v10, v19, v20];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v16);
        }

        uint64_t v9 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v25);
  }

  return v6;
}

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_218);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

uint64_t __35__PLEntryDefinition_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = objc_alloc_init(PLEntryDefinition);
  return MEMORY[0x1F41817F8]();
}

- (id)commonTypeDict_BoolFormat
{
  if (commonTypeDict_BoolFormat_onceToken != -1) {
    dispatch_once(&commonTypeDict_BoolFormat_onceToken, &__block_literal_global_221);
  }
  v2 = (void *)commonTypeDict_BoolFormat__typedict_BOOL;
  return v2;
}

void __46__PLEntryDefinition_commonTypeDict_BoolFormat__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v2 = @"Type";
  v3[0] = &unk_1F1580678;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)commonTypeDict_BoolFormat__typedict_BOOL;
  commonTypeDict_BoolFormat__typedict_BOOL = v0;
}

- (id)commonTypeDict_IntegerFormat
{
  if (commonTypeDict_IntegerFormat_onceToken != -1) {
    dispatch_once(&commonTypeDict_IntegerFormat_onceToken, &__block_literal_global_224);
  }
  v2 = (void *)commonTypeDict_IntegerFormat__typedict_integer;
  return v2;
}

void __49__PLEntryDefinition_commonTypeDict_IntegerFormat__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v2 = @"Type";
  v3[0] = &unk_1F1580690;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)commonTypeDict_IntegerFormat__typedict_integer;
  commonTypeDict_IntegerFormat__typedict_integer = v0;
}

- (id)commonTypeDict_IntegerFormat_withUnit_s
{
  if (commonTypeDict_IntegerFormat_withUnit_s_onceToken != -1) {
    dispatch_once(&commonTypeDict_IntegerFormat_withUnit_s_onceToken, &__block_literal_global_228);
  }
  v2 = (void *)commonTypeDict_IntegerFormat_withUnit_s__typedict_integer;
  return v2;
}

void __60__PLEntryDefinition_commonTypeDict_IntegerFormat_withUnit_s__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Type";
  v2[1] = @"Unit";
  v3[0] = &unk_1F1580690;
  v3[1] = @"s";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)commonTypeDict_IntegerFormat_withUnit_s__typedict_integer;
  commonTypeDict_IntegerFormat_withUnit_s__typedict_integer = v0;
}

- (id)commonTypeDict_IntegerFormat_withUnit_ms
{
  if (commonTypeDict_IntegerFormat_withUnit_ms_onceToken != -1) {
    dispatch_once(&commonTypeDict_IntegerFormat_withUnit_ms_onceToken, &__block_literal_global_233);
  }
  v2 = (void *)commonTypeDict_IntegerFormat_withUnit_ms__typedict_integer;
  return v2;
}

void __61__PLEntryDefinition_commonTypeDict_IntegerFormat_withUnit_ms__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Type";
  v2[1] = @"Unit";
  v3[0] = &unk_1F1580690;
  v3[1] = @"ms";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)commonTypeDict_IntegerFormat_withUnit_ms__typedict_integer;
  commonTypeDict_IntegerFormat_withUnit_ms__typedict_integer = v0;
}

- (id)commonTypeDict_IntegerFormat_withUnit_us
{
  if (commonTypeDict_IntegerFormat_withUnit_us_onceToken != -1) {
    dispatch_once(&commonTypeDict_IntegerFormat_withUnit_us_onceToken, &__block_literal_global_238);
  }
  v2 = (void *)commonTypeDict_IntegerFormat_withUnit_us__typedict_integer;
  return v2;
}

void __61__PLEntryDefinition_commonTypeDict_IntegerFormat_withUnit_us__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Type";
  v2[1] = @"Unit";
  v3[0] = &unk_1F1580690;
  v3[1] = @"us";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)commonTypeDict_IntegerFormat_withUnit_us__typedict_integer;
  commonTypeDict_IntegerFormat_withUnit_us__typedict_integer = v0;
}

- (id)commonTypeDict_IntegerFormat_withUnit_mV
{
  if (commonTypeDict_IntegerFormat_withUnit_mV_onceToken != -1) {
    dispatch_once(&commonTypeDict_IntegerFormat_withUnit_mV_onceToken, &__block_literal_global_243);
  }
  v2 = (void *)commonTypeDict_IntegerFormat_withUnit_mV__typedict_integer;
  return v2;
}

void __61__PLEntryDefinition_commonTypeDict_IntegerFormat_withUnit_mV__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Type";
  v2[1] = @"Unit";
  v3[0] = &unk_1F1580690;
  v3[1] = @"mV";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)commonTypeDict_IntegerFormat_withUnit_mV__typedict_integer;
  commonTypeDict_IntegerFormat_withUnit_mV__typedict_integer = v0;
}

- (id)commonTypeDict_IntegerFormat_withUnit_mA
{
  if (commonTypeDict_IntegerFormat_withUnit_mA_onceToken != -1) {
    dispatch_once(&commonTypeDict_IntegerFormat_withUnit_mA_onceToken, &__block_literal_global_248);
  }
  v2 = (void *)commonTypeDict_IntegerFormat_withUnit_mA__typedict_integer;
  return v2;
}

void __61__PLEntryDefinition_commonTypeDict_IntegerFormat_withUnit_mA__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Type";
  v2[1] = @"Unit";
  v3[0] = &unk_1F1580690;
  v3[1] = @"mA";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)commonTypeDict_IntegerFormat_withUnit_mA__typedict_integer;
  commonTypeDict_IntegerFormat_withUnit_mA__typedict_integer = v0;
}

- (id)commonTypeDict_IntegerFormat_withUnit_mAh
{
  if (commonTypeDict_IntegerFormat_withUnit_mAh_onceToken != -1) {
    dispatch_once(&commonTypeDict_IntegerFormat_withUnit_mAh_onceToken, &__block_literal_global_253);
  }
  v2 = (void *)commonTypeDict_IntegerFormat_withUnit_mAh__typedict_integer;
  return v2;
}

void __62__PLEntryDefinition_commonTypeDict_IntegerFormat_withUnit_mAh__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Type";
  v2[1] = @"Unit";
  v3[0] = &unk_1F1580690;
  v3[1] = @"mAh";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)commonTypeDict_IntegerFormat_withUnit_mAh__typedict_integer;
  commonTypeDict_IntegerFormat_withUnit_mAh__typedict_integer = v0;
}

- (id)commonTypeDict_IntegerFormat_withUnit_mJ
{
  if (commonTypeDict_IntegerFormat_withUnit_mJ_onceToken != -1) {
    dispatch_once(&commonTypeDict_IntegerFormat_withUnit_mJ_onceToken, &__block_literal_global_258);
  }
  v2 = (void *)commonTypeDict_IntegerFormat_withUnit_mJ__typedict_integer;
  return v2;
}

void __61__PLEntryDefinition_commonTypeDict_IntegerFormat_withUnit_mJ__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Type";
  v2[1] = @"Unit";
  v3[0] = &unk_1F1580690;
  v3[1] = @"mJ";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)commonTypeDict_IntegerFormat_withUnit_mJ__typedict_integer;
  commonTypeDict_IntegerFormat_withUnit_mJ__typedict_integer = v0;
}

- (id)commonTypeDict_IntegerFormat_withUnit_W
{
  if (commonTypeDict_IntegerFormat_withUnit_W_onceToken != -1) {
    dispatch_once(&commonTypeDict_IntegerFormat_withUnit_W_onceToken, &__block_literal_global_263);
  }
  v2 = (void *)commonTypeDict_IntegerFormat_withUnit_W__typedict_integer;
  return v2;
}

void __60__PLEntryDefinition_commonTypeDict_IntegerFormat_withUnit_W__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Type";
  v2[1] = @"Unit";
  v3[0] = &unk_1F1580690;
  v3[1] = @"W";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)commonTypeDict_IntegerFormat_withUnit_W__typedict_integer;
  commonTypeDict_IntegerFormat_withUnit_W__typedict_integer = v0;
}

- (id)commonTypeDict_IntegerFormat_aggregateFunction_sum
{
  if (commonTypeDict_IntegerFormat_aggregateFunction_sum_onceToken != -1) {
    dispatch_once(&commonTypeDict_IntegerFormat_aggregateFunction_sum_onceToken, &__block_literal_global_268);
  }
  v2 = (void *)commonTypeDict_IntegerFormat_aggregateFunction_sum__typedict_integer;
  return v2;
}

void __71__PLEntryDefinition_commonTypeDict_IntegerFormat_aggregateFunction_sum__block_invoke()
{
  void v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Type";
  v2[1] = @"IsAggregateValue";
  v3[0] = &unk_1F1580690;
  v3[1] = MEMORY[0x1E4F1CC38];
  void v2[2] = @"AggregateFunction";
  void v3[2] = &unk_1F15806A8;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)commonTypeDict_IntegerFormat_aggregateFunction_sum__typedict_integer;
  commonTypeDict_IntegerFormat_aggregateFunction_sum__typedict_integer = v0;
}

- (id)commonTypeDict_RealFormat
{
  if (commonTypeDict_RealFormat_onceToken != -1) {
    dispatch_once(&commonTypeDict_RealFormat_onceToken, &__block_literal_global_272);
  }
  v2 = (void *)commonTypeDict_RealFormat__typedict_real;
  return v2;
}

void __46__PLEntryDefinition_commonTypeDict_RealFormat__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v2 = @"Type";
  v3[0] = &unk_1F15806C0;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)commonTypeDict_RealFormat__typedict_real;
  commonTypeDict_RealFormat__typedict_real = v0;
}

- (id)commonTypeDict_RealFormat_withUnit_s
{
  if (commonTypeDict_RealFormat_withUnit_s_onceToken != -1) {
    dispatch_once(&commonTypeDict_RealFormat_withUnit_s_onceToken, &__block_literal_global_276);
  }
  v2 = (void *)commonTypeDict_RealFormat_withUnit_s__typedict_real;
  return v2;
}

void __57__PLEntryDefinition_commonTypeDict_RealFormat_withUnit_s__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Type";
  v2[1] = @"Unit";
  v3[0] = &unk_1F15806C0;
  v3[1] = @"s";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)commonTypeDict_RealFormat_withUnit_s__typedict_real;
  commonTypeDict_RealFormat_withUnit_s__typedict_real = v0;
}

- (id)commonTypeDict_RealFormat_withUnit_mJ
{
  if (commonTypeDict_RealFormat_withUnit_mJ_onceToken != -1) {
    dispatch_once(&commonTypeDict_RealFormat_withUnit_mJ_onceToken, &__block_literal_global_278);
  }
  v2 = (void *)commonTypeDict_RealFormat_withUnit_mJ__typedict_real;
  return v2;
}

void __58__PLEntryDefinition_commonTypeDict_RealFormat_withUnit_mJ__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Type";
  v2[1] = @"Unit";
  v3[0] = &unk_1F15806C0;
  v3[1] = @"mJ";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)commonTypeDict_RealFormat_withUnit_mJ__typedict_real;
  commonTypeDict_RealFormat_withUnit_mJ__typedict_real = v0;
}

- (id)commonTypeDict_RealFormat_withUnit_mW
{
  if (commonTypeDict_RealFormat_withUnit_mW_onceToken != -1) {
    dispatch_once(&commonTypeDict_RealFormat_withUnit_mW_onceToken, &__block_literal_global_280);
  }
  v2 = (void *)commonTypeDict_RealFormat_withUnit_mW__typedict_real;
  return v2;
}

void __58__PLEntryDefinition_commonTypeDict_RealFormat_withUnit_mW__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Type";
  v2[1] = @"Unit";
  v3[0] = &unk_1F15806C0;
  v3[1] = @"mW";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)commonTypeDict_RealFormat_withUnit_mW__typedict_real;
  commonTypeDict_RealFormat_withUnit_mW__typedict_real = v0;
}

- (id)commonTypeDict_RealFormat_withUnit_W
{
  if (commonTypeDict_RealFormat_withUnit_W_onceToken != -1) {
    dispatch_once(&commonTypeDict_RealFormat_withUnit_W_onceToken, &__block_literal_global_285);
  }
  v2 = (void *)commonTypeDict_RealFormat_withUnit_W__typedict_real;
  return v2;
}

void __57__PLEntryDefinition_commonTypeDict_RealFormat_withUnit_W__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Type";
  v2[1] = @"Unit";
  v3[0] = &unk_1F15806C0;
  v3[1] = @"W";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)commonTypeDict_RealFormat_withUnit_W__typedict_real;
  commonTypeDict_RealFormat_withUnit_W__typedict_real = v0;
}

- (id)commonTypeDict_RealFormat_withUnit_mWhr
{
  if (commonTypeDict_RealFormat_withUnit_mWhr_onceToken != -1) {
    dispatch_once(&commonTypeDict_RealFormat_withUnit_mWhr_onceToken, &__block_literal_global_287);
  }
  v2 = (void *)commonTypeDict_RealFormat_withUnit_mWhr__typedict_real;
  return v2;
}

void __60__PLEntryDefinition_commonTypeDict_RealFormat_withUnit_mWhr__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Type";
  v2[1] = @"Unit";
  v3[0] = &unk_1F15806C0;
  v3[1] = @"mWhr";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)commonTypeDict_RealFormat_withUnit_mWhr__typedict_real;
  commonTypeDict_RealFormat_withUnit_mWhr__typedict_real = v0;
}

- (id)commonTypeDict_RealFormat_aggregateFunction_sum
{
  if (commonTypeDict_RealFormat_aggregateFunction_sum_onceToken != -1) {
    dispatch_once(&commonTypeDict_RealFormat_aggregateFunction_sum_onceToken, &__block_literal_global_292);
  }
  v2 = (void *)commonTypeDict_RealFormat_aggregateFunction_sum__typedict_integer;
  return v2;
}

void __68__PLEntryDefinition_commonTypeDict_RealFormat_aggregateFunction_sum__block_invoke()
{
  void v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Type";
  v2[1] = @"IsAggregateValue";
  v3[0] = &unk_1F15806C0;
  v3[1] = MEMORY[0x1E4F1CC38];
  void v2[2] = @"AggregateFunction";
  void v3[2] = &unk_1F15806A8;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)commonTypeDict_RealFormat_aggregateFunction_sum__typedict_integer;
  commonTypeDict_RealFormat_aggregateFunction_sum__typedict_integer = v0;
}

- (id)commonTypeDict_StringFormat
{
  if (commonTypeDict_StringFormat_onceToken != -1) {
    dispatch_once(&commonTypeDict_StringFormat_onceToken, &__block_literal_global_294);
  }
  v2 = (void *)commonTypeDict_StringFormat__typedict_string;
  return v2;
}

void __48__PLEntryDefinition_commonTypeDict_StringFormat__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v2 = @"Type";
  v3[0] = &unk_1F15806D8;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)commonTypeDict_StringFormat__typedict_string;
  commonTypeDict_StringFormat__typedict_string = v0;
}

- (id)commonTypeDict_StringFormat_withBundleID
{
  if (commonTypeDict_StringFormat_withBundleID_onceToken != -1) {
    dispatch_once(&commonTypeDict_StringFormat_withBundleID_onceToken, &__block_literal_global_298);
  }
  v2 = (void *)commonTypeDict_StringFormat_withBundleID__typedict_string;
  return v2;
}

void __61__PLEntryDefinition_commonTypeDict_StringFormat_withBundleID__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Type";
  v2[1] = @"BundleID";
  v3[0] = &unk_1F15806D8;
  v3[1] = MEMORY[0x1E4F1CC38];
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)commonTypeDict_StringFormat_withBundleID__typedict_string;
  commonTypeDict_StringFormat_withBundleID__typedict_string = v0;
}

- (id)commonTypeDict_StringFormat_withAppName
{
  if (commonTypeDict_StringFormat_withAppName_onceToken != -1) {
    dispatch_once(&commonTypeDict_StringFormat_withAppName_onceToken, &__block_literal_global_300);
  }
  v2 = (void *)commonTypeDict_StringFormat_withAppName__typedict_string;
  return v2;
}

void __60__PLEntryDefinition_commonTypeDict_StringFormat_withAppName__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Type";
  v2[1] = @"AppName";
  v3[0] = &unk_1F15806D8;
  v3[1] = MEMORY[0x1E4F1CC38];
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)commonTypeDict_StringFormat_withAppName__typedict_string;
  commonTypeDict_StringFormat_withAppName__typedict_string = v0;
}

- (id)commonTypeDict_StringFormat_withProcessName
{
  if (commonTypeDict_StringFormat_withProcessName_onceToken != -1) {
    dispatch_once(&commonTypeDict_StringFormat_withProcessName_onceToken, &__block_literal_global_302);
  }
  v2 = (void *)commonTypeDict_StringFormat_withProcessName__typedict_string;
  return v2;
}

void __64__PLEntryDefinition_commonTypeDict_StringFormat_withProcessName__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Type";
  v2[1] = @"ProcessName";
  v3[0] = &unk_1F15806D8;
  v3[1] = MEMORY[0x1E4F1CC38];
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)commonTypeDict_StringFormat_withProcessName__typedict_string;
  commonTypeDict_StringFormat_withProcessName__typedict_string = v0;
}

- (id)commonTypeDict_DateFormat
{
  if (commonTypeDict_DateFormat_onceToken != -1) {
    dispatch_once(&commonTypeDict_DateFormat_onceToken, &__block_literal_global_304);
  }
  v2 = (void *)commonTypeDict_DateFormat__typedict_date;
  return v2;
}

void __46__PLEntryDefinition_commonTypeDict_DateFormat__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v2 = @"Type";
  v3[0] = &unk_1F15806F0;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)commonTypeDict_DateFormat__typedict_date;
  commonTypeDict_DateFormat__typedict_date = v0;
}

- (id)commonTypeDict_DateFormat_isCFAbsoluteTime
{
  if (commonTypeDict_DateFormat_isCFAbsoluteTime_onceToken != -1) {
    dispatch_once(&commonTypeDict_DateFormat_isCFAbsoluteTime_onceToken, &__block_literal_global_308);
  }
  v2 = (void *)commonTypeDict_DateFormat_isCFAbsoluteTime__typedict_date;
  return v2;
}

void __63__PLEntryDefinition_commonTypeDict_DateFormat_isCFAbsoluteTime__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Type";
  v2[1] = @"isCFAbsoluteTime";
  v3[0] = &unk_1F15806F0;
  v3[1] = MEMORY[0x1E4F1CC38];
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)commonTypeDict_DateFormat_isCFAbsoluteTime__typedict_date;
  commonTypeDict_DateFormat_isCFAbsoluteTime__typedict_date = v0;
}

- (id)commonTypeDict_RawDataFormat
{
  if (commonTypeDict_RawDataFormat_onceToken != -1) {
    dispatch_once(&commonTypeDict_RawDataFormat_onceToken, &__block_literal_global_313);
  }
  v2 = (void *)commonTypeDict_RawDataFormat__typedict_rawdata;
  return v2;
}

void __49__PLEntryDefinition_commonTypeDict_RawDataFormat__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v2 = @"Type";
  v3[0] = &unk_1F1580708;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)commonTypeDict_RawDataFormat__typedict_rawdata;
  commonTypeDict_RawDataFormat__typedict_rawdata = v0;
}

+ (void)manualSortOrderForEntryDefinition:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "[Error] Manual sort order keys not in table schema: %@", (uint8_t *)&v2, 0xCu);
}

@end