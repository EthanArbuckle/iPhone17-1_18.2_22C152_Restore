@interface PPSEntryKey
+ (BOOL)PPSEnabled:(id)a3;
+ (BOOL)filterEntryLoggingForEntryKey:(id)a3;
+ (BOOL)hasArrayKeys:(id)a3;
+ (BOOL)hasDMAKeys:(id)a3;
+ (BOOL)hasDynamicKeys:(id)a3;
+ (id)allArrayKeysForEntryKey:(id)a3;
+ (id)allBaseKeysForEntryKey:(id)a3;
+ (id)allDMAKeysForEntryKey:(id)a3;
+ (id)allDynamicKeysForEntryKey:(id)a3;
+ (id)allEntryKeys;
+ (id)allEntryKeysForStorage:(int)a3;
+ (id)allKeysForEntryKey:(id)a3;
+ (id)allMetricsForEntryKey:(id)a3;
+ (id)anyMetricsForEntryKey:(id)a3;
+ (id)arrayMetricsForEntryKey:(id)a3;
+ (id)baseMetricsForEntryKey:(id)a3;
+ (id)categoryForEntryKey:(id)a3;
+ (id)dynamicMetricsForEntryKey:(id)a3;
+ (id)dynamicTableNameForEntryKey:(id)a3;
+ (id)entryKeyForMetric:(id)a3;
+ (id)entryKeyFromSelector:(id)a3;
+ (id)entrySelectorForMetric:(id)a3;
+ (id)metricsForEntryKey:(id)a3;
+ (id)subsystemForEntryKey:(id)a3;
+ (int)directionalityForEntryKey:(id)a3;
+ (int)storageForEntryKey:(id)a3;
+ (int64_t)timeToLiveForEntryKey:(id)a3;
+ (void)addAuxiliaryType:(id)a3 withEntryKey:(id)a4;
+ (void)resetMetricsForEntryKey:(id)a3;
+ (void)setupEntryKeyForMetric:(id)a3;
@end

@implementation PPSEntryKey

uint64_t __38__PPSEntryKey_allBaseKeysForEntryKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (BOOL)PPSEnabled:(id)a3
{
  id v3 = a3;
  objc_sync_enter(@"++entryKeyObjectsSync++");
  v4 = [(id)_metricsByEntryKey objectForKeyedSubscript:v3];

  objc_sync_exit(@"++entryKeyObjectsSync++");
  return v4 != 0;
}

+ (id)subsystemForEntryKey:(id)a3
{
  id v3 = +[PPSEntryKey anyMetricsForEntryKey:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 allValues];
    v6 = [v5 objectAtIndexedSubscript:0];

    v7 = [v6 subsystem];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)categoryForEntryKey:(id)a3
{
  id v3 = +[PPSEntryKey anyMetricsForEntryKey:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 allValues];
    v6 = [v5 objectAtIndexedSubscript:0];

    v7 = [v6 category];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)anyMetricsForEntryKey:(id)a3
{
  id v3 = a3;
  objc_sync_enter(@"++entryKeyObjectsSync++");
  v4 = [(id)_metricsByEntryKey objectForKeyedSubscript:v3];

  if (v4)
  {
    v5 = [(id)_metricsByEntryKey objectForKeyedSubscript:v3];
    v4 = (void *)[v5 mutableCopy];

    v6 = [v4 objectForKey:@"__PPSDynamic__"];

    if (v6)
    {
      v7 = @"__PPSDynamic__";
    }
    else
    {
      v8 = [v4 objectForKey:@"__PPSArray__"];

      if (!v8) {
        goto LABEL_7;
      }
      v7 = @"__PPSArray__";
    }
    uint64_t v9 = [v4 objectForKeyedSubscript:v7];

    v4 = (void *)v9;
  }
LABEL_7:
  objc_sync_exit(@"++entryKeyObjectsSync++");

  return v4;
}

void __38__PPSEntryKey_entrySelectorForMetric___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) valueForKey:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

+ (BOOL)hasDynamicKeys:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_sync_enter(@"++entryKeyObjectsSync++");
    v4 = [(id)_metricsByEntryKey objectForKeyedSubscript:v3];
    v5 = [v4 objectForKeyedSubscript:@"__PPSDynamic__"];
    BOOL v6 = v5 != 0;

    objc_sync_exit(@"++entryKeyObjectsSync++");
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)hasArrayKeys:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_sync_enter(@"++entryKeyObjectsSync++");
    v4 = [(id)_metricsByEntryKey objectForKeyedSubscript:v3];
    v5 = [v4 objectForKeyedSubscript:@"__PPSArray__"];
    BOOL v6 = v5 != 0;

    objc_sync_exit(@"++entryKeyObjectsSync++");
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)hasDMAKeys:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[PPSEntryKey allMetricsForEntryKey:v3];
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __26__PPSEntryKey_hasDMAKeys___block_invoke;
    v7[3] = &unk_1E6253C40;
    v7[4] = &v8;
    [v4 enumerateKeysAndObjectsUsingBlock:v7];
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)filterEntryLoggingForEntryKey:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = +[PPSEntryKey baseMetricsForEntryKey:a3];
  v4 = v3;
  if (v3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    BOOL v5 = objc_msgSend(v3, "allValues", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v10 + 1) + 8 * i) filterEntryLogging])
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (id)allMetricsForEntryKey:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_sync_enter(@"++entryKeyObjectsSync++");
  BOOL v5 = +[PPSEntryKey baseMetricsForEntryKey:v3];
  [v4 addEntriesFromDictionary:v5];

  uint64_t v6 = +[PPSEntryKey dynamicMetricsForEntryKey:v3];
  [v4 addEntriesFromDictionary:v6];

  uint64_t v7 = +[PPSEntryKey arrayMetricsForEntryKey:v3];
  [v4 addEntriesFromDictionary:v7];

  objc_sync_exit(@"++entryKeyObjectsSync++");
  return v4;
}

+ (id)dynamicMetricsForEntryKey:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_sync_enter(@"++entryKeyObjectsSync++");
    v4 = [(id)_metricsByEntryKey objectForKeyedSubscript:v3];
    BOOL v5 = [v4 objectForKeyedSubscript:@"__PPSDynamic__"];

    objc_sync_exit(@"++entryKeyObjectsSync++");
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)arrayMetricsForEntryKey:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_sync_enter(@"++entryKeyObjectsSync++");
    v4 = [(id)_metricsByEntryKey objectForKeyedSubscript:v3];
    BOOL v5 = [v4 objectForKeyedSubscript:@"__PPSArray__"];

    objc_sync_exit(@"++entryKeyObjectsSync++");
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __26__PPSEntryKey_hasDMAKeys___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = a3;
  uint64_t v8 = v7;
  if (v7 && [v7 DMACompliant])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (id)allBaseKeysForEntryKey:(id)a3
{
  id v3 = [a1 baseMetricsForEntryKey:a3];
  v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 allKeys];
    uint64_t v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_31];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)baseMetricsForEntryKey:(id)a3
{
  id v3 = a3;
  objc_sync_enter(@"++entryKeyObjectsSync++");
  v4 = [(id)_metricsByEntryKey objectForKeyedSubscript:v3];

  if (v4)
  {
    BOOL v5 = [(id)_metricsByEntryKey objectForKeyedSubscript:v3];
    v4 = (void *)[v5 mutableCopy];

    [v4 removeObjectForKey:@"__PPSDynamic__"];
    [v4 removeObjectForKey:@"__PPSArray__"];
  }
  objc_sync_exit(@"++entryKeyObjectsSync++");

  return v4;
}

+ (int)storageForEntryKey:(id)a3
{
  id v3 = +[PPSEntryKey anyMetricsForEntryKey:a3];
  v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 allValues];
    uint64_t v6 = [v5 objectAtIndexedSubscript:0];

    int v7 = [v6 storage];
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

+ (id)entryKeyForMetric:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[PPSEntryKey entrySelectorForMetric:v3];
    objc_sync_enter(@"++entryKeyObjectsSync++");
    BOOL v5 = [(id)_entryKeyByMetadata objectForKeyedSubscript:v4];
    objc_sync_exit(@"++entryKeyObjectsSync++");
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)entrySelectorForMetric:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__PPSEntryKey_entrySelectorForMetric___block_invoke;
  v10[3] = &unk_1E6253C68;
  id v11 = v3;
  id v5 = v4;
  id v12 = v5;
  id v6 = v3;
  [&unk_1F1585A78 enumerateObjectsUsingBlock:v10];
  int v7 = v12;
  id v8 = v5;

  return v8;
}

+ (id)allArrayKeysForEntryKey:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_sync_enter(@"++entryKeyObjectsSync++");
    v4 = [(id)_metricsByEntryKey objectForKeyedSubscript:v3];
    id v5 = [v4 objectForKeyedSubscript:@"__PPSArray__"];
    id v6 = [v5 allKeys];

    objc_sync_exit(@"++entryKeyObjectsSync++");
    if (v6)
    {
      int v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_40];
    }
    else
    {
      int v7 = 0;
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

+ (id)allDynamicKeysForEntryKey:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_sync_enter(@"++entryKeyObjectsSync++");
    v4 = [(id)_metricsByEntryKey objectForKeyedSubscript:v3];
    id v5 = [v4 objectForKeyedSubscript:@"__PPSDynamic__"];
    id v6 = [v5 allKeys];

    objc_sync_exit(@"++entryKeyObjectsSync++");
    if (v6)
    {
      int v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_33];
    }
    else
    {
      int v7 = 0;
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

+ (void)setupEntryKeyForMetric:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (setupEntryKeyForMetric__onceToken == -1)
  {
    if (!v4) {
      goto LABEL_12;
    }
  }
  else
  {
    id v15 = v4;
    dispatch_once(&setupEntryKeyForMetric__onceToken, &__block_literal_global_6);
    id v5 = v15;
    if (!v15) {
      goto LABEL_12;
    }
  }
  v14 = v5;
  if (+[PPSCoreUtilities shouldSetupMetric:](PPSCoreUtilities, "shouldSetupMetric:"))
  {
    id v6 = +[PPSEntryKey entrySelectorForMetric:v14];
    objc_sync_enter(@"++entryKeyObjectsSync++");
    int v7 = [(id)_entryKeyByMetadata objectForKeyedSubscript:v6];

    if (!v7)
    {
      id v8 = +[PPSEntryKey entryKeyFromSelector:v6];
      [(id)_entryKeyByMetadata setObject:v8 forKeyedSubscript:v6];
    }
    id v9 = [(id)_entryKeyByMetadata objectForKeyedSubscript:v6];
    long long v10 = [(id)_metricsByEntryKey objectForKeyedSubscript:v9];

    if (!v10)
    {
      id v11 = objc_opt_new();
      [(id)_metricsByEntryKey setObject:v11 forKeyedSubscript:v9];
    }
    if ([v14 auxiliaryType] == 1)
    {
      id v12 = [(id)_metricsByEntryKey objectForKeyedSubscript:v9];
      long long v13 = [v14 name];
      [v12 setObject:v14 forKeyedSubscript:v13];
    }
    else
    {
      [a1 addAuxiliaryType:v14 withEntryKey:v9];
    }

    objc_sync_exit(@"++entryKeyObjectsSync++");
  }
LABEL_12:
  MEMORY[0x1F4181820]();
}

uint64_t __38__PPSEntryKey_setupEntryKeyForMetric___block_invoke()
{
  objc_sync_enter(@"++entryKeyObjectsSync++");
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_entryKeyByMetadata;
  _entryKeyByMetadata = v0;

  uint64_t v2 = objc_opt_new();
  id v3 = (void *)_metricsByEntryKey;
  _metricsByEntryKey = v2;

  return objc_sync_exit(@"++entryKeyObjectsSync++");
}

+ (void)addAuxiliaryType:(id)a3 withEntryKey:(id)a4
{
  id v20 = a3;
  id v5 = a4;
  int v6 = [v20 auxiliaryType];
  if (v6 == 3)
  {
    v14 = [(id)_metricsByEntryKey objectForKeyedSubscript:v5];
    id v15 = [v14 objectForKeyedSubscript:@"__PPSArray__"];

    if (!v15)
    {
      v16 = objc_opt_new();
      v17 = [(id)_metricsByEntryKey objectForKeyedSubscript:v5];
      [v17 setObject:v16 forKeyedSubscript:@"__PPSArray__"];
    }
    id v11 = [(id)_metricsByEntryKey objectForKeyedSubscript:v5];
    id v12 = v11;
    long long v13 = @"__PPSArray__";
  }
  else
  {
    if (v6 != 2) {
      goto LABEL_10;
    }
    int v7 = [(id)_metricsByEntryKey objectForKeyedSubscript:v5];
    id v8 = [v7 objectForKeyedSubscript:@"__PPSDynamic__"];

    if (!v8)
    {
      id v9 = objc_opt_new();
      long long v10 = [(id)_metricsByEntryKey objectForKeyedSubscript:v5];
      [v10 setObject:v9 forKeyedSubscript:@"__PPSDynamic__"];
    }
    id v11 = [(id)_metricsByEntryKey objectForKeyedSubscript:v5];
    id v12 = v11;
    long long v13 = @"__PPSDynamic__";
  }
  v18 = [v11 objectForKeyedSubscript:v13];
  v19 = [v20 name];
  [v18 setObject:v20 forKeyedSubscript:v19];

LABEL_10:
}

+ (id)allEntryKeys
{
  objc_sync_enter(@"++entryKeyObjectsSync++");
  uint64_t v2 = [(id)_entryKeyByMetadata allValues];
  objc_sync_exit(@"++entryKeyObjectsSync++");
  return v2;
}

+ (id)allEntryKeysForStorage:(int)a3
{
  id v4 = objc_opt_new();
  uint64_t v5 = [&unk_1F1585A78 indexOfObject:@"storage"];
  objc_sync_enter(@"++entryKeyObjectsSync++");
  int v6 = (void *)_entryKeyByMetadata;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__PPSEntryKey_allEntryKeysForStorage___block_invoke;
  v9[3] = &unk_1E6253BF8;
  uint64_t v11 = v5;
  int v12 = a3;
  id v7 = v4;
  id v10 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];

  objc_sync_exit(@"++entryKeyObjectsSync++");
  return v7;
}

void __38__PPSEntryKey_allEntryKeysForStorage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [a2 objectAtIndexedSubscript:*(void *)(a1 + 40)];
  int v6 = [v5 intValue];
  int v7 = *(_DWORD *)(a1 + 48);

  if (v6 == v7) {
    [*(id *)(a1 + 32) addObject:v8];
  }
}

+ (void)resetMetricsForEntryKey:(id)a3
{
  id v3 = a3;
  objc_sync_enter(@"++entryKeyObjectsSync++");
  [(id)_metricsByEntryKey setObject:0 forKeyedSubscript:v3];
  objc_sync_exit(@"++entryKeyObjectsSync++");
}

+ (id)metricsForEntryKey:(id)a3
{
  id v3 = a3;
  objc_sync_enter(@"++entryKeyObjectsSync++");
  id v4 = [(id)_metricsByEntryKey objectForKeyedSubscript:v3];
  objc_sync_exit(@"++entryKeyObjectsSync++");

  return v4;
}

+ (id)allKeysForEntryKey:(id)a3
{
  id v3 = [a1 allMetricsForEntryKey:a3];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 allKeys];
    int v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_29_0];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

uint64_t __34__PPSEntryKey_allKeysForEntryKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __41__PPSEntryKey_allDynamicKeysForEntryKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)dynamicTableNameForEntryKey:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@_Dynamic", a3];
}

uint64_t __39__PPSEntryKey_allArrayKeysForEntryKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)allDMAKeysForEntryKey:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[PPSEntryKey allMetricsForEntryKey:v3];
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x3032000000;
    uint64_t v11 = __Block_byref_object_copy__2;
    int v12 = __Block_byref_object_dispose__2;
    id v13 = [MEMORY[0x1E4F1CA48] array];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__PPSEntryKey_allDMAKeysForEntryKey___block_invoke;
    v7[3] = &unk_1E6253C40;
    v7[4] = &v8;
    [v4 enumerateKeysAndObjectsUsingBlock:v7];
    uint64_t v5 = [(id)v9[5] sortedArrayUsingComparator:&__block_literal_global_42];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __37__PPSEntryKey_allDMAKeysForEntryKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  int v6 = v5;
  if (v5 && [v5 DMACompliant])
  {
    int v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v8 = [v6 name];
    [v7 addObject:v8];
  }
}

uint64_t __37__PPSEntryKey_allDMAKeysForEntryKey___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (int64_t)timeToLiveForEntryKey:(id)a3
{
  id v3 = +[PPSEntryKey anyMetricsForEntryKey:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 allValues];
    int v6 = [v5 objectAtIndexedSubscript:0];

    int64_t v7 = [v6 timeToLive];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

+ (int)directionalityForEntryKey:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = +[PPSEntryKey anyMetricsForEntryKey:a3];
  id v4 = v3;
  if (v3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = objc_msgSend(v3, "allValues", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v13 + 1) + 8 * i) directionality] == 3)
          {
            int v11 = 3;
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    uint64_t v10 = [v4 allValues];
    id v5 = [v10 objectAtIndexedSubscript:0];

    int v11 = [v5 directionality];
LABEL_12:
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

+ (id)entryKeyFromSelector:(id)a3
{
  return (id)[a3 componentsJoinedByString:@"_"];
}

@end